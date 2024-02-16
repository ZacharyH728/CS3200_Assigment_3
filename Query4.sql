-- lists all the customers who listen to longer than average tracks excluding those more than 15 minutes
SELECT DISTINCT customer.CustomerId
FROM customers customer
JOIN invoices invoice ON customer.CustomerId = invoice.CustomerId
JOIN invoice_items invoice_item ON invoice.InvoiceId = invoice_item.InvoiceId
JOIN tracks track ON invoice_item.TrackId = track.TrackId
WHERE track.Milliseconds >
    (SELECT AVG(Milliseconds) FROM tracks WHERE Milliseconds < 900000)

--used templates provided from gpt-4 as example
--input How to use INNER JOIN in sqlite

--output
-- In SQLite, the `INNER JOIN` clause combines columns from correlated tables. It creates a new result table by combining column values of two tables based upon the join-predicate.
--
-- ### General Syntax:
--
-- ```
-- SELECT column_list
-- FROM table1
-- INNER JOIN table2
-- ON table1.column_name = table2.column_name;
-- ```
--
-- -  `table1` and `table2` are the names of the tables you want to join.
-- -  `column_list` are the columns you want to select.
-- -  `table1.column_name` = `table2.column_name` is the condition that must be met.
--
-- ### Example:
--
-- Let's assume we have two tables, `Students` and `Courses`, and we want to get a list of students along with the courses they are enrolled in:
--
-- **Students:**
--
-- | ID | Name |
-- |---|---|
-- | 1 | Alex |
-- | 2 | Bella |
-- | 3 | Charlie |
--
-- **Courses:**
--
-- | Course_ID | Student_ID | Course_Name |
-- |---|---|---|
-- | 1 | 1 | Math |
-- | 2 | 2 | History |
-- | 3 | 3 | Science |
--
-- You can use `INNER JOIN` like this:
--
-- ```
-- SELECT Students.Name, Courses.Course_Name
-- FROM Students
-- INNER JOIN Courses
-- ON Students.ID = Courses.Student_ID;
-- ```
