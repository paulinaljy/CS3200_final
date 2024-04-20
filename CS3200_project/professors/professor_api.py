from flask import Blueprint

professor_blueprint = Blueprint('professor_blueprint', __name__)

@professor_blueprint.route('/professor', methods=['GET'])

def get_all_professor():
    return '<h1>Placeholder for getting all professor info</h1>'
