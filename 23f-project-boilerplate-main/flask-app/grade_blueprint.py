from flask import Blueprint

grade_blueprint = Blueprint('grade_blueprint', __name__)


@grade_blueprint.route('/')
def index():
    return "This is an grade app"
