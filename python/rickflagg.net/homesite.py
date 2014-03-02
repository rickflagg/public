from flask import Flask, render_template, send_from_directory, request
from flask.ext.restful import Api
from services import *

app = Flask(__name__)
api = Api(app)


@app.route('/')
def index():
    return render_template('index.html')

@app.route('/robots.txt')
@app.route('/sitemap.xml')
def static_from_root():
    return send_from_directory(app.static_folder, request.path[1:])

api.add_resource(ProjectService, '/json/projects/all', endpoint='projects')


if __name__ == '__main__':
    app.run()

