-- task_6.sql
-- This script inserts multiple rows into the 'customer' table 
-- of the 'alx_book_store' database.
-- The database name is expected to be passed as an argument 
-- to the mysql command.

USE alx_book_store;

INSERT INTO customer (customer_name, email, address) VALUES
    ('Blessing Malik', 'bmalik@sandtech.com', '124 Happiness Ave.'),
    ('Obed Ehoneah', 'eobed@sandtech.com', '125 Happiness Ave.'),
    ('Nehemial Kamolu', 'nkamolu@sandtech.com', '126 Happiness Ave.');
