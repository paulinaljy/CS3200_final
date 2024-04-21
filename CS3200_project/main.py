from flask import Flask

app = Flask(__name__)

app.config['MYSQL_DATABASE_HOST'] = 'localhost'
app.config['MYSQL_DATABASE_USER'] = 'root'
app.config['MYSQL_DATABASE_PASSWORD'] = 'MyNewPass'
app.config['MYSQL_DATABASE_DB'] = 'canvas'

from read import read
app.register_blueprint(read)

from CS3200_project.students.student_api import student_bp
from CS3200_project.professors.professor_api import professor_bp
from CS3200_project.administrator.administrator_api import administrator_bp

app.register_blueprint(student_bp, url_prefix='/students')
app.register_blueprint(professor_bp, url_prefix='/professors')
app.register_blueprint(administrator_bp, url_prefix='/administrators')

if __name__ == '__main__':
   app.run(debug=True, host='0.0.0.0', port=4000)
