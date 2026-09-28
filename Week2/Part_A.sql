USE Taxpayer;

SELECT * FROM Income_record;


-- part-A
--step-1
ALTER TABLE Income_record DROP COLUMN category_name ,DROP COLUMN financial_year;

--step-2
ALTER TABLE Income_record ADD category_id INT NOT NULL;
ALTER TABLE Income_record ADD year_id INT NOT NULL;


--step-3
ALTER TABLE Income_Record ADD CONSTRAINT fx_taxpayer FOREIGN KEY (taxpayer_id) REFERENCES Taxpayer(taxpayer_id);
ALTER TABLE Income_Record ADD CONSTRAINT fx_category  FOREIGN KEY (category_id) REFERENCES Income_Category(category_id);
AlTER TABLE Income_Record ADD CONSTRAINT fx_financial_year FOREIGN KEY (year_id) REFERENCES Financial_Year(year_id);

SHOW CREATE TABLE Income_Record;

--step-4
UPDATE Income_Record SET category_id =1 WHERE income_id=1001;
UPDATE Income_Record SET year_id =2001 WHERE income_id=1001;
UPDATE Income_Record SET category_id =2 WHERE income_id=1002;
UPDATE Income_Record SET year_id =2002 WHERE income_id=1002;
UPDATE Income_Record SET category_id =3 WHERE income_id=1003;
UPDATE Income_Record SET year_id =2003 WHERE income_id=1003;

