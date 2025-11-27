

/*******************************
 * EXE01 - db_generation_game_online
 *******************************/
DROP DATABASE IF EXISTS db_generation_game_online;
CREATE DATABASE db_generation_game_online;
USE db_generation_game_online;

-- Tabela de classes
CREATE TABLE tb_classes (
  id BIGINT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(100) NOT NULL,
  tipo VARCHAR(50), -- ex: Corpo a Corpo, Distância, Suporte
  descricao VARCHAR(255)
);

-- Tabela de personagens
CREATE TABLE tb_personagens (
  id BIGINT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(100) NOT NULL,
  nivel INT,
  poder_ataque INT,
  poder_defesa INT,
  classe_id BIGINT,
  FOREIGN KEY (classe_id) REFERENCES tb_classes(id)
);

-- Inserções em tb_classes (5 registros)
INSERT INTO tb_classes (nome, tipo, descricao) VALUES
('Guerreiro','Corpo a Corpo','Forte em ataques físicos'),
('Arqueiro','Distância','Especialista em ataques à distância'),
('Mago','Distância','Usa magias poderosas'),
('Tanque','Corpo a Corpo','Alta defesa e vida'),
('Assassino','Corpo a Corpo','Alta velocidade e crítico');

-- Inserções em tb_personagens (8 registros)
INSERT INTO tb_personagens (nome, nivel, poder_ataque, poder_defesa, classe_id) VALUES
('Arkus', 35, 2500, 900, 1),
('Lira', 28, 1500, 1200, 2),
('Morr', 40, 3200, 800, 3),
('Brom', 50, 1800, 1700, 4),
('Cyra', 22, 2100, 1100, 2),
('Vex', 30, 900, 1300, 5),
('Cairo', 27, 2050, 1500, 1),
('Celine', 33, 2300, 1400, 3);

-- SELECT: personagens com poder_ataque > 2000
SELECT * FROM tb_personagens WHERE poder_ataque > 2000;

-- SELECT: personagens com poder_defesa entre 1000 e 2000 (inclusive)
SELECT * FROM tb_personagens WHERE poder_defesa BETWEEN 1000 AND 2000;

-- SELECT usando LIKE: nomes que possuem a letra 'C' (case-insensitive dependendo do collation)
SELECT * FROM tb_personagens WHERE nome LIKE '%C%' OR nome LIKE '%c%';

-- INNER JOIN entre personagens e classes
SELECT p.id, p.nome, p.nivel, p.poder_ataque, p.poder_defesa, c.nome AS classe, c.tipo
FROM tb_personagens p
INNER JOIN tb_classes c ON p.classe_id = c.id;

-- INNER JOIN filtrando por classe específica (ex: Arqueiro)
SELECT p.nome, c.nome AS classe
FROM tb_personagens p
INNER JOIN tb_classes c ON p.classe_id = c.id
WHERE c.nome = 'Arqueiro';


/*******************************
 * EXE02 - db_pizzaria_legal
 *******************************/
DROP DATABASE IF EXISTS db_pizzaria_legal;
CREATE DATABASE db_pizzaria_legal;
USE db_pizzaria_legal;

-- Tabela de categorias
CREATE TABLE tb_categorias (
  id BIGINT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(100) NOT NULL,
  tipo VARCHAR(50) -- ex: salgada, doce, vegetariana
);

-- Tabela de pizzas
CREATE TABLE tb_pizzas (
  id BIGINT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(150) NOT NULL,
  ingredientes VARCHAR(255),
  tamanho VARCHAR(30),
  preco DECIMAL(8,2),
  categoria_id BIGINT,
  FOREIGN KEY (categoria_id) REFERENCES tb_categorias(id)
);

-- Inserções em tb_categorias (5 registros)
INSERT INTO tb_categorias (nome, tipo) VALUES
('Tradicional','salgada'),
('Especial','salgada'),
('Doce','doce'),
('Vegetariana','vegetariana'),
('Premium','salgada');

-- Inserções em tb_pizzas (8 registros)
INSERT INTO tb_pizzas (nome, ingredientes, tamanho, preco, categoria_id) VALUES
('Margherita','molho, muçarela, manjericão','M',  45.00, 1),
('Portuguesa','presunto, ovo, cebola, azeitona','G', 50.00, 2),
('Chocolate','chocolate, morango','M', 35.00, 3),
('Marguerita Especial','muçarela de búfala, tomate','G', 60.00, 5),
('Veggie Mix','legumes grelhados, rúcula','M', 48.50, 4),
('Frango com Catupiry','frango, catupiry','G', 55.00, 2),
('Quatro Queijos','requeijão, parmesão, provolone, muçarela','G', 70.00, 5),
('Muçarela Simples','muçarela, tomate','M', 40.00, 1);

-- SELECT: pizzas com valor > 45,00
SELECT * FROM tb_pizzas WHERE preco > 45.00;

-- SELECT: pizzas com valor entre 50,00 e 100,00
SELECT * FROM tb_pizzas WHERE preco BETWEEN 50.00 AND 100.00;

-- SELECT usando LIKE: nomes que possuem a letra 'M' (case-insensitive)
SELECT * FROM tb_pizzas WHERE nome LIKE '%M%' OR nome LIKE '%m%';

-- INNER JOIN pizzas com categorias
SELECT p.id, p.nome, p.preco, c.nome AS categoria, c.tipo
FROM tb_pizzas p
INNER JOIN tb_categorias c ON p.categoria_id = c.id;

-- INNER JOIN filtrando por categoria específica (ex: Doce)
SELECT p.nome, c.nome AS categoria
FROM tb_pizzas p
INNER JOIN tb_categorias c ON p.categoria_id = c.id
WHERE c.nome = 'Doce';


/*******************************
 * EXE03 - db_farmacia_bem_estar
 *******************************/
DROP DATABASE IF EXISTS db_farmacia_bem_estar;
CREATE DATABASE db_farmacia_bem_estar;
USE db_farmacia_bem_estar;

-- Tabela de categorias
CREATE TABLE tb_categorias (
  id BIGINT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(100) NOT NULL,
  descricao VARCHAR(255)
);

-- Tabela de produtos
CREATE TABLE tb_produtos (
  id BIGINT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(150) NOT NULL,
  marca VARCHAR(100),
  preco DECIMAL(8,2),
  validade DATE,
  categoria_id BIGINT,
  FOREIGN KEY (categoria_id) REFERENCES tb_categorias(id)
);

-- Inserções em tb_categorias (5 registros)
INSERT INTO tb_categorias (nome, descricao) VALUES
('Medicamentos','remédios com prescrição ou OTC'),
('Higiene','produtos de higiene pessoal'),
('Cosméticos','produtos de beleza e cuidados'),
('Vitaminas','suplementos e vitaminas'),
('Básicos','curativos e acessórios');

-- Inserções em tb_produtos (8 registros)
INSERT INTO tb_produtos (nome, marca, preco, validade, categoria_id) VALUES
('Cremex Hidratante','Cremex', 25.00, '2026-06-30', 3),
('Vitamina C 500mg','VitaPlus', 65.00, '2027-01-01', 4),
('Analgésico Genérico','GeneriCo', 12.50, '2025-12-31', 1),
('Protetor Solar FPS50','SolarCare', 80.00, '2026-09-30', 3),
('Band-Aid Pack','FirstAid', 8.00, '2028-03-15', 5),
('Xarope Infantil','SaudeKids', 30.00, '2025-11-30', 1),
('Antisséptico','LimpezaPlus', 15.00, '2026-02-28', 2),
('Creme Anti-idade','Belle', 120.00, '2027-05-10', 3);

-- SELECT: produtos com valor > 50,00
SELECT * FROM tb_produtos WHERE preco > 50.00;

-- SELECT: produtos com valor entre 5,00 e 60,00
SELECT * FROM tb_produtos WHERE preco BETWEEN 5.00 AND 60.00;

-- SELECT usando LIKE: nomes que possuem a letra 'C' (case-insensitive)
SELECT * FROM tb_produtos WHERE nome LIKE '%C%' OR nome LIKE '%c%';

-- INNER JOIN produtos com categorias
SELECT p.id, p.nome, p.marca, p.preco, c.nome AS categoria
FROM tb_produtos p
INNER JOIN tb_categorias c ON p.categoria_id = c.id;

-- INNER JOIN filtrando por categoria específica (ex: Cosméticos)
SELECT p.nome, c.nome AS categoria
FROM tb_produtos p
INNER JOIN tb_categorias c ON p.categoria_id = c.id
WHERE c.nome = 'Cosméticos';
