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

CREATE TABLE Appointments (
                              Appointment_ID INT,
                              TA_ID INT,
                              Student_ID INT,
                              Location VARCHAR(255)
);

INSERT INTO Appointments (Appointment_ID, TA_ID, Student_ID, Location) VALUES (0, 6, 18, 'Lake Jefftown');
INSERT INTO Appointments (Appointment_ID, TA_ID, Student_ID, Location) VALUES (1, 6, 11, 'East Lisa');
INSERT INTO Appointments (Appointment_ID, TA_ID, Student_ID, Location) VALUES (2, 4, 9, 'Jadeburgh');
INSERT INTO Appointments (Appointment_ID, TA_ID, Student_ID, Location) VALUES (3, 4, 23, 'Frazierberg');
INSERT INTO Appointments (Appointment_ID, TA_ID, Student_ID, Location) VALUES (4, 5, 7, 'Andreafort');
INSERT INTO Appointments (Appointment_ID, TA_ID, Student_ID, Location) VALUES (5, 8, 11, 'Marshallbury');
INSERT INTO Appointments (Appointment_ID, TA_ID, Student_ID, Location) VALUES (6, 8, 1, 'Brendaside');
INSERT INTO Appointments (Appointment_ID, TA_ID, Student_ID, Location) VALUES (7, 9, 3, 'Longtown');
INSERT INTO Appointments (Appointment_ID, TA_ID, Student_ID, Location) VALUES (8, 6, 5, 'Benderland');
INSERT INTO Appointments (Appointment_ID, TA_ID, Student_ID, Location) VALUES (9, 7, 27, 'Johnfort');
INSERT INTO Appointments (Appointment_ID, TA_ID, Student_ID, Location) VALUES (10, 10, 13, 'Nicolehaven');
INSERT INTO Appointments (Appointment_ID, TA_ID, Student_ID, Location) VALUES (11, 2, 8, 'Danielsmouth');
INSERT INTO Appointments (Appointment_ID, TA_ID, Student_ID, Location) VALUES (12, 10, 22, 'New Jenniferchester');
INSERT INTO Appointments (Appointment_ID, TA_ID, Student_ID, Location) VALUES (13, 8, 15, 'New Reginamouth');
INSERT INTO Appointments (Appointment_ID, TA_ID, Student_ID, Location) VALUES (14, 3, 8, 'Buchananport');
INSERT INTO Appointments (Appointment_ID, TA_ID, Student_ID, Location) VALUES (15, 3, 27, 'Monicaburgh');
INSERT INTO Appointments (Appointment_ID, TA_ID, Student_ID, Location) VALUES (16, 3, 12, 'Danielfurt');
INSERT INTO Appointments (Appointment_ID, TA_ID, Student_ID, Location) VALUES (17, 4, 25, 'Shawnfurt');
INSERT INTO Appointments (Appointment_ID, TA_ID, Student_ID, Location) VALUES (18, 7, 19, 'Adamport');
INSERT INTO Appointments (Appointment_ID, TA_ID, Student_ID, Location) VALUES (19, 1, 15, 'West Angela');
INSERT INTO Appointments (Appointment_ID, TA_ID, Student_ID, Location) VALUES (20, 4, 18, 'Mccoyville');
INSERT INTO Appointments (Appointment_ID, TA_ID, Student_ID, Location) VALUES (21, 13, 5, 'Chavezstad');
INSERT INTO Appointments (Appointment_ID, TA_ID, Student_ID, Location) VALUES (22, 25, 12, 'North Danahaven');
INSERT INTO Appointments (Appointment_ID, TA_ID, Student_ID, Location) VALUES (23, 3, 13, 'Chelseaport');
INSERT INTO Appointments (Appointment_ID, TA_ID, Student_ID, Location) VALUES (24, 23, 8, 'East Tabitha');
INSERT INTO Appointments (Appointment_ID, TA_ID, Student_ID, Location) VALUES (25, 6, 15, 'Castilloville');
INSERT INTO Appointments (Appointment_ID, TA_ID, Student_ID, Location) VALUES (26, 7, 14, 'New Mark');
INSERT INTO Appointments (Appointment_ID, TA_ID, Student_ID, Location) VALUES (27, 1, 20, 'Jameschester');
INSERT INTO Appointments (Appointment_ID, TA_ID, Student_ID, Location) VALUES (28, 1, 12, 'Cruzmouth');
INSERT INTO Appointments (Appointment_ID, TA_ID, Student_ID, Location) VALUES (29, 2, 11, 'Coxstad');
INSERT INTO Appointments (Appointment_ID, TA_ID, Student_ID, Location) VALUES (30, 3, 10, 'New Amberfurt');
INSERT INTO Appointments (Appointment_ID, TA_ID, Student_ID, Location) VALUES (31, 3, 17, 'Elizabethport');
INSERT INTO Appointments (Appointment_ID, TA_ID, Student_ID, Location) VALUES (32, 17, 2, 'Lake Craigside');
INSERT INTO Appointments (Appointment_ID, TA_ID, Student_ID, Location) VALUES (33, 9, 12, 'South Michaelbury');
INSERT INTO Appointments (Appointment_ID, TA_ID, Student_ID, Location) VALUES (34, 7, 5, 'Garciastad');
INSERT INTO Appointments (Appointment_ID, TA_ID, Student_ID, Location) VALUES (35, 3, 9, 'East Debra');
INSERT INTO Appointments (Appointment_ID, TA_ID, Student_ID, Location) VALUES (36, 8, 19, 'East Tonya');
INSERT INTO Appointments (Appointment_ID, TA_ID, Student_ID, Location) VALUES (37, 4, 11, 'New Erica');
INSERT INTO Appointments (Appointment_ID, TA_ID, Student_ID, Location) VALUES (38, 4, 22, 'Lake Davidstad');
INSERT INTO Appointments (Appointment_ID, TA_ID, Student_ID, Location) VALUES (39, 10, 21, 'Michelleburgh');
INSERT INTO Appointments (Appointment_ID, TA_ID, Student_ID, Location) VALUES (40, 8, 29, 'Port Lucas');
INSERT INTO Appointments (Appointment_ID, TA_ID, Student_ID, Location) VALUES (41, 27, 19, 'Katherineberg');
INSERT INTO Appointments (Appointment_ID, TA_ID, Student_ID, Location) VALUES (42, 27, 29, 'Carloschester');
INSERT INTO Appointments (Appointment_ID, TA_ID, Student_ID, Location) VALUES (43, 10, 6, 'Dicksonhaven');
INSERT INTO Appointments (Appointment_ID, TA_ID, Student_ID, Location) VALUES (44, 14, 39, 'Port Charlesstad');
INSERT INTO Appointments (Appointment_ID, TA_ID, Student_ID, Location) VALUES (45, 24, 18, 'Martinezview');
INSERT INTO Appointments (Appointment_ID, TA_ID, Student_ID, Location) VALUES (46, 1, 4, 'Ramosfort');
INSERT INTO Appointments (Appointment_ID, TA_ID, Student_ID, Location) VALUES (47, 2, 27, 'Howardfurt');
INSERT INTO Appointments (Appointment_ID, TA_ID, Student_ID, Location) VALUES (48, 1, 36, 'Nguyenbury');
INSERT INTO Appointments (Appointment_ID, TA_ID, Student_ID, Location) VALUES (49, 7, 42, 'South Ronnie');

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
