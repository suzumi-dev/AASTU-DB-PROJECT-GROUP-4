-- ================================================
-- SCHOOL LIBRARY DATABASE SYSTEM
-- File: schema.sql
-- ================================================

CREATE DATABASE IF NOT EXISTS school_library;
USE school_library;

-- TABLE 1: Author
CREATE TABLE IF NOT EXISTS Author (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    nationality VARCHAR(50)
);

-- TABLE 2: Book
CREATE TABLE IF NOT EXISTS Book (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    genre VARCHAR(50),
    year_published INT,
    total_copies INT DEFAULT 1,
    available_copies INT DEFAULT 1,
    author_id INT,
    FOREIGN KEY (author_id) REFERENCES Author(author_id)
);

-- TABLE 3: Student
CREATE TABLE IF NOT EXISTS Student (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(20),
    grade VARCHAR(10)
);

-- TABLE 4: Borrowing
CREATE TABLE IF NOT EXISTS Borrowing (
    borrow_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT,
    book_id INT,
    borrow_date DATE NOT NULL,
    due_date DATE NOT NULL,
    return_date DATE,
    status VARCHAR(20) DEFAULT 'borrowed',
    FOREIGN KEY (student_id) REFERENCES Student(student_id),
    FOREIGN KEY (book_id) REFERENCES Book(book_id)
);

-- Insert Authors
INSERT INTO Author (first_name, last_name, nationality) VALUES
('George', 'Orwell', 'British'),
('Chinua', 'Achebe', 'Nigerian'),
('Toni', 'Morrison', 'American'),
('Fyodor', 'Dostoevsky', 'Russian'),
('Maya', 'Angelou', 'American');

-- Insert Books
INSERT INTO Book (title, genre, year_published, total_copies, available_copies, author_id) VALUES
('1984', 'Dystopian', 1949, 3, 2, 1),
('Things Fall Apart', 'Fiction', 1958, 4, 3, 2),
('Beloved', 'Historical Fiction', 1987, 2, 2, 3),
('Crime and Punishment', 'Philosophical Fiction', 1866, 3, 1, 4),
('I Know Why the Caged Bird Sings', 'Autobiography', 1969, 2, 2, 5);