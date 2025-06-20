'''
    Mai Tran and Kezia Sharnoff
    app.py
    May 2025

    NAME: app.py Flask pages to host the webapp 
    SYNOPSIS: python3 app.py localhost [port]
    DESCRIPTION: Hosts a webapp where data about countries and their flags can be
    queried and shown. Countries' flags that have attributes can be displayed. 
    Country names can be searched for. Specific countries can have all their data
    displayed. 
'''
import flask
import argparse
import api

app = flask.Flask(__name__, static_folder='static', template_folder='templates')
app.register_blueprint(api.api, url_prefix='/api')


@app.route('/')
def home():
    return flask.render_template('home.html')


@app.route('/country/<name>')
def display_country(name):
    return flask.render_template('country.html', name=name)


if __name__ == '__main__':
    parser = argparse.ArgumentParser(
        prog='app.py',
        usage='python3 app.py host port',
        description='''Hosts a webpapp where data about countries and their flags can be
                    queried and shown. Countries' flags that have attributes can be 
                    displayed. Country names can be searched for. Specific countries can 
                    have all their data displayed.'''
    )

    parser.add_argument('host', help='the host on which this app is running')
    parser.add_argument('port', type=int, help='the port on which this app is listening')
    args = parser.parse_args()
    app.run(host=args.host, port=args.port, debug=True)