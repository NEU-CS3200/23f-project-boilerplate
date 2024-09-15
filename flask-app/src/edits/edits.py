from flask import Blueprint, request, jsonify, make_response, current_app
import json
from src import db

edits = Blueprint('Edits', __name__)

# Get an edit's info 
@edits.route('/Edits/<postID>', methods=['GET'])
def get_edit (id):

    query = 'SELECT editID, postID, asstName, edit FROM Readers WHERE postID = ' + str(id)
    current_app.logger.info(query)

    cursor = db.get_db().cursor()
    cursor.execute(query)
    column_headers = [x[0] for x in cursor.description]
    json_data = []
    the_data = cursor.fetchall()
    for row in the_data:
        json_data.append(dict(zip(column_headers, row)))
    return jsonify(json_data)

# Post an edit 
@edits.route('/Edits', methods=['POST'])
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

# Get an edits made by an assistanct
@edits.route('/Edits/<asstName>', methods=['GET'])
def get_edit_by_asst (name):

    query = 'SELECT editID, postID, asstName, edit FROM Readers WHERE asstName = ' + name
    current_app.logger.info(query)

    cursor = db.get_db().cursor()
    cursor.execute(query)
    column_headers = [x[0] for x in cursor.description]
    json_data = []
    the_data = cursor.fetchall()
    for row in the_data:
        json_data.append(dict(zip(column_headers, row)))
    return jsonify(json_data)

# Get all edits info
@edits.route('/Edits', methods=['GET'])
def get_edits ():

    # get a cursor object from the database
    cursor = db.get_db().cursor()

    # use cursor to query the database for a list of products 
    cursor.execute('SELECT editID, postID, asstName, edit FROM Edits')

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

# Update an edit 
@edits.route('Edits', methods=['PUT'])
def update_edit():
    # collecting data from the request object 
    the_data = request.json
    current_app.logger.info(the_data)

    # extracting the variable
    editID = the_data['editID']
    edit = the_data['edit']

    # Constructing the query 
    query = 'UPDATE Edits SET'
    query += 'edit = ' + '"' + edit + '" '
    query += 'WHERE editID = ' + str(editID)
    current_app.logger.info(query) 

    # executing and comitting the insert statement
    cursor = db.get_db().curosr() 
    cursor.execute(query)
    db.get_db().commit()

    return 'success!'
    
# Delete an edit 
@edits.route('/Edits/<editID>', methods=['DELETE'])
def delete_edit(eid):
    query = 'DELETE FROM Edits' + \
        'WHERE editID = ' + str(eid)
    current_app.logger.info(query)

    cursor = db.get_db().cursor()
    cursor.execute(query)
    db.get_db().commit()

    return 'Success!'