SET FOREIGN_KEY_CHECKS = 0;

TRUNCATE TABLE payment;
TRUNCATE TABLE bill_info;
TRUNCATE TABLE meter_info;
TRUNCATE TABLE commercial_cust_detail;
TRUNCATE TABLE customer;
TRUNCATE TABLE city;

SET FOREIGN_KEY_CHECKS = 1;


LOAD DATA LOCAL INFILE '/Users/dyamond/Desktop/utility_bill/data/city.csv'
INTO TABLE city
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;


LOAD DATA LOCAL INFILE '/Users/dyamond/Desktop/utility_bill/data/customer.csv'
INTO TABLE customer
FIELDS TERMINATED by ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 rows;
 
LOAD DATA LOCAL INFILE '/Users/dyamond/Desktop/utility_bill/data/commercial_cust_detail.csv'
INTO TABLE commercial_cust_detail
FIELDS TERMINATED by ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 rows;

LOAD DATA LOCAL INFILE '/Users/dyamond/Desktop/utility_bill/data/meter_info.csv'
INTO TABLE meter_info
FIELDS TERMINATED by ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 rows;

LOAD DATA LOCAL INFILE '/Users/dyamond/Desktop/utility_bill/data/bill_info.csv'
INTO TABLE bill_info
FIELDS TERMINATED by ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 rows;

LOAD DATA LOCAL INFILE '/Users/dyamond/Desktop/utility_bill/data/payment.csv'
INTO TABLE payment
FIELDS TERMINATED by ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 rows;



