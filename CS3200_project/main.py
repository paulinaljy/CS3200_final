from flask import Flask
from database import mysql
from read import read

app = Flask(__name__)

app.config['MYSQL_DATABASE_USER'] = 'root'
app.config['MYSQL_DATABASE_PASSWORD'] = 'MyNewPass'
app.config['MYSQL_DATABASE_DB'] = 'canvas'
app.config['MYSQL_DATABASE_HOST'] = 'localhost'
mysql.init_app(app)

app.register_blueprint(read)

from CS3200_project.students.student_api import student_blueprint
from CS3200_project.professors.professor_api import professor_blueprint

app.register_blueprint(student_blueprint)
app.register_blueprint(professor_blueprint)


if __name__ == '__main__':
    app.run(debug = True, host = '0.0.0.0', port = 4000)