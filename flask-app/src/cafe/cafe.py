from flask import Blueprint, request, jsonify, make_response, current_app
import json
from src import db


cafe = Blueprint('cafe', __name__)

# Get all the cafes from the database
@cafe.route('/cafe', methods=['GET'])
def get_cafes():
    # get a cursor object from the database
    cursor = db.get_db().cursor()

    #query
    query = '''
            SELECT name, street, city, state, zip, Ratings.price 
            FROM Cafe c JOIN Ratings r ON c.cafe_id = r.cafe_id
        '''

    # use cursor to query the database for a list of products
    cursor.execute(query)

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

# --------------
#ENDPOINT 4
# Get all the cafes with outlets from the database
@cafe.route('/cafe/outlets', methods=['GET'])
def get_cafes_outlets():
    # get a cursor object from the database
    cursor = db.get_db().cursor()

    # use cursor to query the database for a list of products
    cursor.execute('''
                    SELECT name, street, city, state, zip, Ratings.price
                    FROM Cafe c JOIN Ratings r ON c.cafe_id = r.cafe_id
                    WHERE has_outlets = 1
                ''')

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

# Add a cafe with outlets to the list of cafes with outlets
@cafe.route('/cafe', methods=['POST'])
def add_new_outlet_cafe(): 
    
    # collecting data from the request object 
    the_data = request.json
    current_app.logger.info(the_data)

    #extracting the variable
    owner = the_data['owner_id']
    time = the_data['time']
    days = the_data['days']
    website = the_data['website_link']
    name = the_data['name']
    street = the_data['street']
    city = the_data['city']
    state = the_data['state']
    zip = the_data['zip']
    price = the_data['price']
    wifi = the_data['has_wifi']
    outlets = 1
    id = the_data['cafe_id']

    # Constructing the query
    query = 'INSERT INTO Cafe (owner_id, time, days, website_link, name, street, city, state, zip, price, has_wifi, has_outlets, cafe_id) VALUES ("'
    query += int(owner) + '", "'
    query += time + '", "'
    query += days + '", "'
    query += website + '", '
    query += name + '", '
    query += street + '", '
    query += city + '", '
    query += state + '", '
    query += zip + '", '
    query += price + '", '
    query += wifi + '", '
    query += outlets + '", '
    query += id + ')'
    current_app.logger.info(query)

    # executing and committing the insert statement 
    cursor = db.get_db().cursor()
    cursor.execute(query)
    db.get_db().commit()
    
    return 'Success!'

# --------------
# ENDPOINT 5 
# Get all the info from a particular cafe in the database
@cafe.route('/cafe/<cafe_id>', methods=['GET'])
def get_cafe_detail(cafe_id):
    # get a cursor object from the database
    cursor = db.get_db().cursor()

    #query the database for cafe details
    query = ('''
            SELECT * 
            FROM Cafe c JOIN Ratings r ON c.cafe_id = r.cafe_id JOIN Reviews re ON c.cafe_id = re.cafe_id 
            WHERE id = ''' + str(id))
    cursor.execute(query)
    column_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(column_headers, row)))
    return jsonify(json_data)

# Get the hours of a particular cafe
@cafe.route('/cafe/<cafe_id>/hours', methods=['GET'])
def get_cafe_hours(cafe_id):
    # get a cursor object from the database
    cursor = db.get_db().cursor()

    #query the database for cafe details
    query = ('''
            SELECT name, hours, days 
            FROM Cafe
            WHERE id = ''' + str(id))
    cursor.execute(query)
    column_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(column_headers, row)))
    return jsonify(json_data)

# Update hours of a particular cafe
@cafe.route('/cafe/<cafe_id>/hours', methods=['PUT'])
def update_cafe_hours(cafe_id):
    
    # collecting data from the request object 
    the_data = request.json
    current_app.logger.info(the_data)

    #extracting the variable
    hours = the_data['hours']
    days = the_data['days']

    # Get a cursor object from the database
    cursor = db.get_db().cursor()

    # Prepare the UPDATE query with parameterized inputs
    query = 'UPDATE Cafe SET hours = ' + hours + ", days = " + days + "WHERE cafe_id =" + str(id)

    # executing and committing the update statement 
    cursor = db.get_db().cursor()
    cursor.execute(query)
    db.get_db().commit()
    
    return 'Success!'

#ENDPOINT 6 --------------
# Get a list of all the cafes with the given price rating
@cafe.route('/cafe/<price>', methods=['GET'])
def get_cafes_price(price):
    # get a cursor object from the database
    cursor = db.get_db().cursor()

    # use cursor to query the database for a list of products
    cursor.execute('''
                    SELECT name, street, city, state, zip, Ratings.price
                    FROM Cafe c JOIN Ratings r ON c.cafe_id = r.cafe_id
                    WHERE Ratings.price = ''' + price)

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

# Add a cafe to the list of cafes with a given price
@cafe.route('/cafe/<price>', methods=['POST'])
def add_new_price_cafe(price): 
    
    # collecting data from the request object 
    the_data = request.json
    current_app.logger.info(the_data)

    #extracting the variable
    owner = the_data['owner_id']
    time = the_data['time']
    days = the_data['days']
    website = the_data['website_link']
    name = the_data['name']
    street = the_data['street']
    city = the_data['city']
    state = the_data['state']
    zip = the_data['zip']
    cafe_price = price
    wifi = the_data['has_wifi']
    outlets = the_data['has_outlets']
    id = the_data['cafe_id']

    # Constructing the query
    query = 'INSERT INTO Cafe (owner_id, time, days, website_link, name, street, city, state, zip, price, has_wifi, has_outlets, cafe_id) VALUES ("'
    query += int(owner) + '", "'
    query += time + '", "'
    query += days + '", "'
    query += website + '", '
    query += name + '", '
    query += street + '", '
    query += city + '", '
    query += state + '", '
    query += zip + '", '
    query += cafe_price + '", '
    query += wifi + '", '
    query += outlets + '", '
    query += id + ')'
    current_app.logger.info(query)

    # executing and committing the insert statement 
    cursor = db.get_db().cursor()
    cursor.execute(query)
    db.get_db().commit()
    
    return 'Success!'

#ENDPOINT 7 --------------
# Get a list of all the cafes with the given service speed
@cafe.route('/cafe/<service_speed>', methods=['GET'])
def get_cafes_price(service_speed):
    # get a cursor object from the database
    cursor = db.get_db().cursor()

    # use cursor to query the database for a list of products
    cursor.execute('''
                    SELECT name, street, city, state, zip, Ratings.price, Ratings.service_speed
                    FROM Cafe c JOIN Ratings r ON c.cafe_id = r.cafe_id
                    WHERE Ratings.service_speed = ''' + service_speed)

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

#ENDPOINT 12 --------------
# Add a comment to a cafe
@cafe.route('/cafe/<cafe_id>/<review_id>/comment', methods=['POST'])
def add_new_review_comment(cafe_id, review_id): 
    
    # collecting data from the request object 
    the_data = request.json
    current_app.logger.info(the_data)

    #extracting the variable
    customer_id = the_data['customer_id']
    content = the_data.get('comment')

    if not content:
        return 'Bad Request: Missing or empty "comment" in the request body', 400

    # constructing the query
    query = 'INSERT INTO Reviews (customer_id, cafe_id, review_id, content) VALUES (%s, %s, %s, %s)'
    values = (customer_id, cafe_id, review_id, content)
    current_app.logger.info(query)

    # executing and committing the insert statement 
    cursor = db.get_db().cursor()
    cursor.execute(query, values)
    db.get_db().commit()
    
    return 'Success!'

# Update a comment for a cafe
@cafe.route('/cafe/<cafe_id>/<review_id>/comment', methods=['PUT'])
def update_review_comment(cafe_id, review_id):
    # collecting data from the request object 
    the_data = request.json
    current_app.logger.info(the_data)

    # extracting the variable
    customer_id = the_data['customer_id']
    updated_comment = the_data.get('comment')

    if updated_comment is None: 
        return 'Bad Request: Missing or empty "updated_comment" in the request body', 400

    # constructing the query with parameterized query
    query = 'UPDATE Reviews SET content = %s WHERE cafe_id = %s AND review_id = %s AND customer_id = %s'
    values = (updated_comment, cafe_id, review_id, customer_id)
    current_app.logger.info(query % values)

    # Executing and committing the update statement 
    cursor = db.get_db().cursor()
    cursor.execute(query, values)
    db.get_db().commit()
    
    return 'Success!'

# Delete a comment for a cafe
@cafe.route('/cafe/<cafe_id>/<review_id>/comment', methods=['DELETE'])
def delete_review_comment(cafe_id, review_id):
    # Collecting data from the request object 
    the_data = request.json
    current_app.logger.info(the_data)

    # Extracting the variable
    customer_id = the_data['customer_id']

    # Constructing the query with parameterized query
    query = 'DELETE FROM Reviews WHERE cafe_id = %s AND review_id = %s AND customer_id = %s'
    values = (cafe_id, review_id, customer_id)
    current_app.logger.info(query % values)

    # Executing and committing the delete statement 
    cursor = db.get_db().cursor()
    cursor.execute(query, values)
    db.get_db().commit()

    return 'Comment deleted successfully!'
