USE Taxpayer;

--task-1
INSERT INTO Income_Record() VALUES (1007,999,'ABC Company',50000.00,'2026-04-01',1,1);

--task-2
INSERT INTO Income_Record() VALUES (1008,101,'ABC Company',50000.00,'2026-02-1',20,1);

--task-3
INSERT INTO Income_Record() VALUES (1009,101,'ABC Company', 50000.00,'2020-02-1',1,15)

--task-4
DELETE FROM Taxpayer WHERE taxpayer_id =101;


--task-5
DELETE FROM Income_Category WHERE category_id=1;
INSERT INTO Income_Category () VALUES (1,'Salary', 'Income recieved from employment',TRUE);

--task-6
/* Notes work*/