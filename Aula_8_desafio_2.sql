-- CONSULTAS: ITEM 3 NÃO PRECISA

USE DB_T04703_FILIPE_BERNARDO;


CREATE TABLE TB_ALUNO (
	   id_aluno INT AUTO_INCREMENT PRIMARY KEY,
       nome VARCHAR(50),
       sobrenome VARCHAR(50),
       curso VARCHAR(100)
);

INSERT INTO TB_ALUNO (nome, sobrenome, curso)
VALUES ('João', 'Pedro', 'Administração'),
	   ('Júlia', 'Marques', 'Enfermagem'),
	   ('Cláudio', 'Souza', 'Elétrica'),
       ('Sofia', 'Andrade', 'Psicologia'),
       ('Raul', 'Soares', 'Elétrica'),
	   ('Rita', 'Silva', 'Administração'),
	   ('Maria', 'Clara', 'Farmácia');





CREATE TABLE TB_PROFESSOR (
	   id_professor INT AUTO_INCREMENT PRIMARY KEY,
       nome_professor VARCHAR(100),
       curso VARCHAR(100)
);

INSERT INTO TB_PROFESSOR (nome_professor, curso)
VALUES ('Carlos', 'Administração'),
	   ('Márcia', 'Psicologia'),
	   ('Douglas', 'Elétrica'),
	   ('Sônia', 'Enfermagem'),
	   ('Isabela', 'Farmácia');





CREATE TABLE TB_COMENTARIO (
	   id_comentario INT AUTO_INCREMENT PRIMARY KEY,
       id_aluno INT,
       id_professor INT,
       comentario TEXT,
       notadoprofessor DECIMAL(3,1),
	   FOREIGN KEY (id_aluno) REFERENCES TB_ALUNO (id_aluno),
       FOREIGN KEY (id_professor) REFERENCES TB_PROFESSOR (id_professor)
);

INSERT INTO TB_COMENTARIO (id_aluno, id_professor, comentario, notadoprofessor)
VALUES ('4', '2', 'Muito bom', 8.0),
	   ('2', '4', 'Precisa melhorar', 4.3),
       ('7', '5', 'Mandou bem', 7.5),
       ('3', '3', 'Precisa se esforçar mais', 2.8),
       ('1', '1', 'Poderia ser melhor', 5.5),
       ('6', '1', 'Há muito a melhorar', 3.6),
       ('5', '5', 'Excelente', 9.2);
       
	
SELECT nome, sobrenome, curso FROM TB_ALUNO
ORDER BY nome ASC;


SELECT nome_professor AS Professor, curso FROM TB_PROFESSOR
ORDER BY nome_professor DESC;


SELECT comentario, notadoprofessor FROM TB_COMENTARIO
WHERE notadoprofessor < 6.0
ORDER BY notadoprofessor ASC;

SELECT comentario, notadoprofessor FROM TB_COMENTARIO
WHERE notadoprofessor > 6.0
ORDER BY notadoprofessor DESC;


SELECT * FROM TB_COMENTARIO;