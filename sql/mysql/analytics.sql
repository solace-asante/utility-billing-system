 --get customers information

 SELECT COUNT(*) FROM customer;

 SELECT COUNT(*) FROM customer
 WHERE customer_type = 'Commercial';

 SELECT COUNT(*) FROM customer
 WHERE customer_type = 'Residential';

SELECT city_id, COUNT(*)
FROM customer
GROUP BY city_id;


 --get bill_info

 SELECT  SUM(bill_amount) FROM bill_info;

 SELECT COUNT(*) FROM bill_info
 WHERE payment_status = 'Paid'; 



-- payment info
SELECT payment_method, COUNT(*)
FROM payment
GROUP BY payment_method;