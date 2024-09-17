from flask import Blueprint, request, jsonify, make_response
import json
from src import db

airports = Blueprint('airports', __name__)

# Get all airports from the DB
@airports.route('/airports', methods=['GET'])
def get_airports():
    cursor = db.get_db().cursor()
    cursor.execute('select * from Airport')
    json_data = []
    column_headers = [x[0] for x in cursor.description]
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(column_headers, row)))   
    return jsonify(json_data)

# Add new airport to the database
@airports.route('/airports', methods=['POST'])
def add_new_airport():
    data = request.json
    IATACode = data['airport_iata_code']
    name = data['airport_name']
    city = data['airport_city']
    state = data['airport_state']
    country = data['airport_country']
    cursor = db.get_db().cursor()
    cursor.execute('insert into Airport (IATAcode, name, city, state, country) values (%s, %s, %s, %s, %s)', 
                   (IATACode, name, city, state, country))
    db.get_db().commit()
    
    return 'Success!'

# get airport of a specific ID (IATA code)
@airports.route('/airports/<id>', methods=['GET'])
def get_airports_by_id(id):
    cursor = db.get_db().cursor()
    cursor.execute('SELECT * FROM Airport WHERE IATAcode = %s', (id,))
    json_data = []
    column_headers = [x[0] for x in cursor.description]
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(column_headers, row)))   
    return jsonify(json_data)

# Update info about the given airport
@airports.route('/airports/<id>', methods=['PUT'])
def update_airport(id):
    data = request.json
    name = data.get('airport_name')
    city = data.get('airport_city')
    state = data.get('airport_state')
    country = data.get('airport_country')

    if not name and not city and not state and not country:
        return 'No fields provided for update', 400

    # Construct the query
    query = 'UPDATE Airport SET'
    params = []

    if name:
        query += ' name = %s,'
        params.append(name)
    if city:
        query += ' city = %s,'
        params.append(city)
    if state:
        query += ' state = %s,'
        params.append(state)
    if country:
        query += ' country = %s,'
        params.append(country)

    query = query.rstrip(',') + ' WHERE IATAcode = %s'
    params.append(id)

    cursor = db.get_db().cursor()
    cursor.execute(query, tuple(params))
    db.get_db().commit()

    return 'Success!'

# Delete the given airport
@airports.route('/airports/<id>', methods=['DELETE'])
def delete_airport(id):
    cursor = db.get_db().cursor()
    cursor.execute('DELETE FROM Airport WHERE IATAcode = %s', (id,))
    db.get_db().commit()
    return 'Success!'