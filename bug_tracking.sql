PGDMP  "                    |            Bug_Tracking_Tool    16.2    16.2 :    /           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            0           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            1           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            2           1262    16618    Bug_Tracking_Tool    DATABASE     �   CREATE DATABASE "Bug_Tracking_Tool" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_India.1252';
 #   DROP DATABASE "Bug_Tracking_Tool";
                postgres    false            �            1259    16619    bug    TABLE     �  CREATE TABLE public.bug (
    bug_id integer NOT NULL,
    bug_name text,
    request_id integer,
    customer_id integer,
    tester_id integer,
    summary text,
    feature_workflow text,
    severity character varying,
    steps_to_reproduce text,
    status character varying,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    bug_tester_comment text,
    bug_customer_comment text
);
    DROP TABLE public.bug;
       public         heap    postgres    false            �            1259    16625    bug_bug_id_seq    SEQUENCE     �   CREATE SEQUENCE public.bug_bug_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.bug_bug_id_seq;
       public          postgres    false    215            3           0    0    bug_bug_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.bug_bug_id_seq OWNED BY public.bug.bug_id;
          public          postgres    false    216            �            1259    16626    bug_history    TABLE     �   CREATE TABLE public.bug_history (
    bug_id integer,
    bug_name text,
    request_id integer,
    customer_id integer,
    tester_id integer,
    summary text,
    status text,
    completed_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.bug_history;
       public         heap    postgres    false            �            1259    16632    customer    TABLE     �   CREATE TABLE public.customer (
    customer_id integer NOT NULL,
    customer_name text NOT NULL,
    email character varying NOT NULL,
    password character varying NOT NULL
);
    DROP TABLE public.customer;
       public         heap    postgres    false            �            1259    16637    customer_customer_id_seq    SEQUENCE     �   CREATE SEQUENCE public.customer_customer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.customer_customer_id_seq;
       public          postgres    false    218            4           0    0    customer_customer_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.customer_customer_id_seq OWNED BY public.customer.customer_id;
          public          postgres    false    219            �            1259    16638    projectmanager    TABLE     �   CREATE TABLE public.projectmanager (
    manager_id integer NOT NULL,
    manager_name character varying NOT NULL,
    email character varying NOT NULL,
    password character varying NOT NULL
);
 "   DROP TABLE public.projectmanager;
       public         heap    postgres    false            �            1259    16643    projectmanager_manager_id_seq    SEQUENCE     �   CREATE SEQUENCE public.projectmanager_manager_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.projectmanager_manager_id_seq;
       public          postgres    false    220            5           0    0    projectmanager_manager_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.projectmanager_manager_id_seq OWNED BY public.projectmanager.manager_id;
          public          postgres    false    221            �            1259    16644    request_acceptance    TABLE     s   CREATE TABLE public.request_acceptance (
    request_id integer,
    customer_id integer,
    tester_id integer
);
 &   DROP TABLE public.request_acceptance;
       public         heap    postgres    false            �            1259    16647    tester    TABLE     �   CREATE TABLE public.tester (
    tester_id integer NOT NULL,
    name character varying NOT NULL,
    email character varying NOT NULL,
    password character varying NOT NULL
);
    DROP TABLE public.tester;
       public         heap    postgres    false            �            1259    16652    tester_tester_id_seq    SEQUENCE     �   CREATE SEQUENCE public.tester_tester_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.tester_tester_id_seq;
       public          postgres    false    223            6           0    0    tester_tester_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.tester_tester_id_seq OWNED BY public.tester.tester_id;
          public          postgres    false    224            �            1259    16653    testing_request_history    TABLE     �   CREATE TABLE public.testing_request_history (
    request_id integer,
    request_name text,
    tester_id integer,
    customer_id integer,
    status text
);
 +   DROP TABLE public.testing_request_history;
       public         heap    postgres    false            �            1259    16658    testingrequest    TABLE     #  CREATE TABLE public.testingrequest (
    request_id integer NOT NULL,
    customer_id integer,
    web_application_url character varying NOT NULL,
    status character varying NOT NULL,
    request_name text,
    email text,
    password text,
    accepted boolean,
    block_reason text
);
 "   DROP TABLE public.testingrequest;
       public         heap    postgres    false            �            1259    16663    testingrequest_request_id_seq    SEQUENCE     �   CREATE SEQUENCE public.testingrequest_request_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.testingrequest_request_id_seq;
       public          postgres    false    226            7           0    0    testingrequest_request_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.testingrequest_request_id_seq OWNED BY public.testingrequest.request_id;
          public          postgres    false    227            p           2604    16664 
   bug bug_id    DEFAULT     h   ALTER TABLE ONLY public.bug ALTER COLUMN bug_id SET DEFAULT nextval('public.bug_bug_id_seq'::regclass);
 9   ALTER TABLE public.bug ALTER COLUMN bug_id DROP DEFAULT;
       public          postgres    false    216    215            s           2604    16665    customer customer_id    DEFAULT     |   ALTER TABLE ONLY public.customer ALTER COLUMN customer_id SET DEFAULT nextval('public.customer_customer_id_seq'::regclass);
 C   ALTER TABLE public.customer ALTER COLUMN customer_id DROP DEFAULT;
       public          postgres    false    219    218            t           2604    16666    projectmanager manager_id    DEFAULT     �   ALTER TABLE ONLY public.projectmanager ALTER COLUMN manager_id SET DEFAULT nextval('public.projectmanager_manager_id_seq'::regclass);
 H   ALTER TABLE public.projectmanager ALTER COLUMN manager_id DROP DEFAULT;
       public          postgres    false    221    220            u           2604    16667    tester tester_id    DEFAULT     t   ALTER TABLE ONLY public.tester ALTER COLUMN tester_id SET DEFAULT nextval('public.tester_tester_id_seq'::regclass);
 ?   ALTER TABLE public.tester ALTER COLUMN tester_id DROP DEFAULT;
       public          postgres    false    224    223            v           2604    16668    testingrequest request_id    DEFAULT     �   ALTER TABLE ONLY public.testingrequest ALTER COLUMN request_id SET DEFAULT nextval('public.testingrequest_request_id_seq'::regclass);
 H   ALTER TABLE public.testingrequest ALTER COLUMN request_id DROP DEFAULT;
       public          postgres    false    227    226                       0    16619    bug 
   TABLE DATA           �   COPY public.bug (bug_id, bug_name, request_id, customer_id, tester_id, summary, feature_workflow, severity, steps_to_reproduce, status, created_at, bug_tester_comment, bug_customer_comment) FROM stdin;
    public          postgres    false    215   �I       "          0    16626    bug_history 
   TABLE DATA           z   COPY public.bug_history (bug_id, bug_name, request_id, customer_id, tester_id, summary, status, completed_at) FROM stdin;
    public          postgres    false    217   �I       #          0    16632    customer 
   TABLE DATA           O   COPY public.customer (customer_id, customer_name, email, password) FROM stdin;
    public          postgres    false    218   �I       %          0    16638    projectmanager 
   TABLE DATA           S   COPY public.projectmanager (manager_id, manager_name, email, password) FROM stdin;
    public          postgres    false    220   �J       '          0    16644    request_acceptance 
   TABLE DATA           P   COPY public.request_acceptance (request_id, customer_id, tester_id) FROM stdin;
    public          postgres    false    222   K       (          0    16647    tester 
   TABLE DATA           B   COPY public.tester (tester_id, name, email, password) FROM stdin;
    public          postgres    false    223   ,K       *          0    16653    testing_request_history 
   TABLE DATA           k   COPY public.testing_request_history (request_id, request_name, tester_id, customer_id, status) FROM stdin;
    public          postgres    false    225   �K       +          0    16658    testingrequest 
   TABLE DATA           �   COPY public.testingrequest (request_id, customer_id, web_application_url, status, request_name, email, password, accepted, block_reason) FROM stdin;
    public          postgres    false    226   �K       8           0    0    bug_bug_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.bug_bug_id_seq', 1, false);
          public          postgres    false    216            9           0    0    customer_customer_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.customer_customer_id_seq', 4, true);
          public          postgres    false    219            :           0    0    projectmanager_manager_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.projectmanager_manager_id_seq', 1, true);
          public          postgres    false    221            ;           0    0    tester_tester_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.tester_tester_id_seq', 4, true);
          public          postgres    false    224            <           0    0    testingrequest_request_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.testingrequest_request_id_seq', 6, true);
          public          postgres    false    227            x           2606    16670    bug bug_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.bug
    ADD CONSTRAINT bug_pkey PRIMARY KEY (bug_id);
 6   ALTER TABLE ONLY public.bug DROP CONSTRAINT bug_pkey;
       public            postgres    false    215            z           2606    16672    customer customer_email_key 
   CONSTRAINT     W   ALTER TABLE ONLY public.customer
    ADD CONSTRAINT customer_email_key UNIQUE (email);
 E   ALTER TABLE ONLY public.customer DROP CONSTRAINT customer_email_key;
       public            postgres    false    218            |           2606    16674    customer customer_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.customer
    ADD CONSTRAINT customer_pkey PRIMARY KEY (customer_id);
 @   ALTER TABLE ONLY public.customer DROP CONSTRAINT customer_pkey;
       public            postgres    false    218            ~           2606    16676 '   projectmanager projectmanager_email_key 
   CONSTRAINT     c   ALTER TABLE ONLY public.projectmanager
    ADD CONSTRAINT projectmanager_email_key UNIQUE (email);
 Q   ALTER TABLE ONLY public.projectmanager DROP CONSTRAINT projectmanager_email_key;
       public            postgres    false    220            �           2606    16678 "   projectmanager projectmanager_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.projectmanager
    ADD CONSTRAINT projectmanager_pkey PRIMARY KEY (manager_id);
 L   ALTER TABLE ONLY public.projectmanager DROP CONSTRAINT projectmanager_pkey;
       public            postgres    false    220            �           2606    16680    tester tester_email_key 
   CONSTRAINT     S   ALTER TABLE ONLY public.tester
    ADD CONSTRAINT tester_email_key UNIQUE (email);
 A   ALTER TABLE ONLY public.tester DROP CONSTRAINT tester_email_key;
       public            postgres    false    223            �           2606    16682    tester tester_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.tester
    ADD CONSTRAINT tester_pkey PRIMARY KEY (tester_id);
 <   ALTER TABLE ONLY public.tester DROP CONSTRAINT tester_pkey;
       public            postgres    false    223            �           2606    16684 "   testingrequest testingrequest_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.testingrequest
    ADD CONSTRAINT testingrequest_pkey PRIMARY KEY (request_id);
 L   ALTER TABLE ONLY public.testingrequest DROP CONSTRAINT testingrequest_pkey;
       public            postgres    false    226            �           2606    16685    bug bug_customer_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.bug
    ADD CONSTRAINT bug_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.customer(customer_id);
 B   ALTER TABLE ONLY public.bug DROP CONSTRAINT bug_customer_id_fkey;
       public          postgres    false    4732    218    215            �           2606    16710    bug bug_request_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.bug
    ADD CONSTRAINT bug_request_id_fkey FOREIGN KEY (request_id) REFERENCES public.testingrequest(request_id);
 A   ALTER TABLE ONLY public.bug DROP CONSTRAINT bug_request_id_fkey;
       public          postgres    false    4742    226    215            �           2606    16715    bug bug_tester_id_fkey    FK CONSTRAINT        ALTER TABLE ONLY public.bug
    ADD CONSTRAINT bug_tester_id_fkey FOREIGN KEY (tester_id) REFERENCES public.tester(tester_id);
 @   ALTER TABLE ONLY public.bug DROP CONSTRAINT bug_tester_id_fkey;
       public          postgres    false    215    223    4740            �           2606    16720 6   request_acceptance request_acceptance_customer_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.request_acceptance
    ADD CONSTRAINT request_acceptance_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.customer(customer_id);
 `   ALTER TABLE ONLY public.request_acceptance DROP CONSTRAINT request_acceptance_customer_id_fkey;
       public          postgres    false    4732    218    222            �           2606    16725 5   request_acceptance request_acceptance_request_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.request_acceptance
    ADD CONSTRAINT request_acceptance_request_id_fkey FOREIGN KEY (request_id) REFERENCES public.testingrequest(request_id);
 _   ALTER TABLE ONLY public.request_acceptance DROP CONSTRAINT request_acceptance_request_id_fkey;
       public          postgres    false    4742    222    226            �           2606    16730 4   request_acceptance request_acceptance_tester_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.request_acceptance
    ADD CONSTRAINT request_acceptance_tester_id_fkey FOREIGN KEY (tester_id) REFERENCES public.tester(tester_id);
 ^   ALTER TABLE ONLY public.request_acceptance DROP CONSTRAINT request_acceptance_tester_id_fkey;
       public          postgres    false    223    222    4740            �           2606    16735 @   testing_request_history testing_request_history_customer_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.testing_request_history
    ADD CONSTRAINT testing_request_history_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.customer(customer_id);
 j   ALTER TABLE ONLY public.testing_request_history DROP CONSTRAINT testing_request_history_customer_id_fkey;
       public          postgres    false    4732    218    225            �           2606    16740 ?   testing_request_history testing_request_history_request_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.testing_request_history
    ADD CONSTRAINT testing_request_history_request_id_fkey FOREIGN KEY (request_id) REFERENCES public.testingrequest(request_id);
 i   ALTER TABLE ONLY public.testing_request_history DROP CONSTRAINT testing_request_history_request_id_fkey;
       public          postgres    false    226    225    4742            �           2606    16745 >   testing_request_history testing_request_history_tester_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.testing_request_history
    ADD CONSTRAINT testing_request_history_tester_id_fkey FOREIGN KEY (tester_id) REFERENCES public.tester(tester_id);
 h   ALTER TABLE ONLY public.testing_request_history DROP CONSTRAINT testing_request_history_tester_id_fkey;
       public          postgres    false    225    4740    223            �           2606    16750 .   testingrequest testingrequest_customer_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.testingrequest
    ADD CONSTRAINT testingrequest_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.customer(customer_id);
 X   ALTER TABLE ONLY public.testingrequest DROP CONSTRAINT testingrequest_customer_id_fkey;
       public          postgres    false    218    4732    226                   x������ � �      "      x������ � �      #   �   x�3�t.-.��M-R0�L�2R+srR���s9U�UT|�M��
S�"]�=<����Ҫ���M���2�,ӼK����L��������R�,C��¹����7�������S�|��&p�M�g~� �	z�      %   n   x�3�(��JM.Q�M�KLO-R0�̅�R+srR���s9U�UT|�M��
S�"]�=<����Ҫ���M���2�,ӼK����L��������R�,C��¹b���� ;� �      '      x�3�4�4�2�B�=... *
      (   �   x�3�I-.I-R0�,3R+srR���s9U�UT|�M��
S�"]�=<����Ҫ���M���2�,ӼK����L��������R�,C��¹�`fA�6����0���fS�l��&P�M�gv� w�s�      *      x������ � �      +   �   x�3�4��())���O�H�-�I5�K����KI-RJ-�L-�I-.�KA�!g	�2t�*��$��� �9c���8M�6!`��#�A6�4B3��dVf^�Bf�B@Q~rjq1Y�r�O��D�J� �'}�     