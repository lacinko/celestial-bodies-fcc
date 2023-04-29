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
-- Name: black_hole; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.black_hole (
    black_hole_id integer NOT NULL,
    name character varying(255) NOT NULL,
    black_hole_type character varying(255)
);


ALTER TABLE public.black_hole OWNER TO freecodecamp;

--
-- Name: black_hole_black_hole_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.black_hole_black_hole_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.black_hole_black_hole_id_seq OWNER TO freecodecamp;

--
-- Name: black_hole_black_hole_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.black_hole_black_hole_id_seq OWNED BY public.black_hole.black_hole_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(255) NOT NULL,
    description text,
    galaxy_type character varying(255) NOT NULL,
    age_in_milions_of_years integer
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
    name character varying(255) NOT NULL,
    description text,
    weight_in_tons numeric(6,2),
    planet_id integer NOT NULL,
    radius_in_km integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

ALTER TABLE public.moon ALTER COLUMN moon_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.moon_moon_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(255) NOT NULL,
    has_life boolean NOT NULL,
    description text,
    distance_from_earth numeric(10,2),
    star_id integer NOT NULL,
    has_moon boolean NOT NULL,
    radius_in_km integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

ALTER TABLE public.planet ALTER COLUMN planet_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.planet_planet_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(255) NOT NULL,
    star_type character varying(255) NOT NULL,
    description text,
    age_in_milions_of_years integer,
    galaxy_id integer NOT NULL,
    radius_in_milions_of_km integer
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
-- Name: black_hole black_hole_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole ALTER COLUMN black_hole_id SET DEFAULT nextval('public.black_hole_black_hole_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: black_hole; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.black_hole VALUES (1, 'Fornax A', 'Supermassive');
INSERT INTO public.black_hole VALUES (2, 'ML82 X-1', 'Intermediate-mass');
INSERT INTO public.black_hole VALUES (3, 'A0620-00/V616 Mon', 'Stellar');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (2, 'Andromeda Galaxy (M31)', NULL, 'spiral galaxy', 10000);
INSERT INTO public.galaxy VALUES (1, 'Milky Way Galaxy', NULL, 'barred spiral galaxy', 13600);
INSERT INTO public.galaxy VALUES (3, 'Triangulum Galaxy (M33)', NULL, ' small spiral galaxy', 15000);
INSERT INTO public.galaxy VALUES (4, 'Large Magellanic Cloud (LMC)', NULL, 'dwarf irregular galaxy', 1500);
INSERT INTO public.galaxy VALUES (5, 'Small Magellanic Cloud (SMC)', NULL, 'dwarf irregular galaxy', 2000);
INSERT INTO public.galaxy VALUES (6, 'Whirlpool Galaxy (M51)', NULL, 'spiral galaxy', 400);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (1, 'Moon', NULL, 7347.90, 14, 1737);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (3, 'Phobos', NULL, 10.60, 2, 22);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (4, 'Deimos', NULL, 2.40, 2, 12);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (5, 'Ganymede', NULL, 1481.92, 15, 2634);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (6, 'Callisto', NULL, 1075.91, 15, 2408);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (7, 'Europa', NULL, 4801.00, 15, 1561);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (8, 'Io', NULL, 8932.00, 15, 1822);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (9, 'Titan', NULL, 1345.00, 16, 2576);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (10, 'Enceladus', NULL, 1076.00, 16, 252);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (11, 'Mimas', NULL, 374.00, 16, 198);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (12, 'Tethys', NULL, 6170.00, 16, 531);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (13, 'Miranda', NULL, 659.00, 18, 236);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (14, 'Triton', NULL, 2140.00, 17, 1353);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (16, 'Nereid', NULL, 2.06, 18, 170);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (17, 'Proteus', NULL, 4945.00, 18, 210);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (18, 'Umbriel', NULL, 1174.00, 17, 585);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (19, 'Ariel', NULL, 1321.00, 17, 579);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (20, 'Oberon', NULL, 3012.00, 17, 761);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (21, 'Titania', NULL, 3526.00, 17, 789);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (22, 'Charon', NULL, 2095.00, 17, 606);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (1, 'Venus', false, NULL, 108.00, 1, false, 12104);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (2, 'Mars', false, NULL, 78.00, 1, true, 3389);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (3, 'Proxima Centauri b', false, NULL, 4.24, 2, false, 16000);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (4, 'Proxima Centauri c', false, NULL, 5.24, 2, false, 91000);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (5, 'Kepler-22b', false, NULL, 620.00, 3, false, 30000);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (6, 'Kepler-186f', false, NULL, 700.00, 3, false, 14000);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (7, 'TRAPPIST-1d', false, NULL, 40.00, 4, false, 9000);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (8, 'TRAPPIST-1e', false, NULL, 38.00, 4, false, 12000);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (9, 'LHS 1140b', false, NULL, 40.00, 5, false, 21000);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (10, 'LHS 1140c', false, NULL, 42.00, 5, false, 18000);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (11, 'HD 40307g', false, NULL, 42.00, 6, false, 19500);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (12, 'HD 40307h', false, NULL, 46.00, 6, false, 27000);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (13, 'Mercury', false, NULL, 77.00, 1, false, 2440);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (14, 'Earth', true, NULL, 0.00, 1, true, 6371);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (15, 'Jupiter', false, NULL, 628.00, 1, true, 69911);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (16, 'Saturn', false, NULL, 1241.00, 1, false, 58232);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (17, 'Uranus', false, NULL, 2700.00, 1, true, 25362);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (18, 'Neptune', false, NULL, 4300.00, 1, true, 24622);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'G-type main-sequence star', NULL, 4600, 1, 0);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 'red giant star', NULL, 10000, 2, 100);
INSERT INTO public.star VALUES (3, 'Kepler-22', 'blue supergiant star', NULL, 30, 3, 35);
INSERT INTO public.star VALUES (4, 'TRAPPIST-1', 'Wolf-Rayet star', NULL, 2, 4, 36);
INSERT INTO public.star VALUES (5, 'LHS 1140', 'luminous blue variable star', NULL, 4, 5, 200);
INSERT INTO public.star VALUES (6, 'HD 40307', 'blue supergiant star', NULL, 10, 6, 22);


--
-- Name: black_hole_black_hole_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.black_hole_black_hole_id_seq', 3, true);


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

SELECT pg_catalog.setval('public.planet_planet_id_seq', 18, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: black_hole black_hole_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole
    ADD CONSTRAINT black_hole_name_key UNIQUE (name);


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
-- Name: black_hole pk_black_hole_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole
    ADD CONSTRAINT pk_black_hole_key PRIMARY KEY (black_hole_id);


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
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star fk_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon fk_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

