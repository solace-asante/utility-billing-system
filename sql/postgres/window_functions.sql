-- Customers with their city and the number of customers in that city
SELECT
    c.name,
    ci.city_name,
    COUNT(c.customer_id) OVER (PARTITION BY ci.city_name) AS total_customers
FROM customer c
INNER JOIN city ci USING (city_id);

-- Payments numbered within each payment method, newest first
SELECT
    payment_id,
    payment_method,
    payment_date,
    ROW_NUMBER() OVER (
        PARTITION BY payment_method
        ORDER BY payment_date DESC, payment_id DESC
    ) AS payment_seq
FROM payment;

-- Payments ranked within each method by amount
SELECT
    payment_method,
    amount_paid,
    RANK() OVER (PARTITION BY payment_method ORDER BY amount_paid DESC) AS payment_rank,
    DENSE_RANK() OVER (PARTITION BY payment_method ORDER BY amount_paid DESC) AS payment_dense_rank
FROM payment;

-- Get each payment and it's  previous payment with  the changes between them
SELECT
    payment_method,
    payment_date,
    amount_paid,
    LAG(amount_paid) OVER (PARTITION BY payment_method ORDER BY payment_date, payment_id) AS previous_amount,

    amount_paid - LAG(amount_paid) OVER (PARTITION BY payment_method ORDER BY payment_date, payment_id) AS difference
FROM payment;

-- Running total of payments within each payment method
SELECT
    payment_method,
    payment_date,
    amount_paid,
    SUM(amount_paid) OVER (PARTITION BY payment_method ORDER BY payment_date, payment_id) AS running_total
FROM payment;


-- Payments that were more than 50 higher than the previous payment of the same payment method
WITH payment_changes AS (
    SELECT
        payment_method,
        payment_date,
        amount_paid,
        LAG(amount_paid) OVER (PARTITION BY payment_method ORDER BY payment_date, payment_id) AS previous_amount
    FROM payment
)
SELECT
    payment_method,
    payment_date,
    amount_paid,
    previous_amount,
    amount_paid - previous_amount AS difference
FROM payment_changes
WHERE amount_paid - previous_amount > 50;




