CREATE DATABASE IF NOT EXISTS Lab02;

USE Lab02;

CREATE TABLE IF NOT EXISTS products(
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    price VARCHAR(100) CHECK(price > 0)
);

-- we cant add negative values because of check 

DESC products;

ALTER TABLE products
MODIFY price DECIMAL(5, 2) NOT NULL;

DESC products;

--

INSERT INTO products
(price)
VALUES (-10.0);