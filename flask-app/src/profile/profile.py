from flask import Blueprint, request, jsonify, make_response, abort
from src import db

# Create a new Blueprint named 'userGoal'
profile = Blueprint('profile', __name__)

@profile.route('/user/<int:userID>', methods=['GET'])
def get_user(userID):
    cursor = db.get_db().cursor()
    cursor.execute("SELECT * FROM user WHERE userID = %s", (userID,))
    user = cursor.fetchone()
    if user:
        headers = [x[0] for x in cursor.description]
        user_data = dict(zip(headers, user))
        return jsonify(user_data)
    else:
        abort(404, description="User not found")

@profile.route('/user/<int:userID>', methods=['PUT'])
def update_user(userID):
    data = request.get_json()
    cursor = db.get_db().cursor()
    columns = [f"{k} = %s" for k in data]
    values = list(data.values())
    values.append(userID)
    cursor.execute(f"UPDATE user SET {', '.join(columns)} WHERE userID = %s", values)
    db.get_db().commit()
    return jsonify({"success": True, "msg": "User updated"}), 200

@profile.route('/user', methods=['POST'])
def create_user():
    data = request.get_json()
    cursor = db.get_db().cursor()
    columns = ', '.join(data.keys())
    placeholders = ', '.join(['%s'] * len(data))
    cursor.execute(f"INSERT INTO user ({columns}) VALUES ({placeholders})", list(data.values()))
    db.get_db().commit()
    return jsonify({"success": True, "msg": "User created"}), 201

@profile.route('/user/<int:userID>', methods=['DELETE'])
def delete_user(userID):
    cursor = db.get_db().cursor()
    cursor.execute("DELETE FROM user WHERE userID = %s", (userID,))
    db.get_db().commit()
    return jsonify({"success": True, "msg": "User deleted"}), 200

@profile.route('/userGoal/goal/<int:userID>', methods=['GET'])
def get_user_goals(userID):
    cursor = db.get_db().cursor()
    cursor.execute("SELECT * FROM userGoal WHERE user = %s", (userID,))
    goals = cursor.fetchall()
    headers = [x[0] for x in cursor.description]
    
    if goals:
        goals_data = [dict(zip(headers, goal)) for goal in goals]
    else:
        goals_data = []  # Return an empty list if no goals found

    return jsonify(goals_data)

@profile.route('/userGoal/<int:goalID>', methods=['GET'])
def get_user_goal(goalID):
    cursor = db.get_db().cursor()
    cursor.execute("SELECT * FROM userGoal WHERE goalID = %s", (goalID,))
    goal = cursor.fetchone()
    if goal:
        headers = [x[0] for x in cursor.description]
        goal_data = dict(zip(headers, goal))
        return jsonify(goal_data)
    else:
        return jsonify([]), 200  # Return empty list if no goal found

@profile.route('/userGoal', methods=['POST'])
def create_user_goal():
    data = request.get_json()
    cursor = db.get_db().cursor()
    columns = ', '.join(data.keys())
    placeholders = ', '.join(['%s'] * len(data))
    cursor.execute(f"INSERT INTO userGoal ({columns}) VALUES ({placeholders})", list(data.values()))
    db.get_db().commit()
    return jsonify({"success": True, "msg": "User goal created"}), 201

@profile.route('/userGoal/<int:goalID>', methods=['PUT'])
def update_user_goal(goalID):
    data = request.get_json()
    cursor = db.get_db().cursor()
    columns = [f"{k} = %s" for k in data.keys()]
    values = list(data.values())
    values.append(goalID)
    cursor.execute(f"UPDATE userGoal SET {', '.join(columns)} WHERE goalID = %s", values)
    db.get_db().commit()
    return jsonify({"success": True, "msg": "User goal updated"}), 200

@profile.route('/userGoal/<int:goalID>', methods=['DELETE'])
def delete_user_goal(goalID):
    cursor = db.get_db().cursor()
    cursor.execute("DELETE FROM userGoal WHERE goalID = %s", (goalID,))
    db.get_db().commit()
    return jsonify({"success": True, "msg": "User goal deleted"}), 200

@profile.route('/mood/colorScheme/<int:moodID>', methods=['GET'])
def get_color_scheme_by_mood(moodID):
    cursor = db.get_db().cursor()
    query = """
    SELECT cs.colorSchemeID, cs.name, cs.headerColor, cs.textColor, cs.backgroundColor
    FROM colorScheme cs
    JOIN mood m ON m.colorScheme = cs.colorSchemeID
    WHERE m.moodID = %s
    """
    cursor.execute(query, (moodID,))
    color_scheme = cursor.fetchone()
    if not color_scheme:
        return jsonify([])  # Return an empty list if no color scheme is found
    headers = [x[0] for x in cursor.description]
    color_scheme_data = dict(zip(headers, color_scheme))
    return jsonify(color_scheme_data)
