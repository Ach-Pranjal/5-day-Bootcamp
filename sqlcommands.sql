-- DAY 1 DATA

CREATE DATABASE student_management;

CREATE TABLE IF NOT EXISTS teachers (
  teacher_id SERIAL PRIMARY KEY,
  first_name VARCHAR(100) NOT NULL,
  last_name VARCHAR(100) NOT NULL,
  age INT NOT NULL
);

CREATE TABLE students (
  student_id SERIAL PRIMARY KEY,
  first_name VARCHAR(100) NOT NULL,
  last_name VARCHAR(100) NOT NULL,
  email VARCHAR(100) UNIQUE
);

CREATE TABLE courses (
  course_id SERIAL PRIMARY KEY,
  course_name VARCHAR(100) NOT NULL,
  department_id INT REFERENCES departments(department_id) ON DELETE CASCADE,
  credits INT NOT NULL,
  teacher_id INT REFERENCES teachers(teacher_id) ON DELETE CASCADE
);

CREATE TABLE enrollments (
  enrollment_id SERIAL PRIMARY KEY,
  student_id INT REFERENCES students(student_id) ON DELETE CASCADE,
  course_id INT REFERENCES courses(course_id) ON DELETE CASCADE,
  grade CHAR(2) NOT NULL
);

CREATE TABLE departments (
  department_id SERIAL PRIMARY KEY,
  department_name VARCHAR(100) NOT NULL
);

-- Insert data into departments
INSERT INTO
  departments (department_name)
VALUES
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
INSERT INTO
  students (first_name, last_name, email)
VALUES
  ('John', 'Doe', 'john.doe@example.com'),
  ('Jane', 'Smith', 'jane.smith@example.com'),
  ('Alice', 'Johnson', 'alice.johnson@example.com'),
  ('Bob', 'Brown', 'bob.brown@example.com'),
  ('Charlie', 'Davis', 'charlie.davis@example.com'),
  ('David', 'Miller', 'david.miller@example.com'),
  ('Emily', 'Wilson', 'emily.wilson@example.com'),
  ('Frank', 'Moore', 'frank.moore@example.com'),
  ('Grace', 'Taylor', 'grace.taylor@example.com'),
  (
    'Henry',
    'Anderson',
    'henry.anderson@example.com'
  );

-- Insert data into courses
INSERT INTO
  courses (course_name, department_id, credits)
VALUES
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
INSERT INTO
  enrollments (student_id, course_id, grade)
VALUES
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