from flask import Blueprint, jsonify, request

administrator_bp = Blueprint('administrator', __name__)

administrators = [
    {'Admin_ID': '5NY5Y80MN68', 'email': 'mflecknell0@youtu.be', 'FirstName': 'Maressa', 'Lastname': 'Flecknell'},
    {'Admin_ID': '2AW7J64GU75', 'email': 'lswancott1@washingtonpost.com', 'FirstName': 'Lorilee', 'Lastname': 'Swancott'},
    {'Admin_ID': '3VA5H01FN76', 'email': 'gwhaley2@dropbox.com', 'FirstName': 'Glenna', 'Lastname': 'Whaley'},
    {'Admin_ID': '9HF2QN1DQ64', 'email': 'vorigin3@bing.com', 'FirstName': 'Vaughan', 'Lastname': 'Origin'},
    {'Admin_ID': '9UG9CF2EF11', 'email': 'gqueste4@github.com', 'FirstName': 'Glyn', 'Lastname': 'Queste'},
    {'Admin_ID': '2W55TK0CD10', 'email': 'arosle5@cyberchimps.com', 'FirstName': 'Alayne', 'Lastname': 'Rosle'},
    {'Admin_ID': '1HQ6F69HD23', 'email': 'gryles6@goo.gl', 'FirstName': 'Gerladina', 'Lastname': 'Ryles'},
    {'Admin_ID': '5T74HU0VR30', 'email': 'rosheils7@comcast.net', 'FirstName': 'Rutter', 'Lastname': "O'Sheils"},
    {'Admin_ID': '4NM9KF0GF02', 'email': 'abeattie8@senate.gov', 'FirstName': 'Alanson', 'Lastname': 'Beattie'},
    {'Admin_ID': '1J74DH9NN43', 'email': 'kabdon9@time.com', 'FirstName': 'Karissa', 'Lastname': 'Abdon'},
    {'Admin_ID': '8RT9KK9WU41', 'email': 'logilbya@uol.com.br', 'FirstName': 'Lucho', 'Lastname': 'Ogilby'},
    {'Admin_ID': '4HF7P43FJ22', 'email': 'datherb@soup.io', 'FirstName': 'Dominique', 'Lastname': 'Ather'},
    {'Admin_ID': '7P27TY9YK37', 'email': 'nyedyc@infoseek.co.jp', 'FirstName': 'Nehemiah', 'Lastname': 'Yedy'},
    {'Admin_ID': '4GC8NP3TW42', 'email': 'pgeertsend@si.edu', 'FirstName': 'Paco', 'Lastname': 'Geertsen'},
    {'Admin_ID': '4CJ4HY9AU68', 'email': 'dbumphreye@cnet.com', 'FirstName': 'Dyane', 'Lastname': 'Bumphrey'},
    {'Admin_ID': '6YC3TT4PM29', 'email': 'ayedyf@wsj.com', 'FirstName': 'Alexander', 'Lastname': 'Yedy'},
    {'Admin_ID': '6PG7AM9WP62', 'email': 'alambolg@hp.com', 'FirstName': 'Ashlie', 'Lastname': 'Lambol'},
    {'Admin_ID': '2MN6PJ5QW71', 'email': 'jtorrecillah@eventbrite.com', 'FirstName': 'Jolene', 'Lastname': 'Torrecilla'},
    {'Admin_ID': '8J64R55MN86', 'email': 'ljaqueti@sfgate.com', 'FirstName': 'Luelle', 'Lastname': 'Jaquet'},
    {'Admin_ID': '3J33TG4KW08', 'email': 'ypflegerj@aol.com', 'FirstName': 'Yolane', 'Lastname': 'Pfleger'},
    {'Admin_ID': '1A47AA5YQ48', 'email': 'dpedrik@seattletimes.com', 'FirstName': 'Devy', 'Lastname': 'Pedri'},
    {'Admin_ID': '7UV7E43XR60', 'email': 'cgrimwadl@dmoz.org', 'FirstName': 'Ciro', 'Lastname': 'Grimwad'},
    {'Admin_ID': '4YT9K14FF84', 'email': 'lterzzam@homestead.com', 'FirstName': 'Lanna', 'Lastname': 'Terzza'},
    {'Admin_ID': '2KR9WA0MP16', 'email': 'nlitchmoren@buzzfeed.com', 'FirstName': 'Nelia', 'Lastname': 'Litchmore'},
    {'Admin_ID': '2R06K47HH80', 'email': 'bkittleo@exblog.jp', 'FirstName': 'Bradney', 'Lastname': 'Kittle'},
    {'Admin_ID': '1UF7P17GG85', 'email': 'aeichmannp@shinystat.com', 'FirstName': 'Aurel', 'Lastname': 'Eichmann'},
    {'Admin_ID': '6KM9Q64QN15', 'email': 'cmorrelq@businessweek.com', 'FirstName': 'Corene', 'Lastname': 'Morrel'},
    {'Admin_ID': '5PX2KG4QU73', 'email': 'rprimakr@businesswire.com', 'FirstName': 'Rodolphe', 'Lastname': 'Primak'},
    {'Admin_ID': '3FP4T97VF79', 'email': 'naxelbees@constantcontact.com', 'FirstName': 'Nelson', 'Lastname': 'Axelbee'},
    {'Admin_ID': '7CR3A38JN85', 'email': 'cbrislanet@loc.gov', 'FirstName': 'Candra', 'Lastname': 'Brislane'}
]

@administrator_bp.route('/administrators', methods=['GET'])
def get_administrators():
    return jsonify(administrators)

@administrator_bp.route('/administrators/<string:admin_id>', methods=['GET'])
def get_administrator(admin_id):
    administrator = next((a for a in administrators if a['Admin_ID'] == admin_id), None)
    if administrator:
        return jsonify(administrator)
    else:
        return jsonify({'error': 'Administrator not found'}), 404

@administrator_bp.route('/administrators/<string:firstName>', methods=['POST'])
def add_administrator():
    new_administrator = request.json
    if 'Admin_ID' in new_administrator and 'FirstName' in new_administrator and 'Lastname' in new_administrator:
        administrators.append(new_administrator)
        return jsonify(new_administrator), 201
    else:
        return jsonify({'error': 'Administrator data incomplete'}), 400

@administrator_bp.route('/administrators/<string:admin_id>', methods=['PUT'])
def update_administrator(admin_id):
    administrator = next((a for a in administrators if a['Admin_ID'] == admin_id), None)
    if administrator:
        updated_info = request.json
        administrator.update(updated_info)
        return jsonify(administrator)
    else:
        return jsonify({'error': 'Administrator not found'}), 404

@administrator_bp.route('/administrators/<string:admin_id>/', methods=['DELETE'])
def delete_administrator(admin_id):
    global administrators
    administrators = [a for a in administrators if a['Admin_ID'] != admin_id]
    return '', 204

