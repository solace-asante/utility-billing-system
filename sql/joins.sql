SELECT customer.name,city.city_name
FROM customer 
INNER JOIN city
ON customer.city_id = city.city_id;


SELECT customer.name,meter_info.meter_id,meter_info.meter_number
FROM customer
LEFT JOIN meter_info
ON customer.customer_id = meter_info.customer_id ;

SELECT 
  meter_info.meter_id,
  bill_info.bill_id,
  bill_info.bill_amount
FROM meter_info
LEFT JOIN bill_info
ON meter_info.meter_id = bill_info.meter_id;


SELECT 
  b.bill_id,
  b.bill_amount,
  b.payment_status,
  p.payment_id,
  p.amount_paid,
  p.payment_date,
  p.payment_method
FROM bill_info b
LEFT JOIN payment p ON b.bill_id = p.bill_id
 


 