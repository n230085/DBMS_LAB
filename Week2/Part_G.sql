USE Taxpayer;

--task-1
SELECT name
FROM Taxpayer
WHERE taxpayer_id IN
(
SELECT taxpayer_id
FROM Income_Record
);



--task-2
SELECT *
FROM Taxpayer
WHERE occupation IN
(
SELECT DISTINCT t.occupation
FROM Taxpayer t
JOIN Income_Record i
ON t.taxpayer_id=i.taxpayer_id
JOIN Income_Category c
ON i.category_id=c.category_id
WHERE c.category_name='Business'
);