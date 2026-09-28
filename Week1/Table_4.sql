-- Active: 1784099446420@@127.0.0.1@3306@taxpayer
USE Taxpayer;

CREATE TABLE Income_Record(
     income_id INT PRIMARY KEY,
     taxpayer_id INT NOT NULL,
     income_source VARCHAR(100) NOT NULL,
     category_name VARCHAR(50) NOT NULL,
     amount DECIMAL(12,2) NOT NULL,
     recieved_date DATE NOT NULL,
     financial_year VARCHAR(9) NOT NULL
);

INSERT INTO Income_Record() 
VALUES
(1001,101,'TechNova Solutions', 'Salary', 850000.00 ,'2026-03-31','2025-2026'),
(1002, 102, 'City Care Hospital' ,'Salary', 1200000.00,'2026-03-31' ,'2025-2026'),
(1003,103,'Reddy Enterprises', 'Business', 1800000.00 ,'2026-03-31', '2025-2026'),
(1004 ,104, 'Sunrise School', 'Salary',620000.00,'2026-03-31','2025-2026'),
(1005,105,'Web Design Projects','Business',750000.00,'2026-03-31','2025-2026'),
(1006,106,'Professional Consultanting','Business',1500000.00,'2026-03-31','2025-2026');

SELECT * FROM Income_Record;

ALTER TABLE Income_Record ADD Rental_Income INT NOT NULL;
ALTER TABLE Income_Record ADD remarks INT NOT NULL;


ALTER TABLE Income_Record
ADD COLUMN financial_year VARCHAR(9);

UPDATE Income_Record
SET financial_year = '2023-2024'
WHERE income_id IN (1, 2);

UPDATE Income_Record
SET financial_year = '2024-2025'
WHERE income_id IN (3, 4);

UPDATE Income_Record
SET financial_year = '2025-2026'
WHERE income_id IN (5, 6, 7);