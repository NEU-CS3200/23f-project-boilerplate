# Some set up for the application 

from flask import Flask
from flaskext.mysql import MySQL

# create a MySQL object that we will use in other parts of the API
db = MySQL()

def create_app():
    app = Flask(__name__)
    
    # secret key that will be used for securely signing the session 
    # cookie and can be used for any other security related needs by 
    # extensions or your application
    app.config['SECRET_KEY'] = 'someCrazyS3cR3T!Key.!'

    # these are for the DB object to be able to connect to MySQL. 
    app.config['MYSQL_DATABASE_USER'] = 'root'
    app.config['MYSQL_DATABASE_PASSWORD'] = open('/secrets/db_root_password.txt').readline().strip()
    app.config['MYSQL_DATABASE_HOST'] = 'db'
    app.config['MYSQL_DATABASE_PORT'] = 3306
    app.config['MYSQL_DATABASE_DB'] = 'JetsetterDB'  # Change this to your DB name

    # Initialize the database object with the settings above. 
    db.init_app(app)
    
    # Add the default route
    # Can be accessed from a web browser
    # http://ip_address:port/
    # Example: localhost:8001
    @app.route("/")
    def welcome():
        return "<h1>Welcome to the the Jetsetter Database</h1>"
    
   

    # Import the various Beluprint Objects
    # from src.customers.customers import customers
    from src.flight.flight import Flight
    # from src.products.products  import products
    from src.passengers.passengers import passengers
    from src.airports.airports import airports
    from src.bookings.bookings import bookings

    # Register the routes from each Blueprint with the app object
    # and give a url prefix to each
    app.register_blueprint(passengers, url_prefix='/p')
    app.register_blueprint(airports, url_prefix='/a')
    app.register_blueprint(bookings, url_prefix='/b')

    app.register_blueprint(Flight,     url_prefix='/f')


    # Don't forget to return the app object
    return app