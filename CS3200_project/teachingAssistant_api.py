from flask import request, redirect, url_for, Blueprint
import sqlite3
from datetime import datetime

ta_bp = Blueprint('ta', __name__)

conn = sqlite3.connect('ta.db')
c = conn.cursor()

c.execute('''CREATE TABLE IF NOT EXISTS appointments
             (id INTEGER PRIMARY KEY AUTOINCREMENT, ta_id INTEGER, student_id INTEGER, appointment_time TEXT)''')

c.execute('''CREATE TABLE IF NOT EXISTS ta_courses
             (id INTEGER PRIMARY KEY AUTOINCREMENT, ta_id INTEGER, course_id INTEGER)''')

c.execute('''CREATE TABLE IF NOT EXISTS courses
             (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, material TEXT)''')

c.execute('''CREATE TABLE IF NOT EXISTS ta_appointments
             (id INTEGER PRIMARY KEY AUTOINCREMENT, ta_id INTEGER, course_id INTEGER, time TEXT)''')
conn.commit()

conn.close()

@ta_bp.route('/appointmentForm')
def index1():
    return """
        <!DOCTYPE html>
    <html lang="en">
    <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TA Appointment</title>
    </head>
    <body>
    <h1>TA Appointment</h1>
    <form action="/appointments" method="post">
    <label for="ta_id">TA ID:</label><br>
    <input type="text" id="ta_id" name="ta_id"><br><br>
    <label for="student_id">Student ID:</label><br>
    <input type="text" id="student_id" name="student_id"><br><br>
    <label for="appointment_time">Appointment Time:</label><br>
    <input type="datetime-local" id="appointment_time" name="appointment_time"><br><br>
    <input type="submit" value="Submit">
    </form>
    </body>
    </html>
"""

@ta_bp.route('/appointments', methods=['POST'])
def create_appointment():
    if request.method == 'POST':
        ta_id = request.form['ta_id']
        student_id = request.form['student_id']
        appointment_time = request.form['appointment_time']

        appointment_time = datetime.strptime(appointment_time, '%Y-%m-%dT%H:%M')

        conn = sqlite3.connect('ta.db')
        c = conn.cursor()

        c.execute("INSERT INTO appointments (ta_id, student_id, appointment_time) VALUES (?, ?, ?)",
                  (ta_id, student_id, appointment_time))
        conn.commit()

        conn.close()

        return redirect(url_for('index1'))

@ta_bp.route('/courseTAList')
def index2():
    return """
        <h2>Add TA to Course</h2>
    <form action="/ta_courses" method="post">
        <label for="ta_id">TA ID:</label><br>
        <input type="text" id="ta_id" name="ta_id"><br><br>
        <label for="course_id">Course ID:</label><br>
        <input type="text" id="course_id" name="course_id"><br><br>
        <input type="submit" value="Submit">
    </form>
    """
    

@ta_bp.route('/ta_courses', methods=['POST'])
def add_ta_to_course():
    if request.method == 'POST':

        ta_id = request.form['ta_id']
        course_id = request.form['course_id']

        conn = sqlite3.connect('ta.db')
        c = conn.cursor()

        c.execute("INSERT INTO ta_courses (ta_id, course_id) VALUES (?, ?)",
                  (ta_id, course_id))
        conn.commit()

        conn.close()

        return redirect(url_for('index2'))


@ta_bp.route('/courses/<int:course_id>', methods=['PUT'])
def update_course_material(course_id):
    if request.method == 'PUT':
        new_material = request.form['material']

        conn = sqlite3.connect('ta.db')
        c = conn.cursor()

        c.execute("UPDATE courses SET material = ? WHERE id = ?", (new_material, course_id))
        conn.commit()

        conn.close()

        return f"Course {course_id} material updated successfully"

@ta_bp.route('/ta_appointments/<int:appointment_id>', methods=['PUT'])
def update_ta_appointment_time(appointment_id):
    if request.method == 'PUT':
        new_time = request.form['time']
        conn = sqlite3.connect('ta.db')
        c = conn.cursor()

        c.execute("UPDATE ta_appointments SET time = ? WHERE id = ?", (new_time, appointment_id))
        conn.commit()

        conn.close()

        return f"TA appointment {appointment_id} time updated successfully"

@ta_bp.route('/courses/<int:course_id>', methods=['DELETE'])
def delete_course_material(course_id):
    if request.method == 'DELETE':
        c.execute("UPDATE courses SET material = NULL WHERE id = ?", (course_id,))
        conn.commit()
        return f"Material for course {course_id} deleted successfully"

@ta_bp.route('/appointments/<int:appointment_id>', methods=['DELETE'])
def delete_appointment(appointment_id):
    conn = sqlite3.connect('ta.db')
    c = conn.cursor()
    c.execute("DELETE FROM appointments WHERE id = ?", (appointment_id,))
    conn.commit()
    conn.close()
    return f"Appointment {appointment_id} deleted successfully"
