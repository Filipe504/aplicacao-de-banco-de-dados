-- 4 A 5 REGISTROS (PRODUTOS E VENDAS), FORNECEDORES PODE SER MENOS
-- ITENS 2 CONSULTAS SIMPLES, 3 E 4 DESCONSIDERAR, 5 CLAUSULA WHERE
-- SALVAR BOLO DE FUBÁ E DE CHOCOLATE, TABLE APRODUTOS


-- ACESSANDO O BD
USE DB_T04703_FILIPE_BERNARDO;



-- CRIANDO TABELA
CREATE TABLE TB_PRODUTOS (
	   id_produto INT AUTO_INCREMENT PRIMARY KEY,
       nome VARCHAR(100) NOT NULL,
       preco DECIMAL(8,2) NOT NULL
);
       
INSERT INTO TB_PRODUTOS (nome, preco)
VALUES ('Bolo de Fubá', 18.90),
	   ('Bolo de Chocolate', 20.90), 
       ('Rosquinha', 5.90),
       ('Sonho', 2.90),
       ('Pudim', 11.90);
       
       
       
       
CREATE TABLE TB_VENDAS (
	   id_venda INT AUTO_INCREMENT PRIMARY KEY,
       id_produto INT NOT NULL,
       quantidade INT NOT NULL,
       data_venda DATE NOT NULL,
       FOREIGN KEY (id_produto) REFERENCES TB_PRODUTOS (id_produto)
);

INSERT INTO TB_VENDAS (id_produto, quantidade, data_venda)
VALUES (1, 30, '2026-02-04'),
	   (2, 45, '2025-06-03'),
	   (3, 56, '2026-03-12'),
       (4, 12, '2025-06-03'),
       (5, 15, '2026-03-09');

       
       
CREATE TABLE TB_FORNECEDORES (
	   id_fornecedor INT AUTO_INCREMENT PRIMARY KEY,
       nome VARCHAR(100) NOT NULL,
       telefone VARCHAR(20) NOT NULL
);

INSERT INTO TB_FORNECEDORES (nome, telefone)
VALUES ('Massas IND', '(16) 99315-2527'),
	   ('Doces LTDA', '(24) 88523-1825'),
       ('Bolos INC', '(32) 67435-9815');


-- 1
SELECT * FROM TB_PRODUTOS;

-- 2
SELECT id_produto, quantidade FROM TB_VENDAS;


-- 5
SELECT * FROM TB_VENDAS
WHERE data_venda = '2025-06-03'

