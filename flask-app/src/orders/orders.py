from datetime import date
from flask import Blueprint, request, jsonify, make_response, current_app
import json
from src import db


orders = Blueprint('orders', __name__)

# Get all the orders from the database
# Output array containing details of all orders
@orders.route('/', methods=['GET'])
def get_orders():
    # get a cursor object from the database
    cursor = db.get_db().cursor()

    # use cursor to query the database for a list of orders
    cursor.execute('SELECT * FROM `order`')

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

# Add a new order to the db
# Expects payload with details of the new order
# Outputs success message if new order is successfully added 
@orders.route('/', methods=['POST'])
def add_new_order():
    
    # collecting data from the request object 
    the_data = request.json
    current_app.logger.info(the_data)

    #extracting the variable
    if 'paymentAmount' not in the_data:
        return jsonify({"message": "Error: paymentAmount not provided"})
    if 'paymentMethod' not in the_data:
        return jsonify({"message": "Error: paymentMethod not provided"})
    if 'customerID' not in the_data:
        return jsonify({"message": "Error: customerID not provided"})
    
    paymentAmount = the_data['paymentAmount']
    paymentMethod = the_data['paymentMethod']
    customerID = the_data['customerID']

    if paymentAmount is None:
        return jsonify({"message": "Error: paymentAmount is null"}), 400
    if paymentMethod is None:
        return jsonify({"message": "Error: paymentMethod is null"}), 400
    if customerID is None:
        return jsonify({"message": "Error: customerID is null"}), 400

    # Constructing the query
    query = 'insert into `order` (orderDate, paymentAmount, paymentMethod, customerID) values ("'
    currDate = date.today()
    query += str(currDate) + '", "'
    query += (paymentAmount) + '", "'
    query += (paymentMethod) + '", '
    query += str(customerID) + ')'
    print(query)
    current_app.logger.info(query)

    # executing and committing the insert statement 
    cursor = db.get_db().cursor()
    cursor.execute(query)
    db.get_db().commit()
    
    return jsonify({"message": "Success!"})

# Get a certain order from the database based on ID
# Expects input of orderID
# Outputs details of a certain order
@orders.route('/<orderID>', methods=['GET'])
def get_order(orderID):
    # get a cursor object from the database
    cursor = db.get_db().cursor()

    cursor.execute('SELECT * FROM `order` WHERE orderID={0}'.format(orderID))

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

# Update the specified order in the database
# Expects payload with updated order details
# Outputs success message if order is successfully updated 
@orders.route('/<orderID>', methods=['PUT'])
def update_order(orderID):
    
    # collecting data from the request object 
    the_data = request.json
    current_app.logger.info(the_data)

    query = 'UPDATE `order` SET '

    #construct query
    if 'orderDate' in the_data:
        orderDate = the_data['orderDate']
        if orderDate is None:
            return jsonify({"message": "Error: orderDate is null"}), 400
        query += ('orderDate = "' + orderDate + '",')
    if 'paymentAmount' in the_data:
        paymentAmount = the_data['paymentAmount']
        if paymentAmount is None:
            return jsonify({"message": "Error: paymentAmount is null"}), 400
        query += ('paymentAmount = "' + paymentAmount + '",')
    if 'paymentMethod' in the_data:
        paymentMethod = the_data['paymentMethod']
        if paymentMethod is None:
            return jsonify({"message": "Error: paymentMethod is null"}), 400
        query += ('paymentMethod = "' + paymentMethod + '",')
    if 'customerID' in the_data:
        customerID = the_data['customerID']
        if customerID is None:
            return jsonify({"message": "Error: customerID is null"}), 400
        query += ('customerID = ' + str(customerID) + ',')

    if query is 'UPDATE `order` SET ':
        return jsonify({"message": "Error: no fields provided"}), 400
    
    #remove unnecessary comma and update the appropriate order by orderID
    query = query[0:len(query) - 1] + " WHERE orderID = {0}".format(orderID)

    print(query)
    current_app.logger.info(query)

    # executing and committing the insert statement 
    cursor = db.get_db().cursor()
    cursor.execute(query)
    db.get_db().commit()
    
    return jsonify({"message": "Success!"})

# Delete a specific order from the database
# Expects input of specific orderID
# Outputs success message if order is successfully deleted  
@orders.route('/<orderID>', methods=['DELETE'])
def delete_order(orderID):
    # get a cursor object from the database
    cursor = db.get_db().cursor()
    # use cursor to query the database for a list of products
    cursor.execute('DELETE FROM `order` WHERE orderID={0}'.format(orderID))
    db.get_db().commit()
    return jsonify({"message": "Success!"}) 

# Get all orders of a particular payment type
# Expects input of paymentMethod 
# Outputs details of all orders of a particular payment type
@orders.route('/customer/<paymentMethod>', methods=['GET'])
def get_all_orders_of_paymentMethod(paymentMethod):
    # get a cursor object from the database
    cursor = db.get_db().cursor()
    # use cursor to query the database for a list of products
    cursor.execute('SELECT * FROM `order` WHERE paymentMethod=' + '"' + format(paymentMethod) + '"')
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