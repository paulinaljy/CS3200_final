from flask import Blueprint

student_blueprint = Blueprint('student_blueprint', __name__)

@student_blueprint.route('/')
def index():
    return "This is an student app"
