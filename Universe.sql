--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    size_in_milkpc integer,
    distance_from_earth numeric,
    visual text NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: junction_table; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.junction_table (
    star_id integer,
    junction_table_id integer NOT NULL,
    name character varying(30) NOT NULL
);


ALTER TABLE public.junction_table OWNER TO freecodecamp;

--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    distance integer,
    diameter numeric NOT NULL,
    shape text,
    water_present boolean DEFAULT false,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    no_of_moons integer,
    radius numeric NOT NULL,
    hrs_per_day integer,
    has_life boolean DEFAULT false,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    origin_language text,
    distance_in_lightyrs integer NOT NULL,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (2, 'Milkyway', 3, 25.8, 'barred_spiral');
INSERT INTO public.galaxy VALUES (3, 'Magellanic_clouds', 0, 0.16, 'barred-spiral');
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 24, 31, 'spiral');
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 15, 31.1, 'Ring-elliptical');
INSERT INTO public.galaxy VALUES (1, 'Andromeda', 47, 2.5, 'barred-spiral');
INSERT INTO public.galaxy VALUES (6, 'Mafei', 0, 0, 'elliptical');


--
-- Data for Name: junction_table; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.junction_table VALUES (1, 1, 'joypus');
INSERT INTO public.junction_table VALUES (2, 2, 'litmus');
INSERT INTO public.junction_table VALUES (3, 3, 'lazim');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'moon', 384400, 1737, 'spherical', true, 3);
INSERT INTO public.moon VALUES (2, 'Phobos', 9378, 266, 'Ellipsoid', false, 4);
INSERT INTO public.moon VALUES (3, 'Callisto', 1883000, 4800, 'Spherical', true, 5);
INSERT INTO public.moon VALUES (4, 'Deimos', 23458, 15, 'Irregular', false, 4);
INSERT INTO public.moon VALUES (7, 'Europa', 671000, 3130, 'Spherical', true, 5);
INSERT INTO public.moon VALUES (8, 'Dione', 377400, 1120, 'Spherical', true, 16);
INSERT INTO public.moon VALUES (9, 'Hyperion', 1481100, 370, 'Irregular', false, 16);
INSERT INTO public.moon VALUES (10, 'Phoebe', 12952000, 210, 'Roughly-Spherical', false, 16);
INSERT INTO public.moon VALUES (11, 'Mimas', 185520, 400, 'Spherical', true, 16);
INSERT INTO public.moon VALUES (12, 'Rhea', 527040, 1528, 'Spherical', true, 16);
INSERT INTO public.moon VALUES (13, 'T', 1221850, 5150, 'Spherical', true, 16);
INSERT INTO public.moon VALUES (14, 'Ariel', 190900, 1160, 'Spherical', false, 17);
INSERT INTO public.moon VALUES (15, 'Miranda', 129800, 470, 'Roughly-Spherical', false, 17);
INSERT INTO public.moon VALUES (16, 'Oberon', 582600, 1522, 'Spherical', true, 17);
INSERT INTO public.moon VALUES (17, 'Titania', 435840, 1578, 'Spherical', true, 17);
INSERT INTO public.moon VALUES (18, 'Umbriel', 265970, 1170, 'Spherical', true, 17);
INSERT INTO public.moon VALUES (19, 'Nereid', 5513400, 340, 'Spherical', false, 24);
INSERT INTO public.moon VALUES (20, 'Triton', 354800, 2708.4, 'Spherical', true, 24);
INSERT INTO public.moon VALUES (21, 'Charon', 17536, 1208, 'Spherical', true, 25);
INSERT INTO public.moon VALUES (22, 'Tethys', 294660, 1066, 'Spherical', true, 16);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 0, 2440, 1408, false, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 0, 6050, 5832, true, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 1, 6371, 24, true, 3);
INSERT INTO public.planet VALUES (4, 'Mars', 2, 2106, 25, true, 4);
INSERT INTO public.planet VALUES (5, 'Jupiter', 80, 69911, 10, false, 4);
INSERT INTO public.planet VALUES (16, 'Saturn', 83, 58232, 11, false, 5);
INSERT INTO public.planet VALUES (17, 'Uranus', 27, 15759, 17, false, 3);
INSERT INTO public.planet VALUES (24, 'Neptune', 14, 15299, 16, false, 3);
INSERT INTO public.planet VALUES (25, 'Pluto', 5, 2380, 153, false, 3);
INSERT INTO public.planet VALUES (26, 'Eris', 1, 1163, 259, false, 5);
INSERT INTO public.planet VALUES (27, 'Haumea', 2, 620, 4, false, 6);
INSERT INTO public.planet VALUES (28, 'Makemake', 1, 715, 22, false, 7);
INSERT INTO public.planet VALUES (29, 'Ceres', 0, 476, 9, false, 6);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sirius', 'Greek', 9, 1);
INSERT INTO public.star VALUES (3, 'Canopus', 'Greek', 313, 3);
INSERT INTO public.star VALUES (4, 'Arcturus', 'Greek', 37, 1);
INSERT INTO public.star VALUES (5, 'Rigel Kentaurus', 'Arabic', 4, 4);
INSERT INTO public.star VALUES (6, 'Vega', 'Arabic', 25, 5);
INSERT INTO public.star VALUES (7, 'Capella', 'Latin', 42, 2);
INSERT INTO public.star VALUES (8, 'Rigeil', 'Arabic', 773, 2);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 22, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 29, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 8, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: junction_table junction_table_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.junction_table
    ADD CONSTRAINT junction_table_pkey PRIMARY KEY (junction_table_id);


--
-- Name: junction_table junction_table_star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.junction_table
    ADD CONSTRAINT junction_table_star_id_key UNIQUE (star_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_name_key1; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key1 UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

