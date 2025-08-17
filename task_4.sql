-- task_4.sql
-- This script prints the full description of the table 'books'
-- from the database 'alx_book_store' passed as argument.

SELECT 
    COLUMN_NAME,
    COLUMN_TYPE,
    IS_NULLABLE,
    COLUMN_KEY,
    COLUMN_DEFAULT,
    EXTRA
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = DATABASE()
  AND TABLE_NAME = 'books'
ORDER BY ORDINAL_POSITION;
