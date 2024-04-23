# CS3200_final

## How to setup and start the containers
**Important** - you need Docker Desktop installed

1. Clone this repository.
1. Create a file named `db_root_password.txt` in the `secrets/` folder and put inside of it the root password for MySQL.
1. Create a file named `db_password.txt` in the `secrets/` folder and put inside of it the password you want to use for the a non-root user named webapp.
1. In a terminal or command prompt, navigate to the folder with the `docker-compose.yml` file.
1. Build the images with `docker compose build`
1. Start the containers with `docker compose up`.  To run in detached mode, run `docker compose up -d`. 

## Project Overview

Canvas Database aims to enhance the Canvas learning management system to better serve its diverse user base, including students, professors, and administrators. Our solution is based on facilitating access to course materials, improving communication and collaboration features, and streamlining administrative tasks. We aim to create a more intuitive, efficient, and interactive online learning environment. Our goal for this project is to enhance the overall usability, functionality, and effectiveness of Canvas, ultimately improving the teaching and learning experience for all stakeholders involved.

## What is different in our database?
- Students can view integrated calendars for assignments, exams, and quizzes.
- Students can see online status of group mates for effective communication.
- Students receive notifications for upcoming deadlines, quizzes, and exams.
- Professors can efficiently organize and update course materials.
- Professors can monitor student participation and progress.
- Professors can provide timely feedback and grades.
- Administrators can manage user accounts and access permissions.
- Administrators have access to centralized dashboards for monitoring system usage and security.
- Teaching assistants can access course materials and assignments to assist professors.
- Teaching assistants can give timely feedback and provide academic support to students.
- Teaching assistants can easily communicate with students and access student information.