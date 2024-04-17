from flask import Blueprint, request, jsonify, make_response, current_app
import json
from src import db

tags = Blueprint('Tags', __name__)

# Post a tag info 
@tags.route('/Tags', method=['POST'])
def add_new_edit():
    
    # collecting data from the request object 
    the_data = request.json
    current_app.logger.info(the_data)

    #extracting the variable
    tagID = the_data['tagID']
    postID = the_data['postID']
    tagName = the_data['tagName']

    # Constructing the query
    query = 'insert into Tags (tagID, postID, tagName) values ("'
    query += str(tagID) + '", "'
    query += str(postID) + '", "'
    query += tagName + ')'
    current_app.logger.info(query)

    # executing and committing the insert statement 
    cursor = db.get_db().cursor()
    cursor.execute(query)
    db.get_db().commit()
    
    return 'Success!'