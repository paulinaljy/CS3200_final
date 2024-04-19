###
# Main application interface
###

# import the create app function 
# Create the object app
from flask import Flask

# The __name__ variable is a special variable in Python that contains the name
# of the current flask module
app = Flask(__name__)

@app.route('/')
def index(): # The view function index() is linked to the route using the app.route decorator
    return "This is an example "
if __name__ == '__main__':
    # we want to run in debug mode (for hot reloading) 
    # this app will be bound to port 4000. 
    # Take a look at the docker-compose.yml to see 
    # what port this might be mapped to... 
    app.run(debug = True, host = '0.0.0.0', port = 4000)