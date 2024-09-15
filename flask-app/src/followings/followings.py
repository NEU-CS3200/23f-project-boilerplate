from flask import Blueprint, request, jsonify, make_response, current_app
import json
from src import db


Followings = Blueprint('Content_Creators', __name__)


@Followings.route('/Followings/<followerID>', methods=['GET'])
def get_followings (id):

    query = 'SELECT followerID FROM Followings ' + \
        'WHERE followeeID = ' + str(id)
    current_app.logger.info(query)

    cursor = db.get_db().cursor()
    cursor.execute(query)
    column_headers = [x[0] for x in cursor.description]
    json_data = []
    the_data = cursor.fetchall()
    for row in the_data:
        json_data.append(dict(zip(column_headers, row)))
    return jsonify(json_data)
    

@Followings.route('/Followings/<id>', methods=['GET'])
def get_following_size (id):

    query = 'SELECT COUNT(followerID) FROM Followings ' + \
        'WHERE followeeID = ' + str(id)
    current_app.logger.info(query)

    cursor = db.get_db().cursor()
    cursor.execute(query)
    column_headers = [x[0] for x in cursor.description]
    json_data = []
    the_data = cursor.fetchall()
    for row in the_data:
        json_data.append(dict(zip(column_headers, row)))
    return jsonify(json_data)

@Followings.route('/Folowings/<id>', methods=['GET'])
def get_followees (id):

    query = 'SELECT followeeID FROM Followings ' + \
        'WHERE followerID = ' + str(id)
    current_app.logger.info(query)

    cursor = db.get_db().cursor()
    cursor.execute(query)
    column_headers = [x[0] for x in cursor.description]
    json_data = []
    the_data = cursor.fetchall()
    for row in the_data:
        json_data.append(dict(zip(column_headers, row)))
    return jsonify(json_data)

@followings.route('/followingsInfo/<followerID>', methods=['GET'])
def get_followees_info(followerID):

    query = 'SELECT u.firstName, u.lastName, cc.bio, g.genreName ' + \
        'FROM Content_Creators cc JOIN Genres g ON cc.genreID = g.genreID ' + \
	    'JOIN Followings f ON f.followerID = cc.userID ' + \
        'JOIN Users u ON cc.userID = u.userID WHERE f.followerID = ' + str(followerID)
    current_app.logger.info(query)

    cursor = db.get_db().cursor()
    cursor.execute(query)
    column_headers = [x[0] for x in cursor.description]
    json_data = []
    the_data = cursor.fetchall()
    for row in the_data:
        json_data.append(dict(zip(column_headers, row)))
    return jsonify(json_data)


@Followings.route('/Content_Creators', methods=['POST'])
def add_following():
    
    # collecting data from the request object 
    the_data = request.json
    current_app.logger.info(the_data)

    #extracting the variable
    follower = the_data['followerID']
    followee = the_data['followeeID']

    # Constructing the query
    query = 'INSERT into Followings (followerID, followeeID) values ("'
    query += str(follower) + '", "'
    query += str(followee) + ')'
    current_app.logger.info(query)

    # executing and committing the insert statement 
    cursor = db.get_db().cursor()
    cursor.execute(query)
    db.get_db().commit()
    
    return 'Success!'

@Followings.route('/Content_Creators/<creatorID>', methods=['DELETE'])
def delete_creator (followerID, followeeID):

    query = 'DELETE FROM Content_Creators ' + \
        'WHERE followerID = ' + str(followerID) + 'AND followeeID = ' + \
        str(followeeID)
    current_app.logger.info(query)

    cursor = db.get_db().cursor()
    cursor.execute(query)
    db.get_db().commit()
    
    return 'Success!'