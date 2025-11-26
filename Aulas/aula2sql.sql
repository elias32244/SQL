DROP DATABASE db_quitanda;

CREATE DATABASE db_quitanda;

USE db_quitanda;

CREATE TABLE tb_categorias( id bigint AUTO_INCREMENT PRIMARY KEY, descricao VARCHAR(255) NOT NULL );

INSERT INTO tb_categorias (descricao)
VALUES ("Frutas");

INSERT INTO tb_categorias (descricao)
VALUES ("Verduras");

INSERT INTO tb_categorias (descricao)
VALUES ("Legumes");

INSERT INTO tb_categorias (descricao)
VALUES ("Temperos");

INSERT INTO tb_categorias (descricao)
VALUES ("Ovos");

INSERT INTO tb_categorias (descricao)
VALUES ('Outros');

SELECT * FROM tb_categorias;

DROP TABLE IF EXISTS tb_produtos;

CREATE TABLE tb_produtos(
    id BIGINT AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    quantidade INT,
    datavalidade DATE,
    preco DECIMAL(6,2) NOT NULL,
    categoriaid BIGINT,

    PRIMARY KEY (id),
    FOREIGN KEY (categoriaid) REFERENCES tb_categorias(id)
);

INSERT INTO tb_produtos(nome, quantidade, datavalidade, preco, categoriaid) 

values ("tomate",100, "2023-12-15", 8.00, 3);

INSERT INTO tb_produtos(nome, quantidade, datavalidade, preco, categoriaid) 

values ("maçã",20, "2023-12-15", 5.00, 1);

INSERT INTO tb_produtos(nome, quantidade, datavalidade, preco, categoriaid) 

values ("laranja",50, "2023-12-15", 10.00, 1);

INSERT INTO tb_produtos(nome, quantidade, datavalidade, preco, categoriaid) 

values ("banana",200, "2023-12-15", 12.00, 1);

INSERT INTO tb_produtos(nome, quantidade, datavalidade, preco, categoriaid) 

values ("uva",1200, "2023-12-15", 30.00, 1);

INSERT INTO tb_produtos(nome, quantidade, datavalidade, preco, categoriaid) 

values ("pêra",500, "2023-12-15", 2.99, 1);

SELECT * FROM tb_produtos;


-- SELEÇÃO 
SELECT * FROM tb_produtos ORDER BY nome ASC;

SELECT * FROM tb_produtos ORDER BY nome DESC;

SELECT * FROM tb_produtos WHERE preco IN (5.00, 10.00, 15.00);

-- CONSULTA INNER JOIN

SELECT nome, preco, quantidade, tb_categoria.descricao

FROM tb_produtos INNER JOIN tb_categorias

ON tb_produtos.categoriaid = tb_categorias.id;


-- CONSULTA LEFT JOIN
SELECT nome, preco, quantidade, tb_categorias.descricao
FROM tb_produtos INNER JOIN tb_categorias 
ON tb_produtos.categoriaid = tb_categorias.id;


-- CONSULTA RIGHT JOIN

SELECT nome, preco, quantidade, tb_categorias.descricao
FROM tb_produtos INNER JOIN tb_categorias 
ON tb_produtos.categoriaid = tb_categorias.id;


 




