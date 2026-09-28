USE Taxpayer;

--task-1
SELECT *
FROM Taxpayer
WHERE annual_income > ANY
(
SELECT annual_income
FROM Taxpayer
WHERE occupation='Teacher'
);


--task-2
SELECT *
FROM Taxpayer
WHERE annual_income > ANY
(
SELECT amount
FROM Income_Record i
JOIN Income_Category c
ON i.category_id=c.category_id
WHERE c.category_name='Business'
);