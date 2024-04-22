from flask import Flask

app = Flask(__name__)

app.config['MYSQL_DATABASE_HOST'] = 'localhost'
app.config['MYSQL_DATABASE_USER'] = 'root'
app.config['MYSQL_DATABASE_PASSWORD'] = 'MyNewPass'
app.config['MYSQL_DATABASE_DB'] = 'canvas'

from read import read
app.register_blueprint(read)

from CS3200_project.student_api import student_bp
from CS3200_project.professor_api import professor_bp
# from CS3200_project.administrator_api import administrator_bp
from CS3200_project.teachingAssistant_api import ta_bp

app.register_blueprint(student_bp)
app.register_blueprint(professor_bp)
# app.register_blueprint(administrator_bp, url_prefix='/administrators')
app.register_blueprint(ta_bp, url_prefix='/tas')

if __name__ == '__main__':
   app.run(debug=True, host='0.0.0.0', port=4000)
