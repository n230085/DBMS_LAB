USE Taxpayer;

--task-1
SELECT *
FROM Taxpayer
ORDER BY name;

--task-2
SELECT *
FROM Taxpayer
WHERE annual_income>800000;

--task-3
SELECT *
FROM Taxpayer
WHERE occupation='Software Engineer';

--task-4
SELECT *
FROM Income_Record
WHERE category_id=
(
SELECT category_id
FROM Income_Category
WHERE category_name='Business'
);

--task-5
SELECT *
FROM Income_Record
WHERE amount BETWEEN 500000 AND 1000000;

--task-6
SELECT *
FROM Taxpayer
WHERE full_name LIKE 'A%';


--task-7
SELECT *
FROM Taxpayer
WHERE city='YourCity';

--task-8
SELECT *
FROM Taxpayer
WHERE status='Active';

--task-9
SELECT COUNT(*) AS Total_Taxpayers
FROM Taxpayer;

--task-10
SELECT MAX(annual_income)
FROM Taxpayer;