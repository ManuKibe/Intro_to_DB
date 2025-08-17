#!/usr/bin/python3
"""
Python script to create a MySQL database alx_book_store
"""

import mysql.connector

try:
    # Connect to MySQL server (update user/password as needed)
    connection = mysql.connector.connect(
        host="localhost",
        user="root",
        password="your_password"
    )

    if connection.is_connected():
        cursor = connection.cursor()
        cursor.execute("CREATE DATABASE IF NOT EXISTS alx_book_store")
        print("Database 'alx_book_store' created successfully!")

except mysql.connector.Error as err:
    print(f"Error: {err}")

finally:
    try:
        if connection.is_connected():
            cursor.close()
            connection.close()
    except NameError:
        # connection was never created
        pass
