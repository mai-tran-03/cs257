SELECT country_name, blue, crosses, circles
FROM countries_flags 
WHERE blue = true
AND crosses > 0
AND circles > 0;

SELECT countries_flags.country_name, countries_flags.main_hue
FROM countries_flags, languages, languages_countries
WHERE languages.language_name = 'Chinese'
AND languages.language_id = languages_countries.language_id
AND countries_flags.tld = languages_countries.tld;

SELECT countries_flags.country_name, countries_flags.area, countries_flags.sun_stars
FROM countries_flags, continents
WHERE continents.continent_name = 'Oceania'
AND countries_flags.continent_id = continents.continent_id;