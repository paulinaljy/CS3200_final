from flask import Blueprint

assignment_blueprint = Blueprint('assignment_blueprint', __name__)


@assignment_blueprint.route('/')
def index():
    return "<h2>This is an assignment app</h2>"
