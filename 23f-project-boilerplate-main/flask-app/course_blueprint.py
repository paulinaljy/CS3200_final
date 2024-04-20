from flask import Blueprint

course_blueprint = Blueprint('course_blueprint', __name__)


@course_blueprint.route('/')
def index():
    return "This is an course app"
