from flask import Blueprint, render_template
from database import mysql

read = Blueprint('read', __name__)

@read.route('/read')
def default():
    cursor = mysql.get_db().cursor()
    response = cursor.execute("SELECT * FROM colleges")
    if response > 0:
        colleges = cursor.fetchall()
        return render_template('index.html', list = colleges)