# Utility Bill Management System

A MySQL project developed after a semester exam in which I was asked to design an ERD for a utility billing system. After the exam, I decided to implement the design by building a database, loading structured data, and writing SQL queries to work with it.

The system represents a simple utility billing workflow involving customers, meters, and bills. The dataset is based on a Ghanaian context, including local city names, customer names, and phone number formats.



## Project Structure

```
UTILITY_BILL/
├── data/
│   ├── city.csv
│   ├── customer.csv
│   ├── commercial_cust_detail.csv
│   ├── meter_info.csv
│   ├── bill_info.csv
│   └── payment.csv
├── diagrams/
│   └── Electricity_edr.drawio.png
├── sql/
│   ├── schema.sql
│   ├── seed.sql
│   ├── analytics.sql
│   ├── joins.sql
│   └── dml.sql
└── README.md
```



## Schema

6 tables with foreign key relationships:

```
city
 └── customer
       ├── commercial_cust_detail
       └── meter_info
             └── bill_info
                   └── payment
```





## Setup

1. Clone the repo and open in your MySQL client
2. Run `schema.sql` to create the tables
3. Run `seed.sql` to load the CSV data

 



## What each SQL file does

`schema.sql` — creates all 6 tables with primary keys and foreign key constraints

`seed.sql` — loads the CSV files into the database using LOAD DATA LOCAL INFILE. Tables are loaded in parent-to-child order so foreign keys do not fail

`analytics.sql` — basic SELECT queries: customer counts by type and city, total bills, paid bill count, payment method breakdown

`joins.sql` — JOIN queries across the tables: customers with their city, customers with their meter, meters with their bills, bills with payment details

`dml.sql` — INSERT, UPDATE and DELETE examples. Inserts follow parent-to-child order, deletes follow child-to-parent order to respect foreign key constraints



## Challenges

The data was originally generated with Python Faker which creates realistic looking values but has no awareness of table relationships. So meter IDs pointed to customers that did not exist, payment records referenced bills that were never created and foreign key errors appeared the moment I tried to load everything together. I ended up writing all the data manually to make sure every foreign key had a valid parent.

The other issue was CSV line endings. After loading the bill_info table the payment_status column was returning NULL for almost every row even though the data looked correct. After some debugging I found the CSV had Windows line endings (CRLF) so MySQL was storing `Paid\r` instead of `Paid`. The WHERE clause could not match it. Fixed by switching the file to LF in VS Code.

Also had to ALTER the meter_number column from INT to VARCHAR(20) after the table was already created because the meter numbers follow the format GH-ME-XXXXXX which MySQL was truncating to 0.



## Author

Solace Asante
