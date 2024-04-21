import csv
from flask import Blueprint, jsonify, request

student_bp = Blueprint('student', __name__)

students = [
    {'Student_ID': 1, 'FirstName': 'Taber', 'LastName': 'Gyles', 'ApptId': '1UC0Y32DK95'},
    {'Student_ID': 2, 'FirstName': 'Barr', 'LastName': 'Najara', 'ApptId': '1G77UM4UF88'},
    {'Student_ID': 3, 'FirstName': 'Arden', 'LastName': 'Entres', 'ApptId': '6W69H71XQ94'},
    {'Student_ID': 4, 'FirstName': 'Rina', 'LastName': 'Tombs', 'ApptId': '8NN8RJ1YJ83'},
    {'Student_ID': 5, 'FirstName': 'Bogey', 'LastName': 'Povele', 'ApptId': '5XK4J73HH98'},
    {'Student_ID': 6, 'FirstName': 'Michail', 'LastName': 'Suett', 'ApptId': '7NM5JE8DT82'},
    {'Student_ID': 7, 'FirstName': 'Cob', 'LastName': 'Pollington', 'ApptId': '5KK3N39KY48'},
    {'Student_ID': 8, 'FirstName': 'Llewellyn', 'LastName': 'Titcombe', 'ApptId': '9WR7HT7VX13'},
    {'Student_ID': 9, 'FirstName': 'Brewster', 'LastName': 'Dulen', 'ApptId': '3E13MV4YE49'},
    {'Student_ID': 10, 'FirstName': 'Roby', 'LastName': 'Traves', 'ApptId': '6UW1J33QD42'},
    {'Student_ID': 11, 'FirstName': 'Emlen', 'LastName': 'Deane', 'ApptId': '1CK3RG1RR56'},
    {'Student_ID': 12, 'FirstName': 'Darryl', 'LastName': 'Filde', 'ApptId': '1RK5A46GA45'},
    {'Student_ID': 13, 'FirstName': 'Ailyn', 'LastName': 'Tawton', 'ApptId': '1KF4YW6KN17'},
    {'Student_ID': 14, 'FirstName': 'Alwyn', 'LastName': 'Capper', 'ApptId': '9KU2J79NJ21'},
    {'Student_ID': 15, 'FirstName': 'Raphael', 'LastName': 'Beetlestone', 'ApptId': '8T67HK3HM65'},
    {'Student_ID': 16, 'FirstName': 'Maddy', 'LastName': 'Frayne', 'ApptId': '5CQ9MH9NP30'},
    {'Student_ID': 17, 'FirstName': 'Florencia', 'LastName': 'McGuffog', 'ApptId': '7UG0XM8JY69'},
    {'Student_ID': 18, 'FirstName': 'Cal', 'LastName': 'Oppery', 'ApptId': '4G70K88ND00'},
    {'Student_ID': 19, 'FirstName': 'Giff', 'LastName': 'Scollan', 'ApptId': '6DJ5Y82GW85'},
    {'Student_ID': 20, 'FirstName': 'Evanne', 'LastName': 'Quidenham', 'ApptId': '3MJ0MW8PM58'},
    {'Student_ID': 21, 'FirstName': 'Gael', 'LastName': 'Presser', 'ApptId': '4P27EP7GE60'},
    {'Student_ID': 22, 'FirstName': 'Cam', 'LastName': 'Abelwhite', 'ApptId': '4HA4XM2KF01'},
    {'Student_ID': 23, 'FirstName': 'Kriste', 'LastName': 'Foster-Smith', 'ApptId': '2EW4QR9TT38'},
    {'Student_ID': 24, 'FirstName': 'Jillane', 'LastName': 'Emmens', 'ApptId': '9YW2KP8UR50'},
    {'Student_ID': 25, 'FirstName': 'Reamonn', 'LastName': 'Curmi', 'ApptId': '7V88JQ1NH67'},
    {'Student_ID': 26, 'FirstName': 'Tedda', 'LastName': 'Disley', 'ApptId': '7QH6QJ6YQ57'},
    {'Student_ID': 27, 'FirstName': 'Brigg', 'LastName': 'Painswick', 'ApptId': '8N92PE0RH23'},
    {'Student_ID': 28, 'FirstName': 'Catlin', 'LastName': 'Sonschein', 'ApptId': '7K85KR1XP96'},
    {'Student_ID': 29, 'FirstName': 'Lou', 'LastName': 'MacBrearty', 'ApptId': '6R47TA0RE08'},
    {'Student_ID': 30, 'FirstName': 'Lilly', 'LastName': 'Benduhn', 'ApptId': '9GX5AP9AP07'}
]

@student_bp.route('/students', methods=['GET'])
def get_students():
    return jsonify(students)

@student_bp.route('/students/<int:student_id>', methods=['GET'])
def get_student(student_id):
    student = next((s for s in students if s['Student_ID'] == student_id), None)
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
    student = next((s for s in students if s['Student_ID'] == student_id), None)
    if student:
        updated_info = request.json
        student.update(updated_info)
        return jsonify(student)
    else:
        return jsonify({'error': 'Student not found'}), 404

@student_bp.route('/students/<int:student_id>', methods=['DELETE'])
def delete_student(student_id):
    global students
    students = [s for s in students if s['Student_ID'] != student_id]
    return '', 204
