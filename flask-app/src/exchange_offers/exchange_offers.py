from flask import Blueprint, request, jsonify, make_response, current_app
import json
from src import db

exchange_offers = Blueprint('exchange_offers', __name__)

@exchange_offers.route('/all_exchange_books', methods=['GET'])
def get_all_exchange_books():
    cursor = db.get_db().cursor()
    cursor.execute('''
    SELECT textbooks.TextbookID, textbooks.Title, textbooks.Author, textbooks.ISBN, 
           ExchangeOffer.OfferID, ExchangeOffer.Price, ExchangeOffer.ConditionState
    FROM textbooks
    JOIN ExchangeOffer ON ExchangeOffer.TextbookID = textbooks.TextbookID
    ORDER BY textbooks.Title
    ''')
    column_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(column_headers, row)))
    return jsonify(json_data)


@exchange_offers.route('/user_textbooks/<int:user_id>', methods=['GET'])
def get_user_textbooks(user_id):
    cursor = db.get_db().cursor()
    cursor.execute('''
    SELECT textbooks.TextbookID, textbooks.Title, textbooks.Author, textbooks.ISBN
    FROM textbooks
    JOIN ExchangeOffer ON ExchangeOffer.TextbookID = textbooks.TextbookID
    WHERE UserID = %s
    ''', (user_id,))
    column_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(column_headers, row)))
    return jsonify(json_data)


@exchange_offers.route('/post_exchange/<int:user_id>', methods=['POST'])
def post_exchange2(user_id):
    print("post_exchanged called")
    # Collecting data from the request JSON
    data = request.get_json()
    current_app.logger.info(data)

    # Extracting variables from the data
    title = data['Title']
    author = data['Author']
    isbn = data['ISBN']
    # user_id = data['UserID']
    condition = data['ConditionState']
    price = data['Price']

    # Constructing the SQL query
    query = '''
    INSERT INTO ExchangeOffer (TextbookID, UserID, ConditionState, Price)
    VALUES ((SELECT TextbookID FROM textbooks WHERE Title=%s AND Author=%s AND ISBN=%s), %s, %s, %s)
    '''
    current_app.logger.info(query)

    # Executing and committing the insert statement
    cursor = db.get_db().cursor()
    cursor.execute(query, (title, author, isbn, user_id, condition, price))
    db.get_db().commit()

    return jsonify({'success': 'Exchange offer posted successfully'})


@exchange_offers.route('/update_condition', methods=['PUT'])
def update_textbook_condition():
    print("Received data:", request.json)  # Debug line to check what's received
    condition_info = request.json
    if 'offer_id' not in condition_info or 'new_condition' not in condition_info:
        return jsonify({'error': 'Both offer_id and new_condition are required'}), 400

    offer_id = condition_info['offer_id']
    new_condition = condition_info['new_condition']

    query = '''
    UPDATE ExchangeOffer
    SET ConditionState = %s
    WHERE OfferID = %s;
    '''
    cursor = db.get_db().cursor()
    r = cursor.execute(query, (new_condition, offer_id))
    db.get_db().commit()
    
    if r:
        return jsonify({'success': 'Condition updated successfully'}), 200
    else:
        return jsonify({'error': 'No records updated, check your offer_id'}), 404
    

@exchange_offers.route('/remove_textbook', methods=['DELETE'])
def remove_textbook_from_exchange():
    offer_id = request.json.get('offer_id')
    
    if not offer_id:
        return jsonify({'error': 'Missing offer ID'}), 400

    query = '''
    DELETE FROM ExchangeOffer
    WHERE OfferID = %s;
    '''
    cursor = db.get_db().cursor()
    cursor.execute(query, (offer_id,))
    db.get_db().commit()
    
    return jsonify({'success': 'Textbook removed successfully'}), 200





