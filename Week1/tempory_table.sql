USE Taxpayer;

CREATE TABLE Tax_Office (
      office_id INT PRIMARY KEY,
      office_name VARCHAR(10) NOT NULL,
      city VARCHAR(10) NOT NULL
);

INSERT INTO  Tax_Office() VALUES (1,'Dell','HYderabad'),
                                 (2,'Microsoft','Mumbai');
                                 
DROP TABLE Tax_Office ;
