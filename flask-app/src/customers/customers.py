from flask import Blueprint, request, jsonify, make_response, current_app
import json
from src import db


customers = Blueprint('customers', __name__)

# --------------
#ENDPOINT 13
# Get an invite of invite id for a customer with customer id
@customers.route('/customers/<customer_id>/<invite_id>', methods=['GET'])
def get_customer_and_invite():
    # get a cursor object from the database
    cursor = db.get_db().cursor()

    #query
    query = '''
            SELECT c.first_name, c.last_name, customer_id, i.invite_id, i.description
            FROM Customer c JOIN Invites i ON c.customer_id = i.customer_id
        '''

    # use cursor to query the database for a list of products
    cursor.execute(query)

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

# add invite for a customer 
@customers.route('/customers/<customer_id>/<invite_id>', methods=['POST'])
def add_invite_for_customer(customer_id):
    # Get data from the request object
    the_data = request.json

    # Extracting variables
    invite_id = the_data.get('invite_id')
    description = the_data.get('description')

    # Validation checks
    if not invite_id or not description:
        return 'Bad Request: Missing or empty "invite_id" or "message" in the request body', 400

    # Get a cursor object from the database
    cursor = db.get_db().cursor()

    # Construct the query to add an invite for the customer
    query = '''
            INSERT INTO invites (customer_id, invite_id, description)
            VALUES (%s, %s, %s)
        '''
    values = (customer_id, invite_id, description)
    current_app.logger.info(query % values)

    # Executing and committing the delete statement 
    cursor = db.get_db().cursor()
    cursor.execute(query, values)
    db.get_db().commit()

    return 'Invite added successfully!'

# --------------
#ENDPOINT 14
# Get ranking for a customer endpoint
@customers.route('/customers/<customer_id>/ranking', methods=['GET'])
def get_customer_ranking(customer_id):
    # Get a cursor object from the database
    cursor = db.get_db().cursor()

    # Construct the query to get the ranking of the customer
    query = '''
            SELECT RANK as ranking
            FROM customer_points
            WHERE customer_id = %s
        '''

    # use cursor to query the database for a list of products
    cursor.execute(query, (customer_id,))

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

# add ranking for a customer 
@customers.route('/customers/<customer_id>/ranking', methods=['POST'])
def add_ranking_for_customer(customer_id):
    # Get data from the request object
    the_data = request.json

    # Extracting variable
    rank = the_data.get('rank')

    # Validation checks
    if not rank:
        return 'Bad Request: Missing or empty "rank" in the request body', 400

    # Get a cursor object from the database
    cursor = db.get_db().cursor()

    # Construct the query to add an invite for the customer
    query = '''
            UPDATE customers
            SET rank = %s
            WHERE customer_id = %s
        '''
    values = (rank, customer_id)
    current_app.logger.info(query % values)

    # Executing and committing the delete statement 
    cursor = db.get_db().cursor()
    cursor.execute(query, values)
    db.get_db().commit()

    return 'Customer ranking added successfully!'

# update ranking for a customer
@customers.route('/customers/<customer_id>/ranking', methods=['PUT'])
def update_ranking_for_customer(customer_id):
    
    # collecting data from the request object 
    the_data = request.json
    current_app.logger.info(the_data)

    #extracting the variable
    new_rank = the_data.get('rank')

    if new_rank is None:
        return 'Bad Request: Missing or empty "new_rank" in the request body', 400

    # Get a cursor object from the database
    cursor = db.get_db().cursor()

    # Prepare the UPDATE query with parameterized inputs
    query = '''
            UPDATE customers
            SET rank = %s
            WHERE customer_id = %s
        '''
    values = (new_rank, customer_id)

    # executing and committing the update statement 
    cursor = db.get_db().cursor()
    cursor.execute(query, values)
    db.get_db().commit()
    
    return 'Success!'

# Delete a ranking for a customer
@customers.route('/customers/<customer_id>/ranking', methods=['DELETE'])
def delete_ranking_for_customer(customer_id):
    # Collecting data from the request object 
    the_data = request.json
    current_app.logger.info(the_data)

    # Constructing the query with parameterized query
    query = '''
            UPDATE customers
            SET rank = NULL
            WHERE customer_id = %s
        '''
    values = (customer_id)
    current_app.logger.info(query % values)

    # Executing and committing the delete statement 
    cursor = db.get_db().cursor()
    cursor.execute(query, values)
    db.get_db().commit()

    return 'Customer ranking deleted successfully!'

# --------------
#ENDPOINT 15
# Get ranked customers endpoint
@customers.route('/customers/ranks', methods=['GET'])
def get_ranked_customers():
    # Get a cursor object from the database
    cursor = db.get_db().cursor()

    # Construct the query to get ranked customers
    query = '''
            SELECT customer_id, first_name, last_name, rank
            FROM customers
            WHERE rank IS NOT NULL
            ORDER BY rank ASC
        '''

    # Use cursor to execute the query
    cursor.execute(query)

    # Grab the column headers from the returned data
    column_headers = [x[0] for x in cursor.description]

    # Create a list of dictionaries for the response
    json_data = []
    
    # Fetch all the data from the cursor
    the_data = cursor.fetchall()

    # For each of the rows, zip the data elements together with the column headers
    for row in the_data:
        json_data.append(dict(zip(column_headers, row)))

    # Close the cursor after fetching data
    cursor.close()

    return jsonify(json_data)

# Get all customers from the DB
@customers.route('/customers', methods=['GET'])
def get_customers():
    cursor = db.get_db().cursor()
    query = '''
            SELECT customer_id, first_name, last_name, rank
            FROM customers
        '''
    # use cursor to query the database for a list of products
    cursor.execute(query)

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

# Add a new customer endpoint
@customers.route('/customers', methods=['POST'])
def add_customer():
    # Get data from the request object
    the_data = request.json

    # Extracting variables
    first_name = the_data.get('first_name')
    last_name = the_data.get('last_name')
    customer_id = the_data.get('customer_id')
    rank = the_data.get('rank')

    # Validation checks
    if first_name is None or last_name is None:
        return 'Bad Request: Missing or empty "first_name" or "last_name" or "customer_id" or "rank" in the request body', 400

    # Get a cursor object from the database
    cursor = db.get_db().cursor()

    # Construct the query to add a new customer
    query = '''
            INSERT INTO customers (first_name, last_name, customer_id, rank)
            VALUES (%s, %s, %s, %s)
        '''

    # Use cursor to execute the query
    cursor.execute(query, (first_name, last_name, customer_id, rank))

    # Commit the changes to the database
    db.get_db().commit()

    # Close the cursor after executing the query
    cursor.close()

    return 'Customer added successfully!'

# Get a specific customer
@customers.route('/customers/<userID>', methods=['GET'])
def get_customer(userID):
    cursor = db.get_db().cursor()
    query = '''
            SELECT * from Customers 
            WHERE id = %s
        '''

    # use cursor to query the database for a list of products
    cursor.execute(query, (userID,))

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

# Update a customer endpoint
@customers.route('/customers/<customer_id>', methods=['PUT'])
def update_customer(customer_id):
    # Get data from the request object
    the_data = request.json

    # Extracting variables
    first_name = the_data.get('first_name')
    last_name = the_data.get('last_name')
    rank = the_data.get('rank')

    # Validation checks
    if first_name is None and last_name is None and rank is None:
        return 'Bad Request: No valid data provided for update', 400

    # Get a cursor object from the database
    cursor = db.get_db().cursor()

    # Construct the query to update a customer
    query = '''
            UPDATE customers
            SET first_name = %s
                last_name = %s
                rank = %s
            WHERE customer_id = %s
        '''
    values = (first_name, last_name, rank, customer_id)

    # Use cursor to execute the query
    cursor.execute(query, values)

    # Commit the changes to the database
    db.get_db().commit()

    # Close the cursor after executing the query
    cursor.close()

    return 'Customer updated successfully!'

# Delete a customer endpoint
@customers.route('/customers/<customer_id>', methods=['DELETE'])
def delete_customer(customer_id):
    # Get a cursor object from the database
    cursor = db.get_db().cursor()

    # Construct the query to delete a customer
    query = '''
            DELETE FROM customers
            WHERE customer_id = %s
        '''
    values = (customer_id,)

    # Use cursor to execute the query
    cursor.execute(query, values)

    # Commit the changes to the database
    db.get_db().commit()

    # Close the cursor after executing the query
    cursor.close()

    return 'Customer deleted successfully!'
