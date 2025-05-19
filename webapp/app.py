'''
'''
import flask
import argparse
import api

app = flask.Flask(__name__, static_folder='static', template_folder='templates')
app.register_blueprint(api.api, url_prefix='/api')


@app.route('/')
def home():
    return flask.render_template('index.html')


if __name__ == '__main__':
    parser = argparse.ArgumentParser(
        prog='app.py',
        usage='python3 app.py host port',
        description='''Hosts a webpage where data about countries and their flags can be
                    queired and shown. Countries' flags that have attributes can be 
                    displayed. Country names can be searched for. Specific countries can 
                    have all their data displayed.'''
    )

    parser.add_argument('host', help='the host on which this app is running')
    parser.add_argument('port', type=int, help='the port on which this app is listening')
    args = parser.parse_args()
    app.run(host=args.host, port=args.port, debug=True)