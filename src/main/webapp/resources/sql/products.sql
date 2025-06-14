CREATE TABLE products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    category    VARCHAR(50)  NOT NULL DEFAULT '기타',
    description TEXT,
    price INT NOT NULL,
    seller_id VARCHAR(20),
    image VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (seller_id) REFERENCES members(id) ON DELETE CASCADE
);

SELECT * FROM products;

DROP TABLE IF EXISTS products;
ALTER TABLE products ADD COLUMN location VARCHAR(255);