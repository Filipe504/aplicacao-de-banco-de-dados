
-- 1. ACESSANDO BANCO DE DADOS
USE nome_banco_de_dados;


-- 2. CRIANDO A TABELA DE CONTATOS
-- PARA EXEMPLOS DE DML
CREATE TABLE TB_CONTATOS_DML (
	id_contato INT AUTO_INCREMENT PRIMARY KEY,
    nome_contato VARCHAR(100),
    telefone VARCHAR(20),
    email VARCHAR(100)
);


-- 3. INSERINDO REGISTROS NA TABELA DE CONTATOS
INSERT INTO TB_CONTATOS_DML (nome_contato, telefone, email)
VALUES ('Paulo', '(17) 92745-1834', 'paulo@gmail.com'),
	   ('Fernanda', '(12) 83456-1264', 'fernanda@hotmail.com'),
       ('Carlos', '(24) 49281-7645', 'carlos@gmail.com'),
       ('Maria', '(19) 56387-7641', 'maria@hotmail.com'),
       ('Roberto', '(21) 75419-0137', 'roberto@gmail.com');

       
-- 4. CONSULTA INICIAL AOS DADOS
SELECT * FROM TB_CONTATOS_DML;


-- 5. MODIFICANDO A TABELA DE CONTATOS
-- MODIFICANDO A INFORMAÇÃO DA COLUNA nome_contato
-- AJUSTANDO: Paulo -> Paulo Lima
UPDATE TB_CONTATOS_DML
SET nome_contato = 'Paulo Lima'
WHERE id_contato = 1;


-- 6. CONSULTANDO O RESULTADO
SELECT * FROM TB_CONTATOS_DML;


-- 7. ALTERANDO A INFORMAÇÃO EM MÚLTIPLAS COLUNAS
UPDATE TB_CONTATOS_DML
SET nome_contato = 'Davi Moura',
	telefone = '(45) 83674-1297',
    email = 'davi.moura@gmail.com'
    WHERE id_contato = 3;
    
    
-- *AO OMITIR A CLÁUSULA WHERE, A ALTERAÇÃO É APLICADA EM TODOS OS REGISTROS


-- 8. CONSULTANDO O RESULTADO
SELECT * FROM TB_CONTATOS_DML;


-- 9. ELIMINANDO UM REGISTRO DA BASE DE DADOS
DELETE FROM TB_CONTATOS_DML
WHERE id_contato = 4;


-- 10. CONSULTANDO O RESULTADO
SELECT * FROM TB_CONTATOS_DML;
