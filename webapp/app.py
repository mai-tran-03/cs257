'''
    app.py
'''

import argparse
import config
import flask
import psycopg2
import sys
import re

app = flask.Flask(__name__)
attribute_names = ['tld', 'country_name', 'other_names', 'area', 'population', 'continent_id', 
        'bars', 'stripes', 'bends', 'red', 'green', 'blue', 'gold_yellow', 'white', 
        'black_grey', 'orange_brown', 'pink_purple', 'main_hue', 'circles', 'crosses', 
        'saltires', 'quarters', 'sun_stars', 'crescent_moon', 'triangle', 'inanimate_image', 
        'animate_image', 'text', 'crest_emblem', 'border', 'trapezoid']
continent_names = ['Africa', 'Asia', 'Europe', 'North_America', 'Oceania', 'South_America']

def get_connection():
    ''' Returns a database connection object with which you can create cursors,
        issue SQL queries, etc. This function prints an error message and kills the whole
        program. '''
    try:
        return psycopg2.connect(database=config.database,
                                user=config.user,
                                password=config.password)
    except Exception as e:
        print(e, file=sys.stderr)
        exit()

@app.route('/')
def homepage():
    return 'Welcome to countries and flags API homepage.'

@app.route('/countries/name_contains/<search_text>')
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
                    OR other_names ILIKE CONCAT('%%', %s, '%%')'''
        connection = get_connection()
        cursor = connection.cursor()
        cursor.execute(query, (search_text,))
        for row in cursor:
            countries.append({'country_name':row[0], 'other_names':row[1], 'main_hue':row[2]})

    except Exception as e:
        print(e, file=sys.stderr)

    connection.close()
    return countries


@app.route('/countries')
def getContriesWithAttribute():
    ''' long comment here '''
    attributes = []
    for attribute in attribute_names:
        if flask.request.args.get(attribute) == '1':
            attributes.append(attribute)

    searchContinent = ''
    if flask.request.args.get('continent') != None:
        searchContinent = re.sub("_", " ", flask.request.args.get('continent'))

    if not attributes and not searchContinent:
        return

    countries = []

    try:
        querySELECT = 'SELECT country_flags.country_name'
        for attribute in attribute_names:
            querySELECT = f"{querySELECT} countries_flags. {attribute}"


        queryFROM = 'FROM countries_flags, continents'

        queryWHERE = 'WHERE'

        # no attributes, only continent
        if searchContinent:
            queryWHERE = f"{queryWHERE} continents.continent_name ILIKE {searchContinent} \nAND countries_flags.continent_id = continents.continent_id \nAND"
        
        if attributes:
            for attribute in attributes:
                queryWHERE = queryWHERE + 
                # working here!!




        query = querySELECT + queryFROM + queryWHERE + ';'

    except Exception as e:
        print(e, file=sys.stderr)



@app.route('/country/<name>')
def getCountry(name):
    ''' Returns a country in the database whose name exactly matches
        (case-insensitively) the specified search string. The country is
        represented by a dictionary with all the attributes. '''
    country = {}
    
    try:
        query = '''SELECT tld, country_name, other_names, area, population, 
                    continent_id, bars, stripes, bends, red, green, blue, gold_yellow,
                    white, black_grey, orange_brown, pink_purple, main_hue, circles, 
                    crosses, saltires, quarters, sun_stars, crescent_moon, triangle, 
                    inanimate_image, animate_image,text, crest_emblem, border, trapezoid
                FROM countries_flags
                WHERE country_name ILIKE %s;
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


@app.route('/help')
def get_help():
    return flask.render_template('help.html')

if __name__ == '__main__':
    parser = argparse.ArgumentParser(
        prog='app.py',
        usage='python3 app.py host port',
        description='...',
    )
    parser.add_argument('host', help='the host on which this app is running')
    parser.add_argument('port', type=int, help='the port on which this app is listening')
    args = parser.parse_args()
    app.run(host=args.host, port=args.port, debug=True)