import csv
from flask import Blueprint, jsonify, request

ta_bp = Blueprint('ta', __name__)

# Function to read TA data from CSV file
def read_ta_data(csv_filename):
    tas = []
    with open(csv_filename, newline='') as csvfile:
        reader = csv.DictReader(csvfile)
        for row in reader:
            tas.append(row)
    return tas

# Function to write TA data to CSV file
def write_ta_data(tas, csv_filename):
    with open(csv_filename, 'w', newline='') as csvfile:
        fieldnames = ['TA_ID', 'email', 'FirstName', 'Lastname', 'Professor_ID']
        writer = csv.DictWriter(csvfile, fieldnames=fieldnames)
        writer.writeheader()
        for ta in tas:
            writer.writerow(ta)

# Replace the hardcoded TA data with data read from CSV
csv_filename = "TA.csv"  # Update with your CSV filename
tas = read_ta_data(csv_filename)

@ta_bp.route('/tas', methods=['GET'])
def get_tas():
    return jsonify(tas)

@ta_bp.route('/tas/<int:ta_id>', methods=['GET'])
def get_ta(ta_id):
    ta = next((t for t in tas if t['TA_ID'] == str(ta_id)), None)
    if ta:
        return jsonify(ta)
    else:
        return jsonify({'error': 'TA not found'}), 404

@ta_bp.route('/tas', methods=['POST'])
def add_ta():
    new_ta = request.json
    if 'FirstName' in new_ta and 'LastName' in new_ta:
        new_ta['TA_ID'] = str(len(tas) + 1)
        tas.append(new_ta)
        write_ta_data(tas, csv_filename)  # Update CSV file
        return jsonify(new_ta), 201
    else:
        return jsonify({'error': 'TA data incomplete'}), 400

@ta_bp.route('/tas/<int:ta_id>', methods=['PUT'])
def update_ta(ta_id):
    ta = next((t for t in tas if t['TA_ID'] == str(ta_id)), None)
    if ta:
        updated_info = request.json
        ta.update(updated_info)
        write_ta_data(tas, csv_filename)  # Update CSV file
        return jsonify(ta)
    else:
        return jsonify({'error': 'TA not found'}), 404

@ta_bp.route('/tas/<int:ta_id>', methods=['DELETE'])
def delete_ta(ta_id):
    global tas
    tas = [t for t in tas if t['TA_ID'] != str(ta_id)]
    write_ta_data(tas, csv_filename)  # Update CSV file
    return '', 204
