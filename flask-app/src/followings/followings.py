from flask import Blueprint, request, jsonify, make_response, current_app
import json
from src import db


followings = Blueprint('followings', __name__)


@followings.route('/followings/<followeeID>', methods=['GET'])
def get_followings (followeeID):

    query = 'SELECT followerID FROM Followings ' + \
        'WHERE followeeID = ' + str(followeeID)
    current_app.logger.info(query)

    cursor = db.get_db().cursor()
    cursor.execute(query)
    column_headers = [x[0] for x in cursor.description]
    json_data = []
    the_data = cursor.fetchall()
    for row in the_data:
        json_data.append(dict(zip(column_headers, row)))
    return jsonify(json_data)
    

@followings.route('/followingSize/<CreatorID>', methods=['GET'])
def get_following_size(CreatorID):
    
    # collecting data from the request object 
    #the_data = request.json
    #current_app.logger.info(the_data)

    #extracting the variable
    followeeID = CreatorID

    query = 'SELECT COUNT(followerID) FROM Followings WHERE followeeID = ' + str(followeeID)
    current_app.logger.info(query)

    cursor = db.get_db().cursor()
    cursor.execute(query)
    count = cursor.fetchone()[0]  # Fetch the count value directly
    return str(count)

@followings.route('/followings/<followerID>', methods=['GET'])
def get_followees(followerID):

    query = 'SELECT followeeID FROM Followings ' + \
        'WHERE followerID = ' + str(followerID)
    current_app.logger.info(query)

    cursor = db.get_db().cursor()
    cursor.execute(query)
    column_headers = [x[0] for x in cursor.description]
    json_data = []
    the_data = cursor.fetchall()
    for row in the_data:
        json_data.append(dict(zip(column_headers, row)))
    return jsonify(json_data)


@followings.route('/followers', methods=['POST'])
def add_following():
    
    # collecting data from the request object 
    the_data = request.json
    current_app.logger.info(the_data)

    #extracting the variable
    follower = the_data['followerID']
    followee = the_data['followeeID']

    # Constructing the query
    query = 'INSERT into Followings (followerID, followeeID) values ('
    query += str(follower) + ', '
    query += str(followee) + ')'
    current_app.logger.info(query)

    # executing and committing the insert statement 
    cursor = db.get_db().cursor()
    cursor.execute(query)
    db.get_db().commit()
    
    return 'Success!'