from flask import Blueprint, request, jsonify, make_response, current_app
import json
from src import db


cafe = Blueprint('cafe', __name__)

#ENDPOINT 1
# Get all the cafes with promotions
@cafe.route('/cafe/promotions', methods=['GET'])
def get_cafes_with_promotions():
    # get a cursor object from the database
    cursor = db.get_db().cursor()

    #query
    query = '''
            SELECT
                C.name AS cafe_name,
                C.time,
                C.days,
                CONCAT(C.street, ', ', C.city, ', ', C.state, ' ', C.zip) AS address
            FROM
                Cafe AS C
            JOIN
                Promotion AS P ON C.cafe_id = P.cafe_id
            GROUP BY cafe_name, time, days,
                    address;   
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

# ENDPOINT 2 
#2.1 GET a list of all promotions for a cafe with {cafe_id}
@cafe.route('/cafe/<cafe_id>/promotions', methods=['GET'])
def get_cafeid_with_promotions():

    # get a cursor object from the database
    cursor = db.get_db().cursor()

    #query
    query = '''
            SELECT
                C.name AS cafe_name,
                C.time,
                C.days,
                CONCAT(C.street, ', ', C.city, ', ', C.state, ' ', C.zip) AS address
            FROM
                Cafe AS C
            JOIN
                Promotion AS P ON C.cafe_id = P.cafe_id
            GROUP BY cafe_name, time, days,
                    address;   
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

#2.2 Add new discount to the list  
@cafe.route('/cafe/<cafe_id>/promotions', methods=['POST'])
def add_new_discount(cafe_id):

    # collecting data from the request object 
    the_data = request.json
    current_app.logger.info(the_data)

    # Extracting the variables
    promo_title = the_data['title']
    promo_description = the_data['description']
    duration = the_data['duration']
    
    # Construct and execute the query to add a new promotion
    query = '''
        INSERT INTO Promotion (cafe_id, title, description, duration)
        VALUES (%s, %s, %s, %s)
    '''
    values = (cafe_id, promo_title, promo_description, duration)

    cursor = db.get_db().cursor()
    cursor.execute(query, values)
    db.get_db().commit()

    # Return success message or appropriate response
    return 'New discount added successfully'

# 2.3 Delete discount from a cafe from list
@cafe.route('/cafe/<cafe_id>/promotions/<promo_id>', methods=['DELETE'])
def delete_discount(cafe_id, promo_id):
    # Constructing the query using placeholder for cafe_id 
    query = 'DELETE FROM Promotion WHERE cafe_id = %s and promo_id = %s'

    # Executing the query with the parameters
    cursor = db.get_db().cursor()
    cursor.execute(query, (cafe_id, promo_id))
    db.get_db().commit()

    # Return success message
    return 'Discount deleted successfully'


# ENDPOINT 3 
# Return a list of all cafes with wifi
@cafe.route('/cafe/wifi', methods=['GET'])
def get_cafes_wifi():
    # get a cursor object from the database
    cursor = db.get_db().cursor()

    # use cursor to query the database for a list of products
    cursor.execute('''
                    SELECT time, days, name, street, city, state, zip
                    FROM Cafe
                    WHERE has_wifi = 1
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



# ENDPOINT 13 
# Get an invite of {invite_id} for a customer with {customer_id} for a special event
@cafe.route('/customers/<customer_id>/<invite_id>', methods=['GET'])
def get_invite_for_customer(customer_id, invite_id):
    # get a cursor object from the database
    cursor = db.get_db().cursor()

    # query to select the invite for the specified customer and invite_id
    query = '''
            SELECT
                invite_id,
                customer_id,
                description,
                cafe_id
            FROM
                Invite
            WHERE
                customer_id = %s AND invite_id = %s;
        '''

    # execute the query with parameters
    cursor.execute(query, (customer_id, invite_id))

    # grab the column headers from the returned data
    column_headers = [x[0] for x in cursor.description]

    # fetch all the data from the cursor
    invite_data = cursor.fetchall()

    # check if the invite exists
    if not invite_data:
        return 'Invite not found', 404

    # format the result into a JSON response
    invite_info = dict(zip(column_headers, invite_data[0]))

    return jsonify(invite_info)


#ENDPOINT 16
# Get all the cafes from the database
@cafe.route('/cafe', methods=['GET'])
def get_cafes():
    # get a cursor object from the database
    cursor = db.get_db().cursor()

    #query
    query = '''
            SELECT time, days, name, CONCAT(street, ', ', city, ', ', state, ' ', zip) AS address
            FROM Cafe
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

# Add a cafe with outlets to the list of cafes with outlets
@cafe.route('/cafe', methods=['POST'])
def add_new_cafe(): 
    
    # collecting data from the request object 
    the_data = request.json
    current_app.logger.info(the_data)

    # Extracting the variables
    owner = the_data['owner_id']
    time = the_data['time']
    days = the_data['days']
    website = the_data['website_link']
    name = the_data['name']
    street = the_data['street']
    city = the_data['city']
    state = the_data['state']
    zip = the_data['zip']
    wifi = the_data['has_wifi']
    outlets = the_data['has_outlets']

    # Constructing the query using placeholders
    query = '''
    INSERT INTO Cafe (owner_id, time, days, website_link, name, street, city, state, zip, has_wifi, has_outlets)
    VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)
    '''
    values = (owner, time, days, website, name, street, city, state, zip, wifi, outlets)

    # executing and committing the insert statement 
    cursor = db.get_db().cursor()
    cursor.execute(query, values)
    db.get_db().commit()
    
    return 'Success!'

# Delete a cafe
@cafe.route('/cafe/<cafe_id>', methods=['DELETE'])  # Using path parameter for cafe ID
def delete_cafe(cafe_id):
    # Constructing the query using a placeholder
    query = 'DELETE FROM Cafe WHERE cafe_id = %s'  

    # Executing the query with the parameter
    cursor = db.get_db().cursor()
    cursor.execute(query, (cafe_id,))
    db.get_db().commit()

    # Return success message
    return 'Cafe deleted successfully'

# --------------
#ENDPOINT 4
# Get all the cafes with outlets from the database
@cafe.route('/cafe/outlets', methods=['GET'])
def get_cafes_outlets():
    # get a cursor object from the database
    cursor = db.get_db().cursor()

    # use cursor to query the database for a list of products
    cursor.execute('''
                    SELECT time, days, name, street, city, state, zip
                    FROM Cafe
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

# --------------
# ENDPOINT 5 
# Get all the info from a particular cafe in the database
@cafe.route('/cafe/<cafe_id>', methods=['GET'])
def get_cafe_detail(cafe_id):
    # get a cursor object from the database
    cursor = db.get_db().cursor()

    #query the database for cafe details
    query = ('''
            SELECT time, days, name, street, city, state, zip, website_link
            FROM Cafe 
            WHERE cafe_id = %s''')  
    cursor.execute(query, (cafe_id,))
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
            SELECT time, days, name
            FROM Cafe
            WHERE cafe_id = %s''')  
    cursor.execute(query, (cafe_id,))
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
    time = the_data['time']
    days = the_data['days']

    # Get a cursor object from the database
    cursor = db.get_db().cursor()

    # Prepare the UPDATE query with parameterized inputs
    query = 'UPDATE Cafe SET time = %s, days = %s WHERE cafe_id = %s'

    # executing and committing the update statement 
    cursor = db.get_db().cursor()
    cursor.execute(query, (time, days, cafe_id))
    db.get_db().commit()
    
    return 'Success!'

#ENDPOINT 6 --------------
# Get a list of all the cafes with the given price rating
@cafe.route('/cafe/low-price', methods=['GET'])
def get_cheap_cafes():
    # get a cursor object from the database
    cursor = db.get_db().cursor()

    # use cursor to query the database for a list of products
    cursor.execute('''
                    SELECT name, street, city, state, zip, price
                    FROM Cafe c JOIN Ratings r ON c.cafe_id = r.cafe_id
                    WHERE r.price = 1
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

#ENDPOINT 7 --------------
# Get a list of all the cafes with the given service speed
@cafe.route('/cafe/fast-service', methods=['GET'])
def get_cafes_price():
    # get a cursor object from the database
    cursor = db.get_db().cursor()

    # use cursor to query the database for a list of products
    cursor.execute('''
                    SELECT name, street, city, state, zip, price, service_speed
                    FROM Cafe c JOIN Ratings r ON c.cafe_id = r.cafe_id
                    WHERE r.service_speed = 5''')

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

# ENDPOINT 11 --------------
# Get all the reviews for a particular cafe
@cafe.route('/cafe/<cafe_id>/reviews', methods=['GET'])
def get_cafe_reviews(cafe_id):
    # get a cursor object from the database
    cursor = db.get_db().cursor()

    # Prepare the SQL query to retrieve reviews for the specified cafe
    query = '''
            SELECT c.first_name, c.last_name, c.rank, r.content
            FROM Customer AS c
            JOIN Reviews AS r ON c.customer_id = r.customer_id
            WHERE r.cafe_id = %s
        '''

    # Execute the query with the specified cafe_id parameter
    cursor.execute(query, (cafe_id,))

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

@cafe.route('/cafe/filters', methods=['GET'])
def get_cafe_filters():
    filterArray = [{"value": "Lowest Prices", "key": "Lowest Prices"}, 
            {"value": "Fastest Service", "key": "Fastest Service"}, 
            {"value": "Has wifi", "key": "Has wifi"}, 
            {"value": "Has outlets", "key": "Has outlets"}, 
            {"value": "Promotions", "key": "Promotions"}]
    
    return jsonify(filterArray)

@cafe.route('/cafe/personas', methods=['GET'])
def get_cafe_personas():
    personasArray = [{"value": "Customer", "key": "Customer"}, 
            {"value": "Business Owner", "key": "Business Owner"}]
    
    return jsonify(personasArray)