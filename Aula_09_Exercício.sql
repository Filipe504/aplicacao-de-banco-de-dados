

-- 1. CRIANDO A TABELA GRUPO_CONTATO
CREATE TABLE TB_GRUPO_CONTATO (
	id_grupo INT AUTO_INCREMENT PRIMARY KEY,
    grupo VARCHAR(100)
);

-- 2. INSERINDO DADOS NA TABELA GRUPO_CONTATO
INSERT INTO TB_GRUPO_CONTATO (grupo)
VALUES ('Família'),
	   ('Trabalho'),
       ('Amigos');


-- 3. CRIANDO A TABELA CONTATO
CREATE TABLE TB_CONTATO (
	id_contato INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    email VARCHAR(50),
    id_grupo INT NOT NULL,
    FOREIGN KEY (id_grupo) REFERENCES TB_GRUPO_CONTATO (id_grupo)
);


-- 4. INSERINDO DADOS NA TABELA CONTATO
INSERT INTO TB_CONTATO (nome, email, id_grupo)
VALUES ('Ricardo', 'ricardo@gmail.com', 1),
	   ('Marina', 'marina@gmail.com', 2),
       ('Sérgio', 'sergio@hotmail.com', 3),
       ('Flávio', 'flavio@gmail.com', 1),
       ('Lúcia', 'lucia@hotmail.com', 2),
       ('Pedro', 'pedro@gmail.com', 3);


-- 5. CRIANDO A TABELA TELEFONE
CREATE TABLE TB_TELEFONE (
	id_telefone INT AUTO_INCREMENT PRIMARY KEY,
    numero_telefone VARCHAR(20),
    id_contato INT NOT NULL,
    FOREIGN KEY (id_contato) REFERENCES TB_CONTATO (id_contato)
);


-- 6. INSERINDO DADOS NA TABELA TELEFONE
INSERT INTO TB_TELEFONE (numero_telefone, id_contato)
VALUES ('(18) 28473-0284', 2),
	   ('(12) 19362-0364', 4),
       ('(15) 28593-1846', 5),
	   ('(08) 37493-3746', 1),
       ('(02) 84736-8732', 3),
       ('(20) 74624-2861', 6);
       
       
-- CONSULTANDO OS DADOS DAS TABELAS
SELECT * FROM TB_GRUPO_CONTATO;

SELECT * FROM TB_CONTATO
ORDER BY nome ASC;

SELECT * FROM TB_TELEFONE;


-- CONSULTANDO APENAS A COLUNA NOME DA TABELA CONTATO
SELECT nome FROM TB_CONTATO;

-- CONSULTA A TABELA CONATO COM WHERE, NOME = PEDRO
SELECT nome, email, id_grupo FROM TB_CONTATO
WHERE nome = 'Pedro';
