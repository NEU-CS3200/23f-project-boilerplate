from flask import Blueprint, request, jsonify, make_response
import json
from src import db

communities = Blueprint('communities', __name__)

# get all community information
@communities.route('/exchange-focused', methods=['GET'])
def find_exchange_communities():
    cur = db.get_db().cursor()
    cur.execute("""
        SELECT CommunityID, Name, Description
        FROM Community
        WHERE Description LIKE '%textbook exchange%';
    """)
    communities = cur.fetchall()
    return jsonify(communities)

# get all sharing session information for a community
@communities.route('/user_textbooks/<int:user_id>', methods=['GET'])
def get_user_textbooks(community_id):
    cursor = db.get_db().cursor()
    cursor.execute('''
    SELECT sharingSession.SessionID, sharingSession.Schedule, sharingSession.CommunityID, sharingSession.ResourceID
    FROM sharingSession
    JOIN Community ON Community.CommunityID = sharingSession.CommunityID
    WHERE CommunityID = %s
    ''', (community_id,))
    column_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(column_headers, row)))
    return jsonify(json_data)

# get information of particular sharing session
@communities.route('/user_textbooks/<int:user_id>', methods=['GET'])
def get_user_textbooks(community_id):
    cursor = db.get_db().cursor()
    cursor.execute('''
    SELECT sharingSession.SessionID, sharingSession.Schedule, sharingSession.CommunityID, sharingSession.ResourceID
    FROM sharingSession
    WHERE CommunityID = %s
    ''', (community_id,))
    column_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(column_headers, row)))
    return jsonify(json_data)

# get all membership information for a user
@communities.route('/user_textbooks/<int:user_id>', methods=['GET'])
def get_user_textbooks(user_id):
    cursor = db.get_db().cursor()
    cursor.execute('''
    SELECT membership.SessionID, membership.UserID, membership.CommunityID
    FROM membership
    JOIN User ON User.UserID = membership.UserID
    WHERE UserID = %s
    ''', (user_id,))
    column_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(column_headers, row)))
    return jsonify(json_data)

# get all membership information for a community
@communities.route('/user_textbooks/<int:user_id>', methods=['GET'])
def get_user_textbooks(community_id):
    cursor = db.get_db().cursor()
    cursor.execute('''
    SELECT membership.SessionID, membership.UserID, membership.CommunityID
    FROM membership
    JOIN Community ON Community.CommunityID = membership.CommunityID
    WHERE CommunityID = %s
    ''', (community_id,))
    column_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(column_headers, row)))
    return jsonify(json_data)

@communities.route('/remove_membership', methods=['DELETE'])
def remove_textbook_from_exchange():
    membership_id = request.json.get('offer_id')
    
    if not membership_id:
        return jsonify({'error': 'Missing membership ID'}), 400

    query = '''
    DELETE FROM Membership
    WHERE OfferID = %s;
    '''
    cursor = db.get_db().cursor()
    cursor.execute(query, (membership_id,))
    db.get_db().commit()
    
    return jsonify({'success': 'Membership removed successfully'}), 200

# insert new community
@communities.route('/', methods=['POST'])
def create_community():
    community_data = request.json
    cur = db.get_db().cursor()
    cur.execute("""
        INSERT INTO Community (Name, Description) 
        VALUES (%s, %s);
    """, (community_data['Name'], community_data['Description']))
    db.commit()
    return jsonify({"success": True}), 201

# update community description
@communities.route('/update_description', methods=['PUT'])
def update_community():
    print("Received data:", request.json)  # Debug line to check what's received
    condition_info = request.json
    if 'community_id' not in condition_info or 'new_description' not in condition_info:
        return jsonify({'error': 'Both community_id and new_description are required'}), 400

    community_id = condition_info['community_id']
    new_description = condition_info['new_description']

    query = '''
    UPDATE Community
    SET Description = %s
    WHERE CommunityID = %s;
    '''
    cursor = db.get_db().cursor()
    r = cursor.execute(query, (new_description, community_id))
    db.get_db().commit()
    
    if r:
        return jsonify({'success': 'Description updated successfully'}), 200
    else:
        return jsonify({'error': 'No records updated, check your offer_id'}), 404






