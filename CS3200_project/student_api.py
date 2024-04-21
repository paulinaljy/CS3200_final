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

conn = connect_to_database('canvas.db')
with open('canvas.sql') as f:
    conn.executescript(f.read())

students = read_student_data(conn)

@student_bp.route('/students', methods=['GET'])
def get_students():
    return jsonify(students)
@student_bp.route('/students/<int:student_id>', methods=['GET'])
def get_student(student_id):
    student = next((s for s in students if s['Student_ID'] == str(student_id)), None)
    if student:
        return jsonify(student)
    else:
        return jsonify({'error': 'Student not found'}), 404

@student_bp.route('/students', methods=['POST'])
def add_student():
    new_student = request.json
    if 'Student_ID' in new_student and 'FirstName' in new_student and 'LastName' in new_student and 'ApptId' in new_student:
        students.append(new_student)
        return jsonify(new_student), 201
    else:
        return jsonify({'error': 'Student data incomplete'}), 400

@student_bp.route('/students/<int:student_id>', methods=['PUT'])
def update_student(student_id):
    student = next((s for s in students if s['Student_ID'] == str(student_id)), None)
    if student:
        updated_info = request.json
        student.update(updated_info)
        return jsonify(student)
    else:
        return jsonify({'error': 'Student not found'}), 404

@student_bp.route('/students/<int:student_id>', methods=['DELETE'])
def delete_student(student_id):
    global students
    students = [s for s in students if s['Student_ID'] != str(student_id)]
    return '', 204
