from flask import Blueprint, request, jsonify, make_response
import json
from src import db

Flight = Blueprint('flight', __name__)

#Get all customers from the DB
@Flight.route('/flights/passenger', methods=['GET'])
def get_flights_passenger():
    cursor = db.get_db().cursor()
    cursor.execute('select flightId, status, duration, destinationGate, destinationAirport, originGate, originAirport, takeOffTime, landingTime, aircraft')
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response

@Flight.route('/flights/crew', methods=['GET'])
def get_flights_crew():
    cursor = db.get_db().cursor()
    cursor.execute('select flightId, status, duration, destinationGate, destinationAirport, originGate, originAirport, takeOffTime,\
                   landingTime, aircraft, managerID from Flight')
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response

# Get flight detail for flight with particular flightID
@Flight.route('/customers/passsenger/<flightId>', methods=['GET'])
def get_flight_passenger(flightId):
    cursor = db.get_db().cursor()
    cursor.execute('select flightId, status, duration, destinationGate, destinationAirport, originGate, originAirport, takeOffTime,\
                   landingTime, aircraft from Flight where flightId = {0}'.format(flightId))
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response

# Get flight detail for flight with particular flightID
@Flight.route('/customers/crew/<flightId>', methods=['GET'])
def get_flight_crew(flightId):
    cursor = db.get_db().cursor()
    cursor.execute('select * from Flight where flightId = {0}'.format(flightId))
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response