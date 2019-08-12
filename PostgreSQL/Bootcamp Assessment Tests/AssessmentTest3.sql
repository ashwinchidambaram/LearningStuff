/*########## SQL Bootcamp ####################################################*/
/*############## Assessment Test # 2  ########################################*/
/*############################################################################*/

/*############################################################################*/
/* Challenge # 1: Complete the following task

Create a new database called "School" this database should have two tables:
  teachers and students

The students table should have columns for student_id, first_name,last_name,
  homeroom_number, phone,email, and graduation year.

The teachers table should have columns for teacher_id, first_name, last_name,
  homeroom_number, department, email, and phone.

The constraints are mostly up to you, but your table constraints do have to
  consider the following:

    - We must have a phone number to contact students in case of an emergency.
    - We must have ids as the primary key of the tables
    - Phone numbers and emails must be unique to the individual.

Once you've made the tables, insert a student named Mark Watney (student_id=1)
  who has a phone number of 777-555-1234 and doesn't have an email. He graduates
  in 2035 and has 5 as a homeroom number.

Then insert a teacher names Jonas Salk (teacher_id = 1) who as a homeroom number
  of 5 and is from the Biology department. His contact info is: jsalk@school.org
  and a phone number of 777-555-4321.

*/

-- Creating 'teachers' table
CREATE TABLE teachers(
	teacher_id serial PRIMARY KEY,
	first_name varchar(50) NOT NULL,
	last_name varchar(50) NOT NULL,
	homeroom_number integer NOT NULL,
	department varchar(50) NOT NULL,
	email varchar(350) UNIQUE NOT NULL,
	phone varchar(10) UNIQUE NOT NULL)

-- Creating 'students' table
CREATE TABLE students(
	student_id serial PRIMARY KEY,
	first_name varchar(50) NOT NULL,
	last_name varchar(50) NOT NULL,
	homeroom_number integer NOT NULL,
	phone varchar(10) UNIQUE NOT NULL,
	email varchar(350) UNIQUE NOT NULL,
	grad_year integer NOT NULL)

-- Inserting one student
INSERT INTO students(student_id, first_name, last_name, homeroom_number, phone, email, grad_year)
VALUES(1, 'Mark', 'Watney', 5, 7775551234, 'NA', 2035)

-- Inserting one teacher
INSERT INTO teachers(teacher_id, first_name, last_name, homeroom_number, department, email, phone)
VALUES(1, 'Jonas', 'Salk', 5, 'Biology', 'jsalk@school.org', 7775554321)


/* RESULT: CORRECT

CREATE TABLE students(
student_id serial PRIMARY KEY,
first_name VARCHAR(45) NOT NULL,
last_name VARCHAR(45) NOT NULL,
homeroom_number integer,
phone VARCHAR(20) UNIQUE NOT NULL,
email VARCHAR(115) UNIQUE,
grad_year integer);

CREATE TABLE teachers(
teacher_id serial PRIMARY KEY,
first_name VARCHAR(45) NOT NULL,
last_name VARCHAR(45) NOT NULL,
homeroom_number integer,
department VARCHAR(45),
email VARCHAR(20) UNIQUE,
phone VARCHAR(20) UNIQUE);

INSERT INTO students(first_name,last_name, homeroom_number,phone,grad_year)VALUES ('Mark','Watney',5,'7755551234',2035);

INSERT INTO teachers(first_name,last_name, homeroom_number,department,email,phone)VALUES ('Jonas','Salk',5,'Biology','jsalk@school.org','7755554321');
