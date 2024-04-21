from flask import Blueprint, jsonify, request

professor_bp = Blueprint('professor', __name__)

professors = [
    {'User_ID': 1, 'email': 'ahunday0@discuz.net', 'FirstName': 'Alair', 'Lastname': 'Hunday', 'Professor_ID': 1, 'Course_ID': '4U85U59JV96'},
    {'User_ID': 2, 'email': 'jpudney1@sciencedaily.com', 'FirstName': 'Johnny', 'Lastname': 'Pudney', 'Professor_ID': 2, 'Course_ID': '7M39V23FR87'},
    {'User_ID': 3, 'email': 'arediers2@youtube.com', 'FirstName': 'Alana', 'Lastname': 'Rediers', 'Professor_ID': 3, 'Course_ID': '4JK8NU7DN12'},
    {'User_ID': 4, 'email': 'msandbatch3@tripadvisor.com', 'FirstName': 'Morly', 'Lastname': 'Sandbatch', 'Professor_ID': 4, 'Course_ID': '2JF5E15YJ46'},
    {'User_ID': 5, 'email': 'ydo4@blogger.com', 'FirstName': 'Yehudit', 'Lastname': 'Do', 'Professor_ID': 5, 'Course_ID': '9EC3X35CG33'},
    {'User_ID': 6, 'email': 'rdo5@google.cn', 'FirstName': 'Rickie', 'Lastname': 'Do', 'Professor_ID': 6, 'Course_ID': '9NR6A53GT43'},
    {'User_ID': 7, 'email': 'jtraite6@forbes.com', 'FirstName': 'Josh', 'Lastname': 'Traite', 'Professor_ID': 7, 'Course_ID': '9J12FR5DF57'},
    {'User_ID': 8, 'email': 'bstable7@de.vu', 'FirstName': 'Brandyn', 'Lastname': 'Stable', 'Professor_ID': 8, 'Course_ID': '1GY3HC0VQ97'},
    {'User_ID': 9, 'email': 'sshippam8@telegraph.co.uk', 'FirstName': 'Sheilakathryn', 'Lastname': 'Shippam', 'Professor_ID': 9, 'Course_ID': '3NX8KG7JH04'},
    {'User_ID': 10, 'email': 'cgrafham9@shop-pro.jp', 'FirstName': 'Christa', 'Lastname': 'Grafham', 'Professor_ID': 10, 'Course_ID': '7U41V89DM89'},
    {'User_ID': 11, 'email': 'lreardena@reference.com', 'FirstName': 'Lydia', 'Lastname': 'Rearden', 'Professor_ID': 11, 'Course_ID': '4JC2FW3UN64'},
    {'User_ID': 12, 'email': 'qearleb@qq.com', 'FirstName': 'Quinton', 'Lastname': 'Earle', 'Professor_ID': 12, 'Course_ID': '3RC0J43KX77'},
    {'User_ID': 13, 'email': 'ccradickc@msu.edu', 'FirstName': 'Constance', 'Lastname': 'Cradick', 'Professor_ID': 13, 'Course_ID': '9GP7G78KG23'},
    {'User_ID': 14, 'email': 'tkondratd@msu.edu', 'FirstName': 'Teodora', 'Lastname': 'Kondrat', 'Professor_ID': 14, 'Course_ID': '5TN5AU4UM25'},
    {'User_ID': 15, 'email': 'ncunnahe@apache.org', 'FirstName': 'Nerta', 'Lastname': 'Cunnah', 'Professor_ID': 15, 'Course_ID': '8H87F40DH40'},
    {'User_ID': 16, 'email': 'lbiaggiottif@nifty.com', 'FirstName': 'Laurel', 'Lastname': 'Biaggiotti', 'Professor_ID': 16, 'Course_ID': '6P67KQ7MJ58'},
    {'User_ID': 17, 'email': 'cpennig@apache.org', 'FirstName': 'Clarie', 'Lastname': 'Penni', 'Professor_ID': 17, 'Course_ID': '7UV6TE8QQ38'},
    {'User_ID': 18, 'email': 'cneichoh@java.com', 'FirstName': 'Cayla', 'Lastname': 'Neicho', 'Professor_ID': 18, 'Course_ID': '2AW9PE4YK29'},
    {'User_ID': 19, 'email': 'bguerrini@bluehost.com', 'FirstName': 'Beau', 'Lastname': 'Guerrin', 'Professor_ID': 19, 'Course_ID': '9J31GV6MH11'},
    {'User_ID': 20, 'email': 'nayscoughj@globo.com', 'FirstName': 'Nonna', 'Lastname': 'Ayscough', 'Professor_ID': 20, 'Course_ID': '3W88FP3VW32'},
    {'User_ID': 21, 'email': 'mbowndek@bing.com', 'FirstName': 'Marybelle', 'Lastname': 'Bownde', 'Professor_ID': 21, 'Course_ID': '2GT2WE4FJ75'},
    {'User_ID': 22, 'email': 'osandhilll@aboutads.info', 'FirstName': 'Ortensia', 'Lastname': 'Sandhill', 'Professor_ID': 22, 'Course_ID': '6F30CU5CQ48'},
    {'User_ID': 23, 'email': 'tlazerm@bloomberg.com', 'FirstName': 'Tatiania', 'Lastname': 'Lazer', 'Professor_ID': 23, 'Course_ID': '8W24P20HP07'},
    {'User_ID': 24, 'email': 'imontezn@wp.com', 'FirstName': 'Iris', 'Lastname': 'Montez', 'Professor_ID': 24, 'Course_ID': '6UY8AK4DR04'},
    {'User_ID': 25, 'email': 'srougiero@yandex.ru', 'FirstName': 'Sutherland', 'Lastname': 'Rougier', 'Professor_ID': 25, 'Course_ID': '8QE4DA9NR13'},
    {'User_ID': 26, 'email': 'bmillsp@alibaba.com', 'FirstName': 'Brooke', 'Lastname': 'Mills', 'Professor_ID': 26, 'Course_ID': '8FK9KY2KG54'},
    {'User_ID': 27, 'email': 'coxberryq@unc.edu', 'FirstName': 'Clarinda', 'Lastname': 'Oxberry', 'Professor_ID': 27, 'Course_ID': '1T43EG1HT44'},
    {'User_ID': 28, 'email': 'jelcottr@ucoz.com', 'FirstName': 'Jackson', 'Lastname': 'Elcott', 'Professor_ID': 28, 'Course_ID': '9KG4TP3JP55'},
    {'User_ID': 29, 'email': 'asoftleys@google.com.hk', 'FirstName': 'Arlette', 'Lastname': 'Softley', 'Professor_ID': 29, 'Course_ID': '1QV2MC9YX38'},
    {'User_ID': 30, 'email': 'dnewburyt@walmart.com', 'FirstName': 'Dulciana', 'Lastname': 'Newbury', 'Professor_ID': 30, 'Course_ID': '9VA2Y01MN75'}
]

@professor_bp.route('/professors', methods=['GET'])
def get_professors():
    return jsonify(professors)

@professor_bp.route('/professors/<int:professor_id>', methods=['GET'])
def get_professor(professor_id):
    professor = next((p for p in professors if p['Professor_ID'] == professor_id), None)
    if professor:
        return jsonify(professor)
    else:
        return jsonify({'error': 'Professor not found'}), 404

@professor_bp.route('/professors', methods=['POST'])
def add_professor():
    new_professor = request.json
    if 'FirstName' in new_professor and 'LastName' in new_professor:
        new_professor['Professor_ID'] = max(p['Professor_ID'] for p in professors) + 1
        professors.append(new_professor)
        return jsonify(new_professor), 201
    else:
        return jsonify({'error': 'Professor data incomplete'}), 400

@professor_bp.route('/professors/<int:professor_id>', methods=['PUT'])
def update_professor(professor_id):
    professor = next((p for p in professors if p['Professor_ID'] == professor_id), None)
    if professor:
        updated_info = request.json
        professor.update(updated_info)
        return jsonify(professor)
    else:
        return jsonify({'error': 'Professor not found'}), 404

@professor_bp.route('/professors/<int:professor_id>', methods=['DELETE'])
def delete_professor(professor_id):
    global professors
    professors = [p for p in professors if p['Professor_ID'] != professor_id]
    return '', 204
