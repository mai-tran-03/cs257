'''
    api.py
    Mai Tran
    04.20.2025
    
    NAME: api.py - application programming interface exercise
    SYNOPSIS: python3 api.py localhost 9999
    DESCRIPTION: 
        Show a list of country names whose flags contain all the requested colors., using API endpoint.
'''

import argparse
import csv
import flask
import json

app = flask.Flask(__name__)

def load_flag_data(path):
    '''Return a list of dictionaries, each representing a country flag's attributes.'''
    headers = [
        "name", "landmass", "zone", "area", "population", "language", "religion",
        "bars", "stripes", "colors", "red", "green", "blue", "gold", "white", "black", "orange",
        "mainhue", "circles", "crosses", "saltires", "quarters", "sunstars", "crescent", "triangle",
        "icon", "animate", "text", "topleft", "botright",
    ]
    
    flag_data = []
    with open(path) as data:
        flags = csv.reader(data)
        for row in flags:
            pairs = zip(headers, row)
            flag_dict = dict(pairs)
            flag_data.append(flag_dict)
    
    return flag_data

@app.route('/')
def homepage():
    return 'Welcome to flags API homepage.'

@app.route('/colors')
def get_flags_with_color():
    '''
    Return country flags based on requested colors.

    If specific color(s) are provided as GET parameters (e.g., /colors?red=1&green=1), 
    return a list of country names whose flags contain all the requested colors.

    If no color parameters are provided, return a dictionary where each color 
    maps to a list of countries whose flags contain that individual color.

    GET parameters:
        - red, green, blue, gold, white, black, orange
        - Each should be set to '1' to indicate that color is requested.

    Returns:
        - A list of country names (if one or more colors are requested).
        - A dictionary {color: [list of country names]} (if no colors are requested).
    '''
    flags_with_color = {
        'red': [],
        'green': [],
        'blue': [],
        'gold': [],
        'white': [],
        'black': [],
        'orange': [],
    }
    
    colors = ['red', 'green', 'blue', 'gold', 'white', 'black', 'orange']
    requested_colors = []
    for color in colors:
        if flask.request.args.get(color) == '1':
            requested_colors.append(color)
    
    flags = load_flag_data('../data/flag.data')
    flags_with_specific_colors = []
    for flag in flags:
        if flag['red'] == '1':
            flags_with_color['red'].append(flag['name'])
        if flag['green'] == '1':
            flags_with_color['green'].append(flag['name'])
        if flag['blue'] == '1':
            flags_with_color['blue'].append(flag['name'])
        if flag['gold'] == '1':
            flags_with_color['gold'].append(flag['name'])
        if flag['white'] == '1':
            flags_with_color['white'].append(flag['name'])
        if flag['black'] == '1':
            flags_with_color['black'].append(flag['name'])
        if flag['orange'] == '1':
            flags_with_color['orange'].append(flag['name'])
        
        contained = True
        for color in requested_colors:
            if flag[color] != '1':
                contained = False
                break
        if contained:
            flags_with_specific_colors.append(flag['name'])
    
    if not requested_colors:
        return json.dumps(flags_with_color)
    
    return flags_with_specific_colors

@app.route('/help')
def get_help():
    return flask.render_template('help.html')

if __name__ == '__main__':
    parser = argparse.ArgumentParser(
        prog='api.py - application programming interface exercise',
        usage='python3 api.py localhost 9999',
        description='Show a list of all countries\' flags containing the specified color string, using API endpoint.',
    )
    parser.add_argument('host', help='the host on which this app is running')
    parser.add_argument('port', type=int, help='the port on which this app is listening')
    args = parser.parse_args()
    app.run(host=args.host, port=args.port, debug=True)