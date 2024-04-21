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
    First_Name VARCHAR(70),  -- Add this line to include the First_Name column
    Last_Name VARCHAR(15),
    Course_ID INT,
    FOREIGN KEY (User_ID) REFERENCES Users(User_ID) ON DELETE CASCADE,
    FOREIGN KEY (Course_ID) REFERENCES Courses(Course_ID)
);

INSERT INTO Professors (User_ID, Email, First_Name, Last_Name, Course_ID) VALUES (1, 'dnewburyt@walmart.com', 'Dulciana', 'Newbury', 1);
INSERT INTO Professors (User_ID, Email, First_Name, Last_Name, Course_ID) VALUES (2, 'asoftleys@google.com.hk', 'Arlette', 'Softley', 2);
INSERT INTO Professors (User_ID, Email, First_Name, Last_Name, Course_ID) VALUES (3, 'jelcottr@ucoz.com', 'Jackson', 'Elcott', 3);
INSERT INTO Professors (User_ID, Email, First_Name, Last_Name, Course_ID) VALUES (4, 'coxberryq@unc.edu', 'Clarinda', 'Oxberry', 4);



CREATE TABLE IF NOT EXISTS TAs(
    TA_ID INTEGER PRIMARY KEY AUTOINCREMENT,
    User_ID INT,
    Name VARCHAR(100),
    Email VARCHAR(70) UNIQUE,
    Professor_ID INT,
    FOREIGN KEY (User_ID) REFERENCES Users(User_ID),
    FOREIGN KEY (Professor_ID) REFERENCES Professors(Professor_ID)
);

CREATE TABLE IF NOT EXISTS Administrator(
    Admin_ID INTEGER PRIMARY KEY AUTOINCREMENT,
    Email VARCHAR(70),
    First_Name VARCHAR(15),
    Middle_Name VARCHAR(20),
    Last_Name VARCHAR(20)
);

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

INSERT INTO Student (First_Name, Last_Name, Appt_ID)
VALUES
    ('Taber', 'Gyles', '1UC0Y32DK95'),
    ('Barr', 'Najara', '1G77UM4UF88'),
    ('Arden', 'Entres', '6W69H71XQ94'),
    ('Rina', 'Tombs', '8NN8RJ1YJ83'),
    ('Bogey', 'Povele', '5XK4J73HH98'),
    ('Michail', 'Suett', '7NM5JE8DT82'),
    ('Cob', 'Pollington', '5KK3N39KY48'),
    ('Llewellyn', 'Titcombe', '9WR7HT7VX13'),
    ('Brewster', 'Dulen', '3E13MV4YE49'),
    ('Roby', 'Traves', '6UW1J33QD42'),
    ('Emlen', 'Deane', '1CK3RG1RR56'),
    ('Darryl', 'Filde', '1RK5A46GA45'),
    ('Ailyn', 'Tawton', '1KF4YW6KN17'),
    ('Alwyn', 'Capper', '9KU2J79NJ21'),
    ('Raphael', 'Beetlestone', '8T67HK3HM65'),
    ('Maddy', 'Frayne', '5CQ9MH9NP30'),
    ('Florencia', 'McGuffog', '7UG0XM8JY69'),
    ('Cal', 'Oppery', '4G70K88ND00'),
    ('Giff', 'Scollan', '6DJ5Y82GW85'),
    ('Evanne', 'Quidenham', '3MJ0MW8PM58'),
    ('Gael', 'Presser', '4P27EP7GE60'),
    ('Cam', 'Abelwhite', '4HA4XM2KF01'),
    ('Kriste', 'Foster-Smith', '2EW4QR9TT38'),
    ('Jillane', 'Emmens', '9YW2KP8UR50'),
    ('Reamonn', 'Curmi', '7V88JQ1NH67'),
    ('Tedda', 'Disley', '7QH6QJ6YQ57'),
    ('Brigg', 'Painswick', '8N92PE0RH23'),
    ('Catlin', 'Sonschein', '7K85KR1XP96'),
    ('Lou', 'MacBrearty', '6R47TA0RE08'),
    ('Lilly', 'Benduhn', '9GX5AP9AP07');

CREATE TABLE IF NOT EXISTS Manage(
    Admin_ID INT,
    User_ID INT,
    PRIMARY KEY (Admin_ID, User_ID),
    FOREIGN KEY (Admin_ID) REFERENCES Administrator(Admin_ID),
    FOREIGN KEY (User_ID) REFERENCES Users(User_ID)
);

CREATE TABLE IF NOT EXISTS Approve_Access(
    Admin_ID INT,
    Course_ID INT,
    PRIMARY KEY (Admin_ID, Course_ID),
    FOREIGN KEY (Admin_ID) REFERENCES Administrator(Admin_ID),
    FOREIGN KEY (Course_ID) REFERENCES Courses(Course_ID)
);


CREATE TABLE IF NOT EXISTS Monitor(
    Admin_ID INT,
    Event VARCHAR(30),
    User_ID INT,
    Time DATETIME,
    PRIMARY KEY (Admin_ID, Event),
    FOREIGN KEY (User_ID) REFERENCES Users(User_ID)
);

CREATE TABLE IF NOT EXISTS User_Activity(
    User_ID INT,
    Event VARCHAR(50),
    Course_ID INT,
    PRIMARY KEY (User_ID, Event),
    FOREIGN KEY (User_ID) REFERENCES Monitor(User_ID),
    FOREIGN KEY (Event) REFERENCES Monitor(Event) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Assist(
    TA_ID INT,
    Course_ID INT,
    PRIMARY KEY (TA_ID, Course_ID),
    FOREIGN KEY (TA_ID) REFERENCES TAs(TA_ID),
    FOREIGN KEY (Course_ID) REFERENCES Courses(Course_ID)
);

CREATE TABLE IF NOT EXISTS Enroll(
    Course_ID INT,
    Student_ID INT,
    Grade VARCHAR(3),
    PRIMARY KEY (Course_ID, Student_ID),
    FOREIGN KEY (Course_ID) REFERENCES Courses(Course_ID),
    FOREIGN KEY (Student_ID) REFERENCES Student(Student_ID)
);

CREATE TABLE IF NOT EXISTS URL(
    URL_ID INT PRIMARY KEY
);

CREATE TABLE IF NOT EXISTS Materials(
    Material_ID INT PRIMARY KEY,
    Course_ID INT,
    Type VARCHAR(10),
    Description TEXT,
    URL_ID INT,
    FOREIGN KEY (Course_ID) REFERENCES Courses(Course_ID),
    FOREIGN KEY (URL_ID) REFERENCES URL(URL_ID)
);

CREATE TABLE IF NOT EXISTS Provide_Access(
    Admin_ID INT,
    Material_ID INT,
    PRIMARY KEY (Admin_ID, Material_ID),
    FOREIGN KEY (Admin_ID) REFERENCES Administrator(Admin_ID),
    FOREIGN KEY (Material_ID) REFERENCES Materials(Material_ID)
);

CREATE TABLE IF NOT EXISTS Progress(
    Progress_Rate INT PRIMARY KEY,
    Course_ID INT,
    Student_ID INT,
    FOREIGN KEY (Course_ID) REFERENCES Courses(Course_ID),
    FOREIGN KEY (Student_ID) REFERENCES Student(Student_ID)
    );

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

CREATE TABLE IF NOT EXISTS Discussion(
    Content TEXT PRIMARY KEY,
    Course_ID INT,
    Student_ID INT,
    Title VARCHAR(50),
    Time TIME,
    FOREIGN KEY (Course_ID) REFERENCES Courses(Course_ID),
    FOREIGN KEY (Student_ID) REFERENCES Student(Student_ID)
);

CREATE TABLE IF NOT EXISTS Participation(
    Course_ID INT,
    Student_ID INT,
    Participation_Stats INT,
    PRIMARY KEY (Course_ID, Student_ID),
    FOREIGN KEY (Course_ID) REFERENCES Discussion(Course_ID),
    FOREIGN KEY (Student_ID) REFERENCES Discussion(Student_ID)
);

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

CREATE TABLE IF NOT EXISTS Feedback(
    Message TEXT PRIMARY KEY,
    Student_ID INT,
    TA_ID INT,
    Professor_ID INT,
    Time DATETIME,
    FOREIGN KEY (Student_ID) REFERENCES Student(Student_ID),
    FOREIGN KEY (TA_ID) REFERENCES TAs(TA_ID),
    FOREIGN KEY (Professor_ID) REFERENCES Professors(Professor_ID)
);




