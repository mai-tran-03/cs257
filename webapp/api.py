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

import argparse
import config
import flask
import psycopg2
import sys
import re

api = flask.Blueprint('api', __name__)


attribute_names = ['tld', 'country_name', 'other_names', 'area', 'population', 'continent_id', 
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


@api.route('/countries/name_contains/<search_text>')
def getCountriesContainName(search_text):
    ''' Returns a list of all countries in the database whose names contain
        (case-insensitively) the specified search string. Each country is
        represented by a dictionary with keys "country_name," "other_names," 
        and "main_hue. '''
    countries = []
    try:
        query = '''SELECT country_name, other_names, main_hue
                    FROM countries_flags
                    WHERE country_name ILIKE CONCAT('%%', %s, '%%')
                    OR other_names ILIKE CONCAT('%%', %s, '%%');'''
        connection = get_connection()
        cursor = connection.cursor()
        cursor.execute(query, (search_text, search_text,))
        for row in cursor:
            countries.append({'country_name':row[0], 'other_names':row[1], 'main_hue':row[2]})

    except Exception as e:
        print(e, file=sys.stderr)

    connection.close()
    return countries


@api.route('/countries')
def getContriesWithAttribute():
    ''' Returns a list of all countries in the database that have all the
        attributes inputted (case-insensitively). Each country is represented 
        by a dictionary with all the inputted attributes. '''

    # search attributes will be a list of strings of all the flag attributes
    # marked to be searched for. this is useful so then we know it is SQL
    # injection safe! 
    search_attributes = []
    for attribute in attribute_names:
        if flask.request.args.get(attribute) == '1':
            search_attributes.append(attribute)

    search_continent = ''
    if flask.request.args.get('continent') != None:
        search_continent = re.sub("_", " ", flask.request.args.get('continent'))

    countries = []
    # query parameters will be the continent searched if it exists
    query_parameters = []

    try:
        querySELECT = 'SELECT DISTINCT countries_flags.country_name'
        for attribute in search_attributes:
            querySELECT = f"{querySELECT}, countries_flags.{attribute} "

        queryFROM = ' FROM countries_flags, continents '
        if search_attributes or search_continent:
            queryWHERE = 'WHERE'
        else:
            queryWHERE = ' AND'

        # add continent to the WHERE constraint
        if search_continent:
            queryWHERE += ''' continents.continent_name ILIKE %s 
                AND countries_flags.continent_id = continents.continent_id AND'''
            query_parameters.append(search_continent)
        
        # add all of the flag attributes to the WHERE constraint
        if search_attributes:
            for attribute in search_attributes:
                queryWHERE = f"{queryWHERE} {attribute}::boolean = true AND"

        # remove the last _AND
        queryWHERE = queryWHERE[:-4]

        query = querySELECT + queryFROM + queryWHERE +';'
        connection = get_connection()
        cursor = connection.cursor()
        cursor.execute(query, query_parameters)

        for row in cursor:
            country = {'country_name': row[0]}
            for index, attribute in enumerate(search_attributes):
                country[attribute] = row[index+1]
            countries.append(country)

    except Exception as e:
        print(e, file=sys.stderr)

    connection.close()
    return countries


@api.route('/country/<name>')
def getCountry(name):
    ''' Returns a country in the database whose name exactly matches
        (case-insensitively) the specified search string. The country is
        represented by a dictionary with all its attributes. '''

    country = {}
    
    try:
        query = '''SELECT countries_flags.tld, countries_flags.country_name, 
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
                WHERE country_name ILIKE %s AND
                countries_flags.continent_id = continents.continent_id;
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
    return country


@api.route('/help')
def get_help():
    return flask.render_template('help.html')
