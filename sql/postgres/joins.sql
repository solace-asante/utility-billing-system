

SELECT c.name,ci.city_name
FROM customer c
INNER JOIN city ci
USING (city_id );


SELECT c.name,c.customer_type,m.meter_id,m.meter_number
FROM customer c
INNER JOIN meter_info m
USING (customer_id)
ORDER BY c.name;

SELECT c.name,p.amount_paid
FROM customer c
LEFT JOIN meter_info m USING(customer_id)
LEFT JOIN bill_info b USING(meter_id)
LEFT JOIN payment p USING(bill_id);


SELECT c.name,ci.city_name,m.meter_number,p.amount_paid
FROM customer c
LEFT JOIN city ci USING(city_id)
LEFT JOIN meter_info m USING(customer_id)
LEFT JOIN bill_info b USING(meter_id)
LEFT JOIN payment p USING(bill_id)
ORDER BY c.name;

