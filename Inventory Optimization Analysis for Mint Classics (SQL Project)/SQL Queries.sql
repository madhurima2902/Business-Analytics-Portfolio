-- To confirm whether the mintclassics database has been uploaded
SHOW databases;

-- To select 'mintclassics' databse to work on
USE mintclassics;

-- To show a list of tables in 'mintclassics' database
show tables;

-- This query lists all entries warehouses table
select * FROM warehouses;

-- This query lists unique warehouse code and names
SELECT DISTINCT warehouseCode, warehouseName
FROM warehouses;

-- Count of products stored at each warehouse
SELECT w.warehouseName , COUNT(DISTINCT p.productcode) AS total_products
FROM products p
JOIN warehouses w ON p.warehousecode = w.warehousecode
GROUP BY w.warehousename
ORDER BY total_products DESC;

-- Retrieving total stock at each warehouse
SELECT w.warehouseName , SUM(p.	quantityinstock) AS total_units_in_stock
FROM products p
JOIN warehouses w ON p.warehousecode = w.warehousecode
GROUP BY w.warehousename
ORDER BY total_units_in_stock DESC;

-- Finding out list of products stored in multiple warehouses
SELECT productcode, COUNT(DISTINCT warehousecode) AS warehouse_count
FROM products
GROUP BY productcode
HAVING warehouse_count > 1
ORDER BY warehouse_count DESC;
-- OUTPUT -> 0 rows selected indicating that products are not stored in multiple warehouses
-- Finding out warehouses with few products
SELECT w.warehousename, COUNT(p.productcode) AS num_of_products
FROM warehouseS w
JOIN productS p on w.warehousecode = p.warehousecode
GROUP BY w.warehousename
-- HAVING num_of_products < 10
ORDER BY num_of_products ASC;
-- OUTPUT -> 0 rows selected indicating all warehouses have >10 different types of products ( min value is 23)

