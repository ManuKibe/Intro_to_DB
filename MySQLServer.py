#!/usr/bin/python3
"""
MySQLServer.py
Script to create the database 'alx_book_store' in MySQL server.
"""

import mysql.connector
from mysql.connector import Error

def create_database():
    try:
        # Connect to MySQL server (update host, user, and password as per your setup)
        connection = mysql.connector.connect(
            host="localhost",
            user="root",          # replace with your MySQL username
            password="password"   # replace with your MySQL password
        )

        if connection.is_connected():
            cursor = connection.cursor()
            # Create database if it does not exist
            cursor.execute("CREATE DA
