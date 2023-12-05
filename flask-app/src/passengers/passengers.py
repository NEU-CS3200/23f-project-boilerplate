from flask import Blueprint, request, jsonify, make_response, current_app
import json
from src import db


passengers = Blueprint('passengers', __name__)

# Get all the products from the database
@passengers.route('/passengers', methods=['GET'])
def get_passengers():
    # get a cursor object from the database
    cursor = db.get_db().cursor()

    # use cursor to query the database for a list of products
    cursor.execute('SELECT passengerID, fName, lName, phone FROM passenger')

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


# Get a specific passenger from the database
@passengers.route('/passengers/<id>', methods=['GET'])
def get_passenger_detail (id):

    query = 'SELECT passengerID, fName, lName, phone, sex, birthDate, email, street, zipcode, state, country FROM passenger WHERE passengerID = ' + str(id)
    current_app.logger.info(query)

    cursor = db.get_db().cursor()
    cursor.execute(query)
    column_headers = [x[0] for x in cursor.description]
    json_data = []
    the_data = cursor.fetchall()
    for row in the_data:
        json_data.append(dict(zip(column_headers, row)))
    return jsonify(json_data)

# Adds a new passenger
@passengers.route('/passengers', methods=['POST'])
def add_new_passenger():
    
    # collecting data from the request object 
    the_data = request.json
    current_app.logger.info(the_data)

    #extracting the variable
    passengerID = the_data['passengerID']
    fName = the_data['fName']
    lName = the_data['lName']
    phone = the_data['phone']
    sex = the_data['sex']
    birthDate = the_data['birthDate']
    email = the_data['email']
    street = the_data['street']
    zipcode = the_data['zipcode']
    country = the_data['country']

    # Constructing the query
    query = 'insert into airlineFlightEmployees (passengerID, fName, lName, phone, sex, birthDate, email, street, zipcode, country) values ("'
    query += passengerID + '", "'
    query += fName + '", "'
    query += lName + '", '
    query += phone + '", '
    query += sex + '", '
    query += birthDate + '", '
    query += email + '", '
    query += street + '", '
    query += zipcode + '", '
    query += country + '", '
    current_app.logger.info(query)

    # executing and committing the insert statement 
    cursor = db.get_db().cursor()
    cursor.execute(query)
    db.get_db().commit()
    
    return 'Success!'