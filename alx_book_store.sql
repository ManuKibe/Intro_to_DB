# MySQLServer.py

import mysql.connector
from mysql.connector import Error

def main():
    try:
        # Update credentials if your environment is different
        connection = mysql.connector.connect(
            host="localhost",
            user="root",
            password=""   # e.g., "root" if your setup uses a password
        )
        cursor = connection.cursor()

        # 1) MUST create database named exactly alxbookstore
        cursor.execute("CREATE DATABASE IF NOT EXISTS alxbookstore")
        cursor.execute("USE alxbookstore")

        # 2) Create tables (SQL keywords in UPPERCASE; no SELECT/SHOW anywhere)
        cursor.execute("""
            CREATE TABLE IF NOT EXISTS AUTHORS (
                author_id INT AUTO_INCREMENT PRIMARY KEY,
                author_name VARCHAR(215) NOT NULL
            )
        """)

        cursor.execute("""
            CREATE TABLE IF NOT EXISTS BOOKS (
                book_id INT AUTO_INCREMENT PRIMARY KEY,
                title VARCHAR(130) NOT NULL,
                author_id INT NOT NULL,
                price DOUBLE NOT NULL,
                publication_date DATE,
                FOREIGN KEY (author_id) REFERENCES AUTHORS(author_id)
            )
        """)

        cursor.execute("""
            CREATE TABLE IF NOT EXISTS CUSTOMERS (
                customer_id INT AUTO_INCREMENT PRIMARY KEY,
                customer_name VARCHAR(215) NOT NULL,
                email VARCHAR(215) UNIQUE NOT NULL,
                address TEXT
            )
        """)

        cursor.execute("""
            CREATE TABLE IF NOT EXISTS ORDERS (
                order_id INT AUTO_INCREMENT PRIMARY KEY,
                customer_id INT NOT NULL,
                order_date DATE NOT NULL,
                FOREIGN KEY (customer_id) REFERENCES CUSTOMERS(customer_id)
            )
        """)

        cursor.execute("""
            CREATE TABLE IF NOT EXISTS ORDER_DETAILS (
                orderdetailid INT AUTO_INCREMENT PRIMARY KEY,
                order_id INT NOT NULL,
                book_id INT NOT NULL,
                quantity DOUBLE NOT NULL,
                FOREIGN KEY (order_id) REFERENCES ORDERS(order_id),
                FOREIGN KEY (book_id) REFERENCES BOOKS(book_id)
            )
        """)

        connection.commit()

    except Error as err:
        # Required: exception handling present
        print(f"ERROR: {err}")
    finally:
        try:
            cursor.close()
        except Exception:
            pass
        try:
            connection.close()
        except Exception:
            pass

if __name__ == "__main__":
    main()
