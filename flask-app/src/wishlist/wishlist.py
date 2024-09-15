from flask import Blueprint, request, jsonify, make_response, current_app
import json
from src import db

wishlist = Blueprint('wishlist', __name__)


# creates an empty wishlist of items that the user can add to
@wishlist.route('/create-wishlist/<int:user_id>', methods=['POST'])
def create_wishlist(user_id):
    # Collecting data from the request JSON
    data = request.get_json()
    name = data.get('Name')

    # Constructing the SQL query
    query = '''
    INSERT INTO Wishlist (Name, UserID) 
    VALUES (%s, %s);
    '''
    # Executing the SQL query
    cursor = db.get_db().cursor()
    cursor.execute(query, (name, user_id))
    db.get_db().commit()
    
    return jsonify({'success': 'Wishlist created successfully'}), 201

@wishlist.route('/update-wishlist-name/<int:user_id>/<int:wishlist_id>', methods=['PUT'])
def update_wishlist_name(user_id, wishlist_id):
    # Extract the new wishlist name from the request JSON
    data = request.get_json()
    new_name = data.get('new_name')

    cursor = db.get_db().cursor()

    # Check if the specified wishlist belongs to the user
    cursor.execute('SELECT * FROM Wishlist WHERE WishlistID = %s AND UserID = %s', (wishlist_id, user_id))
    result = cursor.fetchone()
    if not result:
        return jsonify({'error': 'Wishlist not found or not owned by user'}), 404

    # Update the wishlist name
    cursor.execute('UPDATE Wishlist SET Name = %s WHERE WishlistID = %s', (new_name, wishlist_id))
    db.get_db().commit()

    return jsonify({'success': 'Wishlist name updated successfully'}), 200

# deletes a wishlist
@wishlist.route('/delete_wishlist/<int:user_id>/<int:wishlist_id>', methods=['DELETE'])
def delete_wishlist(user_id, wishlist_id):
    cursor = db.get_db().cursor()
    # First, verify the wishlist belongs to the user
    cursor.execute('SELECT * FROM Wishlist WHERE WishlistID = %s AND UserID = %s', (wishlist_id, user_id))
    result = cursor.fetchone()
    if not result:
        return jsonify({'error': 'Wishlist not found or not owned by user'}), 404

    # Proceed to delete the wishlist if verification passes
    cursor.execute('DELETE FROM Wishlist WHERE WishlistID = %s AND UserID = %s', (wishlist_id, user_id))
    db.get_db().commit()
    return jsonify({'success': 'Wishlist deleted successfully'}), 200


# adds an item to the given wishlist
@wishlist.route('/add-textbook-to-wishlist', methods=['POST'])
def add_textbook_to_wishlist():
    # Extracting data from the request JSON
    data = request.get_json()
    wishlist_id = data.get('wishlist_id')
    textbook_id = data.get('textbook_id')

    cursor = db.get_db().cursor()
    query = "INSERT INTO WishlistItem (WishlistID, TextbookID) VALUES (%s, %s);"
    try:
        cursor.execute(query, (wishlist_id, textbook_id))
        db.get_db().commit() 
        return jsonify({'success': 'Textbook added to wishlist successfully'}), 200
    except Exception as e:
        print("An error occurred:", e)
        db.get_db().rollback()  # Rollback in case of error
        return jsonify({'error': 'Failed to add textbook to wishlist'}), 500


# removes the given item from the given wishlist, provided it exists
@wishlist.route('/remove_textbook_from_wishlist/<int:user_id>/<int:wishlist_id>/<int:textbook_id>', methods=['DELETE'])
def remove_textbook_from_wishlist(user_id, wishlist_id, textbook_id):
    cursor = db.get_db().cursor()

    # First, verify the wishlist belongs to the user and the textbook is in the wishlist
    cursor.execute('''
        SELECT * FROM WishlistItem wi
        JOIN Wishlist w ON wi.WishlistID = w.WishlistID
        WHERE wi.WishlistID = %s AND wi.TextbookID = %s AND w.UserID = %s
    ''', (wishlist_id, textbook_id, user_id))
    result = cursor.fetchone()

    if not result:
        return jsonify({'error': 'Textbook not found in wishlist or wishlist not owned by user'}), 404

    # Proceed to delete the textbook from the wishlist if verification passes
    cursor.execute('DELETE FROM WishlistItem WHERE WishlistID = %s AND TextbookID = %s', (wishlist_id, textbook_id))
    db.get_db().commit()
    return jsonify({'success': 'Textbook removed from wishlist successfully'}), 200


# gets all the items in a user's wishlist
@wishlist.route('/user-wishlist-items/<int:user_id>/<int:wishlist_id>', methods=['GET'])
def get_items_in_wishlist(user_id, wishlist_id):
    cursor = db.get_db().cursor()

    # Query to fetch all items in the specified wishlist of the user
    query = '''
        SELECT wi.TextbookID, t.Title, t.Author, t.ISBN
        FROM WishlistItem wi
        JOIN textbooks t ON wi.TextbookID = t.TextbookID
        JOIN Wishlist w ON wi.WishlistID = w.WishlistID
        WHERE wi.WishlistID = %s AND w.UserID = %s
    '''
    cursor.execute(query, (wishlist_id, user_id))

    # Fetch all rows from the result
    wishlist_items = cursor.fetchall()

    if not wishlist_items:
        return jsonify({'message': 'No wishlist items found for this user'}), 404

    # Construct JSON response
    wishlist_data = []
    for item in wishlist_items:
        textbook_id, title, author, isbn = item
        wishlist_data.append({
            'textbook_id': textbook_id,
            'title': title,
            'author': author,
            'isbn': isbn
        })

    return jsonify(wishlist_data), 200


# gets all of a users wishlists
@wishlist.route('/user-wishlist/<int:user_id>', methods=['GET'])
def get_user_wishlist(user_id):
    cursor = db.get_db().cursor()

    # Query to fetch all items in the specified wishlist of the user
    cursor.execute('''
        SELECT WishlistID, Name
        FROM Wishlist
        WHERE UserID = %s
    ''', (user_id,))
    
    # Fetch all rows from the result
    wishlist = cursor.fetchall()

    if not wishlist:
        return jsonify({'message': 'No wishlists found for this user'}), 404

    # Construct JSON response
    wishlist_data = []
    for item in wishlist:
        wishlist_id, name = item
        wishlist_data.append({
            'wishlist_id': wishlist_id,
            'name': name
        })

    return jsonify(wishlist_data), 200