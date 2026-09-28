--LEVEL-1
-- 1. Annual income to INTEGER
SELECT annual_income,
       CAST(annual_income AS SIGNED) AS income_integer
FROM Taxpayer;

-- 2. Taxpayer ID to CHAR
SELECT taxpayer_id,
       CAST(taxpayer_id AS CHAR) AS taxpayer_char
FROM Taxpayer;


--LEVEL-2
-- 3. Start date to DATETIME
SELECT start_date,
       CAST(start_date AS DATETIME) AS start_datetime
FROM Financial_Year;

-- 4. Annual income to DECIMAL
SELECT annual_income,
       CAST(annual_income AS DECIMAL(12,2)) AS income_decimal
FROM Taxpayer;


--LEVEL-3
-- 5. Annual income as character string
SELECT annual_income,
       CAST(annual_income AS CHAR) AS income_string
FROM Taxpayer;

-- 6. Convert before tax calculation
SELECT annual_income,
       CAST(annual_income AS DECIMAL(12,2))*0.10 AS estimated_tax
FROM Taxpayer;