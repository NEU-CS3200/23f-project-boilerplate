from flask import Blueprint, request, jsonify, make_response, current_app
import json
from src import db


customers = Blueprint('customers', __name__)

# Get all the customers from the database
# Output array containing details of all customers including their personal information
@customers.route('/', methods=['GET'])
def get_customers():
    # get a cursor object from the database
    cursor = db.get_db().cursor()

    # use cursor to query the database for a list of customers
    cursor.execute('SELECT * FROM customer')

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

# add a new customer to the db
# Expects payload of details of new customer
# Return success message if details of new customer are successfully inputted 
@customers.route('/', methods=['POST'])
def add_new_customer():
    
    # collecting data from the request object 
    the_data = request.json
    current_app.logger.info(the_data)

    #extracting the variable
    if 'firstName' not in the_data:
        return jsonify({"message": "Error: firstName not provided"})
    if 'lastName' not in the_data:
        return jsonify({"message": "Error: lastName not provided"})
    if 'cellPhone' not in the_data:
        return jsonify({"message": "Error: cellPhone not provided"})
    if 'homePhone' not in the_data:
        return jsonify({"message": "Error: homePhone not provided"})
    if "email" not in the_data:
        return jsonify({"message": "Error: email not provided"})
    if "street" not in the_data:
        return jsonify({"message": "Error: street not provided"})
    if "city" not in the_data:
        return jsonify({"message": "Error: city not provided"})
    if "state" not in the_data:
        return jsonify({"message": "Error: state not provided"})
    if "zip" not in the_data:
        return jsonify({"message": "Error: zip not provided"})
    if "profileText" not in the_data:
        return jsonify({"message": "Error: profileText not provided"})
    
    firstName = the_data['firstName']
    lastName = the_data['lastName']
    cellPhone = the_data['cellPhone']
    homePhone = the_data['homePhone']
    email = the_data['email']
    street = the_data['street']
    city = the_data['city']
    state = the_data['state']
    zip = the_data['zip']
    profileText = the_data['profileText']

    if firstName is None:
        return jsonify({"message": "Error: firstName is null"}), 400
    if lastName is None:
        return jsonify({"message": "Error: lastName is null"}), 400
    if cellPhone is None:
        return jsonify({"message": "Error: cellPhone is null"}), 400
    if homePhone is None:
        return jsonify({"message": "Error: homePhone is null"}), 400
    if email is None:
        return jsonify({"message": "Error: email is null"}), 400
    if street is None:
        return jsonify({"message": "Error: street is null"}), 400
    if city is None:
        return jsonify({"message": "Error: city is null"}), 400
    if state is None:
        return jsonify({"message": "Error: state is null"}), 400
    if zip is None:
        return jsonify({"message": "Error: zip is null"}), 400
    if profileText is None:
        return jsonify({"message": "Error: profileText is null"}), 400
    
    cursor = db.get_db().cursor()
    cursor.execute("SELECT * FROM customer WHERE cellPhone = " +  '"' + cellPhone + '"')
    existingInfo = cursor.fetchone()
    if existingInfo is not None:
        return "Error: cellPhone is already registered"
    
    cursor.execute("SELECT * FROM customer WHERE homePhone = " +  '"' + homePhone + '"')
    existingInfo = cursor.fetchone()
    if existingInfo is not None:
        return "Error: homePhone is already registered"
    
    cursor.execute("SELECT * FROM customer WHERE email = " +  '"' + email + '"')
    existingInfo = cursor.fetchone()
    if existingInfo is not None:
        return "Error: email is already registered"
    
    # Constructing the query
    query = 'insert into customer (firstName, lastName, cellPhone, homePhone, email, street, city, state, zip, profileText) values ("'
    query += firstName + '", "'
    query += lastName + '", "'
    query += cellPhone + '", "'
    query += homePhone + '", "'
    query += email + '", "'
    query += street + '", "'
    query += city + '", "'
    query += state + '", '
    query += str(zip) + ', "'
    query += profileText + '")'
    print(query)
    current_app.logger.info(query)

    # executing and committing the insert statement 
    cursor = db.get_db().cursor()
    cursor.execute(query)
    db.get_db().commit()
    
    return jsonify({"message":'Success!'})

# Get a certain customer from the database based on ID
# Expects customerID as input
# Outputs details of specified customer
@customers.route('/<customerID>', methods=['GET'])
def get_type(customerID):
    # get a cursor object from the database
    cursor = db.get_db().cursor()

    # use cursor to query the database for a list of products
    cursor.execute('SELECT * FROM customer WHERE customerID={0}'.format(customerID))

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

# Delete a specific customer from the database based on its customerID
# Expects customerID as input
# Outputs success message if customer is successfully added 
@customers.route('/<customerID>', methods=['DELETE'])
def delete_type(customerID):
    # get a cursor object from the database
    cursor = db.get_db().cursor()
    # use cursor to query the database for a list of customers
    cursor.execute('DELETE FROM customer WHERE customerID={0}'.format(customerID))
    db.get_db().commit()
    return jsonify({"message": "Success!"}) 

# Update the specified supplier in the database based on supplierID
# Expects payload of customer updated details
# Outputs success message if customer is successfully updated
@customers.route('/<customerID>', methods=['PUT'])
def update_customer(customerID):
    
    # collecting data from the request object 
    the_data = request.json
    current_app.logger.info(the_data)

    query = 'UPDATE customer SET '

    cursor = db.get_db().cursor()
    
    #construct query
    if 'firstName' in the_data:
        firstName = the_data['firstName']
        if firstName is None:
            return jsonify({"message": "Error: firstName is null"}), 400
        query += ('firstName = "' + firstName + '",')
    if 'lastName' in the_data:
        lastName = the_data['lastName']
        if lastName is None:
            return jsonify({"message": "Error: lastName is null"}), 400
        query += ('lastName = "' + lastName + '",')
    if 'cellPhone' in the_data:
        cellPhone = the_data['cellPhone']
        if cellPhone is None:
            return jsonify({"message": "Error: cellPhone is null"}), 400
        cursor.execute("SELECT * FROM customer WHERE cellPhone = " +  '"' + cellPhone + '"')
        existingInfo = cursor.fetchone()
        if existingInfo is not None:
            return "Error: cellPhone is already registered"
        query += ('cellPhone = "' + cellPhone + '",')
    if 'homePhone' in the_data:
        homePhone = the_data['homePhone']
        if homePhone is None:
            return jsonify({"message": "Error: homePhone is null"}), 400
        cursor.execute("SELECT * FROM customer WHERE homePhone = " +  '"' + homePhone + '"')
        existingInfo = cursor.fetchone()
        if existingInfo is not None:
            return "Error: homePhone is already registered"
        query += ('homePhone = "' + homePhone + '",')
    if 'email' in the_data:
        email = the_data['email']
        if email is None:
            return jsonify({"message": "Error: email is null"}), 400
        cursor.execute("SELECT * FROM customer WHERE email = " + '"' + email + '"')
        existingInfo = cursor.fetchone()
        if existingInfo is not None:
            return "Error: email is already registered"
        query += ('email = "' + email + '",')
    if 'street' in the_data:
        street = the_data['street']
        if street is None:
            return jsonify({"message": "Error: street is null"}), 400
        query += ('street = "' + street + '",')
    if 'city' in the_data:
        city = the_data['city']
        if city is None:
            return jsonify({"message": "Error: city is null"}), 400
        query += ('city = "' + city + '",')
    if 'state' in the_data:
        state = the_data['state']
        if state is None:
            return jsonify({"message": "Error: state is null"}), 400
        query += ('state = "' + state + '",')
    if 'zip' in the_data:
        zip = the_data['zip']
        if zip is None:
            return jsonify({"message": "Error: zip is null"}), 400
        query += ('zip = ' + str(zip) + ',')
    if 'profileText' in the_data:
        profileText = the_data['profileText']
        if profileText is None:
            return jsonify({"message": "Error: profileText is null"}), 400
        query += ('profileText = "' + profileText + '",')

    if query is 'UPDATE customer SET ':
        return jsonify({"message": "Error: no fields provided"}), 400
    #remove unnecessary comma    and    update the appropriate supplier by supplierID
    query = query[0:len(query) - 1] + " WHERE customerID = {0}".format(customerID)

    print(query)
    current_app.logger.info(query)

    # executing and committing the insert statement
    cursor.execute(query)
    db.get_db().commit()
    
    return jsonify({"message": "Success!"})


# Get all customers of a specific zip code
# Expects input of specific zip code 
# Outputs array of customers with specified zip code
@customers.route('/zip/<zip>', methods=['GET'])
def get_cust_by_zip(zip):
    # get a cursor object from the database
    cursor = db.get_db().cursor()

    # use cursor to query the database for a list of products
    cursor.execute('SELECT * FROM customer WHERE zip={0}'.format(zip))

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
