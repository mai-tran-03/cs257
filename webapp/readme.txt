AUTHORS: Mai Tran and Kezia Sharnoff


DATA: Country's statistics and their flag attributes, from 1990.  

The dataset of country information and flag attributes has a Creative Commons 
Attribution 4.0 International (CC BY 4.0) license. It can be found at:
Flags [Dataset]. (1990). UCI Machine Learning Repository. 
	https://doi.org/10.24432/C52C7Z.

From this original dataset, we updated some of the information that was out
of date, notably population, area, langauges, and some new flags.

We got our population, area, and language data from the CIA World Factbook. 
This information is public domain. The CIA requires their site to be cited as: 
The World Factbook 2024. Washington, DC: Central Intelligence Agency, 2024. 
	https://www.cia.gov/

We got our updated flag information from Flagpedia.net. We added four new
flag attributes that were not in the original data: bends, borders, trapezoids 
and crest/emblems. The flags at Flagpedia are public domain. Here is the link
where we downloaded the flags from: 
	https://flagpedia.net/download/images

We used the language ISO codes in our dataset, in order to not re-write language
names. The language ISO 639-2 codes were sourced from the Library of Congress,
which sourced them from the Language Coding Agency. The Language Coding Agency
allows for educational uses of their code references. The link to the langauge
ISO codes is: 
	https://www.loc.gov/standards/iso639-2/php/code_list.php

We added the TLD (two-letter country codes) to our dataset (in order to 
display the flag images that are titled with two-letter country codes.) We 
sourced these from the Library of Congress' MARC Standards Country Code list,
which is in the public domain. The link is: 
	https://www.loc.gov/marc/countries/countries_code.html 


STATUS: On the homepage, you can select checkboxes of flag attributes and/or
chose a continent, returning back the countries which contain all of those 
attributes in list and map form. You can use the select bar at the top to 
choose a single country to view. You can also choose a single country by clicking
on its location on the map. In the single country view, you can see the flag, a 
table detailing the flag attributes and country statistics, and the location of
the country on a map. 