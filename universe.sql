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
-- Name: fact; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.fact (
    fact_id integer NOT NULL,
    name character varying(30) NOT NULL,
    fact_fact text,
    true_or_not boolean
);


ALTER TABLE public.fact OWNER TO freecodecamp;

--
-- Name: fact_fact_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.fact_fact_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.fact_fact_id_seq OWNER TO freecodecamp;

--
-- Name: fact_fact_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.fact_fact_id_seq OWNED BY public.fact.fact_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    galaxy_type character varying(20),
    distance_from_earth integer,
    galaxy_desc text,
    galaxy_age_millions numeric
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
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    planet_id integer,
    name character varying(30) NOT NULL,
    distance_from_earth integer,
    moon_type character varying(20)
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
    star_id integer,
    name character varying(30) NOT NULL,
    distance_from_earth integer,
    has_life boolean NOT NULL
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
    galaxy_id integer,
    name character varying(30) NOT NULL,
    distance_from_earth integer,
    when_explode_years integer
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
-- Name: fact fact_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.fact ALTER COLUMN fact_id SET DEFAULT nextval('public.fact_fact_id_seq'::regclass);


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
-- Data for Name: fact; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.fact VALUES (1, 'Milky Way', 'The Milky Way is expected to collide with the Andromeda Galaxy in about 4.5 billion years.', true);
INSERT INTO public.fact VALUES (2, 'Betelgeuse', 'Betelgeuse is expected to explode as a supernova within the next million years.', true);
INSERT INTO public.fact VALUES (3, 'Mars', 'Mars has a liquid water ocean beneath its surface.', false);
INSERT INTO public.fact VALUES (4, 'Proxima b', 'Proxima b is in the habitable zone of its star, Proxima Centauri, and could potentially support life.', true);
INSERT INTO public.fact VALUES (5, 'Moon', 'The Moon is moving away from the Earth at a rate of about 3.8 centimeters per year.', true);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Barred Spiral', 0, 'The Milky Way is our home galaxy, containing our Solar System, characterized by its spiral arms and central bar.', 13600);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 2537000, 'Andromeda is the nearest spiral galaxy to the Milky Way and on a collision course with it, forming a future megagalaxy.', 10000);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 2730000, 'The Triangulum Galaxy is the third-largest member of the Local Group, noted for its well-defined spiral structure.', 13000);
INSERT INTO public.galaxy VALUES (4, 'Sombrero Galaxy', 'Spiral', 31000000, 'Known for its bright nucleus and large central bulge, the Sombrero Galaxy has a distinctive hat-like appearance.', 9000);
INSERT INTO public.galaxy VALUES (5, 'Whirlpool Galaxy', 'Spiral', 23000000, 'Famous for its grand-design spiral structure, the Whirlpool Galaxy is interacting with a smaller galaxy, NGC 5195.', 400);
INSERT INTO public.galaxy VALUES (6, 'Pinwheel Galaxy', 'Spiral', 21000000, 'The Pinwheel Galaxy, also known as M101, is a grand design spiral galaxy with prominent and well-defined spiral arms.', 500);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 1, 'Moon', 0, 'Natural Satellite');
INSERT INTO public.moon VALUES (2, 2, 'Phobos', 0, 'Natural Satellite');
INSERT INTO public.moon VALUES (3, 2, 'Deimos', 0, 'Natural Satellite');
INSERT INTO public.moon VALUES (4, 3, 'Proxima b I', 4, 'Natural Satellite');
INSERT INTO public.moon VALUES (5, 4, 'Proxima c I', 4, 'Natural Satellite');
INSERT INTO public.moon VALUES (6, 5, 'Vega b I', 25, 'Natural Satellite');
INSERT INTO public.moon VALUES (7, 6, 'Altair b I', 17, 'Natural Satellite');
INSERT INTO public.moon VALUES (8, 7, 'Sirius b I', 9, 'Natural Satellite');
INSERT INTO public.moon VALUES (9, 8, 'Rigel b I', 860, 'Natural Satellite');
INSERT INTO public.moon VALUES (10, 9, 'Polaris b I', 323, 'Natural Satellite');
INSERT INTO public.moon VALUES (11, 10, 'Deneb b I', 2615, 'Natural Satellite');
INSERT INTO public.moon VALUES (12, 11, 'Antares b I', 550, 'Natural Satellite');
INSERT INTO public.moon VALUES (13, 1, 'Europa', 0, 'Natural Satellite');
INSERT INTO public.moon VALUES (14, 1, 'Ganymede', 0, 'Natural Satellite');
INSERT INTO public.moon VALUES (15, 1, 'Callisto', 0, 'Natural Satellite');
INSERT INTO public.moon VALUES (16, 1, 'Io', 0, 'Natural Satellite');
INSERT INTO public.moon VALUES (17, 2, 'Triton', 0, 'Natural Satellite');
INSERT INTO public.moon VALUES (18, 2, 'Titan', 0, 'Natural Satellite');
INSERT INTO public.moon VALUES (19, 2, 'Enceladus', 0, 'Natural Satellite');
INSERT INTO public.moon VALUES (20, 2, 'Dione', 0, 'Natural Satellite');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 1, 'Earth', 0, true);
INSERT INTO public.planet VALUES (2, 1, 'Mars', 0, false);
INSERT INTO public.planet VALUES (3, 4, 'Proxima b', 4, false);
INSERT INTO public.planet VALUES (4, 4, 'Proxima c', 4, false);
INSERT INTO public.planet VALUES (5, 5, 'Vega b', 25, false);
INSERT INTO public.planet VALUES (6, 6, 'Altair b', 17, false);
INSERT INTO public.planet VALUES (7, 7, 'Sirius b', 9, false);
INSERT INTO public.planet VALUES (8, 8, 'Rigel b', 860, false);
INSERT INTO public.planet VALUES (9, 9, 'Polaris b', 323, false);
INSERT INTO public.planet VALUES (10, 10, 'Deneb b', 2615, false);
INSERT INTO public.planet VALUES (11, 11, 'Antares b', 550, false);
INSERT INTO public.planet VALUES (12, 12, 'Spica b', 250, false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 1, 'Sun', 0, 5000);
INSERT INTO public.star VALUES (2, 1, 'Alpha Centauri A', 4, NULL);
INSERT INTO public.star VALUES (3, 2, 'Betelgeuse', 643, 1);
INSERT INTO public.star VALUES (4, 2, 'Proxima Centauri', 4, NULL);
INSERT INTO public.star VALUES (5, 3, 'Vega', 25, NULL);
INSERT INTO public.star VALUES (6, 3, 'Altair', 17, NULL);
INSERT INTO public.star VALUES (7, 4, 'Sirius', 9, NULL);
INSERT INTO public.star VALUES (8, 4, 'Rigel', 860, 10);
INSERT INTO public.star VALUES (9, 5, 'Polaris', 323, NULL);
INSERT INTO public.star VALUES (10, 5, 'Deneb', 2615, NULL);
INSERT INTO public.star VALUES (11, 6, 'Antares', 550, 0);
INSERT INTO public.star VALUES (12, 6, 'Spica', 250, NULL);


--
-- Name: fact_fact_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.fact_fact_id_seq', 5, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 12, true);


--
-- Name: fact fact_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.fact
    ADD CONSTRAINT fact_name_key UNIQUE (name);


--
-- Name: fact fact_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.fact
    ADD CONSTRAINT fact_pkey PRIMARY KEY (fact_id);


--
-- Name: galaxy galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


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
-- Name: galaxy name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT name_key UNIQUE (name);


--
-- Name: planet planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_id_key UNIQUE (planet_id);


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
-- Name: star star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_id_key UNIQUE (star_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


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

