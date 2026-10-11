-- Total number of customers
SELECT COUNT(*) AS total_customers
FROM customer;

-- Customers per customer_type
SELECT customer_type, COUNT(customer_id) AS customers
FROM customer
GROUP BY customer_type;

-- Total, average and largest bill across all bills
SELECT
  SUM(bill_amount) AS total_billed,
  AVG(bill_amount) AS average_bill,
  MAX(bill_amount) AS largest_bill
FROM bill_info;

-- Bills per payment status: how many
SELECT 
  payment_status, 
  COUNT(bill_id) AS bills_count, 
  SUM(bill_amount) AS total_amount
FROM bill_info
GROUP BY payment_status;

-- Payments per payment  
SELECT 
  payment_method, 
  COUNT(payment_id) AS payment_count, 
  SUM(amount_paid) AS total_amount_paid
FROM payment
GROUP BY payment_method;

-- Cities with more than 5 customers
SELECT 
  ci.city_name, 
  COUNT(c.customer_id) AS total_customers
FROM city ci
JOIN customer c USING (city_id)
GROUP BY ci.city_name
HAVING COUNT(c.customer_id) > 5;

-- Total pending billed amount per city
SELECT 
  ci.city_id, 
  ci.city_name, 
  SUM(bill_amount) AS total_pending_amount
FROM city ci
JOIN customer USING (city_id)
JOIN meter_info USING (customer_id)
JOIN bill_info b USING (meter_id)
WHERE b.payment_status = 'Pending'
GROUP BY ci.city_id, ci.city_name;

-- Customers whose total billed amount is above 400
SELECT 
  c.customer_id, 
  c.name, 
  SUM(bill_amount) AS total_billed
FROM customer c
JOIN meter_info USING (customer_id)
JOIN bill_info USING (meter_id)
GROUP BY c.customer_id, c.name
HAVING SUM(bill_amount) > 400;

