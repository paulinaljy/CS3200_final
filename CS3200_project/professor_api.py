import sqlite3
from flask import Blueprint, jsonify, request

professor_bp = Blueprint('professor', __name__)

def connect_to_database(database_name):
    conn = sqlite3.connect(database_name)
    return conn

def read_professor_data(conn):
    cursor = conn.cursor()
    cursor.execute("SELECT * FROM Professors")
    professors = cursor.fetchall()
    cursor.close()
    return professors

conn = connect_to_database('canvas.db')
with open('canvas.sql') as f:
    conn.executescript(f.read())

professors = read_professor_data(conn)

@professor_bp.route('/professors', methods=['GET'])
def get_professors():
    return jsonify(professors)

@professor_bp.route('/professors/<int:professor_id>', methods=['GET'])
def get_professor(professor_id):
    cursor = conn.cursor()
    cursor.execute("SELECT * FROM Professors WHERE Professor_ID=?", (professor_id,))
    professor = cursor.fetchone()
    cursor.close()
    if professor:
        return jsonify(professor)
    else:
        return jsonify({'error': 'Professor not found'}), 404

@professor_bp.route('/professors', methods=['POST'])
def add_professor():
    new_professor = request.json
    if 'First_Name' in new_professor and 'Last_Name' in new_professor:
        cursor = conn.cursor()
        cursor.execute("INSERT INTO Professors (First_Name, Last_Name) VALUES (?, ?)",
                       (new_professor['First_Name'], new_professor['Last_Name']))
        conn.commit()
        new_id = cursor.lastrowid
        cursor.close()
        new_professor['Professor_ID'] = new_id
        professors.append(new_professor)
        return jsonify(new_professor), 201
    else:
        return jsonify({'error': 'Professor data incomplete'}), 400

@professor_bp.route('/professors/<int:professor_id>', methods=['PUT'])
def update_professor(professor_id):
    updated_info = request.json
    cursor = conn.cursor()
    cursor.execute("UPDATE Professors SET First_Name=?, Last_Name=? WHERE Professor_ID=?",
                   (updated_info['First_Name'], updated_info['Last_Name'], professor_id))
    conn.commit()
    cursor.close()
    for professor in professors:
        if professor['Professor_ID'] == professor_id:
            professor.update(updated_info)
            return jsonify(professor)
    return jsonify({'error': 'Professor not found'}), 404

@professor_bp.route('/professors/<int:professor_id>', methods=['DELETE'])
def delete_professor(professor_id):
    cursor = conn.cursor()
    cursor.execute("DELETE FROM Professors WHERE Professor_ID=?", (professor_id,))
    conn.commit()
    cursor.close()
    global professors
    professors = [p for p in professors if p['Professor_ID'] != professor_id]
    return '', 204

