'''
    api.py
    Mai Tran
    04.20.2025
    
    NAME: api.py - application programming interface exercise
    SYNOPSIS: python3 api.py localhost 9999
    DESCRIPTION: 
        Show a list of all countries' flags containing 
        the specified color string, using API endpoint.
'''

import argparse
import csv
import flask
import json

app = flask.Flask(__name__)
app.debug = True

@app.route('/')
def homepage():
    return 'Welcome to API homepage.'

@app.route('/color/<color>')
def get_flags_with_color(color):
    '''Return the countries whose flags contain the specified color.'''
    flags_with_color = {
        'red': [],      # 10
        'green': [],    # 11
        'blue': [],     # 12
        'gold': [],     # 13
        'white': [],    # 14
        'black': [],    # 15
        'orange': [],   # 16
    }
    
    with open('../data/flag.data') as data:
        flags = csv.reader(data)
        for flag in flags:
            if int(flag[10]):
                flags_with_color['red'].append(flag[0])
            if int(flag[11]):
                flags_with_color['green'].append(flag[0])
            if int(flag[12]):
                flags_with_color['blue'].append(flag[0])
            if int(flag[13]):
                flags_with_color['gold'].append(flag[0])
            if int(flag[14]):
                flags_with_color['white'].append(flag[0])
            if int(flag[15]):
                flags_with_color['black'].append(flag[0])
            if int(flag[16]):
                flags_with_color['orange'].append(flag[0])
    
    return json.dumps(flags_with_color[color])

@app.route('/help')
def get_help():
    return flask.render_template('help.html')

if __name__ == '__main__':
    parser = argparse.ArgumentParser(
        prog='api.py - application programming interface exercise',
        usage='python3 cli.py localhost 9999',
        description='Show a list of all countries\' flags containing the specified color string, using API endpoint.',
    )
    parser.add_argument('host', help='the host on which this app is running')
    parser.add_argument('port', type=int, help='the port on which this app is listening')
    args = parser.parse_args()
    app.run(host=args.host, port=args.port, debug=True)