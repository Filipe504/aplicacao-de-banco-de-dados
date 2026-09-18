
-- ENCONTRO 18
-- DESAFIO - 01


-- 0. ACESSAR O BANCO DE DADOS
USE nome_bd;


-- 1. CRIAR AS TABELAS: 'DEPARTAMENTOS' E 'FUNCIONÁRIOS'
CREATE TABLE departamentos (
    id_departamento INT PRIMARY KEY,
    nome_departamento VARCHAR(100)
);

CREATE TABLE funcionarios (
    id_funcionario INT PRIMARY KEY,
    nome_funcionario VARCHAR(100),
    id_departamento INT,
    FOREIGN KEY (id_departamento) REFERENCES departamentos(id_departamento)
);


-- 2. INSERIR OS REGISTROS NAS TABELAS
-- DEPARTAMENTOS
INSERT INTO departamentos (id_departamento, nome_departamento) VALUES
(1, 'Financeiro'),
(2, 'RH'),
(3, 'TI'),
(4, 'Marketing'),
(5, 'Inovação'); -- sem funcionários

-- FUNCIONÁRIOS
INSERT INTO funcionarios (id_funcionario, nome_funcionario, id_departamento) VALUES
(1, 'Ana', 1),
(2, 'Bruno', 1),
(3, 'Carlos', 2),
(4, 'Daniela', 3),
(5, 'Eduardo', 3),
(6, 'Fernanda', 4);


-- 3. FAZER CONSULTA INCIAL
SELECT * FROM departamentos;
SELECT * FROM funcionarios;



-- 4. DESAFIO 01
-- CRIAR UM RELATÓRIO COM TODOS OS DEPARTAMENTOS E SEUS FUNCIONÁRIOS
SELECT dep.id_departamento AS ID_Departamento,
	   nome_departamento AS Departamento,
       nome_funcionario AS Funcionário
FROM departamentos dep
LEFT JOIN funcionarios fun
ON dep.id_departamento = fun.id_departamento;




-- DESAFIO - 02


-- 0. ACESSAR O BANCO DE DADOS
USE nome_bd;


-- 1. CRIAR AS TABELAS: 'FUNCIONÁRIOS' E 'FAIXAS SALARIAIS'
CREATE TABLE tb_funcionarios (
    id_funcionario INT PRIMARY KEY,
    nome_funcionario VARCHAR(100),
    salario DECIMAL(10,2)
);

CREATE TABLE tb_faixa_salarial (
    id_faixa INT PRIMARY KEY,
    nivel VARCHAR(50),
    salario_min DECIMAL(10,2),
    salario_max DECIMAL(10,2)
);


-- 2. INSERIR OS REGISTROS NAS TABELAS
-- FUNCIONÁRIOS
INSERT INTO tb_funcionarios (id_funcionario, nome_funcionario, salario) VALUES
(1, 'Ana', 1800.00),
(2, 'Bruno', 2500.00),
(3, 'Carlos', 3200.00),
(4, 'Daniela', 4500.00),
(5, 'Eduardo', 5200.00),
(6, 'Fernanda', 7000.00);

-- FAIXAS SALARIAIS
INSERT INTO tb_faixa_salarial (id_faixa, nivel, salario_min, salario_max) VALUES
(1, 'Junior', 0, 2000),
(2, 'Pleno', 2001, 5000),
(3, 'Senior', 5001, 99999);


-- 3. FAZER CONSULTA INCIAL
SELECT * FROM departamentos;
SELECT * FROM funcionarios;



-- 4. DESAFIO 02
-- RELATÓRIO COM O NOME DE CADA FUNCIONÁRIO E SEU NÍVEL SALARIAL
SELECT fun.id_funcionario AS ID_Funcionario,
	   nome_funcionario AS Funcionario,
       salario AS Salário,
       nivel AS Nível
FROM tb_funcionarios fun
LEFT JOIN tb_faixa_salarial faixa
ON fun.salario BETWEEN faixa.salario_min AND faixa.salario_max;




-- DESAFIO - 03


-- 0. ACESSAR O BANCO DE DADOS
USE nome_bd;


-- 1. CRIAR AS TABELAS: 'DEPARTAMENTOS', FUNCIONÁRIOS' E'FAIXAS SALARIAIS'
CREATE TABLE tb_departamentos (
    id_departamento INT PRIMARY KEY,
    nome_departamento VARCHAR(100)
);

-- CRIANDO A TABELA FUNCIONARIO
CREATE TABLE tb_funcionarios2 (
    id_funcionario INT PRIMARY KEY,
    nome_funcionario VARCHAR(100),
    salario DECIMAL(10,2),
    id_departamento INT,
    FOREIGN KEY (id_departamento) REFERENCES tb_departamentos(id_departamento)
);

-- CRIANDO A TABELA FAIXA SALARIAL
CREATE TABLE tb_faixa_salarial2 (
    id_faixa INT PRIMARY KEY,
    nivel VARCHAR(50),
    salario_min DECIMAL(10,2),
    salario_max DECIMAL(10,2)
);


-- 2. INSERIR OS REGISTROS NAS TABELAS
-- DEPARTAMENTOS
INSERT INTO tb_departamentos (id_departamento, nome_departamento) VALUES
(1, 'Financeiro'),
(2, 'RH'),
(3, 'TI'),
(4, 'Vendas'),
(5, 'Inovação');

-- FUNCIONÁRIOS
INSERT INTO tb_funcionarios2 (id_funcionario, nome_funcionario, salario, id_departamento) VALUES
(1, 'Ana', 1800.00, 1),
(2, 'Bruno', 2500.00, 4), -- Vendas (Pleno)
(3, 'Carlos', 3200.00, 2),
(4, 'Daniela', 4500.00, 4), -- Vendas (Pleno)
(5, 'Eduardo', 5200.00, 3),
(6, 'Fernanda', 7000.00, 4);

-- FAIXAS SALARIAIS
INSERT INTO tb_faixa_salarial2 (id_faixa, nivel, salario_min, salario_max) VALUES
(1, 'Junior', 0, 2000),
(2, 'Pleno', 2001, 5000),
(3, 'Senior', 5001, 99999); 


-- 3. FAZER CONSULTA INCIAL
SELECT * FROM departamentos;
SELECT * FROM funcionarios;



-- 4. DESAFIO 03
-- LISTA DE TODOS OS FUNCIONÁRIOS DO NÍVEL 'PLENO' QUE TRABALHAM NO DEPARTAMENTO DE 'VENDAS'
SELECT fun.id_funcionario AS ID_Funcionário,
	   nome_funcionario AS Funcionário,
	   salario AS Salário,
       nivel AS Nível,
	   nome_departamento AS Departamento
FROM tb_funcionarios2 fun
LEFT JOIN tb_departamentos dep
ON fun.id_departamento = dep.id_departamento
INNER JOIN tb_faixa_salarial2 faixa
ON fun.salario BETWEEN faixa.salario_min AND faixa.salario_max
WHERE faixa.nivel = 'Pleno';
