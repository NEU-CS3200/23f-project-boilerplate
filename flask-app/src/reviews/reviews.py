from datetime import date
from flask import Blueprint, request, jsonify, make_response, current_app
import json
from src import db


reviews = Blueprint('reviews', __name__)

# Get all the reviews from the database
# Outputs array containing details of all reviews
@reviews.route('/', methods=['GET'])
def get_reviews():
    # get a cursor object from the database
    cursor = db.get_db().cursor()

    # use cursor to query the database for a list of products
    cursor.execute('SELECT * FROM review')

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

# add a new review to the db
# Expects payload with details of the new review
# Outputs success message if new review is successfully added 
@reviews.route('/', methods=['POST'])
def add_new_review():
    
    # collecting data from the request object 
    the_data = request.json
    current_app.logger.info(the_data)

    #extracting the variable
    if 'title' not in the_data:
        return jsonify({"message": "Error: title not provided"})
    if 'reviewText' not in the_data:
        return jsonify({"message": "Error: reviewText not provided"})
    if "author" not in the_data:
        return jsonify({"message": "Error: author not provided"})
    if "customerID" not in the_data:
        return jsonify({"message": "Error: customerID not provided"})
    title = the_data['title']
    reviewText = the_data['reviewText']
    author = the_data['author']
    customerID = the_data['customerID']

    if title is None:
        return jsonify({"message": "Error: title is null"}), 400
    if reviewText is None:
        return jsonify({"message": "Error: reviewText is null"}), 400
    if author is None:
        return jsonify({"message": "Error: author is null"}), 400
    if customerID is None:
        return jsonify({"message": "Error: customerID is null"}), 400

    # Constructing the query
    query = 'insert into review (title, reviewText, dateCreated, dateEdited, datePublished, author, customerID) values ('
    query += '"' + title + '",'
    query += '"' + reviewText + '",'
    query += '"' + str(date.today()) + '",'
    query += 'NULL' + ','
    query += 'NULL' + ','
    query += '"' + author + '",'
    query += str(customerID) + ')'
    print(query)
    current_app.logger.info(query)

    # executing and committing the insert statement 
    cursor = db.get_db().cursor()
    cursor.execute(query)
    db.get_db().commit()
    
    return jsonify({"message": 'Success!'})

# Get a certain review from the database based on ID
# Expects input of reviewID
# Outputs details of a certain review
@reviews.route('/<reviewID>', methods=['GET'])
def get_review(reviewID):
    # get a cursor object from the database
    cursor = db.get_db().cursor()

    # use cursor to query the database for a list of products
    cursor.execute('SELECT * FROM review WHERE reviewID={0}'.format(reviewID))

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

# Update the specified review in the database
# Expects input of payload with updated review
# Outputs success message if review is successfully updated
@reviews.route('/<reviewID>', methods=['PUT'])
def update_review(reviewID):
    
    # collecting data from the request object 
    the_data = request.json
    current_app.logger.info(the_data)

    query = 'UPDATE review SET '

    #construct query
    if 'title' in the_data:
        title = the_data['title']
        if title is None:
            return jsonify({"message": "Error: title is null"}), 400
        query += ('title = "' + title + '",')
    if 'reviewText' in the_data:
        reviewText = the_data['reviewText']
        if reviewText is None:
            return jsonify({"message": "Error: reviewText is null"}), 400
        query += ('reviewText = "' + reviewText + '",')
    if 'datePublished' in the_data:
        datePublished = the_data['datePublished']
        if datePublished is None:
            query += ('datePublished = NULL,')
        else:
            query += ('datePublished = "' + datePublished + '",')
    if 'author' in the_data:
        author = the_data['author']
        if author is None:
            return jsonify({"message": "Error: author is null"}), 400
        query += ('author = "' + author + '",')

    if query is 'UPDATE review SET ':
        return jsonify({"message": "Error: no fields provided"}), 400
    
    currDate = date.today()
    query += ('dateEdited = "' + str(currDate) + '",')

    #remove unnecessary comma    and    update the appropriate animal by animalID
    query = query[0:len(query) - 1] + " WHERE reviewID = {0}".format(reviewID)

    print(query)
    current_app.logger.info(query)

    # executing and committing the insert statement 
    cursor = db.get_db().cursor()
    cursor.execute(query)
    db.get_db().commit()
    
    return jsonify({"message": "Success!"})


# Delete a specific review from the database
# Expects input of specific reviewID
# Outputs success message if specific review is successsfully deleted
@reviews.route('/<reviewID>', methods=['DELETE'])
def delete_review(reviewID):
    # get a cursor object from the database
    cursor = db.get_db().cursor()
    # use cursor to query the database for a list of reviews
    cursor.execute('DELETE FROM review WHERE reviewID={0}'.format(reviewID))
    db.get_db().commit()
    return jsonify({"message": "Success!"}) 

# Delete a specific review by title from the database
# Expects input of title
# # Outputs success message if specific review is successfully deleted
@reviews.route('/<title>', methods=['DELETE'])
def delete_review_by_title(title):
    # get a cursor object from the database
    cursor = db.get_db().cursor()
    # use cursor to query the database for a list of reviews
    cursor.execute('DELETE FROM review WHERE title={0}'.format(title))
    db.get_db().commit()
    return jsonify({"message": "Success!"}) 

# Delete all reviews created earlier than the specified datetime from the database
# Expects input of datetime
# Outputs success message if specific review is successfully deleted
@reviews.route('/created/<datetime>', methods=['DELETE'])
def delete_review_by_datetime(datetime):
    # get a cursor object from the database
    cursor = db.get_db().cursor()
    # use cursor to query the database for a list of guides
    cursor.execute('DELETE FROM review WHERE dateCreated < "{0}"'.format(datetime))
    db.get_db().commit()
    return jsonify({"message": "Success!"}) 