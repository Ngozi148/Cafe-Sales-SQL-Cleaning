
CREATE TABLE dirty_sales_worksheet
LIKE dirty_cafe_sales;

SELECT *
FROM dirty_sales_worksheet;

INSERT dirty_sales_worksheet
SELECT *
FROM dirty_cafe_sales; 


-- Removing Duplicates

SELECT *,
ROW_NUMBER() OVER(PARTITION BY `Transaction ID`, `Item`, `Quantity`, `Price per Unit`, `Total spent`,
`Payment method`, `Location`, `Transaction date`) AS row_num
FROM dirty_sales_worksheet;


WITH duplicate_cte AS
 (SELECT *,
ROW_NUMBER() OVER(PARTITION BY `Transaction ID`, `Item`, `Quantity`, `Price per Unit`, `Total spent`,
`Payment method`, `Location`, `Transaction date`
ORDER BY `Transaction ID` ASC) AS row_num
FROM dirty_sales_worksheet
)
SELECT *
FROM duplicate_cte
WHERE row_num > 1;

SELECT *
FROM dirty_sales_worksheet;



-- Standardizing Data

UPDATE dirty_sales_worksheet
SET `Transaction ID`=TRIM(`Transaction ID`),
`item`=TRIM(`Item`), `Quantity`=TRIM(`Quantity`),
`Price per unit`=TRIM(`Price per unit`), `Total spent`=TRIM(`Total spent`),
`Payment method`=TRIM(`Payment method`), `Location`=TRIM(`Location`),
`Transaction date`=TRIM(`Transaction date`);


-- Fixing Math Errors

SELECT *
FROM dirty_sales_worksheet;

UPDATE dirty_sales_worksheet
SET `Total Spent` = `Quantity` * `Price Per Unit`
WHERE `Total Spent`= 'ERROR'
   OR  `Total Spent` = 'UNKNOWN'
   OR `Total Spent` = '';

SELECT *
FROM dirty_sales_worksheet;



-- Standardize text column

UPDATE dirty_sales_worksheet
SET `Payment Method` = 'Not Specified'
WHERE `Payment Method` = 'ERROR'
    OR `Payment Method` = 'UNKNOWN'
    OR `Payment Method` = '';
    
SELECT *
FROM dirty_sales_worksheet;

UPDATE dirty_sales_worksheet
SET `Location` = 'Not Specified'
WHERE `Location` = 'ERROR'
    OR `Location` = 'UNKNOWN'
    OR `Location` = '';
    
    
UPDATE dirty_sales_worksheet
SET `item` = 'Not Specified'
WHERE `item` = 'ERROR'
    OR `item` = 'UNKNOWN'
    OR `item`= ''; 
    
SELECT *
FROM dirty_sales_worksheet;



-- Time Series

UPDATE dirty_sales_worksheet
SET `Transaction Date` = STR_TO_DATE(`Transaction Date`, '%m/%d/%Y')
WHERE `Transaction Date` NOT IN ( 'ERROR', 'UNKNOWN', '');


UPDATE dirty_sales_worksheet
SET `Transaction Date` = NULL
WHERE `Transaction Date` IN ( 'ERROR', 'UNKNOWN', '');

SELECT *
FROM dirty_sales_worksheet;

ALTER TABLE dirty_sales_worksheet
MODIFY COLUMN `Transaction Date` DATE;

DESCRIBE dirty_sales_worksheet;


ALTER TABLE dirty_sales_worksheet
MODIFY COLUMN `Total Spent`
DECIMAL(10,2),
MODIFY COLUMN `Price Per Unit`
DECIMAL(10,2);


UPDATE dirty_sales_worksheet
SET `Total Spent` = `Quantity` * `Price Per Unit`;

SELECT *
FROM dirty_sales_worksheet;



















    
   
  
  
  
  
  
    
    
    

    
    
    
    






















