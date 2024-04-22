import sqlite3
from flask import Blueprint, jsonify, request, render_template

student_bp = Blueprint('student', __name__)

def connect_to_database(database_name):
    conn = sqlite3.connect(database_name)
    return conn

def read_student_data(conn, first_name, last_name):
    cursor = conn.cursor()
    cursor.execute("SELECT User_ID, First_Name, Middle_Name, Last_Name, Course_Name FROM Student WHERE First_Name=? AND Last_Name=?", (first_name, last_name))
    students = cursor.fetchall()
    cursor.close()
    return students

# conn = connect_to_database('student.db')
# with open('student.sql') as f:
#     conn.executescript(f.read())

# students = read_student_data(conn)


@student_bp.route('/formPresentation')
def get_form():
    return """
        <h2>Student Schedule</h2>
        
        <form action="/form" method='POST'>
        <label for="first">First name:</label><br>
        <input type="text" id="first" name="first"><br>
        <label for="last">Last name:</label><br>
        <input type="text" id="last" name="last"><br><br>
        <input type="submit" value="Submit">
        </form>
    """

@student_bp.route('/form', methods=['POST'])
def post_form():
    first_name = request.form['first']
    last_name = request.form['last']

    conn = connect_to_database('student.db')
    students = read_student_data(conn, first_name, last_name)

    html_table = "<h2>Student Data</h2>"
    html_table += "<table border='9'>"
    html_table += "<tr><th>User ID</th><th>First Name</th><th>Middle Name</th><th>Last Name</th><th>Course Name</th></tr>"
    for student in students:
        html_table += "<tr>"
        for data in student:
            html_table += "<td>{}</td>".format(data)
        html_table += "</tr>"
    html_table += "</table>"

    conn.close()

    return html_table

# @student_bp.route('/upateStudents')
# def update_information():
#     return """
#             <h2>Update Student Information</h2>
#
#
#             <form action="/update_students" method='POST'>
#                 <input type="hidden" name="_method" value="PUT">
#                 <label for="student_id">Student ID:</label><br>
#                 <input type="text" id="student_id" name="student_id"><br>
#                 <label for="first_name">First Name:</label><br>
#                 <input type="text" id="first_name" name="first_name"><br>
#                 <label for="last_name">Last Name:</label><br>
#                 <input type="text" id="last_name" name="last_name"><br>
#                 <label for="new_course_name">New Course Name:</label><br>
#                 <input type="text" id="new_course_name" name="new_course_name"><br>
#                 <input type="submit" value="Update">
#             </form>
#
#     """
#
# @student_bp.route('/update_students', methods=['POST'])
# def update_student():
#     student_id = request.form['student_id']
#     new_course_name = request.form['new_course_name']
#
#     conn = connect_to_database('student.db')
#     cursor = conn.cursor()
#
#     cursor.execute("UPDATE Student SET Course_Name=? WHERE Student_ID=?", (new_course_name, student_id))
#     conn.commit()
#
#     conn.close()
#
#     return "Student course name updated successfully."
#


@student_bp.route('/update_student_form')
def update_student_form():
    html_content = """
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Update Student Course</title>
    </head>
    <body>
        <h2>Update Student Course</h2>
        <form id="updateForm">
            <label for="studentId">Student ID:</label><br>
            <input type="text" id="studentId" name="studentId" required><br>
            <label for="newCourseName">New Course Name:</label><br>
            <input type="text" id="newCourseName" name="newCourseName" required><br><br>
            <input type="submit" value="Update">
        </form>

        <script>
            document.getElementById("updateForm").addEventListener("submit", function(event) {
                event.preventDefault();

                var studentId = document.getElementById("studentId").value;
                var newCourseName = document.getElementById("newCourseName").value;

                var url = "/update_student/" + studentId;
                var data = { new_course_name: newCourseName };

                fetch(url, {
                    method: 'PUT',
                    headers: {
                        'Content-Type': 'application/json'
                    },
                    body: JSON.stringify(data)
                })
                .then(response => {
                    if (response.ok) {
                        alert("Student course updated successfully.");
                    } else {
                        alert("Failed to update student course.");
                    }
                })
                .catch(error => {
                    console.error('Error:', error);
                    alert("Failed to update student course.");
                });
            });
        </script>
    </body>
    </html>
    """
    return html_content

@student_bp.route('/update_students/<int:student_id>', methods=['PUT'])
def update_student(student_id):
    data = request.json
    new_course_name = data.get('new_course_name')

    if not new_course_name:
        return "New course name is missing", 400

    conn = connect_to_database('student.db')
    cursor = conn.cursor()

    cursor.execute("UPDATE Student SET Course_Name=? WHERE Student_ID=?", (new_course_name, student_id))
    conn.commit()

    conn.close()

    return "Student course name updated successfully."

@student_bp.route('/delete_student/<int:student_id>', methods=['DELETE'])
def delete_student(student_id):
    conn = connect_to_database('student.db')
    cursor = conn.cursor()

    cursor.execute("DELETE FROM Student WHERE Student_ID=?", (student_id,))
    conn.commit()

    conn.close()

    return "Student deleted successfully."

@student_bp.route('/delete_student_course_form')
def delete_student_course_form():
    html_content = """
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Delete Student Course</title>
    </head>
    <body>
        <h2>Delete Student Course</h2>
        <form id="deleteForm">
            <label for="studentId">Student ID:</label><br>
            <input type="text" id="studentId" name="studentId" required><br>
            <label for="courseName">Course Name:</label><br>
            <input type="text" id="courseName" name="courseName" required><br><br>
            <input type="submit" value="Delete">
        </form>

        <script>
            document.getElementById("deleteForm").addEventListener("submit", function(event) {
                event.preventDefault();

                var studentId = document.getElementById("studentId").value;
                var courseName = document.getElementById("courseName").value;

                var url = "/delete_student_course/" + studentId + "?course_name=" + courseName;
                var data = { course_name: courseName };

                fetch(url, {
                    method: 'DELETE',
                    headers: {
                        'Content-Type': 'application/json'
                    },
                    body: JSON.stringify(data)
                })
                .then(response => {
                    if (response.ok) {
                        alert("Student course deleted successfully.");
                    } else {
                        alert("Failed to delete student course.");
                    }
                })
                .catch(error => {
                    console.error('Error:', error);
                    alert("Failed to delete student course.");
                });
            });
        </script>
    </body>
    </html>
    """
    return html_content

@student_bp.route('/delete_student_course/<int:student_id>', methods=['DELETE'])
def delete_student_course(student_id):
    course_name = request.args.get('course_name')

    conn = connect_to_database('student.db')
    cursor = conn.cursor()

    try:
        cursor.execute("DELETE FROM Student WHERE Student_ID=? AND Course_Name=?", (student_id, course_name))
        conn.commit()
        message = "Student course deleted successfully."
    except Exception as e:
        conn.rollback()
        message = "Failed to delete student course: " + str(e)
    finally:
        conn.close()

    return message

@student_bp.route('/home')
def index():
    return render_template('index.html')

@student_bp.route('/chatroom/<int:group_id>/<int:user_id>')
def chatroom(group_id, user_id):
    conn = connect_to_database('student.db')
    cursor = conn.cursor()

    cursor.execute("SELECT Student.First_Name, StudentStatus.Status FROM Student INNER JOIN StudentStatus ON Student.Student_ID = StudentStatus.Student_ID WHERE StudentStatus.Group_ID = ? AND StudentStatus.Status = 'online' AND Student.Student_ID != ?", (group_id, user_id))
    users = cursor.fetchall()

    conn.close()

    return render_template('chatRoom.html', users=users)


