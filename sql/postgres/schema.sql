CREATE TABLE city (
  city_id INT PRIMARY KEY,
  city_name VARCHAR(100),
  region VARCHAR(100)
);

CREATE TABLE customer (
  customer_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  name VARCHAR(100),
  city_id INT,
  customer_type VARCHAR(100),
  phone_no VARCHAR(20),
  CONSTRAINT fk_customer_city
    FOREIGN KEY (city_id) REFERENCES city(city_id)
);

CREATE TABLE commercial_cust_detail (
  customer_id INT PRIMARY KEY,
  company_name VARCHAR(100),
  registration_no VARCHAR(100),
  CONSTRAINT fk_commercial_customer
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
);

CREATE TABLE meter_info (
  meter_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  customer_id INT,
  meter_number VARCHAR(20) UNIQUE,
  CONSTRAINT fk_meter_customer
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
);

CREATE TABLE bill_info (
  bill_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  meter_id INT,
  bill_amount NUMERIC(10,2),
  bill_date DATE,
  due_date DATE,
  payment_status VARCHAR(100),
  CONSTRAINT fk_bill_meter
    FOREIGN KEY (meter_id) REFERENCES meter_info(meter_id)
);

CREATE TABLE payment (
  payment_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  bill_id INT,
  amount_paid NUMERIC(10,2),
  payment_date TIMESTAMP,
  payment_method VARCHAR(100),
  CONSTRAINT fk_payment_bill
    FOREIGN KEY (bill_id) REFERENCES bill_info(bill_id)
);