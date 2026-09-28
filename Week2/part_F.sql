Use Taxpayer;

--task-1
SELECT taxpayer_id
FROM Income_Record
WHERE category_id=(SELECT category_id
FROM Income_Category
WHERE category_name='Salary')

EXCEPT

SELECT taxpayer_id
FROM Income_Record
WHERE category_id=(SELECT category_id
FROM Income_Category
WHERE category_name='Business');

--task-2
SELECT taxpayer_id
FROM Income_Record
WHERE year_id=(SELECT year_id
FROM Financial_Year
WHERE financial_year='2025-2026')

EXCEPT

SELECT taxpayer_id
FROM Income_Record
WHERE year_id=(SELECT year_id
FROM Financial_Year
WHERE financial_year='2024-2025');