PGDMP                     
    |            floor     13.16 (Debian 13.16-1.pgdg120+1)    15.3 �    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16906    floor    DATABASE     p   CREATE DATABASE floor WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';
    DROP DATABASE floor;
                admin    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
                admin    false            �           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                   admin    false    4            �           0    0    SCHEMA public    ACL     Q   REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO PUBLIC;
                   admin    false    4            �            1259    17135    accessrecords    TABLE     �   CREATE TABLE public.accessrecords (
    id integer NOT NULL,
    entry_time timestamp without time zone,
    exit_time timestamp without time zone,
    employee_id integer
);
 !   DROP TABLE public.accessrecords;
       public         heap    admin    false    4            �            1259    17133    accessrecords_id_seq    SEQUENCE     �   CREATE SEQUENCE public.accessrecords_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.accessrecords_id_seq;
       public          admin    false    4    221            �           0    0    accessrecords_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.accessrecords_id_seq OWNED BY public.accessrecords.id;
          public          admin    false    220            �            1259    17046    companytype    TABLE     d   CREATE TABLE public.companytype (
    id integer NOT NULL,
    company_type character varying(5)
);
    DROP TABLE public.companytype;
       public         heap    admin    false    4            �            1259    17044    companytype_id_seq    SEQUENCE     �   CREATE SEQUENCE public.companytype_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.companytype_id_seq;
       public          admin    false    4    207            �           0    0    companytype_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.companytype_id_seq OWNED BY public.companytype.id;
          public          admin    false    206            �            1259    17109 	   employees    TABLE     �   CREATE TABLE public.employees (
    id integer NOT NULL,
    employee_name character varying(50),
    passport character varying,
    bank_account character varying(50),
    family_status_id integer,
    health_status_id integer,
    role_id integer
);
    DROP TABLE public.employees;
       public         heap    admin    false    4            �            1259    17107    employees_id_seq    SEQUENCE     �   CREATE SEQUENCE public.employees_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.employees_id_seq;
       public          admin    false    4    219            �           0    0    employees_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.employees_id_seq OWNED BY public.employees.id;
          public          admin    false    218            �            1259    17093    familystatuses    TABLE     b   CREATE TABLE public.familystatuses (
    id integer NOT NULL,
    status character varying(20)
);
 "   DROP TABLE public.familystatuses;
       public         heap    admin    false    4            �            1259    17091    familystatuses_id_seq    SEQUENCE     �   CREATE SEQUENCE public.familystatuses_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.familystatuses_id_seq;
       public          admin    false    4    215            �           0    0    familystatuses_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.familystatuses_id_seq OWNED BY public.familystatuses.id;
          public          admin    false    214            �            1259    17085    healthstatuses    TABLE     b   CREATE TABLE public.healthstatuses (
    id integer NOT NULL,
    status character varying(20)
);
 "   DROP TABLE public.healthstatuses;
       public         heap    admin    false    4            �            1259    17083    healthstatuses_id_seq    SEQUENCE     �   CREATE SEQUENCE public.healthstatuses_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.healthstatuses_id_seq;
       public          admin    false    4    213            �           0    0    healthstatuses_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.healthstatuses_id_seq OWNED BY public.healthstatuses.id;
          public          admin    false    212            �            1259    17201    materialhistory    TABLE     �   CREATE TABLE public.materialhistory (
    id integer NOT NULL,
    material_id integer,
    operation_date date,
    operation_type_id integer,
    quantity integer,
    warehouse_id integer
);
 #   DROP TABLE public.materialhistory;
       public         heap    admin    false    4            �            1259    17199    materialhistory_id_seq    SEQUENCE     �   CREATE SEQUENCE public.materialhistory_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.materialhistory_id_seq;
       public          admin    false    233    4            �           0    0    materialhistory_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.materialhistory_id_seq OWNED BY public.materialhistory.id;
          public          admin    false    232            �            1259    17164 	   materials    TABLE     2  CREATE TABLE public.materials (
    id integer NOT NULL,
    material_type_id integer,
    material_name character varying(50),
    package_quantity integer,
    unit_id integer,
    description character varying,
    material_cost double precision,
    stock_quantity integer,
    min_quantity integer
);
    DROP TABLE public.materials;
       public         heap    admin    false    4            �            1259    17162    materials_id_seq    SEQUENCE     �   CREATE SEQUENCE public.materials_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.materials_id_seq;
       public          admin    false    4    227            �           0    0    materials_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.materials_id_seq OWNED BY public.materials.id;
          public          admin    false    226            �            1259    17148    materialtypes    TABLE     �   CREATE TABLE public.materialtypes (
    id integer NOT NULL,
    type_name character varying(30),
    defect_percent double precision
);
 !   DROP TABLE public.materialtypes;
       public         heap    admin    false    4            �            1259    17146    materialtypes_id_seq    SEQUENCE     �   CREATE SEQUENCE public.materialtypes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.materialtypes_id_seq;
       public          admin    false    4    223            �           0    0    materialtypes_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.materialtypes_id_seq OWNED BY public.materialtypes.id;
          public          admin    false    222            �            1259    17193    operationtype    TABLE     i   CREATE TABLE public.operationtype (
    id integer NOT NULL,
    operation_type character varying(30)
);
 !   DROP TABLE public.operationtype;
       public         heap    admin    false    4            �            1259    17191    operationtype_id_seq    SEQUENCE     �   CREATE SEQUENCE public.operationtype_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.operationtype_id_seq;
       public          admin    false    4    231            �           0    0    operationtype_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.operationtype_id_seq OWNED BY public.operationtype.id;
          public          admin    false    230            �            1259    17067    partner_products    TABLE     �   CREATE TABLE public.partner_products (
    id integer NOT NULL,
    partner_id integer,
    product_id integer,
    quantity integer,
    sale_date date
);
 $   DROP TABLE public.partner_products;
       public         heap    admin    false    4            �            1259    17065    partner_products_id_seq    SEQUENCE     �   CREATE SEQUENCE public.partner_products_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.partner_products_id_seq;
       public          admin    false    211    4            �           0    0    partner_products_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.partner_products_id_seq OWNED BY public.partner_products.id;
          public          admin    false    210            �            1259    17054    partners    TABLE     ?  CREATE TABLE public.partners (
    id integer NOT NULL,
    type_id integer,
    company_name character varying(50),
    legal_address character varying(100),
    inn character varying(10),
    director_name character varying(50),
    phone character varying(50),
    email character varying(50),
    rating integer
);
    DROP TABLE public.partners;
       public         heap    admin    false    4            �            1259    17052    partners_id_seq    SEQUENCE     �   CREATE SEQUENCE public.partners_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.partners_id_seq;
       public          admin    false    209    4            �           0    0    partners_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.partners_id_seq OWNED BY public.partners.id;
          public          admin    false    208            �            1259    17025    products    TABLE     �   CREATE TABLE public.products (
    id integer NOT NULL,
    product_type_id integer,
    product_name character varying(100),
    scu character varying(10),
    min_partner_price double precision
);
    DROP TABLE public.products;
       public         heap    admin    false    4            �            1259    17023    products_id_seq    SEQUENCE     �   CREATE SEQUENCE public.products_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.products_id_seq;
       public          admin    false    4    203            �           0    0    products_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;
          public          admin    false    202            �            1259    17017    producttypes    TABLE     �   CREATE TABLE public.producttypes (
    id integer NOT NULL,
    type_name character varying(30),
    coefficient double precision
);
     DROP TABLE public.producttypes;
       public         heap    admin    false    4            �            1259    17015    producttypes_id_seq    SEQUENCE     �   CREATE SEQUENCE public.producttypes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.producttypes_id_seq;
       public          admin    false    201    4            �           0    0    producttypes_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.producttypes_id_seq OWNED BY public.producttypes.id;
          public          admin    false    200            �            1259    17101    roles    TABLE     \   CREATE TABLE public.roles (
    id integer NOT NULL,
    role_name character varying(20)
);
    DROP TABLE public.roles;
       public         heap    admin    false    4            �            1259    17099    roles_id_seq    SEQUENCE     �   CREATE SEQUENCE public.roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.roles_id_seq;
       public          admin    false    217    4            �           0    0    roles_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.roles_id_seq OWNED BY public.roles.id;
          public          admin    false    216            �            1259    17038    saleslocations    TABLE     j   CREATE TABLE public.saleslocations (
    id integer NOT NULL,
    location_name character varying(100)
);
 "   DROP TABLE public.saleslocations;
       public         heap    admin    false    4            �            1259    17036    saleslocations_id_seq    SEQUENCE     �   CREATE SEQUENCE public.saleslocations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.saleslocations_id_seq;
       public          admin    false    205    4            �           0    0    saleslocations_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.saleslocations_id_seq OWNED BY public.saleslocations.id;
          public          admin    false    204            �            1259    17156 	   unittypes    TABLE     `   CREATE TABLE public.unittypes (
    id integer NOT NULL,
    unit_name character varying(30)
);
    DROP TABLE public.unittypes;
       public         heap    admin    false    4            �            1259    17154    unittypes_id_seq    SEQUENCE     �   CREATE SEQUENCE public.unittypes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.unittypes_id_seq;
       public          admin    false    4    225            �           0    0    unittypes_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.unittypes_id_seq OWNED BY public.unittypes.id;
          public          admin    false    224            �            1259    17185 
   warehouses    TABLE     f   CREATE TABLE public.warehouses (
    id integer NOT NULL,
    warehouse_name character varying(30)
);
    DROP TABLE public.warehouses;
       public         heap    admin    false    4            �            1259    17183    warehouses_id_seq    SEQUENCE     �   CREATE SEQUENCE public.warehouses_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.warehouses_id_seq;
       public          admin    false    4    229            �           0    0    warehouses_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.warehouses_id_seq OWNED BY public.warehouses.id;
          public          admin    false    228            �           2604    17138    accessrecords id    DEFAULT     t   ALTER TABLE ONLY public.accessrecords ALTER COLUMN id SET DEFAULT nextval('public.accessrecords_id_seq'::regclass);
 ?   ALTER TABLE public.accessrecords ALTER COLUMN id DROP DEFAULT;
       public          admin    false    220    221    221            �           2604    17049    companytype id    DEFAULT     p   ALTER TABLE ONLY public.companytype ALTER COLUMN id SET DEFAULT nextval('public.companytype_id_seq'::regclass);
 =   ALTER TABLE public.companytype ALTER COLUMN id DROP DEFAULT;
       public          admin    false    206    207    207            �           2604    17112    employees id    DEFAULT     l   ALTER TABLE ONLY public.employees ALTER COLUMN id SET DEFAULT nextval('public.employees_id_seq'::regclass);
 ;   ALTER TABLE public.employees ALTER COLUMN id DROP DEFAULT;
       public          admin    false    219    218    219            �           2604    17096    familystatuses id    DEFAULT     v   ALTER TABLE ONLY public.familystatuses ALTER COLUMN id SET DEFAULT nextval('public.familystatuses_id_seq'::regclass);
 @   ALTER TABLE public.familystatuses ALTER COLUMN id DROP DEFAULT;
       public          admin    false    215    214    215            �           2604    17088    healthstatuses id    DEFAULT     v   ALTER TABLE ONLY public.healthstatuses ALTER COLUMN id SET DEFAULT nextval('public.healthstatuses_id_seq'::regclass);
 @   ALTER TABLE public.healthstatuses ALTER COLUMN id DROP DEFAULT;
       public          admin    false    212    213    213            �           2604    17204    materialhistory id    DEFAULT     x   ALTER TABLE ONLY public.materialhistory ALTER COLUMN id SET DEFAULT nextval('public.materialhistory_id_seq'::regclass);
 A   ALTER TABLE public.materialhistory ALTER COLUMN id DROP DEFAULT;
       public          admin    false    232    233    233            �           2604    17167    materials id    DEFAULT     l   ALTER TABLE ONLY public.materials ALTER COLUMN id SET DEFAULT nextval('public.materials_id_seq'::regclass);
 ;   ALTER TABLE public.materials ALTER COLUMN id DROP DEFAULT;
       public          admin    false    226    227    227            �           2604    17151    materialtypes id    DEFAULT     t   ALTER TABLE ONLY public.materialtypes ALTER COLUMN id SET DEFAULT nextval('public.materialtypes_id_seq'::regclass);
 ?   ALTER TABLE public.materialtypes ALTER COLUMN id DROP DEFAULT;
       public          admin    false    223    222    223            �           2604    17196    operationtype id    DEFAULT     t   ALTER TABLE ONLY public.operationtype ALTER COLUMN id SET DEFAULT nextval('public.operationtype_id_seq'::regclass);
 ?   ALTER TABLE public.operationtype ALTER COLUMN id DROP DEFAULT;
       public          admin    false    230    231    231            �           2604    17070    partner_products id    DEFAULT     z   ALTER TABLE ONLY public.partner_products ALTER COLUMN id SET DEFAULT nextval('public.partner_products_id_seq'::regclass);
 B   ALTER TABLE public.partner_products ALTER COLUMN id DROP DEFAULT;
       public          admin    false    210    211    211            �           2604    17057    partners id    DEFAULT     j   ALTER TABLE ONLY public.partners ALTER COLUMN id SET DEFAULT nextval('public.partners_id_seq'::regclass);
 :   ALTER TABLE public.partners ALTER COLUMN id DROP DEFAULT;
       public          admin    false    208    209    209            �           2604    17028    products id    DEFAULT     j   ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);
 :   ALTER TABLE public.products ALTER COLUMN id DROP DEFAULT;
       public          admin    false    203    202    203            �           2604    17020    producttypes id    DEFAULT     r   ALTER TABLE ONLY public.producttypes ALTER COLUMN id SET DEFAULT nextval('public.producttypes_id_seq'::regclass);
 >   ALTER TABLE public.producttypes ALTER COLUMN id DROP DEFAULT;
       public          admin    false    201    200    201            �           2604    17104    roles id    DEFAULT     d   ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);
 7   ALTER TABLE public.roles ALTER COLUMN id DROP DEFAULT;
       public          admin    false    216    217    217            �           2604    17041    saleslocations id    DEFAULT     v   ALTER TABLE ONLY public.saleslocations ALTER COLUMN id SET DEFAULT nextval('public.saleslocations_id_seq'::regclass);
 @   ALTER TABLE public.saleslocations ALTER COLUMN id DROP DEFAULT;
       public          admin    false    204    205    205            �           2604    17159    unittypes id    DEFAULT     l   ALTER TABLE ONLY public.unittypes ALTER COLUMN id SET DEFAULT nextval('public.unittypes_id_seq'::regclass);
 ;   ALTER TABLE public.unittypes ALTER COLUMN id DROP DEFAULT;
       public          admin    false    224    225    225            �           2604    17188    warehouses id    DEFAULT     n   ALTER TABLE ONLY public.warehouses ALTER COLUMN id SET DEFAULT nextval('public.warehouses_id_seq'::regclass);
 <   ALTER TABLE public.warehouses ALTER COLUMN id DROP DEFAULT;
       public          admin    false    228    229    229            u          0    17135    accessrecords 
   TABLE DATA           O   COPY public.accessrecords (id, entry_time, exit_time, employee_id) FROM stdin;
    public          admin    false    221   ��       g          0    17046    companytype 
   TABLE DATA           7   COPY public.companytype (id, company_type) FROM stdin;
    public          admin    false    207   �       s          0    17109 	   employees 
   TABLE DATA           {   COPY public.employees (id, employee_name, passport, bank_account, family_status_id, health_status_id, role_id) FROM stdin;
    public          admin    false    219   P�       o          0    17093    familystatuses 
   TABLE DATA           4   COPY public.familystatuses (id, status) FROM stdin;
    public          admin    false    215   m�       m          0    17085    healthstatuses 
   TABLE DATA           4   COPY public.healthstatuses (id, status) FROM stdin;
    public          admin    false    213   ��       �          0    17201    materialhistory 
   TABLE DATA           u   COPY public.materialhistory (id, material_id, operation_date, operation_type_id, quantity, warehouse_id) FROM stdin;
    public          admin    false    233   ��       {          0    17164 	   materials 
   TABLE DATA           �   COPY public.materials (id, material_type_id, material_name, package_quantity, unit_id, description, material_cost, stock_quantity, min_quantity) FROM stdin;
    public          admin    false    227   Ğ       w          0    17148    materialtypes 
   TABLE DATA           F   COPY public.materialtypes (id, type_name, defect_percent) FROM stdin;
    public          admin    false    223   �                 0    17193    operationtype 
   TABLE DATA           ;   COPY public.operationtype (id, operation_type) FROM stdin;
    public          admin    false    231   F�       k          0    17067    partner_products 
   TABLE DATA           [   COPY public.partner_products (id, partner_id, product_id, quantity, sale_date) FROM stdin;
    public          admin    false    211   c�       i          0    17054    partners 
   TABLE DATA           v   COPY public.partners (id, type_id, company_name, legal_address, inn, director_name, phone, email, rating) FROM stdin;
    public          admin    false    209   �       c          0    17025    products 
   TABLE DATA           ]   COPY public.products (id, product_type_id, product_name, scu, min_partner_price) FROM stdin;
    public          admin    false    203   ��       a          0    17017    producttypes 
   TABLE DATA           B   COPY public.producttypes (id, type_name, coefficient) FROM stdin;
    public          admin    false    201   ��       q          0    17101    roles 
   TABLE DATA           .   COPY public.roles (id, role_name) FROM stdin;
    public          admin    false    217   D�       e          0    17038    saleslocations 
   TABLE DATA           ;   COPY public.saleslocations (id, location_name) FROM stdin;
    public          admin    false    205   a�       y          0    17156 	   unittypes 
   TABLE DATA           2   COPY public.unittypes (id, unit_name) FROM stdin;
    public          admin    false    225   ~�       }          0    17185 
   warehouses 
   TABLE DATA           8   COPY public.warehouses (id, warehouse_name) FROM stdin;
    public          admin    false    229   ��       �           0    0    accessrecords_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.accessrecords_id_seq', 1, false);
          public          admin    false    220            �           0    0    companytype_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.companytype_id_seq', 4, true);
          public          admin    false    206            �           0    0    employees_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.employees_id_seq', 1, false);
          public          admin    false    218            �           0    0    familystatuses_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.familystatuses_id_seq', 1, false);
          public          admin    false    214            �           0    0    healthstatuses_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.healthstatuses_id_seq', 1, false);
          public          admin    false    212            �           0    0    materialhistory_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.materialhistory_id_seq', 1, false);
          public          admin    false    232            �           0    0    materials_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.materials_id_seq', 1, false);
          public          admin    false    226            �           0    0    materialtypes_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.materialtypes_id_seq', 5, true);
          public          admin    false    222            �           0    0    operationtype_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.operationtype_id_seq', 1, false);
          public          admin    false    230            �           0    0    partner_products_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.partner_products_id_seq', 16, true);
          public          admin    false    210            �           0    0    partners_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.partners_id_seq', 5, true);
          public          admin    false    208            �           0    0    products_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.products_id_seq', 6, true);
          public          admin    false    202            �           0    0    producttypes_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.producttypes_id_seq', 4, true);
          public          admin    false    200            �           0    0    roles_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.roles_id_seq', 1, false);
          public          admin    false    216            �           0    0    saleslocations_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.saleslocations_id_seq', 1, false);
          public          admin    false    204            �           0    0    unittypes_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.unittypes_id_seq', 1, false);
          public          admin    false    224            �           0    0    warehouses_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.warehouses_id_seq', 1, false);
          public          admin    false    228            �           2606    17140     accessrecords accessrecords_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.accessrecords
    ADD CONSTRAINT accessrecords_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.accessrecords DROP CONSTRAINT accessrecords_pkey;
       public            admin    false    221            �           2606    17051    companytype companytype_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.companytype
    ADD CONSTRAINT companytype_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.companytype DROP CONSTRAINT companytype_pkey;
       public            admin    false    207            �           2606    17117    employees employees_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.employees DROP CONSTRAINT employees_pkey;
       public            admin    false    219            �           2606    17098 "   familystatuses familystatuses_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.familystatuses
    ADD CONSTRAINT familystatuses_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.familystatuses DROP CONSTRAINT familystatuses_pkey;
       public            admin    false    215            �           2606    17090 "   healthstatuses healthstatuses_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.healthstatuses
    ADD CONSTRAINT healthstatuses_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.healthstatuses DROP CONSTRAINT healthstatuses_pkey;
       public            admin    false    213            �           2606    17206 $   materialhistory materialhistory_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.materialhistory
    ADD CONSTRAINT materialhistory_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.materialhistory DROP CONSTRAINT materialhistory_pkey;
       public            admin    false    233            �           2606    17172    materials materials_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.materials
    ADD CONSTRAINT materials_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.materials DROP CONSTRAINT materials_pkey;
       public            admin    false    227            �           2606    17153     materialtypes materialtypes_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.materialtypes
    ADD CONSTRAINT materialtypes_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.materialtypes DROP CONSTRAINT materialtypes_pkey;
       public            admin    false    223            �           2606    17198     operationtype operationtype_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.operationtype
    ADD CONSTRAINT operationtype_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.operationtype DROP CONSTRAINT operationtype_pkey;
       public            admin    false    231            �           2606    17072 &   partner_products partner_products_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.partner_products
    ADD CONSTRAINT partner_products_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.partner_products DROP CONSTRAINT partner_products_pkey;
       public            admin    false    211            �           2606    17059    partners partners_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.partners
    ADD CONSTRAINT partners_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.partners DROP CONSTRAINT partners_pkey;
       public            admin    false    209            �           2606    17030    products products_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.products DROP CONSTRAINT products_pkey;
       public            admin    false    203            �           2606    17022    producttypes producttypes_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.producttypes
    ADD CONSTRAINT producttypes_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.producttypes DROP CONSTRAINT producttypes_pkey;
       public            admin    false    201            �           2606    17106    roles roles_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.roles DROP CONSTRAINT roles_pkey;
       public            admin    false    217            �           2606    17043 "   saleslocations saleslocations_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.saleslocations
    ADD CONSTRAINT saleslocations_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.saleslocations DROP CONSTRAINT saleslocations_pkey;
       public            admin    false    205            �           2606    17161    unittypes unittypes_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.unittypes
    ADD CONSTRAINT unittypes_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.unittypes DROP CONSTRAINT unittypes_pkey;
       public            admin    false    225            �           2606    17190    warehouses warehouses_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.warehouses
    ADD CONSTRAINT warehouses_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.warehouses DROP CONSTRAINT warehouses_pkey;
       public            admin    false    229            �           2606    17141 ,   accessrecords accessrecords_employee_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.accessrecords
    ADD CONSTRAINT accessrecords_employee_id_fkey FOREIGN KEY (employee_id) REFERENCES public.employees(id);
 V   ALTER TABLE ONLY public.accessrecords DROP CONSTRAINT accessrecords_employee_id_fkey;
       public          admin    false    3010    221    219            �           2606    17118 )   employees employees_family_status_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_family_status_id_fkey FOREIGN KEY (family_status_id) REFERENCES public.familystatuses(id);
 S   ALTER TABLE ONLY public.employees DROP CONSTRAINT employees_family_status_id_fkey;
       public          admin    false    3006    215    219            �           2606    17123 )   employees employees_health_status_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_health_status_id_fkey FOREIGN KEY (health_status_id) REFERENCES public.healthstatuses(id);
 S   ALTER TABLE ONLY public.employees DROP CONSTRAINT employees_health_status_id_fkey;
       public          admin    false    213    219    3004            �           2606    17128     employees employees_role_id_fkey    FK CONSTRAINT        ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_role_id_fkey FOREIGN KEY (role_id) REFERENCES public.roles(id);
 J   ALTER TABLE ONLY public.employees DROP CONSTRAINT employees_role_id_fkey;
       public          admin    false    3008    217    219            �           2606    17207 0   materialhistory materialhistory_material_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.materialhistory
    ADD CONSTRAINT materialhistory_material_id_fkey FOREIGN KEY (material_id) REFERENCES public.materials(id);
 Z   ALTER TABLE ONLY public.materialhistory DROP CONSTRAINT materialhistory_material_id_fkey;
       public          admin    false    233    3018    227            �           2606    17212 6   materialhistory materialhistory_operation_type_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.materialhistory
    ADD CONSTRAINT materialhistory_operation_type_id_fkey FOREIGN KEY (operation_type_id) REFERENCES public.operationtype(id);
 `   ALTER TABLE ONLY public.materialhistory DROP CONSTRAINT materialhistory_operation_type_id_fkey;
       public          admin    false    233    3022    231            �           2606    17217 1   materialhistory materialhistory_warehouse_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.materialhistory
    ADD CONSTRAINT materialhistory_warehouse_id_fkey FOREIGN KEY (warehouse_id) REFERENCES public.warehouses(id);
 [   ALTER TABLE ONLY public.materialhistory DROP CONSTRAINT materialhistory_warehouse_id_fkey;
       public          admin    false    3020    229    233            �           2606    17173 )   materials materials_material_type_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.materials
    ADD CONSTRAINT materials_material_type_id_fkey FOREIGN KEY (material_type_id) REFERENCES public.materialtypes(id);
 S   ALTER TABLE ONLY public.materials DROP CONSTRAINT materials_material_type_id_fkey;
       public          admin    false    3014    223    227            �           2606    17178     materials materials_unit_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.materials
    ADD CONSTRAINT materials_unit_id_fkey FOREIGN KEY (unit_id) REFERENCES public.unittypes(id);
 J   ALTER TABLE ONLY public.materials DROP CONSTRAINT materials_unit_id_fkey;
       public          admin    false    3016    225    227            �           2606    17073 1   partner_products partner_products_partner_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.partner_products
    ADD CONSTRAINT partner_products_partner_id_fkey FOREIGN KEY (partner_id) REFERENCES public.partners(id);
 [   ALTER TABLE ONLY public.partner_products DROP CONSTRAINT partner_products_partner_id_fkey;
       public          admin    false    209    211    3000            �           2606    17078 1   partner_products partner_products_product_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.partner_products
    ADD CONSTRAINT partner_products_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(id);
 [   ALTER TABLE ONLY public.partner_products DROP CONSTRAINT partner_products_product_id_fkey;
       public          admin    false    2994    211    203            �           2606    17060    partners partners_type_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.partners
    ADD CONSTRAINT partners_type_id_fkey FOREIGN KEY (type_id) REFERENCES public.companytype(id);
 H   ALTER TABLE ONLY public.partners DROP CONSTRAINT partners_type_id_fkey;
       public          admin    false    207    209    2998            �           2606    17031 &   products products_product_type_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_product_type_id_fkey FOREIGN KEY (product_type_id) REFERENCES public.producttypes(id);
 P   ALTER TABLE ONLY public.products DROP CONSTRAINT products_product_type_id_fkey;
       public          admin    false    2992    203    201            u      x������ � �      g   (   x�3�0��8/�3�9/�3L@ ����� ���      s      x������ � �      o      x������ � �      m      x������ � �      �      x������ � �      {      x������ � �      w   U   x�3估��.칰�bӅ���v_ؠ`�i�g�e�G�P��)�1%�@%F\&x�� ���r��Qb
Tbl����� �a8            x������ � �      k   �   x�U�K�0C�p:��ܥ�?G����x#$C0��]£�7��A�	��%#�R��6�Ӽ�M	�S�I{hQ,��^��}���2O��[��m�2�,Bw�<X�bK጖R�׫�+��?�(��s�0^*3�??�v�������5K��4J�t�+�jʻߏ�� ��;�      i   \  x���MnA���)� M��̎�d3Qfa�ȬV䅑bG�%Nl_ �����o�W=���	�鮪��jM���g��3ŷaNx��0�WaJmo�4��/���<���g�;^a9F�a���!�?���YS�S^�E���%���'��y�;�g���g�-}\�f�O��
as7U�eVic��ݡ��8�7����{�2�=j�Q�a�_��4]��2��`]���>�����B�E�|#��%?K��?�{rJ_���T:�6Qs���Y���v�P㌲�Q}[uR*���Ѡ_v��%C�;QH:��1�4ʹ�B}@.T䄨��^c������E���i49��ˬG38Y�I��T�h�c%x�P�)F̢���j��QIByo�?�E��jFG��&�jO/�9�]D��B�٬-�W8���E������B�%)�M�5i|p.��_u�]�'��)^4�ڋ̳誘��8�΁�(���T�bp��[e�]l��7��̫u~F/�d�����Ƚ��on��9�o4Zm�op����C�{��.��;�<B���D|�����b��Z��cy��z!�:i�j5�?�9��      c   $  x�u�MN�0���)|���w�0IA��H,ذo�j�O�0��NT�D9r�=�/3V�0z�>�t��W4b�$hGS�P�m�I4浀�h����&�F���N�>�UV�4��]0�1kݵ�\�<�%���s����w�=8�����bL�T�E�^������42Fn�b�ȁ�պ:�vhf��F�m��g� ����9�{�蠙�1Jc���\���9J��
5	��w�i����60b#��n���S��D��}�u�A����Q�cA��=
����Figs�5�E~#9�?��(�      a   u   x�e���0�wUP�I�v7|�H �a	��ia�#V��:������|Q|��b�^�2M>�o���aG#8Q$[�/#I��.%�I%*o��_�Ï�����,�`�zo�Q�      q      x������ � �      e      x������ � �      y      x������ � �      }      x������ � �     