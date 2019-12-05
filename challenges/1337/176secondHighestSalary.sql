# Write a SQL query to get the second highest salary from the Employee table.
SELECT MAX(Salary) as SecondHighestSalary FROM Employee WHERE Salary < ( SELECT Max(Salary) FROM Employee)

# 100%
SELECT ifnull(
                (SELECT distinct(Salary)
                 FROM Employee
                 ORDER BY Salary DESC
                 LIMIT 1
                 OFFSET 1), NULL) SecondHighestSalary;