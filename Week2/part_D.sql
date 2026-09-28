USE Taxpayer;

--task-1
SELECT t.full_name
FROM Taxpayer t
JOIN Income_Record i ON t.taxpayer_id = i.taxpayer_id
JOIN Income_Category c ON i.category_id = c.category_id
WHERE c.category_name = 'Salary'

UNION
SELECT t.full_name
FROM Taxpayer t
JOIN Income_Record i ON t.taxpayer_id = i.taxpayer_id
JOIN Income_Category c ON i.category_id = c.category_id
WHERE c.category_name = 'Business';

--task-2
SELECT income_source
FROM Income_Record
WHERE year_id = (
SELECT year_id
FROM Financial_Year
WHERE financial_year='2024-2025'
)

UNION

SELECT income_source
FROM Income_Record
WHERE year_id = (
SELECT year_id
FROM Financial_Year
WHERE financial_year='2025-2026'
);

--task-3
SELECT full_name
FROM Taxpayer
WHERE occupation='Teacher'

UNION

SELECT full_name
FROM Taxpayer
WHERE occupation='Software Engineer';