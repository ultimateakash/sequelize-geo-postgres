--
-- PostgreSQL database dump
--

-- Dumped from database version 14.4
-- Dumped by pg_dump version 14.4

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name character varying(255),
    email character varying(255),
    latitude double precision,
    longitude double precision,
    status boolean,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, name, email, latitude, longitude, status, created_at, updated_at) FROM stdin;
2	User 2	user2@gmail.com	28.625484	79.821091	t	2022-03-03 10:00:42+05:30	2022-03-03 10:00:42+05:30
3	User 3	user3@gmail.com	28.625294	79.817924	t	2022-03-03 10:00:42+05:30	2022-03-03 10:00:42+05:30
4	User 4	user4@gmail.com	28.625181	79.814636	t	2022-03-03 10:00:42+05:30	2022-03-03 10:00:42+05:30
5	User 5	user5@gmail.com	28.625044	79.810135	t	2022-03-03 10:00:42+05:30	2022-03-03 10:00:42+05:30
6	User 6	user6@gmail.com	28.625019	79.808296	t	2022-03-03 10:00:42+05:30	2022-03-03 10:00:42+05:30
1	User 1	user1@gmail.com	28.626137	79.821602	t	2022-03-03 10:00:42+05:30	2022-03-03 10:00:42+05:30
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 1, false);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

