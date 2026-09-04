
-- CRIANDO O BANCO DE DADOS
CREATE DATABASE DB_T03742_FILIPE_BERNARDO;


-- CRIANDO A TABELA
CREATE TABLE TB_LIVROS (
	id_livro INT AUTO_INCREMENT PRIMARY KEY,
	titulo_livro VARCHAR(100),
	autor VARCHAR(120),
	ano_publicação INT,
	genero VARCHAR(50)
);


/*COMENTÁRIOS LONGOS*/
-- COMENTÁRIOS RÁPIDOS

INSERT INTO TB_LIVROS (titulo_livro, autor, ano_publicação, genero)
VALUES ('Dom Casmurro', 'Machado de Assis', 1899, 'Romance');
 
-- INSERINDO MULTIPLIVOS LIVROS COM APENAS 1 "VALUES"
INSERT INTO TB_LIVROS (titulo_livro, autor, ano_publicação, genero)
VALUES 
  ('Cem anos de solidao', 'Gabriel Garcia Marquez', 1967, 'Realismo Magico'),
  ('O Pequeno Principe', 'Antoine de Saint-Exupery', 1943, 'Fabula Infantil'),
  ('O Hobbit', 'J.R.R. Tolkien', 1937, 'Fantasia');



-- CONSULTANDO OS REGISTROS DA TABELA LIVROS
SELECT * FROM TB_LIVROS;

-- ORDENANDO AS INFORMAÇÕES DO RESULTADO DE UMA PESQUISA
-- ORDEM ALFABÉTICA - ASC E DESC
SELECT * FROM TB_LIVROS
ORDER BY autor DESC;


-- LIMIT
SELECT * FROM TB_LIVROS
LIMIT 2;

-- LIKE
SELECT * FROM TB_LIVROS
WHERE genero LIKE 'R%';


-- X% PROCURAR INFORMAÇÕES QUE COMECEM COM A LETRA 'X', ÚLTIMA LETRA %X, QUALQUER POSIÇÃO %X%
-- PALAVRAS '%PALAVRA%'





CREATE TABLE TB_PRODUTO (
id_produto INT AUTO_INCREMENT PRIMARY KEY,
nome_produto VARCHAR(100),
estoque INT,
setor VARCHAR(1)
);

INSERT INTO TB_PRODUTO (nome_produto, estoque, setor)
VALUES ('Folha sulfite', 1200, 'A'),
	   ('Caderno', 700, 'B'),
	   ('Lápis', 2000, 'B');




CREATE TABLE TB_VENDA (
	id_venda INT AUTO_INCREMENT PRIMARY KEY,
	nome_produto VARCHAR(100),
	nome_comprador VARCHAR(100),
	nome_fornecedor VARCHAR(100),
	data_venda DATE
);

INSERT INTO TB_VENDA (nome_produto, nome_comprador, nome_fornecedor, data_venda)
VALUES ('Folha sulfite', 'Escritorio', 'Garcia INC', '2025-02-13'),
	   ('Caderno', 'Escola', 'Junior INC', '2025-12-17'),
       ('Lapis', 'Loja', 'Garcia INC', '2024-08-18');




CREATE TABLE TB_FORNECEDOR (
id_fornecedor INT AUTO_INCREMENT PRIMARY KEY,
nome_fornecedor VARCHAR(100),
telefone VARCHAR(20),
produto VARCHAR(100)
);

INSERT INTO TB_FORNECEDOR (nome_fornecedor, telefone, produto)
VALUES ('Garcia INC', '(17) 21748-3123', 'Folha sulfite'),
	   ('Junior INC', '(13) 84123-8331', 'Caderno'),
       ('Sergio INC', '(16) 47838-4251', 'Caneta');
     
     
     
SELECT * FROM TB_VENDA;


SELECT * FROM TB_VENDA
WHERE nome_produto LIKE '%Caderno%';      

SELECT * FROM TB_FORNECEDOR
WHERE telefone LIKE '%(16)%';



-- INFORMAÇÃO OBRIGATÓRIO (NOT NULL)
-- EX: "nome_produto VARCHAR(100) NOT NULL,"

-- DELETE
DELETE FROM TB_VENDA;

-- TRUNCADE (APAGAR TUDO)
TRUNCATE TABLE TB_VENDA;


-- RETIRAR A TRAVA DE SEGURANÇA DO MY SQL
SET SQL_SAFE_UPDATES = 0;