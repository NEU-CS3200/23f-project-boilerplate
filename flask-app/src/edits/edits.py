from flask import Blueprint, request, jsonify, make_response, current_app
import json
from src import db

edits = Blueprint('Edits', __name__)

# Get a edit's info 
@edits.route('/Edits/<postID>', methods=['GET'])
def get_edit (id):

    query = 'SELECT editID, postID, asstName, edit FROM Readers WHERE id = ' + str(id)
    current_app.logger.info(query)

    cursor = db.get_db().cursor()
    cursor.execute(query)
    column_headers = [x[0] for x in cursor.description]
    json_data = []
    the_data = cursor.fetchall()
    for row in the_data:
        json_data.append(dict(zip(column_headers, row)))
    return jsonify(json_data)

# Post a edit 
@edits.route('/Edits', method=['POST'])
def add_new_edit():
    
    # collecting data from the request object 
    the_data = request.json
    current_app.logger.info(the_data)

    #extracting the variable
    editID = the_data['editID']
    postID = the_data['postID']
    asstName = the_data['asstName']
    edit = the_data['edit']

    # Constructing the query
    query = 'insert into Edits (editID, postID, asstName, edit) values ("'
    query += str(editID) + '", "'
    query += str(postID) + '", "'
    query += asstName + '", '
    query += edit + ')'
    current_app.logger.info(query)

    # executing and committing the insert statement 
    cursor = db.get_db().cursor()
    cursor.execute(query)
    db.get_db().commit()
    
    return 'Success!'