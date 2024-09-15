from flask import Blueprint, request, jsonify, make_response, current_app
import json
from src import db

posts = Blueprint('posts', __name__)

# Get all posts for ContentCreator with particular userID
@posts.route('/posts/<userID>', methods=['GET'])
def get_posts(userID):
    cursor = db.get_db().cursor()
    cursor.execute('select * from Posts where userID = {0}'.format(userID))
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response

# Retrieve selected attributes (postID, title, content) of the posts
@posts.route('/posts', methods=['GET'])
def get_all_posts():
    cursor = db.get_db().cursor()
    cursor.execute('select postID, title, content from Posts')
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response

# Upload new post
# Some errors - need to test with actual JSONForm
@posts.route('/posts', methods=['POST'])
def add_new_post():
    
    # collecting data from the request object 
    the_data = request.json
    current_app.logger.info(the_data)

    #extracting the variable
    userID = the_data['userID']
    title = the_data['title']
    content = the_data['content']

    # Constructing the query
    query = 'insert into Posts (userID, title, content) values ("'
    query += userID + '", "'
    query += title + '", "'
    query += content + ')'
    current_app.logger.info(query)

    # executing and committing the insert statement 
    cursor = db.get_db().cursor()
    cursor.execute(query)
    db.get_db().commit()
    
    return 'Success!'

# Update old post
# Need to check if it works with JSON form
@posts.route('/posts/<postID>', methods=['PUT'])
def update_post(postID):
    # Collecting data from the request object
    the_data = request.json
    
    # Extracting the variables
    title = the_data.get('title')
    content = the_data.get('content')
    price = the_data.get('price')

    # Constructing the query
    query = 'UPDATE Posts SET title = %s, content = %s, price = %s WHERE postID = %s'
    query_data = (title, content, price, postID)

    # Executing the query
    cursor = db.get_db().cursor()
    cursor.execute(query, query_data)
    
    # Committing the trnsaction
    db.get_db().commit()
    
    return 'Success!'

# The totaled earnings per post
@posts.route('/posts/<postID>/sum-price', methods=['GET'])
def get_post_earnings(postID):
    cursor = db.get_db().cursor()
    cursor.execute('SELECT postID, price * numberOfViews FROM Posts AS totalEarnings where postID = {0}'.format(postID))
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response

# The totaled views per post
@posts.route('/posts/numberofreaders', methods=['GET'])
def get_post_readings():
    cursor = db.get_db().cursor()
    cursor.execute('''
        SELECT Posts.postID,
               Posts.userID AS post_creator,
               COUNT(Read_By.userID) AS num_readers
        FROM Posts
        LEFT JOIN Read_By ON Posts.postID = Read_By.postID
        GROUP BY Posts.postID, Posts.userID;
    ''')
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response

@posts.route('/posts/nbrofreaders/<userID>', methods=['GET'])
def get_post_NBR_readings(userID):
    
    query = 'SELECT Posts.postID, Posts.userID AS post_creator,' + \
        'COUNT(Read_By.userID) AS num_readers FROM Posts ' + \
        'LEFT JOIN Read_By ON Posts.postID = Read_By.postID ' + \
        'WHERE Posts.userID = ' + str(userID) + \
        ' GROUP BY Posts.postID, Posts.userID'
    
    cursor = db.get_db().cursor()
    cursor.execute(query)
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response

