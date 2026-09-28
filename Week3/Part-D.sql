--LEVEL-1
SELECT CURDATE() AS today_date;

SELECT NOW() AS current_datetime;

SELECT start_date,
YEAR(start_date) AS year_value FROM Financial_Year;

SELECT start_date,
MONTH(start_date) AS month_value FROM Financial_Year;

SELECT start_date,
DAY(start_date) AS day_value FROM Financial_Year;

--LEVEL-2
-- 6. Add one year
SELECT start_date,
       DATE_ADD(start_date, INTERVAL 1 YEAR) AS end_date
FROM Financial_Year;

-- 7. Add 30 days
SELECT start_date,
       DATE_ADD(start_date, INTERVAL 30 DAY) AS plus_30_days
FROM Financial_Year;

-- 8. Subtract 7 days
SELECT start_date,
       DATE_SUB(start_date, INTERVAL 7 DAY) AS minus_7_days
FROM Financial_Year;

--LEVEL-3
-- 9. Days between today and start date
SELECT start_date,
       DATEDIFF(CURDATE(), start_date) AS days_difference
FROM Financial_Year;

-- 10. Financial years of current year
SELECT *
FROM Financial_Year
WHERE YEAR(start_date) = YEAR(CURDATE());
