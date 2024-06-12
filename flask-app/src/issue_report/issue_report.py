from flask import Blueprint, request, jsonify, make_response, current_app
import json
from src import db

issue_report = Blueprint('IssueReport', __name__)
# Get issue report details for readers with particular report Id
@issue_report.route('/IssueReport/<reportID>', methods=['GET'])
def get_issue_report(reportID):
    cursor = db.get_db().cursor()
    cursor.execute('select * from IssueReport where reportID = {0}'.format(reportID))
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response

# Update issue report details for a particular report ID
@issue_report.route('/IssueReport/<reportID>', methods=['PUT'])
def update_issue_report(reportID):
    issue_report_info = request.json
    issue_report_reportID = issue_report_info['reportID']
    report_content = issue_report_info['reportContent']
    date = issue_report_info['date']
    resolved = issue_report_info['resolved']
    type = issue_report_info['type']
    severity = issue_report_info['severity']

    query = 'UPDATE issue_report SET report_content = %s, date = %s, resolved = %s \
         type = %s, severity = %s where reportID = {0}'.format(issue_report_reportID)  
    response_data = (reportID, report_content, date, resolved, type, severity)
    cursor = db.get_db().cursor()
    r = cursor.execute(query, response_data)
    db.get_db().commit()
    return 'customer updated!'


