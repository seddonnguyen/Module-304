/*
**Step 1:**
1. CREATE three users OF VARYING levels TO interact WITH your DATABASE.
2. Grant PRIVILEGES based ON the LEVEL specified FOR EACH USER.

**Step 2:**
- CREATE three TABLES, including relationships FOR EACH TABLE, WITH USER #1.

**Step 3:**
- INSERT five entities (ROWS) INTO EACH TABLE. Use TCL TO COMMIT the changes AT the END OF the TRANSACTION
WITH USER #2.

**Step 4:**
- CREATE three different queries USING joins OR subqueries TO display the relationships BETWEEN these TABLES WITH USER #3.
*/

-- Step 1
-- 1. Create three users
# CREATE USER 'user1'@'localhost' IDENTIFIED BY 'password1';
# CREATE USER 'user2'@'localhost' IDENTIFIED BY 'password2';
# CREATE USER 'user3'@'localhost' IDENTIFIED BY 'password3';

# -- 2. Grant privileges
# GRANT ALL PRIVILEGES ON classicmodels.* TO 'user1'@'localhost';
# GRANT SELECT, INSERT ON classicmodels.* TO 'user2'@'localhost';
# GRANT SELECT ON classicmodels.* TO 'user3'@'localhost';

-- Step 2
-- 1. Create three tables
# CREATE TABLE product
# (
#     id    INT PRIMARY KEY AUTO_INCREMENT,
#     name  VARCHAR(255) NOT NULL,
#     price DECIMAL(10, 2) DEFAULT 0.0
# );
#
# CREATE TABLE brand
# (
#     id           INT PRIMARY KEY AUTO_INCREMENT,
#     name         VARCHAR(255) NOT NULL,
#     brand_markup DECIMAL(10, 2) DEFAULT 0.0
# );
#
# CREATE TABLE product_brand
# (
#     product_id INT,
#     brand_id   INT,
#     PRIMARY KEY (product_id, brand_id),
#     FOREIGN KEY (product_id) REFERENCES product (id)
#         ON DELETE CASCADE
#         ON UPDATE CASCADE,
#     FOREIGN KEY (brand_id) REFERENCES brand (id)
#         ON DELETE CASCADE
#         ON UPDATE CASCADE
# );
#
# CREATE TABLE order_product_brand
# (
#     id             INT PRIMARY KEY AUTO_INCREMENT,
#     product        VARCHAR(255) NOT NULL,
#     brand          VARCHAR(255) NOT NULL,
#     qty            INT            DEFAULT 0,
#     price_per_unit DECIMAL(10, 2) DEFAULT 0.0,
#     total_price    DECIMAL(10, 2) AS (CAST(qty AS DECIMAL(10, 2)) * price_per_unit) STORED
# );

# -- Step 3
# -- 1. Insert five entities into each table

-- START TRANSACTION;

# INSERT INTO product (name, price)
# WITH RECURSIVE
#     n AS (SELECT 1 AS num
#           UNION ALL
#           SELECT num + 1
#           FROM n
#           WHERE num < 20),
#     p AS (SELECT num, CONCAT('Product ', num) AS name, TRUNCATE(RAND() * 100, 2) AS price FROM n)
# SELECT name, price
# FROM p
# ORDER BY num;
#
# INSERT INTO brand (name, brand_markup)
# WITH RECURSIVE
#     n AS (SELECT 1 AS num
#           UNION ALL
#           SELECT num + 1
#           FROM n
#           WHERE num < 20),
#     b AS (SELECT num, CONCAT('Brand ', num) AS name, TRUNCATE(RAND() * 0.6, 2) AS brand_markup FROM n)
# SELECT name, brand_markup
# FROM b
# ORDER BY num;

# INSERT INTO product_brand (product_id, brand_id)
# WITH RECURSIVE n AS (SELECT 1 AS num,
#                             (SELECT id FROM product ORDER BY RAND() LIMIT 1) AS product_id,
#                             (SELECT id FROM brand ORDER BY RAND() LIMIT 1)   AS brand_id
#                      UNION ALL
#                      SELECT num + 1,
#                             (SELECT id FROM product ORDER BY RAND() LIMIT 1),
#                             (SELECT id FROM brand ORDER BY RAND() LIMIT 1)
#                      FROM n
#                      WHERE num < 100)
# SELECT product_id, brand_id
# FROM n
# GROUP BY 1, 2;
#
# SELECT *
# FROM product_brand;

# INSERT INTO order_product_brand (product, brand, qty, price_per_unit)
# WITH RECURSIVE n AS (SELECT 1                                                            AS num,
#                             (SELECT brand_id FROM product_brand ORDER BY RAND() LIMIT 1) AS brand_id,
#                             (SELECT product_id
#                              FROM product_brand pb
#                              WHERE pb.brand_id = brand_id
#                              ORDER BY RAND()
#                              LIMIT 1)                                                    AS product_id
#                      UNION ALL
#                      SELECT num + 1,
#                             (SELECT brand_id FROM product_brand ORDER BY RAND() LIMIT 1),
#                             (SELECT product_id
#                              FROM product_brand pb
#                              WHERE pb.brand_id = brand_id
#                              ORDER BY RAND()
#                              LIMIT 1)
#                      FROM n
#                      WHERE num < 1000)
# SELECT p.name                                   AS product,
#        b.name                                   AS brand,
#        FLOOR(RAND() * 10) + 1                   AS qty,
#        ROUND(p.price * (1 + b.brand_markup), 2) AS price_per_unit
# FROM n
#     JOIN product p ON n.product_id = p.id
#     JOIN brand b ON n.brand_id = b.id
# ORDER BY num;

# SELECT *
# FROM product;
#
# SELECT *
# FROM brand;
#
# SELECT *
# FROM product_brand;

# SELECT *
# FROM order_product_brand;

-- ROLLBACK;
-- COMMIT;

-- Step 4: Create three different queries using joins or subqueries to display the relationships between these tables with user #3.
-- Brands and products
# SELECT b.name AS brand, p.name AS product, ROUND(p.price * (1 + b.brand_markup), 2) AS price_per_unit
# FROM product p
#     JOIN product_brand pb ON p.id = pb.product_id
#     JOIN brand b ON b.id = pb.brand_id;

-- Orders
# SELECT *
# FROM order_product_brand;

-- Average price per product
# SELECT p.name AS product, ROUND(AVG(p.price * (1 + b.brand_markup)), 2) AS avg_price_per_unit
# FROM product_brand pb
#     JOIN product p ON pb.product_id = p.id
#     JOIN brand b ON pb.brand_id = b.id
# GROUP BY 1;

-- Expensive brands
# SELECT b.name AS brand, ROUND(SUM(p.price * (1 + b.brand_markup)), 2) AS avg_price_per_unit
# FROM product_brand pb
#     JOIN product p ON pb.product_id = p.id
#     JOIN brand b ON pb.brand_id = b.id
# GROUP BY 1
# ORDER BY avg_price_per_unit DESC;

-- Expensive brands with total price
# SELECT b.name AS brand, ROUND(SUM(p.price * (1 + b.brand_markup)), 2) AS total_price
# FROM product_brand pb
#     JOIN product p ON pb.product_id = p.id
#     JOIN brand b ON pb.brand_id = b.id
# GROUP BY 1
# ORDER BY total_price DESC;

-- Expensive Brands with products
# SELECT b.name AS brand, GROUP_CONCAT(DISTINCT p.name SEPARATOR ', ') AS products, ROUND(p.price * (1 + b.brand_markup), 2) AS price_per_unit
# FROM product_brand pb
#     JOIN product p ON pb.product_id = p.id
#     JOIN brand b ON pb.brand_id = b.id
# GROUP BY 1, 3
# ORDER BY price_per_unit DESC;

-- Expensive Brands with products and total price
# SELECT b.name AS brand, GROUP_CONCAT(DISTINCT p.name SEPARATOR ', ') AS products, ROUND(SUM(p.price * (1 + b.brand_markup)), 2) AS total_price
# FROM product_brand pb
#     JOIN product p ON pb.product_id = p.id
#     JOIN brand b ON pb.brand_id = b.id
# GROUP BY 1
# ORDER BY total_price DESC;

# -- Brands with most orders and total price
# SELECT brand, COUNT(*) AS orders, ROUND(SUM(total_price), 2) AS total_price
# FROM order_product_brand
# GROUP BY 1
# ORDER BY total_price DESC;
#
-- Best selling products by brand, orders, and total price
# SELECT product,
#        GROUP_CONCAT(DISTINCT brand SEPARATOR ', ') AS brands,
#        COUNT(*)                   AS orders,
#        ROUND(SUM(total_price), 2) AS total_price
# FROM order_product_brand
# GROUP BY 1
# ORDER BY total_price DESC;
#
-- Revenue by brand
# SELECT brand, ROUND(SUM(total_price), 2) AS revenue
# FROM order_product_brand
# GROUP BY 1
# ORDER BY revenue DESC;
#
# -- Brands with the most markup
# SELECT b.name                                        AS brand,
#        ROUND(AVG(p.price * (1 + b.brand_markup)), 2) AS avg_price_per_unit,
#        ROUND(AVG(b.brand_markup), 2)                 AS markup
# FROM product_brand pb
#     JOIN product p ON pb.product_id = p.id
#     JOIN brand b ON pb.brand_id = b.id
# GROUP BY 1
# ORDER BY markup DESC;

-- Brands with the most markup and products and average price per unit
# SELECT b.name                                        AS brand,
#        GROUP_CONCAT(DISTINCT p.name SEPARATOR ', ')  AS products,
#        COUNT(*)                                      AS num_products,
#        ROUND(AVG(p.price * (1 + b.brand_markup)), 2) AS avg_price_per_unit,
#        ROUND(AVG(b.brand_markup), 2)                 AS markup
# FROM product_brand pb
#     JOIN product p ON pb.product_id = p.id
#     JOIN brand b ON pb.brand_id = b.id
# GROUP BY 1
# ORDER BY markup DESC;

-- Test Delete Cascade
# START TRANSACTION;
#
# SELECT * FROM brand;
# SELECT * FROM product_brand;
#
# DELETE FROM brand WHERE id = 6;
# DELETE FROM product WHERE id = 6;
#
# SELECT * FROM brand;
# SELECT * FROM product;
# SELECT * FROM product_brand;
# SELECT * FROM order_product_brand;
#
# ROLLBACK;