
from flask import Blueprint, request, jsonify, make_response, current_app
import json
from src import db


moderators = Blueprint('moderators', __name__)

@moderators.route('/moderators/<empID>', methods=['PUT'])
def update_experience(empID):
    
    # collecting data from the request object 
    the_data = request.json
    current_app.logger.info(the_data)

    #extracting the variable
    empID = the_data['empID']
    experience = the_data['experience']
    # Constructing the query
    
    query = "update Moderators set experience = %s where empID = %s"
    data = (experience,empID)

    # executing and committing the insert statement 
    cursor = db.get_db().cursor()
    cursor.execute(query,data)
    db.get_db().commit()
    
    return 'Success!'

@moderators.route('moderators/<empID>',methods= ['DELETE'])
def delete_moderator(empID):
    the_data = request.json
    current_app.logger.info(the_data)

    query = 'delete from moderators where empID = {0}'.format(empID)
    cursor = db.get_db().cursor()
    cursor.execute(query)
    db.get_db().commit()
    
    return 'Success!'

def add_new_moderator():
    
    # collecting data from the request object 
    the_data = request.json
    current_app.logger.info(the_data)

    #extracting the variable
    modName = the_data['modName']
    experience = the_data['experience']
    empID = the_data['empID']
    

    # Constructing the query
    query = 'insert into moderators (modName,experience,empID) values ("'
    query += modName + '", "'
    query += experience + '", "'
    query += empID + ')'
    current_app.logger.info(query)

    # executing and committing the insert statement 
    cursor = db.get_db().cursor()
    cursor.execute(query)
    db.get_db().commit()
    
    return 'Success!'







