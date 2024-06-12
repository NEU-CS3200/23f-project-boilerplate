from flask import Blueprint, request, jsonify, make_response, current_app
import json
from src import db

tags = Blueprint('Tags', __name__)

# Post a tag info 
@tags.route('/Tags', methods=['POST'])
def add_new_tag ():
    
    # collecting data from the request object 
    the_data = request.json
    current_app.logger.info(the_data)

    #extracting the variable
    tagID = the_data['tagID']
    postID = the_data['postID']
    tagName = the_data['tagName']

    # Constructing the query
    query = 'insert into Tags (tagID, postID, tagName) values ('
    query += str(tagID) + ', '
    query += str(postID) + ', "'
    query += tagName + '")'
    current_app.logger.info(query)

    # executing and committing the insert statement 
    cursor = db.get_db().cursor()
    cursor.execute(query)
    db.get_db().commit()
    
    return 'Success!'

# Get tag infos for one post 
@tags.route('/Tags/<postID>', methods=['GET'])
def get_tags_by_post (id): 
    query = 'SELECT tagID, postID, tagName FROM Tags WHERE postID = ' + str(id)
    current_app.logger.info(query)

    cursor = db.get_db().cursor()
    cursor.execute(query)
    column_headers = [x[0] for x in cursor.description]
    json_data = []
    the_data = cursor.fetchall()
    for row in the_data:
        json_data.append(dict(zip(column_headers, row)))
    return jsonify(json_data)

# Get all tags used for posts 
@tags.route('/Tags', methods=['GET'])
def get_tags ():

    # get a cursor object from the database
    cursor = db.get_db().cursor()

    # use cursor to query the database for a list of products 
    cursor.execute('SELECT tagID, postID, tagName FROM Tags')

    # grab the column headers from the returned data
    column_headers = [x[0] for x in cursor.description]

    # create an empty dictionary object to use in 
    # putting column headers together with data
    json_data = []

    # fetch all the data from the cursor
    theData = cursor.fetchall()

    # for each of the rows, zip the data elements together with
    # the column headers. 
    for row in theData:
        json_data.append(dict(zip(column_headers, row)))

    return jsonify(json_data)

# Get posts with the same tag 
@tags.route('/Tags/<tagName>', methods=['GET'])
def get_posts_with_same_tag (tagname): 
    query = 'SELECT tagID, postID, tagName FROM Tags WHERE tagName = ' + tagname
    current_app.logger.info(query)

    cursor = db.get_db().cursor()
    cursor.execute(query)
    column_headers = [x[0] for x in cursor.description]
    json_data = []
    the_data = cursor.fetchall()
    for row in the_data:
        json_data.append(dict(zip(column_headers, row)))
    return jsonify(json_data)

# Update a tag  
@tags.route('Tags', methods=['PUT'])
def update_tag():
    # collecting data from the request object 
    the_data = request.json
    current_app.logger.info(the_data)

    # extracting the variable
    tagID = the_data['tagID']
    tagName = the_data['tagName']

    # Constructing the query 
    query = 'UPDATE Tags SET '
    query += 'tagName = "' + tagName + '" '
    query += 'WHERE tagID = ' + str(tagID)
    current_app.logger.info(query) 

    # executing and comitting the insert statement
    cursor = db.get_db().curosr() 
    cursor.execute(query)
    db.get_db().commit()

    return 'success!'

# Delete a tag 
@tags.route('/Tags/<tagID>', methods=['DELETE'])
def delete_tag(tid):
    query = 'DELETE FROM Tags ' + \
        'WHERE tagID = ' + str(tid)
    current_app.logger.info(query)

    cursor = db.get_db().cursor()
    cursor.execute(query)
    db.get_db().commit()

    return 'Success!'