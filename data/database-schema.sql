CREATE TABLE countries_flags (
    tld text,
    country_name text,
    other_names text,
    bars integer,
    stripes integer,
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
    crescent_emblem boolean,
);

CREATE TABLE continents (
    continent_id integer,
    continent_name text,
);

CREATE TABLE languages (
    language_id text,
    language_name text,
);

CREATE TABLE languages_countries (
    language_id text,
    tld text,
);