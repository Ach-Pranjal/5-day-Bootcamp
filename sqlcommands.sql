create database student_management;

create table students (
  student_id  serial primary key,
  first_name varchar(100) not null,
  last_name varchar(100) not null,
    email varchar(100) unique,
    enrollment_date date default current_date
);

create table courses (
    course_id Serial primary key,
    course_name varchar(100) not null,
    department_id int,
    credits int not null
);

create table enrollments (
  enrollment_id serial primary key,
  student_id int references students(student_id) on delete cascade,
  course_id int references courses(course_id) on delete cascade,
  grade varchar(2)
);

create table departments (
  department_id serial primary key,
  department_name varchar(100) not null
)

-- Insert data into departments
INSERT INTO departments (department_name) VALUES 
('Computer Science'),
('Mathematics'),
('Physics'),
('Biology'),
('Chemistry'),
('English Literature'),
('History'),
('Political Science'),
('Economics'),
('Psychology');

-- Insert data into students
INSERT INTO students (first_name, last_name, email) VALUES 
('John', 'Doe', 'john.doe@example.com'),
('Jane', 'Smith', 'jane.smith@example.com'),
('Alice', 'Johnson', 'alice.johnson@example.com'),
('Bob', 'Brown', 'bob.brown@example.com'),
('Charlie', 'Davis', 'charlie.davis@example.com'),
('David', 'Miller', 'david.miller@example.com'),
('Emily', 'Wilson', 'emily.wilson@example.com'),
('Frank', 'Moore', 'frank.moore@example.com'),
('Grace', 'Taylor', 'grace.taylor@example.com'),
('Henry', 'Anderson', 'henry.anderson@example.com');

-- Insert data into courses
INSERT INTO courses (course_name, department_id, credits) VALUES 
('Introduction to Programming', 1, 3),
('Data Structures', 1, 4),
('Calculus I', 2, 4),
('Linear Algebra', 2, 3),
('Classical Mechanics', 3, 4),
('Quantum Physics', 3, 4),
('Organic Chemistry', 5, 3),
('British Literature', 6, 3),
('World History', 7, 3),
('Psychological Theories', 10, 3);

-- Insert data into enrollments with grade levels (2-character format)
INSERT INTO enrollments (student_id, course_id, grade) VALUES 
(1, 1, 'FR'),
(1, 3, 'SO'),
(2, 2, 'FR'),
(2, 4, 'JR'),
(3, 5, 'SR'),
(3, 6, 'SO'),
(4, 7, 'JR'),
(4, 8, 'SR'),
(5, 9, 'FR'),
(5, 10, 'SO');
