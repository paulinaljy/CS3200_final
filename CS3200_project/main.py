from flask import Flask
from read import read
from student_api import student_bp
from professors_api import professor_bp
from administrator_api import administrator_bp
from teachingAssistant_api import ta_bp
from database import init_mysql

app = Flask(__name__)

init_mysql(app)


app.register_blueprint(read)
app.register_blueprint(student_bp)
app.register_blueprint(professor_bp)
app.register_blueprint(administrator_bp)
app.register_blueprint(ta_bp)

if __name__ == '__main__':
   app.run(debug=True, host='0.0.0.0', port=4000)
