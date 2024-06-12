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
    app.config['MYSQL_DATABASE_DB'] = 'inkSprout'  # Change this to your DB name

    # Initialize the database object with the settings above. 
    db.init_app(app)
    
    # Add the default route
    # Can be accessed from a web browser
    # http://ip_address:port/
    # Example: localhost:8001
    @app.route("/")
    def welcome():
        return "<h1>Welcome to the 3200 boilerplate app</h1>"

    # Import the various Beluprint Objects
    from src.posts.posts  import posts
    from src.post_comments.post_comments  import post_comments
    from src.issue_report.issue_report import issue_report
    from src.edits.edits import edits
    from src.employees.employees import employees
    from src.moderators.moderators import moderators
    from src.tags.tags import tags
    from src.writingassistants.writingassistants import writingassistants
    from src.readers.readers import readers
    from src.content_creators.content_creators import content_creators
    from src.followings.followings import followings

    # Register the routes from each Blueprint with the app object
    # and give a url prefix to each
    app.register_blueprint(posts, url_prefix='/p')
    app.register_blueprint(post_comments, url_prefix = '/pc')
    app.register_blueprint(issue_report, url_prefix = '/i')
    app.register_blueprint(employees, url_prefix = '/em')
    app.register_blueprint(moderators, url_prefix = '/m')
    app.register_blueprint(tags, url_prefix = '/t')
    app.register_blueprint(writingassistants, url_prefix = '/wa')
    app.register_blueprint(readers, url_prefix = '/r')
    app.register_blueprint(edits, url_prefix = '/e')
    app.register_blueprint(content_creators, url_prefix = '/cc')
    app.register_blueprint(followings, url_prefix = '/f')

    # Don't forget to return the app object
    return app