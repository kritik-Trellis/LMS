PGDMP     0    $                x            lms    12.2    12.2 �               0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    16394    lms    DATABASE     �   CREATE DATABASE lms WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'English_United States.1252' LC_CTYPE = 'English_United States.1252';
    DROP DATABASE lms;
                postgres    false            �            1259    16610    accounts_bank    TABLE     %  CREATE TABLE public.accounts_bank (
    id integer NOT NULL,
    name character varying(125),
    account character varying(30),
    branch character varying(125),
    salary numeric(16,2),
    created timestamp with time zone,
    updated timestamp with time zone,
    employee_id integer
);
 !   DROP TABLE public.accounts_bank;
       public         heap    postgres    false            �            1259    16608    accounts_bank_id_seq    SEQUENCE     �   CREATE SEQUENCE public.accounts_bank_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.accounts_bank_id_seq;
       public          postgres    false    221                       0    0    accounts_bank_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.accounts_bank_id_seq OWNED BY public.accounts_bank.id;
          public          postgres    false    220            �            1259    16618    accounts_department    TABLE     �   CREATE TABLE public.accounts_department (
    id integer NOT NULL,
    name character varying(125) NOT NULL,
    description character varying(125),
    created timestamp with time zone NOT NULL,
    updated timestamp with time zone NOT NULL
);
 '   DROP TABLE public.accounts_department;
       public         heap    postgres    false            �            1259    16616    accounts_department_id_seq    SEQUENCE     �   CREATE SEQUENCE public.accounts_department_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.accounts_department_id_seq;
       public          postgres    false    223                       0    0    accounts_department_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.accounts_department_id_seq OWNED BY public.accounts_department.id;
          public          postgres    false    222            �            1259    16626    accounts_emergency    TABLE     C  CREATE TABLE public.accounts_emergency (
    id integer NOT NULL,
    fullname character varying(255),
    tel character varying(128) NOT NULL,
    location character varying(125),
    relationship character varying(8),
    created timestamp with time zone,
    updated timestamp with time zone,
    employee_id integer
);
 &   DROP TABLE public.accounts_emergency;
       public         heap    postgres    false            �            1259    16624    accounts_emergency_id_seq    SEQUENCE     �   CREATE SEQUENCE public.accounts_emergency_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.accounts_emergency_id_seq;
       public          postgres    false    225                       0    0    accounts_emergency_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.accounts_emergency_id_seq OWNED BY public.accounts_emergency.id;
          public          postgres    false    224            �            1259    16637    accounts_employee    TABLE     4  CREATE TABLE public.accounts_employee (
    id integer NOT NULL,
    title character varying(4),
    image character varying(100),
    firstname character varying(125) NOT NULL,
    lastname character varying(125) NOT NULL,
    othername character varying(125),
    sex character varying(8) NOT NULL,
    email character varying(255),
    tel character varying(128) NOT NULL,
    bio character varying(255),
    birthday date NOT NULL,
    hometown character varying(125),
    residence character varying(125) NOT NULL,
    address character varying(125),
    education character varying(40),
    lastwork character varying(125),
    "position" character varying(255),
    startdate date,
    employeetype character varying(15),
    employeeid character varying(10),
    dateissued date,
    is_blocked boolean NOT NULL,
    is_deleted boolean NOT NULL,
    created timestamp with time zone,
    updated timestamp with time zone,
    department_id integer,
    role_id integer,
    user_id integer NOT NULL,
    reporting_to_id integer,
    planned_5_days boolean NOT NULL
);
 %   DROP TABLE public.accounts_employee;
       public         heap    postgres    false            �            1259    16635    accounts_employee_id_seq    SEQUENCE     �   CREATE SEQUENCE public.accounts_employee_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.accounts_employee_id_seq;
       public          postgres    false    227                       0    0    accounts_employee_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.accounts_employee_id_seq OWNED BY public.accounts_employee.id;
          public          postgres    false    226            �            1259    16595    accounts_leave    TABLE     �  CREATE TABLE public.accounts_leave (
    id integer NOT NULL,
    startdate date,
    enddate date,
    leavetype character varying(25),
    reason character varying(255) NOT NULL,
    status character varying(12) NOT NULL,
    is_approved boolean NOT NULL,
    updated timestamp with time zone NOT NULL,
    created timestamp with time zone NOT NULL,
    user_id integer NOT NULL,
    defaultdays_casual integer,
    defaultdays_planned integer,
    defaultdays_sick integer,
    CONSTRAINT accounts_leave_defaultdays_casual_check CHECK ((defaultdays_casual >= 0)),
    CONSTRAINT accounts_leave_defaultdays_planned_check CHECK ((defaultdays_planned >= 0)),
    CONSTRAINT accounts_leave_defaultdays_sick_check CHECK ((defaultdays_sick >= 0))
);
 "   DROP TABLE public.accounts_leave;
       public         heap    postgres    false            �            1259    16593    accounts_leave_id_seq    SEQUENCE     �   CREATE SEQUENCE public.accounts_leave_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.accounts_leave_id_seq;
       public          postgres    false    219                       0    0    accounts_leave_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.accounts_leave_id_seq OWNED BY public.accounts_leave.id;
          public          postgres    false    218            �            1259    16739    accounts_mailinggroup    TABLE     �   CREATE TABLE public.accounts_mailinggroup (
    id integer NOT NULL,
    group_name character varying(30) NOT NULL,
    group_mail character varying(255) NOT NULL,
    is_active boolean NOT NULL
);
 )   DROP TABLE public.accounts_mailinggroup;
       public         heap    postgres    false            �            1259    16737    accounts_mailinggroup_id_seq    SEQUENCE     �   CREATE SEQUENCE public.accounts_mailinggroup_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.accounts_mailinggroup_id_seq;
       public          postgres    false    237                       0    0    accounts_mailinggroup_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.accounts_mailinggroup_id_seq OWNED BY public.accounts_mailinggroup.id;
          public          postgres    false    236            �            1259    16648    accounts_nationality    TABLE     �   CREATE TABLE public.accounts_nationality (
    id integer NOT NULL,
    name character varying(125) NOT NULL,
    flag character varying(100),
    created timestamp with time zone NOT NULL,
    updated timestamp with time zone NOT NULL
);
 (   DROP TABLE public.accounts_nationality;
       public         heap    postgres    false            �            1259    16646    accounts_nationality_id_seq    SEQUENCE     �   CREATE SEQUENCE public.accounts_nationality_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.accounts_nationality_id_seq;
       public          postgres    false    229                       0    0    accounts_nationality_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.accounts_nationality_id_seq OWNED BY public.accounts_nationality.id;
          public          postgres    false    228            �            1259    16656    accounts_relationship    TABLE     �  CREATE TABLE public.accounts_relationship (
    id integer NOT NULL,
    status character varying(10),
    spouse character varying(255),
    occupation character varying(125),
    tel character varying(128),
    children integer,
    nextofkin character varying(255),
    contact character varying(128),
    relationship character varying(15),
    father character varying(255),
    foccupation character varying(125),
    mother character varying(255),
    moccupation character varying(125),
    created timestamp with time zone,
    updated timestamp with time zone,
    employee_id integer,
    CONSTRAINT accounts_relationship_children_check CHECK ((children >= 0))
);
 )   DROP TABLE public.accounts_relationship;
       public         heap    postgres    false            �            1259    16654    accounts_relationship_id_seq    SEQUENCE     �   CREATE SEQUENCE public.accounts_relationship_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.accounts_relationship_id_seq;
       public          postgres    false    231                       0    0    accounts_relationship_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.accounts_relationship_id_seq OWNED BY public.accounts_relationship.id;
          public          postgres    false    230            �            1259    16668    accounts_religion    TABLE     �   CREATE TABLE public.accounts_religion (
    id integer NOT NULL,
    name character varying(125) NOT NULL,
    description character varying(125),
    created timestamp with time zone NOT NULL,
    updated timestamp with time zone NOT NULL
);
 %   DROP TABLE public.accounts_religion;
       public         heap    postgres    false            �            1259    16666    accounts_religion_id_seq    SEQUENCE     �   CREATE SEQUENCE public.accounts_religion_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.accounts_religion_id_seq;
       public          postgres    false    233                       0    0    accounts_religion_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.accounts_religion_id_seq OWNED BY public.accounts_religion.id;
          public          postgres    false    232            �            1259    16676    accounts_role    TABLE     �   CREATE TABLE public.accounts_role (
    id integer NOT NULL,
    name character varying(125) NOT NULL,
    description character varying(125),
    created timestamp with time zone NOT NULL,
    updated timestamp with time zone NOT NULL
);
 !   DROP TABLE public.accounts_role;
       public         heap    postgres    false            �            1259    16674    accounts_role_id_seq    SEQUENCE     �   CREATE SEQUENCE public.accounts_role_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.accounts_role_id_seq;
       public          postgres    false    235                       0    0    accounts_role_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.accounts_role_id_seq OWNED BY public.accounts_role.id;
          public          postgres    false    234            �            1259    16426 
   auth_group    TABLE     e   CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);
    DROP TABLE public.auth_group;
       public         heap    postgres    false            �            1259    16424    auth_group_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.auth_group_id_seq;
       public          postgres    false    209                       0    0    auth_group_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;
          public          postgres    false    208            �            1259    16436    auth_group_permissions    TABLE     �   CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);
 *   DROP TABLE public.auth_group_permissions;
       public         heap    postgres    false            �            1259    16434    auth_group_permissions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.auth_group_permissions_id_seq;
       public          postgres    false    211                        0    0    auth_group_permissions_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;
          public          postgres    false    210            �            1259    16418    auth_permission    TABLE     �   CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);
 #   DROP TABLE public.auth_permission;
       public         heap    postgres    false            �            1259    16416    auth_permission_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.auth_permission_id_seq;
       public          postgres    false    207            !           0    0    auth_permission_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;
          public          postgres    false    206            �            1259    16444 	   auth_user    TABLE     �  CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);
    DROP TABLE public.auth_user;
       public         heap    postgres    false            �            1259    16454    auth_user_groups    TABLE        CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);
 $   DROP TABLE public.auth_user_groups;
       public         heap    postgres    false            �            1259    16452    auth_user_groups_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.auth_user_groups_id_seq;
       public          postgres    false    215            "           0    0    auth_user_groups_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;
          public          postgres    false    214            �            1259    16442    auth_user_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.auth_user_id_seq;
       public          postgres    false    213            #           0    0    auth_user_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;
          public          postgres    false    212            �            1259    16462    auth_user_user_permissions    TABLE     �   CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);
 .   DROP TABLE public.auth_user_user_permissions;
       public         heap    postgres    false            �            1259    16460 !   auth_user_user_permissions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.auth_user_user_permissions_id_seq;
       public          postgres    false    217            $           0    0 !   auth_user_user_permissions_id_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;
          public          postgres    false    216            �            1259    16773    django_admin_log    TABLE     �  CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);
 $   DROP TABLE public.django_admin_log;
       public         heap    postgres    false            �            1259    16771    django_admin_log_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.django_admin_log_id_seq;
       public          postgres    false    239            %           0    0    django_admin_log_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;
          public          postgres    false    238            �            1259    16408    django_content_type    TABLE     �   CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);
 '   DROP TABLE public.django_content_type;
       public         heap    postgres    false            �            1259    16406    django_content_type_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.django_content_type_id_seq;
       public          postgres    false    205            &           0    0    django_content_type_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;
          public          postgres    false    204            �            1259    16397    django_migrations    TABLE     �   CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);
 %   DROP TABLE public.django_migrations;
       public         heap    postgres    false            �            1259    16395    django_migrations_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.django_migrations_id_seq;
       public          postgres    false    203            '           0    0    django_migrations_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;
          public          postgres    false    202            �            1259    16801    django_session    TABLE     �   CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);
 "   DROP TABLE public.django_session;
       public         heap    postgres    false                       2604    16613    accounts_bank id    DEFAULT     t   ALTER TABLE ONLY public.accounts_bank ALTER COLUMN id SET DEFAULT nextval('public.accounts_bank_id_seq'::regclass);
 ?   ALTER TABLE public.accounts_bank ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    220    221    221                       2604    16621    accounts_department id    DEFAULT     �   ALTER TABLE ONLY public.accounts_department ALTER COLUMN id SET DEFAULT nextval('public.accounts_department_id_seq'::regclass);
 E   ALTER TABLE public.accounts_department ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    223    222    223                       2604    16629    accounts_emergency id    DEFAULT     ~   ALTER TABLE ONLY public.accounts_emergency ALTER COLUMN id SET DEFAULT nextval('public.accounts_emergency_id_seq'::regclass);
 D   ALTER TABLE public.accounts_emergency ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    225    224    225                       2604    16640    accounts_employee id    DEFAULT     |   ALTER TABLE ONLY public.accounts_employee ALTER COLUMN id SET DEFAULT nextval('public.accounts_employee_id_seq'::regclass);
 C   ALTER TABLE public.accounts_employee ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    227    226    227            �
           2604    16598    accounts_leave id    DEFAULT     v   ALTER TABLE ONLY public.accounts_leave ALTER COLUMN id SET DEFAULT nextval('public.accounts_leave_id_seq'::regclass);
 @   ALTER TABLE public.accounts_leave ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    218    219    219                       2604    16742    accounts_mailinggroup id    DEFAULT     �   ALTER TABLE ONLY public.accounts_mailinggroup ALTER COLUMN id SET DEFAULT nextval('public.accounts_mailinggroup_id_seq'::regclass);
 G   ALTER TABLE public.accounts_mailinggroup ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    237    236    237                       2604    16651    accounts_nationality id    DEFAULT     �   ALTER TABLE ONLY public.accounts_nationality ALTER COLUMN id SET DEFAULT nextval('public.accounts_nationality_id_seq'::regclass);
 F   ALTER TABLE public.accounts_nationality ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    229    228    229                       2604    16659    accounts_relationship id    DEFAULT     �   ALTER TABLE ONLY public.accounts_relationship ALTER COLUMN id SET DEFAULT nextval('public.accounts_relationship_id_seq'::regclass);
 G   ALTER TABLE public.accounts_relationship ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    231    230    231            	           2604    16671    accounts_religion id    DEFAULT     |   ALTER TABLE ONLY public.accounts_religion ALTER COLUMN id SET DEFAULT nextval('public.accounts_religion_id_seq'::regclass);
 C   ALTER TABLE public.accounts_religion ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    232    233    233            
           2604    16679    accounts_role id    DEFAULT     t   ALTER TABLE ONLY public.accounts_role ALTER COLUMN id SET DEFAULT nextval('public.accounts_role_id_seq'::regclass);
 ?   ALTER TABLE public.accounts_role ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    234    235    235            �
           2604    16429    auth_group id    DEFAULT     n   ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);
 <   ALTER TABLE public.auth_group ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    208    209    209            �
           2604    16439    auth_group_permissions id    DEFAULT     �   ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);
 H   ALTER TABLE public.auth_group_permissions ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    210    211    211            �
           2604    16421    auth_permission id    DEFAULT     x   ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);
 A   ALTER TABLE public.auth_permission ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    207    206    207            �
           2604    16447    auth_user id    DEFAULT     l   ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);
 ;   ALTER TABLE public.auth_user ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    212    213    213            �
           2604    16457    auth_user_groups id    DEFAULT     z   ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);
 B   ALTER TABLE public.auth_user_groups ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    215    214    215            �
           2604    16465    auth_user_user_permissions id    DEFAULT     �   ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);
 L   ALTER TABLE public.auth_user_user_permissions ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    217    216    217                       2604    16776    django_admin_log id    DEFAULT     z   ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);
 B   ALTER TABLE public.django_admin_log ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    238    239    239            �
           2604    16411    django_content_type id    DEFAULT     �   ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);
 E   ALTER TABLE public.django_content_type ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    205    204    205            �
           2604    16400    django_migrations id    DEFAULT     |   ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);
 C   ALTER TABLE public.django_migrations ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    203    202    203            �          0    16610    accounts_bank 
   TABLE DATA           i   COPY public.accounts_bank (id, name, account, branch, salary, created, updated, employee_id) FROM stdin;
    public          postgres    false    221   ��       �          0    16618    accounts_department 
   TABLE DATA           V   COPY public.accounts_department (id, name, description, created, updated) FROM stdin;
    public          postgres    false    223   �       �          0    16626    accounts_emergency 
   TABLE DATA           v   COPY public.accounts_emergency (id, fullname, tel, location, relationship, created, updated, employee_id) FROM stdin;
    public          postgres    false    225   ��                 0    16637    accounts_employee 
   TABLE DATA           Y  COPY public.accounts_employee (id, title, image, firstname, lastname, othername, sex, email, tel, bio, birthday, hometown, residence, address, education, lastwork, "position", startdate, employeetype, employeeid, dateissued, is_blocked, is_deleted, created, updated, department_id, role_id, user_id, reporting_to_id, planned_5_days) FROM stdin;
    public          postgres    false    227   ��       �          0    16595    accounts_leave 
   TABLE DATA           �   COPY public.accounts_leave (id, startdate, enddate, leavetype, reason, status, is_approved, updated, created, user_id, defaultdays_casual, defaultdays_planned, defaultdays_sick) FROM stdin;
    public          postgres    false    219   U                0    16739    accounts_mailinggroup 
   TABLE DATA           V   COPY public.accounts_mailinggroup (id, group_name, group_mail, is_active) FROM stdin;
    public          postgres    false    237   �                0    16648    accounts_nationality 
   TABLE DATA           P   COPY public.accounts_nationality (id, name, flag, created, updated) FROM stdin;
    public          postgres    false    229   �                0    16656    accounts_relationship 
   TABLE DATA           �   COPY public.accounts_relationship (id, status, spouse, occupation, tel, children, nextofkin, contact, relationship, father, foccupation, mother, moccupation, created, updated, employee_id) FROM stdin;
    public          postgres    false    231                   0    16668    accounts_religion 
   TABLE DATA           T   COPY public.accounts_religion (id, name, description, created, updated) FROM stdin;
    public          postgres    false    233   )      	          0    16676    accounts_role 
   TABLE DATA           P   COPY public.accounts_role (id, name, description, created, updated) FROM stdin;
    public          postgres    false    235   F      �          0    16426 
   auth_group 
   TABLE DATA           .   COPY public.auth_group (id, name) FROM stdin;
    public          postgres    false    209   �      �          0    16436    auth_group_permissions 
   TABLE DATA           M   COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
    public          postgres    false    211   +      �          0    16418    auth_permission 
   TABLE DATA           N   COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
    public          postgres    false    207   H      �          0    16444 	   auth_user 
   TABLE DATA           �   COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
    public          postgres    false    213   �      �          0    16454    auth_user_groups 
   TABLE DATA           A   COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
    public          postgres    false    215   �      �          0    16462    auth_user_user_permissions 
   TABLE DATA           P   COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
    public          postgres    false    217   	                0    16773    django_admin_log 
   TABLE DATA           �   COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
    public          postgres    false    239    	      �          0    16408    django_content_type 
   TABLE DATA           C   COPY public.django_content_type (id, app_label, model) FROM stdin;
    public          postgres    false    205   l      �          0    16397    django_migrations 
   TABLE DATA           C   COPY public.django_migrations (id, app, name, applied) FROM stdin;
    public          postgres    false    203   (                0    16801    django_session 
   TABLE DATA           P   COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
    public          postgres    false    240         (           0    0    accounts_bank_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.accounts_bank_id_seq', 1, false);
          public          postgres    false    220            )           0    0    accounts_department_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.accounts_department_id_seq', 2, true);
          public          postgres    false    222            *           0    0    accounts_emergency_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.accounts_emergency_id_seq', 1, false);
          public          postgres    false    224            +           0    0    accounts_employee_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.accounts_employee_id_seq', 5, true);
          public          postgres    false    226            ,           0    0    accounts_leave_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.accounts_leave_id_seq', 25, true);
          public          postgres    false    218            -           0    0    accounts_mailinggroup_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.accounts_mailinggroup_id_seq', 1, false);
          public          postgres    false    236            .           0    0    accounts_nationality_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.accounts_nationality_id_seq', 1, false);
          public          postgres    false    228            /           0    0    accounts_relationship_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.accounts_relationship_id_seq', 1, false);
          public          postgres    false    230            0           0    0    accounts_religion_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.accounts_religion_id_seq', 1, false);
          public          postgres    false    232            1           0    0    accounts_role_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.accounts_role_id_seq', 4, true);
          public          postgres    false    234            2           0    0    auth_group_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.auth_group_id_seq', 4, true);
          public          postgres    false    208            3           0    0    auth_group_permissions_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);
          public          postgres    false    210            4           0    0    auth_permission_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.auth_permission_id_seq', 64, true);
          public          postgres    false    206            5           0    0    auth_user_groups_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 6, true);
          public          postgres    false    214            6           0    0    auth_user_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.auth_user_id_seq', 5, true);
          public          postgres    false    212            7           0    0 !   auth_user_user_permissions_id_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);
          public          postgres    false    216            8           0    0    django_admin_log_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.django_admin_log_id_seq', 41, true);
          public          postgres    false    238            9           0    0    django_content_type_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.django_content_type_id_seq', 16, true);
          public          postgres    false    204            :           0    0    django_migrations_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.django_migrations_id_seq', 35, true);
          public          postgres    false    202            :           2606    16615     accounts_bank accounts_bank_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.accounts_bank
    ADD CONSTRAINT accounts_bank_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.accounts_bank DROP CONSTRAINT accounts_bank_pkey;
       public            postgres    false    221            <           2606    16623 ,   accounts_department accounts_department_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.accounts_department
    ADD CONSTRAINT accounts_department_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.accounts_department DROP CONSTRAINT accounts_department_pkey;
       public            postgres    false    223            ?           2606    16634 *   accounts_emergency accounts_emergency_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.accounts_emergency
    ADD CONSTRAINT accounts_emergency_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.accounts_emergency DROP CONSTRAINT accounts_emergency_pkey;
       public            postgres    false    225            B           2606    16645 (   accounts_employee accounts_employee_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.accounts_employee
    ADD CONSTRAINT accounts_employee_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.accounts_employee DROP CONSTRAINT accounts_employee_pkey;
       public            postgres    false    227            6           2606    16601 "   accounts_leave accounts_leave_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.accounts_leave
    ADD CONSTRAINT accounts_leave_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.accounts_leave DROP CONSTRAINT accounts_leave_pkey;
       public            postgres    false    219            P           2606    16744 0   accounts_mailinggroup accounts_mailinggroup_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.accounts_mailinggroup
    ADD CONSTRAINT accounts_mailinggroup_pkey PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public.accounts_mailinggroup DROP CONSTRAINT accounts_mailinggroup_pkey;
       public            postgres    false    237            G           2606    16653 .   accounts_nationality accounts_nationality_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.accounts_nationality
    ADD CONSTRAINT accounts_nationality_pkey PRIMARY KEY (id);
 X   ALTER TABLE ONLY public.accounts_nationality DROP CONSTRAINT accounts_nationality_pkey;
       public            postgres    false    229            J           2606    16665 0   accounts_relationship accounts_relationship_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.accounts_relationship
    ADD CONSTRAINT accounts_relationship_pkey PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public.accounts_relationship DROP CONSTRAINT accounts_relationship_pkey;
       public            postgres    false    231            L           2606    16673 (   accounts_religion accounts_religion_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.accounts_religion
    ADD CONSTRAINT accounts_religion_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.accounts_religion DROP CONSTRAINT accounts_religion_pkey;
       public            postgres    false    233            N           2606    16681     accounts_role accounts_role_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.accounts_role
    ADD CONSTRAINT accounts_role_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.accounts_role DROP CONSTRAINT accounts_role_pkey;
       public            postgres    false    235                       2606    16433    auth_group auth_group_name_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);
 H   ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_name_key;
       public            postgres    false    209                        2606    16488 R   auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);
 |   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq;
       public            postgres    false    211    211            #           2606    16441 2   auth_group_permissions auth_group_permissions_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_pkey;
       public            postgres    false    211                       2606    16431    auth_group auth_group_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_pkey;
       public            postgres    false    209                       2606    16474 F   auth_permission auth_permission_content_type_id_codename_01ab375a_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);
 p   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq;
       public            postgres    false    207    207                       2606    16423 $   auth_permission auth_permission_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_pkey;
       public            postgres    false    207            +           2606    16459 &   auth_user_groups auth_user_groups_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_pkey;
       public            postgres    false    215            .           2606    16503 @   auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);
 j   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq;
       public            postgres    false    215    215            %           2606    16449    auth_user auth_user_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.auth_user DROP CONSTRAINT auth_user_pkey;
       public            postgres    false    213            1           2606    16467 :   auth_user_user_permissions auth_user_user_permissions_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);
 d   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_pkey;
       public            postgres    false    217            4           2606    16517 Y   auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);
 �   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq;
       public            postgres    false    217    217            (           2606    16796     auth_user auth_user_username_key 
   CONSTRAINT     _   ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);
 J   ALTER TABLE ONLY public.auth_user DROP CONSTRAINT auth_user_username_key;
       public            postgres    false    213            S           2606    16782 &   django_admin_log django_admin_log_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_pkey;
       public            postgres    false    239                       2606    16415 E   django_content_type django_content_type_app_label_model_76bd3d3b_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);
 o   ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq;
       public            postgres    false    205    205                       2606    16413 ,   django_content_type django_content_type_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_pkey;
       public            postgres    false    205                       2606    16405 (   django_migrations django_migrations_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.django_migrations DROP CONSTRAINT django_migrations_pkey;
       public            postgres    false    203            W           2606    16808 "   django_session django_session_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);
 L   ALTER TABLE ONLY public.django_session DROP CONSTRAINT django_session_pkey;
       public            postgres    false    240            8           1259    16725 "   accounts_bank_employee_id_822fe9ab    INDEX     c   CREATE INDEX accounts_bank_employee_id_822fe9ab ON public.accounts_bank USING btree (employee_id);
 6   DROP INDEX public.accounts_bank_employee_id_822fe9ab;
       public            postgres    false    221            =           1259    16719 '   accounts_emergency_employee_id_bc4f8419    INDEX     m   CREATE INDEX accounts_emergency_employee_id_bc4f8419 ON public.accounts_emergency USING btree (employee_id);
 ;   DROP INDEX public.accounts_emergency_employee_id_bc4f8419;
       public            postgres    false    225            @           1259    16688 (   accounts_employee_department_id_28acdfd0    INDEX     o   CREATE INDEX accounts_employee_department_id_28acdfd0 ON public.accounts_employee USING btree (department_id);
 <   DROP INDEX public.accounts_employee_department_id_28acdfd0;
       public            postgres    false    227            C           1259    16731 *   accounts_employee_reporting_to_id_5b62c274    INDEX     s   CREATE INDEX accounts_employee_reporting_to_id_5b62c274 ON public.accounts_employee USING btree (reporting_to_id);
 >   DROP INDEX public.accounts_employee_reporting_to_id_5b62c274;
       public            postgres    false    227            D           1259    16707 "   accounts_employee_role_id_8f75a1e4    INDEX     c   CREATE INDEX accounts_employee_role_id_8f75a1e4 ON public.accounts_employee USING btree (role_id);
 6   DROP INDEX public.accounts_employee_role_id_8f75a1e4;
       public            postgres    false    227            E           1259    16713 "   accounts_employee_user_id_593173d8    INDEX     c   CREATE INDEX accounts_employee_user_id_593173d8 ON public.accounts_employee USING btree (user_id);
 6   DROP INDEX public.accounts_employee_user_id_593173d8;
       public            postgres    false    227            7           1259    16607    accounts_leave_user_id_2206095d    INDEX     ]   CREATE INDEX accounts_leave_user_id_2206095d ON public.accounts_leave USING btree (user_id);
 3   DROP INDEX public.accounts_leave_user_id_2206095d;
       public            postgres    false    219            H           1259    16694 *   accounts_relationship_employee_id_1b59c4aa    INDEX     s   CREATE INDEX accounts_relationship_employee_id_1b59c4aa ON public.accounts_relationship USING btree (employee_id);
 >   DROP INDEX public.accounts_relationship_employee_id_1b59c4aa;
       public            postgres    false    231                       1259    16476    auth_group_name_a6ea08ec_like    INDEX     h   CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);
 1   DROP INDEX public.auth_group_name_a6ea08ec_like;
       public            postgres    false    209                       1259    16489 (   auth_group_permissions_group_id_b120cbf9    INDEX     o   CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);
 <   DROP INDEX public.auth_group_permissions_group_id_b120cbf9;
       public            postgres    false    211            !           1259    16490 -   auth_group_permissions_permission_id_84c5c92e    INDEX     y   CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);
 A   DROP INDEX public.auth_group_permissions_permission_id_84c5c92e;
       public            postgres    false    211                       1259    16475 (   auth_permission_content_type_id_2f476e4b    INDEX     o   CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);
 <   DROP INDEX public.auth_permission_content_type_id_2f476e4b;
       public            postgres    false    207            )           1259    16505 "   auth_user_groups_group_id_97559544    INDEX     c   CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);
 6   DROP INDEX public.auth_user_groups_group_id_97559544;
       public            postgres    false    215            ,           1259    16504 !   auth_user_groups_user_id_6a12ed8b    INDEX     a   CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);
 5   DROP INDEX public.auth_user_groups_user_id_6a12ed8b;
       public            postgres    false    215            /           1259    16519 1   auth_user_user_permissions_permission_id_1fbb5f2c    INDEX     �   CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);
 E   DROP INDEX public.auth_user_user_permissions_permission_id_1fbb5f2c;
       public            postgres    false    217            2           1259    16518 +   auth_user_user_permissions_user_id_a95ead1b    INDEX     u   CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);
 ?   DROP INDEX public.auth_user_user_permissions_user_id_a95ead1b;
       public            postgres    false    217            &           1259    16797     auth_user_username_6821ab7c_like    INDEX     n   CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);
 4   DROP INDEX public.auth_user_username_6821ab7c_like;
       public            postgres    false    213            Q           1259    16793 )   django_admin_log_content_type_id_c4bce8eb    INDEX     q   CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);
 =   DROP INDEX public.django_admin_log_content_type_id_c4bce8eb;
       public            postgres    false    239            T           1259    16794 !   django_admin_log_user_id_c564eba6    INDEX     a   CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);
 5   DROP INDEX public.django_admin_log_user_id_c564eba6;
       public            postgres    false    239            U           1259    16810 #   django_session_expire_date_a5c62663    INDEX     e   CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);
 7   DROP INDEX public.django_session_expire_date_a5c62663;
       public            postgres    false    240            X           1259    16809 (   django_session_session_key_c0390e0f_like    INDEX     ~   CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);
 <   DROP INDEX public.django_session_session_key_c0390e0f_like;
       public            postgres    false    240            a           2606    16726 H   accounts_bank accounts_bank_employee_id_822fe9ab_fk_accounts_employee_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.accounts_bank
    ADD CONSTRAINT accounts_bank_employee_id_822fe9ab_fk_accounts_employee_id FOREIGN KEY (employee_id) REFERENCES public.accounts_employee(id) DEFERRABLE INITIALLY DEFERRED;
 r   ALTER TABLE ONLY public.accounts_bank DROP CONSTRAINT accounts_bank_employee_id_822fe9ab_fk_accounts_employee_id;
       public          postgres    false    221    2882    227            b           2606    16720 R   accounts_emergency accounts_emergency_employee_id_bc4f8419_fk_accounts_employee_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.accounts_emergency
    ADD CONSTRAINT accounts_emergency_employee_id_bc4f8419_fk_accounts_employee_id FOREIGN KEY (employee_id) REFERENCES public.accounts_employee(id) DEFERRABLE INITIALLY DEFERRED;
 |   ALTER TABLE ONLY public.accounts_emergency DROP CONSTRAINT accounts_emergency_employee_id_bc4f8419_fk_accounts_employee_id;
       public          postgres    false    227    225    2882            c           2606    16683 G   accounts_employee accounts_employee_department_id_28acdfd0_fk_accounts_    FK CONSTRAINT     �   ALTER TABLE ONLY public.accounts_employee
    ADD CONSTRAINT accounts_employee_department_id_28acdfd0_fk_accounts_ FOREIGN KEY (department_id) REFERENCES public.accounts_department(id) DEFERRABLE INITIALLY DEFERRED;
 q   ALTER TABLE ONLY public.accounts_employee DROP CONSTRAINT accounts_employee_department_id_28acdfd0_fk_accounts_;
       public          postgres    false    2876    227    223            f           2606    16732 I   accounts_employee accounts_employee_reporting_to_id_5b62c274_fk_accounts_    FK CONSTRAINT     �   ALTER TABLE ONLY public.accounts_employee
    ADD CONSTRAINT accounts_employee_reporting_to_id_5b62c274_fk_accounts_ FOREIGN KEY (reporting_to_id) REFERENCES public.accounts_employee(id) DEFERRABLE INITIALLY DEFERRED;
 s   ALTER TABLE ONLY public.accounts_employee DROP CONSTRAINT accounts_employee_reporting_to_id_5b62c274_fk_accounts_;
       public          postgres    false    227    2882    227            d           2606    16708 H   accounts_employee accounts_employee_role_id_8f75a1e4_fk_accounts_role_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.accounts_employee
    ADD CONSTRAINT accounts_employee_role_id_8f75a1e4_fk_accounts_role_id FOREIGN KEY (role_id) REFERENCES public.accounts_role(id) DEFERRABLE INITIALLY DEFERRED;
 r   ALTER TABLE ONLY public.accounts_employee DROP CONSTRAINT accounts_employee_role_id_8f75a1e4_fk_accounts_role_id;
       public          postgres    false    227    235    2894            e           2606    16714 D   accounts_employee accounts_employee_user_id_593173d8_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.accounts_employee
    ADD CONSTRAINT accounts_employee_user_id_593173d8_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 n   ALTER TABLE ONLY public.accounts_employee DROP CONSTRAINT accounts_employee_user_id_593173d8_fk_auth_user_id;
       public          postgres    false    227    213    2853            `           2606    16602 >   accounts_leave accounts_leave_user_id_2206095d_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.accounts_leave
    ADD CONSTRAINT accounts_leave_user_id_2206095d_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 h   ALTER TABLE ONLY public.accounts_leave DROP CONSTRAINT accounts_leave_user_id_2206095d_fk_auth_user_id;
       public          postgres    false    2853    219    213            g           2606    16689 L   accounts_relationship accounts_relationshi_employee_id_1b59c4aa_fk_accounts_    FK CONSTRAINT     �   ALTER TABLE ONLY public.accounts_relationship
    ADD CONSTRAINT accounts_relationshi_employee_id_1b59c4aa_fk_accounts_ FOREIGN KEY (employee_id) REFERENCES public.accounts_employee(id) DEFERRABLE INITIALLY DEFERRED;
 v   ALTER TABLE ONLY public.accounts_relationship DROP CONSTRAINT accounts_relationshi_employee_id_1b59c4aa_fk_accounts_;
       public          postgres    false    231    2882    227            [           2606    16482 O   auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 y   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm;
       public          postgres    false    2840    211    207            Z           2606    16477 P   auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 z   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id;
       public          postgres    false    209    211    2845            Y           2606    16468 E   auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 o   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co;
       public          postgres    false    2835    207    205            ]           2606    16497 D   auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 n   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id;
       public          postgres    false    209    215    2845            \           2606    16492 B   auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 l   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id;
       public          postgres    false    2853    215    213            _           2606    16511 S   auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 }   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm;
       public          postgres    false    207    217    2840            ^           2606    16506 V   auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id;
       public          postgres    false    2853    217    213            h           2606    16783 G   django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co    FK CONSTRAINT     �   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 q   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co;
       public          postgres    false    2835    205    239            i           2606    16788 B   django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 l   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id;
       public          postgres    false    213    2853    239            �      x������ � �      �   f   x�3��O+)O,J���4202�50"Cs++c=������)�������H��������ˈ�#�(�y&�zff�&��34�3575�0������ �^"#      �      x������ � �         �  x�͔]o�0���_ai�h���檩��U�,������#c��_?C>�,Y'M��lq/����S�Vr�k.-�,q5T۳�
(o򊂇)(�`�2+)��,�Y��0"8@�`�d-\s��FS�60���V��[	�(r-��i������&-\�f��\ �]�5�� ���K�y���d&AY�1|l������/�x��8�=��v��y���P����`��aV�#�5�3��$�;#4e����\.)�ӊ��6`3�!b7��qCp󾄏��� �R�S�B-M�R��Ph!���bUFE���;�'�9�ݘ�,M;x�r��ʀ�,R8�T�%Mߌ����	=윦v\��p7=��M�e�$�?�Ouf����SrvwDn-Ua�rì��s�WF驡m_�OԂ���=��Ԏzfަ���7Ӥ9�Ip��a?gJ�7St�Xnے�=���ȗZ1!x�ȅ>�w_����������E�7�W,�f�qA��v�Q!L��M�5;�jO�ܔ(�s��Jn���R1�	�����\��Ӯ�a��z�\1���Er3yT��r��v��X�5�`kĠ�A:<B��D���k�gE�`TU�M����5��;!��I�������a�����'��^L�a�P�1� ~�G��/���      �   m  x����r�0�sx
�3��|_{���%X��L����*�Pf����B1��
!%k�E]����O�=�5�.���Ucd.ȣ��q���(O���`��dB/�W9Y��ʣ悬 L����h�7�w<.�RsG�j5�?�F~�w�ӟ��rr
Ȥ���8|��z nPZ��|"p��x4#*���$��P�M�=d1�j��F��ڝ��{���~���V齧������B}�׵W�Kc��i=�8l��,���8����M���}�wՕ���D��>p�#��ȫ+/'�xԬ�o����y?�z_�/-��D6u�ҁ��8mP�)����|��yXzA\(N��D���,�~ �(            x������ � �            x������ � �            x������ � �            x������ � �      	   �   x���A� ��5s��d�J٩ե^���I����v]jL���}�ޫ�nU?q��1�v���B�[�y�^+�,�2�f��3�@�S��k��R�C.�$�cV��E ,!�~6��6�	e��cZ�� �8/+���I��C�Nt ��L      �   /   x�3�LL����2��(�2��M�KLO-�2�L�-�ɯLM����� ޒ
�      �      x������ � �      �   p  x�e�ˎ�0E��W�Z��v�Q/z=҈I,5D�����v]��]�TG�����u�����/W9��e��[�6�����~���:7'�oA�B|��_��T�8�[��\��]���g���R?�ɨc��Oi.�2Vj�8���i��~6�̾������p�}����$G�(j���?onj\y�RD]�۬Ԟ���B+m�QH*��5(�
;*ñΙ
�~k��E*���v�r �v���E��zn�����a"ק��g�,	�o�q���������:)����EyRG6�xlhHs�e� mnP��"��Y���rnN�Z���o��lf� &K�9,�J	z:g��jYڂr�j��� X�2���.Ŕ�[�vm��i���:�P�lAy�a�-���xRK�r�� 挧uC�[~����pA��mI�!.����������Čn�����d�I'���0
KMSV����UP�WM����;�?�聡lDR`T,"!*��D|��d2��k[Q$B
��L�P�u�)����׸����_8[�lE��Ґ�JĶ�����E������;��	��@QP\#G9P#�B�(1��k���G^      �   �  x�}�[o�@ �g�}��T��$&E��-�+���K��_�tK�Mu;�d�$3g��9�{q�·����D���[)Pv����i���=2�p�7I�jgZ?S��!~����SW�r̺�p/�{�"�HK���)	��eN̲0����	��6��3�g"t��qu�#C�6�7��Ul�%K�ό�h�ר��18�&�DǱK��m�%����̘X]�YW����jɜ$|(2/��<O��?&e�j�m�GZ4c������Ŵ��F{�H{����$��:R�����m�����IC	 򯎹w�2l~�_e%���mMtV�0����G����i)����I[����;���,[�M����V��VK K���^2��yI�e������լ��6z.̥�WAO��۝�)�~@�a�{��Oc���!��o<�M���Z��Ԣ �Y�1��9�sv�w����fE2����V���"��      �   +   x�3�4�4�2�4�4�2�B.NS �Hq�q� ec���� g��      �      x������ � �         <  x���Mo�F���� tm�ؙ�O���9���i��YK�@)	� ��CJ\YK��� �2�ξ�Å%�7��W���W������ uE��"ԛ��￮B]7��*�~��� *����	�D��ϕӼ����Y	�r*6��M�����+B�OU4��z�o�� :�(�uBI-IE%~�MW_a3G(-�t��(����;�)m>7�����MqXI(��sG�ۏ�/�o�̌���=)��m������U6���rU7�����m��0��� � �u��#���;�Ϗ!�0x��6�i �8@�Wj=� ���CJY6����>�u�7�x췟v���A�4&_s�5d�Sq.�^�؜Q�]>7M�ʾ��(SI+�5.�nm�ԅW�g�r���k���˟�מ�G�4[ZV�	��rQ���
�o?mµA��4U*��K�P��͒F�ȢY2�\�֖�n�n�Th���G�����o��%�4L�l,��5m	]����6�Hͯi�IH��lB�6��	����`�#�,�t�W9�h0W;n�����Mc���YbUmľcl�.tmf���_N�0hm� ������g���TE��\�ǹ�����\��S�*�9j�2A��W��x��/�J�1�RH�S�x��:t]S�oʋ=G���������$��L��TO�z�����rȔ����n�c��;7}��Ds?A����Ced�B�K�a(�E\o�a:.���0�{a�}�O��% �!?��h�,v��r�Xw~�D��DůTaHy_?K	Q�E';4&di0����� t��      �   �   x�U��� �k��q?�x��وPt&��s�0�z��M���0�d�ȼ�
w�O45?(�$�X�V%Oi$
�=F
�jl�6�J��r"�6�d#.n��q�Yp}���u��1�9Bke޲ra9HR�^��eR���9��f��H��9S���X�Q)��>@�*Ӻ!�
� �\�n�      �   �  x���ݎ�0���)�~�Ul��鳬U��T*-ۖ����V$C �,B�=�ON`w���r=�y'� ���5������tM�f]�f���5�=����]���B�p+�]s8��a��m�b-ӭPf��»G�V	Dp ٔ�J��9c�	l�a�P��1��e�a+`�Cg��@��!Rxc���2�r���c/6c�G�!]d(`��� �A��s?^�w�?����[�"G[+u�	@Ʊ��t}(n��r.������-Tb$�q =�r�S�#D�&+/��9)���+� ��.#$�*�')�B�^0IJfV�;)���#�k!*)�x� s+`��R����̮@��y=���$$�+�`������v�P� �G�e��n�2��2���@�,C׏m���Ul5�c�c&���'}rB�kK��������B��n��=�8FQ�n}����4�)��)�ê��O��S7ϫ��N�_����*�X
��q��w�Ï_���$B��D����g�5��Ӳ`��:a��7�.�M^����`Rg&�T���K7��o�p�_p���M}���ݱY�i�\�i�B�sӾ0�	J�X���8�o�n4�t�$�}���Ь�V� ��~������
Pش~���1A�1dj���Ur#e��	"�D��EE(X��l֟t�a�G���\�%� k�
$b#c������?Ws;         �  x���ˎ�0���)��&�A�b:0�h09[�pi0�K'!�ӗVӮ�u7]��_���Z����kIN��svM��z��s{���`�G��TǹE�5U���T\�Hs�Z-��[�V⟜h�ȦȎ�Qle�vIݣn�
��P�����xN/"'}���O����HoՔ�2���؃���՚�
eCl%GoC5������3���5��IY��G'IX3&�7I�u�� 6YO�a�G��X�Դ�2��O�� F�� � ?B�$r<��� q?�a�:}������8\�ƅp2Z��{m�>F��<-DT�p��w��Ԣ�v�Q����`nZ��2F�r�_��?����S�Q�6TR�,���c�4�����(��"�O|�g�kZ���>W��J��๜� �=ñ���K{��^�����|_֫��;�s6�     