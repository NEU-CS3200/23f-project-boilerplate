from flask import Blueprint, request, jsonify, make_response, current_app
import json
from src import db

recycling_event = Blueprint('recycling_event', __name__)

# Get all recycling events from the DB
@recycling_event.route('/recycling-event', methods=['GET'])
def get_recycling_events():
    cursor = db.get_db().cursor()
    cursor.execute('SELECT EventID, Location, Date, Description FROM RecyclingEvent')

    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response

# gets the recycling events associated with the given user
@recycling_event.route('/recycling-event-user/<int:user_id>', methods=['GET'])
def get_user_recycling_event(user_id):
    cursor = db.get_db().cursor()
    cursor.execute('''
    SELECT RecyclingEvent.eventID, RecyclingEvent.location, RecyclingEvent.date, RecyclingEvent.description
    FROM RecyclingEvent JOIN EventParticipation ON EventParticipation.EventID = RecyclingEvent.EventID
    WHERE UserID = %s
    ''', (user_id,))
    column_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(column_headers, row)))
    return jsonify(json_data)

# creates a event participation for the given user
@recycling_event.route('/create-recycling-event/<int:user_id>', methods=['POST'])
def add_event_participation(user_id):

    # Collecting data from the request JSON
    data = request.get_json()
    current_app.logger.info(data)

    # Extracting variables from the data
    eventID = data['EventID']
    role = data['Role']

    # Constructing the SQL query
    query = '''
    INSERT INTO EventParticipation (UserID, EventID, role)
    VALUES (%s, %s, %s);
    '''

    # Executing and committing the insert statement
    cursor = db.get_db().cursor()
    cursor.execute(query, (user_id, eventID, role))
    db.get_db().commit()

    return jsonify({'success': 'Event participation posted successfully'}), 201


# updates event participation given a user id and participation
@recycling_event.route('/update-participation/<int:user_id>', methods=['PUT'])
def update_event_participation(user_id):
    participation_info = request.json

    if 'role' not in participation_info or 'event_id' not in participation_info:
        return jsonify({'error': 'both event id and role are required'}), 400
    
    role = participation_info['role']
    event_id = participation_info['event_id']

    query = '''
    UPDATE EventParticipation
    SET Role = %s
    WHERE UserID = %s && EventID = %s;
    '''
    cursor = db.get_db().cursor()
    r = cursor.execute(query, (role, user_id, event_id))
    db.get_db().commit()
    
    if r:
        return jsonify({'success': 'Participation updated successfully'}), 200
    else:
        return jsonify({'error': 'No records updated, check your event-id'}), 404

# unsubscribes this user from all events
@recycling_event.route('/remove-participation/<int:user_id>', methods=['DELETE'])
def remove_user_from_all_events(user_id):
    query = '''
    DELETE FROM EventParticipation
    WHERE UserID = %s;
    '''
    cursor = db.get_db().cursor()
    cursor.execute(query, (user_id,))
    db.get_db().commit()
    
    return jsonify({'success': 'Haha the sea turtles can die'}), 200

# unsubscribes this user from the given event
@recycling_event.route('/remove-event-participation/<int:user_id>', methods=['DELETE'])
def unsubscribe_from_event(user_id):
    event = request.json

    if 'event_id' not in event:
        return jsonify({'error': 'event id required'}), 400
    
    event_id = event['event_id']

    query = '''
    DELETE FROM EventParticipation
    WHERE EventID = %s AND UserID = %s;
    '''
    cursor = db.get_db().cursor()
    cursor.execute(query, (event_id, user_id))
    db.get_db().commit()
    
    return jsonify({'success': 'event removed successfully'}), 200
