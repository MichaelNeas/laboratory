SELECT name, population, area FROM WORLD WHERE population > 25000000 OR area > 3000000

# Strictly speaking, Using UNION is faster when it comes to cases like scan two different column like this.
# Union
SELECT name, population, area
FROM World
WHERE area > 3000000 

UNION

SELECT name, population, area
FROM World
WHERE population > 25000000