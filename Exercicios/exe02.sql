-- ATIVIDADE 02 - E-COMMERCE

CREATE DATABASE ecommerce;
USE ecommerce;

CREATE TABLE produtos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    categoria VARCHAR(50),
    preco DECIMAL(10,2),
    estoque INT,
    marca VARCHAR(50)
);

INSERT INTO produtos (nome, categoria, preco, estoque, marca) VALUES
('Notebook', 'Eletrônicos', 3500.00, 10, 'Dell'),
('Mouse Gamer', 'Acessórios', 150.00, 50, 'Logitech'),
('Smartphone', 'Eletrônicos', 2500.00, 15, 'Samsung'),
('Monitor 24"', 'Eletrônicos', 900.00, 20, 'LG'),
('Teclado Mecânico', 'Acessórios', 450.00, 30, 'Redragon'),
('Headset', 'Acessórios', 300.00, 25, 'HyperX'),
('Cadeira Gamer', 'Mobiliário', 1200.00, 8, 'ThunderX3'),
('Webcam HD', 'Acessórios', 200.00, 18, 'Microsoft');

SELECT * FROM produtos WHERE preco > 500;
SELECT * FROM produtos WHERE preco < 500;

UPDATE produtos SET preco = 1000 WHERE id = 4;
