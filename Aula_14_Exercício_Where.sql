
-- 0. INICIAR BANCO DE DADOS
USE nome_banco_de_dados;


-- 1. CRIAR TABELA
CREATE TABLE produtos_padaria (
	id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    preco DECIMAL(4,2) NOT NULL,
    estoque INT NOT NULL
);


-- 2. INSERIR REGISTROS
INSERT INTO produtos_padaria (nome, preco, estoque) VALUES
('Bolo de Chocolate', 20.00, 30),
('Bolo de Cenoura', 16.00, 25),
('Pão Francês', 00.25, 100),
('Pão de Queijo', 00.50, 50),
('Croissant de Chocholate', 01.50, 12),
('Croissant de Presunto', 02.50, 37),
('Croissant de Frango', 03.00, 32),
('Pudim', 16.50, 2),
('Esfirra', 05.00, 14),
('Sonho', 02.50, 18);

-- ***CONSULTAS***

-- 3. CONSULTA INICIAL
SELECT * FROM produtos_padaria;


-- 4. PRODUTOS COM PREÇO ACIMA DE 5 REAIS
SELECT * FROM produtos_padaria
WHERE preco > 05.00
ORDER BY preco ASC;


-- 5. PRODUTOS QUE POSSUEM A PALAVRA 'Bolo' NO NOME
SELECT nome AS Nome, preco AS Preco FROM produtos_padaria
WHERE nome LIKE '%Bolo%'
ORDER BY nome ASC;


-- 6. PRODUTOS COM MENOS DE 20 UNIDADES NO ESTOQUE
SELECT nome AS Nome, estoque AS Estoque FROM produtos_padaria
WHERE estoque < 20
ORDER BY estoque ASC;


-- 7. PRODUTOS QUE CUSTAM ENTRE 3 E 10 REAIS
-- OPÇÃO 1
SELECT nome AS Nome, preco AS Preco FROM produtos_padaria
WHERE preco >= 3 AND preco <= 10
ORDER BY preco ASC;

-- OPÇÃO 2
SELECT nome AS Nome, preco AS Preco FROM produtos_padaria
WHERE preco BETWEEN 3.00 AND 10.00
ORDER BY preco ASC;


-- 8. PRODUTOS QUE O NOME COMEÇA COM 'PÃO'
SELECT nome AS Nome, preco AS Preco, estoque AS Estoque FROM produtos_padaria
WHERE nome LIKE 'Pão%'
ORDER BY preco asc;


-- 9. PRODUTOS COM NOME 'Croissant' E QUE TENHAM MAIS DE 30 UNIDADES NO ESTOQUE
-- OBS. 'WHERE nome = 'Croissant' APENAS FUNCIONARIA SE UM REGISTRO TIVESSE APENAS O NOME CROISSANT
SELECT nome AS Nome, preco AS Preco, estoque AS Estoque FROM produtos_padaria
WHERE nome LIKE '%Croissant%' AND estoque > 30
ORDER BY estoque ASC;
