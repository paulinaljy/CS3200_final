import csv
from flask import Blueprint, jsonify, request

administrator_bp = Blueprint('administrator', __name__)

# Function to read administrator data from CSV file
def read_administrator_data(csv_filename):
    administrators = []
    with open(csv_filename, newline='') as csvfile:
        reader = csv.DictReader(csvfile)
        for row in reader:
            administrators.append(row)
    return administrators

# Function to write administrator data to CSV file
def write_administrator_data(administrators, csv_filename):
    with open(csv_filename, 'w', newline='') as csvfile:
        fieldnames = ['Admin_ID', 'email', 'FirstName', 'Lastname']
        writer = csv.DictWriter(csvfile, fieldnames=fieldnames)
        writer.writeheader()
        for admin in administrators:
            writer.writerow(admin)

# Replace the hardcoded administrator data with data read from CSV
csv_filename = "../Administrator.csv"  # Update with your CSV filename
administrators = read_administrator_data(csv_filename)

@administrator_bp.route('/administrator', methods=['GET'])
def get_administrators():
    return jsonify(administrators)

@administrator_bp.route('/administrators/<string:admin_id>', methods=['GET'])
def get_administrator(admin_id):
    administrator = next((a for a in administrators if a['Admin_ID'] == admin_id), None)
    if administrator:
        return jsonify(administrator)
    else:
        return jsonify({'error': 'Administrator not found'}), 404

@administrator_bp.route('/administrators', methods=['POST'])
def add_administrator():
    new_administrator = request.json
    if 'Admin_ID' in new_administrator and 'email' in new_administrator and 'FirstName' in new_administrator and 'Lastname' in new_administrator:
        administrators.append(new_administrator)
        write_administrator_data(administrators, csv_filename)  # Update CSV file
        return jsonify(new_administrator), 201
    else:
        return jsonify({'error': 'Administrator data incomplete'}), 400

@administrator_bp.route('/administrators/<string:admin_id>', methods=['PUT'])
def update_administrator(admin_id):
    administrator = next((a for a in administrators if a['Admin_ID'] == admin_id), None)
    if administrator:
        updated_info = request.json
        administrator.update(updated_info)
        write_administrator_data(administrators, csv_filename)  # Update CSV file
        return jsonify(administrator)
    else:
        return jsonify({'error': 'Administrator not found'}), 404

@administrator_bp.route('/administrators/<string:admin_id>', methods=['DELETE'])
def delete_administrator(admin_id):
    global administrators
    administrators = [a for a in administrators if a['Admin_ID'] != admin_id]
    write_administrator_data(administrators, csv_filename)  # Update CSV file
    return '', 204
