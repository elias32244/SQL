-- ATIVIDADE 01 - RH

CREATE DATABASE rh;
USE rh;

CREATE TABLE colaboradores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    cargo VARCHAR(50),
    salario DECIMAL(10,2),
    departamento VARCHAR(50),
    email VARCHAR(100)
);

INSERT INTO colaboradores (nome, cargo, salario, departamento, email) VALUES
('Ana Silva', 'Analista', 2500.00, 'Financeiro', 'ana@empresa.com'),
('João Pereira', 'Assistente', 1800.00, 'RH', 'joao@empresa.com'),
('Maria Souza', 'Gerente', 5200.00, 'Marketing', 'maria@empresa.com'),
('Carlos Lima', 'Auxiliar', 1500.00, 'Operações', 'carlos@empresa.com'),
('Fernanda Alves', 'Coordenadora', 3200.00, 'TI', 'fer@empresa.com');

SELECT * FROM colaboradores WHERE salario > 2000;
SELECT * FROM colaboradores WHERE salario < 2000;

UPDATE colaboradores SET salario = 3500 WHERE id = 2;
