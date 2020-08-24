const { Autohook } = require('twitter-autohook');
const util = require('util');
const request = require('request');
const post = util.promisify(request.post);


// config database connection
const Pool = require('pg').Pool
const pool = new Pool({
  user: '',
  host: '',
  database: '',
  password: '',
  port: 5432,
  ssl: true
});
process.env["NODE_TLS_REJECT_UNAUTHORIZED"] = 0;

const oAuthConfig = {
  token: process.env.TWITTER_ACCESS_TOKEN,
  token_secret: process.env.TWITTER_ACCESS_TOKEN_SECRET,
  consumer_key: process.env.TWITTER_CONSUMER_KEY,
  consumer_secret: process.env.TWITTER_CONSUMER_SECRET,
};


async function tweet(message) {
  const requestConfig = {
    url: 'https://api.twitter.com/1.1/statuses/update.json',
    form: {
      status: message
    },
    oauth: oAuthConfig,
  };

  await post(requestConfig).then(({body, statusCode}) => {
    console.log(body);
  });
}

async function tweetSoal(id, message) {
  const requestConfig = {
    url: 'https://api.twitter.com/1.1/statuses/update.json',
    form: {
      status: message
    },
    oauth: oAuthConfig,
  };


  await post(requestConfig).then(({body, statusCode}) => {
    //console.log(body);

    if (statusCode == 200) {
      var json = JSON.parse(body);
      console.log(json.id);
      pool.query('UPDATE quiz SET post_id = $1 WHERE id = $2', [json.id, id], (error, results) => {
        if (error) {
          throw error
        }
        console.log(results);
      })
    } else {
        // buat soal lainya
        console.log("[TWEET] Tweet gagal, coba buat soal lagi");
        buatSoal();
    }
  });
}

async function replyTo(message, post_id) {
  const requestConfig = {
    url: 'https://api.twitter.com/1.1/statuses/update.json',
    form: {
      in_reply_to_status_id: post_id,
      status: message
    },
    oauth: oAuthConfig,
  };

  await post(requestConfig).then(({body, statusCode}) => console.log("REPLY TO : " +body));

}

async function markAsRead(messageId, senderId, auth) {
  const requestConfig = {
    url: 'https://api.twitter.com/1.1/direct_messages/mark_read.json',
    form: {
      last_read_event_id: messageId,
      recipient_id: senderId,
    },
    oauth: auth,
  };

  await post(requestConfig);
}

async function indicateTyping(senderId, auth) {
  const requestConfig = {
    url: 'https://api.twitter.com/1.1/direct_messages/indicate_typing.json',
    form: {
      recipient_id: senderId,
    },
    oauth: auth,
  };

  await post(requestConfig);
}


async function sayHi(event) {
  if (!event.direct_message_events) {
    return;
  }

  const message = event.direct_message_events.shift();

  if (typeof message === 'undefined' || typeof message.message_create === 'undefined') {
    return;
  }

  if (message.message_create.sender_id === message.message_create.target.recipient_id) {
    return;
  }
  
  if (message.message_create.message_data.text == "topglobal") topGlobal();

}

function sleep(ms){
  return new Promise(resolve=>{
    setTimeout(resolve,ms)
  })
}

// function buatSoal() {
//   pool.query('SELECT * FROM quiz LIMIT 1', (error, results) => {
//     if (error) {
//       throw error
//     }
//     if (results.rows.length > 0) {
//       quiz_id = results.rows[0].id;
//       tweet(results.rows[0].quiz);
//     }
//   })
// }

async function cekJawaban(event) {
  if (!event.tweet_create_events) return;
  var tce = event.tweet_create_events;
  if (tce == null || tce.length < 1) return;
  if (tce[0] == null) return;

  // abaikan twit dari diri sendiri
  if (tce[0].user.id == 1481855070) return;

   // dump user to db
  pool.query("INSERT INTO users (id, created_date, name, username, url, description, location, image_url) VALUES($1,$2,$3,$4,$5,$6,$7,$8) ON CONFLICT (id) DO UPDATE SET created_date=$2,name=$3,username=$4,url=$5,description=$6,location=$7,image_url=$8;",
  [tce[0].user.id, new Date(), tce[0].user.name, tce[0].user.screen_name,  tce[0].user.url,  tce[0].user.description,  tce[0].user.location,  tce[0].user.profile_image_url],
  (error, results) => {
    if (error) {
      throw error
    }
    console.log("[USER] " + tce[0].user.name + " saved");
  })


  // cek point user
  if (tce[0].text.toUpperCase().indexOf("CEKPOINT") > -1) {
    pool.query('SELECT point FROM users where id = $1', [tce[0].user.id], (err, hasil) => {
      if (err) throw err;
      if (hasil.rows.length > 0) {
        replyTo("Halo @"+tce[0].user.screen_name+", point anda sekarang adalah " + parseFloat(hasil.rows[0].point), tce[0].id_str);
      } else {
        replyTo("Halo @"+tce[0].user.screen_name+", point anda sekarang adalah 0" , tce[0].id_str);
      }
    });
    return;
  }

  if (tce[0].display_text_range == null) return;

  var jawaban = tce[0].text.substring(tce[0].display_text_range[0], tce[0].display_text_range[1]).toUpperCase();
  
  // get kunci jawaban
  pool.query('SELECT answer, point FROM quiz WHERE post_id = $1 LIMIT 1',[tce[0].in_reply_to_status_id], (error, results) => {
    if (error) {
      throw error
    }
    if (results.rows.length > 0) {

      if (jawaban.indexOf(results.rows[0].answer.toUpperCase()) > -1) {
        console.log("JAWABAN BENAR : " + jawaban);
        replyTo("Selamat @" + tce[0].user.screen_name + " jawaban anda benar! +" + results.rows[0].point + " buat anda.", tce[0].id_str);
        replyTo("Pertanyaan ini telah dijawab oleh @" + tce[0].user.screen_name, tce[0].in_reply_to_status_id_str);
        
        // update tertebak
        pool.query('SELECT tertebak FROM quiz where post_id = $1', [tce[0].in_reply_to_status_id], (err, hasil) => {
         
          if (err) throw err;
          pool.query("UPDATE quiz SET tertebak = $1 WHERE post_id = $2", [parseFloat(hasil.rows[0].tertebak) + 1, tce[0].in_reply_to_status_id], (e, h) => {
            if (e) throw e
          })
        });

        // remove post id
        pool.query("UPDATE quiz SET post_id = null WHERE post_id = $1", [tce[0].in_reply_to_status_id], (e, h) => {
          console.log("[SOAL] " + tce[0].in_reply_to_status_id + " reseted.");
        })
        
      
        

        // update point
        pool.query('SELECT point FROM users where id = $1', [tce[0].user.id], (err, hasil) => {
          if (err) throw err;
          pool.query("UPDATE users SET point = $1 WHERE id = $2", [parseFloat(results.rows[0].point) + parseFloat(hasil.rows[0].point), tce[0].user.id], (e, h) => {
            if (e) throw e
          })
        });
      } else {
        console.log("JAWABAN SALAH : " + jawaban);
      }

    }
  })
}

function buatSoal() {
  // buat soal
  pool.query("SELECT * FROM quiz WHERE post_id IS NULL ORDER BY tertebak asc, random() LIMIT 1",
  (error, results) => {
    if (error) {
      throw error
    }
    if (results.rows.length > 0) {
      tweetSoal(results.rows[0].id, "[SOAL] "+results.rows[0].quiz + " (" + results.rows[0].point + " point)");
    }
  });
}

function topGlobal() {
  // buat soal
  pool.query("SELECT * FROM users ORDER BY point DESC LIMIT 10",
  (error, results) => {
    if (error) {
      throw error
    }
    if (results.rows.length > 0) {
     
      var content = "[RANK TOP GLOBAL]\n";
      for (var i = 0; i < results.rows.length; i++) {
        content += (i+1) + ". @"+ results.rows[i].username +" "+results.rows[i].point+" point\n";
      }
      console.log("[TWEET] Top global. ");

      tweet(content);
    }
  });
}

(async start => {
  try {

    const webhook = new Autohook();
    // Removes existing webhooks
    await webhook.removeWebhooks();

    // Starts a server and adds a new webhook
    await webhook.start();

    webhook.on('event', async event => {

      //console.log(util.inspect(event, false, null, true /* enable colors */))
      //console.log();
      if (event.tweet_create_events) {
        await cekJawaban(event);
      }
      if (event.direct_message_events) {
        await sayHi(event);

      }
    });

    // Subscribes to your own user's activity
    await webhook.subscribe({
      oauth_token: process.env.TWITTER_ACCESS_TOKEN,
      oauth_token_secret: process.env.TWITTER_ACCESS_TOKEN_SECRET});

      function timerSoal() {
        buatSoal();
      }

      setInterval(timerSoal, 20*60*1000);

      function timerTop() {
        topGlobal();
        
        // reset all question
        pool.query("UPDATE quiz SET post_id = null LIMIT 20", (e, h) => {
          console.log("[RESET] done");
          console.log(h);
          console.log(e);
        })
      }

      setInterval(timerTop, 23*60*60*1000);

    } catch (e) {
      // Display the error and quit
      console.error(e);
      process.exit(1);
    }
  })();
