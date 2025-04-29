--
-- PostgreSQL database dump
--

-- Dumped from database version 14.17 (Homebrew)
-- Dumped by pg_dump version 14.17 (Homebrew)

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
-- Name: continents; Type: TABLE; Schema: public; Owner: kezia
--

CREATE TABLE public.continents (
    continent_id integer,
    continent_name text
);


ALTER TABLE public.continents OWNER TO kezia;

--
-- Name: countries_flags; Type: TABLE; Schema: public; Owner: kezia
--

CREATE TABLE public.countries_flags (
    tld text,
    country_name text,
    other_names text,
    area integer,
    population integer,
    continent_id integer,
    bars integer,
    stripes integer,
    bends integer,
    red boolean,
    green boolean,
    blue boolean,
    gold_yellow boolean,
    white boolean,
    black_grey boolean,
    orange_brown boolean,
    pink_purple boolean,
    main_hue text,
    circles integer,
    crosses integer,
    saltires integer,
    quarters integer,
    sun_stars integer,
    crescent_moon boolean,
    triangle boolean,
    inanimate_image boolean,
    animate_image boolean,
    text boolean,
    crest_emblem boolean
);


ALTER TABLE public.countries_flags OWNER TO kezia;

--
-- Name: languages; Type: TABLE; Schema: public; Owner: kezia
--

CREATE TABLE public.languages (
    language_id text,
    language_name text
);


ALTER TABLE public.languages OWNER TO kezia;

--
-- Name: languages_countries; Type: TABLE; Schema: public; Owner: kezia
--

CREATE TABLE public.languages_countries (
    language_id text,
    tld text
);


ALTER TABLE public.languages_countries OWNER TO kezia;

--
-- Data for Name: continents; Type: TABLE DATA; Schema: public; Owner: kezia
--

COPY public.continents (continent_id, continent_name) FROM stdin;
1	Africa
2	Asia
3	Europe
4	North America
5	Oceania
6	South America
\.


--
-- Data for Name: countries_flags; Type: TABLE DATA; Schema: public; Owner: kezia
--

COPY public.countries_flags (tld, country_name, other_names, area, population, continent_id, bars, stripes, bends, red, green, blue, gold_yellow, white, black_grey, orange_brown, pink_purple, main_hue, circles, crosses, saltires, quarters, sun_stars, crescent_moon, triangle, inanimate_image, animate_image, text, crest_emblem) FROM stdin;
af	Afghanistan	Islamic Republic of Afghanistan	652230	40121552	2	3	0	0	t	t	f	f	t	t	f	f	red	0	0	0	0	0	f	f	t	f	t	t
al	Albania	\N	28748	3107100	3	0	0	0	t	f	f	f	f	t	f	f	red	0	0	0	0	0	f	f	f	t	f	f
dz	Algeria	\N	2381740	47022473	1	2	0	0	t	t	f	f	t	f	f	f	green	0	0	0	0	1	t	f	f	f	f	f
as	American Samoa	\N	224	43895	5	0	0	0	t	f	t	t	t	f	f	f	blue	0	0	0	0	0	f	t	t	t	f	f
ad	Andorra	\N	468	85370	3	3	0	0	t	f	t	t	f	f	f	f	gold	0	0	0	0	0	f	f	t	t	t	t
ao	Angola	\N	1246700	37202061	1	0	2	0	t	f	f	t	f	t	f	f	red	0	0	0	0	1	f	f	t	f	f	t
ai	Anguilla	\N	91	19416	4	0	0	0	t	f	t	f	t	f	t	f	blue	0	2	2	1	0	f	f	f	t	f	t
ag	Antigua and Barbuda	\N	443	102634	4	0	1	0	t	f	t	t	t	t	f	f	red	0	0	0	0	1	f	t	f	f	f	f
ar	Argentina	Argentine Republic	2780400	46994384	6	0	3	0	f	f	t	t	t	f	f	f	blue	0	0	0	0	1	f	f	f	f	f	f
am	Armenia	\N	29743	2976765	3	0	3	0	t	f	t	f	f	f	t	f	red	0	0	0	0	0	f	f	f	f	f	f
aw	Aruba	\N	180	125063	6	0	2	0	t	f	t	t	t	f	f	f	blue	0	0	0	0	1	f	f	f	f	f	f
au	Australia	\N	7741220	26768598	5	0	0	0	t	f	t	f	t	f	f	f	blue	0	2	2	1	6	f	f	f	f	f	f
at	Austria	\N	83871	8967982	3	0	3	0	t	f	f	f	t	f	f	f	red	0	0	0	0	0	f	f	f	f	f	f
az	Azerbaijan	\N	86600	10650239	2	0	3	0	t	t	t	f	t	f	f	f	blue	0	0	0	0	1	t	f	f	f	f	f
bs	Bahamas	Commonwealth of the Bahamas	13880	410862	4	0	3	0	f	f	t	t	f	t	f	f	blue	0	0	0	0	0	f	t	f	f	f	f
bh	Bahrain	\N	760	1566888	2	0	0	0	t	f	f	f	t	f	f	f	red	0	0	0	0	0	f	t	f	f	f	f
bd	Bangladesh	\N	148460	168697184	2	0	0	0	t	t	f	f	f	f	f	f	green	1	0	0	0	0	f	f	f	f	f	f
bb	Barbados	\N	430	304139	4	3	0	0	f	f	t	t	f	t	f	f	blue	0	0	0	0	0	f	f	t	f	f	f
by	Belarus	\N	207600	9501451	3	0	2	0	t	t	f	f	t	f	f	f	red	0	0	0	0	0	f	f	t	f	f	f
be	Belgium	\N	30528	11977634	3	3	0	0	t	f	f	t	f	t	f	f	gold	0	0	0	0	0	f	f	f	f	f	f
bz	Belize	\N	22966	415789	4	0	2	0	t	t	t	t	t	t	t	f	blue	1	0	0	0	0	f	f	t	t	t	t
bj	Benin	\N	112622	14697052	1	1	2	0	t	t	f	t	f	f	f	f	green	0	0	0	0	0	f	f	f	f	f	f
bm	Bermuda	\N	54	72800	4	0	0	0	t	t	t	t	t	t	t	f	red	0	2	2	1	0	f	f	t	t	f	t
bt	Bhutan	\N	38394	884546	2	0	0	0	f	f	f	t	t	t	t	f	gold	4	0	0	0	0	f	f	f	t	f	f
bo	Bolivia	Plurinational State of Bolivia	1098581	12311974	1	0	3	0	t	t	t	t	t	t	t	f	red	0	0	0	0	10	f	f	t	t	t	t
ba	Bosnia and Herzegovina	\N	51197	3798671	3	1	0	0	f	f	t	t	t	f	f	f	blue	0	0	0	0	8	f	t	f	f	f	f
bw	Botswana	\N	581730	2450668	1	0	3	0	f	f	t	f	t	t	f	f	blue	0	0	0	0	0	f	f	f	f	f	f
br	Brazil	\N	8515770	220051512	6	0	0	0	f	t	t	t	t	f	f	f	green	1	0	0	0	27	f	f	f	f	t	f
vg	British Virgin Islands	\N	151	40102	4	0	0	0	t	t	t	t	t	t	t	f	blue	0	2	2	1	0	f	f	t	t	t	t
bn	Brunei	Brunei Darussalam	5765	491900	2	0	0	2	t	f	f	t	t	t	f	f	gold	0	0	0	0	0	f	t	t	t	t	t
bg	Bulgaria	\N	110879	6782659	3	0	3	0	t	t	f	f	t	f	f	f	white	0	0	0	0	0	f	f	f	f	f	f
bf	Burkina Faso	\N	274200	23042199	1	0	2	0	t	t	f	t	f	f	f	f	red	0	0	0	0	1	f	f	f	f	f	f
bi	Burundi	\N	27830	13590102	1	0	0	0	t	t	f	f	t	f	f	f	red	1	0	1	0	3	f	f	f	f	f	f
cv	Cabo Verde	Republic of Cabo Verde; Cape Verde	4033	611014	1	1	2	0	t	t	f	t	f	t	t	f	gold	0	0	0	0	1	f	f	f	t	f	f
kh	Cambodia	\N	181035	17063669	2	0	3	0	t	f	t	f	t	f	f	f	blue	0	0	0	0	0	f	f	t	f	f	t
cm	Cameroon	\N	475440	30966105	1	3	0	0	t	t	f	t	f	f	f	f	gold	0	0	0	0	1	f	f	f	f	f	f
ca	Canada	\N	9984670	38794813	4	2	0	0	t	f	f	f	t	f	f	f	red	0	0	0	0	0	f	f	f	t	f	f
ky	Cayman Islands	\N	264	66653	4	0	0	0	t	t	t	t	t	f	t	f	blue	1	1	1	1	4	f	f	t	t	t	f
cf	Central Africa	CAR	622984	5650957	1	1	0	0	t	t	t	t	t	f	f	f	gold	0	0	0	0	1	f	f	f	f	f	f
td	Chad	\N	1284	19093595	1	3	0	0	t	f	t	t	f	f	f	f	gold	0	0	0	0	0	f	f	f	f	f	f
cl	Chile	\N	756102	18664652	6	0	2	0	t	f	t	f	t	f	f	f	red	0	0	0	1	1	f	f	f	f	f	f
cn	China	\N	9596960	1416043270	2	0	0	0	t	f	f	t	f	f	f	f	red	0	0	0	0	5	f	f	f	f	f	f
co	Colombia	\N	1138910	49588357	6	0	3	0	t	f	t	t	f	f	f	f	gold	0	0	0	0	0	f	f	f	f	f	f
km	Comoros	Comoros Islands	2235	900141	1	0	0	0	f	t	f	f	t	f	f	f	green	0	0	0	0	4	t	f	f	f	f	f
cg	Congo	Republic of Congo	342000	6097665	1	0	0	0	t	t	f	t	f	f	f	f	red	0	0	0	0	1	f	f	t	t	f	f
ck	Cook Islands	\N	236	7761	5	0	0	0	t	f	t	f	t	f	f	f	blue	1	1	1	1	15	f	f	f	f	f	f
cr	Costa Rica	\N	51100	5265575	4	0	5	0	t	f	t	f	t	f	f	f	blue	0	0	0	0	0	f	f	f	f	f	f
ci	Cote d'Ivoire	Ivory Coast	322463	29981758	1	3	0	0	t	t	f	f	t	f	f	f	white	0	0	0	0	0	f	f	f	f	f	f
hr	Croatia	\N	56594	4150116	3	0	3	0	t	f	t	t	t	f	f	f	red	0	0	0	0	1	t	f	t	t	f	t
cu	Cuba	\N	110860	10966038	4	0	5	0	t	f	t	f	t	f	f	f	blue	0	0	0	0	1	f	t	f	f	f	f
cy	Cyprus	\N	9251	1320525	3	0	0	0	f	t	f	t	t	f	f	f	white	0	0	0	0	0	f	f	t	t	f	f
cz	Czech Republic	Czechia	78867	10837890	3	0	0	0	t	f	t	f	t	f	f	f	white	0	0	0	0	0	f	t	f	f	f	f
cd	Democratic Republic of the Congo	DRC	2344858	115403027	1	0	0	3	t	f	t	t	f	f	f	f	0	0	0	0	0	1	f	t	f	f	f	f
dk	Denmark	\N	43094	5973136	3	0	0	0	t	f	f	f	t	f	f	f	red	0	1	0	0	0	f	f	f	f	f	f
dj	Djibouti	\N	23200	994974	1	0	0	0	t	t	t	f	t	f	f	f	blue	0	0	0	0	1	f	t	f	f	f	f
dm	Dominica	Commonwealth of Dominica	751	74661	4	0	0	0	t	t	t	t	t	t	f	f	green	1	0	0	0	10	f	f	f	t	f	f
do	Dominican Republic	\N	48670	10815857	4	0	0	0	t	f	t	f	t	f	f	f	blue	0	1	0	0	0	f	f	f	f	f	f
ec	Ecuador	\N	283561	18309984	6	0	3	0	t	f	t	t	f	f	f	f	gold	0	0	0	0	0	f	f	f	f	f	f
eg	Egypt	\N	1001450	111247248	1	0	3	0	t	f	f	t	t	t	f	f	black	0	0	0	0	0	f	f	f	t	t	f
sv	El-Salvador	\N	21041	6628702	6	0	3	0	f	f	t	f	t	f	f	f	blue	0	0	0	0	0	f	f	f	f	f	f
gq	Equatorial-Guinea	\N	28051	1795834	1	0	3	0	t	t	t	f	t	f	f	f	green	0	0	0	0	0	f	t	f	f	f	f
er	Eritrea	\N	117600	6343956	1	0	0	0	t	t	t	t	f	f	f	f	red	0	0	0	0	0	f	t	t	f	f	t
ee	Estonia	\N	45228	1193791	3	0	3	0	f	f	t	f	t	t	f	f	blue	0	0	0	0	0	f	f	f	f	f	f
sz	Eswatini	\N	17364	1138089	1	0	5	0	t	f	t	t	t	t	f	f	red	0	0	0	0	0	f	f	t	f	f	f
et	Ethiopia	\N	1104300	118550298	1	0	3	0	t	t	f	t	f	f	f	f	green	0	0	0	0	0	f	f	f	f	f	f
fk	Falkland Islands	Islas Malvinas	12173	3662	6	0	0	0	t	t	t	t	t	f	f	f	blue	1	1	1	1	0	f	f	t	t	t	f
fo	Faroe Islands	\N	1393	52933	3	0	0	0	t	f	t	f	t	f	f	f	white	0	1	0	0	0	f	f	f	f	f	f
fj	Fiji	\N	18274	951611	5	0	0	0	t	t	t	t	t	f	t	f	blue	0	2	1	1	0	f	f	t	t	f	f
fi	Finland	\N	338145	5626414	3	0	0	0	f	f	t	f	t	f	f	f	white	0	1	0	0	0	f	f	f	f	f	f
fr	France	\N	643801	68374591	3	3	0	0	t	f	t	f	t	f	f	f	white	0	0	0	0	0	f	f	f	f	f	f
pf	French Polynesia	\N	4167	303540	5	0	3	0	t	f	t	t	t	t	f	f	red	1	0	0	0	1	f	f	t	f	f	f
ga	Gabon	\N	267667	2455105	1	0	3	0	f	t	t	t	f	f	f	f	green	0	0	0	0	0	f	f	f	f	f	f
gm	Gambia	The Gambia	11300	2523327	1	0	5	0	t	t	t	f	t	f	f	f	red	0	0	0	0	0	f	f	f	f	f	f
ge	Georgia	\N	69700	4900961	2	0	0	0	t	f	f	f	t	f	f	f	red	0	5	0	0	0	f	f	f	f	f	f
de	Germany	\N	357022	84119100	3	0	3	0	t	f	f	t	f	t	f	f	black	0	0	0	0	0	f	f	f	f	f	f
gh	Ghana	\N	238553	34589092	1	0	3	0	t	t	f	t	f	t	f	f	red	0	0	0	0	1	f	f	f	f	f	f
gi	Gibraltar	\N	7	29683	3	0	1	0	t	f	f	t	t	f	f	f	white	0	0	0	0	0	f	f	t	f	f	f
gr	Greece	\N	131957	10461091	3	0	9	0	f	f	t	f	t	f	f	f	blue	0	1	0	1	0	f	f	f	f	f	f
gl	Greenland	\N	2166086	57751	4	0	0	0	t	f	f	f	t	f	f	f	white	1	0	0	0	0	f	f	f	f	f	f
gd	Grenada	\N	344	114621	4	0	0	0	t	t	f	t	f	f	f	f	gold	1	0	0	0	7	f	t	f	t	f	f
gu	Guam	\N	544	169532	5	0	0	0	t	t	t	t	t	f	t	f	blue	0	0	0	0	0	f	f	t	t	t	f
gt	Guatemala	\N	108889	18255216	6	3	0	0	f	f	t	f	t	f	f	f	blue	0	0	0	0	0	f	f	f	f	f	f
gg	Guernsey	\N	78	67787	3	0	0	0	t	f	f	t	t	f	f	f	red	0	2	0	0	0	f	f	f	f	f	f
gn	Guinea	\N	245857	13986179	1	3	0	0	t	t	f	t	f	f	f	f	gold	0	0	0	0	0	f	f	f	f	f	f
gw	Guinea Bissau	\N	36125	2132325	1	1	2	0	t	t	f	t	f	t	f	f	gold	0	0	0	0	1	f	f	f	f	f	f
gy	Guyana	\N	214969	794099	6	0	0	0	t	t	f	t	t	t	f	f	green	0	0	0	0	0	f	t	f	f	f	f
ht	Haiti	\N	27750	11753943	4	2	0	0	t	f	f	f	f	t	f	f	black	0	0	0	0	0	f	f	f	f	f	f
hn	Honduras	\N	112090	9529188	6	0	3	0	f	f	t	f	t	f	f	f	blue	0	0	0	0	5	f	f	f	f	f	f
hk	Hong Kong	\N	1108	7297821	2	0	0	0	t	t	t	t	t	f	t	f	blue	1	1	1	1	0	f	f	t	t	t	f
hu	Hungary	\N	93028	9855745	3	0	3	0	t	t	f	f	t	f	f	f	red	0	0	0	0	0	f	f	f	f	f	f
is	Iceland	\N	103000	364036	3	0	0	0	t	f	t	f	t	f	f	f	blue	0	1	0	0	0	f	f	f	f	f	f
in	India	\N	3287263	1409128296	2	0	3	0	f	t	t	f	t	f	t	f	orange	1	0	0	0	0	f	f	t	f	f	f
id	Indonesia	\N	1904569	281562465	2	0	2	0	t	f	f	f	t	f	f	f	red	0	0	0	0	0	f	f	f	f	f	f
ir	Iran	Islamic Republic of Iran	1648195	88386937	2	0	3	0	t	t	f	f	t	f	f	f	red	0	0	0	0	0	f	f	t	f	t	f
iq	Iraq	\N	438317	42083436	2	0	3	0	t	t	f	f	t	t	f	f	red	0	0	0	0	3	f	f	f	f	f	f
ie	Ireland	\N	70273	5233461	3	3	0	0	f	t	f	f	t	f	t	f	white	0	0	0	0	0	f	f	f	f	f	f
im	Isle of Man	\N	572	92269	3	0	0	0	t	f	f	t	t	f	f	f	red	0	0	0	0	3	f	f	f	t	f	t
il	Israel	\N	21937	9402617	2	0	2	0	f	f	t	f	t	f	f	f	white	0	0	0	0	1	f	f	f	f	f	f
it	Italy	\N	301340	60964931	3	3	0	0	t	t	f	f	t	f	f	f	white	0	0	0	0	0	f	f	f	f	f	f
jm	Jamaica	\N	10991	2823713	4	0	0	0	f	t	f	t	f	t	f	f	green	0	0	1	0	0	f	t	f	f	f	f
jp	Japan	\N	377915	123201945	2	0	0	0	t	f	f	f	t	f	f	f	white	1	0	0	0	1	f	f	f	f	f	f
je	Jersey	\N	116	103387	3	0	0	0	t	f	f	t	t	f	f	f	red	0	0	1	0	0	f	f	t	t	f	t
jo	Jordan	\N	89342	11174024	2	0	3	0	t	t	f	f	t	t	f	f	black	0	0	0	0	1	f	t	f	f	f	f
kz	Kazakhstan	\N	2724900	20260006	2	0	0	0	f	f	t	t	f	f	f	f	blue	1	0	0	0	1	f	f	t	t	f	f
ke	Kenya	\N	580367	58246378	1	0	5	0	t	t	f	f	t	t	f	f	red	1	0	0	0	0	f	f	t	f	f	f
ki	Kiribati	\N	811	116545	5	0	0	0	t	f	t	t	t	f	f	f	red	0	0	0	0	1	f	f	t	t	f	f
xk	Kosovo	\N	10887	1977093	3	0	0	0	f	f	t	t	t	f	f	f	blue	0	0	0	0	6	f	f	t	f	f	f
kw	Kuwait	\N	17818	3138355	2	0	3	0	t	t	f	f	t	t	f	f	green	0	0	0	0	0	f	f	f	f	f	f
kg	Kyrgyzstan	\N	199951	6172101	2	0	0	0	t	f	f	t	f	f	f	f	red	0	0	0	0	1	f	f	t	f	f	f
la	Laos	Lao People's Democratic Republic	236800	7953556	2	0	3	0	t	f	t	f	t	f	f	f	red	1	0	0	0	0	f	f	f	f	f	f
lv	Latvia	\N	64589	1801246	3	0	3	0	t	f	f	f	t	f	f	f	red	0	0	0	0	0	f	f	f	f	f	f
lb	Lebanon	\N	10400	5364482	2	0	2	0	t	t	f	f	t	f	t	f	red	0	0	0	0	0	f	f	f	t	f	f
ls	Lesotho	\N	30355	2227548	1	2	0	0	t	t	t	f	t	f	f	f	blue	0	0	0	0	0	f	f	t	f	f	f
lr	Liberia	\N	111369	5437249	1	0	11	0	t	f	t	f	t	f	f	f	red	0	0	0	1	1	f	f	f	f	f	f
ly	Libya	Libyan Arab Jamahiriya	1759540	7361263	1	0	0	0	f	t	f	f	f	f	f	f	green	0	0	0	0	0	f	f	f	f	f	f
li	Liechtenstein	\N	160	40272	3	0	2	0	t	f	t	t	f	f	f	f	red	0	0	0	0	0	f	f	t	f	f	f
lt	Lithuania	\N	65300	2628186	3	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f
lu	Luxembourg	\N	2586	671254	3	0	3	0	t	f	t	f	t	f	f	f	red	0	0	0	0	0	f	f	f	f	f	f
mo	Macau	\N	28	644426	2	0	0	0	f	t	f	t	t	f	f	f	green	1	0	0	0	5	f	f	f	t	f	f
mk	Macedonia	Republic of North Macedonia	25713	2135622	3	0	0	0	t	f	f	t	f	f	f	f	red	1	0	0	0	1	f	f	f	f	f	f
mg	Madagascar	Republic of Madagascar	587041	29452714	1	1	2	0	t	t	f	f	t	f	f	f	red	0	0	0	0	0	f	f	f	f	f	f
mw	Malawi	\N	118484	21763309	1	0	3	0	t	t	f	f	f	t	f	f	red	0	0	0	0	1	f	f	f	f	f	f
my	Malaysia	\N	329847	34564810	2	0	14	0	t	f	t	t	t	f	f	f	red	0	0	0	1	1	t	f	f	f	f	f
mv	Maldives	\N	298	388858	2	0	0	0	t	t	f	f	t	f	f	f	red	0	0	0	0	0	t	f	f	f	f	f
ml	Mali	\N	1240192	21990607	1	3	0	0	t	t	f	t	f	f	f	f	gold	0	0	0	0	0	f	f	f	f	f	f
mt	Malta	\N	316	469730	3	2	0	0	t	f	f	f	t	t	f	f	red	3	1	0	0	0	f	f	t	t	t	t
mh	Marshall Islands	\N	181	82011	5	0	0	2	f	f	t	f	t	f	t	f	blue	0	0	0	0	1	f	f	f	f	f	f
mr	Mauritania	\N	1030700	4328040	1	0	0	0	f	t	f	t	f	f	f	f	green	0	0	0	0	1	t	f	f	f	f	f
mu	Mauritius	\N	2040	1310504	1	0	4	0	t	t	t	t	f	f	f	f	red	0	0	0	0	0	f	f	f	f	f	f
mx	Mexico	\N	1964375	130739927	4	3	0	0	t	t	f	f	t	f	t	f	green	0	0	0	0	0	f	f	f	t	f	f
fm	Micronesia	Federated States of Micronesia	702	99603	5	0	0	0	f	f	t	f	t	f	f	f	blue	0	0	0	0	4	f	f	f	f	f	f
md	Moldova	Republic of Moldova	33851	3599528	3	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f
mc	Monaco	\N	2	31813	3	0	2	0	t	f	f	f	t	f	f	f	red	0	0	0	0	0	f	f	f	f	f	f
mn	Mongolia	\N	1564116	3281676	2	3	0	0	t	f	t	t	f	f	f	f	red	2	0	0	0	0	t	t	t	f	f	f
me	Montenegro	\N	13812	599849	3	0	0	0	t	t	t	t	f	f	f	f	red	26	3	0	0	0	f	f	t	t	f	t
ms	Montserrat	\N	102	5468	4	0	0	0	t	t	t	t	t	t	t	f	blue	0	3	2	1	0	f	f	t	t	f	t
ma	Morocco	\N	716550	37387585	1	0	0	0	t	t	f	f	f	f	f	f	red	0	0	0	0	1	f	f	f	f	f	f
mz	Mozambique	\N	799380	33350954	1	0	5	0	t	t	f	t	t	t	f	f	green	0	0	0	0	1	f	t	t	f	f	f
mm	Myanmar	\N	676578	57527139	2	0	3	0	t	t	f	t	t	f	f	f	yellow	0	0	0	0	1	f	f	f	f	f	f
na	Namibia	\N	824292	2803660	1	0	0	3	t	t	t	t	t	f	f	f	blue	1	0	0	0	1	f	t	f	f	f	f
nr	Nauru	\N	21	9892	5	0	3	0	f	f	t	t	t	f	f	f	blue	0	0	0	0	1	f	f	f	f	f	f
np	Nepal	\N	147181	31122387	2	0	0	0	t	f	t	f	t	f	f	f	red	0	0	0	0	2	t	t	f	f	f	f
nl	Netherlands	\N	41543	17772378	3	0	3	0	t	f	t	f	t	f	f	f	red	0	0	0	0	0	f	f	f	f	f	f
nz	New Zealand	\N	268838	5161211	5	0	0	0	t	f	t	f	t	f	f	f	blue	0	2	2	1	4	f	f	f	f	f	f
ni	Nicaragua	\N	130370	6676948	6	0	3	0	t	t	t	t	t	f	t	t	blue	0	0	0	0	1	f	t	t	f	t	t
ne	Niger	\N	1267000	26342784	1	0	3	0	f	t	f	f	t	f	t	f	orange	1	0	0	0	0	f	f	f	f	f	f
ng	Nigeria	\N	923768	236747130	1	3	0	0	f	t	f	f	t	f	f	f	green	0	0	0	0	0	f	f	f	f	f	f
nf	Norfolk Island	\N	36	2188	5	3	9	0	f	t	f	f	t	f	f	f	green	0	0	0	0	0	f	f	f	t	f	f
kp	North Korea	Democratic People's Republic of Korea	120538	26298666	2	0	5	0	t	f	t	f	t	f	f	f	blue	1	0	0	0	1	f	f	f	f	f	f
no	Norway	\N	323802	5509733	3	0	0	0	t	f	t	f	t	f	f	f	red	0	2	0	0	0	f	f	f	f	f	f
om	Oman	Sultanate of Oman	309500	3901992	2	1	3	0	t	t	f	f	t	f	f	f	red	12	0	0	0	0	f	f	t	f	f	t
pk	Pakistan	\N	796095	252363571	2	1	0	0	f	t	f	f	t	f	f	f	green	0	0	0	0	1	t	f	f	f	f	f
pw	Palau	Republic of Palau	459	21864	5	0	0	0	f	f	t	t	f	f	f	f	blue	1	0	0	0	0	f	f	f	f	f	f
ps	Palestine	State of Palestine	6220	5385012	2	0	3	0	t	t	f	f	t	t	f	f	black	0	0	0	0	0	f	t	f	f	f	f
pa	Panama	\N	75420	4470241	6	0	0	0	t	f	t	f	t	f	f	f	red	0	0	0	4	2	f	f	f	f	f	f
pg	Papua-New-Guinea	\N	462840	10046233	5	0	0	0	t	f	f	t	t	t	f	f	black	0	0	0	0	5	f	t	f	t	f	f
py	Parguay	\N	406752	7522549	6	0	3	0	t	t	t	t	t	t	f	f	red	1	0	0	0	1	f	f	f	t	t	f
pe	Peru	\N	1285216	32600249	6	3	0	0	t	f	f	f	t	f	f	f	red	0	0	0	0	0	f	f	f	f	f	f
ph	Philippines	\N	300000	118277063	2	0	0	0	t	f	t	t	t	f	f	f	blue	1	0	0	0	4	f	t	f	f	f	f
pl	Poland	\N	312685	38746310	3	0	2	0	t	f	f	f	t	f	f	f	white	0	0	0	0	0	f	f	f	f	f	f
pt	Portugal	\N	92090	10207177	3	1	0	0	t	t	t	t	t	t	f	f	red	26	0	0	0	0	f	f	t	f	f	f
pr	Puerto-Rico	\N	9104	3019450	4	0	5	0	t	f	t	f	t	f	f	f	red	0	0	0	0	1	f	t	f	f	f	f
qa	Qatar	\N	11586	2552088	2	0	0	0	f	f	f	f	t	f	t	f	brown	0	0	0	0	0	f	f	f	f	f	f
ro	Romania	\N	238391	18148155	3	3	0	0	t	f	t	t	f	f	f	f	yellow	0	0	0	0	0	f	f	f	f	f	f
ru	Russia	Russian Federation	17098242	140820810	2	0	3	0	t	f	t	f	t	f	f	f	white	0	0	0	0	0	f	f	f	f	f	f
rw	Rwanda	\N	26338	13623302	1	3	0	0	f	t	t	t	f	f	f	f	blue	1	0	0	0	1	f	f	f	f	f	f
ws	Samoa	\N	2831	208853	5	0	0	0	t	f	t	f	t	f	f	f	red	0	0	0	1	5	f	f	f	f	f	f
sm	San Marino	\N	61	35095	3	0	2	0	f	t	t	t	t	t	f	f	white	0	1	0	0	0	f	f	t	f	t	f
st	Sao Tome and Principe	\N	964	223561	1	0	3	0	t	t	f	t	f	t	f	f	green	0	0	0	0	2	f	t	f	f	f	f
sa	Saudi Arabia	\N	2149690	36544431	2	0	0	0	f	t	f	f	t	f	f	f	green	0	0	0	0	0	f	f	t	f	t	f
sn	Senegal	\N	196722	18847519	1	3	0	0	t	t	f	t	f	f	f	f	green	0	0	0	0	1	f	f	f	f	f	f
rs	Serbia	\N	77474	6652212	3	0	3	0	t	f	t	t	t	t	f	f	red	19	2	0	0	0	f	f	t	t	f	t
sc	Seychelles	\N	455	98187	1	0	0	0	t	t	t	t	t	f	f	f	red	0	0	0	0	0	f	t	f	f	f	f
sl	Sierra Leone	\N	71740	9121049	1	0	3	0	f	t	t	f	t	f	f	f	green	0	0	0	0	0	f	f	f	f	f	f
sg	Singapore	\N	719	6028459	2	0	2	0	t	f	f	f	t	f	f	f	white	0	0	0	0	5	t	f	f	f	f	f
sk	Slovakia	\N	49035	5563649	3	0	3	0	t	f	t	f	t	f	f	f	red	0	1	0	0	0	f	f	f	f	f	f
si	Slovenia	\N	20273	2097893	3	0	3	0	t	f	t	t	t	f	f	f	white	0	0	0	0	3	f	f	t	f	f	f
sb	Soloman Islands	\N	28896	726799	5	0	0	1	f	t	t	t	t	f	f	f	green	0	0	0	0	5	f	t	f	f	f	f
so	Somalia	\N	637657	13017273	1	0	0	0	f	f	t	f	t	f	f	f	blue	0	0	0	0	1	f	f	f	f	f	f
za	South Africa	\N	1219090	60442647	1	0	1	0	t	t	t	t	t	t	f	f	green	0	0	0	0	0	f	t	f	f	f	f
kr	South Korea	Republic of Korea	99720	52081799	2	0	0	0	t	f	t	f	t	t	f	f	white	1	0	0	0	0	f	f	f	f	f	f
ss	South Sudan	\N	644329	12703714	1	0	3	0	t	t	t	t	t	t	f	f	black	0	0	0	0	1	f	t	f	f	f	f
es	Spain	\N	505370	47280433	3	0	3	0	t	t	t	t	t	t	f	t	red	1	3	0	0	0	f	f	t	f	f	f
lk	Sri Lanka	\N	65610	21982608	2	2	0	0	f	t	f	t	f	f	t	t	gold	0	0	0	0	0	f	f	t	t	f	f
sh	St Helena	Ascension and Tristan da Cunha	394	7943	1	0	0	0	t	f	t	t	t	f	t	f	blue	0	3	2	1	0	f	f	t	t	f	f
kn	St Kitts and Nevis	\N	261	55133	4	0	0	3	t	t	f	t	t	t	f	f	green	0	0	0	0	2	f	t	f	f	f	f
lc	St Lucia	\N	616	168038	4	0	0	0	f	f	t	t	t	t	f	f	blue	0	0	0	0	0	f	t	f	f	f	f
vc	St Vincent and the Grenadines	\N	389	100647	4	3	0	0	f	t	t	t	f	f	f	f	green	0	0	0	0	0	f	f	t	f	f	f
sd	Sudan	\N	1861484	50467278	1	0	3	0	t	t	f	f	t	t	f	f	red	0	0	0	0	0	f	t	f	f	f	f
sr	Suriname	\N	163820	646758	6	0	5	0	t	t	f	t	t	f	f	f	red	0	0	0	0	1	f	f	f	f	f	f
se	Sweden	\N	450295	10589835	3	0	0	0	f	f	t	t	f	f	f	f	blue	0	1	0	0	0	f	f	f	f	f	f
ch	Switzerland	\N	41277	8860574	3	0	0	0	t	f	f	f	t	f	f	f	red	0	1	0	0	0	f	f	f	f	f	f
sy	Syria	Syrian Arab Republic	187437	23865423	2	0	3	0	t	t	f	f	t	t	f	f	green	0	0	0	0	3	f	f	f	f	f	f
tw	Taiwan	Republic of China	35980	23595274	2	0	0	0	t	f	t	f	t	f	f	f	red	1	0	0	1	1	f	f	f	f	f	f
tj	Tajikistan	\N	144100	10394063	2	0	3	0	t	t	f	t	t	f	f	f	red	0	0	0	0	7	f	f	t	f	f	f
tz	Tanzania	United Republic of Tanzania	947300	67462121	1	0	0	3	f	t	t	t	f	t	f	f	green	0	0	0	0	0	f	t	f	f	f	f
th	Thailand	\N	513120	69920998	2	0	5	0	t	f	t	f	t	f	f	f	red	0	0	0	0	0	f	f	f	f	f	f
tl	Timor Leste	\N	14874	1506909	2	0	0	0	t	f	f	t	t	t	f	f	red	0	0	0	0	1	f	t	f	f	f	f
tg	Togo	\N	56785	8917994	1	0	5	0	t	t	f	t	t	f	f	f	green	0	0	0	1	1	f	f	f	f	f	f
to	Tonga	\N	747	104889	5	0	0	0	t	f	f	f	t	f	f	f	red	0	1	0	1	0	f	f	f	f	f	f
tt	Trinidad Tobago	\N	5128	1408966	4	0	0	3	t	f	f	f	t	t	f	f	red	0	0	0	0	0	f	t	f	f	f	f
tn	Tunisia	\N	163610	12048847	1	0	0	0	t	f	f	f	t	f	f	f	red	1	0	0	0	1	t	f	f	f	f	f
tr	Turkey	\N	783562	84119531	2	0	0	0	t	f	f	f	t	f	f	f	red	0	0	0	0	1	t	f	f	f	f	f
tm	Turkmenistan	\N	488100	5744151	2	1	0	0	t	t	f	t	t	f	f	f	green	0	0	0	0	5	t	t	t	f	f	f
tc	Turks and Caicos Islands	\N	948	60439	4	0	0	0	t	t	t	t	t	f	t	t	blue	0	2	2	1	0	f	f	t	t	f	t
tv	Tuvalu	\N	26	11733	5	0	0	0	t	f	t	t	t	f	f	f	blue	0	2	2	1	9	f	f	f	f	f	f
ug	Uganda	\N	241038	49283041	1	0	6	0	t	f	f	t	t	t	f	f	gold	1	0	0	0	0	f	f	f	t	f	f
ua	Ukraine	\N	603550	35661826	3	0	2	0	f	f	t	t	f	f	f	f	blue	0	0	0	0	0	f	f	f	f	f	f
uk	United Kingdom	UK	243610	68459055	3	0	0	0	t	f	t	f	t	f	f	f	red	0	2	2	0	0	f	f	f	f	f	f
ae	United Arab Emirates	UAE	83600	10032213	2	1	3	0	t	t	f	f	t	t	f	f	green	0	0	0	0	0	f	f	f	f	f	f
us	United States	USA	9833517	341963408	4	0	13	0	t	f	t	f	t	f	f	f	white	0	0	0	1	50	f	f	f	f	f	f
uy	Uruguay	\N	176215	3425330	6	0	9	0	f	f	t	t	t	f	t	f	white	0	0	0	1	1	f	f	f	f	f	f
vi	US Virgin Islands	United States Virgin Islands	1910	104377	4	0	0	0	t	t	t	t	t	f	f	f	white	0	0	0	0	0	f	f	t	t	t	t
uz	Uzbekistan	\N	447400	36520593	2	0	5	0	t	t	t	f	t	f	f	f	white	0	0	0	0	12	t	f	f	f	f	f
vu	Vanuatu	\N	12189	318007	5	0	0	0	t	t	f	t	f	t	f	f	red	0	0	0	0	0	f	t	t	t	f	f
ve	Venezuela	Bolivarian Republic of Venezuela	912050	31250306	6	0	3	0	t	f	t	t	t	f	f	f	yellow	0	0	0	0	8	f	f	f	f	f	f
vn	Vietnam	Viet Nam	331210	105758975	2	0	0	0	t	f	f	t	f	f	f	f	red	0	0	0	0	1	f	f	f	f	f	f
ye	Yemen	\N	527968	32140443	2	0	3	0	t	f	f	f	t	t	f	f	red	0	0	0	0	0	f	f	f	f	f	f
zm	Zambia	Republic of Zambia	752618	20799116	1	3	0	0	t	t	f	f	f	t	t	f	green	0	0	0	0	0	f	f	f	t	f	f
zw	Zimbabwe	Republic of Zimbabwe	390757	17150352	1	0	7	0	t	t	f	t	t	t	f	f	green	0	0	0	0	1	f	t	t	t	f	f
\.


--
-- Data for Name: languages; Type: TABLE DATA; Schema: public; Owner: kezia
--

COPY public.languages (language_id, language_name) FROM stdin;
aar	Afar
abk	Abkhazian
ace	Achinese
ach	Acoli
ada	Adangme
ady	Adyghe; Adygei
afa	Afro-Asiatic languages
afh	Afrihili
afr	Afrikaans
ain	Ainu
aka	Akan
akk	Akkadian
ale	Aleut
alg	Algonquian languages
alt	Southern Altai
amh	Amharic
anp	Angika
apa	Apache languages
ara	Arabic
arg	Aragonese
arn	Mapudungun; Mapuche
arp	Arapaho
art	Artificial languages
arw	Arawak
asm	Assamese
ast	Asturian; Bable; Leonese; Asturleonese
ath	Athapascan languages
aus	Australian languages
ava	Avaric
ave	Avestan
awa	Awadhi
aym	Aymara
aze	Azerbaijani
bad	Banda languages
bai	Bamileke languages
bak	Bashkir
bal	Baluchi
bam	Bambara
ban	Balinese
bas	Basa
bat	Baltic languages
bej	Beja; Bedawiyet
bel	Belarusian
bem	Bemba
ben	Bengali
ber	Berber languages
bho	Bhojpuri
bih	Bihari languages
bik	Bikol
bin	Bini; Edo
bis	Bislama
bla	Siksika
bnt	Bantu languages
bod	Tibetan
bos	Bosnian
bra	Braj
bre	Breton
btk	Batak languages
bua	Buriat
bug	Buginese
bul	Bulgarian
byn	Blin; Bilin
cad	Caddo
cai	Central American Indigenous languages
car	Galibi Carib
cat	Catalan; Valencian
cau	Caucasian languages
ceb	Cebuano
cel	Celtic languages
ces	Czech
cha	Chamorro
chb	Chibcha
che	Chechen
chg	Chagatai
chk	Chuukese
chm	Mari
chn	Chinook jargon
cho	Choctaw
chp	Chipewyan; Dene Suline
chr	Cherokee
chv	Chuvash
chy	Cheyenne
cmc	Chamic languages
cnr	Montenegrin
cop	Coptic
cor	Cornish
cos	Corsican
cpe	English-based creoles and pidgins
cpf	French-based creoles and pidgins
cpp	Portuguese-based creoles and pidgins
cre	Cree
crh	Crimean Tatar; Crimean Turkish
crp	Creoles and pidgins
csb	Kashubian
cus	Cushitic languages
cym	Welsh
dak	Dakota
dan	Danish
dar	Dargwa
day	Land Dayak languages
del	Delaware
den	Slave (Athapascan)
deu	German
dgr	Tlicho; Dogrib
din	Dinka
div	Divehi; Dhivehi; Maldivian
doi	Dogri (macrolanguage)
dra	Dravidian languages
dsb	Lower Sorbian
dua	Duala
dyu	Dyula
dzo	Dzongkha
efi	Efik
egy	Egyptian (Ancient)
eka	Ekajuk
ell	Greek (Modern 1453-)
elx	Elamite
eng	English
epo	Esperanto
est	Estonian
eus	Basque
ewe	Ewe
ewo	Ewondo
fan	Fang
fao	Faroese
fas	Persian
fat	Fanti
fij	Fijian
fil	Filipino; Pilipino
fin	Finnish
fiu	Finno-Ugrian languages
fon	Fon
fra	French
frr	Northern Frisian
frs	Eastern Frisian
fry	Western Frisian
ful	Fulah
fur	Friulian
gaa	Ga
gay	Gayo
gba	Gbaya
gem	Germanic languages
gez	Geez
gil	Gilbertese
gla	Gaelic; Scottish Gaelic
gle	Irish
glg	Galician
glv	Manx
gon	Gondi
gor	Gorontalo
got	Gothic
grb	Grebo
grn	Guarani
gsw	Swiss German; Alemannic; Alsatian
guj	Gujarati
gwi	Gwich'in
hai	Haida
hat	Haitian; Haitian Creole
hau	Hausa
haw	Hawaiian
heb	Hebrew
her	Herero
hil	Hiligaynon
him	Himachali languages; Western Pahari languages
hin	Hindi
hit	Hittite
hmn	Hmong; Mong
hmo	Hiri Motu
hrv	Croatian
hsb	Upper Sorbian
hun	Hungarian
hup	Hupa
hye	Armenian
iba	Iban
ibo	Igbo
ido	Ido
iii	Sichuan Yi; Nuosu
ijo	Ijo languages
iku	Inuktitut
ile	Interlingue; Occidental
ilo	Iloko
ina	Interlingua (International Auxiliary Language Association)
inc	Indic languages
ind	Indonesian
ine	Indo-European languages
inh	Ingush
ipk	Inupiaq
ira	Iranian languages
iro	Iroquoian languages
isl	Icelandic
ita	Italian
jav	Javanese
jbo	Lojban
jpn	Japanese
jpr	Judeo-Persian
jrb	Judeo-Arabic
kaa	Kara-Kalpak
kab	Kabyle
kac	Kachin; Jingpho
kal	Kalaallisut; Greenlandic
kam	Kamba
kan	Kannada
kar	Karen languages
kas	Kashmiri
kat	Georgian
kau	Kanuri
kaw	Kawi
kaz	Kazakh
kbd	Kabardian
kha	Khasi
khi	Khoisan languages
khm	Central Khmer
kho	Khotanese; Sakan
kik	Kikuyu; Gikuyu
kin	Kinyarwanda
kir	Kirghiz; Kyrgyz
kmb	Kimbundu
kok	Konkani (macrolanguage)
kom	Komi
kon	Kongo
kor	Korean
kos	Kosraean
kpe	Kpelle
krc	Karachay-Balkar
krl	Karelian
kro	Kru languages
kru	Kurukh
kua	Kuanyama; Kwanyama
kum	Kumyk
kur	Kurdish
kut	Kutenai
lad	Ladino
lah	Lahnda
lam	Lamba
lao	Lao
lat	Latin
lav	Latvian
lez	Lezghian
lim	Limburgan; Limburger; Limburgish
lin	Lingala
lit	Lithuanian
lol	Mongo
loz	Lozi
ltz	Luxembourgish; Letzeburgesch
lua	Luba-Lulua
lub	Luba-Katanga
lug	Ganda
lui	Luiseno
lun	Lunda
luo	Luo (Kenya and Tanzania)
lus	Lushai
mad	Madurese
mag	Magahi
mah	Marshallese
mai	Maithili
mak	Makasar
mal	Malayalam
man	Mandingo
map	Austronesian languages
mar	Marathi
mas	Masai
mdf	Moksha
mdr	Mandar
men	Mende
mic	Mi'kmaq; Micmac
min	Minangkabau
mis	Uncoded languages
mkd	Macedonian
mkh	Mon-Khmer languages
mlg	Malagasy
mlt	Maltese
mnc	Manchu
mni	Manipuri
mno	Manobo languages
moh	Mohawk
mon	Mongolian
mos	Mossi
mri	Maori
msa	Malay (macrolanguage)
mun	Munda languages
mus	Creek
mwl	Mirandese
mwr	Marwari
mya	Burmese
myn	Mayan languages
myv	Erzya
nah	Nahuatl languages
nai	North American Indigenous languages
nap	Neapolitan
nau	Nauru
nav	Navajo; Navaho
nbl	South Ndebele
nde	North Ndebele
ndo	Ndonga
nep	Nepali (macrolanguage)
new	Nepal Bhasa; Newari
nia	Nias
nic	Niger-Kordofanian languages
niu	Niuean
nld	Dutch; Flemish
nno	Norwegian Nynorsk
nob	Norwegian Bokmål
nog	Nogai
nor	Norwegian
nqo	N'Ko
nso	Pedi; Sepedi; Northern Sotho
nub	Nubian languages
nwc	Classical Newari; Old Newari; Classical Nepal Bhasa
nya	Chichewa; Chewa; Nyanja
nym	Nyamwezi
nyn	Nyankole
nyo	Nyoro
nzi	Nzima
oci	Occitan (post 1500)
oji	Ojibwa
ori	Oriya (macrolanguage)
orm	Oromo
osa	Osage
oss	Ossetian; Ossetic
oto	Otomian languages
paa	Papuan languages
pag	Pangasinan
pal	Pahlavi
pam	Pampanga; Kapampangan
pan	Panjabi; Punjabi
pap	Papiamento
pau	Palauan
phi	Philippine languages
phn	Phoenician
pli	Pali
pol	Polish
pon	Pohnpeian
por	Portuguese
pra	Prakrit languages
pus	Pushto; Pashto
qaa-qtz	Reserved for local use
que	Quechua
raj	Rajasthani
rap	Rapanui
rar	Rarotongan; Cook Islands Maori
roa	Romance languages
roh	Romansh
rom	Romany
ron	Romanian; Moldavian; Moldovan
run	Rundi
rup	Aromanian; Arumanian; Macedo-Romanian
rus	Russian
sad	Sandawe
sag	Sango
sah	Yakut
sai	South American Indigenous languages
sal	Salishan languages
sam	Samaritan Aramaic
san	Sanskrit
sas	Sasak
sat	Santali
scn	Sicilian
sco	Scots
sel	Selkup
sem	Semitic languages
sgn	Sign Languages
shn	Shan
sid	Sidamo
sin	Sinhala; Sinhalese
sio	Siouan languages
sit	Sino-Tibetan languages
sla	Slavic languages
slk	Slovak
slv	Slovenian
sma	Southern Sami
sme	Northern Sami
smi	Sami languages
smj	Lule Sami
smn	Inari Sami
smo	Samoan
sms	Skolt Sami
sna	Shona
snd	Sindhi
snk	Soninke
sog	Sogdian
som	Somali
son	Songhai languages
sot	"Southern Sotho"
spa	Spanish; Castilian
sqi	Albanian
srd	Sardinian
srn	Sranan Tongo
srp	Serbian
srr	Serer
ssa	Nilo-Saharan languages
ssw	Swati
suk	Sukuma
sun	Sundanese
sus	Susu
sux	Sumerian
swa	Swahili (macrolanguage)
swe	Swedish
syc	Classical Syriac
syr	Syriac
tah	Tahitian
tai	Tai languages
tam	Tamil
tat	Tatar
tel	Telugu
tem	Timne
ter	Tereno
tet	Tetum
tgk	Tajik
tgl	Tagalog
tha	Thai
tig	Tigre
tir	Tigrinya
tiv	Tiv
tkl	Tokelau
tlh	Klingon; tlhIngan-Hol
tli	Tlingit
tmh	Tamashek
tog	Tongan (Tonga Islands)
ton	Tonga (Tonga Islands)
tpi	Tok Pisin
tsi	Tsimshian
tsn	Tswana
tso	Tsonga
tuk	Turkmen
tum	Tumbuka
tup	Tupi languages
tur	Turkish
tut	Altaic languages
tvl	Tuvalu
twi	Twi
tyv	Tuvinian
udm	Udmurt
uga	Ugaritic
uig	Uighur; Uyghur
ukr	Ukrainian
umb	Umbundu
und	Undetermined
urd	Urdu
uzb	Uzbek
vai	Vai
ven	Venda
vie	Vietnamese
vol	Volapük
vot	Votic
wak	Wakashan languages
wal	Wolaitta; Wolaytta
war	Waray
was	Washo
wen	Sorbian languages
wln	Walloon
wol	Wolof
xal	Kalmyk; Oirat
xho	Xhosa
yao	Yao
yap	Yapese
yid	Yiddish
yor	Yoruba
ypk	Yupik languages
zap	Zapotec
zbl	Blissymbols; Blissymbolics; Bliss
zen	Zenaga
zgh	Standard Moroccan Tamazight
zha	Zhuang; Chuang
zho	Chinese
znd	Zande languages
zul	Zulu
zun	Zuni
zxx	No linguistic content; Not applicable
zza	Zaza; Dimili; Dimli; Kirdki; Kirmanjki; Zazaki
\.


--
-- Data for Name: languages_countries; Type: TABLE DATA; Schema: public; Owner: kezia
--

COPY public.languages_countries (language_id, tld) FROM stdin;
fas	af
pus	af
sqi	al
ell	al
ara	dz
fra	dz
smo	as
eng	as
cat	ad
spa	ad
por	ao
umb	ao
eng	ai
eng	ag
cpe	ag
spa	ar
ita	ar
hye	am
pap	aw
spa	aw
eng	au
zho	au
deu	at
tur	at
aze	az
rus	az
eng	bs
hat	bs
ara	bh
eng	bh
ben	bd
eng	bb
cpe	bb
rus	by
bel	by
nld	be
fra	be
eng	bz
spa	bz
fra	bj
yom	bj
eng	bm
por	bm
dzo	bt
spa	bo
que	bo
bos	ba
srp	ba
tsn	bw
por	br
deu	br
eng	vg
cpe	vg
msa	bn
eng	bn
bul	bg
tur	bg
mos	bf
ful	bf
run	bi
fra	bi
por	cv
cpp	cv
khm	kh
eng	cm
fra	cm
eng	ca
fra	ca
eng	ky
spa	ky
fra	cf
sag	cf
fra	td
ara	td
spa	cl
eng	cl
zho	cn
spa	co
ara	km
fra	km
fra	cg
lin	cg
eng	ck
mri	ck
spa	cr
eng	cr
fra	ci
hrv	hr
srp	hr
spa	cu
ell	cy
tur	cy
ces	cz
slk	cz
fra	cd
lin	cd
dan	dk
fao	dk
fra	dj
ara	dj
eng	dm
cpf	dm
spa	do
spa	ec
que	ec
ara	eg
eng	eg
spa	sv
spa	gq
tir	er
ara	er
est	ee
rus	ee
eng	sz
ssw	sz
orm	et
amh	et
eng	fk
spa	fk
fao	fo
dan	fo
eng	fj
fij	fj
fin	fi
swe	fi
fra	fr
fra	pf
tah	pf
fra	ga
fan	ga
eng	gm
wol	gm
kat	ge
deu	de
dan	de
ewe	gh
fat	gh
eng	gi
spa	gi
ell	gr
kal	gl
dan	gl
eng	gd
cpf	gd
eng	gu
fil	gu
spa	gt
myn	gt
eng	gg
fra	gg
fra	gn
sus	gn
cpp	gw
por	gw
eng	gy
cpe	gy
fra	ht
hat	ht
spa	hn
zho	hk
eng	hk
hun	hu
eng	hu
isl	is
pol	is
hin	in
ben	in
ind	id
eng	id
fas	ir
tur	ir
ara	iq
kur	iq
eng	ie
gle	ie
eng	im
glv	im
heb	il
ara	il
ita	it
deu	it
eng	jm
jpn	jp
eng	je
por	je
ara	jo
eng	jo
kaz	kz
rus	kz
eng	ke
swa	ke
gil	ki
eng	ki
sqi	xk
bos	xk
ara	kw
eng	kw
kir	kg
uzb	kg
lao	la
fra	la
lav	lv
rus	lv
ara	lb
eng	lb
sot	ls
eng	ls
eng	lr
kpe	lr
ara	ly
ita	ly
deu	li
ita	li
lit	lt
rus	lt
ltz	lu
por	lu
zho	mo
mkd	mk
sqi	mk
mlg	mg
fra	mg
eng	mw
nya	mw
msa	my
eng	my
div	mv
eng	mv
bam	ml
fra	ml
mlt	mt
eng	mt
mah	mh
ara	mr
ful	mr
cpf	mu
fra	mu
spa	mx
sai	mx
eng	fm
chk	fm
rom	md
rus	md
fra	mc
eng	mc
mon	mn
rus	mn
srp	me
cnr	me
eng	ms
ara	ma
zgh	ma
bnt	mz
eng	mz
mya	mm
kua	na
khi	na
nau	nr
eng	nr
nep	np
mai	np
nld	nl
fry	nl
eng	nz
mri	nz
spa	ni
sai	ni
hau	ne
son	ne
cpe	ng
hau	ng
eng	nf
cpe	nf
kor	kp
nno	no
nob	no
ara	om
eng	om
pan	pk
pus	pk
pau	pw
eng	pw
ara	ps
heb	ps
spa	pa
sai	pa
cpe	pg
eng	pg
spa	py
grn	py
spa	pe
que	pe
tgl	ph
ceb	ph
pol	pl
sla	pl
por	pt
mwl	pt
spa	pr
eng	pr
ara	qa
eng	qa
ron	ro
hun	ro
rus	ru
tat	ru
kin	rw
fra	rw
smo	ws
eng	ws
ita	sm
por	st
cpp	st
ara	sa
fra	sn
wol	sn
srp	rs
hun	rs
cpf	sc
eng	sc
eng	sl
cpe	sl
eng	sg
zho	sg
slk	sk
hun	sk
slv	si
hrv	si
cpe	sb
eng	sb
som	so
ara	so
zul	za
xho	za
kor	kr
eng	kr
eng	ss
ara	ss
spa	es
cat	es
sin	lk
tam	lk
eng	sh
eng	kn
eng	lc
cpf	lc
eng	vc
cpe	vc
ara	sd
eng	sd
nld	sr
eng	sr
swe	se
deu	ch
fra	ch
ara	sy
kur	sy
zho	tw
tgk	tj
uzb	tj
swa	tz
eng	tz
tha	th
tet	tl
map	tl
fra	tg
ewe	tg
ton	to
eng	tt
cpe	tt
ara	tn
fra 	tn
tur	tr
kur	tr
tuk	tm
rus	tm
eng	tc
tvl	tv
eng	tv
eng	ug
lug	ug
ukr	ua
rus	ua
eng	uk
ara	ae
eng	ae
eng	us
spa	us
spa	uy
eng	vi
spa	vi
uzb	uz
rus	uz
map	vu
cpe	vu
spa	ve
sai	ve
vie	vn
eng	vn
ara	ye
bem	zm
nya	zm
sna	zw
nde	zw
\.


--
-- PostgreSQL database dump complete
--

