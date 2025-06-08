'''
    Mai Tran and Kezia Sharnoff
    api.py
    May 2025

    NAME: api.py - API to fetch information from the postgres databases 
    SYNOPSIS: python3 api.py localhost [port]
    DESCRIPTION: Hosts a webpage where data about countries and their flags can be
    queried and shown. Countries' flags that have attributes can be displayed. 
    Country names can be searched for. Specific countries can have all their data
    displayed. 

'''

import config
import flask
import psycopg2
import sys
import re

api = flask.Blueprint('api', __name__)


attribute_names = ['tld', 'iso3', 'country_name', 'other_names', 'area', 'population', 'continent_name', 
        'bars', 'stripes', 'bends', 'red', 'green', 'blue', 'gold_yellow', 'white', 
        'black_grey', 'orange_brown', 'pink_purple', 'main_hue', 'circles', 'crosses', 
        'saltires', 'quarters', 'sun_stars', 'crescent_moon', 'triangle', 'inanimate_image', 
        'animate_image', 'text', 'crest_emblem', 'border', 'trapezoid']

def get_connection():
    ''' Returns a database connection object with which you can create cursors,
        issue SQL queries, etc. If it fails, it prints an error message and kills
        the whole program. '''
    try:
        return psycopg2.connect(database=config.database,
                                user=config.user,
                                password=config.password)
    except Exception as e:
        print(e, file=sys.stderr)
        exit()


@api.route('/countries')
def get_contries_with_attribute():
    ''' Returns all the countries in the database with the data of all the
        attributes inputted (case-insensitively). Each country is represented 
        by a dictionary with all the inputted attributes. '''

    # search attributes will be a list of strings of all the flag attributes
    # marked to be searched for. this is useful so then we know it is SQL
    # injection safe! 
    search_attributes = []
    for attribute in attribute_names:
        if flask.request.args.get(attribute) == '1':
            search_attributes.append(attribute)

    search_continent = False
    if flask.request.args.get('continent') != None:
        search_continent = True

    countries = []

    try:
        querySELECT = '''SELECT DISTINCT countries_flags.country_name, 
                         countries_flags.iso3, countries_flags.tld'''
        if search_continent:
            querySELECT += ''', continents.continent_name'''
        
        for attribute in search_attributes:
            querySELECT = f"{querySELECT}, countries_flags.{attribute} "

        queryFROM = ''' FROM countries_flags '''

        if search_continent:
            queryFROM = ''' FROM countries_flags, continents 
                            WHERE countries_flags.continent_id = continents.continent_id '''

        query = querySELECT + queryFROM + ' ORDER BY countries_flags.country_name;'
        connection = get_connection()
        cursor = connection.cursor()
        cursor.execute(query)

        for row in cursor:
            country = {
                'country_name': row[0], 
                'iso3': row[1], 
                'tld': row[2]
                }

            offset = 3
            if search_continent:
                offset = 4
                country['continent_name'] = row[3]
            
            for index, attribute in enumerate(search_attributes):
                country[attribute] = row[index + offset]
            countries.append(country)

        connection.close()
    
    except Exception as e:
        print(e, file=sys.stderr)

    return countries


@api.route('/country/<name>')
def get_country(name):
    ''' Returns a country in the database whose name exactly matches
        (case-insensitively) the specified search string. The country is
        represented by a dictionary with all possible attributes and their
        values. The language(s) are in a list.'''

    country = {}
    
    try:
        query = '''SELECT countries_flags.tld, countries_flags.iso3, countries_flags.country_name, 
                    countries_flags.other_names, countries_flags.area, countries_flags.population, 
                    continents.continent_name, countries_flags.bars, countries_flags.stripes, 
                    countries_flags.bends, countries_flags.red, countries_flags.green, 
                    countries_flags.blue, countries_flags.gold_yellow,
                    countries_flags.white, countries_flags.black_grey, countries_flags.orange_brown,
                    countries_flags.pink_purple, countries_flags.main_hue, 
                    countries_flags.circles, countries_flags.crosses, countries_flags.saltires, 
                    countries_flags.quarters, countries_flags.sun_stars, 
                    countries_flags.crescent_moon, countries_flags.triangle, 
                    countries_flags.inanimate_image, countries_flags.animate_image, 
                    countries_flags.text, countries_flags.crest_emblem, countries_flags.border, 
                    countries_flags.trapezoid
                FROM countries_flags, continents
                WHERE country_name ILIKE %s
                AND countries_flags.continent_id = continents.continent_id;
                '''
        connection = get_connection()
        cursor = connection.cursor()
        cursor.execute(query, (name,))
        for row in cursor:
            for index, attribute in enumerate(attribute_names):
                country[attribute] = row[index]
        
    except Exception as e:
        print(e, file=sys.stderr)

    connection.close()


    # Second query in order to just get the several languages. This is to avoid
    # returning all the same information twice (or more) times per each language
    # that the country has. 
    languages = []
    
    try:
        query = '''SELECT languages.language_name
                FROM countries_flags, languages, languages_countries
                WHERE country_name ILIKE %s
                AND languages.language_id = languages_countries.language_id
                AND countries_flags.tld = languages_countries.tld;
                '''
        connection = get_connection()
        cursor = connection.cursor()
        cursor.execute(query, (name,))
        for row in cursor:
            # row[0] will be the string of the language because cursor is a 
            # list of length one lists
            languages.append(row[0])
        
    except Exception as e:
        print(e, file=sys.stderr)

    connection.close()    

    country['languages'] = languages

    return country



@api.route('/help')
def get_help():
    ''' Render the help page with API information '''
    return flask.render_template('help.html')
