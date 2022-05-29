# Write an SQL query to find the ids of products that are both low fat and recyclable.
SELECT product_id FROM Products where low_fats = 'Y' AND recyclable = 'Y'