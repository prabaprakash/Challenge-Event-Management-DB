--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.1
-- Dumped by pg_dump version 9.6.1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: attendance_types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE attendance_types (
    type character varying NOT NULL
);


ALTER TABLE attendance_types OWNER TO postgres;

--
-- Name: country; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE country (
    country_id integer NOT NULL,
    country_name character varying NOT NULL
);


ALTER TABLE country OWNER TO postgres;

--
-- Name: country_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE country_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE country_id_seq OWNER TO postgres;

--
-- Name: country_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE country_id_seq OWNED BY country.country_id;


--
-- Name: district; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE district (
    district_id integer NOT NULL,
    district_name character varying NOT NULL,
    state_id integer NOT NULL
);


ALTER TABLE district OWNER TO postgres;

--
-- Name: district_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE district_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE district_id_seq OWNER TO postgres;

--
-- Name: district_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE district_id_seq OWNED BY district.district_id;


--
-- Name: state; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE state (
    state_id integer NOT NULL,
    state_name character varying NOT NULL,
    country_id integer NOT NULL
);


ALTER TABLE state OWNER TO postgres;

--
-- Name: state_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE state_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE state_id_seq OWNER TO postgres;

--
-- Name: state_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE state_id_seq OWNED BY state.state_id;


--
-- Name: user_comments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE user_comments (
    id integer NOT NULL,
    user_id integer NOT NULL,
    story_id integer,
    comment text NOT NULL,
    created_at timestamp with time zone DEFAULT '2017-01-05 08:52:26.642724+00'::timestamp with time zone NOT NULL,
    updated_at timestamp with time zone,
    event_id integer,
    CONSTRAINT user_comments_check_not_null CHECK (((story_id IS NOT NULL) OR (event_id IS NOT NULL)))
);


ALTER TABLE user_comments OWNER TO postgres;

--
-- Name: user_comments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE user_comments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE user_comments_id_seq OWNER TO postgres;

--
-- Name: user_comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE user_comments_id_seq OWNED BY user_comments.id;


--
-- Name: user_credentials; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE user_credentials (
    id integer NOT NULL,
    username character varying(30) NOT NULL,
    email character varying(30) NOT NULL,
    mobile character varying(10) NOT NULL,
    password character varying(100) NOT NULL,
    created_at timestamp with time zone DEFAULT '2017-01-05 08:09:45.923511+00'::timestamp with time zone NOT NULL,
    updated_at timestamp with time zone,
    user_type character varying(30) NOT NULL
);


ALTER TABLE user_credentials OWNER TO postgres;

--
-- Name: user_credentials_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE user_credentials_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE user_credentials_id_seq OWNER TO postgres;

--
-- Name: user_credentials_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE user_credentials_id_seq OWNED BY user_credentials.id;


--
-- Name: user_details; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE user_details (
    user_id integer NOT NULL,
    first_name character varying NOT NULL,
    last_name character varying NOT NULL,
    dob date NOT NULL,
    address_1 character varying NOT NULL,
    address_2 character varying NOT NULL,
    pincode integer NOT NULL,
    district_id integer NOT NULL,
    state_id integer NOT NULL,
    country_id integer NOT NULL,
    created_at timestamp with time zone DEFAULT '2017-01-05 08:18:01.832335+00'::timestamp with time zone NOT NULL,
    updated_at timestamp with time zone,
    id integer NOT NULL
);


ALTER TABLE user_details OWNER TO postgres;

--
-- Name: user_details_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE user_details_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE user_details_id_seq OWNER TO postgres;

--
-- Name: user_details_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE user_details_id_seq OWNED BY user_details.id;


--
-- Name: user_event_attendance; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE user_event_attendance (
    id integer NOT NULL,
    user_id integer NOT NULL,
    event_id integer NOT NULL,
    attendance character varying NOT NULL,
    created_at timestamp with time zone DEFAULT '2017-01-05 14:35:24.142473+00'::timestamp with time zone NOT NULL,
    updated_at timestamp with time zone
);


ALTER TABLE user_event_attendance OWNER TO postgres;

--
-- Name: user_event_attendance_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE user_event_attendance_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE user_event_attendance_id_seq OWNER TO postgres;

--
-- Name: user_event_attendance_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE user_event_attendance_id_seq OWNED BY user_event_attendance.id;


--
-- Name: user_events; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE user_events (
    id integer NOT NULL,
    user_id integer NOT NULL,
    event_heading character varying NOT NULL,
    event text NOT NULL,
    event_date_time timestamp with time zone NOT NULL,
    created_at timestamp with time zone DEFAULT '2017-01-05 14:31:02.406904+00'::timestamp with time zone NOT NULL,
    updated_at timestamp with time zone
);


ALTER TABLE user_events OWNER TO postgres;

--
-- Name: user_events_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE user_events_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE user_events_id_seq OWNER TO postgres;

--
-- Name: user_events_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE user_events_id_seq OWNED BY user_events.id;


--
-- Name: user_likes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE user_likes (
    user_id integer NOT NULL,
    story_id integer,
    comment_id integer,
    reply_id integer,
    "like" boolean NOT NULL,
    created_at timestamp with time zone DEFAULT '2017-01-05 10:46:46.852656+00'::timestamp with time zone NOT NULL,
    updated_at timestamp with time zone,
    event_id integer,
    id integer NOT NULL,
    CONSTRAINT user_likes_check_not_null CHECK (((story_id IS NOT NULL) OR (comment_id IS NOT NULL) OR (reply_id IS NOT NULL) OR (event_id IS NOT NULL)))
);


ALTER TABLE user_likes OWNER TO postgres;

--
-- Name: user_likes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE user_likes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE user_likes_id_seq OWNER TO postgres;

--
-- Name: user_likes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE user_likes_id_seq OWNED BY user_likes.id;


--
-- Name: user_replies; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE user_replies (
    id integer NOT NULL,
    user_id integer NOT NULL,
    comment_id integer,
    reply character varying NOT NULL,
    parent_id integer,
    created_at timestamp with time zone DEFAULT '2017-01-05 10:29:50.52406+00'::timestamp with time zone NOT NULL,
    updated_at timestamp with time zone,
    CONSTRAINT user_replies_check_not_null CHECK (((comment_id IS NOT NULL) OR (parent_id IS NOT NULL)))
);


ALTER TABLE user_replies OWNER TO postgres;

--
-- Name: user_replies_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE user_replies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE user_replies_id_seq OWNER TO postgres;

--
-- Name: user_replies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE user_replies_id_seq OWNED BY user_replies.id;


--
-- Name: user_stories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE user_stories (
    id integer NOT NULL,
    user_id integer NOT NULL,
    story text NOT NULL,
    created_at timestamp with time zone DEFAULT '2017-01-05 08:41:44.20755+00'::timestamp with time zone NOT NULL,
    updated_at timestamp with time zone,
    story_heading character varying NOT NULL
);


ALTER TABLE user_stories OWNER TO postgres;

--
-- Name: user_stories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE user_stories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE user_stories_id_seq OWNER TO postgres;

--
-- Name: user_stories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE user_stories_id_seq OWNED BY user_stories.id;


--
-- Name: user_types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE user_types (
    user_type character varying(30) NOT NULL
);


ALTER TABLE user_types OWNER TO postgres;

--
-- Name: country country_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY country ALTER COLUMN country_id SET DEFAULT nextval('country_id_seq'::regclass);


--
-- Name: district district_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY district ALTER COLUMN district_id SET DEFAULT nextval('district_id_seq'::regclass);


--
-- Name: state state_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY state ALTER COLUMN state_id SET DEFAULT nextval('state_id_seq'::regclass);


--
-- Name: user_comments id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY user_comments ALTER COLUMN id SET DEFAULT nextval('user_comments_id_seq'::regclass);


--
-- Name: user_credentials id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY user_credentials ALTER COLUMN id SET DEFAULT nextval('user_credentials_id_seq'::regclass);


--
-- Name: user_details id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY user_details ALTER COLUMN id SET DEFAULT nextval('user_details_id_seq'::regclass);


--
-- Name: user_event_attendance id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY user_event_attendance ALTER COLUMN id SET DEFAULT nextval('user_event_attendance_id_seq'::regclass);


--
-- Name: user_events id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY user_events ALTER COLUMN id SET DEFAULT nextval('user_events_id_seq'::regclass);


--
-- Name: user_likes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY user_likes ALTER COLUMN id SET DEFAULT nextval('user_likes_id_seq'::regclass);


--
-- Name: user_replies id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY user_replies ALTER COLUMN id SET DEFAULT nextval('user_replies_id_seq'::regclass);


--
-- Name: user_stories id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY user_stories ALTER COLUMN id SET DEFAULT nextval('user_stories_id_seq'::regclass);


--
-- Data for Name: attendance_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY attendance_types (type) FROM stdin;
attending
not_attending
may_be
\.


--
-- Data for Name: country; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY country (country_id, country_name) FROM stdin;
1	india
\.


--
-- Name: country_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('country_id_seq', 1, true);


--
-- Data for Name: district; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY district (district_id, district_name, state_id) FROM stdin;
1	tiruvannamalai	1
\.


--
-- Name: district_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('district_id_seq', 1, true);


--
-- Data for Name: state; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY state (state_id, state_name, country_id) FROM stdin;
1	tamil nadu	1
2	karnataka	1
\.


--
-- Name: state_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('state_id_seq', 2, true);


--
-- Data for Name: user_comments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY user_comments (id, user_id, story_id, comment, created_at, updated_at, event_id) FROM stdin;
1	2	1	I applies to all	2017-01-05 08:52:26.642724+00	\N	\N
2	3	1	factu	2017-01-05 08:52:26.642724+00	\N	\N
3	1	\N	wow, I wasn't expected this	2017-01-05 08:52:26.642724+00	\N	1
5	1	1	wow, I wasn't expected this	2017-01-05 08:52:26.642724+00	\N	\N
\.


--
-- Name: user_comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('user_comments_id_seq', 7, true);


--
-- Data for Name: user_credentials; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY user_credentials (id, username, email, mobile, password, created_at, updated_at, user_type) FROM stdin;
1	praba	xxx@gmail.com	1111111111	password	2017-01-05 08:09:45.923511+00	\N	user
2	sam	yyy@gmail.com	2222222222	password	2017-01-05 08:09:45.923511+00	\N	user
3	mugesh	zzz@gmail.com	3333333333	password	2017-01-05 08:09:45.923511+00	\N	user
4	tejdeep	aaaa@gmail.com	4444444444	password	2017-01-05 08:09:45.923511+00	\N	volunteer
\.


--
-- Name: user_credentials_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('user_credentials_id_seq', 4, true);


--
-- Data for Name: user_details; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY user_details (user_id, first_name, last_name, dob, address_1, address_2, pincode, district_id, state_id, country_id, created_at, updated_at, id) FROM stdin;
1	praba	karan	2017-01-05	777		606604	1	1	1	2017-01-05 08:18:01.832335+00	\N	1
2	sam	boban	2017-01-05	777		606604	1	1	1	2017-01-05 08:18:01.832335+00	\N	2
3	mugesh		2017-01-05	777		606604	1	1	1	2017-01-05 08:18:01.832335+00	\N	3
4	tejdeep		2017-01-05	777		606604	1	1	1	2017-01-05 08:18:01.832335+00	\N	4
\.


--
-- Name: user_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('user_details_id_seq', 4, true);


--
-- Data for Name: user_event_attendance; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY user_event_attendance (id, user_id, event_id, attendance, created_at, updated_at) FROM stdin;
1	1	1	attending	2017-01-05 14:35:24.142473+00	\N
2	2	1	may_be	2017-01-05 14:35:24.142473+00	\N
5	3	1	not_attending	2017-01-05 14:35:24.142473+00	\N
\.


--
-- Name: user_event_attendance_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('user_event_attendance_id_seq', 6, true);


--
-- Data for Name: user_events; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY user_events (id, user_id, event_heading, event, event_date_time, created_at, updated_at) FROM stdin;
1	4	Android Amaze Hackathon	the Ultimate ANDROID AMAZE Hackathon is an attempt to get into the book of Guinness World Records , Asian Book of Records , India Book of Records and Tamil Nadu book of Records in Android App Development and Deployment. This Event is Organised by ANDROID CLUB of VIT University Chennai with an objective to develop and promote socially benefiting applications. The ANDROID AMAZE will be a two day long round-the clock provocative event to be conducted on 21st & 22nd of MARCH 2015. 	2017-01-05 15:24:50.342304+00	2017-01-05 14:31:02.406904+00	\N
\.


--
-- Name: user_events_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('user_events_id_seq', 1, true);


--
-- Data for Name: user_likes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY user_likes (user_id, story_id, comment_id, reply_id, "like", created_at, updated_at, event_id, id) FROM stdin;
1	1	\N	\N	t	2017-01-05 10:46:46.852656+00	\N	\N	5
1	\N	\N	\N	t	2017-01-05 10:46:46.852656+00	\N	1	7
1	\N	1	\N	t	2017-01-05 10:46:46.852656+00	\N	\N	9
2	1	\N	\N	t	2017-01-05 10:46:46.852656+00	\N	\N	17
3	1	\N	\N	t	2017-01-05 10:46:46.852656+00	\N	\N	20
\.


--
-- Name: user_likes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('user_likes_id_seq', 20, true);


--
-- Data for Name: user_replies; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY user_replies (id, user_id, comment_id, reply, parent_id, created_at, updated_at) FROM stdin;
1	1	1	thanks	\N	2017-01-05 10:29:50.52406+00	\N
2	2	\N	don't thanks us	1	2017-01-05 10:29:50.52406+00	\N
3	1	1	cool	\N	2017-01-05 10:29:50.52406+00	\N
4	1	3	I too bro	\N	2017-01-05 10:29:50.52406+00	\N
\.


--
-- Name: user_replies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('user_replies_id_seq', 5, true);


--
-- Data for Name: user_stories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY user_stories (id, user_id, story, created_at, updated_at, story_heading) FROM stdin;
1	1	Luck is a dividend of sweat. The more you sweat, the luckier you get.\r\n	2017-01-05 08:41:44.20755+00	\N	Ray Kroc
\.


--
-- Name: user_stories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('user_stories_id_seq', 2, true);


--
-- Data for Name: user_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY user_types (user_type) FROM stdin;
user
volunteer
admin
\.


--
-- Name: attendance_types attendance_types_type; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY attendance_types
    ADD CONSTRAINT attendance_types_type UNIQUE (type);


--
-- Name: country country_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY country
    ADD CONSTRAINT country_id UNIQUE (country_id);


--
-- Name: district district_district_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY district
    ADD CONSTRAINT district_district_id UNIQUE (district_id);


--
-- Name: state state_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY state
    ADD CONSTRAINT state_id PRIMARY KEY (state_id);


--
-- Name: user_comments user_comments_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY user_comments
    ADD CONSTRAINT user_comments_id UNIQUE (id);


--
-- Name: user_credentials user_credentials_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY user_credentials
    ADD CONSTRAINT user_credentials_id UNIQUE (id);


--
-- Name: user_details user_details_user_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY user_details
    ADD CONSTRAINT user_details_user_id UNIQUE (user_id);


--
-- Name: user_event_attendance user_event_attendance_user_id_event_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY user_event_attendance
    ADD CONSTRAINT user_event_attendance_user_id_event_id UNIQUE (user_id, event_id);


--
-- Name: user_events user_events_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY user_events
    ADD CONSTRAINT user_events_id UNIQUE (id);


--
-- Name: user_likes user_likes_user_id_comment_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY user_likes
    ADD CONSTRAINT user_likes_user_id_comment_id UNIQUE (user_id, comment_id);


--
-- Name: user_likes user_likes_user_id_event_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY user_likes
    ADD CONSTRAINT user_likes_user_id_event_id UNIQUE (user_id, event_id);


--
-- Name: user_likes user_likes_user_id_reply_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY user_likes
    ADD CONSTRAINT user_likes_user_id_reply_id UNIQUE (user_id, reply_id);


--
-- Name: user_likes user_likes_user_id_story_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY user_likes
    ADD CONSTRAINT user_likes_user_id_story_id UNIQUE (user_id, story_id);


--
-- Name: user_replies user_replies_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY user_replies
    ADD CONSTRAINT user_replies_id UNIQUE (id);


--
-- Name: user_stories user_stories_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY user_stories
    ADD CONSTRAINT user_stories_id UNIQUE (id);


--
-- Name: user_types user_types_user_type; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY user_types
    ADD CONSTRAINT user_types_user_type PRIMARY KEY (user_type);


--
-- Name: district district_state_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY district
    ADD CONSTRAINT district_state_id_fkey FOREIGN KEY (state_id) REFERENCES state(state_id);


--
-- Name: state state_country_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY state
    ADD CONSTRAINT state_country_id_fkey FOREIGN KEY (country_id) REFERENCES country(country_id);


--
-- Name: user_comments user_comments_event_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY user_comments
    ADD CONSTRAINT user_comments_event_id_fkey FOREIGN KEY (event_id) REFERENCES user_events(id);


--
-- Name: user_comments user_comments_story_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY user_comments
    ADD CONSTRAINT user_comments_story_id_fkey FOREIGN KEY (story_id) REFERENCES user_stories(id);


--
-- Name: user_comments user_comments_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY user_comments
    ADD CONSTRAINT user_comments_user_id_fkey FOREIGN KEY (user_id) REFERENCES user_credentials(id);


--
-- Name: user_credentials user_credentials_user_type_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY user_credentials
    ADD CONSTRAINT user_credentials_user_type_fkey FOREIGN KEY (user_type) REFERENCES user_types(user_type);


--
-- Name: user_details user_details_country_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY user_details
    ADD CONSTRAINT user_details_country_id_fkey FOREIGN KEY (country_id) REFERENCES country(country_id);


--
-- Name: user_details user_details_district_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY user_details
    ADD CONSTRAINT user_details_district_id_fkey FOREIGN KEY (district_id) REFERENCES district(district_id);


--
-- Name: user_details user_details_state_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY user_details
    ADD CONSTRAINT user_details_state_id_fkey FOREIGN KEY (state_id) REFERENCES state(state_id);


--
-- Name: user_details user_details_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY user_details
    ADD CONSTRAINT user_details_user_id_fkey FOREIGN KEY (user_id) REFERENCES user_credentials(id);


--
-- Name: user_event_attendance user_event_attendance_attendance_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY user_event_attendance
    ADD CONSTRAINT user_event_attendance_attendance_fkey FOREIGN KEY (attendance) REFERENCES attendance_types(type);


--
-- Name: user_event_attendance user_event_attendance_event_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY user_event_attendance
    ADD CONSTRAINT user_event_attendance_event_id_fkey FOREIGN KEY (event_id) REFERENCES user_events(id);


--
-- Name: user_event_attendance user_event_attendance_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY user_event_attendance
    ADD CONSTRAINT user_event_attendance_user_id_fkey FOREIGN KEY (user_id) REFERENCES user_credentials(id);


--
-- Name: user_events user_events_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY user_events
    ADD CONSTRAINT user_events_user_id_fkey FOREIGN KEY (user_id) REFERENCES user_credentials(id);


--
-- Name: user_likes user_likes_comment_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY user_likes
    ADD CONSTRAINT user_likes_comment_id_fkey FOREIGN KEY (comment_id) REFERENCES user_comments(id);


--
-- Name: user_likes user_likes_event_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY user_likes
    ADD CONSTRAINT user_likes_event_id_fkey FOREIGN KEY (event_id) REFERENCES user_events(id);


--
-- Name: user_likes user_likes_reply_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY user_likes
    ADD CONSTRAINT user_likes_reply_id_fkey FOREIGN KEY (reply_id) REFERENCES user_replies(id);


--
-- Name: user_likes user_likes_story_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY user_likes
    ADD CONSTRAINT user_likes_story_id_fkey FOREIGN KEY (story_id) REFERENCES user_stories(id);


--
-- Name: user_likes user_likes_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY user_likes
    ADD CONSTRAINT user_likes_user_id_fkey FOREIGN KEY (user_id) REFERENCES user_credentials(id);


--
-- Name: user_replies user_replies_comment_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY user_replies
    ADD CONSTRAINT user_replies_comment_id_fkey FOREIGN KEY (comment_id) REFERENCES user_comments(id);


--
-- Name: user_replies user_replies_partent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY user_replies
    ADD CONSTRAINT user_replies_partent_id_fkey FOREIGN KEY (parent_id) REFERENCES user_replies(id);


--
-- Name: user_replies user_replies_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY user_replies
    ADD CONSTRAINT user_replies_user_id_fkey FOREIGN KEY (user_id) REFERENCES user_credentials(id);


--
-- Name: user_stories user_stories_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY user_stories
    ADD CONSTRAINT user_stories_user_id_fkey FOREIGN KEY (user_id) REFERENCES user_credentials(id);


--
-- PostgreSQL database dump complete
--

