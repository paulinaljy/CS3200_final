from flask import Flask, request, Blueprint, render_template, redirect, url_for, jsonify
import sqlite3

professor_bp = Blueprint('professor', __name__)

def connect_to_database(database_name):
    conn = sqlite3.connect(database_name)
    return conn

def read_student_data(conn, professor_ID, course_ID):
    cursor = conn.cursor()
    cursor.execute("SELECT Professor_ID, Course_ID FROM Professors WHERE Professor_ID=? AND Professor_ID=?", (professor_ID, course_ID))
    students = cursor.fetchall()
    cursor.close()
    return students
@professor_bp.route('/create_assignment', methods=['GET'])
def create_professor_form():
    return '''
        <h2>Course Assignment</h2>
        <form action="/assign_assignment" method="POST">
        <label for="course_id">Course ID:</label><br>
        <input type="text" id="course_id" name="course_id"><br>
        <label for="assignment_description">Assignment Description:</label><br>
        <input type="text" id="assignment_description" name="assignment_description"><br>
        <label for="grade">Grade:</label><br>
        <input type="text" id="grade" name="grade"><br>
        <label for="progress_rate">Progress Rate:</label><br>
        <input type="text" id="progress_rate" name="progress_rate"><br>
        <label for="due_date">Due Date:</label><br>
        <input type="date" id="due_date" name="due_date"><br><br>
        <input type="submit" value="Assign Assignment">
    </form>
    '''

@professor_bp.route('/assign_assignment', methods=['POST'])
def assign_assignment():
    if request.method == 'POST':
        course_id = request.form['course_id']
        assignment_description = request.form['assignment_description']
        grade = request.form['grade']
        progress_rate = request.form['progress_rate']
        due_date = request.form['due_date']

        conn = sqlite3.connect('professor.db')
        cursor = conn.cursor()
        cursor.execute("INSERT INTO Assignments (Course_ID, Description, Grade, Progress_Rate, Due_Date) VALUES (?, ?, ?, ?, ?)",
                       (course_id, assignment_description, grade, progress_rate, due_date))
        conn.commit()
        conn.close()

        return redirect(url_for('assign_assignment_form'))

@professor_bp.route('/assign_assignment_form', methods=['GET', 'POST'])
def assign_assignment_form():
    if request.method == 'POST':
        assignment_description = request.form['assignment_description']
        grade = request.form['grade']
        progress_rate = request.form['progress_rate']
        due_date = request.form['due_date']

        return redirect(url_for('assignment_success'))
    else:
        return """
            <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Assign Assignment</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
                background-color: #f4f4f4;
            }
    
            .container {
                text-align: center;
            }
    
            form {
                margin-top: 20px;
                border: 1px solid #ccc;
                padding: 20px;
                border-radius: 5px;
                background-color: #fff;
                box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            }
    
            label {
                display: block;
                margin-bottom: 10px;
            }
    
            input[type="text"], input[type="date"], select {
                width: 100%;
                padding: 8px;
                margin-bottom: 15px;
                border: 1px solid #ccc;
                border-radius: 4px;
                box-sizing: border-box;
            }
    
            input[type="submit"] {
                background-color: #4CAF50;
                color: white;
                padding: 10px 20px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
            }
    
            input[type="submit"]:hover {
                background-color: #45a049;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h2>Assign Assignment</h2>
            <form action="/assign_assignment" method="POST">
                <label for="course_id">Course ID:</label>
                <input type="text" id="course_id" name="course_id" required>
    
                <label for="description">Assignment Description:</label>
                <input type="text" id="description" name="description" required>
    
                <label for="grade">Grade:</label>
                <input type="text" id="grade" name="grade" required>
    
                <label for="progress_rate">Progress Rate:</label>
                <input type="text" id="progress_rate" name="progress_rate" required>
    
                <label for="due_date">Due Date:</label>
                <input type="date" id="due_date" name="due_date" required>
    
                <input type="submit" value="Assign">
            </form>
        </div>
    </body>
    </html>
    """

@professor_bp.route('/assignment_success')
def assignment_success():

    return """
        <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Assignment Submitted Successfully</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
                background-color: #f4f4f4;
            }
    
            .container {
                text-align: center;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h1>Assignment Submitted Successfully!</h1>
            <p>Thank you for submitting the assignment.</p>
            <a href="/">Back to Home</a>
        </div>
    </body>
    </html>
    """

@professor_bp.route('/update_grade/<int:assignment_id>/<int:student_id>', methods=['PUT'])
def update_grade(assignment_id, student_id):
    new_grade = request.json.get('grade')

    if new_grade is None:
        return jsonify({'error': 'Grade not provided'}), 400

    try:
        with sqlite3.connect('professor.db') as conn:
            cursor = conn.cursor()
            cursor.execute("UPDATE Grade SET Score = ? WHERE Assignment_ID = ? AND Student_ID = ?", (new_grade, assignment_id, student_id))
            conn.commit()
    except sqlite3.Error as e:
        return jsonify({'error': str(e)}), 500

    return jsonify({'message': 'Grade updated successfully'}), 200

@professor_bp.route('/discussion', methods=['POST'])
def create_discussion():
    content = request.json.get('content')
    course_id = request.json.get('course_id')
    student_id = request.json.get('student_id')
    title = request.json.get('title')
    time = request.json.get('time')

    if not (content and course_id and student_id and title and time):
        return jsonify({'error': 'Missing required fields'}), 400

    try:
        with sqlite3.connect('professor.db') as conn:
            cursor = conn.cursor()
            cursor.execute("INSERT INTO Discussion (Content, Course_ID, Student_ID, Title, Time) VALUES (?, ?, ?, ?, ?)", (content, course_id, student_id, title, time))
            conn.commit()
    except sqlite3.Error as e:
        return jsonify({'error': str(e)}), 500

    return jsonify({'message': 'Discussion topic created successfully'}), 201

@professor_bp.route('/assignment/<int:course_id>/<int:assignment_id>', methods=['DELETE'])
def delete_assignment(course_id, assignment_id):
    try:
        with sqlite3.connect('professor.db') as conn:  # Replace 'your_database.db' with your actual database file
            cursor = conn.cursor()
            cursor.execute("SELECT * FROM Assignments WHERE Course_ID = ? AND Assignment_ID = ?", (course_id, assignment_id))
            assignment = cursor.fetchone()
            if assignment:
                cursor.execute("DELETE FROM Assignments WHERE Course_ID = ? AND Assignment_ID = ?", (course_id, assignment_id))
                conn.commit()
                return jsonify({'message': 'Assignment deleted successfully'}), 200
            else:
                return jsonify({'error': 'Assignment not found'}), 404
    except sqlite3.Error as e:
        return jsonify({'error': str(e)}), 500

@professor_bp.route('/professor/<int:professor_id>', methods=['PUT'])
def update_professor(professor_id):
    try:
        data = request.get_json()
        email = data.get('email')
        first_name = data.get('first_name')
        last_name = data.get('last_name')
        course_id = data.get('course_id')

        if not email or not first_name or not last_name or not course_id:
            return jsonify({'error': 'Missing required fields'}), 400

        with sqlite3.connect('professor.db') as conn:
            cursor = conn.cursor()
            cursor.execute("SELECT * FROM Professors WHERE Professor_ID = ?", (professor_id,))
            professor = cursor.fetchone()
            if professor:
                cursor.execute("UPDATE Professors SET Email = ?, First_Name = ?, Last_Name = ?, Course_ID = ? WHERE Professor_ID = ?",
                               (email, first_name, last_name, course_id, professor_id))
                conn.commit()
                return jsonify({'message': 'Professor details updated successfully'}), 200
            else:
                return jsonify({'error': 'Professor not found'}), 404
    except sqlite3.Error as e:
        return jsonify({'error': str(e)}), 500
