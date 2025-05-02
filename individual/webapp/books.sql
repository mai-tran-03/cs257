--
-- PostgreSQL database dump
--

-- Dumped from database version 14.11 (Homebrew)
-- Dumped by pg_dump version 14.11 (Homebrew)

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
-- Name: authors; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.authors (
    id integer NOT NULL,
    surname text,
    given_name text,
    birth_year integer,
    death_year integer
);


--
-- Name: books; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.books (
    id integer NOT NULL,
    title text,
    publication_year integer
);


--
-- Name: books_authors; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.books_authors (
    book_id integer,
    author_id integer
);


--
-- Data for Name: authors; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.authors (id, surname, given_name, birth_year, death_year) FROM stdin;
0	Willis	Connie	1945	\N
1	Christie	Agatha	1890	1976
2	Morrison	Toni	1931	\N
3	Conger	Kate	1989	\N
4	Mac	Ryan	\N	\N
5	Lewis	Sinclair	1885	1951
6	Austen	Jane	1775	1817
7	Brontë	Charlotte	1816	1855
8	Wodehouse	P.G.	1881	1975
9	Márquez	Gabriel García	1927	2014
10	Kritzer	Naomi	1973	\N
11	Bujold	Lois McMaster	1949	\N
12	Melville	Herman	1819	1891
13	Sterne	Laurence	1713	1768
14	Osman	Richard	1970	\N
15	Brontë	Ann	1820	1849
16	Brontë	Emily	1818	1848
\.


--
-- Data for Name: books; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.books (id, title, publication_year) FROM stdin;
0	All Clear	2010
1	And Then There Were None	1939
2	Beloved	1987
3	Blackout	2010
4	Character Limit	2024
5	Elmer Gantry	1927
6	Emma	1815
7	Jane Eyre	1847
8	Leave it to Psmith	1923
9	Love in the Time of Cholera	1985
10	Catfishing on Catnet	2019
11	Main Street	1920
12	Mirror Dance	1994
13	Moby Dick	1851
14	Murder on the Orient Express	1934
15	Omoo	1847
16	One Hundred Years of Solitude	1967
17	Pride and Prejudice	1813
18	Right Ho, Jeeves	1934
19	Liberty's Daughter	2023
20	Sense and Sensibility	1813
21	Shards of Honor	1986
22	Sula	1973
23	The Code of the Woosters	1938
24	The Life and Opinions of Tristram Shandy, Gentleman	1759
25	The Thursday Murder Club	2020
26	The Tenant of Wildfell Hall	1848
27	To Say Nothing of the Dog	1997
28	Villette	1853
29	The Man Who Died Twice	2021
30	Wuthering Heights	1847
\.


--
-- Data for Name: books_authors; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.books_authors (book_id, author_id) FROM stdin;
0	0
1	1
2	2
3	0
4	3
4	4
5	5
6	6
7	7
8	8
9	9
10	10
11	5
12	11
13	12
14	1
15	12
16	9
17	6
18	8
19	10
20	6
21	11
22	2
23	8
24	13
25	14
26	15
27	0
28	7
29	14
30	16
\.


--
-- PostgreSQL database dump complete
--

