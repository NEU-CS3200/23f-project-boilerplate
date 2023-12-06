from flask import Blueprint, request, jsonify, make_response, current_app
import json
from src import db


suppliers = Blueprint('suppliers', __name__)

# Get all the suppliers from the database
# Ouptut array containing details of all suppliers
@suppliers.route('/', methods=['GET'])
def get_suppliers():
    # get a cursor object from the database
    cursor = db.get_db().cursor()

    # use cursor to query the database for a list of suppliers
    cursor.execute('SELECT * FROM animal_supplier')

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

# add a new supplier to the db
# Expects payload with details of the new supplier
# Outputs success message if new supplier is successfully added 
@suppliers.route('/', methods=['POST'])
def add_new_supplier():
    
    # collecting data from the request object 
    the_data = request.json
    current_app.logger.info(the_data)

    #extracting the variable
    if 'firstName' not in the_data:
        return jsonify({"message": "Error: firstName not provided"})
    if 'lastName' not in the_data:
        return jsonify({"message": "Error: lastName not provided"})
    if 'phone' not in the_data:
        return jsonify({"message": "Error: phone not provided"})
    if "email" not in the_data:
        return jsonify({"message": "Error: email not provided"})
    if "company" not in the_data:
        return jsonify({"message": "Error: company not provided"})
    if "city" not in the_data:
        return jsonify({"message": "Error: city not provided"})
    if "state" not in the_data:
        return jsonify({"message": "Error: state not provided"})
    if "country" not in the_data:
        return jsonify({"message": "Error: country not provided"})
    if "contactLink" not in the_data:
        return jsonify({"message": "Error: contactLink not provided"})
    if "countSupplied" not in the_data:
        return jsonify({"message": "Error: countSupplied not provided"})
    if "profileText" not in the_data:
        return jsonify({"message": "Error: profileText not provided"})
    
    firstName = the_data['firstName']
    lastName = the_data['lastName']
    phone = the_data['phone']
    email = the_data['email']
    company = the_data['company']
    city = the_data['city']
    state = the_data['state']
    country = the_data['country']
    contactLink = the_data['contactLink']
    countSupplied = the_data['countSupplied']
    profileText = the_data['profileText']

    if firstName is None:
        return jsonify({"message": "Error: firstName is null"}), 400
    if lastName is None:
        return jsonify({"message": "Error: lastName is null"}), 400
    if phone is None:
        return jsonify({"message": "Error: phone is null"}), 400
    if email is None:
        return jsonify({"message": "Error: email is null"}), 400
    if company is None:
        return jsonify({"message": "Error: company is null"}), 400
    if city is None:
        return jsonify({"message": "Error: city is null"}), 400
    if state is None:
        return jsonify({"message": "Error: state is null"}), 400
    if country is None:
        return jsonify({"message": "Error: country is null"}), 400
    if contactLink is None:
        return jsonify({"message": "Error: contactLink is null"}), 400
    if countSupplied is None:
        return jsonify({"message": "Error: countSupplied is null"}), 400
    if profileText is None:
        return jsonify({"message": "Error: profileText is null"}), 400
    

    cursor = db.get_db().cursor()
    cursor.execute("SELECT * FROM animal_supplier WHERE email = " + '"' + email + '"')
    existingInfo = cursor.fetchone()
    if existingInfo is not None:
        return "Error: email is already registered"
    
    cursor.execute("SELECT * FROM animal_supplier WHERE phone = " +  '"' + phone + '"')
    existingInfo = cursor.fetchone()
    if existingInfo is not None:
        return "Error: phone is already registered"


    # Constructing the query
    query = 'insert into animal_supplier (firstName, lastName, phone, email, company, city, state, country, contactLink, countSupplied, profileText) values ("'
    query += firstName + '", "'
    query += lastName + '", "'
    query += phone + '", "'
    query += email + '", "'
    query += company + '", "'
    query += city + '", "'
    query += state + '", "'
    query += country + '", "'
    query += contactLink + '", '
    query += str(countSupplied) + ', "'
    query += profileText + '")'
    print(query)
    current_app.logger.info(query)

    # executing and committing the insert statement 
    cursor.execute(query)
    db.get_db().commit()
    
    return jsonify({"message":'Success!'})

# Get a certain supplier from the database based on ID
# Expects input of supplierID
# Outputs details of a certain supplier
@suppliers.route('/<supplierID>', methods=['GET'])
def get_supplier(supplierID):
    # get a cursor object from the database
    cursor = db.get_db().cursor()

    # use cursor to query the database for a list of products
    cursor.execute('SELECT * FROM animal_supplier WHERE supplierID={0}'.format(supplierID))

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

# Update the specified supplier in the database based on supplierID
# Expects input of payload with updated details
# Outputs success message if new supplier is successfully added 
@suppliers.route('/<supplierID>', methods=['PUT'])
def update_supplier(supplierID):
    
    # collecting data from the request object 
    the_data = request.json
    current_app.logger.info(the_data)

    query = 'UPDATE animal_supplier SET '

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
    if 'phone' in the_data:
        phone = the_data['phone']
        if phone is None:
            return jsonify({"message": "Error: phone is null"}), 400
        cursor.execute("SELECT * FROM animal_supplier WHERE phone = " +  '"' + phone + '"')
        existingInfo = cursor.fetchone()
        if existingInfo is not None:
            return "Error: phone is already registered"
        query += ('phone = "' + phone + '",')
    if 'email' in the_data:
        email = the_data['email']
        if email is None:
            return jsonify({"message": "Error: email is null"}), 400
        cursor.execute("SELECT * FROM animal_supplier WHERE email = " + '"' + email + '"')
        existingInfo = cursor.fetchone()
        if existingInfo is not None:
            return "Error: email is already registered"
        query += ('email = "' + email + '",')
    if 'company' in the_data:
        company = the_data['company']
        if company is None:
            return jsonify({"message": "Error: company is null"}), 400
        query += ('company = "' + company + '",')
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
    if 'country' in the_data:
        country = the_data['country']
        if country is None:
            return jsonify({"message": "Error: country is null"}), 400
        query += ('country = "' + country + '",')
    if 'contactLink' in the_data:
        contactLink = the_data['contactLink']
        if contactLink is None:
            return jsonify({"message": "Error: contactLink is null"}), 400
        query += ('contactLink = "' + contactLink + '",')
    if 'profileText' in the_data:
        profileText = the_data['profileText']
        if profileText is None:
            return jsonify({"message": "Error: profileText is null"}), 400
        query += ('profileText = "' + profileText + '",')
    if 'countSupplied' in the_data:
        countSupplied = the_data['countSupplied']
        if countSupplied is None:
            return jsonify({"message": "Error: countSupplied is null"}), 400
        query += ('countSupplied = ' + str(countSupplied) + ',')

    if query is 'UPDATE animal_supplier SET ':
        return jsonify({"message": "Error: no fields provided"}), 400
    #remove unnecessary comma    and    update the appropriate supplier by supplierID
    query = query[0:len(query) - 1] + " WHERE supplierID = {0}".format(supplierID)

    print(query)
    current_app.logger.info(query)

    # executing and committing the insert statement
    cursor.execute(query)
    db.get_db().commit()
    
    return jsonify({"message": "Success!"})

# Delete a specific supplier from the database based on its supplierID
# Expected input of supplierID
# Output success message when specific supplier is successfully deleted 
@suppliers.route('/<supplierID>', methods=['DELETE'])
def delete_supplier(supplierID):
    # get a cursor object from the database
    cursor = db.get_db().cursor()
    # use cursor to query the database for a list of suppliers
    cursor.execute('DELETE FROM animal_supplier WHERE supplierID={0}'.format(supplierID))
    db.get_db().commit()
    return jsonify({"message": "Success!"}) 

# Get a certain supplier from the database based on state
# Expected input of a state
# Output details of certain supplier based on inputted state
@suppliers.route('/state/<state>', methods=['GET'])
def get_supplier_by_state(state):
    # get a cursor object from the database
    cursor = db.get_db().cursor()

    # use cursor to query the database for a list of products
    cursor.execute('SELECT * FROM animal_supplier WHERE state={0}'.format(state))

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

# Get a certain suppliers contact link from the database based on ID
# Expected input of supplierID
# Output the contact link of a certain supplier based on supplierID
@suppliers.route('/<supplierID>/contact', methods=['GET'])
def get_supplier_contact_link(supplierID):
    # get a cursor object from the database
    cursor = db.get_db().cursor()

    # use cursor to query the database for the contact link
    cursor.execute('SELECT contactLink FROM animal_supplier WHERE supplierID={0}'.format(supplierID))

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