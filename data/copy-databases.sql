-- This file has all the copy databases so that we don't have to write each time
-- Useful for updating the data! 

\copy countries_flags FROM 'countries_flags.csv' DELIMITER ',' CSV NULL as 'NULL'
\copy languages FROM 'languages.csv' DELIMITER ','
\copy continents FROM 'continents.csv' DELIMITER ','
\copy languages_countries FROM 'languages_countries.csv' DELIMITER ','


-- to drop them: 
DROP TABLE continents;
DROP TABLE languages;
DROP TABLE languages_countries;
DROP TABLE countries_flags;