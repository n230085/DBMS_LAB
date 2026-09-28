USE Taxpayer;

--PART A
--LEVEL1

--TASK1
CREATE VIEW HighestIncome AS 
SELECT * FROM income_record WHERE amount =(
    SELECT MAX(amount) FROM income_record
);

--TASK2
CREATE VIEW LowestIncome AS
SELECT * FROM income_record WHERE amount = (
    SELECT MIN(amoount) FROM income_record
);

--TASK3
CREATE VIEW AverageIncome AS 
SELECT * FROM income_record WHERE amount= (
    SELECT AVG(amount) FROM income_record
);

--TASK4
--task4 is same as like task1

--TASK5
CREATE VIEW BusinessOwner AS 
SELECT full_name FROM taxpayer WHERE occupation = 'Business';


--LEVEL2
--TASK1
CREATE VIEW Tax_atleast_income AS 
SELECT full_name FROM taxpayer WHERE taxpayer_id = ANY(
     SELECT taxpayer_id FROM income_record
);

--TASK2
CREATE VIEW Tax_business_category AS 
SELECT full_name, taxpayer_id FROM taxpayer WHERE taxpayer_id IN (
    SELECT taxpayer_id FROM income_record WHERE category_id IN (
        SELECT category_id FROM income_category WHERE category_name='Business'
    )
);

--TASK3
CREATE VIEW Financialyear AS 
SELECT ir.* FROM income_record ir JOIN financial_year fy 
ON ir.year_id = fy.year_id WHERE fy.year_label='2025-2026';

--TASK4
CREATE VIEW Income_amount_greater AS 
SELECT * FROM income_record WHERE amount > ALL (
    SELECT MIN(amount) FROM income_record WHERE category_id IN(
        SELECT category_id FROM income_category WHERE category_name='Business'
    )
);

--TASK5
CREATE VIEW Income_amount_less AS 
SELECT * FROM income_record WHERE amount < ALL (
    SELECT MAX(amount) FROM income_record WHERE category_id IN(
        SELECT category_id FROM income_category WHERE category_name='Business'
    )
);

--TASK6
CREATE VIEW Income_amount_Avg AS 
SELECT * FROM taxpayer WHERE amount > ALL (
    SELECT AVG(amount) FROM income_record 
);

--TASK7
CREATE VIEW IncomeCategory_record AS 
SELECT category_id,category_name FROM income_category WHERE category_id = ANY (
    SELECT category_id FROM income_category WHERE 
);

--TASK8
CREATE VIEW taxpayer_record AS
SELECT taxpayer_id , full_name FROM taxpayer WHERE taxpayer_id NOT IN (
    SELECT taxpayer_id FROM income_record WHERE category_id IN (
        SELECT category_id FROM income_category WHERE category_name='Investment'
    )
);


--LEVEL3
--TASK1
CREATE VIEW Highest_income AS
SELECT taxpayer_id , full_name FROM taxpayer WHERE taxpayer_id = (
    SELECT taxpayer_id FROM income_record WHERE amount =(
        SELECT MAX(amount) FROM income_record
        )
);


--TASK2
CREATE VIEW income_average_business AS 
SELECT * FROM income_record WHERE amount > (
    SELECT AVG(amount) FROM income_record WHERE category_id IN(
        SELECT category_id FROM income_category WHERE category_name='Business'
    )
);

--TASK3
CREATE VIEW tax_avg AS 
SELECT * FROM taxpayer WHERE taxpayer_id IN (
    SELECT taxpayer_id FROM taxpayer WHERE annual_income > (
        SELECT AVG(annual_income) FROM taxpayer
    )
);

--TASK4
CREATE VIEW income_investent AS
SELECT * FROM income_record WHERE amount > ANY ( 
    SELECT amount FROM income_record WHERE category_id = (
        SELECT category_id FROM income_category WHERE category_name='Investment'
    )
);

--TASK5
CREATE VIEW income_all AS
SELECT * FROM income_record WHERE amount > ALL ( 
    SELECT amount FROM income_record WHERE category_id = (
        SELECT category_id FROM income_category WHERE category_name='Investment'
    )
);

--TASK6
CREATE VIEW income_max AS 
SELECT * FROM income_category WHERE category_id IN (
    SELECT category_id FROM income_record WHERE amount = (
        SELECT MAX(amount) FROM income_record
    )
);

--TASK7
CREATE VIEW income_sum AS
SELECT financial_year, total_income
FROM
(
    SELECT financial_year,
           SUM(amount) AS total_income
    FROM Income_Record
    GROUP BY financial_year
) AS yearly_income
WHERE total_income =
(
    SELECT MAX(total_income)
    FROM
    (
        SELECT financial_year,
               SUM(amount) AS total_income
        FROM Income_Record
        GROUP BY financial_year
    ) AS yearly_totals
);

--TASK8
CREATE VIEW tax_sum_avg AS
SELECT *
FROM Taxpayer
WHERE taxpayer_id IN
(
    SELECT taxpayer_id
    FROM Income_Record
    GROUP BY taxpayer_id
    HAVING SUM(amount) >
    (
        SELECT AVG(total_income)
        FROM
        (
            SELECT taxpayer_id,
                   SUM(amount) AS total_income
            FROM Income_Record
            GROUP BY taxpayer_id
        ) AS taxpayer_totals
    )
);


--Real world ananlysis
--TASK1
CREATE VIEW taxa_maxi AS 
SELECT *
FROM Taxpayer
WHERE annual_income =
(
    SELECT MAX(annual_income)
    FROM Taxpayer
);

--TASK2
CREATE VIEW taxa_income AS
SELECT *
FROM Taxpayer
WHERE annual_income >
(
    SELECT AVG(annual_income)
    FROM Taxpayer
);

--TASK3
CREATE VIEW category_max AS 
SELECT *
FROM Income_Category
WHERE category_id IN
(
    SELECT category_id
    FROM Income_Record
    WHERE amount =
    (
        SELECT MAX(amount)
        FROM Income_Record
    )
);

--TASK4
 CREATE VIEW tax_busi_notinvest AS 
SELECT *
FROM Taxpayer
WHERE taxpayer_id IN
(
    SELECT taxpayer_id
    FROM Income_Record
    WHERE category_id IN
    (
        SELECT category_id
        FROM Income_Category
        WHERE category_name = 'Business'
    )
)
AND taxpayer_id NOT IN
(
    SELECT taxpayer_id
    FROM Income_Record
    WHERE category_id IN
    (
        SELECT category_id
        FROM Income_Category
        WHERE category_name = 'Investment'
    )
);

--TASK5
CREATE VIEW income_invest AS 
SELECT *
FROM Income_Record
WHERE amount > ALL
(
    SELECT amount
    FROM Income_Record
    WHERE category_id IN
    (
        SELECT category_id
        FROM Income_Category
        WHERE category_name = 'Investment'
    )
);

--TASK6
CREATE VIEW income_ANY AS
SELECT *
FROM Income_Record
WHERE amount > ANY
(
    SELECT amount
    FROM Income_Record
    WHERE category_id IN
    (
        SELECT category_id
        FROM Income_Category
        WHERE category_name = 'Investment'
    )
);

--TASK7
CREATE VIEW taxpa_sum_max AS 
SELECT *
FROM Taxpayer
WHERE taxpayer_id IN
(
    SELECT taxpayer_id
    FROM Income_Record
    GROUP BY taxpayer_id
    HAVING SUM(amount) =
    (
        SELECT MAX(total_income)
        FROM
        (
            SELECT taxpayer_id,
                   SUM(amount) AS total_income
            FROM Income_Record
            GROUP BY taxpayer_id
        ) AS taxpayer_totals
    )
);

--TASK8
CREATE VIEW income_avgorder AS
SELECT ir.*
FROM Income_Record ir,
(
    SELECT category_id,
           AVG(amount) AS avg_amount
    FROM Income_Record
    GROUP BY category_id
) AS category_average
WHERE ir.category_id = category_average.category_id
AND ir.amount > category_average.avg_amount;


