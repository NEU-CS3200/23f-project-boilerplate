from flask import Blueprint, request, jsonify, make_response, current_app
import json
from src import db

readers = Blueprint('Readers', __name__)

# Get all the readers from the database 
@readers.route('/Readers', methods=['GET'])
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
def get_reader(userID):

    query = 'SELECT userID, age, firstName, lastName, email, active FROM Readers WHERE userID = ' + str(userID)
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
@readers.route('/Readers', methods=['POST'])
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

# Get a list of readers info who is active
@readers.route('/Readers/<active>', methods=['GET'])
def get_reader_active():
    # get a cursor object from the database
    cursor = db.get_db().cursor()

    # use cursor to query the database for a list of products 
    cursor.execute('SELECT userID, age, firstName, lastName, email FROM Readers WHERE active = 1' )

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

# Update a reader info (like active status / info)
@readers.route('Readers', methods=['PUT'])
def update_reader():
    # collecting data from the request object 
    the_data = request.json
    current_app.logger.info(the_data)

    # extracting the variable
    userID = the_data['userID']
    age = the_data['age']
    firstName = the_data['firstName']
    lastName = the_data['lastName']
    email = the_data['email']

    # Constructing the query 
    query = 'UPDATE Readers SET'
    query += 'age = ' + '"' + age + '", '
    query += 'firstName = ' + '"' + firstName + '", '
    query += 'lastName = ' + '"' + lastName + '", '
    query += 'email = ' + '"' + email + '" '
    query += 'WHERE userID = ' + str(userID)
    current_app.logger.info(query) 

    # executing and comitting the insert statement
    cursor = db.get_db().curosr() 
    cursor.execute(query)
    db.get_db().commit()

    return 'success!'


# Delete a reader 
@readers.route('/Readers/<userID>', methods=['DELETE'])
def delete_tag(uid):
    query = 'DELETE FROM Readers' + \
        'WHERE userID = ' + str(uid)
    current_app.logger.info(query)

    cursor = db.get_db().cursor()
    cursor.execute(query)
    db.get_db().commit()

    return 'Success!'