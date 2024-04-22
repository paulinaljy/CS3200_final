CREATE TABLE IF NOT EXISTS Users(
    User_ID INTEGER PRIMARY KEY AUTOINCREMENT,
    Pass VARCHAR(50) NOT NULL,
    First_Name VARCHAR(15),
    Middle_Name VARCHAR(20),
    Last_Name VARCHAR(20)
);
INSERT INTO Users (Pass, First_Name, Middle_Name, Last_Name)
VALUES
    ('pass123', 'Emma', 'Grace', 'Miller'),
    ('securepass', 'Oliver', 'Thomas', 'Davis'),
    ('p@ssw0rd', 'Sophia', 'Elizabeth', 'Wilson'),
    ('123456', 'William', 'Jacob', 'Taylor'),
    ('password', 'Ava', 'Rose', 'Anderson'),
    ('qwerty', 'James', 'William', 'Martinez'),
    ('secret123', 'Charlotte', 'Olivia', 'Garcia'),
    ('admin123', 'Mason', 'Alexander', 'Hernandez'),
    ('letmein', 'Amelia', 'Isabella', 'Lopez'),
    ('hello123', 'Benjamin', 'Ethan', 'Perez');

CREATE TABLE IF NOT EXISTS Courses(
    Course_ID INTEGER PRIMARY KEY AUTOINCREMENT,
    Course_Name VARCHAR(100)
);

INSERT INTO Courses (Course_Name)
VALUES
    ('Introduction to Computer Science'),
    ('Data Structures and Algorithms'),
    ('Database Management Systems'),
    ('Software Engineering'),
    ('Operating Systems'),
    ('Web Development'),
    ('Machine Learning'),
    ('Computer Networks'),
    ('Cybersecurity Fundamentals'),
    ('Marketing'),
    ('Services'),
    ('Human Resources'),
    ('Engineering'),
    ('Product Management'),
    ('Accounting'),
    ('Services'),
    ('Product Management'),
    ('Accounting'),
    ('Product Management'),
    ('Human Resources'),
    ('Product Management'),
    ('Services'),
    ('Sales'),
    ('Artificial Intelligence');


CREATE TABLE IF NOT EXISTS Professors(
    Professor_ID INTEGER PRIMARY KEY AUTOINCREMENT,
    User_ID INT,
    Email VARCHAR(70) UNIQUE NOT NULL,
    First_Name VARCHAR(15),
    Last_Name VARCHAR(20),
    Course_ID INT,
    FOREIGN KEY (User_ID) REFERENCES Users(User_ID) ON DELETE CASCADE,
    FOREIGN KEY (Course_ID) REFERENCES Courses(Course_ID)
);

INSERT INTO Professors (User_ID, Email, First_Name, Last_Name, Course_ID)
VALUES (1, 'dnaewburyt@walmart.com', 'Dulciana', 'Newbury', 1),
        (2, 'asoftleys@google.com.hk', 'Arlette', 'Softley', 2),
        (3, 'jelcottr@ucoz.com', 'Jackson', 'Elcott', 3),
        (4, 'coxberryq@unc.edu', 'Clarinda', 'Oxberry', 4),
       (5, 'bmillsp@alibaba.com', 'Brooke', 'Mills', 5),
       (6, 'srougiero@yandex.ru', 'Sutherland', 'Rougier', 6),
       (7, 'imontezn@wp.com', 'Iris', 'Montez', 7),
       (8, 'tlazerm@bloomberg.com', 'Tatiania', 'Lazer', 8),
       (9, 'osandhilll@aboutads.info', 'Ortensia', 'Sandhill', 9),
       (10, 'mbowndek@bing.com', 'Marybelle', 'Bownde', 10),
       (11, 'nayscoughj@globo.com', 'Nonna', 'Ayscough', 11),
       (12, 'bguerrini@bluehost.com', 'Beau', 'Guerrin', 12),
       (13, 'cneichoh@java.com', 'Cayla', 'Neicho', 13),
       (14, 'cpennig@apache.org', 'Clarie', 'Penni', 14),
       (15, 'lbiaggiottif@nifty.com', 'Laurel', 'Biaggiotti', 15),
       (16, 'ncunnahe@apache.org', 'Nerta', 'Cunnah', 16),
       (17, 'tkondratd@msu.edu', 'Teodora', 'Kondrat', 17),
       (18, 'ccradickc@msu.edu', 'Constance', 'Cradick', 18),
       (19, 'qearleb@qq.com', 'Quinton', 'Earle', 19),
       (20, 'lreardena@reference.com', 'Lydia', 'Rearden', 20),
       (21, 'cgrafham9@shop-pro.jp', 'Christa', 'Grafham', 21),
       (22, 'sshippam8@telegraph.co.uk', 'Sheilakathryn', 'Shippam', 22),
       (23, 'bstable7@de.vu', 'Brandyn', 'Stable', 23),
       (24, 'jtraite6@forbes.com', 'Josh', 'Traite', 24),
       (25, 'rdo5@google.cn', 'Rickie', 'Do', 25),
       (26, 'ydo4@blogger.com', 'Yehudit', 'Do', 26),
       (27, 'msandbatch3@tripadvisor.com', 'Morly', 'Sandbatch', 27),
       (28, 'arediers2@youtube.com', 'Alana', 'Rediers', 28),
       (29, 'jpudney1@sciencedaily.com', 'Johnny', 'Pudney', 29),
       (30, 'ahunday0@discuz.net', 'Alair', 'Hunday', 30),
       (31, 'dnewburyt@walmart.com', 'Dulciana', 'Newbury', 31),
       (32, 'asoftleys@google.com', 'Arlette', 'Softley', 32),
       (33, 'jelcottr@ucoz.com', 'Jackson', 'Elcott', 33),
       (34, 'coxberryq@unc.edu', 'Clarinda', 'Oxberry', 34),
       (35, 'bmillsp@alibaba.com', 'Brooke', 'Mills', 35),
       (36, 'srougiero@yandex.ru', 'Sutherland', 'Rougier', 36),
       (37, 'imontezn@wp.com', 'Iris', 'Montez', 37),
       (38, 'tlazerm@bloomberg.com', 'Tatiania', 'Lazer', 38),
       (39, 'osandhilll@aboutads.info', 'Ortensia', 'Sandhill', 39),
       (40, 'mbowndek@bing.com', 'Marybelle', 'Bownde', 40),
       (41, 'nayscoughj@globo.com', 'Nonna', 'Ayscough', 41),
       (42, 'bguerrini@bluehost.com', 'Beau', 'Guerrin', 42),
       (43, 'cneichoh@java.com', 'Cayla', 'Neicho', 43),
       (44, 'cpennig@apache.org', 'Clarie', 'Penni', 44);


CREATE TABLE IF NOT EXISTS TAs(
    TA_ID INTEGER PRIMARY KEY AUTOINCREMENT,
    User_ID INT,
    First_Name VARCHAR(15),
    Last_Name VARCHAR(20),
    Email VARCHAR(70) UNIQUE,
    Professor_ID INT,
    FOREIGN KEY (User_ID) REFERENCES Users(User_ID),
    FOREIGN KEY (Professor_ID) REFERENCES Professors(Professor_ID)
);

INSERT INTO TAs (User_ID, First_Name, Last_Name, Email, Professor_ID)
VALUES
    (91, 'Emma', 'Smith', 'emma.smith@example.com', 1),
    (92, 'James', 'Johnson', 'james.johnson@example.com', 2),
    (93, 'Olivia', 'Williams', 'olivia.williams@example.com', 3),
    (94, 'William', 'Brown', 'william.brown@example.com', 4),
    (95, 'Sophia', 'Jones', 'sophia.jones@example.com', 5),
    (96, 'Liam', 'Miller', 'liam.miller@example.com', 6),
    (97, 'Isabella', 'Davis', 'isabella.davis@example.com', 7),
    (98, 'Michael', 'Garcia', 'michael.garcia@example.com', 8),
    (99, 'Ethan', 'Rodriguez', 'ethan.rodriguez@example.com', 9),
    (100, 'Ava', 'Martinez', 'ava.martinez@example.com', 10),
    (101, 'Charlotte', 'Hernandez', 'charlotte.hernandez@example.com', 11),
    (102, 'Mason', 'Lopez', 'mason.lopez@example.com', 12),
    (103, 'Amelia', 'Gonzalez', 'amelia.gonzalez@example.com', 13),
    (104, 'Liam', 'Perez', 'liam.perez@example.com', 14),
    (105, 'Emma', 'Sanchez', 'emma.sanchez@example.com', 15),
    (106, 'Aiden', 'Adams', 'aiden.adams@example.com', 16),
    (107, 'Olivia', 'Nelson', 'olivia.nelson@example.com', 17),
    (108, 'Lucas', 'Carter', 'lucas.carter@example.com', 18),
    (109, 'Avery', 'Smith', 'avery.smith@example.com', 19),
    (110, 'Sophia', 'Taylor', 'sophia.taylor@example.com', 20),
    (111, 'Jackson', 'Gonzalez', 'jackson.gonzalez@example.com', 21),
    (112, 'Ella', 'Anderson', 'ella.anderson@example.com', 22),
    (113, 'Logan', 'Thomas', 'logan.thomFas@example.com', 23),
    (114, 'Aria', 'Jackson', 'aria.jackson@example.com', 24),
    (115, 'Liam', 'White', 'liam.white@example.com', 25),
    (116, 'Sophia', 'Harris', 'sophia.harris@example.com', 26),
    (117, 'Noah', 'Clark', 'noah.clark@example.com', 27),
    (118, 'Ava', 'Lewis', 'ava.lewis@example.com', 28),
    (119, 'William', 'Allen', 'william.allen@example.com', 29),
    (120, 'Ethan', 'Carter', 'ethan.carter@example.com', 30);


CREATE TABLE IF NOT EXISTS Administrator(
    Admin_ID INTEGER PRIMARY KEY AUTOINCREMENT,
    Email VARCHAR(70),
    First_Name VARCHAR(15),
    Middle_Name VARCHAR(20),
    Last_Name VARCHAR(20)
);

INSERT INTO Administrator (Email, First_Name, Middle_Name, Last_Name)
VALUES
    ('admin1@example.com', 'John', 'Robert', 'Doe'),
    ('admin2@example.com', 'Emily', 'Anne', 'Smith'),
    ('admin3@example.com', 'Michael', 'James', 'Johnson'),
    ('admin4@example.com', 'Jennifer', 'Marie', 'Brown'),
    ('admin5@example.com', 'William', 'David', 'Miller'),
    ('admin6@example.com', 'Jessica', 'Elizabeth', 'Wilson'),
    ('admin7@example.com', 'David', 'Joseph', 'Taylor'),
    ('admin8@example.com', 'Sarah', 'Nicole', 'Anderson'),
    ('admin9@example.com', 'James', 'Daniel', 'Martinez'),
    ('admin10@example.com', 'Ashley', 'Michelle', 'Garcia'),
    ('admin11@example.com', 'Christopher', 'Ryan', 'Hernandez'),
    ('admin12@example.com', 'Amanda', 'Kimberly', 'Lopez'),
    ('admin13@example.com', 'Matthew', 'Thomas', 'Gonzalez'),
    ('admin14@example.com', 'Brittany', 'Samantha', 'Perez'),
    ('admin15@example.com', 'Andrew', 'Charles', 'Wilson'),
    ('admin16@example.com', 'Stephanie', 'Rebecca', 'Sanchez'),
    ('admin17@example.com', 'Justin', 'Tyler', 'Adams'),
    ('admin18@example.com', 'Jessica', 'Danielle', 'Nelson'),
    ('admin19@example.com', 'Brandon', 'Eric', 'Clark'),
    ('admin20@example.com', 'Elizabeth', 'Amy', 'Lewis'),
    ('admin21@example.com', 'Daniel', 'Anthony', 'Allen'),
    ('admin22@example.com', 'Samantha', 'Victoria', 'Young'),
    ('admin23@example.com', 'Kevin', 'John', 'Wright'),
    ('admin24@example.com', 'Lauren', 'Mary', 'King'),
    ('admin25@example.com', 'Robert', 'Joshua', 'Evans'),
    ('admin26@example.com', 'Maria', 'Karen', 'Robinson'),
    ('admin27@example.com', 'Joshua', 'Brandon', 'Scott'),
    ('admin28@example.com', 'Michelle', 'Donna', 'Walker'),
    ('admin29@example.com', 'Brian', 'Paul', 'Hall'),
    ('admin30@example.com', 'Melissa', 'Cynthia', 'Young');

CREATE TABLE IF NOT EXISTS Student(
    Student_ID INTEGER PRIMARY KEY AUTOINCREMENT,
    User_ID INT,
    First_Name VARCHAR(15),
    Middle_Name VARCHAR(20),
    Last_Name VARCHAR(20),
    Appt_ID INT,
    Time DATETIME,
    FOREIGN KEY (User_ID) REFERENCES Users(User_ID)
);
INSERT INTO Student (User_ID, First_Name, Middle_Name, Last_Name, Appt_ID, Time)
VALUES
    (1, 'John', 'Michael', 'Doe', 101, '2024-04-21 08:00:00'),
    (2, 'Jane', 'Elizabeth', 'Smith', 102, '2024-04-21 09:00:00'),
    (3, 'David', 'Robert', 'Johnson', 103, '2024-04-21 10:00:00'),
    (4, 'Emily', 'Anne', 'Williams', 104, '2024-04-21 11:00:00'),
    (5, 'Michael', 'James', 'Brown', 105, '2024-04-21 12:00:00'),
    (6, 'Jessica', 'Marie', 'Davis', 106, '2024-04-21 13:00:00'),
    (7, 'Matthew', 'William', 'Miller', 107, '2024-04-21 14:00:00'),
    (8, 'Sarah', 'Nicole', 'Wilson', 108, '2024-04-21 15:00:00'),
    (9, 'Daniel', 'Thomas', 'Taylor', 109, '2024-04-21 16:00:00'),
    (10, 'Olivia', 'Grace', 'Martinez', 110, '2024-04-21 17:00:00'),
    (11, 'Ava', 'Elizabeth', 'Garcia', 111, '2024-04-22 09:00:00'),
    (12, 'William', 'Joseph', 'Hernandez', 112, '2024-04-22 10:00:00'),
    (13, 'Isabella', 'David', 'Lopez', 113, '2024-04-22 11:00:00'),
    (14, 'James', 'Andrew', 'Gonzalez', 114, '2024-04-22 12:00:00'),
    (15, 'Sophia', 'Christopher', 'Martinez', 115, '2024-04-22 13:00:00'),
    (16, 'Michael', 'Mary', 'Brown', 116, '2024-04-22 14:00:00'),
    (17, 'Charlotte', 'Jacob', 'Clark', 117, '2024-04-22 15:00:00'),
    (18, 'Mason', 'Noah', 'Rodriguez', 118, '2024-04-22 16:00:00'),
    (19, 'Amelia', 'Daniel', 'Lewis', 119, '2024-04-22 17:00:00'),
    (20, 'Harper', 'Liam', 'Lee', 120, '2024-04-23 09:00:00'),
    (21, 'Ethan', 'Alexander', 'Walker', 121, '2024-04-23 10:00:00'),
    (22, 'Evelyn', 'Ryan', 'Perez', 122, '2024-04-23 11:00:00'),
    (23, 'Abigail', 'Jason', 'Harris', 123, '2024-04-23 12:00:00'),
    (24, 'Alexander', 'Carter', 'Young', 124, '2024-04-23 13:00:00'),
    (25, 'Daniel', 'Charles', 'Allen', 125, '2024-04-23 14:00:00'),
    (26, 'Ella', 'Nathan', 'Hall', 126, '2024-04-23 15:00:00'),
    (27, 'Scarlett', 'Anthony', 'Scott', 127, '2024-04-23 16:00:00'),
    (28, 'Grace', 'Paul', 'Green', 128, '2024-04-23 17:00:00'),
    (29, 'Logan', 'David', 'Adams', 129, '2024-04-24 09:00:00'),
    (30, 'David', 'Jonathan', 'Baker', 130, '2024-04-24 10:00:00'),
    (31, 'Jackson', 'Kenneth', 'Gonzalez', 131, '2024-04-24 11:00:00'),
    (32, 'Penelope', 'Timothy', 'Nelson', 132, '2024-04-24 12:00:00'),
    (33, 'Sophie', 'Paul', 'Campbell', 133, '2024-04-24 13:00:00'),
    (34, 'Luke', 'Brian', 'Mitchell', 134, '2024-04-24 14:00:00'),
    (35, 'Levi', 'Kevin', 'Roberts', 135, '2024-04-24 15:00:00'),
    (36, 'Nora', 'Justin', 'Carter', 136, '2024-04-24 16:00:00'),
    (37, 'Zoey', 'Ronald', 'Phillips', 137, '2024-04-24 17:00:00'),
    (38, 'Avery', 'Jose', 'Evans', 138, '2024-04-25 09:00:00'),
    (39, 'Benjamin', 'Gary', 'Collins', 139, '2024-04-25 10:00:00'),
    (40, 'Hudson', 'Jeffrey', 'Parker', 140, '2024-04-25 11:00:00'),
    (41, 'Emma', 'Gregory', 'Edwards', 141, '2024-04-25 12:00:00'),
    (42, 'Aiden', 'Jerry', 'Stewart', 142, '2024-04-25 13:00:00'),
    (43, 'Liam', 'Dennis', 'Flores', 143, '2024-04-25 14:00:00'),
    (44, 'Aria', 'Jerry', 'Morris', 144, '2024-04-25 15:00:00'),
    (45, 'Eli', 'Frank', 'Nguyen', 145, '2024-04-25 16:00:00'),
    (46, 'Elena', 'Terry', 'Turner', 146, '2024-04-25 17:00:00'),
    (47, 'Mateo', 'Raymond', 'Cooper', 147, '2024-04-26 09:00:00'),
    (48, 'Hazel', 'John', 'Richardson', 148, '2024-04-26 10:00:00'),
    (49, 'Aurora', 'Henry', 'Wood', 149, '2024-04-26 11:00:00'),
    (50, 'Luna', 'Samuel', 'Watson', 150, '2024-04-26 12:00:00');

CREATE TABLE IF NOT EXISTS Manage(
    Admin_ID INT,
    User_ID INT,
    PRIMARY KEY (Admin_ID, User_ID),
    FOREIGN KEY (Admin_ID) REFERENCES Administrator(Admin_ID),
    FOREIGN KEY (User_ID) REFERENCES Users(User_ID)
);

INSERT INTO Manage (Admin_ID, User_ID)
VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5),
    (6, 6),
    (7, 7),
    (8, 8),
    (9, 9),
    (10, 10),
    (11, 11),
    (12, 12),
    (13, 13),
    (14, 14),
    (15, 15),
    (16, 16),
    (17, 17),
    (18, 18),
    (19, 19),
    (20, 20),
    (21, 21),
    (22, 22),
    (23, 23),
    (24, 24),
    (25, 25),
    (26, 26),
    (27, 27),
    (28, 28),
    (29, 29),
    (30, 30);

CREATE TABLE IF NOT EXISTS Approve_Access(
    Admin_ID INT,
    Course_ID INT,
    PRIMARY KEY (Admin_ID, Course_ID),
    FOREIGN KEY (Admin_ID) REFERENCES Administrator(Admin_ID),
    FOREIGN KEY (Course_ID) REFERENCES Courses(Course_ID)
);

INSERT INTO Approve_Access (Admin_ID, Course_ID)
VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5),
    (6, 6),
    (7, 7),
    (8, 8),
    (9, 9),
    (10, 10),
    (11, 11),
    (12, 12),
    (13, 13),
    (14, 14),
    (15, 15),
    (16, 16),
    (17, 17),
    (18, 18),
    (19, 19),
    (20, 20),
    (21, 21),
    (22, 22),
    (23, 23),
    (24, 24),
    (25, 25),
    (26, 26),
    (27, 27),
    (28, 28),
    (29, 29),
    (30, 30);


CREATE TABLE IF NOT EXISTS Monitor(
    Admin_ID INT,
    Event VARCHAR(30),
    User_ID INT,
    Time DATETIME,
    PRIMARY KEY (Admin_ID, Event),
    FOREIGN KEY (User_ID) REFERENCES Users(User_ID)
);

INSERT INTO Monitor (Admin_ID, Event, User_ID, Time)
VALUES
    (1, 'Login', 1, '2024-04-21 08:00:00'),
    (2, 'Logout', 2, '2024-04-21 08:30:00'),
    (3, 'Login', 3, '2024-04-21 09:00:00'),
    (4, 'Logout', 4, '2024-04-21 09:30:00'),
    (5, 'Login', 5, '2024-04-21 10:00:00'),
    (6, 'Logout', 6, '2024-04-21 10:30:00'),
    (7, 'Login', 7, '2024-04-21 11:00:00'),
    (8, 'Logout', 8, '2024-04-21 11:30:00'),
    (9, 'Login', 9, '2024-04-21 12:00:00'),
    (10, 'Logout', 10, '2024-04-21 12:30:00'),
    (11, 'Login', 11, '2024-04-21 13:00:00'),
    (12, 'Logout', 12, '2024-04-21 13:30:00'),
    (13, 'Login', 13, '2024-04-21 14:00:00'),
    (14, 'Logout', 14, '2024-04-21 14:30:00'),
    (15, 'Login', 15, '2024-04-21 15:00:00'),
    (16, 'Logout', 16, '2024-04-21 15:30:00'),
    (17, 'Login', 17, '2024-04-21 16:00:00'),
    (18, 'Logout', 18, '2024-04-21 16:30:00'),
    (19, 'Login', 19, '2024-04-21 17:00:00'),
    (20, 'Logout', 20, '2024-04-21 17:30:00'),
    (21, 'Login', 21, '2024-04-21 18:00:00'),
    (22, 'Logout', 22, '2024-04-21 18:30:00'),
    (23, 'Login', 23, '2024-04-21 19:00:00'),
    (24, 'Logout', 24, '2024-04-21 19:30:00'),
    (25, 'Login', 25, '2024-04-21 20:00:00'),
    (26, 'Logout', 26, '2024-04-21 20:30:00'),
    (27, 'Login', 27, '2024-04-21 21:00:00'),
    (28, 'Logout', 28, '2024-04-21 21:30:00'),
    (29, 'Login', 29, '2024-04-21 22:00:00'),
    (30, 'Logout', 30, '2024-04-21 22:30:00');


CREATE TABLE IF NOT EXISTS User_Activity(
    User_ID INT,
    Event VARCHAR(50),
    Course_ID INT,
    PRIMARY KEY (User_ID, Event),
    FOREIGN KEY (User_ID) REFERENCES Monitor(User_ID),
    FOREIGN KEY (Event) REFERENCES Monitor(Event) ON DELETE CASCADE
);

INSERT INTO User_Activity (User_ID, Event, Course_ID)
VALUES
    (1, 'Login', 1),
    (2, 'Logout', 2),
    (3, 'Login', 3),
    (4, 'Logout', 4),
    (5, 'Login', 5),
    (6, 'Logout', 6),
    (7, 'Login', 7),
    (8, 'Logout', 8),
    (9, 'Login', 9),
    (10, 'Logout', 10),
    (11, 'Login', 11),
    (12, 'Logout', 12),
    (13, 'Login', 13),
    (14, 'Logout', 14),
    (15, 'Login', 15),
    (16, 'Logout', 16),
    (17, 'Login', 17),
    (18, 'Logout', 18),
    (19, 'Login', 19),
    (20, 'Logout', 20),
    (21, 'Login', 21),
    (22, 'Logout', 22),
    (23, 'Login', 23),
    (24, 'Logout', 24),
    (25, 'Login', 25),
    (26, 'Logout', 26),
    (27, 'Login', 27),
    (28, 'Logout', 28),
    (29, 'Login', 29),
    (30, 'Logout', 30),
    (31, 'Failed Login Attempt', NULL),
    (32, 'Unauthorized Access', 2),
    (33, 'Data Breach', 5),
    (34, 'Suspicious Activity Detected', 8),
    (35, 'Phishing Attempt', 10),
    (36, 'Malware Detected', 13),
    (37, 'Account Hijacking', 17),
    (38, 'Unauthorized File Access', 20),
    (39, 'Brute Force Attack', 23),
    (40, 'SQL Injection', 25);

CREATE TABLE IF NOT EXISTS Assist(
    TA_ID INT,
    Course_ID INT,
    PRIMARY KEY (TA_ID, Course_ID),
    FOREIGN KEY (TA_ID) REFERENCES TAs(TA_ID),
    FOREIGN KEY (Course_ID) REFERENCES Courses(Course_ID)
);

INSERT INTO Assist (TA_ID, Course_ID)
VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5),
    (6, 6),
    (7, 7),
    (8, 8),
    (9, 9),
    (10, 10),
    (11, 11),
    (12, 12),
    (13, 13),
    (14, 14),
    (15, 15),
    (16, 16),
    (17, 17),
    (18, 18),
    (19, 19),
    (20, 20),
    (21, 21),
    (22, 22),
    (23, 23),
    (24, 24),
    (25, 25),
    (26, 26),
    (27, 27),
    (28, 28),
    (29, 29),
    (30, 30);


CREATE TABLE IF NOT EXISTS Enroll(
    Course_ID INT,
    Student_ID INT,
    Grade VARCHAR(3),
    PRIMARY KEY (Course_ID, Student_ID),
    FOREIGN KEY (Course_ID) REFERENCES Courses(Course_ID),
    FOREIGN KEY (Student_ID) REFERENCES Student(Student_ID)
);

INSERT INTO Enroll (Course_ID, Student_ID, Grade)
VALUES
    (1, 1, 'A'),
    (1, 2, 'B'),
    (2, 3, 'B+'),
    (2, 4, 'A-'),
    (3, 5, 'C'),
    (3, 6, 'A'),
    (4, 7, 'B'),
    (4, 8, 'C+'),
    (5, 9, 'A-'),
    (5, 10, 'B'),
    (6, 11, 'A'),
    (6, 12, 'B'),
    (7, 13, 'B+'),
    (7, 14, 'C'),
    (8, 15, 'A'),
    (8, 16, 'B-'),
    (9, 17, 'A'),
    (9, 18, 'B'),
    (10, 19, 'B+'),
    (10, 20, 'C'),
    (11, 21, 'A-'),
    (11, 22, 'B'),
    (12, 23, 'A'),
    (12, 24, 'C'),
    (13, 25, 'A'),
    (13, 26, 'B+'),
    (14, 27, 'B'),
    (14, 28, 'B'),
    (15, 29, 'A'),
    (15, 30, 'B'),
    (16, 31, 'B+'),
    (16, 32, 'C');


CREATE TABLE IF NOT EXISTS URL(
    URL_ID INT PRIMARY KEY,
    URL_Link VARCHAR(70)
);

INSERT INTO URL (URL_ID, URL_Link)
VALUES
    (1, 'https://www.example.com/home'),
    (2, 'https://www.example.com/about'),
    (3, 'https://www.example.com/contact'),
    (4, 'https://www.example.com/products'),
    (5, 'https://www.example.com/services'),
    (6, 'https://www.example.com/blog'),
    (7, 'https://www.example.com/portfolio'),
    (8, 'https://www.example.com/gallery'),
    (9, 'https://www.example.com/faq'),
    (10, 'https://www.example.com/testimonials'),
    (11, 'https://www.example.com/pricing'),
    (12, 'https://www.example.com/login'),
    (13, 'https://www.example.com/signup'),
    (14, 'https://www.example.com/subscribe'),
    (15, 'https://www.example.com/dashboard'),
    (16, 'https://www.example.com/settings'),
    (17, 'https://www.example.com/profile'),
    (18, 'https://www.example.com/search'),
    (19, 'https://www.example.com/downloads'),
    (20, 'https://www.example.com/terms');


CREATE TABLE IF NOT EXISTS Materials(
    Material_ID INT PRIMARY KEY,
    Course_ID INT,
    Type VARCHAR(10),
    Description TEXT,
    URL_ID INT,
    FOREIGN KEY (Course_ID) REFERENCES Courses(Course_ID),
    FOREIGN KEY (URL_ID) REFERENCES URL(URL_ID)
);

INSERT INTO Materials (Material_ID, Course_ID, Type, Description, URL_ID)
VALUES
    (1, 1, 'Video', 'Introduction to Computer Science Lecture 1', 1),
    (2, 1, 'PDF', 'Course Syllabus', 2),
    (3, 2, 'Video', 'Data Structures and Algorithms Lecture 1', 3),
    (4, 2, 'PDF', 'Course Assignments', 4),
    (5, 3, 'Video', 'Database Management Systems Lecture 1', 5),
    (6, 3, 'PDF', 'Database Design Notes', 6),
    (7, 4, 'Video', 'Software Engineering Lecture 1', 7),
    (8, 4, 'PDF', 'Project Guidelines', 8),
    (9, 5, 'Video', 'Operating Systems Lecture 1', 9),
    (10, 5, 'PDF', 'Operating Systems Lab Manual', 10),
    (11, 6, 'Video', 'Web Development Lecture 1', 11),
    (12, 6, 'PDF', 'HTML Basics', 12),
    (13, 7, 'Video', 'Machine Learning Lecture 1', 13),
    (14, 7, 'PDF', 'Machine Learning Algorithms', 14),
    (15, 8, 'Video', 'Computer Networks Lecture 1', 15),
    (16, 8, 'PDF', 'Network Security Guide', 16),
    (17, 9, 'Video', 'Cybersecurity Fundamentals Lecture 1', 17),
    (18, 9, 'PDF', 'Cybersecurity Case Studies', 18),
    (19, 10, 'Video', 'Marketing Basics Lecture 1', 19),
    (20, 10, 'PDF', 'Marketing Strategies', 20),
    (21, 11, 'Quiz', 'Quiz 1 - Introduction to Artificial Intelligence', 21),
    (22, 11, 'Presentation', 'Presentation Slides - Neural Networks', 22),
    (23, 12, 'Code', 'Python Code Examples - Data Visualization', 23),
    (24, 12, 'Text', 'Textbook - Introduction to Statistics', 24),
    (25, 13, 'Article', 'Research Article - Applications of Natural Language Processing', 25),
    (26, 13, 'Worksheet', 'Practice Worksheet - Sentiment Analysis', 26),
    (27, 14, 'Demo', 'Demo Video - Introduction to Robotics', 27),
    (28, 14, 'Workbook', 'Workbook - Robot Design Challenges', 28),
    (29, 15, 'Tutorial', 'Tutorial Video - Quantum Computing Basics', 29),
    (30, 15, 'Manual', 'User Manual - Quantum Circuit Simulator', 30),
    (31, 16, 'Case Study', 'Case Study - Real-world Applications of Blockchain', 31),
    (32, 16, 'Report', 'Research Report - Blockchain Security Analysis', 32),
    (33, 17, 'Interactive', 'Interactive Simulation - Virtual Reality in Education', 33),
    (34, 17, 'Guide', 'Beginner''s Guide - Unity Game Development', 34),
    (35, 18, 'Worksheet', 'Problem Set - Discrete Mathematics', 35),
    (36, 18, 'Review', 'Review Notes - Graph Theory', 36),
    (37, 19, 'Video', 'Video Lecture - Introduction to Linguistics', 37),
    (38, 19, 'Book', 'Textbook - The Study of Language', 38),
    (39, 20, 'Code', 'Java Code Examples - Object-Oriented Programming', 39),
    (40, 20, 'Text', 'Textbook - Data Structures and Algorithms', 40);

CREATE TABLE IF NOT EXISTS Provide_Access(
    Admin_ID INT,
    Material_ID INT,
    PRIMARY KEY (Admin_ID, Material_ID),
    FOREIGN KEY (Admin_ID) REFERENCES Administrator(Admin_ID),
    FOREIGN KEY (Material_ID) REFERENCES Materials(Material_ID)
);

INSERT INTO Provide_Access (Admin_ID, Material_ID)
VALUES
    (1, 1),
    (2, 3),
    (3, 5),
    (4, 7),
    (5, 9),
    (6, 11),
    (7, 13),
    (8, 15),
    (9, 17),
    (10, 19),
    (11, 21),
    (12, 23),
    (13, 25),
    (14, 27),
    (15, 29);


CREATE TABLE IF NOT EXISTS Progress(
                                       Progress_ID INTEGER PRIMARY KEY AUTOINCREMENT,
                                       Progress_Rate INT,
                                       Course_ID INT,
                                       Student_ID INT,
                                       FOREIGN KEY (Course_ID) REFERENCES Courses(Course_ID),
                                       FOREIGN KEY (Student_ID) REFERENCES Student(Student_ID)
);

INSERT INTO Progress (Progress_Rate, Course_ID, Student_ID)
VALUES
CREATE TABLE IF NOT EXISTS Progress(
                                       Progress_Rate INTEGER PRIMARY KEY,
                                       Course_ID INT,
                                       Student_ID INT,
                                       FOREIGN KEY (Course_ID) REFERENCES Courses(Course_ID),
                                       FOREIGN KEY (Student_ID) REFERENCES Student(Student_ID)
);

INSERT INTO Progress (Progress_Rate, Course_ID, Student_ID)
VALUES
    (1, 1, 1),
    (2, 2, 2),
    (3, 3, 3),
    (4, 4, 4),
    (5, 5, 5),
    (6, 6, 6),
    (7, 7, 7),
    (8, 8, 8),
    (9, 9, 9),
    (10, 10, 10),
    (11, 11, 11),
    (12, 12, 12),
    (13, 13, 13),
    (14, 14, 14),
    (15, 15, 15),
    (16, 16, 16),
    (17, 17, 17),
    (18, 18, 18),
    (19, 19, 19),
    (20, 20, 20),
    (21, 21, 21),
    (22, 22, 22),
    (23, 23, 23),
    (24, 24, 24),
    (25, 25, 25),
    (26, 26, 26),
    (27, 27, 27),
    (28, 28, 28),
    (29, 29, 29),
    (30, 30, 30);




CREATE TABLE IF NOT EXISTS Assignments(
    Assignment_ID INTEGER PRIMARY KEY AUTOINCREMENT,
    Course_ID INT,
    Description VARCHAR(300),
    Grade VARCHAR(3),
    Progress_Rate INT,
    Due_Date DATE,
    FOREIGN KEY (Course_ID) REFERENCES Courses(Course_ID) ON DELETE CASCADE,
    FOREIGN KEY (Progress_Rate) REFERENCES Progress(Progress_Rate)
);

INSERT INTO Assignments (Course_ID, Description, Grade, Progress_Rate, Due_Date) VALUES
    (1, 'Complete Chapter 1 Exercises', 'A', 75, '2024-05-01'),
    (2, 'Research Paper on Data Structures', 'B', 78, '2024-05-10'),
    (3, 'Database Design Project', 'C', 72, '2024-05-15'),
    (4, 'Software Development Assignment', 'B+', 77, '2024-05-20'),
    (5, 'Operating Systems Quiz', 'A-', 76, '2024-05-25'),
    (6, 'Web Development Project', 'B', 79, '2024-06-01'),
    (7, 'Machine Learning Assignment', 'A', 85, '2024-06-05'),
    (8, 'Computer Networks Lab', 'C', 73, '2024-06-10'),
    (9, 'Cybersecurity Research Paper', 'B+', 77, '2024-06-15'),
    (10, 'Marketing Case Study', 'A-', 76, '2024-06-20'),
    (11, 'Engineering Design Project', 'B', 78, '2024-06-25'),
    (12, 'Product Management Presentation', 'A', 82, '2024-07-01'),
    (13, 'Accounting Quiz', 'C+', 70, '2024-07-05'),
    (14, 'Human Resources Report', 'B-', 74, '2024-07-10'),
    (15, 'Sales Proposal', 'A', 80, '2024-07-15'),
    (16, 'Artificial Intelligence Assignment', 'B+', 77, '2024-07-20'),
    (17, 'Data Analysis Project', 'A-', 76, '2024-07-25'),
    (18, 'Software Engineering Task', 'B', 79, '2024-07-30'),
    (19, 'Database Optimization Assignment', 'A', 85, '2024-08-01'),
    (20, 'Web Development Assignment', 'B', 78, '2024-08-05'),
    (21, 'Marketing Campaign Plan', 'A-', 76, '2024-08-10'),
    (22, 'Operating Systems Project', 'B+', 77, '2024-08-15'),
    (23, 'Machine Learning Research Paper', 'A', 82, '2024-08-20'),
    (24, 'Computer Networks Assignment', 'C+', 70, '2024-08-25'),
    (25, 'Cybersecurity Presentation', 'B-', 74, '2024-08-30'),
    (26, 'Marketing Analysis Project', 'A', 83, '2024-09-05'),
    (27, 'Engineering Design Presentation', 'B', 78, '2024-09-10'),
    (28, 'Product Management Case Study', 'A-', 76, '2024-09-15'),
    (29, 'Accounting Problem Set', 'B', 79, '2024-09-20'),
    (30, 'Human Resources Interview', 'A', 85, '2024-09-25'),
    (31, 'Sales Pitch', 'B+', 77, '2024-10-01'),
    (32, 'Artificial Intelligence Project', 'A', 82, '2024-10-05'),
    (33, 'Data Mining Assignment', 'C+', 70, '2024-10-10'),
    (34, 'Software Development Task', 'B-', 74, '2024-10-15'),
    (35, 'Database Management Quiz', 'A', 80, '2024-10-20');


CREATE TABLE IF NOT EXISTS Discussion(
    Content TEXT PRIMARY KEY,
    Course_ID INT,
    Student_ID INT,
    Title VARCHAR(50),
    Time TIME,
    FOREIGN KEY (Course_ID) REFERENCES Courses(Course_ID),
    FOREIGN KEY (Student_ID) REFERENCES Student(Student_ID)
);

INSERT INTO Discussion (Content, Course_ID, Student_ID, Title, Time)
VALUES
    ('Discussing the importance of web security', 1, 1, 'Web Security Discussion', '15:30:00'),
    ('Sharing insights on machine learning algorithms', 7, 5, 'Machine Learning Algorithms Discussion', '14:45:00'),
    ('Debating the future of artificial intelligence', 20, 10, 'Future of AI Discussion', '10:00:00'),
    ('Exploring the challenges of data visualization', 2, 2, 'Data Visualization Challenges', '11:30:00'),
    ('Analyzing case studies in marketing strategies', 19, 15, 'Marketing Case Studies', '13:00:00'),
    ('Discussing recent advancements in cybersecurity', 9, 8, 'Cybersecurity Advancements', '16:15:00'),
    ('Sharing experiences with software development tools', 4, 4, 'Software Development Tools Discussion', '09:45:00'),
    ('Exploring best practices in database optimization', 3, 3, 'Database Optimization Best Practices', '12:00:00'),
    ('Debating the impact of social media on society', 18, 14, 'Social Media Impact Discussion', '10:30:00'),
    ('Discussing ethical considerations in AI development', 20, 10, 'Ethical AI Development', '14:00:00'),
    ('Sharing insights on data storage solutions', 6, 6, 'Data Storage Solutions Discussion', '16:30:00'),
    ('Analyzing trends in web development frameworks', 5, 5, 'Web Development Frameworks Analysis', '11:00:00'),
    ('Discussing challenges in operating system design', 8, 7, 'Operating System Design Challenges', '12:30:00'),
    ('Exploring case studies in product management', 11, 11, 'Product Management Case Studies', '15:00:00'),
    ('Debating the role of HR in organizational culture', 12, 12, 'HR and Organizational Culture', '09:30:00'),
    ('Sharing experiences with cloud computing platforms', 13, 13, 'Cloud Computing Platforms Discussion', '13:45:00'),
    ('Discussing the future of blockchain technology', 14, 15, 'Future of Blockchain Discussion', '11:15:00'),
    ('Analyzing recent trends in e-commerce', 15, 16, 'E-commerce Trends Analysis', '14:30:00'),
    ('Debating the effectiveness of online advertising', 16, 17, 'Online Advertising Effectiveness', '10:45:00'),
    ('Exploring challenges in software testing methodologies', 17, 18, 'Software Testing Challenges', '16:00:00'),
    ('Discussing innovations in IoT technology', 18, 19, 'IoT Innovations Discussion', '12:15:00'),
    ('Sharing insights on mobile app development frameworks', 19, 20, 'Mobile App Development Frameworks', '15:30:00'),
    ('Analyzing case studies in project management', 20, 21, 'Project Management Case Studies', '09:00:00'),
    ('Discussing challenges in machine translation', 21, 22, 'Machine Translation Challenges', '13:15:00'),
    ('Debating the future of virtual reality technology', 22, 23, 'Future of VR Technology Discussion', '10:30:00'),
    ('Exploring the role of AI in healthcare', 23, 24, 'AI in Healthcare Discussion', '14:45:00'),
    ('Sharing experiences with agile software development', 24, 25, 'Agile Development Experiences', '11:00:00'),
    ('Discussing challenges in big data analytics', 25, 26, 'Big Data Analytics Challenges', '15:15:00'),
    ('Analyzing recent trends in digital marketing', 26, 27, 'Digital Marketing Trends Analysis', '09:30:00'),
    ('Debating the impact of technology on education', 27, 28, 'Technology and Education Debate', '13:45:00'),
    ('Exploring the role of UX design in product development', 28, 29, 'UX Design and Product Development', '10:00:00'),
    ('Sharing insights on cloud security best practices', 29, 30, 'Cloud Security Best Practices Discussion', '14:15:00'),
    ('Discussing challenges in DevOps implementation', 30, 31, 'DevOps Implementation Challenges', '11:30:00');

CREATE TABLE IF NOT EXISTS Participation(
    Course_ID INT,
    Student_ID INT,
    Participation_Stats INT,
    PRIMARY KEY (Course_ID, Student_ID),
    FOREIGN KEY (Course_ID) REFERENCES Discussion(Course_ID),
    FOREIGN KEY (Student_ID) REFERENCES Discussion(Student_ID)
);
INSERT INTO Participation (Course_ID, Student_ID, Participation_Stats)
VALUES
   (1, 1, 80),
   (1, 2, 75),
   (1, 3, 90),
   (2, 4, 85),
   (2, 5, 70),
   (2, 6, 95),
   (3, 7, 78),
   (3, 8, 82),
   (3, 9, 88),
   (4, 10, 91),
   (4, 11, 73),
   (4, 12, 84),
   (5, 13, 79),
   (5, 14, 87),
   (5, 15, 92),
   (6, 16, 76),
   (6, 17, 83),
   (6, 18, 89),
   (7, 19, 81),
   (7, 20, 94),
   (7, 21, 77),
   (8, 22, 86),
   (8, 23, 93),
   (8, 24, 72),
   (9, 25, 80),
   (9, 26, 75),
   (9, 27, 90),
   (10, 28, 85),
   (10, 29, 70),
   (10, 30, 95);


CREATE TABLE IF NOT EXISTS Grade(
    Grade_ID INT PRIMARY KEY,
    Course_ID INT,
    Score INT,
    Student_ID INT,
    Feedback TEXT,
    Assignment_ID INT,
    FOREIGN KEY (Course_ID) REFERENCES Courses(Course_ID),
    FOREIGN KEY (Student_ID) REFERENCES Student(Student_ID),
    FOREIGN KEY (Assignment_ID) REFERENCES Assignments(Assignment_ID)
);

INSERT INTO Grade (Grade_ID, Course_ID, Score, Student_ID, Feedback, Assignment_ID)
VALUES
    (1, 1, 85, 1, 'Good work overall.', 1),
    (2, 1, 92, 2, 'Excellent effort!', 2),
    (3, 2, 78, 3, 'Some improvements needed.', 3),
    (4, 2, 90, 4, 'Well done!', 4),
    (5, 3, 88, 5, 'Very good performance.', 5),
    (6, 3, 94, 6, 'Outstanding work!', 6),
    (7, 4, 82, 7, 'Solid effort.', 7),
    (8, 4, 89, 8, 'Great job!', 8),
    (9, 5, 91, 9, 'Excellent work!', 9),
    (10, 5, 75, 10, 'Some areas need improvement.', 10),
    (11, 6, 84, 11, 'Good effort overall.', 11),
    (12, 6, 83, 12, 'Almost there, keep it up!', 12),
    (13, 7, 79, 13, 'Well done!', 13),
    (14, 7, 86, 14, 'Impressive performance.', 14),
    (15, 8, 88, 15, 'Very good effort.', 15),
    (16, 8, 93, 16, 'Excellent work!', 16),
    (17, 9, 81, 17, 'Good job!', 17),
    (18, 9, 90, 18, 'Great effort overall.', 18),
    (19, 10, 77, 19, 'Solid performance.', 19),
    (20, 10, 92, 20, 'Exceptional work!', 20),
    (21, 11, 85, 21, 'Well executed.', 21),
    (22, 11, 87, 22, 'Impressive!', 22),
    (23, 12, 89, 23, 'Very good effort.', 23),
    (24, 12, 94, 24, 'Outstanding performance!', 24),
    (25, 13, 82, 25, 'Good work overall.', 25),
    (26, 13, 90, 26, 'Excellent job!', 26),
    (27, 14, 88, 27, 'Great effort!', 27),
    (28, 14, 93, 28, 'Keep up the good work!', 28),
    (29, 15, 79, 29, 'Solid performance overall.', 29),
    (30, 15, 86, 30, 'Impressive effort!', 30);

CREATE TABLE IF NOT EXISTS Feedback(
                                       Feedback_ID INTEGER PRIMARY KEY AUTOINCREMENT,
                                       Message TEXT,
                                       Student_ID INT,
                                       TA_ID INT,
                                       Professor_ID INT,
                                       Time DATETIME,
                                       FOREIGN KEY (Student_ID) REFERENCES Student(Student_ID),
                                       FOREIGN KEY (TA_ID) REFERENCES TAs(TA_ID),
                                       FOREIGN KEY (Professor_ID) REFERENCES Professors(Professor_ID)
);

INSERT INTO Feedback (Message, Student_ID, TA_ID, Professor_ID, Time)
VALUES
    ('Great job on the assignment!', 1, 1, 1, '2024-04-21 08:30:00'),
    ('Keep up the good work!', 2, 2, 2, '2024-04-21 09:15:00'),
    ('Excellent effort!', 3, 3, 3, '2024-04-21 10:00:00'),
    ('Well done!', 4, 4, 4, '2024-04-21 10:45:00'),
    ('Impressive work!', 5, 5, 5, '2024-04-21 11:30:00'),
    ('Solid performance!', 6, 6, 6, '2024-04-21 12:15:00'),
    ('Good effort.', 7, 7, 7, '2024-04-21 13:00:00'),
    ('Great job!', 8, 8, 8, '2024-04-21 13:45:00'),
    ('Very good performance.', 9, 9, 9, '2024-04-21 14:30:00'),
    ('Impressive!', 10, 10, 10, '2024-04-21 15:15:00'),
    ('Outstanding work!', 11, 11, 11, '2024-04-21 16:00:00'),
    ('Excellent job!', 12, 12, 12, '2024-04-21 16:45:00'),
    ('Solid effort.', 13, 13, 13, '2024-04-21 17:30:00'),
    ('Good work overall.', 14, 14, 14, '2024-04-21 18:15:00'),
    ('Very good effort.', 15, 15, 15, '2024-04-21 19:00:00'),
    ('Impressive performance.', 16, 16, 16, '2024-04-21 19:45:00'),
    ('Well executed.', 17, 17, 17, '2024-04-21 20:30:00'),
    ('Excellent work!', 18, 18, 18, '2024-04-21 21:15:00'),
    ('Great effort!', 19, 19, 19, '2024-04-21 22:00:00'),
    ('Outstanding performance!', 20, 20, 20, '2024-04-21 22:45:00'),
    ('Good work overall.', 21, 21, 21, '2024-04-21 23:30:00'),
    ('Well done!', 22, 22, 22, '2024-04-22 00:15:00'),
    ('Excellent effort!', 23, 23, 23, '2024-04-22 01:00:00'),
    ('Great job!', 24, 24, 24, '2024-04-22 01:45:00'),
    ('Impressive work!', 25, 25, 25, '2024-04-22 02:30:00'),
    ('Solid performance!', 26, 26, 26, '2024-04-22 03:15:00'),
    ('Good effort overall.', 27, 27, 27, '2024-04-22 04:00:00'),
    ('Great job!!', 28, 28, 28, '2024-04-22 04:45:00'),
    ('Very good performance.', 29, 29, 29, '2024-04-22 05:30:00'),
    ('Impressive!!', 30, 30, 30, '2024-04-22 06:15:00');


