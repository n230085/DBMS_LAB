USE Taxpayer;

--task-1
SELECT *
FROM Taxpayer t
WHERE NOT EXISTS
(
SELECT *
FROM Income_Record i
WHERE i.taxpayer_id=t.taxpayer_id
);


--task-2
SELECT *
FROM Income_Category c
WHERE NOT EXISTS
(
SELECT *
FROM Income_Record i
WHERE i.category_id=c.category_id
);


