use flipkart_db;

#1. Query all rows from Department table?

 select * from department_tb1;
 
#2. Change the name of department with id = 1 to 'Management'?

SET Sql_safe_updates=0;
UPDATE department_tb1
SET name = 'Management'
WHERE id = 1;
select * from department_tb1;

#3. Delete employees with salary greater than 100000?

DELETE FROM Employee_tb
WHERE salary > 100000;
select * from Employee_tb;

#4. Query the names of companies?

SELECT name FROM Company_tb;

#5. Query the name and city of every employee?

SELECT name,city FROM employee_tb order by city;

#6. Query all companies with revenue greater than 5000000?

SELECT name,revenue FROM Company_tb
where revenue>5000000;

#7. Query all companies with revenue smaller than 5000000?

SELECT name,revenue FROM Company_tb
where revenue < 5000000;

#8. Query all companies with revenue smaller than 5000000, but you cannot use the '<' operator?

SELECT name,revenue FROM Company_tb
where revenue between 0 and 5000000;

#9. Query all employees with salary greater than 50000 and smaller than 70000?

SELECT * FROM Employee_tb
WHERE salary > 50000 AND salary < 70000;

#10. Query all employees with salary greater than 50000 and smaller than 70000, but you cannot use BETWEEN?

SELECT * FROM Employee_tb
WHERE salary > 50000 AND salary < 70000;

#11. Query all employees with salary equal to 80000?

SELECT * FROM Employee_tb
WHERE salary = 80000;

#12. Query all employees with salary not equal to 80000?

SELECT * FROM Employee_tb
WHERE salary <> 80000;

#13. Query all departments (each name only once)?

SELECT DISTINCT name FROM department_tb1;

#14. Query names of all employees together with id of department they work in, but you cannot use JOIN?

SELECT distinct name, department_id
FROM Employee_tb order by department_id;

#15. Query names of all employees together with id of department they work in, using JOIN?
SELECT e.name,e.department_id,d.id
FROM Employee_tb e
JOIN Department_tb1 d
ON e.department_id = d.id 
order by e.department_id;

#16. Query name of every company together with every department?

SELECT distinct c.name, d.name
FROM Company_tb c
CROSS JOIN Department_tb1 d;

#17. Query employee name together with the department name that they are not working?

SELECT distinct e.name, d.name
FROM Employee_tb e
CROSS JOIN Department_tb1 d
WHERE e.department_id <> d.id;

#18. Query names of every company and change the name of column to 'Company'?

SELECT name AS Company
FROM Company_tb;

#19. Query the city wise salary?

SELECT distinct city, sum(salary)
FROM Employee_tb
GROUP BY city;

#20. Query the highest revenue company name?

SELECT name,revenue
FROM Company_tb
ORDER BY revenue DESC
