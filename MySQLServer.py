#!/usr/bin/python3
import mysql.connector
from mysql.connector import Error

def create_database():
    try:
        # Connect to MySQL server (adjust user, password, host if needed)
        connection = mysql.connector.connect(
            host="localhost",
            user="root",       # Change this if your MySQL user is different
            password="password"  # Replace with your actual MySQL password
        )

        if connection.is_connected():
            cursor = connection.cursor()
            cursor.execute("CREATE DATABASE IF NOT EXISTS alx_book_store;")
            print("Database 'alx_book_store' created successfully!")

    except Error as e:
        print(f"Error: {e}")

    finally:
        if connection.is_connected():
            cursor.close()
            connection.close()
            # print("MySQL connection is closed")  # optional

if __name__ == "__main__":
    create_database()
