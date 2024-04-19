from flask import Blueprint, request, jsonify, make_response, abort
from src import db

# Create a new Blueprint named 'journal'
journal = Blueprint('journal', __name__)

@journal.route('/userGoal/goal/<int:userID>', methods=['GET'])
def get_user_journals(userID):
    cursor = db.get_db().cursor()
    cursor.execute("SELECT * FROM journalEntry WHERE user = %s", (userID,))
    journals = cursor.fetchall()
    headers = [x[0] for x in cursor.description]
    
    if journals:
        journals_data = [dict(zip(headers, journal)) for journal in journals]
    else:
        journals_data = []  # Return an empty list if no journals found

    return jsonify(journals_data)

@journal.route('/journalEntry/<int:journalID>', methods=['GET'])
def get_journal_entry(journalID):
    cursor = db.get_db().cursor()
    cursor.execute("SELECT * FROM journalEntry WHERE journalID = %s", (journalID,))
    entry = cursor.fetchone()
    if entry:
        headers = [x[0] for x in cursor.description]
        entry_data = dict(zip(headers, entry))
        return jsonify(entry_data)
    else:
        abort(404, description="Journal entry not found")

@journal.route('/journalEntry', methods=['POST'])
def create_journal_entry():
    data = request.get_json()
    cursor = db.get_db().cursor()
    columns = ', '.join(data.keys())
    placeholders = ', '.join(['%s'] * len(data))
    cursor.execute(f"INSERT INTO journalEntry ({columns}) VALUES ({placeholders})", list(data.values()))
    db.get_db().commit()
    return jsonify({"success": True, "msg": "Journal entry created"}), 201

@journal.route('/journalEntry/<int:journalID>', methods=['PUT'])
def update_journal_entry(journalID):
    data = request.get_json()
    cursor = db.get_db().cursor()
    columns = [f"{k} = %s" for k in data.keys()]
    values = list(data.values())
    values.append(journalID)
    cursor.execute(f"UPDATE journalEntry SET {', '.join(columns)} WHERE journalID = %s", values)
    db.get_db().commit()
    return jsonify({"success": True, "msg": "Journal entry updated"}), 200

@journal.route('/journalEntry/<int:journalID>', methods=['DELETE'])
def delete_journal_entry(journalID):
    cursor = db.get_db().cursor()
    cursor.execute("DELETE FROM journalEntry WHERE journalID = %s", (journalID,))
    db.get_db().commit()
    return jsonify({"success": True, "msg": "Journal entry deleted"}), 200
