USE Taxpayer;

--LEVEL1
--TASK1
SELECT * FROM Income_Record WHERE amount =(SELECT MAX(amount) FROM income_record);

--TASK2
SELECT * FROM Income_Record WHERE amount =(SELECT MIN(amount) FROM income_record); 

--TASK3
SELECT * FROM Income_Record WHERE amount > ALL (SELECT AVG(amount) FROM Income_record);

--TASK4
SELECT * FROM Income_Record WHERE amount =(SELECT MAX(amount) FROM income_record);

--TASK5
SELECT occupation,full_name FROM taxpayer WHERE occupation IN (SELECT occupation FROM taxpayer WHERE occupation="Business Owner");


--LEVEL2
--TASK1
SELECT taxpayer_id, full_name FROM taxpayer WHERE taxpayer_id = ANY (SELECT taxpayer_id FROM income_record);

--TASK2
SELECT taxpayer_id , full_name FROM taxpayer WHERE taxpayer_id  IN (SELECT taxpayer_id FROM income_record WHERE category_id=
(SELECT category_id FROM income_category WHERE category_name="Business"));

--TASK3
SELECT  * FROM income_record WHERE year_id IN (SELECT  year_id FROM financial_year WHERE year_label='2025-2026');

--TASK4
SELECT * FROM income_record WHERE amount > (SELECT MIN(amount) FROM income_record WHERE category_id=
(SELECT category_id FROM income_category WHERE category_name= 'Business'));

--TASK5
SELECT * FROM income_record WHERE amount < (SELECT MAX(amount) FROM income_record WHERE category_id=
(SELECT category_id FROM income_category WHERE category_name= 'Salary'));

--TASK6
SELECT taxpayer_id,full_name FROM taxpayer WHERE taxpayer_id IN(SELECT taxpayer_id FROM income_record WHERE amount >
 (SELECT AVG(amount) FROM income_record));

--TASK7
SELECT category_id , category_name FROM income_category WHERE category_id = ANY 
(SELECT category_id FROM income_record );

--TASK8
SELECT taxpayer_id, full_name FROM taxpayer WHERE taxpayer_id NOT IN (SELECT taxpayer_id FROM income_record WHERE category_id IN 
(SELECT category_id FROM income_category WHERE category_name='Investment'));


--LEVEL3
--TASK1
SELECT taxpayer_id , full_name FROM taxpayer WHERE taxpayer_id = (
    SELECT taxpayer_id FROM income_record WHERE amount =(
        SELECT MAX(amount) FROM income_record));

--TASK2
SELECT * FROM income_record  WHERE income_id IN ( 
    SELECT income_id FROM income_record WHERE amount > (
        SELECT AVG(amount) FROM income_record WHERE category_id=(
            SELECT category_id FROM income_category WHERE category_name=' Business'
        )
    )
);

--TASK3
SELECT * FROM taxpayer WHERE taxpayer_id IN (
    SELECT taxpayer_id FROM taxpayer WHERE annual_income > (
        SELECT AVG(annual_income) FROM taxpayer
    )
);

--TASK4
SELECT * FROM income_record WHERE amount > ANY ( 
    SELECT amount FROM income_record WHERE category_id = (
        SELECT category_id FROM income_category WHERE category_name='Investment'
    )
);

--TASK5
SELECT * FROM income_record WHERE amount > ALL ( 
    SELECT amount FROM income_record WHERE category_id = (
        SELECT category_id FROM income_category WHERE category_name='Investment'
    )
);

--TASK6
SELECT * FROM income_category WHERE category_id IN (
    SELECT category_id FROM income_record WHERE amount = (
        SELECT MAX(amount) FROM income_record
    )
);

--TASK7
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


--Real World Ananlysis 
--TASK1
SELECT *
FROM Taxpayer
WHERE annual_income =
(
    SELECT MAX(annual_income)
    FROM Taxpayer
);

--TASK2
SELECT *
FROM Taxpayer
WHERE annual_income >
(
    SELECT AVG(annual_income)
    FROM Taxpayer
);

--TASK3
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