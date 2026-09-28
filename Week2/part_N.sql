USE Taxpayer;

--task-1
SELECT full_name, annual_income
FROM Taxpayer
WHERE annual_income=
(
SELECT MAX(annual_income)
FROM Taxpayer
);

--task-2
SELECT c.category_name,
COUNT(*) AS Total_Records
FROM Income_Record i
JOIN Income_Category c
ON i.category_id=c.category_id
GROUP BY c.category_name
ORDER BY Total_Records DESC;



--task-3
SELECT occupation,
COUNT(*) AS Total
FROM Taxpayer
GROUP BY occupation;


--task-4
SELECT COUNT(*) AS Active_Taxpayers
FROM Taxpayer
WHERE status='Active';


--task-5
SELECT f.financial_year,
COUNT(*) AS Total_Records
FROM Income_Record i
JOIN Financial_Year f
ON i.year_id=f.year_id
GROUP BY f.financial_year
ORDER BY Total_Records DESC;