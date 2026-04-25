USE school_library;

-- QUERY 1: Show all books with their author names
SELECT 
    Book.book_id,
    Book.title,
    Book.genre,
    Book.year_published,
    Book.available_copies,
    Author.first_name,
    Author.last_name
FROM Book
JOIN Author ON Book.author_id = Author.author_id;

-- QUERY 2: Show all students who currently have a book borrowed
SELECT 
    Student.student_id,
    Student.first_name,
    Student.last_name,
    Book.title,
    Borrowing.borrow_date,
    Borrowing.due_date,
    Borrowing.status
FROM Borrowing
JOIN Student ON Borrowing.student_id = Student.student_id
JOIN Book ON Borrowing.book_id = Book.book_id
WHERE Borrowing.status = 'borrowed';

-- QUERY 3: Show all overdue books
SELECT 
    Student.first_name,
    Student.last_name,
    Book.title,
    Borrowing.due_date,
    Borrowing.status
FROM Borrowing
JOIN Student ON Borrowing.student_id = Student.student_id
JOIN Book ON Borrowing.book_id = Book.book_id
WHERE Borrowing.status = 'overdue';

-- QUERY 4: Count how many books each author has
SELECT 
    Author.first_name,
    Author.last_name,
    COUNT(Book.book_id) AS total_books
FROM Author
JOIN Book ON Author.author_id = Book.author_id
GROUP BY Author.author_id;

-- QUERY 5: Show all available books (copies still on shelf)
SELECT 
    title,
    genre,
    year_published,
    available_copies
FROM Book
WHERE available_copies > 0
ORDER BY title;   
