USE Taxpayer;

--task-1
SELECT *
FROM Taxpayer
WHERE taxpayer_id NOT IN
(
SELECT taxpayer_id
FROM Income_Record
);

--task-2
SELECT DISTINCT occupation
FROM Taxpayer
WHERE taxpayer_id NOT IN
(
SELECT taxpayer_id
FROM Income_Record
);