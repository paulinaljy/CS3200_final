from flask import Blueprint

student_blueprint = Blueprint('student_blueprint', __name__)


@student_blueprint.route('/student', methods=['GET'])
def get_all_students():
    return '<h1>Placeholder for return all students info</h1>'
