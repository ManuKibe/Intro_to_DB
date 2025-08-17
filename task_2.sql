-- task_2.sql
-- Script to create tables for alx_book_store

USE alx_book_store;

-- =========================
-- CREATE AUTHORS TABLE
-- =========================
CREATE TABLE IF NOT EXISTS AUTHORS (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    bio TEXT
);

-- =========================
-- CREATE BOOKS TABLE
-- =========================
CREATE TABLE IF NOT EXISTS BOOKS (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    author_id INT NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    published_year YEAR,
    genre VARCHAR(100),
    CONSTRAINT fk_books_authors FOREIGN KEY (author_id) REFERENCES AUTHORS(author_id)
);

-- =========================
-- CREATE CUSTOMERS TABLE
-- =========================
CREATE TABLE IF NOT EXISTS CUSTOMERS (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    phone VARCHAR(20),
    address VARCHAR(255)
);

-- =========================
-- CREATE ORDERS TABLE
-- =========================
CREATE TABLE IF NOT EXISTS ORDERS (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    total_amount DECIMAL(10,2) NOT NULL,
    CONSTRAINT fk_orders_customers FOREIGN KEY (customer_id) REFERENCES CUSTOMERS(customer_id)
);

-- =========================
-- CREATE ORDER_DETAILS TABLE
-- =========================
CREATE TABLE IF NOT EXISTS ORDER_DETAILS (
    order_detail_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    book_id INT NOT NULL,
    quantity INT NOT NULL CHECK (quantity > 0),
    price DECIMAL(10,2) NOT NULL,
    CONSTRAINT fk_orderdetails_orders FOREIGN KEY (order_id) REFERENCES ORDERS(order_id),
    CONSTRAINT fk_orderdetails_books FOREIGN KEY (book_id) REFERENCES BOOKS(book_id)
);
