
-- 0. ACESSANDO O BANCO DE DADOS
USE DB_T04703_FILIPE_BERNARDO;

-- 1. CRIAÇÃO DA TABELA
CREATE TABLE ProdutosPadaria (
	id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    preco DECIMAL(8,2)
);

-- 2. INSERÇÃO DOS REGISTROS NAS TABELA
INSERT INTO ProdutosPadaria (nome, preco) VALUES
('Bolo de Chocolate', 20.90),
('Pudim', 14.90),
('Coxinha', 4.00),
('Sonho', 3.20),
('Croissant', 2.50);

-- 3. CONSULTA INICIAL DA TABELA
SELECT * FROM ProdutosPadaria;

-- EXERCÍCIOS
-- 01 - NOME DOS PRODUTOS EM MAIÚSCULO
SELECT UPPER(nome) AS Produtos_MAI,
       preco AS Preco
FROM ProdutosPadaria
ORDER BY preco ASC;

-- 02 - NOME DOS PRODUTOS EM MINÚSCULO
SELECT LOWER(nome) AS Produtos_MIN,
	   preco AS Preco
FROM ProdutosPadaria
ORDER BY preco ASC;

-- 03 - QUANTIDADE DE LETRAS DOS PRODUTOS
SELECT nome AS Produto,
	   LENGTH(nome) AS Qtde_Caracteres
FROM ProdutosPadaria
ORDER BY 2 ASC;

-- 04 - AS 3 PRIMEIRAS E AS 3 ÚLTIMAS LETRAS DOS NOMES DOS PRODUTOS
SELECT nome AS Produto,
	   LEFT(nome, 3) AS Pri_Caracteres,
       RIGHT(nome, 3) AS Ult_Caracteres
FROM ProdutosPadaria;

-- 05 - ARREDONDAR O PREÇO DOS PRODUTOS
SELECT nome AS Produto,
	   preco AS Preco_Original,
       ROUND(preco, 1) AS Preco_Arredondado
FROM ProdutosPadaria;

-- 06 - MOSTRAR A DATA ATUAL COM OS PRODUTOS
SELECT nome AS Produto,
	   preco AS Preco,
       NOW() AS Data_Hora,
       CURDATE() AS Data_Atual
FROM ProdutosPadaria;
