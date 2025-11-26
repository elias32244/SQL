USE db_quitanda;



CREATE TABLE tb_produtos(
    id BIGINT AUTO_INCREMENT, 
	nome VARCHAR(255) NOT NULL,
	quantidade INT,
    datavalidade DATE,
	preco DECIMAL NOT NULL,
    PRIMARY KEY (id)
);

INSERT INTO tb_produtos(nome, quantidade, datavalidade, preco) 
VALUES ("tomate",100, "2023-12-15", 8.00);
INSERT INTO tb_produtos(nome, quantidade, datavalidade, preco) 
VALUES ("maçã",20, "2023-12-15", 5.00);
INSERT INTO tb_produtos(nome, quantidade, datavalidade, preco) 
VALUES ("laranja",50, "2023-12-15", 10.00);
INSERT INTO tb_produtos(nome, quantidade, datavalidade, preco) 
VALUES ("banana",200, "2023-12-15", 12.00);
INSERT INTO tb_produtos(nome, quantidade, datavalidade, preco) 
VALUES ("uva",1200, "2023-12-15", 30.00);
INSERT INTO tb_produtos(nome, quantidade, datavalidade, preco) 
VALUES ("pêra",500, "2023-12-15", 2.99);

SELECT * FROM tb_produtos; -- SELECIONAR OS DADOS DA TABELA

SELECT nome, preco FROM tb_produtos;

SELECT * FROM tb_produtos WHERE id = 1; -- SELECIONAR TODAS OS DADOS DA TABELA tb_produtos ONDE 

SELECT * FROM tb_produtos WHERE preco > 5;

-- ATUALIZAR A ESTRUTURA DA TABELA
ALTER TABLE tb_produtos MODIFY preco DECIMAL(6,2);

SELECT * FROM tb_produtos;

-- ATUALIZAÇÃO DOS DADOS DA TABELA
UPDATE tb_produtos SET preco = 2.99 WHERE Id = 6;


DELETE FROM tb_produtos WHERE id = 2;

INSERT INTO tb_produtos(nome, quantidade, datavalidade, preco)
VALUES ("abacaxi",100,"2023-12-15" , 7.99);
