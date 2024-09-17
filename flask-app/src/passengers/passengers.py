from flask import Blueprint, request, jsonify, make_response
import json
from src import db

passengers = Blueprint('passengers', __name__)

@passengers.route('/passengers', methods=['GET'])
def get_passengers():
    cursor = db.get_db().cursor()
    cursor.execute('SELECT * FROM passengers')
    passengers = cursor.fetchall()
    return jsonify(passengers)