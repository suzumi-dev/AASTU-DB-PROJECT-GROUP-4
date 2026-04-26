// QUERY 1: Find all books
db.books.find({});

// QUERY 2: Find all currently borrowed books
db.borrowing_records.find({ status: "borrowed" });

// QUERY 3: Find all overdue books
db.borrowing_records.find({ status: "overdue" });

// QUERY 4: Find books by a specific author
db.books.find({ "author.last_name": "Orwell" });

// QUERY 5: Find all books available for borrowing
db.books.find({ available_copies: { $gt: 0 } });

// QUERY 6: Update return date when student returns a book
db.borrowing_records.updateOne(
  { borrow_id: 2 },
  { $set: { return_date: "2024-02-01", status: "returned" } }
);

// QUERY 7: Count total borrowed books per status
db.borrowing_records.aggregate([
  { $group: { _id: "$status", count: { $sum: 1 } } }
]);  
