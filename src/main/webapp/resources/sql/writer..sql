CREATE TABLE comments (
    comment_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT NOT NULL,
    writer_id VARCHAR(50) NOT NULL,
    content TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (product_id) REFERENCES products(product_id),
    FOREIGN KEY (writer_id) REFERENCES members(id)
);

ALTER TABLE comments
DROP FOREIGN KEY comments_ibfk_2;

ALTER TABLE comments
ADD CONSTRAINT comments_ibfk_2
FOREIGN KEY (writer_id) REFERENCES members(id) ON DELETE CASCADE;