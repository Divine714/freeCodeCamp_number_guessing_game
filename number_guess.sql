--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    username_id integer NOT NULL,
    guess_number integer NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: usernames; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.usernames (
    username_id integer NOT NULL,
    name character varying(22) NOT NULL
);


ALTER TABLE public.usernames OWNER TO freecodecamp;

--
-- Name: usernames_username_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.usernames_username_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.usernames_username_id_seq OWNER TO freecodecamp;

--
-- Name: usernames_username_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.usernames_username_id_seq OWNED BY public.usernames.username_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: usernames username_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.usernames ALTER COLUMN username_id SET DEFAULT nextval('public.usernames_username_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (1, 12, 0);
INSERT INTO public.games VALUES (2, 12, 1);
INSERT INTO public.games VALUES (3, 23, 792);
INSERT INTO public.games VALUES (4, 23, 825);
INSERT INTO public.games VALUES (5, 24, 327);
INSERT INTO public.games VALUES (6, 24, 136);
INSERT INTO public.games VALUES (7, 23, 359);
INSERT INTO public.games VALUES (8, 23, 920);
INSERT INTO public.games VALUES (9, 23, 326);
INSERT INTO public.games VALUES (10, 12, 3);
INSERT INTO public.games VALUES (11, 25, 324);
INSERT INTO public.games VALUES (12, 25, 510);
INSERT INTO public.games VALUES (13, 26, 843);
INSERT INTO public.games VALUES (14, 26, 443);
INSERT INTO public.games VALUES (15, 25, 966);
INSERT INTO public.games VALUES (16, 25, 326);
INSERT INTO public.games VALUES (17, 25, 616);


--
-- Data for Name: usernames; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.usernames VALUES (1, '');
INSERT INTO public.usernames VALUES (8, 'user_1729642913211');
INSERT INTO public.usernames VALUES (9, 'user_1729642913210');
INSERT INTO public.usernames VALUES (10, 'user_1729642939888');
INSERT INTO public.usernames VALUES (11, 'user_1729642939887');
INSERT INTO public.usernames VALUES (12, 'Ben');
INSERT INTO public.usernames VALUES (13, 'user_1729643137758');
INSERT INTO public.usernames VALUES (14, 'user_1729643137757');
INSERT INTO public.usernames VALUES (15, 'user_1729643456305');
INSERT INTO public.usernames VALUES (16, 'user_1729643456304');
INSERT INTO public.usernames VALUES (17, 'user_1729644015616');
INSERT INTO public.usernames VALUES (18, 'user_1729644015615');
INSERT INTO public.usernames VALUES (19, 'user_1729644853527');
INSERT INTO public.usernames VALUES (20, 'user_1729644853526');
INSERT INTO public.usernames VALUES (21, 'user_1729645494554');
INSERT INTO public.usernames VALUES (22, 'user_1729645494553');
INSERT INTO public.usernames VALUES (23, 'user_1729645598156');
INSERT INTO public.usernames VALUES (24, 'user_1729645598155');
INSERT INTO public.usernames VALUES (25, 'user_1729645915916');
INSERT INTO public.usernames VALUES (26, 'user_1729645915915');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 17, true);


--
-- Name: usernames_username_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.usernames_username_id_seq', 26, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: usernames usernames_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.usernames
    ADD CONSTRAINT usernames_name_key UNIQUE (name);


--
-- Name: usernames usernames_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.usernames
    ADD CONSTRAINT usernames_pkey PRIMARY KEY (username_id);


--
-- Name: games fk_games_username_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT fk_games_username_id FOREIGN KEY (username_id) REFERENCES public.usernames(username_id);


--
-- PostgreSQL database dump complete
--

