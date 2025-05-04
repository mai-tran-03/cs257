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

DROP TABLE public.languages_countries;
DROP TABLE public.languages;
DROP TABLE public.countries_flags;
DROP TABLE public.continents;
SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: continents; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.continents (
    continent_id integer,
    continent_name text
);


--
-- Name: countries_flags; Type: TABLE; Schema: public; Owner: -
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
    crest_emblem boolean,
    border boolean,
    trapezoid boolean
);


--
-- Name: languages; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.languages (
    language_id text,
    language_name text
);


--
-- Name: languages_countries; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.languages_countries (
    language_id text,
    tld text
);


--
-- Data for Name: continents; Type: TABLE DATA; Schema: public; Owner: -
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
-- Data for Name: countries_flags; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.countries_flags (tld, country_name, other_names, area, population, continent_id, bars, stripes, bends, red, green, blue, gold_yellow, white, black_grey, orange_brown, pink_purple, main_hue, circles, crosses, saltires, quarters, sun_stars, crescent_moon, triangle, inanimate_image, animate_image, text, crest_emblem, border, trapezoid) FROM stdin;
af	Afghanistan	Islamic Republic of Afghanistan	652230	40121552	2	3	0	0	t	t	f	f	t	t	f	f	red	1	0	0	0	1	f	f	t	f	t	t	f	f
al	Albania	Republic of Albania	28748	3107100	3	0	0	0	t	f	f	f	f	t	f	f	red	0	0	0	0	0	f	f	f	t	f	t	f	f
dz	Algeria	People's Democratic Republic of Algeria	2381740	47022473	1	2	0	0	t	t	f	f	t	f	f	f	green	0	0	0	0	1	t	f	f	f	f	f	f	f
as	American Samoa	NULL	224	43895	5	0	0	0	t	f	t	t	t	f	f	f	blue	0	0	0	0	0	f	t	t	t	f	f	f	f
ad	Andorra	Principality of Andorra	468	85370	3	3	0	0	t	f	t	t	f	f	f	f	gold	0	0	0	0	0	f	f	t	t	t	t	f	f
ao	Angola	Republic of Angola	1246700	37202061	1	0	2	0	t	f	f	t	f	t	f	f	red	0	0	0	0	1	f	f	t	f	f	t	f	f
ai	Anguilla	NULL	91	19416	4	0	0	0	t	f	t	f	t	f	t	f	blue	1	2	2	1	0	f	f	f	t	f	t	f	f
ag	Antigua and Barbuda	NULL	443	102634	4	0	1	0	t	f	t	t	t	t	f	f	red	0	0	0	0	1	f	t	f	f	f	f	f	f
ar	Argentina	Argentine Republic	2780400	46994384	6	0	3	0	f	f	t	t	t	f	f	f	blue	1	0	0	0	1	f	f	f	t	f	f	f	f
am	Armenia	Republic of Armenia	29743	2976765	3	0	3	0	t	f	t	f	f	f	t	f	red	0	0	0	0	0	f	f	f	f	f	f	f	f
aw	Aruba	NULL	180	125063	6	0	2	0	t	f	t	t	t	f	f	f	blue	0	0	0	0	1	f	f	f	f	f	f	f	f
au	Australia	Commonwealth of Australia	7741220	26768598	5	0	0	0	t	f	t	f	t	f	f	f	blue	0	2	2	1	6	f	f	f	f	f	f	f	f
at	Austria	Republic of Austria	83871	8967982	3	0	3	0	t	f	f	f	t	f	f	f	red	0	0	0	0	0	f	f	f	f	f	f	f	f
az	Azerbaijan	Republic of Azerbaijan	86600	10650239	2	0	3	0	t	t	t	f	t	f	f	f	blue	0	0	0	0	1	t	f	f	f	f	f	f	f
bs	Bahamas	Commonwealth of the Bahamas	13880	410862	4	0	3	0	f	f	t	t	f	t	f	f	blue	0	0	0	0	0	f	t	f	f	f	f	f	f
bh	Bahrain	Kingdom of Bahrain	760	1566888	2	0	0	0	t	f	f	f	t	f	f	f	red	0	0	0	0	0	f	t	f	f	f	f	f	f
bd	Bangladesh	People's Republic of Bangladesh	148460	168697184	2	0	0	0	t	t	f	f	f	f	f	f	green	1	0	0	0	0	f	f	f	f	f	f	f	f
bb	Barbados	NULL	430	304139	4	3	0	0	f	f	t	t	f	t	f	f	blue	0	0	0	0	0	f	f	t	f	f	t	f	f
by	Belarus	Republic of Belarus	207600	9501451	3	0	2	0	t	t	f	f	t	f	f	f	red	0	0	0	0	0	f	f	t	f	f	f	f	f
be	Belgium	Kingdom of Belgium	30528	11977634	3	3	0	0	t	f	f	t	f	t	f	f	gold	0	0	0	0	0	f	f	f	f	f	f	f	f
bz	Belize	NULL	22966	415789	4	0	2	0	t	t	t	t	t	t	t	f	blue	1	0	0	0	0	f	f	t	t	t	t	f	f
bj	Benin	Republic of Benin	112622	14697052	1	1	2	0	t	t	f	t	f	f	f	f	green	0	0	0	0	0	f	f	f	f	f	f	f	f
bm	Bermuda	NULL	54	72800	4	0	0	0	t	t	t	t	t	t	t	f	red	0	2	2	1	0	f	f	t	t	f	t	f	f
bt	Bhutan	Kingdom of Bhutan	38394	884546	2	0	0	0	f	f	f	t	t	t	t	f	gold	4	0	0	0	0	f	f	t	t	f	t	f	f
bo	Bolivia	Plurinational State of Bolivia	1098581	12311974	1	0	3	0	t	t	t	t	t	t	t	f	red	1	0	0	0	10	f	f	t	t	t	t	f	f
ba	Bosnia and Herzegovina	NULL	51197	3798671	3	1	0	0	f	f	t	t	t	f	f	f	blue	0	0	0	0	8	f	t	f	f	f	f	f	f
bw	Botswana	Republic of Botswana	581730	2450668	1	0	1	0	f	f	t	f	t	t	f	f	blue	0	0	0	0	0	f	f	f	f	f	f	f	f
br	Brazil	Federative Republic of Brazil	8515770	220051512	6	0	0	0	f	t	t	t	t	f	f	f	green	1	0	0	0	27	f	f	f	f	t	f	f	f
vg	British Virgin Islands	NULL	151	40102	4	0	0	0	t	t	t	t	t	t	t	f	blue	0	2	2	1	0	f	f	t	t	t	t	f	f
bn	Brunei	Brunei Darussalam	5765	491900	2	0	0	2	t	f	f	t	t	t	f	f	gold	1	0	0	0	0	f	f	t	t	t	t	f	f
bg	Bulgaria	Republic of Bulgaria	110879	6782659	3	0	3	0	t	t	f	f	t	f	f	f	white	0	0	0	0	0	f	f	f	f	f	f	f	f
bf	Burkina Faso	NULL	274200	23042199	1	0	2	0	t	t	f	t	f	f	f	f	red	0	0	0	0	1	f	f	f	f	f	f	f	f
bi	Burundi	Burundian Republic	27830	13590102	1	0	0	0	t	t	f	f	t	f	f	f	red	1	0	1	0	3	f	f	f	f	f	f	f	f
cv	Cabo Verde	Republic of Cabo Verde; Cape Verde	4033	611014	1	0	3	0	t	f	t	t	t	f	f	f	blue	1	0	0	0	10	f	f	f	f	f	f	f	f
kh	Cambodia	Kingdom of Cambodia	181035	17063669	2	0	3	0	t	f	t	f	t	f	f	f	blue	0	0	0	0	0	f	f	t	f	f	t	f	f
cm	Cameroon	Republic of Cameroon	475440	30966105	1	3	0	0	t	t	f	t	f	f	f	f	gold	0	0	0	0	1	f	f	f	f	f	f	f	f
ca	Canada	NULL	9984670	38794813	4	3	0	0	t	f	f	f	t	f	f	f	red	0	0	0	0	0	f	f	t	f	f	f	f	f
ky	Cayman Islands	NULL	264	66653	4	0	0	0	t	t	t	t	t	f	t	f	blue	0	2	2	1	3	f	f	t	t	t	t	f	f
cf	Central Africa	Central African Republic	622984	5650957	1	1	4	0	t	t	t	t	t	f	f	f	gold	0	0	0	0	1	f	f	f	f	f	f	f	f
td	Chad	Republic of Chad	1284	19093595	1	3	0	0	t	f	t	t	f	f	f	f	gold	0	0	0	0	0	f	f	f	f	f	f	f	f
cl	Chile	Republic of Chile	756102	18664652	6	0	2	0	t	f	t	f	t	f	f	f	red	0	0	0	1	1	f	f	f	f	f	f	f	f
cn	China	People's Republic of China	9596960	1416043270	2	0	0	0	t	f	f	t	f	f	f	f	red	0	0	0	0	5	f	f	f	f	f	f	f	f
co	Colombia	Republic of Colombia	1138910	49588357	6	0	3	0	t	f	t	t	f	f	f	f	gold	0	0	0	0	0	f	f	f	f	f	f	f	f
km	Comoros	Union of the Comoros	2235	900141	1	0	4	0	t	t	t	t	t	f	f	f	green	0	0	0	0	4	t	t	f	f	f	f	f	f
cg	Congo	Republic of the Congo	342000	6097665	1	0	0	1	t	t	f	t	f	f	f	f	green	0	0	0	0	0	f	t	f	f	f	f	f	f
ck	Cook Islands	NULL	236	7761	5	0	0	0	t	f	t	f	t	f	f	f	blue	1	2	2	1	15	f	f	f	f	f	f	f	f
cr	Costa Rica	Republic of Costa Rica	51100	5265575	4	0	5	0	t	t	t	t	t	t	t	f	blue	1	0	0	0	8	f	f	t	f	t	t	f	f
ci	Cote d'Ivoire	Côte d'Ivoire; Ivory Coast	322463	29981758	1	3	0	0	f	t	f	f	t	f	t	f	white	0	0	0	0	0	f	f	f	f	f	f	f	f
hr	Croatia	Republic of Croatia	56594	4150116	3	0	3	0	t	f	t	t	t	t	f	f	red	0	0	0	0	2	t	f	t	t	f	t	f	f
cu	Cuba	Republic of Cuba	110860	10966038	4	0	5	0	t	f	t	f	t	f	f	f	blue	0	0	0	0	1	f	t	f	f	f	f	f	f
cy	Cyprus	Cyprus Republic	9251	1320525	3	0	0	0	f	t	f	t	t	f	f	f	white	0	0	0	0	0	f	f	t	f	f	f	f	f
cz	Czechia	Czech Republic	78867	10837890	3	0	2	0	t	f	t	f	t	f	f	f	white	0	0	0	0	0	f	t	f	f	f	f	f	f
cd	Democratic Republic of the Congo	Congo-Kinshasa; DRC	2344858	115403027	1	0	0	1	t	f	t	t	f	f	f	f	blue	0	0	0	0	1	f	t	f	f	f	f	f	f
dk	Denmark	Kingdom of Denmark	43094	5973136	3	0	0	0	t	f	f	f	t	f	f	f	red	0	1	0	0	0	f	f	f	f	f	f	f	f
dj	Djibouti	Republic of Djibouti	23200	994974	1	0	2	0	t	t	t	f	t	f	f	f	blue	0	0	0	0	1	f	t	f	f	f	f	f	f
dm	Dominica	Commonwealth of Dominica	751	74661	4	0	0	0	t	t	t	t	t	t	f	f	green	1	3	0	0	10	f	f	f	t	f	f	f	f
do	Dominican Republic	República Dominicana	48670	10815857	4	0	0	0	t	t	t	t	t	f	f	f	blue	0	1	0	0	0	f	f	f	f	t	t	f	f
ec	Ecuador	Republic of Ecuador	283561	18309984	6	0	3	0	t	t	t	t	t	t	t	f	gold	1	0	0	0	1	f	f	t	t	t	t	f	f
eg	Egypt	Arab Republic of Egypt	1001450	111247248	1	0	3	0	t	f	f	t	t	t	f	f	red	0	0	0	0	0	f	f	t	t	t	t	f	f
sv	El Salvador	Republic of El Salvador	21041	6628702	6	0	3	0	t	t	t	t	t	t	t	f	blue	1	0	0	0	0	f	t	t	f	t	t	f	f
gq	Equatorial Guinea	Republic of Equatorial Guinea	28051	1795834	1	0	3	0	t	t	t	t	t	t	t	f	green	0	0	0	0	6	f	t	t	t	t	t	f	f
er	Eritrea	State of Eritrea	117600	6343956	1	0	0	0	t	t	t	t	f	f	f	f	red	1	0	0	0	0	f	t	t	f	f	f	f	f
ee	Estonia	Republic of Estonia	45228	1193791	3	0	3	0	f	f	t	f	t	t	f	f	blue	0	0	0	0	0	f	f	f	f	f	f	f	f
sz	Eswatini	Kingdom of Eswatini	17364	1138089	1	0	5	0	t	f	t	t	t	t	f	f	red	0	0	0	0	0	f	f	t	f	f	f	f	f
et	Ethiopia	Federal Democratic Republic of Ethiopia	1104300	118550298	1	0	3	0	t	t	t	t	f	f	f	f	green	1	0	0	0	1	f	f	t	f	f	f	f	f
fk	Falkland Islands	NULL	12173	3662	6	0	0	0	t	t	t	t	t	t	t	f	blue	0	2	2	1	5	f	f	t	t	t	t	f	f
fo	Faroe Islands	NULL	1393	52933	3	0	0	0	t	f	t	f	t	f	f	f	white	0	2	0	0	0	f	f	f	f	f	f	f	f
fj	Fiji	Republic of Fiji	18274	951611	5	0	0	0	t	t	t	t	t	f	t	f	blue	0	3	2	1	0	f	f	t	t	f	t	f	f
fi	Finland	Republic of Finland	338145	5626414	3	0	0	0	f	f	t	f	t	f	f	f	white	0	1	0	0	0	f	f	f	f	f	f	f	f
fr	France	French Republic	643801	68374591	3	3	0	0	t	f	t	f	t	f	f	f	white	0	0	0	0	0	f	f	f	f	f	f	f	f
pf	French Polynesia	NULL	4167	303540	5	0	3	0	t	f	t	t	t	f	t	f	red	1	0	0	0	5	f	f	t	f	f	t	f	f
ga	Gabon	Gabonese Republic	267667	2455105	1	0	3	0	f	t	t	t	f	f	f	f	green	0	0	0	0	0	f	f	f	f	f	f	f	f
gm	Gambia	Republic of the Gambia; The Gambia	11300	2523327	1	0	3	0	t	t	t	f	t	f	f	f	red	0	0	0	0	0	f	f	f	f	f	f	f	f
ge	Georgia	NULL	69700	4900961	2	0	0	0	t	f	f	f	t	f	f	f	red	0	5	0	0	0	f	f	f	f	f	f	f	f
de	Germany	Federal Republic of Germany	357022	84119100	3	0	3	0	t	f	f	t	f	t	f	f	black	0	0	0	0	0	f	f	f	f	f	f	f	f
gh	Ghana	Republic of Ghana	238553	34589092	1	0	3	0	t	t	f	t	f	t	f	f	red	0	0	0	0	1	f	f	f	f	f	f	f	f
gi	Gibraltar	NULL	7	29683	3	0	2	0	t	f	f	t	t	t	f	f	white	0	0	0	0	0	f	f	t	f	f	t	f	f
gr	Greece	Hellenic Republic	131957	10461091	3	0	9	0	f	f	t	f	t	f	f	f	blue	0	1	0	1	0	f	f	f	f	f	f	f	f
gl	Greenland	Kalaallit Nunaat	2166086	57751	4	0	2	0	t	f	f	f	t	f	f	f	white	1	0	0	0	0	f	f	f	f	f	f	f	f
gd	Grenada	NULL	344	114621	4	0	0	0	t	t	f	t	f	f	f	f	gold	1	0	0	0	7	f	f	t	f	f	f	t	f
gu	Guam	NULL	544	169532	5	0	0	0	t	t	t	t	t	f	t	f	blue	0	0	0	0	0	f	f	t	t	t	t	t	f
gt	Guatemala	Republic of Guatemala	108889	18255216	6	3	0	0	t	t	t	t	t	t	t	f	blue	0	0	0	0	0	f	f	t	t	t	t	f	f
gg	Guernsey	NULL	78	67787	3	0	0	0	t	f	f	t	t	f	f	f	red	0	2	0	0	0	f	f	f	f	f	f	f	f
gn	Guinea	Republic of Guinea	245857	13986179	1	3	0	0	t	t	f	t	f	f	f	f	gold	0	0	0	0	0	f	f	f	f	f	f	f	f
gw	Guinea Bissau	Republic of Guinea-Bissau	36125	2132325	1	1	2	0	t	t	f	t	f	t	f	f	gold	0	0	0	0	1	f	f	f	f	f	f	f	f
gy	Guyana	Co-operative Republic of Guyana	214969	794099	6	0	0	0	t	t	f	t	t	t	f	f	green	0	0	0	0	0	f	t	f	f	f	f	f	f
ht	Haiti	Republic of Haiti	27750	11753943	4	0	2	0	t	t	t	t	t	t	f	f	blue	0	0	0	0	0	f	f	t	t	t	t	f	f
hn	Honduras	Republic of Honduras	112090	9529188	6	0	3	0	f	f	t	f	t	f	f	f	blue	0	0	0	0	5	f	f	f	f	f	f	f	f
hk	Hong Kong	NULL	1108	7297821	2	0	0	0	t	f	f	f	t	f	f	f	red	0	0	0	0	5	f	f	t	f	f	f	f	f
hu	Hungary	NULL	93028	9855745	3	0	3	0	t	t	f	f	t	f	f	f	red	0	0	0	0	0	f	f	f	f	f	f	f	f
is	Iceland	Republic of Iceland	103000	364036	3	0	0	0	t	f	t	f	t	f	f	f	blue	0	2	0	0	0	f	f	f	f	f	f	f	f
in	India	Republic of India	3287263	1409128296	2	0	3	0	f	t	t	f	t	f	t	f	orange	1	0	0	0	0	f	f	t	f	f	f	f	f
id	Indonesia	Republic of Indonesia	1904569	281562465	2	0	2	0	t	f	f	f	t	f	f	f	red	0	0	0	0	0	f	f	f	f	f	f	f	f
ir	Iran	Islamic Republic of Iran	1648195	88386937	2	0	3	0	t	t	f	f	t	f	f	f	green	0	0	0	0	0	f	f	t	f	t	t	f	f
iq	Iraq	Republic of Iraq	438317	42083436	2	0	3	0	t	t	f	f	t	t	f	f	red	0	0	0	0	0	f	f	f	f	t	f	f	f
ie	Ireland	NULL	70273	5233461	3	3	0	0	f	t	f	f	t	f	t	f	white	0	0	0	0	0	f	f	f	f	f	f	f	f
im	Isle of Man	NULL	572	92269	3	0	0	0	t	f	f	t	t	f	f	f	red	0	0	0	0	3	f	f	f	t	f	t	f	f
il	Israel	State of Israel	21937	9402617	2	0	2	0	f	f	t	f	t	f	f	f	white	0	0	0	0	1	f	f	f	f	f	f	f	f
it	Italy	Italian Republic	301340	60964931	3	3	0	0	t	t	f	f	t	f	f	f	white	0	0	0	0	0	f	f	f	f	f	f	f	f
jm	Jamaica	NULL	10991	2823713	4	0	0	0	f	t	f	t	f	t	f	f	green	0	0	1	0	0	f	t	f	f	f	f	f	f
jp	Japan	NULL	377915	123201945	2	0	0	0	t	f	f	f	t	f	f	f	white	1	0	0	0	1	f	f	f	f	f	f	f	f
je	Jersey	NULL	116	103387	3	0	0	0	t	f	f	t	t	f	f	f	red	0	0	1	0	0	f	f	t	t	f	t	f	f
jo	Jordan	Hashemite Kingdom of Jordan	89342	11174024	2	0	3	0	t	t	f	f	t	t	f	f	black	0	0	0	0	1	f	t	f	f	f	f	f	f
kz	Kazakhstan	Republic of Kazakhstan	2724900	20260006	2	0	0	0	f	f	t	t	f	f	f	f	blue	1	0	0	0	1	f	f	t	t	f	f	f	f
ke	Kenya	Republic of Kenya	580367	58246378	1	0	3	0	t	t	f	f	t	t	f	f	red	1	0	0	0	0	f	f	t	f	f	f	f	f
ki	Kiribati	Republic of Kiribati	811	116545	5	0	6	0	t	f	t	t	t	f	f	f	red	0	0	0	0	1	f	f	t	t	f	f	f	f
xk	Kosovo	Republic of Kosovo	10887	1977093	3	0	0	0	f	f	t	t	t	f	f	f	blue	0	0	0	0	6	f	f	t	f	f	f	f	f
kw	Kuwait	State of Kuwait	17818	3138355	2	0	3	0	t	t	f	f	t	t	f	f	green	0	0	0	0	0	f	f	f	f	f	f	f	f
kg	Kyrgyzstan	Kyrgyz Republic	199951	6172101	2	0	0	0	t	f	f	t	f	f	f	f	red	1	0	0	0	1	f	f	t	f	f	f	f	f
la	Laos	Lao People's Democratic Republic	236800	7953556	2	0	3	0	t	f	t	f	t	f	f	f	red	1	0	0	0	0	f	f	f	f	f	f	f	f
lv	Latvia	Republic of Latvia	64589	1801246	3	0	3	0	t	f	f	f	t	f	f	f	red	0	0	0	0	0	f	f	f	f	f	f	f	f
lb	Lebanon	Lebanese Republic	10400	5364482	2	0	3	0	t	t	f	f	t	f	f	f	red	0	0	0	0	0	f	f	f	t	f	f	f	f
ls	Lesotho	Kingdom of Lesotho	30355	2227548	1	3	0	0	f	t	t	f	t	t	f	f	blue	0	0	0	0	0	f	f	t	f	f	f	f	f
lr	Liberia	Republic of Liberia	111369	5437249	1	0	11	0	t	f	t	f	t	f	f	f	red	0	0	0	1	1	f	f	f	f	f	f	f	f
ly	Libya	State of Libya	1759540	7361263	1	0	3	0	t	t	f	f	t	t	f	f	black	0	0	0	0	1	t	f	f	f	f	f	f	f
li	Liechtenstein	Principality of Liechtenstein	160	40272	3	0	2	0	t	f	t	t	f	t	f	f	red	0	0	0	0	0	f	f	t	f	f	f	f	f
lt	Lithuania	Republic of Lithuania	65300	2628186	3	0	3	0	t	t	f	t	f	f	f	f	gold	0	0	0	0	0	f	f	f	f	f	f	f	f
lu	Luxembourg	Grand Duchy of Luxembourg	2586	671254	3	0	3	0	t	f	t	f	t	f	f	f	red	0	0	0	0	0	f	f	f	f	f	f	f	f
mo	Macau	Macao	28	644426	2	0	0	0	f	t	f	t	t	f	f	f	green	1	0	0	0	5	f	f	t	f	f	t	f	f
mk	Macedonia	North Macedonia	25713	2135622	3	0	0	0	t	f	f	t	f	f	f	f	red	1	0	0	0	1	f	f	f	f	f	f	f	f
mg	Madagascar	Republic of Madagascar	587041	29452714	1	1	2	0	t	t	f	f	t	f	f	f	red	0	0	0	0	0	f	f	f	f	f	f	f	f
mw	Malawi	Republic of Malawi	118484	21763309	1	0	3	0	t	t	f	f	f	t	f	f	red	0	0	0	0	1	f	f	f	f	f	f	f	f
my	Malaysia	NULL	329847	34564810	2	0	14	0	t	f	t	t	t	f	f	f	red	0	0	0	1	1	t	f	f	f	f	f	f	f
mv	Maldives	NULL	298	388858	2	0	0	0	t	t	f	f	t	f	f	f	red	0	0	0	0	0	t	f	f	f	f	f	t	f
ml	Mali	Republic of Mali	1240192	21990607	1	3	0	0	t	t	f	t	f	f	f	f	gold	0	0	0	0	0	f	f	f	f	f	f	f	f
mt	Malta	Republic of Malta	316	469730	3	2	0	0	t	f	f	f	t	t	f	f	red	1	1	0	0	0	f	f	t	t	t	t	f	f
mh	Marshall Islands	Republic of the Marshall Islands	181	82011	5	0	0	2	f	f	t	f	t	f	t	f	blue	0	0	0	0	1	f	t	f	f	f	f	f	f
mr	Mauritania	Islamic Republic of Mauritania	1030700	4328040	1	0	2	0	t	t	f	t	f	f	f	f	green	0	0	0	0	1	t	f	f	f	f	f	f	f
mu	Mauritius	Republic of Mauritius	2040	1310504	1	0	4	0	t	t	t	t	f	f	f	f	red	0	0	0	0	0	f	f	f	f	f	f	f	f
mx	Mexico	United Mexican States	1964375	130739927	4	3	0	0	t	t	t	t	t	t	t	t	green	0	0	0	0	0	f	f	t	t	f	t	f	f
fm	Micronesia	Federated States of Micronesia	702	99603	5	0	0	0	f	f	t	f	t	f	f	f	blue	0	0	0	0	4	f	f	f	f	f	f	f	f
md	Moldova	Republic of Moldova	33851	3599528	3	3	0	0	t	t	t	t	f	t	t	f	gold	0	1	0	0	1	t	f	t	t	f	t	f	f
mc	Monaco	Principality of Monaco	2	31813	3	0	2	0	t	f	f	f	t	f	f	f	red	0	0	0	0	0	f	f	f	f	f	f	f	f
mn	Mongolia	NULL	1564116	3281676	2	3	0	0	t	f	t	t	f	f	f	f	red	2	0	0	0	0	t	t	t	f	f	t	f	f
me	Montenegro	NULL	13812	599849	3	0	0	0	t	t	t	t	f	f	f	f	red	1	3	0	0	0	f	f	t	t	f	t	t	f
ms	Montserrat	NULL	102	5468	4	0	0	0	t	t	t	t	t	t	t	f	blue	0	3	2	1	0	f	f	t	t	f	t	f	f
ma	Morocco	Kingdom of Morocco	716550	37387585	1	0	0	0	t	t	f	f	f	f	f	f	red	0	0	0	0	1	f	f	f	f	f	f	f	f
mz	Mozambique	Republic of Mozambique	799380	33350954	1	0	3	0	t	t	f	t	t	t	f	f	green	0	0	0	0	1	f	t	t	f	f	f	f	t
mm	Myanmar	Republic of the Union of Myanmar; Burma	676578	57527139	2	0	3	0	t	t	f	t	t	f	f	f	yellow	0	0	0	0	1	f	f	f	f	f	f	f	f
na	Namibia	Republic of Namibia	824292	2803660	1	0	0	1	t	t	t	t	t	f	f	f	blue	1	0	0	0	1	f	t	f	f	f	f	f	f
nr	Nauru	Republic of Nauru	21	9892	5	0	1	0	f	f	t	t	t	f	f	f	blue	0	0	0	0	1	f	f	f	f	f	f	f	f
np	Nepal	Federal Democratic Republic of Nepal	147181	31122387	2	0	0	0	t	f	t	f	t	f	f	f	red	0	0	0	0	2	t	t	f	f	f	f	f	f
nl	Netherlands	Kingdom of the Netherlands	41543	17772378	3	0	3	0	t	f	t	f	t	f	f	f	red	0	0	0	0	0	f	f	f	f	f	f	f	f
nz	New Zealand	NULL	268838	5161211	5	0	0	0	t	f	t	f	t	f	f	f	blue	0	2	2	1	4	f	f	f	f	f	f	f	f
ni	Nicaragua	Republic of Nicaragua	130370	6676948	6	0	3	0	t	t	t	t	t	f	t	t	blue	1	0	0	0	1	f	t	t	f	t	t	f	f
ne	Niger	Republic of the Niger	1267000	26342784	1	0	3	0	f	t	f	f	t	f	t	f	orange	1	0	0	0	0	f	f	f	f	f	f	f	f
ng	Nigeria	Federal Republic of Nigeria	923768	236747130	1	3	0	0	f	t	f	f	t	f	f	f	green	0	0	0	0	0	f	f	f	f	f	f	f	f
nf	Norfolk Island	NULL	36	2188	5	3	0	0	f	t	f	f	t	f	f	f	green	0	0	0	0	0	f	f	f	t	f	f	f	f
kp	North Korea	Democratic People's Republic of Korea	120538	26298666	2	0	3	0	t	f	t	f	t	f	f	f	red	1	0	0	0	1	f	f	f	f	f	f	f	f
no	Norway	Kingdom of Norway	323802	5509733	3	0	0	0	t	f	t	f	t	f	f	f	red	0	2	0	0	0	f	f	f	f	f	f	f	f
om	Oman	Sultanate of Oman	309500	3901992	2	1	3	0	t	t	f	f	t	f	f	f	red	0	0	0	0	0	f	f	t	f	t	t	f	f
pk	Pakistan	Islamic Republic of Pakistan	796095	252363571	2	1	0	0	f	t	f	f	t	f	f	f	green	0	0	0	0	1	t	f	f	f	f	f	f	f
pw	Palau	Republic of Palau	459	21864	5	0	0	0	f	f	t	t	f	f	f	f	blue	1	0	0	0	0	f	f	f	f	f	f	f	f
ps	Palestine	State of Palestine	6220	5385012	2	0	3	0	t	t	f	f	t	t	f	f	black	0	0	0	0	0	f	t	f	f	f	f	f	t
pa	Panama	Republic of Panama	75420	4470241	6	0	0	0	t	f	t	f	t	f	f	f	red	0	0	0	4	2	f	f	f	f	f	f	f	f
pg	Papua New Guinea	Independent State of Papua New Guinea	462840	10046233	5	0	0	0	t	f	f	t	t	t	f	f	black	0	0	0	0	5	f	t	f	t	f	f	f	f
py	Parguay	Republic of Paraguay	406752	7522549	6	0	3	0	t	t	t	t	t	t	f	f	red	1	0	0	0	1	f	f	t	f	t	t	f	f
pe	Peru	Republic of Peru	1285216	32600249	6	3	0	0	t	f	f	f	t	f	f	f	red	0	0	0	0	0	f	f	f	f	f	f	f	f
ph	Philippines	Republic of the Philippines	300000	118277063	2	0	2	0	t	f	t	t	t	f	f	f	blue	1	0	0	0	4	f	t	f	f	f	f	f	t
pl	Poland	Republic of Poland	312685	38746310	3	0	2	0	t	f	f	f	t	f	f	f	white	0	0	0	0	0	f	f	f	f	f	f	f	f
pt	Portugal	Portuguese Republic	92090	10207177	3	2	0	0	t	t	t	t	t	t	f	f	red	1	0	0	0	0	f	f	t	f	f	t	f	f
pr	Puerto Rico	NULL	9104	3019450	4	0	5	0	t	f	t	f	t	f	f	f	red	0	0	0	0	1	f	t	f	f	f	f	f	t
qa	Qatar	State of Qatar	11586	2552088	2	0	0	0	f	f	f	f	t	f	t	f	brown	0	0	0	0	0	f	t	f	f	f	f	f	f
ro	Romania	NULL	238391	18148155	3	3	0	0	t	f	t	t	f	f	f	f	yellow	0	0	0	0	0	f	f	f	f	f	f	f	f
ru	Russia	Russian Federation	17098242	140820810	2	0	3	0	t	f	t	f	t	f	f	f	white	0	0	0	0	0	f	f	f	f	f	f	f	f
rw	Rwanda	Republic of Rwanda	26338	13623302	1	3	0	0	f	t	t	t	f	f	f	f	blue	1	0	0	0	1	f	f	f	f	f	f	f	f
ws	Samoa	NULL	2831	208853	5	0	0	0	t	f	t	f	t	f	f	f	red	0	0	0	1	5	f	f	f	f	f	f	f	f
sm	San Marino	Republic of San Marino	61	35095	3	0	2	0	f	t	t	t	t	t	f	f	white	0	1	0	0	0	f	f	t	f	t	t	f	f
st	Sao Tome and Principe	Democratic Republic of São Tomé and Príncipe	964	223561	1	0	3	0	t	t	f	t	f	t	f	f	green	0	0	0	0	2	f	t	f	f	f	f	f	t
sa	Saudi Arabia	Kingdom of Saudi Arabia	2149690	36544431	2	0	0	0	f	t	f	f	t	f	f	f	green	0	0	0	0	0	f	f	t	f	t	f	f	f
sn	Senegal	Republic of Senegal	196722	18847519	1	3	0	0	t	t	f	t	f	f	f	f	green	0	0	0	0	1	f	f	f	f	f	f	f	f
rs	Serbia	Republic of Serbia	77474	6652212	3	0	3	0	t	f	t	t	t	t	f	f	red	0	2	0	0	0	f	f	t	t	t	t	f	f
sc	Seychelles	Republic of Seychelles	455	98187	1	0	0	5	t	t	t	t	t	f	f	f	red	0	0	0	0	0	f	t	f	f	f	f	f	f
sl	Sierra Leone	Republic of Sierra Leone	71740	9121049	1	0	3	0	f	t	t	f	t	f	f	f	green	0	0	0	0	0	f	f	f	f	f	f	f	f
sg	Singapore	Republic of Singapore	719	6028459	2	0	2	0	t	f	f	f	t	f	f	f	white	0	0	0	0	5	t	f	f	f	f	f	f	f
sk	Slovakia	Slovak Republic	49035	5563649	3	0	3	0	t	f	t	f	t	f	f	f	red	0	1	0	0	0	f	f	t	f	f	t	f	f
si	Slovenia	Republic of Slovenia	20273	2097893	3	0	3	0	t	f	t	t	t	f	f	f	white	0	0	0	0	3	f	f	t	f	f	f	f	f
sb	Soloman Islands	NULL	28896	726799	5	0	0	1	f	t	t	t	t	f	f	f	green	0	0	0	0	5	f	t	f	f	f	f	f	f
so	Somalia	Federal Republic of Somalia	637657	13017273	1	0	0	0	f	f	t	f	t	f	f	f	blue	0	0	0	0	1	f	f	f	f	f	f	f	f
za	South Africa	Republic of South Africa	1219090	60442647	1	0	2	0	t	t	t	t	t	t	f	f	green	0	0	0	0	0	f	t	f	f	f	f	f	t
kr	South Korea	Republic of Korea	99720	52081799	2	0	0	0	t	f	t	f	t	t	f	f	white	1	0	0	0	0	f	f	f	f	f	f	f	f
ss	South Sudan	Republic of South Sudan	644329	12703714	1	0	3	0	t	t	t	t	t	t	f	f	black	0	0	0	0	1	f	t	f	f	f	f	f	t
es	Spain	Kingdom of Spain	505370	47280433	3	0	3	0	t	t	t	t	t	t	f	t	red	1	3	0	0	0	f	f	t	t	t	t	f	f
lk	Sri Lanka	Democratic Socialist Republic of Sri Lanka	65610	21982608	2	2	0	0	f	t	f	t	f	f	t	t	gold	0	0	0	0	0	f	f	t	t	f	f	t	f
sh	St Helena	Saint Helena; Ascension; Tristan da Cunha	394	7943	1	0	0	0	t	f	t	t	t	f	t	f	blue	0	3	2	1	0	f	f	t	t	f	t	f	f
kn	St Kitts and Nevis	Saint Kitts and Nevis;Federation of Saint Kitts and Nevis	261	55133	4	0	0	1	t	t	f	t	t	t	f	f	green	0	0	0	0	2	f	t	f	f	f	f	f	f
lc	St Lucia	Saint Lucia	616	168038	4	0	0	0	f	f	t	t	t	t	f	f	blue	0	0	0	0	0	f	t	f	f	f	f	f	f
vc	St Vincent and the Grenadines	Saint Vincent and the Grenadines	389	100647	4	3	0	0	f	t	t	t	f	f	f	f	green	0	0	0	0	0	f	f	t	f	f	f	f	f
sd	Sudan	Republic of the Sudan	1861484	50467278	1	0	3	0	t	t	f	f	t	t	f	f	red	0	0	0	0	0	f	t	f	f	f	f	f	t
sr	Suriname	Republic of Suriname	163820	646758	6	0	5	0	t	t	f	t	t	f	f	f	red	0	0	0	0	1	f	f	f	f	f	f	f	f
se	Sweden	Kingdom of Sweden	450295	10589835	3	0	0	0	f	f	t	t	f	f	f	f	blue	0	1	0	0	0	f	f	f	f	f	f	f	f
ch	Switzerland	Swiss Confederation	41277	8860574	3	0	0	0	t	f	f	f	t	f	f	f	red	0	1	0	0	0	f	f	f	f	f	f	f	f
sy	Syria	Syrian Arab Republic	187437	23865423	2	0	3	0	t	t	f	f	t	t	f	f	green	0	0	0	0	3	f	f	f	f	f	f	f	f
tw	Taiwan	Republic of China	35980	23595274	2	0	0	0	t	f	t	f	t	f	f	f	red	1	0	0	1	1	f	f	f	f	f	f	f	f
tj	Tajikistan	Republic of Tajikistan	144100	10394063	2	0	3	0	t	t	f	t	t	f	f	f	red	1	0	0	0	7	f	f	t	f	f	f	f	f
tz	Tanzania	United Republic of Tanzania	947300	67462121	1	0	0	1	f	t	t	t	f	t	f	f	green	0	0	0	0	0	f	t	f	f	f	f	f	f
th	Thailand	Kingdom of Thailand	513120	69920998	2	0	5	0	t	f	t	f	t	f	f	f	red	0	0	0	0	0	f	f	f	f	f	f	f	f
tl	Timor Leste	Democratic Republic of Timor-Leste	14874	1506909	2	0	0	0	t	f	f	t	t	t	f	f	red	0	0	0	0	1	f	t	f	f	f	f	f	f
tg	Togo	Togolese Republic	56785	8917994	1	0	5	0	t	t	f	t	t	f	f	f	green	0	0	0	1	1	f	f	f	f	f	f	f	f
to	Tonga	Kingdom of Tonga	747	104889	5	0	0	0	t	f	f	f	t	f	f	f	red	0	1	0	1	0	f	f	f	f	f	f	f	f
tt	Trinidad and Tobago	Republic of Trinidad and Tobago	5128	1408966	4	0	0	1	t	f	f	f	t	t	f	f	red	0	0	0	0	0	f	t	f	f	f	f	f	f
tn	Tunisia	Tunisian Republic	163610	12048847	1	0	0	0	t	f	f	f	t	f	f	f	red	1	0	0	0	1	t	f	f	f	f	f	f	f
tr	Turkey	Republic of Turkey	783562	84119531	2	0	0	0	t	f	f	f	t	f	f	f	red	0	0	0	0	1	t	f	f	f	f	f	f	f
tm	Turkmenistan	NULL	488100	5744151	2	1	0	0	t	t	f	t	t	f	f	f	green	0	0	0	0	5	t	t	t	f	f	f	f	f
tc	Turks and Caicos Islands	NULL	948	60439	4	0	0	0	t	t	t	t	t	f	t	t	blue	0	2	2	1	0	f	f	t	t	f	t	f	f
tv	Tuvalu	NULL	26	11733	5	0	0	0	t	f	t	t	t	f	f	f	blue	0	2	2	1	9	f	f	f	f	f	f	f	f
ug	Uganda	Republic of Uganda	241038	49283041	1	0	6	0	t	f	f	t	t	t	f	f	gold	1	0	0	0	0	f	f	f	t	f	f	f	f
ua	Ukraine	NULL	603550	35661826	3	0	2	0	f	f	t	t	f	f	f	f	blue	0	0	0	0	0	f	f	f	f	f	f	f	f
uk	United Kingdom	United Kingdom of Great Britain and Northern Ireland	243610	68459055	3	0	0	0	t	f	t	f	t	f	f	f	red	0	2	2	0	0	f	f	f	f	f	f	f	f
ae	United Arab Emirates	United Arab Emirates;UAE	83600	10032213	2	1	3	0	t	t	f	f	t	t	f	f	green	0	0	0	0	0	f	f	f	f	f	f	f	f
us	United States	United States of America;USA	9833517	341963408	4	0	13	0	t	f	t	f	t	f	f	f	white	0	0	0	1	50	f	f	f	f	f	f	f	f
uy	Uruguay	Eastern Republic of Uruguay	176215	3425330	6	0	9	0	f	f	t	t	t	f	t	f	white	0	0	0	1	1	f	f	f	t	f	f	f	f
vi	US Virgin Islands	NULL	1910	104377	4	0	0	0	t	t	t	t	t	f	f	f	white	0	0	0	0	0	f	f	t	t	t	t	f	f
uz	Uzbekistan	Republic of Uzbekistan	447400	36520593	2	0	3	0	t	t	t	f	t	f	f	f	white	0	0	0	0	12	t	f	f	f	f	f	f	f
vu	Vanuatu	Republic of Vanuatu	12189	318007	5	0	2	0	t	t	f	t	f	t	f	f	red	1	0	0	0	0	f	t	t	f	f	f	f	t
ve	Venezuela	Bolivarian Republic of Venezuela	912050	31250306	6	0	3	0	t	f	t	t	t	f	f	f	yellow	0	0	0	0	8	f	f	f	f	f	f	f	f
vn	Vietnam	Việt Nam;Socialist Republic of Vietnam	331210	105758975	2	0	0	0	t	f	f	t	f	f	f	f	red	0	0	0	0	1	f	f	f	f	f	f	f	f
ye	Yemen	Republic of Yemen	527968	32140443	2	0	3	0	t	f	f	f	t	t	f	f	red	0	0	0	0	0	f	f	f	f	f	f	f	f
zm	Zambia	Republic of Zambia	752618	20799116	1	3	0	0	t	t	f	f	f	t	t	f	green	0	0	0	0	0	f	f	f	t	f	f	f	f
zw	Zimbabwe	Republic of Zimbabwe	390757	17150352	1	0	7	0	t	t	f	t	t	t	f	f	green	0	0	0	0	1	f	t	t	t	f	f	f	t
\.


--
-- Data for Name: languages; Type: TABLE DATA; Schema: public; Owner: -
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
sot	Southern Sotho
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
-- Data for Name: languages_countries; Type: TABLE DATA; Schema: public; Owner: -
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

