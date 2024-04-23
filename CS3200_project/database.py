from flask_mysqldb import MySQL

mysql = MySQL()

def init_mysql(app):
    # MySQL configurations
    app.config['MYSQL_DATABASE_USER'] = 'root'
    app.config['MYSQL_DATABASE_PASSWORD'] = 'MyNewPass'
    app.config['MYSQL_DATABASE_DB'] = 'canvas'
    app.config['MYSQL_DATABASE_HOST'] = 'localhost'

    mysql.init_app(app)

