from flask import Blueprint, request, jsonify, make_response, current_app
import json
from src import db


content_creators = Blueprint('content_creators', __name__)

# Get all the content creators from the database
@content_creators.route('/content_creators', methods=['GET'])
def get_creators():
    # get a cursor object from the database
    cursor = db.get_db().cursor()

    # use cursor to query the database for a list of products
    cursor.execute('SELECT creatorID, bio, earnings, genreID FROM Content_Creators')

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

@content_creators.route('/content_creators_details/<creatorID>', methods=['GET'])
def get_creator_details (creatorID):

    query = 'SELECT creatorID, bio, earnings, genreID FROM Content_Creators ' + \
        'WHERE creatorID = ' + str(creatorID)
    current_app.logger.info(query)

    cursor = db.get_db().cursor()
    cursor.execute(query)
    column_headers = [x[0] for x in cursor.description]
    json_data = []
    the_data = cursor.fetchall()
    for row in the_data:
        json_data.append(dict(zip(column_headers, row)))
    return jsonify(json_data)
    

@content_creators.route('/content_creators_earnings/<creatorID>', methods=['GET'])
def get_creator_earnings (creatorID):

    query = 'SELECT creatorID, earnings FROM Content_Creators ' + \
        'WHERE creatorID = ' + str(creatorID)
    current_app.logger.info(query)

    cursor = db.get_db().cursor()
    cursor.execute(query)
    column_headers = [x[0] for x in cursor.description]
    json_data = []
    the_data = cursor.fetchall()
    for row in the_data:
        json_data.append(dict(zip(column_headers, row)))
    return jsonify(json_data)

@content_creators.route('/content_creators_earnings/<creatorID>', methods=['PUT'])
def update_creator_earnings(creatorID):
    
    # collecting data from the request object 
    the_data = request.json
    current_app.logger.info(the_data)

    #extracting the variable
    new_earnings = the_data['earnings']

    # Constructing the query
    query = 'UPDATE Content_Creators SET earnings = ' + str(new_earnings) + \
        ' WHERE creatorID = ' + str(creatorID)
    current_app.logger.info(query)

    # executing and committing the insert statement 
    cursor = db.get_db().cursor()
    cursor.execute(query)
    db.get_db().commit()
    
    return 'Success!'

@content_creators.route('/content_creators_bio/<creatorID>', methods=['PUT'])
def update_creator_bio(creatorID):
    
    # collecting data from the request object 
    the_data = request.json
    current_app.logger.info(the_data)

    #extracting the variable
    new_bio = the_data['bio']
    #creatorID = the_data['creatorID']

    # Constructing the query
    query = 'UPDATE Content_Creators SET bio = "' + new_bio + \
        '" WHERE creatorID = ' + str(creatorID)
    current_app.logger.info(query)

    # executing and committing the insert statement 
    cursor = db.get_db().cursor()
    cursor.execute(query)
    db.get_db().commit()
    
    return 'Success!'


@content_creators.route('/content_creators/<creatorID>', methods=['PUT'])
def update_creator(creatorID):
    
    # collecting data from the request object 
    the_data = request.json
    current_app.logger.info(the_data)

    #extracting the variable
    bio = the_data['bio'],
    earnings = the_data['earnings'],
    gid = the_data['genreID']

    # Constructing the query
    query = 'UPDATE Content_Creators SET bio = ' + str(bio) + \
        ', earnings = ' + earnings + \
        ', genreID = ' + str(gid) + \
        ' WHERE creatorID = ' + str(creatorID)
    current_app.logger.info(query)

    # executing and committing the insert statement 
    cursor = db.get_db().cursor()
    cursor.execute(query)
    db.get_db().commit()
    
    return 'Success!'

@content_creators.route('/content_creators', methods=['POST'])
def add_creator():
    
    # collecting data from the request object 
    the_data = request.json
    current_app.logger.info(the_data)

    #extracting the variable
    uid = the_data['userID']
    cid = the_data['creatorId']
    bio = the_data['bio'],
    earnings = the_data['earnings'],
    gid = the_data['genreID']

    # Constructing the query
    query = 'INSERT into Content_Creators (userID, creatorID, bio, earnings, genreID) values ('
    query += str(uid) + ', '
    query += str(cid) + ', "'
    query += bio + '", '
    query += earnings + ', '
    query += str(gid) + ')'
    current_app.logger.info(query)

    # executing and committing the insert statement 
    cursor = db.get_db().cursor()
    cursor.execute(query)
    db.get_db().commit()
    
    return 'Success!'

@content_creators.route('/content_creators/<creatorID>', methods=['DELETE'])
def delete_creator (creatorID):

    query = 'DELETE FROM Content_Creators ' + \
        'WHERE creatorID = ' + str(creatorID)
    current_app.logger.info(query)

    cursor = db.get_db().cursor()
    cursor.execute(query)
    db.get_db().commit()
    
    return 'Success!'