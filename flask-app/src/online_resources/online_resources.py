from flask import Blueprint, request, jsonify, make_response, current_app
import json
from src import db

online_resources = Blueprint('online_resources', __name__)

# User Story 1 -- textbooks
@online_resources.route('/affordable_textbooks/<int:max_price>', methods=['GET'])
def get_affordable_textbooks(max_price):
    cursor = db.get_db().cursor()
    cursor.execute('''
    SELECT textbooks.TextbookID, Title, Author, ISBN, Price
    FROM textbooks
    JOIN ExchangeOffer ON textbooks.TextbookID = ExchangeOffer.TextbookID
    WHERE Price <= %s
    ORDER BY Price ASC
    ''', (max_price,))
    column_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(column_headers, row)))
    return jsonify(json_data)


# User Story 2 -- textbooks
@online_resources.route('/user_textbooks/<int:user_id>', methods=['GET'])
def get_user_textbooks(user_id):
    cursor = db.get_db().cursor()
    cursor.execute('''
    SELECT TextbookID, Title, Author, ISBN
    FROM textbooks
    WHERE UserID = %s
    ''', (user_id,))
    column_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(column_headers, row)))
    return jsonify(json_data)

# User Story 4 -- textbooks
@online_resources.route('/add_textbook/<int:user_id>', methods=['POST'])
def add_textbook(user_id):
    # Collecting data from the request JSON
    data = request.get_json()
    isbn = data.get('isbn')
    author = data.get('author')
    title = data.get('title')

    # Constructing the SQL query
    query = '''
    INSERT INTO textbooks (ISBN, Author, Title, UserID) 
    VALUES (%s, %s, %s, %s);
    '''
    
    # Executing the SQL query
    cursor = db.get_db().cursor()
    cursor.execute(query, (isbn, author, title, user_id))
    db.get_db().commit()
    
    return jsonify({'success': 'Textbook added successfully'}), 201

# User Story 5 -- textbooks
@online_resources.route('/delete_textbook/<int:user_id>/<int:textbook_id>', methods=['DELETE'])
def delete_textbook(user_id, textbook_id):
    cursor = db.get_db().cursor()
    # First, verify the textbook belongs to the user
    cursor.execute('SELECT * FROM textbooks WHERE TextbookID = %s AND UserID = %s', (textbook_id, user_id))
    result = cursor.fetchone()
    if not result:
        return jsonify({'error': 'Textbook not found or not owned by user'}), 404

    # Proceed to delete the textbook if verification passes
    cursor.execute('DELETE FROM textbooks WHERE TextbookID = %s AND UserID = %s', (textbook_id, user_id))
    db.get_db().commit()
    return jsonify({'success': 'Textbook deleted successfully'}), 200


# view all the digital resources available on the platform
@online_resources.route('/view-resources', methods=['GET'])
def view_all():
    cursor = db.get_db().cursor()
    cursor.execute('''
    SELECT ResourceID, Title, Format, AccessUrl
    FROM DigitalResource
    ''')
    column_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(column_headers, row)))
    return jsonify(json_data)


# view the details of a specific digital resource
@online_resources.route('/view-resources/<int:resource_id>', methods=['GET'])
def view_this(resource_id):
    cursor = db.get_db().cursor()
    cursor.execute('''
    SELECT Title, Format, AccessUrl
    FROM DigitalResource
    WHERE ResourceID = %s
    ''', (resource_id,))
    column_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(column_headers, row)))
    return jsonify(json_data)
