USE Taxapayer;

SHOW TABLES;


--PARTB
--LEVEL1
--TASK1
SELECT COUNT(income_id) FROM Income_Record;

--TASK2
SELECT SUM(amount) FROM Income_Record;

--TASK3
SELECT AVG(amount) FROM Income_Record;

--TASK4
SELECT MAX(amount) FROM Income_Record;

--TASK5
SELECT MIN(amount) FROM Income_Record;


--LEVEL2
--TASK1
SELECT taxpayer_id , COUNT(amount) FROM Income_Record GROUP BY taxpayer_id;

--TASK2
SELECT  income_id,SUM(amount) FROM Income_Record GROUP BY income_id;

--TASK3
SELECT income_id, AVG(amount) FROM Income_Record GROUP BY income_id;

--TASK4
SELECT income_id, MAX(amount) FROM Income_Record GROUP BY income_id;

--TASK5
SELECT income_id, MIN(amount) FROM Income_Record GROUP BY income_id;

--TASK6
SELECT year_id, SUM(amount) FROM Income_Record GROUP BY year_id;

--TASK7
SELECT year_id , COUNT(amount) FROM Income_Record GROUP BY year_id;

--TASK8
SELECT year_id, category_id, SUM(amount) FROM Income_Record GROUP BY year_id,category_id;



--LEVEL3 - Medium to Advanced
--TASK1
SELECT income_id , SUM(amount) FROM Income_Record GROUP BY income_id HAVING SUM(amount) > 1000000;

--TASK2
SELECT income_id, AVG(amount) FROM Income_Record GROUP BY income_id HAVING AVG(amount) > 500000;

--TASK3
SELECT year_id , COUNT(*) FROM Income_Record GROUP BY year_id HAVING COUNT(*)>3;

--TASK4
SELECT category_id, SUM(amount) FROM Income_Record GROUP BY category_id ORDER BY SUM(amount) DESC;

--TASK5
SELECT income_id, SUM(amount) FROM Income_Record GROUP BY income_id HAVING SUM(amount) > 1000000 ORDER BY SUM(amount) DESC;

--TASK6
SELECT SUM(amount),AVG(amount) FROM income_record GROUP BY category_id;

--TASK7
SELECT category_name ,  SUM(amount) AS total_income FROM Income_Category ic JOIN Income_Record ir ON ic.category_id = ir.category_id  
GROUP BY ic.category_name ORDER BY total_income DESC LIMIT 1;


--TASK8
SELECT fy.start_date, COUNT(DISTINCT ir.taxpayer_id) AS number_of_taxpayers FROM Financial_Year fy JOIN Income_Record ir ON fy.year_id = ir.year_id GROUP BY fy.start_date;



--Real-World Taxation Analysis

--TASK1
SELECT category_name,SUM(amount) AS total_income FROM income_category ic INNER JOIN income_record ir ON ic.category_id = ir.category_id GROUP BY ic.category_name ORDER BY total_income DESC LIMIT 1;

--TASK2
SELECT year_label,SUM(amount) AS total_income FROM financial_year fy INNER JOIN income_record ir ON fy.year_id = ir.year_id GROUP BY fy.year_id,fy.year_id ORDER BY total_income DESC LIMIT 1;

--TASK3
SELECT category_name,AVG(amount) AS avg_income FROM income_category ic INNER JOIN income_record ir ON ic.category_id = ir.category_id GROUP BY ic.category_id,ic.category_name ORDER BY avg_income DESC LIMIT 1;


--TASK4
SELECT ic.category_name,
       COUNT(ir.income_id) AS income_record_count
FROM income_category ic INNER JOIN income_record ir ON ic.category_id = ir.category_id GROUP BY ic.category_id, ic.category_name HAVING COUNT(ir.income_id) > 2;

--TASK5
SELECT fy.year_label,
       SUM(ir.amount) AS total_income
FROM financial_year fy INNER JOIN income_record ir ON fy.year_id = ir.year_id GROUP BY fy.year_id, fy.year_label HAVING SUM(ir.amount) > 1000000;

--TASK6
SELECT category_name,COUNT(amount) AS no_of_records,SUM(amount) AS total_income,AVG(amount) AS avg_income,MAX(amount) AS highest_income,MIN(amount) AS lowest_income FROM income_category ic INNER JOIN income_record ir ON ic.category_id = ir.category_id GROUP BY ic.category_id, ic.category_name;