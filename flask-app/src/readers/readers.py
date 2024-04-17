from flask import Blueprint, request, jsonify, make_response, current_app
import json
from src import db

readers = Blueprint('Readers', __name__)

# Get all the readers from the database 
@readers.route('/Readers', method=['GET'])
def get_readers():
    # get a cursor object from the database
    cursor = db.get_db().cursor()

    # use cursor to query the database for a list of products 
    cursor.execute('SELECT userID, age, firstName, lastName, email, active FROM Readers')

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

# Get a reader's info 
@readers.route('/Readers/<userID>', methods=['GET'])
def get_reader (id):

    query = 'SELECT userID, age, firstName, lastName, email, active FROM Readers WHERE id = ' + str(id)
    current_app.logger.info(query)

    cursor = db.get_db().cursor()
    cursor.execute(query)
    column_headers = [x[0] for x in cursor.description]
    json_data = []
    the_data = cursor.fetchall()
    for row in the_data:
        json_data.append(dict(zip(column_headers, row)))
    return jsonify(json_data)

# Post a reader info 
@readers.route('/Readers', method=['POST'])
def add_new_reader():
    
    # collecting data from the request object 
    the_data = request.json
    current_app.logger.info(the_data)

    #extracting the variable
    id = the_data['userID']
    age = the_data['age']
    firstName = the_data['firstName']
    lastName = the_data['lastName']
    email = the_data['email']
    active = the_data['active']

    # Constructing the query
    query = 'insert into Readers (id, age, firstName, lastName, email, active) values ("'
    query += str(id) + '", "'
    query += str(age) + '", "'
    query += firstName + '", '
    query += lastName +'", '
    query += email + '", '
    query += str(active) + ')'
    current_app.logger.info(query)

    # executing and committing the insert statement 
    cursor = db.get_db().cursor()
    cursor.execute(query)
    db.get_db().commit()
    
    return 'Success!'