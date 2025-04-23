-- Members Table
CREATE TABLE Members(
member_id SERIAL PRIMARY KEY,
username VARCHAR(50) UNIQUE NOT NULL,
email VARCHAR(100) UNIQUE NOT NULL,
password VARCHAR(255) NOT NULL,
first_name VARCHAR(50) NOT NULL,
last_name VARCHAR(50) NOT NULL,
created_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


-- Categories Table
CREATE TABLE Categories (
category_id SERIAL PRIMARY KEY,
category_name VARCHAR(100) UNIQUE NOT NULL
);


-- Courses Table
CREATE TABLE Courses (
course_id SERIAL PRIMARY KEY,
course_name VARCHAR(200) UNIQUE NOT NULL,
description TEXT,
start_date DATE,
end_date DATE,
instructor VARCHAR(100),
category_id INTEGER REFERENCES Categories(category_id)
);


-- Enrollments Table
CREATE TABLE Enrollments (
enrollment_id SERIAL PRIMARY KEY,
member_id INTEGER REFERENCES Members(member_id) ,
course_id INTEGER REFERENCES Courses(course_id),
enrolled_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Certificates Table
CREATE TABLE Certificates (
certificate_id SERIAL PRIMARY KEY,
certificate_code VARCHAR(100) UNIQUE NOT NULL,
issue_date DATE DEFAULT CURRENT_DATE
);

-- CertificateAssignments Table
CREATE TABLE CertificateAssignments (
assignment_id SERIAL PRIMARY KEY,
certificate_id INTEGER REFERENCES Certificates(certificate_id),
member_id INTEGER REFERENCES Members(member_id),
assigned_date  DATE DEFAULT CURRENT_DATE
);


-- BlogPosts Table
CREATE TABLE BlogPosts (
post_id SERIAL PRIMARY KEY,
title VARCHAR(255),
content TEXT,
published_date  TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
author_id INTEGER REFERENCES Members(member_id)
);










