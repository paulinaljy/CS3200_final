import sqlite3
from flask import Blueprint, jsonify, request

student_bp = Blueprint('student', __name__)

def connect_to_database(database_name):
    conn = sqlite3.connect(database_name)
    return conn

def read_student_data(conn):
    cursor = conn.cursor()
    cursor.execute("SELECT * FROM Student")
    students = cursor.fetchall()
    cursor.close()
    return students

conn = connect_to_database('student.db')
with open('student.sql') as f:
    conn.executescript(f.read())

students = read_student_data(conn)


def fetch_courses_for_student(student_id):
    conn = sqlite3.connect('student.db')
    cursor = conn.cursor()
    cursor.execute("SELECT * FROM Courses WHERE Student_ID=?", (student_id,))
    courses = cursor.fetchall()
    conn.close()
    return courses

def add_course_for_student(student_id, course_data):
    conn = sqlite3.connect('student.db')
    cursor = conn.cursor()
    cursor.execute("INSERT INTO Courses (Course_Name, Student_ID) VALUES (?, ?)",
                   (course_data.get('CourseName'), student_id))
    conn.commit()
    new_course_id = cursor.lastrowid
    conn.close()
    return {'CourseID': new_course_id, 'CourseName': course_data.get('CourseName'), 'Student_ID': student_id}

def update_course_for_student(student_id, course_id, updated_course_data):
    conn = sqlite3.connect('student.db')
    cursor = conn.cursor()
    cursor.execute("UPDATE Courses SET Course_Name=? WHERE Course_ID=? AND Student_ID=?",
                   (updated_course_data.get('CourseName'), course_id, student_id))
    conn.commit()
    updated_course = {'CourseID': course_id, 'CourseName': updated_course_data.get('CourseName'), 'Student_ID': student_id}
    conn.close()
    return updated_course

def delete_course_for_student(student_id, course_id):
    conn = sqlite3.connect('student.db')
    cursor = conn.cursor()
    cursor.execute("DELETE FROM Courses WHERE Course_ID=? AND Student_ID=?", (course_id, student_id))
    conn.commit()
    conn.close()

@student_bp.route('/students/<int:student_id>/courses', methods=['GET'])
def get_student_courses(student_id):
    courses = fetch_courses_for_student(student_id)
    return jsonify(courses)

@student_bp.route('/students/<int:student_id>/courses', methods=['POST'])
def add_student_course(student_id):
    course_data = request.json
    added_course = add_course_for_student(student_id, course_data)
    return jsonify(added_course), 201

@student_bp.route('/students/<int:student_id>/courses/<int:course_id>', methods=['PUT'])
def update_student_course(student_id, course_id):
    updated_course_data = request.json
    updated_course = update_course_for_student(student_id, course_id, updated_course_data)
    return jsonify(updated_course)

@student_bp.route('/students/<int:student_id>/courses/<int:course_id>', methods=['DELETE'])
def delete_student_course(student_id, course_id):
    delete_course_for_student(student_id, course_id)
    return '', 204
