PGDMP             
            x            d6r62okflfqfe3     11.8 (Ubuntu 11.8-1.pgdg16.04+1)     12.4 (Ubuntu 12.4-1.pgdg18.04+1)     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    1926066    d6r62okflfqfe3    DATABASE     �   CREATE DATABASE d6r62okflfqfe3 WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.UTF-8' LC_CTYPE = 'en_US.UTF-8';
    DROP DATABASE d6r62okflfqfe3;
                fzzrmsfeysswec    false            �           0    0    DATABASE d6r62okflfqfe3    ACL     A   REVOKE CONNECT,TEMPORARY ON DATABASE d6r62okflfqfe3 FROM PUBLIC;
                   fzzrmsfeysswec    false    3838                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
                fzzrmsfeysswec    false                        0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                   fzzrmsfeysswec    false    3                       0    0    SCHEMA public    ACL     �   REVOKE ALL ON SCHEMA public FROM postgres;
REVOKE ALL ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO fzzrmsfeysswec;
GRANT ALL ON SCHEMA public TO PUBLIC;
                   fzzrmsfeysswec    false    3                       0    0    LANGUAGE plpgsql    ACL     1   GRANT ALL ON LANGUAGE plpgsql TO fzzrmsfeysswec;
                   postgres    false    598            �            1259    2984682    quiz    TABLE     �   CREATE TABLE public.quiz (
    id bigint,
    quiz text,
    answer character varying,
    point bigint DEFAULT 0,
    user_answered_id character varying,
    answer_explain text,
    post_id character varying,
    tertebak bigint DEFAULT 0
);
    DROP TABLE public.quiz;
       public            fzzrmsfeysswec    false    3            �            1259    2972466    users    TABLE       CREATE TABLE public.users (
    id character varying NOT NULL,
    created_date timestamp with time zone,
    name character varying,
    username character varying,
    point bigint DEFAULT 0,
    description text,
    location character varying,
    image_url text,
    url text
);
    DROP TABLE public.users;
       public            fzzrmsfeysswec    false    3            �          0    2984682    quiz 
   TABLE DATA           l   COPY public.quiz (id, quiz, answer, point, user_answered_id, answer_explain, post_id, tertebak) FROM stdin;
    public          fzzrmsfeysswec    false    197            �          0    2972466    users 
   TABLE DATA           o   COPY public.users (id, created_date, name, username, point, description, location, image_url, url) FROM stdin;
    public          fzzrmsfeysswec    false    196            }           2606    3045273    users users_pk 
   CONSTRAINT     L   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pk PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pk;
       public            fzzrmsfeysswec    false    196            �   A  x��Zےܶ}�|\��ve�9W>��ڵ-�u�F�*U~��C/`HbW�'H�s���n��C���JZ�p�F�/�O7�����S�n콩Z#7�T�n��R��.E�RU�E4����D�$Z�ȏwj��F�Z����n:U*y)�Tg��k�d�[]�iT%;U�L���[��TW{<���0�3w*o����d�יV����]��:yss#]չ\��Rem�2Z]:�Hw���T��ֶ.�Hb2Y&��X�4;]��Z�[X�U����;=>�j��*�k��?����0C�2�;��b�K��JB�U�5����V5R��Rn:!�D�x�p^�8�T+�i���� ���H|�ϕ,]�.�ޥz/'ޘNVs񖜥�J���&���py��KQ���Vv���oUV��6i��T!�����Zp�K��N�4&0�b*�+�{J���sG��9_@��u.T`5��nbf��7|x0�bᕹJ��x
K6�t��"	e�V�6-�u������ �D�@^m�#����p�Z�p����I��|ȓ�&69��H��E/�5,������6|s>�T�d�L�b�a/|�_R�\���+T�o��m�38 V�?��'�2U�uf+� ���j� ^�|�Rdx�"ygr��c��C7Fb��&��.����nh;����ԑ-��^�IVĞ���*�w��Z�j�����5��_[Sa)D��ZG�����D6.m	�V���ys��"4r�S�K�+B�-�8�V!\�u�
K��\������5<����N�=Ϡ_��]6] t��������l��%�cG�U2����{�pd:NV�GHA0ɭU��o���'���tcC(�{�{���ܼ�!�Tw��Qڏ�{�^��?�24�r	�Ӯ����1��᧍��ycUi*��K�Zب����a�ЄO��i����4�r��m�$�#	�X{`��ux���Ehߛ��+T�B=�<��CF�\o{�@������d�+$�R����Z�Sc����� :�H_e[%�?B�^�"	5��R�3��li
�j5����u;#9��U�'灅e���m:h��P�3�5���з�؎
e�����R\�x$�����2�����p�P��h=�Q�mJZ˛
���-x�:�w�)���P�X��d���|�U���k�w��F�y��z��~��s���̥ �)�fsၱ����p}Mе�+����.'���"�3%$P������� k9��A��Α�	b�@P�۰���?EE���GPD�7� ���]A�B�~T�˭f�W!1Y.�(À%}О�IX4YM�jd��x��6r�k�=f%DGtG��V��hd�.��U�����l	o�Ζ2��r�+�C���Y�K�+CQQ��p�ܛ� ���`;�y����%M �Ư�(�)�����$�yj�@��գ'-�]���F�$��JD	Q1�����d=W  �� *Ɛ�'����Ӿ��Tb�7���d��|!`�:���)�z�g�E)¾�{tC��@���CQB��`�/��N�� 8�|�h�g�\�nD�k�� =�h.�t��۟7�Ja��#=\��H���yl�ښ�����i6��/W�G�3E9�%�>A���Pm�x~g[��@Y�9.�'��×I�t꓿: �[�y
���z�҆����s1K�?�P.z0�@_�a4�W�`���H�'�_Ȳ�V��y@��6b��*�.����>�x/F�Г ��D�܉�!��An)n�������%� �u��M|�{j̯�b�A d�i#>I֠Z@����<u%`d�w�ⳒD�Kǜ����]�Lk�\\w�X�	#�|�.&k�9!�# @�(Y<@��u�oKs�z�A�����$��:C�{T&�3(�>�����Q���F�RPDQX3����5*��o
�7�E� ���A8$sq��O�Ü�x�6Eә:��0��Di��膛3
P���_W�����<�7V��Z� �2T���J�/
e�3�#7����,�H܉ɳ'
�&~v�k���:��'G�&����d��S���ף��=2rg�5K��MxV4<�_�0�:S�(%���鱘d2��kŕ E�Z�ƝjϠU�����Z4~@.�o|��<W*rl~��|�ѓ+F��� #4����PҜMi�jF ���u� �/o)�ع��P�Pׄ��bǖ�Ǖ��'�� ��Q"ɂdQhӱ����O��-�s���%�CP#�����G��:B����a[�7��d��s�q;���r�!��By�Ά���PBֈ8a��C�vӥ�v1�	mb֔����r�b8��f�p��Gj
�I6~���#B�Tm�8kA��g.�U;��ks�����)V����d�El�V=r�v4��ס�*16���w���W���g��:�N=��w�%�}��-��AHLBRv���qp)�^���'�k� �����d�����`Ä
�>�(����iCMPa*��]�:$��3����)ۃ eH�l�$bӁa���z���4�E7'��ʺ��M��[�lF$�3������ֵ�s h�BU�$��M�TȁT�Ǐ�>;~$L;~� �h(P`�}S$��/�#� ���x!>�;P��@Ll��)~d���lf�$��a����/����O:�J���J7�o ;�&��Qm��<YD����pi�n#w��=�L�c\c<A�L#/�[{(F찿2�O�����M=e�|�Gk��a����Aw�`�\��p{T�������5��}�N��7�6�_���I-���(kL8R�Q���zn8�Qï����ߵ-��*�'���)�;4=�剈o<�Ia��So"v`��Kh���,W΢g��`e'�:�)��)�6��J���Lߤ�)D�Z���0gS��g�xvr���q�[�b��	q��҄��8�) ��-�n9r�~l:�,�=S�� 0��A7��.$��
��Էo"��iu'-�*vv�q��@��$=�<CqE%i].��S�Q0�A�yk[8� ����P�RU[<Hx�MV�?v��k���άi6�k�.�~1�<�͞ A}ٸ;IC�@F2��
���勭Iܓ�����.��d4M�	�^���i�r���'+��U4I"ֈ�9N���.�j����2$����{�~����]���l��ePʇ�ģ9���N[��$�bă����ȏ��9�\�>���|<W�8��*:����ox�Y��44�U�a,�����{:�o%�������d/����N/4�~�)O����Ӡ^�to(B]��|K�v!�Ms�������
à�9Ƥ�++OmNf�5A_�/��7v4�T}S�s�;�`FM�%Ow8��m�Si�0`8H�}��8�tK���:�cQ5�a��D�>q�8�	G/��@aw��r&�ۆ��ӨƒQk������1���[�S�}���� �v:;ӒV�ڑ��A�p�Aҍ���~ޙ���/a�A��g&��bSZ�+(a�i�@#�f0�e�H �k�o�^5�?9Rd.m{�}MW`_c��,A҂������ܛ��5�X�%r�s�xp��]/���bWqo�7����<#z��G�T�!7�Z�iP�Vˁ��nk?�U���[�s�c��j�p�F�[��<9�ٞ���̡vE�[n�t�d�9\۞U��$�?��[n��g;ĺ� �#r�B���o�}��\9����8�� �D��|��	��H�+%�����nQľ����-ĭ���G��M��˪}}��B2M� �S5&n��6���D�@��S�䫡BҐ�(�?hT7���i��!3_	\�x�	P��8��4�A���I�q?�ċ��G��iWYۜ��~.�W�2"�P}���n�MZ}r����d2�/�
9      �      x��Z[sז~n~�>���d&n����\����&�2�rmIm�-u�苅��`�@�@�-�r#�b0$U��T�Ӽϱ,�T�*�	��-cé��n�Zݻ�^�[���n)�"˪���"�v�,w(
��NM�TuQ7��$a����u���$�� 	�v���w"�
�8.u�R�t$�e�ˉ��K��`�-:��GsN��Mdٲe[�l[�dK1R�z�
��~z�(�r�x�e��j�֪E
�"�ҩI��%Z��,�C��}h{�Vl���h�,(�$ty�G+	ى���9�M�ԧ��̥s�{[� ��z�ݶo�M�-�T�-[�l[�f�*z��;���d�,ن�H�fٚj�[���U;%Y4t�#�P!(��0��/Ț�M�G1�D���u{Vڸ�)+��Z�e��T�C�vڪ��JE5,�iX�ID���N�eCf�u�^@�Z�?⼓v���
 �P�01#�=��]�k[�~4LC7e[�-]֕��~e�������QLs!�x_�E�-�!�A+k���)����������Vh�dw���W(��yl��a�?�h�t;E:LC�>��Ϯik@�iY��U�Ӵ�P>�u4�v�Y�PlK�Ռ1�1p�����8�U���dk�CQL�S�D��_%)l�n�ݐ�0�'�q�,);��B��b1)�dTC��ٚ)�Jj�خޮ�M��TU�TI� �H2�-��Џ�0��r(qcJ�
��?V��\��-U˲ME�dE�%=u ��Õtz�}�d+�)�0O�:$�C��"w�k���̼!^!��O����:���YD�f�/C��i�T,�C�p(�U�!��A����E���� �
�F�Z��[q��Qos��%]�,��t�XK
���)s(��
��s�E��D�䨐��t��O+���z.�q��~�N�"�*��x�=�?j�e"�H�~�7�����Ʃ�͒���q�C҈l���I���4�E��ɇIQ��O�l���" ,,��H�	}�߶�I6)&�ŏ�W_�Yr��Y>E��%*
�W�h S�]�m�.�z��!�	��l�P%6d�P���[���&'�z)'��&��C�"+�� ���Q"�F�n������t��
۳A)�#�į��.���q���F��(��HJ5�l֠Y'��T�m�d�$ն��4=���+Y6c��\�M�Hf'��"�g�Ѝ�$;�m��I!�}�b31�w��s����4�M�*�t۲�+�\����Y�͚@E�5MS��X��TUѰ�y�<���y��,�Sp=R�� �O(�2��2s��7aU��b��ZZ꠱�H��̪�aY
�__�a� dbZJQ�����H
0�B��i�P
b�q�l�C� ��F���zٱ���&��_������值W���#���$Y`�)#�o��@v��}-���6HQ�2�pF9�a��^�!��ImN��(:�B���$�FjOq'=X��	��ϻ4h2r��"lK�-8HQy�[��E$��SW�:[a����$I��ۑt�awdx�wڟG�,t8XR�y�*��E�+Y���iU0�C}k6�Ĳ�ԑ��XX�������4�]��N6uf�v8��a�t˶5K�4CQ��Ծ�m#�}����6�����:��2�S��aD�Ee��Y~��.`��$A`��3ӒKb�$b'��%
�?�~�����nC�ئ,)�������۳�k���5p��+��b�x�b�:��7��6�p���O�E��pv��"D%'�����:��~�!�d�����C{t�?�x�~��Ql��cc��s��6S�a@�"�X��l�I���v�Ǖ��̊��$ �C_�I�!��ˤ� ��јt� ��8�w@�L�G���:��s�ҋC�܍z���#��$$��
b�X�;a��1��Ĥ��wdi�����W�4]K���FGxjH�-J�p$>rx��l�����8��[Dɦ)����i��d��5V�\)u����\ �1�FG܈leKs���\e�l���^r���!s�| q��UCN}p���3<ػy6��1荸��l���o!J͕���
H�'�&Q��<.|9��H���>�0z[�:��LxT$�������˗_dÕWO�]��M�j��}&��Q�9�����P�r�H�.�~���e0�Y8;�py����B�>޿=&W�{^��9�)���o�r( ���H��C�.t%97,�D��HhD��J���bt�w1q�<q�%$�$�.VV�6-�q�]��$�삈W4>������0�@��n��������=v�Nl��ѡ��k�e��<+�M_"x�M�n��*����	1�{�D"Za�"�#�ؠၿ��S�yz�Bf��1Tb��:��t�ݹ	�:8	
M]�_"��m�F�]���e�9��� ���,sj��%"ߴu�@��	��j�P�]ۥn����r�,B;� (��6X#oQ�=ȩ�V$��NM�V���K:Aq'�U���X��oP����e�:�6f[M��GG���G�4�n0y M*�k�D될5yj��$��$V���8y.z��4)�QY2zb� �>ص�'b�8�S�;��vYU<-����p-���h�=]�WԊ$3�`�Z�b�SfiJ�\�Ѐ��B��W
aF�z%@���0����}��!�]Yf{�Š��Ѕ[m�F���L�t���)��`���@�2(�4�5�ȓ�Nգ.Bp�L������t�@���2}�&ڏhC�E�����m��hsh�'>[��\#���µ����ݬK'�����(2T�lʺ��*{+�!��_^E,�q�I)��VAEց�P)�E�l��+Ef�b��^=W�]�W�ԫ��^�:�tL����5��;��Bšy�6�")5���q�qb��ťo�h~5�8w�ϯ=k^������/o��@_o;�o��^�N֫�6�ի���ۍ�G�'w뵋K�N���^;���S����!�j�ԫ3���z����&�cw�c��k_�Ǟ�������w�����z���$?��0K�U�N���8�R���g���Y6nv�d��{��̫]��.,?�_/��E�:���4�Kc�Vc��ڝ�W>iܝd7�}�5��4�e�Ǌ
]cV���@42��޼�n#��5ܪH\r'j]Q"��[���ҙ���Չzm��V�3w�ߜ��17G'~x~��H(E�2XHB6���?���R���ƙ���M�������z�^��
�\{�>6�ߧ�y���S���������s��t���>�2�־F����S�:�f��a��6ΟZ|v�ca�Ә��91����Y���ns�n�8����h��'�	�paq�*�;�q�m�؅�_��V����̮��Ž&8�-r{��>�k���ܧ�9�j�L��9 �3�?Z{���;����&�Y~z��|u�����f�M5.qD¢U��"H��ԭ���k�?�䌎
Q�-Ac��0z����ړ63���FEj�M��
:*�=5{�u���eq�Xv�F�d��JR`0�;�r����iaA�j��uE�-��J�����U���'��<k�<M�7���m�3<'��r�<|G��
M��I��\fK����4O0I ��#�����Y������/8�f� ��P����V��ğO��l�:�<�Ï�)��b��t�4��N��y����6E8r"w��rv���9jN�@���|�Y��7\N2m��MQ�ԇ���5(_a0�B6�(T���n`0��Ջ-Z6O�CE�*V��ADG�(�BDK�0�*��nT
��5u��H���Bٚ~���[���sb�s"�bZ;���P�CV!f�E��2:� �:%�d ]!P���W|�=]�$!�=���f������'�+�nĖ�VY�Y��)���_�F��ޮ=fxx�:��궤B\�:B�fڊeQ[T�U����W����A��M!�1��a,5�����ͩS��	'<|��kU�<���Y�.>y�8f���,��?[|r�Ezk���'��Ӝ�X�9?M8�����U��Iq�֥�����1��Z�r�2$K��3(�VR�+�]G���f� �  �(cP�H�٦,mP��'p�"��Η:W��|
�s��ɵ�Khg��N��f�+�n�CE����x�7��Hڅv�H�Uq����1QQ���#$G�a0,����%"`�̞�y!���3�tPn2�	�ȇ�ي%�2����m�}XԡR�F��/m\���N	Q��S�˂��/��'6!�{��W|�
a�wH�d
Q� �4C�%ۆ|�K1��оlǶC���Ch`�%��2��)B���{��G,�VZ��Ay+˨H����g�a���^�>��Y���l��Ov�*�� I�4ܟOX��g'Y�Ķ:�8Ƕ�.����uCGp*6l7R�JO�rt�u���(NB/q[�]��J�8.:�PR]�qH�)��.����"�`�!����R[�?��j��[�>���"W��s��t��u�9��ٸ�},�e�����=V��6�M��[�8he���矏��\�-��[�6����ې-���ͩ�w����Y~ru-]0q��O�~�=��5fO?�|�1��<��AK�4N�5�O2z;�*�_�3ܗ�v�k�U��=^i�:0/7ub��>�?���y�sui�����oy2����4���[K��01�T��oK)՚�j>dv6�__Go����5�]`��Ź�ƽ�˧�=��ӥ�O83y޸0åWK��s�>��\Ť3�g̳n�j���˷FW������gL�4���o\�w�\�Q�!)I�f�2��-�4$)5b$ꕓW��� v���dcL�Z�����j������W��O�=\��f$�@�0�(q
 ;��0uK�DN��*A�G��j���S��,�N�L_<�6�v
�4�gH�?Ec����l��6�v�}'���+l3�vi�Gv|atw��2}�K��h��/\GcǾE�zq�,\�e]4��Ǎ��?�c�~���βa"kí��K����3T�����M]�5IV,Ӕ���f��I�	ZOU.�ҭcTh���`HB��\JJA!`��?�?��iJ���vw�%�Wf���c_��VC5@? ���t؊ll��t���V���]�?��:5CT�֓���]]]da���Z!�<Z�E�5������/�prJ ���J�)`�$�����u�ooϞ]l��:#b���l�d$i���t���r�}C��kZ��-�[�l�?3�8     