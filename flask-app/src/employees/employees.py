
from flask import Blueprint, request, jsonify, make_response, current_app
import json
from src import db


employees = Blueprint('employees', __name__)

@employees.route('/employees', methods=['GET'])
def get_employees():
    cursor = db.get_db().cursor()
    cursor.execute('select * from employees')
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response


@employees.route('/employees', methods=['POST'])
def add_new_employee():
    
    # collecting data from the request object 
    the_data = request.json
    current_app.logger.info(the_data)

    #extracting the variable
    firstname = the_data['firstName']
    lastname = the_data['lastName']
    phone = the_data['phone']
    email = the_data['email']
    address = the_data['address']
    title = the_data['title']
    hireDate = the_data['hireDate']
    salary = the_data['salary']
    active = the_data['active']
    empID = the_data['empID']
    

    # Constructing the query
    query = 'insert into products (firstname,lastname,phone,email,address,title,hiredate,salary,active,empID) values ("'
    query += firstname + '", "'
    query += lastname + '", "'
    query += phone + '", "'
    query += email + '", "'
    query += address + '", "'
    query += title + '", "'
    query += hireDate + '", "'
    query += salary + '", "'
    query += active + '", "'
    query += empID + ')'
    current_app.logger.info(query)

    # executing and committing the insert statement 
    cursor = db.get_db().cursor()
    cursor.execute(query)
    db.get_db().commit()
    
    return 'Success!'

@employees.route('/employees/<empID>', methods=['GET'])
def get_employee(empID):
    cursor = db.get_db().cursor()
    cursor.execute('select empID,salary from employees where empID = {0}'.format(empID))
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response

@employees.route('employees/<empID>',methods= ['DELETE'])
def delete_employee(empID):
    the_data = request.json
    current_app.logger.info(the_data)

    query = 'delete from employees where empID = {0}'.format(empID)
    cursor = db.get_db().cursor()
    cursor.execute(query)
    db.get_db().commit()
    
    return 'Success!'

@employees.route('/employees', methods=['PUT'])
def update_salary():
    
    # collecting data from the request object 
    the_data = request.json
    current_app.logger.info(the_data)

    #extracting the variable
    empID = the_data['empID']
    salary = the_data['salary']
    # Constructing the query
    
    query = "update employees set salary = %s where empID = %s"
    data = (salary,empID)

    # executing and committing the insert statement 
    cursor = db.get_db().cursor()
    cursor.execute(query,data)
    db.get_db().commit()
    
    return 'Success!'
