--LEVEL-1
SELECT annual_income,
ROUND(annual_income) AS rounded_income FROM Taxpayer;

SELECT annual_income,
ABS(annual_income - 500000) AS difference_value FROM Taxpayer;

SELECT annual_income,
POWER(annual_income,2) AS income_square FROM Taxpayer;

--LEVEL-2
SELECT annual_income,
MOD(annual_income,1000) AS remainded_two_decimal FROM Taxpayer;

SELECT annual_income, 
ROUND(annual_income,2) AS rounded_two_decimal FROM Taxpayer;

SELECT annual_income,
CEIL(annual_income) AS celling_value, FLOOR(annual_income) AS floor_value FROM Taxpayer;

--LEVEL-3
SELECT FLOOR(RAND()*100)*1 AS random_number ;

SELECT annual_income,
SQRT(annual_income) AS square_root FROM Taxpayer;

SELECT annual_income,
annual_income*1.10 AS income_after_increament FROM Taxpayer;
