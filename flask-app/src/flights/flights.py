from flask import Blueprint, request, jsonify, make_response, current_app
import json
from src import db


flights = Blueprint('flights', __name__)

# Get all the flights from the database
@flights.route('/flights', methods=['GET'])
def get_flights():
    # get a cursor object from the database
    cursor = db.get_db().cursor()

    # use cursor to query the database for a list of products
    cursor.execute('SELECT flightID, seatsAvailable, airplaneID, airlineID, departureAirport, ' + 
                   'departureTime, departureTerminal, departureGate, arrivalAirport, arrivalTime, arrivalTerminal, arrivalGate FROM flight')

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

#Get a specific flight from the database
@flights.route('/flights/<id>', methods=['GET'])
def get_flight_details (id):

    query = 'SELECT flightID, seatsAvailable, airplaneID, airlineID, departureAirport, departureTime, departureTerminal, departureGate, arrivalAirport, arrivalTime, arrivalTerminal, arrivalGate FROM flight WHERE flightID = ' + str(id)
    current_app.logger.info(query)

    cursor = db.get_db().cursor()
    cursor.execute(query)
    column_headers = [x[0] for x in cursor.description]
    json_data = []
    the_data = cursor.fetchall()
    for row in the_data:
        json_data.append(dict(zip(column_headers, row)))
    return jsonify(json_data)

@flights.route('/flights', methods=['POST'])
def add_new_passenger():
    
    # collecting data from the request object 
    the_data = request.json
    current_app.logger.info(the_data)

    #extracting the variable
    flightID = the_data['flightID']
    seatsAvailable = the_data['seatsAvailable']
    airplaneID = the_data['airplaneID']
    airlineID = the_data['airlineID']
    departureAirport = the_data['departureAirport']
    departureTime = the_data['departureTime']
    departureTerminal = the_data['departureTerminal']
    departureGate = the_data['departureGate']
    arrivalAirport = the_data['arrivalAirport']
    arrivalTime = the_data['arrivalTime']
    arrivalTerminal = the_data['arrivalTerminal']
    arrivalGate = the_data['arrivalGate']

    # Constructing the query
    query = 'insert into flights (flightID, seatsAvailable, airplaneID, airlineID, departureAirport, departureTime, departureTerminal, departureGate, arrivalAirport, arrivalTime, arrivalTerminal, arrivalGate) values ("'
    query += flightID + '", "'
    query += seatsAvailable + '", "'
    query += airplaneID + '", '
    query += airlineID + '", '
    query += departureAirport + '", '
    query += departureTime + '", '
    query += departureTerminal + '", '
    query += departureGate + '", '
    query += arrivalAirport + '", '
    query += arrivalTime + '", '
    query += arrivalTerminal + '", '
    query += arrivalGate + '", '
    current_app.logger.info(query)

    # executing and committing the insert statement 
    cursor = db.get_db().cursor()
    cursor.execute(query)
    db.get_db().commit()
    
    return 'Success!'


# Deletes a given drink
# Also reduces the corresponding order's total price
@flights.route('/flights/<flightID>', methods=['DELETE'])
def delete_flight(flightID):
    query = '''
        DELETE
        FROM Flight
        WHERE flightID = {0};
    '''.format(flightID)
    #it associated 0 with the id somehow like in c++
    
    cursor = db.get_db().cursor()
    cursor.execute(query)
    
    db.get_db().commit()
    return "successfully deleted flight #{0}!".format(flightID)


@flights.route('/flights/<flightID>', methods=['PUT'])
def update_drink(flightID):
    
    the_data = request.json

#can i just not include the attrs i dont want to update???
    seatsAvailable = the_data['seatsAvailable']
    airplaneID = the_data['airplaneID']
    #airlineID = the_data['airlineID']
    #departureAirport = the_data['departureAirport']
    departureTime = the_data['departureTime']
    departureTerminal = the_data['departureTerminal']
    departureGate = the_data['departureGate']
    arrivalAirport = the_data['arrivalAirport']
    arrivalTime = the_data['arrivalTime']
    arrivalTerminal = the_data['arrivalTerminal']
    arrivalGate = the_data['arrivalGate']

    current_app.logger.info(the_data)

    the_query = 'UPDATE Drink SET '
    the_query += 'seatsAvailable = "' + seatsAvailable + '", '
    the_query += 'airplaneID = "' + airplaneID + '", '
    the_query += 'departureTerminal = "' + departureTerminal + '", '
    the_query += 'departureGate = "' + departureGate + '", '
    the_query += 'arrivalAirport = "' + arrivalAirport + '", '
    the_query += 'arrivalTime = "' + arrivalTime + '", '
    the_query += 'arrivalTerminal = "' + arrivalTerminal + '", '
    the_query += 'arrivalGate = "' + arrivalGate + '", '
    the_query += 'WHERE flightID = {0};'.format(flightID)

    current_app.logger.info(the_query)
    
    cursor = db.get_db().cursor()
    cursor.execute(the_query)
    db.get_db().commit()

    return "successfully editted flight #{0}!".format(flightID)