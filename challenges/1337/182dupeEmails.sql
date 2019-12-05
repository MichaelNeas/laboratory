# Write a SQL query to find all duplicate emails in a table named Person.
SELECT Email FROM Person GROUP BY Email HAVING COUNT(*) > 1