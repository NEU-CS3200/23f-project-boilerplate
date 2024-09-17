from flask import Blueprint, request, jsonify, make_response
import json
from src import db

bookings = Blueprint('bookings', __name__)

# Get all bookings
@bookings.route('/bookings', methods=['GET'])
def get_bookings():
    cursor = db.get_db().cursor()
    cursor.execute('select * from Booking')
    json_data = []
    column_headers = [x[0] for x in cursor.description]
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(column_headers, row)))   
    return jsonify(json_data)

# Get information for given booking ID
@bookings.route('/bookings/<booking_id>', methods=['GET'])
def get_booking_by_id(booking_id):
    cursor = db.get_db().cursor()
    cursor.execute('SELECT * FROM Booking WHERE bookingId = %s', (booking_id,))
    json_data = []
    column_headers = [x[0] for x in cursor.description]
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(column_headers, row)))   
    return jsonify(json_data)

# Add new booking for an existing passenger
# A passenger will need to be created in the DB before a booking can be made
@bookings.route('/bookings/passenger/<passenger_id>', methods=['POST'])
def create_booking_for_existing_passenger(passenger_id):
    data = request.json
    number_bags = data['number_bags']
    preferences = data['preferences']
    boarding_group = data['boarding_group']
    seat = data['seat']
    flight_id = data['flight_id']

    cursor = db.get_db().cursor()
    cursor.execute('insert into Booking (numberBags, preferences, boardingGroup, seat, flightId, passengerId) values (%s, %s, %s, %s, %s, %s)', 
                   (number_bags, preferences, boarding_group, seat, flight_id, passenger_id))
    db.get_db().commit()
    
    return 'Success!'

# Update info about the given booking
@bookings.route('/bookings/<booking_id>', methods=['PUT'])
def update_airport(booking_id):
    data = request.json
    number_bags = data['number_bags']
    preferences = data['preferences']
    boarding_group = data['boarding_group']
    seat = data['seat']
    flight_id = data['flight_id']
    passenger_id = data['passenger_id']

    if not number_bags and not preferences and not boarding_group and not seat and not flight_id and not passenger_id:
        return 'No fields provided for update', 400

    # Construct the query
    query = 'UPDATE Booking SET'
    params = []

    if number_bags:
        query += ' numberBags = %s,'
        params.append(number_bags)
    if preferences:
        query += ' preferences = %s,'
        params.append(preferences)
    if boarding_group:
        query += ' boardingGroup = %s,'
        params.append(boarding_group)
    if seat:
        query += ' seat = %s,'
        params.append(seat)
    if flight_id:
        query += ' flightId = %s,'
        params.append(flight_id)
    if passenger_id:
        query += ' passengerId = %s,'
        params.append(passenger_id)

    query = query.rstrip(',') + ' WHERE bookingId = %s'
    params.append(booking_id)

    cursor = db.get_db().cursor()
    cursor.execute(query, tuple(params))
    db.get_db().commit()

    return 'Success!'

# Delete the given airport
@bookings.route('/bookings/<booking_id>', methods=['DELETE'])
def delete_booking(booking_id):
    cursor = db.get_db().cursor()
    cursor.execute('DELETE FROM Booking WHERE bookingId = %s', (booking_id,))
    db.get_db().commit()
    return 'Success!'

# Get the flight information for given booking ID
@bookings.route('/bookings/<booking_id>/flight', methods=['GET'])
def get_flight_by_booking(booking_id):
    cursor = db.get_db().cursor()
    cursor.execute('SELECT * FROM Flight WHERE flightId = (SELECT flightId from Booking WHERE bookingId = %s)', (booking_id,))
    json_data = []
    column_headers = [x[0] for x in cursor.description]
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(column_headers, row)))   
    return jsonify(json_data)