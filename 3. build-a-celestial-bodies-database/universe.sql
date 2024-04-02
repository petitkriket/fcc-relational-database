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
-- Name: contributor; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.contributor (
    contributor_id integer NOT NULL,
    full_name character varying(100) NOT NULL,
    name character varying(100),
    organization character varying(100),
    occupation character varying(100),
    nationality character varying(50) NOT NULL,
    birth_date date NOT NULL,
    death_date date,
    biography text
);


ALTER TABLE public.contributor OWNER TO freecodecamp;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    celestial_identifier character varying(50) NOT NULL,
    distance_from_earth_parsecs numeric(10,2),
    diameter_parsecs numeric(10,2),
    mass_kg numeric(10,2),
    number_of_stars integer DEFAULT 0,
    number_of_planets integer DEFAULT 0,
    number_of_black_holes integer DEFAULT 0,
    number_of_nebulae integer DEFAULT 0,
    number_of_galaxies integer DEFAULT 0,
    central_black_hole_mass_solar_masses numeric(20,2),
    average_star_density_per_cubic_parsec numeric(20,2),
    mean_temperature_degrees numeric(10,2),
    shape text,
    is_barred boolean DEFAULT false,
    has_central_black_hole boolean DEFAULT false,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone,
    discovered_at date,
    contributor_id integer
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
    planet_id integer NOT NULL,
    contributor_id integer,
    name character varying(100) NOT NULL,
    celestial_identifier character varying(50) NOT NULL,
    diameter_km numeric(10,2) NOT NULL,
    mass_kg numeric(10,2) NOT NULL,
    color character varying(100),
    orbital_period_days numeric(10,2),
    distance_from_planet_km numeric(20,2),
    atmosphere_composition text,
    is_habitable boolean DEFAULT false,
    is_inhabited boolean DEFAULT false,
    population integer DEFAULT 0 NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone,
    discovered_at date
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
    star_id integer NOT NULL,
    moon_id integer NOT NULL,
    contributor_id integer,
    name character varying(100) NOT NULL,
    celestial_identifier character varying(50) NOT NULL,
    diameter_km numeric(10,2) NOT NULL,
    mass_kg numeric(10,2) NOT NULL,
    color character varying(100),
    orbital_period_days numeric(10,2),
    distance_from_sun_km numeric(20,2),
    number_of_moons integer DEFAULT 0,
    atmosphere_composition text,
    is_habitable boolean DEFAULT false,
    is_inhabited boolean DEFAULT false,
    population integer DEFAULT 0 NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone,
    discovered_at date
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
    galaxy_id integer NOT NULL,
    planet_id integer NOT NULL,
    contributor_id integer,
    name character varying(100) NOT NULL,
    celestial_identifier character varying(50) NOT NULL,
    diameter_km numeric(10,2) NOT NULL,
    mass_kg numeric(10,2) NOT NULL,
    color character varying(100),
    spectral_class character varying(10),
    luminosity_watts numeric(20,2),
    temperature_degrees numeric(10,2),
    age_years numeric(20,2),
    distance_from_earth_parsecs numeric(20,2),
    number_of_planets integer DEFAULT 0,
    number_of_moons integer DEFAULT 0,
    type text,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone,
    discovered_at date
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
-- Data for Name: contributor; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.contributor VALUES (1, 'Carl Sagan', NULL, 'NASA', 'Astronomer', 'American', '1934-11-09', '1996-12-20', NULL);
INSERT INTO public.contributor VALUES (2, 'Neil deGrasse Tyson', NULL, 'NASA', 'Astrophysicist', 'American', '1958-10-05', NULL, NULL);
INSERT INTO public.contributor VALUES (3, 'Stephen Hawking', NULL, 'NASA', 'Theoretical Physicist', 'British', '1942-01-08', '2018-03-14', NULL);
INSERT INTO public.contributor VALUES (4, 'Albert Einstein', NULL, 'NASA', 'Theoretical Physicist', 'German', '1879-03-14', '1955-04-18', NULL);
INSERT INTO public.contributor VALUES (5, 'Isaac Newton', NULL, 'NASA', 'Mathematician', 'British', '1643-01-04', '1727-03-31', NULL);
INSERT INTO public.contributor VALUES (6, 'Galileo Galilei', NULL, 'NASA', 'Astronomer', 'Italian', '1564-02-15', '1642-01-08', NULL);
INSERT INTO public.contributor VALUES (7, 'Johannes Kepler', NULL, 'NASA', 'Astronomer', 'German', '1571-12-27', '1630-11-15', NULL);
INSERT INTO public.contributor VALUES (8, 'Edwin Hubble', NULL, 'NASA', 'Astronomer', 'American', '1889-11-20', '1953-09-28', NULL);
INSERT INTO public.contributor VALUES (9, 'Vera Rubin', NULL, 'NASA', 'Astronomer', 'American', '1928-07-23', '2016-12-25', NULL);
INSERT INTO public.contributor VALUES (10, 'Margaret Geller', NULL, 'NASA', 'Astrophysicist', 'American', '1947-06-08', NULL, NULL);
INSERT INTO public.contributor VALUES (11, 'Andrea Ghez', NULL, 'NASA', 'Astrophysicist', 'American', '1965-06-16', NULL, NULL);
INSERT INTO public.contributor VALUES (12, 'Katherine Johnson', NULL, 'NASA', 'Mathematician', 'American', '1918-08-26', '2020-02-24', NULL);
INSERT INTO public.contributor VALUES (13, 'Mary Jackson', NULL, 'NASA', 'Engineer', 'American', '1921-04-09', '2005-02-11', NULL);
INSERT INTO public.contributor VALUES (14, 'Dorothy Vaughan', NULL, 'NASA', 'Mathematician', 'American', '1910-09-20', '2008-11-10', NULL);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Milky Way', 100.00, 100.00, 100.00, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, false, false, '2024-04-02 21:42:16.299452', NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Andromeda', 100.00, 100.00, 100.00, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, false, false, '2024-04-02 21:42:16.299452', NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Triangulum', 100.00, 100.00, 100.00, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, false, false, '2024-04-02 21:42:16.299452', NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (4, 'Messier 81', 'Messier 81', 100.00, 100.00, 100.00, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, false, false, '2024-04-02 21:42:16.299452', NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (5, 'Messier 82', 'Messier 82', 100.00, 100.00, 100.00, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, false, false, '2024-04-02 21:42:16.299452', NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (6, 'Messier 83', 'Messier 83', 100.00, 100.00, 100.00, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, false, false, '2024-04-02 21:42:16.299452', NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (7, 'Messier 84', 'Messier 84', 100.00, 100.00, 100.00, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, false, false, '2024-04-02 21:42:16.299452', NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (8, 'Messier 85', 'Messier 85', 100.00, 100.00, 100.00, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, false, false, '2024-04-02 21:42:16.299452', NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (9, 'Messier 86', 'Messier 86', 100.00, 100.00, 100.00, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, false, false, '2024-04-02 21:42:16.299452', NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (10, 'Messier 87', 'Messier 87', 100.00, 100.00, 100.00, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, false, false, '2024-04-02 21:42:16.299452', NULL, NULL, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 1, NULL, 'Moon', 'Sol-3-1', 100.00, 100.00, NULL, NULL, 384400.00, NULL, false, false, 0, '2024-04-02 21:51:04.319678', NULL, NULL);
INSERT INTO public.moon VALUES (2, 2, NULL, 'Phobos', 'Sol-4-1', 100.00, 100.00, NULL, NULL, 9376.00, NULL, false, false, 0, '2024-04-02 21:51:04.319678', NULL, NULL);
INSERT INTO public.moon VALUES (3, 3, NULL, 'Kepler-22b-1', 'Kepler-22b-1', 100.00, 100.00, NULL, NULL, 100.00, NULL, false, false, 0, '2024-04-02 21:51:04.319678', NULL, NULL);
INSERT INTO public.moon VALUES (4, 4, NULL, 'Venus-1', 'Sol-2-1', 100.00, 100.00, NULL, NULL, 100.00, NULL, false, false, 0, '2024-04-02 21:51:04.319678', NULL, NULL);
INSERT INTO public.moon VALUES (5, 5, NULL, 'Jupiter-1', 'Sol-5-1', 100.00, 100.00, NULL, NULL, 100.00, NULL, false, false, 0, '2024-04-02 21:51:04.319678', NULL, NULL);
INSERT INTO public.moon VALUES (6, 6, NULL, 'Saturn-1', 'Sol-6-1', 100.00, 100.00, NULL, NULL, 100.00, NULL, false, false, 0, '2024-04-02 21:51:04.319678', NULL, NULL);
INSERT INTO public.moon VALUES (7, 7, NULL, 'Uranus-1', 'Sol-7-1', 100.00, 100.00, NULL, NULL, 100.00, NULL, false, false, 0, '2024-04-02 21:51:04.319678', NULL, NULL);
INSERT INTO public.moon VALUES (8, 8, NULL, 'Neptune-1', 'Sol-8-1', 100.00, 100.00, NULL, NULL, 100.00, NULL, false, false, 0, '2024-04-02 21:51:04.319678', NULL, NULL);
INSERT INTO public.moon VALUES (9, 9, NULL, 'Pluto-1', 'Sol-9-1', 100.00, 100.00, NULL, NULL, 100.00, NULL, false, false, 0, '2024-04-02 21:51:04.319678', NULL, NULL);
INSERT INTO public.moon VALUES (10, 10, NULL, 'Ceres-1', 'Sol-10-1', 100.00, 100.00, NULL, NULL, 100.00, NULL, false, false, 0, '2024-04-02 21:51:04.319678', NULL, NULL);
INSERT INTO public.moon VALUES (11, 11, NULL, 'Cerez-1', 'Sol-11-1', 100.00, 100.00, NULL, NULL, 100.00, NULL, false, false, 0, '2024-04-02 21:51:04.319678', NULL, NULL);
INSERT INTO public.moon VALUES (13, 1, NULL, 'Moon-1', 'Moon-1', 100.00, 100.00, NULL, NULL, 100.00, NULL, false, false, 0, '2024-04-02 22:09:41.791556', NULL, NULL);
INSERT INTO public.moon VALUES (14, 1, NULL, 'Moon-2', 'Moon-2', 100.00, 100.00, NULL, NULL, 100.00, NULL, false, false, 0, '2024-04-02 22:09:41.791556', NULL, NULL);
INSERT INTO public.moon VALUES (15, 1, NULL, 'Moon-3', 'Moon-3', 100.00, 100.00, NULL, NULL, 100.00, NULL, false, false, 0, '2024-04-02 22:09:41.791556', NULL, NULL);
INSERT INTO public.moon VALUES (16, 1, NULL, 'Moon-4', 'Moon-4', 100.00, 100.00, NULL, NULL, 100.00, NULL, false, false, 0, '2024-04-02 22:09:41.791556', NULL, NULL);
INSERT INTO public.moon VALUES (17, 1, NULL, 'Moon-5', 'Moon-5', 100.00, 100.00, NULL, NULL, 100.00, NULL, false, false, 0, '2024-04-02 22:09:41.791556', NULL, NULL);
INSERT INTO public.moon VALUES (18, 1, NULL, 'Moon-6', 'Moon-6', 100.00, 100.00, NULL, NULL, 100.00, NULL, false, false, 0, '2024-04-02 22:09:41.791556', NULL, NULL);
INSERT INTO public.moon VALUES (19, 1, NULL, 'Moon-7', 'Moon-7', 100.00, 100.00, NULL, NULL, 100.00, NULL, false, false, 0, '2024-04-02 22:09:41.791556', NULL, NULL);
INSERT INTO public.moon VALUES (20, 1, NULL, 'Moon-8', 'Moon-8', 100.00, 100.00, NULL, NULL, 100.00, NULL, false, false, 0, '2024-04-02 22:09:41.791556', NULL, NULL);
INSERT INTO public.moon VALUES (12, 1, NULL, 'Kepler-22b-2', 'Kepler-22b-2', 100.00, 100.00, NULL, NULL, 100.00, NULL, false, false, 0, '2024-04-02 22:10:35.831505', NULL, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 1, 1, 1, 'Earth', 'Sol-3', 100.00, 100.00, NULL, NULL, 149600000.00, 0, NULL, false, false, 0, '2024-04-02 21:48:13.174251', NULL, NULL);
INSERT INTO public.planet VALUES (2, 1, 1, 1, 'Mars', 'Sol-4', 100.00, 100.00, NULL, NULL, 227900000.00, 0, NULL, false, false, 0, '2024-04-02 21:48:13.174251', NULL, NULL);
INSERT INTO public.planet VALUES (3, 1, 1, 1, 'Mercury', 'Sol-1', 100.00, 100.00, NULL, NULL, 57909175.00, 0, NULL, false, false, 0, '2024-04-02 21:48:13.174251', NULL, NULL);
INSERT INTO public.planet VALUES (4, 1, 1, 1, 'Venus', 'Sol-2', 100.00, 100.00, NULL, NULL, 108208930.00, 0, NULL, false, false, 0, '2024-04-02 21:48:13.174251', NULL, NULL);
INSERT INTO public.planet VALUES (5, 1, 1, 1, 'Jupiter', 'Sol-5', 100.00, 100.00, NULL, NULL, 778570000.00, 0, NULL, false, false, 0, '2024-04-02 21:48:13.174251', NULL, NULL);
INSERT INTO public.planet VALUES (6, 1, 1, 1, 'Saturn', 'Sol-6', 100.00, 100.00, NULL, NULL, 1433530000.00, 0, NULL, false, false, 0, '2024-04-02 21:48:13.174251', NULL, NULL);
INSERT INTO public.planet VALUES (7, 1, 1, 1, 'Uranus', 'Sol-7', 100.00, 100.00, NULL, NULL, 2872460000.00, 0, NULL, false, false, 0, '2024-04-02 21:48:13.174251', NULL, NULL);
INSERT INTO public.planet VALUES (8, 1, 1, 1, 'Neptune', 'Sol-8', 100.00, 100.00, NULL, NULL, 4495060000.00, 0, NULL, false, false, 0, '2024-04-02 21:48:13.174251', NULL, NULL);
INSERT INTO public.planet VALUES (9, 1, 1, 1, 'Pluto', 'Sol-9', 100.00, 100.00, NULL, NULL, 5906400000.00, 0, NULL, false, false, 0, '2024-04-02 21:48:13.174251', NULL, NULL);
INSERT INTO public.planet VALUES (10, 1, 1, 1, 'Ceres', 'Sol-10', 100.00, 100.00, NULL, NULL, 5906400000.00, 0, NULL, false, false, 0, '2024-04-02 21:48:13.174251', NULL, NULL);
INSERT INTO public.planet VALUES (11, 1, 1, 1, 'Cerez', 'Sol-11', 100.00, 100.00, NULL, NULL, 5906400000.00, 0, NULL, false, false, 0, '2024-04-02 21:48:13.174251', NULL, NULL);
INSERT INTO public.planet VALUES (12, 2, 1, 1, 'Kepler-22b', 'Kepler-22b', 100.00, 100.00, NULL, NULL, 211200000.00, 0, NULL, false, false, 0, '2024-04-02 21:48:13.174251', NULL, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 1, 1, NULL, 'Sun', 'Sol', 100.00, 100.00, NULL, NULL, NULL, NULL, NULL, 100.00, 0, 0, NULL, '2024-04-02 21:50:08.596594', NULL, NULL);
INSERT INTO public.star VALUES (2, 1, 1, NULL, 'Proxima Centauri', 'Proxima Centauri', 100.00, 100.00, NULL, NULL, NULL, NULL, NULL, 100.00, 0, 0, NULL, '2024-04-02 21:50:08.596594', NULL, NULL);
INSERT INTO public.star VALUES (3, 2, 1, NULL, 'Alpha Centauri A', 'Alpha Centauri A', 100.00, 100.00, NULL, NULL, NULL, NULL, NULL, 100.00, 0, 0, NULL, '2024-04-02 21:50:08.596594', NULL, NULL);
INSERT INTO public.star VALUES (4, 1, 1, NULL, 'Sirius', 'Sirius', 100.00, 100.00, NULL, NULL, NULL, NULL, NULL, 100.00, 0, 0, NULL, '2024-04-02 21:50:08.596594', NULL, NULL);
INSERT INTO public.star VALUES (5, 1, 1, NULL, 'Vega', 'Vega', 100.00, 100.00, NULL, NULL, NULL, NULL, NULL, 100.00, 0, 0, NULL, '2024-04-02 21:50:08.596594', NULL, NULL);
INSERT INTO public.star VALUES (6, 1, 1, NULL, 'Betelgeuse', 'Betelgeuse', 100.00, 100.00, NULL, NULL, NULL, NULL, NULL, 100.00, 0, 0, NULL, '2024-04-02 21:50:08.596594', NULL, NULL);
INSERT INTO public.star VALUES (7, 1, 1, NULL, 'Rigel', 'Rigel', 100.00, 100.00, NULL, NULL, NULL, NULL, NULL, 100.00, 0, 0, NULL, '2024-04-02 21:50:08.596594', NULL, NULL);
INSERT INTO public.star VALUES (8, 1, 1, NULL, 'Antares', 'Antares', 100.00, 100.00, NULL, NULL, NULL, NULL, NULL, 100.00, 0, 0, NULL, '2024-04-02 21:50:08.596594', NULL, NULL);
INSERT INTO public.star VALUES (9, 1, 1, NULL, 'Pollux', 'Pollux', 100.00, 100.00, NULL, NULL, NULL, NULL, NULL, 100.00, 0, 0, NULL, '2024-04-02 21:50:08.596594', NULL, NULL);
INSERT INTO public.star VALUES (10, 1, 1, NULL, 'Arcturus', 'Arcturus', 100.00, 100.00, NULL, NULL, NULL, NULL, NULL, 100.00, 0, 0, NULL, '2024-04-02 21:50:08.596594', NULL, NULL);
INSERT INTO public.star VALUES (11, 1, 1, NULL, 'Aldebaran', 'Aldebaran', 100.00, 100.00, NULL, NULL, NULL, NULL, NULL, 100.00, 0, 0, NULL, '2024-04-02 21:50:08.596594', NULL, NULL);
INSERT INTO public.star VALUES (12, 1, 1, NULL, 'Altair', 'Altair', 100.00, 100.00, NULL, NULL, NULL, NULL, NULL, 100.00, 0, 0, NULL, '2024-04-02 21:50:08.596594', NULL, NULL);
INSERT INTO public.star VALUES (13, 1, 1, NULL, 'Deneb', 'Deneb', 100.00, 100.00, NULL, NULL, NULL, NULL, NULL, 100.00, 0, 0, NULL, '2024-04-02 21:50:08.596594', NULL, NULL);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 11, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 19, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 13, true);


--
-- Name: contributor contributor_contributor_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.contributor
    ADD CONSTRAINT contributor_contributor_id_key UNIQUE (contributor_id);


--
-- Name: contributor contributor_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.contributor
    ADD CONSTRAINT contributor_pkey PRIMARY KEY (contributor_id);


--
-- Name: galaxy galaxy_celestial_identifier_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_celestial_identifier_key UNIQUE (celestial_identifier);


--
-- Name: galaxy galaxy_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_celestial_identifier_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_celestial_identifier_key UNIQUE (celestial_identifier);


--
-- Name: moon moon_moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_id_key UNIQUE (moon_id);


--
-- Name: moon moon_moon_id_key1; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_id_key1 UNIQUE (moon_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_celestial_identifier_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_celestial_identifier_key UNIQUE (celestial_identifier);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_id_key UNIQUE (planet_id);


--
-- Name: planet planet_planet_id_key1; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_id_key1 UNIQUE (planet_id);


--
-- Name: planet planet_planet_id_key2; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_id_key2 UNIQUE (planet_id);


--
-- Name: star star_celestial_identifier_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_celestial_identifier_key UNIQUE (celestial_identifier);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_id_key UNIQUE (star_id);


--
-- Name: galaxy galaxy_contributor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_contributor_id_fkey FOREIGN KEY (contributor_id) REFERENCES public.contributor(contributor_id);


--
-- Name: moon moon_discovered_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_discovered_by_fkey FOREIGN KEY (contributor_id) REFERENCES public.contributor(contributor_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: moon moon_planet_id_fkey1; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey1 FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_moon_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_moon_id_fkey FOREIGN KEY (moon_id) REFERENCES public.moon(moon_id);


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
-- Name: star star_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- PostgreSQL database dump complete
--

