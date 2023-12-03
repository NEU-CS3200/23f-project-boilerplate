from flask import Blueprint, request, jsonify, make_response, current_app
import json
from src import db
import sys


clients = Blueprint('client', __name__)

def getValString(val):
    if (val is None):
        return 'Null'
    else:
      return '"' + str(val) + '"'

# Get all the clients from the database
@clients.route('/clients', methods=['GET'])
def get_clients():
    # get a cursor object from the database
    cursor = db.get_db().cursor()

    # use cursor to query the database for a list of clients
    cursor.execute('SELECT * FROM client')

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

@clients.route('/clients', methods=['POST'])
def add_new_client():
    
    # collecting data from the request object 
    the_data = request.json
    current_app.logger.info(the_data)

    #extracting the variable
    street = the_data['street']
    city = the_data['city']
    state = the_data['state']
    zip = the_data['zip']
    lastName = the_data["last_name"]
    firstName = the_data['first_name']
    email = the_data['email']
    phoneNumber = the_data['phone_number']

    # Constructing the query
    query = 'insert into client (street, city, state, zip, last_name, first_name, email, phone_number) values (' 
    query += getValString(street) + ', '
    query += getValString(city) + ', '
    query += getValString(state) + ', '
    query += getValString(zip) + ', '
    query += getValString(lastName) + ', '
    query += getValString(firstName) + ', '
    query += getValString(email) + ', '
    query += getValString(phoneNumber) + ', '
    current_app.logger.info(query)

    # executing and committing the insert statement 
    cursor = db.get_db().cursor()
    cursor.execute(query)
    db.get_db().commit()
    
    return 'Success!'

@clients.route('/clients/<id>', methods=['GET'])
def get_client_detail(id):
    query = 'SELECT * FROM client WHERE client_id = ' + str(id)
    current_app.logger.info(query)

    cursor = db.get_db().cursor()
    cursor.execute(query)
    column_headers = [x[0] for x in cursor.description]
    json_data = []
    the_data = cursor.fetchall()
    for row in the_data:
        json_data.append(dict(zip(column_headers, row)))
    return jsonify(json_data)
    
@clients.route('/clients/<id>', methods={'PUT'})
def update_client_detail(id):
    # collecting data from the request object 
    the_data = request.json
    current_app.logger.info(the_data)

    #extracting the variable
    street = the_data['street']
    city = the_data['city']
    state = the_data['state']
    zip = the_data['zip']
    lastName = the_data["last_name"]
    firstName = the_data['first_name']
    email = the_data['email']
    phoneNumber = the_data['phone_number']

    # Constructing the query
    query = 'UPDATE client SET '
    query += 'street = ' + getValString(street) + ', '
    query += 'city = ' + getValString(city) + ', '
    query += 'state = ' + getValString(state) + ', '
    query += 'zip = ' + getValString(zip) + ', '
    query += 'last_name = ' + getValString(lastName) + ', '
    query += 'first_name = ' + getValString(firstName) + ', '
    query += 'phone_number = ' + getValString(phoneNumber) + ', '
    query += 'email = ' + getValString(email) + ', '
    query += 'WHERE client_id = ' + str(id)
    current_app.logger.info(query)

    # executing and committing the update statement 
    cursor = db.get_db().cursor()
    cursor.execute(query)
    db.get_db().commit()
    
    return 'Success!'

@clients.route('/clients/<id>', methods={'DELETE'})
def delete_client(id):
    # Constructing the query
    query = 'DELETE FROM client '
    query += 'WHERE client_id = ' + str(id)
    current_app.logger.info(query)

    # executing and committing the delete statement 
    cursor = db.get_db().cursor()
    cursor.execute(query)
    db.get_db().commit()
    
    return 'Success!'

@clients.route('/clients/<client-id>/<employee-id>', methods={'POST'})
def new_client_employee_association(client_id, employee_id):

    # Constructing the query
    query = 'INSERT INTO employee_client (employee_id, client_id) VALUES ('
    query += str(employee_id) + ', ' + str(client_id) + ')'
    current_app.logger.info(query)

    # executing and committing the update statement 
    cursor = db.get_db().cursor()
    cursor.execute(query)
    db.get_db().commit()
    
    return 'Success!'

@clients.route('/clients/<client-id>/<employee-id>', methods={'PUT'})
def associate_client_employee(client_id, employee_id):

    # Constructing the query
    query = 'UPDATE employee_client SET '
    query += 'client_id = ' + str(client_id) + ', '
    query += 'WHERE employee_id = ' + str(employee_id)
    current_app.logger.info(query)

    # executing and committing the update statement 
    cursor = db.get_db().cursor()
    cursor.execute(query)
    db.get_db().commit()
    
    return 'Success!'

@clients.route('/clients/<client-id>/<employee-id>', methods={'DELETE'})
def disassociate_client_employee(client_id, employee_id):
    # Constructing the query
    query = 'DELETE FROM employee_client'
    query += 'WHERE client_id = ' + str(client_id) + ' AND employee_id = ' + str(employee_id)
    current_app.logger.info(query)

    # executing and committing the delete statement 
    cursor = db.get_db().cursor()
    cursor.execute(query)
    db.get_db().commit()
    
    return 'Success!'

