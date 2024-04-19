from flask import Blueprint, render_template
from database import mysql

read = Blueprint('read', __name__)

@read.route('/read')
