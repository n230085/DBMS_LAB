USE Taxpayer;

CREATE TABLE Income_Category (
      catagory_id INT PRIMARY KEY,
      category_name VARCHAR(50) NOT NULL,
      des_cription VARCHAR(200) NOT NULL,
      taxable BOOLEAN NOT NULL
);

INSERT INTO Income_Category() VALUES
						(1,'Salary','Income recieved from employment',TRUE),
                                    (2,'Business','Income earned from business activities',TRUE),
                                    (3,'House Property','Income received from property or rent ',TRUE),
                                    (4,'Capital Gains', 'Income such as bank interst', TRUE),
                                    (5,'Other Sources','Income such as bank interest',TRUE),
                                    (6,'Agricultural Income','Income from eligible agricultural activities', TRUE);

SELECT * FROM Income_Category;

ALTER TABLE Income_Category RENAME COLUMN catagory_id TO category_id;