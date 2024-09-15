from flask import Blueprint, request, jsonify, make_response, current_app
import json
from src import db

post_comments = Blueprint('Post_Comments', __name__)

# post comments on posts 
@post_comments.route('/Post_Comments', methods=['POST'])
def add_new_comments():
    
    # collecting data from the request object 
    the_data = request.json
    current_app.logger.info(the_data)

    #extracting the variable
    commentID = the_data['commentID']
    comment = the_data['comment']
    date = the_data['date']
    commenterID = the_data['commenterID']
    replyingTo = the_data['replyingTo']
    postID = the_data['postID']

    # Constructing the query
    query = 'insert into Post_Comments (commentID, comment, date, commenterID, \
        replyingTo, postID) values ("'
    query += str(commentID) + '", "'
    query += comment + '", "'
    query += replyingTo + '", "'
    query += postID + '", "'
    query += date + '", '
    query += str(commenterID) + ')'
    current_app.logger.info(query)

    # executing and committing the insert statement 
    cursor = db.get_db().cursor()
    cursor.execute(query)
    db.get_db().commit()
    
    return 'Success!'


### Get all post comments of a post 
@post_comments.route('/Post_Comments/<postID>', methods = ['GET'])
def get_post_comment_detail(postID):

    query = 'SELECT * FROM Post_Comments WHERE postID = ' + str(postID)
    current_app.logger.info(query)

    cursor = db.get_db().cursor()
    cursor.execute(query)
    column_headers = [x[0] for x in cursor.description]
    json_data = []
    the_data = cursor.fetchall()
    for row in the_data:
        json_data.append(dict(zip(column_headers, row)))
    return jsonify(json_data)


# Update comment post comment for a particular comment ID
@post_comments.route('/Post_Comments/<commentID>', methods=['PUT'])
def update_issue_report(commentID):
    post_comment_info = request.json
    post_comment_commentID = post_comment_info['commentID']
    comment = post_comment_info['comment']
    time_stamp = post_comment_info['date']
    commenterID = post_comment_info['commenterID']
    
    query = 'UPDATE Post_Comments SET comment = %s, date = %s, where commentID = \
        {0}'.format(post_comment_commentID)  
    response_data = (commentID, comment, time_stamp, commenterID)
    cursor = db.get_db().cursor()
    r = cursor.execute(query, response_data)
    db.get_db().commit()
    return 'Comment updated!'

# Delete post comments for a particular comment ID
@post_comments.route('/Post_Comments/<commentID>', methods=['DELETE'])
def delete_issue_report(commentID):
    cursor = db.get_db().cursor()
    cursor.execute('DELETE * from Post_Comments where commentID = {0}'.format(commentID))
    db.get_db().commit()
    return 'Post comment has been deleted!'

