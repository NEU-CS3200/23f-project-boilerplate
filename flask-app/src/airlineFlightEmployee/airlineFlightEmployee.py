from flask import Blueprint, request, jsonify, make_response, current_app
import json
from src import db


airlineFlightEmployees = Blueprint('airlineFlightEmployees', __name__)

# Get all the products from the database
@airlineFlightEmployees.route('/airlineFlightEmployees', methods=['GET'])
def get_airlineFlightEmployees():
    # get a cursor object from the database
    cursor = db.get_db().cursor()

    # use cursor to query the database for a list of airport employees
    cursor.execute('SELECT employeeID, fName, lName, salary, title, sex, emailAddress, birthDate FROM airlineFlightEmployee')

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

# Get a specific airlineFlightEmployee from the database
@airlineFlightEmployees.route('/airlineFlightEmployees/<id>', methods=['GET'])
def get_airline_flight_employee (id):
    query = 'SELECT employeeID, fName, lName, salary, title, sex, emailAddress, birthDate FROM airlineFlightEmployee WHERE employeeID = ' + str(id)
    current_app.logger.info(query)

    cursor = db.get_db().cursor()
    cursor.execute(query)
    column_headers = [x[0] for x in cursor.description]
    json_data = []
    the_data = cursor.fetchall()
    for row in the_data:
        json_data.append(dict(zip(column_headers, row)))
    return jsonify(json_data)

# Adds a new airlineFlightEmployee
@airlineFlightEmployees.route('/airlineFlightEmployees', methods=['POST'])
def add_new_airline_flight_employee():
    
    # collecting data from the request object 
    the_data = request.json
    current_app.logger.info(the_data)

    #extracting the variable
    employeeID = the_data['employeeID']
    fName = the_data['fName']
    lName = the_data['lName']
    salary = the_data['salary']
    title = the_data['title']
    sex = the_data['sex']
    emailAddress = the_data['emailAddress']
    birthDate = the_data['birthDate']

    # Constructing the query
    query = 'insert into airlineFlightEmployees (employeeID, fName, lName, salary, title, sex, emailAddress, birthDate) values ("'
    query += employeeID + '", "'
    query += fName + '", "'
    query += lName + '", '
    query += salary + '", '
    query += title + '", '
    query += sex + '", '
    query += emailAddress + '", '
    query += birthDate + '", '
    current_app.logger.info(query)

    # executing and committing the insert statement 
    cursor = db.get_db().cursor()
    cursor.execute(query)
    db.get_db().commit()
    
    return 'Success!'

# # Changes size, price, sugar level, and/or ice level of a drink in a given order
# @airlineFlightEmployees.route('/editEmployee/<employeeID>', methods=['PUT'])
# def update_airline_Flight_Employee(employeeID):
    
#     the_data = request.json

#     size = the_data['Size']
#     sugar_lvl = the_data['SugarLevel']
#     ice_lvl = the_data['IceLevel']
#     price = the_data['Price']
    
#     # grab order_id and previous drink price for the given drink
#     employeeInfo = get_airline_flight_employee(employeeID)
    
#     orderID = str(drinkInfo['order_id'])
#     prev_price = str(drinkInfo['price'])
    
#     # calculate price change (if any)
#     price_change = float(price) - float(prev_price)
    
#     # update order total price
#     order_query = 'UPDATE `Order` SET total_price = total_price + ' + str(price_change) + ' WHERE order_id = ' + str(orderID) + ';'

#     current_app.logger.info(the_data)

#     the_query = 'UPDATE Drink SET '
#     the_query += 'size = "' + size + '", '
#     the_query += 'sugar_lvl = "' + sugar_lvl + '", '
#     the_query += 'ice_lvl = "' + ice_lvl + '", '
#     the_query += 'price = ' + str(price) + ' '
#     the_query += 'WHERE drink_id = {0};'.format(drinkID)

#     current_app.logger.info(the_query)
    
#     cursor = db.get_db().cursor()
#     cursor.execute(the_query)
#     cursor.execute(order_query)
#     db.get_db().commit()

#     return "successfully editted drink #{0}!".format(drinkID)