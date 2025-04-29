SELECT countries_flags.country_name 
FROM countries_flags 
WHERE blue = true
AND crosses > 0;

SELECT countries_flags.country_name
FROM countries_flags, languages, languages_countries
WHERE languages.language_name = 'Russian'
AND languages.language_id = languages_countries.language_id
AND countries_flags.tld = languages_countries.tld;