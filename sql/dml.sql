 
UPDATE customer
SET phone_no = '0244999888'
WHERE customer_id = 1;

 

UPDATE bill_info
SET payment_status = 'Paid'
WHERE bill_id = 2;

 
INSERT INTO city (city_id, city_name, region)
VALUES (6, 'Sunyani', 'Bono');

 
SELECT * FROM city WHERE city_id = 6;


 
INSERT INTO customer (customer_id, name, city_id, customer_type, phone_no)
VALUES (51, 'Kwame Boateng', 6, 'Residential', '0244678123');


SELECT * FROM customer WHERE customer_id = 51;



INSERT INTO meter_info (meter_id, customer_id, meter_number)
VALUES (51, 51, 'GH-ME-105158');

 
 
DELETE FROM meter_info
WHERE meter_id = 51;

 
 
DELETE FROM customer
WHERE customer_id = 51;
 

DELETE FROM city
WHERE city_id = 6;
 