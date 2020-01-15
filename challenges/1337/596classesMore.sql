# There is a table courses with columns: student and class
# Please list out all classes which have more than or equal to 5 students.
select class as class
from courses
group by class
having count(distinct student) >=5;