from datetime import date
from flask import Blueprint, request, jsonify, make_response, current_app
import json
from src import db


guides = Blueprint('guides', __name__)

# Get all the guides from the database
# Outputs array containing details of all guides
@guides.route('/', methods=['GET'])
def get_guides():
    # get a cursor object from the database
    cursor = db.get_db().cursor()

    # use cursor to query the database for a list of guides
    cursor.execute('SELECT * FROM guides')

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

# Add a new guides to the db
# Expects payload of details of new guide
# Return success message if new guide is successfully added 
@guides.route('/', methods=['POST'])
def add_new_guides():
    
    # collecting data from the request object 
    the_data = request.json
    current_app.logger.info(the_data)

    #extracting the variable
    if 'title' not in the_data:
        return jsonify({"message": "Error: title not provided"})
    if 'guideText' not in the_data:
        return jsonify({"message": "Error: reviewText not provided"})
    
    title = the_data['title']
    guideText = the_data['guideText']

    if title is None:
        return jsonify({"message": "Error: title is null"}), 400
    if guideText is None:
        return jsonify({"message": "Error: guideText is null"}), 400

    # Constructing the query
    query = 'insert into guides (title, guideText, dateCreated) values ("'
    query += (title) + '", "'
    query += (guideText) + '",'
    currDate = date.today()
    query += ('"' + str(currDate) + '")')
    current_app.logger.info(query)

    # executing and committing the insert statement 
    cursor = db.get_db().cursor()
    cursor.execute(query)
    db.get_db().commit()
    
    return jsonify({"message": "Success!"})

# Get a certain guide from the database based on ID
# Expects input of guideID
# Outputs details of a specific guide
@guides.route('/<guideID>', methods=['GET'])
def get_guide(guideID):
    
    # get a cursor object from the database
    cursor = db.get_db().cursor()

    cursor.execute('SELECT * FROM guides WHERE guideID={0}'.format(guideID))

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

# Update the specified guide in the database
# Expects payload of guide updated details
# Outputs success message if guide is successfully updated
@guides.route('/<guideID>', methods=['PUT'])
def update_guide(guideID):
    
    # collecting data from the request object 
    the_data = request.json
    current_app.logger.info(the_data)

    query = 'UPDATE guides SET '

    #construct query
    if 'title' in the_data:
        title = the_data['title']
        if title is None:
            return jsonify({"message": "Error: title is null"}), 400
        query += ('title = "' + title + '",')
    if 'guideText' in the_data:
        guideText = the_data['guideText']
        if guideText is None:
            return jsonify({"message": "Error: guideText is null"}), 400
        query += ('guideText = "' + guideText + '",')
    
    if query is 'UPDATE guides SET ':
        return jsonify({"message": "Error: no fields provided"}), 400
    
    #remove unnecessary comma and update the appropriate order by guideID
    query = query[0:len(query) - 1] + " WHERE guideID = {0}".format(guideID)

    print(query)
    current_app.logger.info(query)

    # executing and committing the insert statement 
    cursor = db.get_db().cursor()
    cursor.execute(query)
    db.get_db().commit()
    
    return jsonify({"message": "Success!"})

# Delete a specific guide from the database
# Expects input of guideID
# Outputs success message if customer is successfully deleted
@guides.route('/<guideID>', methods=['DELETE'])
def delete_guide(guideID):
    # get a cursor object from the database
    cursor = db.get_db().cursor()
    # use cursor to query the database for a list of guides
    cursor.execute('DELETE FROM guides WHERE guideID={0}'.format(guideID))
    db.get_db().commit()
    return jsonify({"message": "Success!"}) 

# Delete all guides created earlier than the specified datetime from the database
# Expects input of datetime
# Outputs success message if guides are successfully deleted
@guides.route('/created/<datetime>', methods=['DELETE'])
def delete_guide_by_datetime(datetime):
    # get a cursor object from the database
    cursor = db.get_db().cursor()
    # use cursor to query the database for a list of guides
    cursor.execute('DELETE FROM guides WHERE dateCreated < "{0}"'.format(datetime))
    db.get_db().commit()
    return jsonify({"message": "Success!"}) 