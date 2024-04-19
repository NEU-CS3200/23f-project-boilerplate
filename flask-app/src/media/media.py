from flask import Blueprint, request, jsonify, make_response
from src import db

media = Blueprint('media', __name__)

@media.route('/media/<int:mediaID>', methods=['GET'])
def get_media(mediaID):
    cursor = db.get_db().cursor()
    query = """
    SELECT m.mediaID, m.title, mt.type AS mediaType, g.genre, m.rating, mo.name AS mood
    FROM media m
    LEFT JOIN mediaType mt ON m.mediaType = mt.mediaTypeID
    LEFT JOIN genre g ON m.genre = g.genreID
    LEFT JOIN mood mo ON m.mood = mo.moodID
    WHERE m.mediaID = %s
    """
    cursor.execute(query, (mediaID,))
    media_data = cursor.fetchone()
    if media_data:
        row_headers = [x[0] for x in cursor.description]
        json_data = dict(zip(row_headers, media_data))
    else:
        json_data = {}

    response = make_response(jsonify(json_data))
    response.status_code = 200
    response.mimetype = 'application/json'
    return response

@media.route('/media/mediaType/<type>', methods=['GET'])
def get_media_by_type(type):
    cursor = db.get_db().cursor()
    query = """
    SELECT m.mediaID, m.title, mt.type AS mediaType, g.genre, m.rating, mo.name AS mood
    FROM media m
    JOIN mediaType mt ON m.mediaType = mt.mediaTypeID
    JOIN genre g ON m.genre = g.genreID
    LEFT JOIN mood mo ON m.mood = mo.moodID
    WHERE mt.type = %s
    """
    cursor.execute(query, (type,))
    results = cursor.fetchall()
    if results:
        row_headers = [x[0] for x in cursor.description]
        json_data = [dict(zip(row_headers, result)) for result in results]
    else:
        json_data = []

    response = make_response(jsonify(json_data))
    response.status_code = 200
    response.mimetype = 'application/json'
    return response

# Adjusted query for the '/m/media/rating/<rating>' endpoint
@media.route('/media/rating/<int:rating>', methods=['GET'])
def get_media_by_rating(rating):
    cursor = db.get_db().cursor()
    query = """
    SELECT m.mediaID, m.title, mt.type AS mediaType, g.genre, m.rating, mo.name AS mood
    FROM media m
    JOIN mediaType mt ON m.mediaType = mt.mediaTypeID
    JOIN genre g ON m.genre = g.genreID
    LEFT JOIN mood mo ON m.mood = mo.moodID
    WHERE m.rating = %s
    """
    cursor.execute(query, (rating,))
    results = cursor.fetchall()
    if results:
        row_headers = [x[0] for x in cursor.description]  # Extract row headers
        json_data = [dict(zip(row_headers, result)) for result in results]
    else:
        json_data = []

    response = make_response(jsonify(json_data))
    response.status_code = 200
    response.mimetype = 'application/json'
    return response


@media.route('/media/mood/<int:moodID>', methods=['GET'])
def get_media_by_mood(moodID):
    cursor = db.get_db().cursor()
    query = """
    SELECT m.mediaID, m.title, mt.type AS mediaType, g.genre, m.rating, mo.name AS mood
    FROM media m
    JOIN mediaType mt ON m.mediaType = mt.mediaTypeID
    JOIN genre g ON m.genre = g.genreID
    JOIN mood mo ON m.mood = mo.moodID
    WHERE mo.moodID = %s
    """
    cursor.execute(query, (moodID,))
    results = cursor.fetchall()
    if results:
        row_headers = [x[0] for x in cursor.description]  # Extract row headers
        json_data = [dict(zip(row_headers, result)) for result in results]
    else:
        json_data = []

    response = make_response(jsonify(json_data))
    response.status_code = 200
    response.mimetype = 'application/json'
    return response


@media.route('/media/genre/<int:genreID>', methods=['GET'])
def get_media_by_genre(genreID):
    cursor = db.get_db().cursor()
    query = """
    SELECT m.mediaID, m.title, mt.type AS mediaType, m.rating, mo.name AS mood
    FROM media m
    JOIN mediaType mt ON m.mediaType = mt.mediaTypeID
    JOIN genre g ON m.genre = g.genreID
    JOIN mood mo ON m.mood = mo.moodID
    WHERE g.genreID = %s
    """
    cursor.execute(query, (genreID,))
    results = cursor.fetchall()
    if results:
        row_headers = [x[0] for x in cursor.description]  # Extract row headers
        json_data = [dict(zip(row_headers, result)) for result in results]
    else:
        json_data = []

    response = make_response(jsonify(json_data))
    response.status_code = 200
    response.mimetype = 'application/json'
    return response

@media.route('/log/<int:logID>', methods=['GET'])
def get_log(logID):
    cursor = db.get_db().cursor()
    cursor.execute("SELECT * FROM log WHERE logID = %s", (logID,))
    log_entry = cursor.fetchone()
    if log_entry:
        headers = [x[0] for x in cursor.description]
        log_data = dict(zip(headers, log_entry))
        return jsonify(log_data)
    else:
        abort(404, description="Log not found")

@media.route('/log', methods=['POST'])
def create_log():
    data = request.get_json()
    cursor = db.get_db().cursor()
    columns = ', '.join(data.keys())
    placeholders = ', '.join(['%s'] * len(data))
    cursor.execute(f"INSERT INTO log ({columns}) VALUES ({placeholders})", list(data.values()))
    db.get_db().commit()
    return jsonify({"success": True, "msg": "Log created"}), 201

@media.route('/log/<int:logID>', methods=['PUT'])
def update_log(logID):
    data = request.get_json()
    cursor = db.get_db().cursor()
    columns = [f"{k} = %s" for k in data.keys()]
    values = list(data.values())
    values.append(logID)
    cursor.execute(f"UPDATE log SET {', '.join(columns)} WHERE logID = %s", values)
    db.get_db().commit()
    return jsonify({"success": True, "msg": "Log updated"}), 200

@media.route('/log/<int:logID>', methods=['DELETE'])
def delete_log(logID):
    cursor = db.get_db().cursor()
    cursor.execute("DELETE FROM log WHERE logID = %s", (logID,))
    db.get_db().commit()
    return jsonify({"success": True, "msg": "Log deleted"}), 200

@media.route('/log/user/<int:userID>', methods=['GET'])
def get_user_logs(userID):
    cursor = db.get_db().cursor()
    cursor.execute("SELECT * FROM log WHERE userID = %s", (userID,))
    logs = cursor.fetchall()
    if not logs:
        return jsonify([])  # Return an empty list if no logs found
    headers = [x[0] for x in cursor.description]
    logs_data = [dict(zip(headers, log)) for log in logs]
    return jsonify(logs_data)

@media.route('/log/user/rating/<int:userID>/<int:rating>', methods=['GET'])
def get_user_logs_by_rating(userID, rating):
    cursor = db.get_db().cursor()
    cursor.execute("SELECT * FROM log WHERE userID = %s AND rating = %s", (userID, rating))
    logs = cursor.fetchall()
    if not logs:
        return jsonify([])  # Return an empty list if no logs found
    headers = [x[0] for x in cursor.description]
    logs_data = [dict(zip(headers, log)) for log in logs]
    return jsonify(logs_data)

@media.route('/log/favorite/<int:userID>', methods=['GET'])
def get_favorite_logs(userID):
    cursor = db.get_db().cursor()
    cursor.execute("SELECT * FROM log WHERE userID = %s AND isFavorite = TRUE", (userID,))
    logs = cursor.fetchall()
    if not logs:
        return jsonify([])  # Return an empty list if no logs found
    headers = [x[0] for x in cursor.description]
    logs_data = [dict(zip(headers, log)) for log in logs]
    return jsonify(logs_data)