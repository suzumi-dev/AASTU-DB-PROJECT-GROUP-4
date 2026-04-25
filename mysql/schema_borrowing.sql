USE school_library;

-- Insert Borrowing Records
INSERT INTO Borrowing (student_id, book_id, borrow_date, due_date, return_date, status) VALUES
(1, 1, '2024-01-05', '2024-01-19', '2024-01-18', 'returned'),
(2, 3, '2024-01-10', '2024-01-24', NULL, 'borrowed'),
(3, 2, '2024-01-12', '2024-01-26', '2024-01-25', 'returned'),
(4, 5, '2024-01-15', '2024-01-29', NULL, 'borrowed'),
(5, 4, '2024-01-17', '2024-01-31', NULL, 'overdue');  
