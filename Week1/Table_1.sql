CREATE DATABASE Taxpayer ;
USE Taxpayer;
CREATE TABLE Taxpayer (
   taxpayer_id INT PRIMARY KEY ,
   pan_number VARCHAR(10) NOT NULL UNIQUE,
   full_name VARCHAR(100) NOT NULL,
   date_of_birth DATE NOT NULL,
   occupation VARCHAR(50) NOT NULL,
   annual_income DECIMAL(12,2) NOT NULL,
   email VARCHAR(100) UNIQUE,
   is_active BOOLEAN 
);

INSERT INTO Taxpayer() VALUES
               (102,'BCDEF2345G', 'Priya Sharma', '1992-11-22','Doctor',120000.00,'priya.sharma@example.com',TRUE),
               (103,'CDEFG3456H','Arjun Reddy','1988-03-10','Business Owner',180000.00,'arjun.reddy@example.com',TRUE),
               (104,'DEFGH4567J','Sneha Patel','1998-03-05','Teacher',620000.00,'sneha.patel@exmaple.com',TRUE),
               (105,'EFGHJ5678K','Kiran Rao','1990-01-18','Freelancer',750000.00,'kiran.rao@example.com',TRUE),
               (106,'FGHJK6789L','Meera Singh','1985-12-30','Consultant',150000.00,'meera.singh@example.com',FALSE);
SELECT * FROM Taxpayer;


INSERT INTO Taxpayer() VALUES (107,'GHJKL7893M','Siva kumar','2007-05-28','Software engineer',100000.00,'siva.kumar@example.com',TRUE);
UPDATE Taxpayer SET annual_income = 950000.00 WHERE taxpayer_id= 101;
UPDATE Taxpayer SET occupation='Software Consultant' WHERE taxpayer_id=105;
UPDATE Taxpayer SET is_active=TRUE WHERE taxpayer_id=106;
DELETE FROM  Taxpayer WHERE taxpayer_id=107;
ALTER TABLE Taxpayer ADD phone_number INT NOT NULL;
ALTER TABLE Taxpayer MODIFY COLUMN occupation VARCHAR(100) NOT NULL;


/* It's through an error column count doesn't match at row 1*/
INSERT INTO Taxpayer () VALUES (101,'GHJKL7893M','Siva kumar','2007-05-28','Software engineer',100000.00,'siva.kumar@example.com',TRUE);

/*It's through an error column count doesn't match at row 1*/
INSERT INTO Taxpayer() VALUES( 108, 'ABCDE1234F','Siva kumar','2007-05-28','Software engineer',100000.00,'siva.kumar@example.com',TRUE);

/*It's through an error column count doesn't match at row 1*/
INSERT INTO Taxpayer() VALUES( 108, '','Siva kumar','2007-05-28','Software engineer',100000.00,'siva.kumar@example.com',TRUE);


