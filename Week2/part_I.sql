USE Taxpayer;

--task-1
SELECT *
FROM Taxpayer t
WHERE EXISTS
(
SELECT *
FROM Income_Record i
WHERE i.taxpayer_id=t.taxpayer_id
);

--task-2
SELECT *
FROM Financial_Year f
WHERE EXISTS
(
SELECT *
FROM Income_Record i
WHERE i.year_id=f.year_id
);
