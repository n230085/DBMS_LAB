USE Taxpayer;


--LEVEL-1
SELECT UPPER(full_name) AS taxpayer_name FROM Taxpayer;

SELECT LOWER(occupation) AS occupation FROM Taxpayer;

SELECT full_name, LENGTH(full_name) AS name_length FROM Taxpayer;

SELECT pan_number , LEFT(pan_number,4) AS first_four FROM Taxpayer;

SELECT CONCAT(full_name ,'-',occupation) AS details FROM Taxpayer;


--LEVEL-2
SELECT category_name,
REPLACE(category_name,'Income','Inc.') AS new_category FROM Income_Category;

SELECT full_name , TRIM(full_name) AS trimmed_name FROM Taxpayer;

SELECT  full_name , SUBSTRING_INDEX(full_name,' ',1) AS first_name FROM Taxpayer;


--LEVEL-3

SELECT CONCAT('Taxpayer :' ,full_name,'| Ocuupation : ' , occupation) AS display_info FROM Taxpayer;


SELECT * FROM Taxpayer WHERE pan_number LIKE 'AP%';


