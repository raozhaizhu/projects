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

DROP DATABASE students;
--
-- Name: students; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE students WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE students OWNER TO freecodecamp;

\connect students

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
-- Name: courses; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.courses (
    course_id integer NOT NULL,
    course character varying(100) NOT NULL
);


ALTER TABLE public.courses OWNER TO freecodecamp;

--
-- Name: courses_course_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.courses_course_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.courses_course_id_seq OWNER TO freecodecamp;

--
-- Name: courses_course_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.courses_course_id_seq OWNED BY public.courses.course_id;


--
-- Name: majors; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.majors (
    major_id integer NOT NULL,
    major character varying(50) NOT NULL
);


ALTER TABLE public.majors OWNER TO freecodecamp;

--
-- Name: majors_courses; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.majors_courses (
    major_id integer NOT NULL,
    course_id integer NOT NULL
);


ALTER TABLE public.majors_courses OWNER TO freecodecamp;

--
-- Name: majors_major_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.majors_major_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.majors_major_id_seq OWNER TO freecodecamp;

--
-- Name: majors_major_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.majors_major_id_seq OWNED BY public.majors.major_id;


--
-- Name: students; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.students (
    student_id integer NOT NULL,
    first_name character varying(50) NOT NULL,
    last_name character varying(50) NOT NULL,
    major_id integer,
    gpa numeric(2,1)
);


ALTER TABLE public.students OWNER TO freecodecamp;

--
-- Name: students_student_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.students_student_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.students_student_id_seq OWNER TO freecodecamp;

--
-- Name: students_student_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.students_student_id_seq OWNED BY public.students.student_id;


--
-- Name: courses course_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.courses ALTER COLUMN course_id SET DEFAULT nextval('public.courses_course_id_seq'::regclass);


--
-- Name: majors major_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.majors ALTER COLUMN major_id SET DEFAULT nextval('public.majors_major_id_seq'::regclass);


--
-- Name: students student_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.students ALTER COLUMN student_id SET DEFAULT nextval('public.students_student_id_seq'::regclass);


--
-- Data for Name: courses; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.courses VALUES (29, 'Data Structures and Algorithms');
INSERT INTO public.courses VALUES (30, 'Web Programming');
INSERT INTO public.courses VALUES (31, 'Database Systems');
INSERT INTO public.courses VALUES (32, 'Computer Networks');
INSERT INTO public.courses VALUES (33, 'SQL');
INSERT INTO public.courses VALUES (34, 'Machine Learning');
INSERT INTO public.courses VALUES (35, 'Computer Systems');
INSERT INTO public.courses VALUES (36, 'Web Applications');
INSERT INTO public.courses VALUES (37, 'Artificial Intelligence');
INSERT INTO public.courses VALUES (38, 'Python');
INSERT INTO public.courses VALUES (39, 'Object-Oriented Programming');
INSERT INTO public.courses VALUES (40, 'Calculus');
INSERT INTO public.courses VALUES (41, 'Game Architecture');
INSERT INTO public.courses VALUES (42, 'Algorithms');
INSERT INTO public.courses VALUES (43, 'UNIX');
INSERT INTO public.courses VALUES (44, 'Server Administration');
INSERT INTO public.courses VALUES (45, 'Network Security');


--
-- Data for Name: majors; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.majors VALUES (42, 'Database Administration');
INSERT INTO public.majors VALUES (43, 'Web Development');
INSERT INTO public.majors VALUES (44, 'Data Science');
INSERT INTO public.majors VALUES (45, 'Network Engineering');
INSERT INTO public.majors VALUES (46, 'Computer Programming');
INSERT INTO public.majors VALUES (47, 'Game Design');
INSERT INTO public.majors VALUES (48, 'System Administration');


--
-- Data for Name: majors_courses; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.majors_courses VALUES (42, 29);
INSERT INTO public.majors_courses VALUES (43, 30);
INSERT INTO public.majors_courses VALUES (42, 31);
INSERT INTO public.majors_courses VALUES (44, 29);
INSERT INTO public.majors_courses VALUES (45, 32);
INSERT INTO public.majors_courses VALUES (42, 33);
INSERT INTO public.majors_courses VALUES (44, 34);
INSERT INTO public.majors_courses VALUES (45, 35);
INSERT INTO public.majors_courses VALUES (46, 32);
INSERT INTO public.majors_courses VALUES (42, 36);
INSERT INTO public.majors_courses VALUES (47, 37);
INSERT INTO public.majors_courses VALUES (44, 38);
INSERT INTO public.majors_courses VALUES (46, 39);
INSERT INTO public.majors_courses VALUES (48, 35);
INSERT INTO public.majors_courses VALUES (47, 40);
INSERT INTO public.majors_courses VALUES (43, 29);
INSERT INTO public.majors_courses VALUES (44, 40);
INSERT INTO public.majors_courses VALUES (43, 39);
INSERT INTO public.majors_courses VALUES (47, 41);
INSERT INTO public.majors_courses VALUES (48, 32);
INSERT INTO public.majors_courses VALUES (47, 42);
INSERT INTO public.majors_courses VALUES (48, 43);
INSERT INTO public.majors_courses VALUES (48, 44);
INSERT INTO public.majors_courses VALUES (46, 35);
INSERT INTO public.majors_courses VALUES (46, 38);
INSERT INTO public.majors_courses VALUES (45, 45);
INSERT INTO public.majors_courses VALUES (43, 36);
INSERT INTO public.majors_courses VALUES (45, 42);


--
-- Data for Name: students; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.students VALUES (6, 'Rhea', 'Kellems', 42, 2.5);
INSERT INTO public.students VALUES (7, 'Emma', 'Gilbert', NULL, NULL);
INSERT INTO public.students VALUES (8, 'Kimberly', 'Whitley', 43, 3.8);
INSERT INTO public.students VALUES (9, 'Jimmy', 'Felipe', 42, 3.7);
INSERT INTO public.students VALUES (10, 'Kyle', 'Stimson', NULL, 2.8);
INSERT INTO public.students VALUES (11, 'Casares', 'Hijo', 47, 4.0);
INSERT INTO public.students VALUES (12, 'Noe', 'Savage', NULL, 3.6);
INSERT INTO public.students VALUES (13, 'Sterling', 'Boss', 47, 3.9);
INSERT INTO public.students VALUES (14, 'Brian', 'Davis', NULL, 2.3);
INSERT INTO public.students VALUES (15, 'Kaija', 'Uronen', 47, 3.7);
INSERT INTO public.students VALUES (16, 'Faye', 'Conn', 47, 2.1);
INSERT INTO public.students VALUES (17, 'Efren', 'Reilly', 43, 3.9);
INSERT INTO public.students VALUES (18, 'Danh', 'Nhung', NULL, 2.4);
INSERT INTO public.students VALUES (19, 'Maxine', 'Hagenes', 42, 2.9);
INSERT INTO public.students VALUES (20, 'Larry', 'Saunders', 44, 2.2);
INSERT INTO public.students VALUES (21, 'Karl', 'Kuhar', 43, NULL);
INSERT INTO public.students VALUES (22, 'Lieke', 'Hazenveld', 47, 3.5);
INSERT INTO public.students VALUES (23, 'Obie', 'Hilpert', 43, NULL);
INSERT INTO public.students VALUES (24, 'Peter', 'Booysen', NULL, 2.9);
INSERT INTO public.students VALUES (25, 'Nathan', 'Turner', 42, 3.3);
INSERT INTO public.students VALUES (26, 'Gerald', 'Osiki', 44, 2.2);
INSERT INTO public.students VALUES (27, 'Vanya', 'Hassanah', 47, 4.0);
INSERT INTO public.students VALUES (28, 'Roxelana', 'Florescu', 42, 3.2);
INSERT INTO public.students VALUES (29, 'Helene', 'Parker', 44, 3.4);
INSERT INTO public.students VALUES (30, 'Mariana', 'Russel', 43, 1.8);
INSERT INTO public.students VALUES (31, 'Ajit', 'Dhungel', NULL, 3.0);
INSERT INTO public.students VALUES (32, 'Mehdi', 'Vandenberghe', 42, 1.9);
INSERT INTO public.students VALUES (33, 'Dejon', 'Howell', 43, 4.0);
INSERT INTO public.students VALUES (34, 'Aliya', 'Gulgowski', 48, 2.6);
INSERT INTO public.students VALUES (35, 'Ana', 'Tupajic', 44, 3.1);
INSERT INTO public.students VALUES (36, 'Hugo', 'Duran', NULL, 3.8);


--
-- Name: courses_course_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.courses_course_id_seq', 45, true);


--
-- Name: majors_major_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.majors_major_id_seq', 48, true);


--
-- Name: students_student_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.students_student_id_seq', 36, true);


--
-- Name: courses courses_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.courses
    ADD CONSTRAINT courses_pkey PRIMARY KEY (course_id);


--
-- Name: majors_courses majors_courses_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.majors_courses
    ADD CONSTRAINT majors_courses_pkey PRIMARY KEY (major_id, course_id);


--
-- Name: majors majors_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.majors
    ADD CONSTRAINT majors_pkey PRIMARY KEY (major_id);


--
-- Name: students students_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_pkey PRIMARY KEY (student_id);


--
-- Name: majors_courses majors_courses_course_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.majors_courses
    ADD CONSTRAINT majors_courses_course_id_fkey FOREIGN KEY (course_id) REFERENCES public.courses(course_id);


--
-- Name: majors_courses majors_courses_major_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.majors_courses
    ADD CONSTRAINT majors_courses_major_id_fkey FOREIGN KEY (major_id) REFERENCES public.majors(major_id);


--
-- Name: students students_major_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_major_id_fkey FOREIGN KEY (major_id) REFERENCES public.majors(major_id);


--
-- PostgreSQL database dump complete
--

