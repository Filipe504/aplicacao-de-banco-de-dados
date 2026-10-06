
-- ACESSANDO O BANCO DE DADOS
USE nome_bd;

-- 1. CRIAÇÃO DAS TABELAS
CREATE TABLE clientes (
    id_cliente INT PRIMARY KEY,
    nome VARCHAR(100),
    cidade VARCHAR(50)
);

CREATE TABLE pedidos (
    id_pedido INT PRIMARY KEY,
    id_cliente INT,
    valor DECIMAL(10,2),
    status VARCHAR(20),
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);
 
 -- 2. INSERIR OS REGISTROS
INSERT INTO clientes (id_cliente, nome, cidade) VALUES
(1, 'Carlos Silva', 'Barueri'),
(2, 'Ana Souza', 'Osasco'),
(3, 'Marcos Oliveira', 'Barueri'),
(4, 'Juliana Santos', 'São Paulo'),
(5, 'Rafael Costa', 'Osasco'),
(6, 'Fernanda Lima', 'Barueri'),
(7, 'Bruno Almeida', 'Jandira'),
(8, 'Camila Rocha', 'São Paulo');

INSERT INTO pedidos (id_pedido, id_cliente, valor, status) VALUES
(101, 1, 150.00, 'Concluído'),
(102, 1, 280.00, 'Concluído'),
(103, 1, 120.00, 'Cancelado'),
(104, 2, 350.00, 'Concluído'),
(105, 2, 180.00, 'Concluído'),
(106, 3, 500.00, 'Concluído'),
(107, 3, 220.00, 'Concluído'),
(108, 3, 100.00, 'Concluído'),
(109, 4, 750.00, 'Concluído'),
(110, 5, 90.00, 'Cancelado'),
(111, 5, 450.00, 'Concluído'),
(112, 5, 300.00, 'Concluído'),
(113, 6, 200.00, 'Concluído'),
(114, 6, 350.00, 'Concluído'),
(115, 7, 1000.00, 'Concluído'),
(116, 7, 150.00, 'Concluído'),
(117, 8, 80.00, 'Concluído'),
(118, 8, 120.00, 'Concluído'),
(119, 8, 200.00, 'Concluído');
 

-- 3. CONSULTA INICIAL
SELECT * FROM clientes;
SELECT * FROM pedidos;
 
 
-- EXEMPLO - USO DO COMANDO JOIN COM GROUP BY
-- VALOR MÉDIO DOS PEDIDOS, AGRUPADOS POR CIDADE
SELECT cli.cidade AS Cidade, 
	   ROUND(AVG(ped.valor), 2) AS Valor_Medio
FROM clientes AS cli
INNER JOIN pedidos AS ped
ON cli.id_cliente = ped.id_cliente
GROUP BY cli.cidade;

-- DESCONSIDERANDO OS PEDIDOS QUE FORAM CANCELADOS
SELECT cli.cidade AS Cidade, 
	   ROUND(AVG(ped.valor), 2) AS Valor_Medio
FROM clientes AS cli
INNER JOIN pedidos AS ped
ON cli.id_cliente = ped.id_cliente
WHERE ped.status = 'Concluído'
GROUP BY cli.cidade;

-- USANDO O HAVING
SELECT cli.cidade AS Cidade, 
	   ROUND(AVG(ped.valor), 2) AS Valor_Medio
FROM clientes AS cli
INNER JOIN pedidos AS ped
ON cli.id_cliente = ped.id_cliente
GROUP BY cli.cidade
HAVING Valor_Medio > 250.00;



-- DESAFIO 01
-- QUANTIDADE DE PEDIDOS POR CLIENTE
SELECT cli.nome AS Cliente,
	   COUNT(*) AS Qtde_Pedidos
FROM clientes cli
INNER JOIN pedidos as ped
ON cli.id_cliente = ped.id_cliente
GROUP BY cli.nome
ORDER BY Qtde_Pedidos DESC;



-- DESAFIO 02
-- TOTAL COMPRADO POR CLIENTE
SELECT cli.nome AS Cliente,
	   SUM(ped.valor) AS Valor_Total
FROM clientes cli
JOIN pedidos ped
ON cli.id_cliente = ped.id_cliente
GROUP BY cli.nome
ORDER BY 2 ASC;



-- DESAFIO 03
-- MÉDIA DOS PEDIDOS POR CLIENTE
-- NOME DO CLIENTE, QUANTIDADE DE PEDIDOS, VALOR MÉDIO DOS PEDIDOS
SELECT cli.nome AS Cliente,
	   COUNT(*) AS Qtde_Pedidos,
       ROUND(AVG(ped.valor), 2) AS Valor_Medio
FROM clientes cli
INNER JOIN pedidos ped
ON cli.id_cliente = ped.id_cliente
GROUP BY cli.nome
ORDER BY Valor_Medio DESC,
	     Qtde_Pedidos DESC;
 
 
 
-- DESAFIO 04
-- CLIENTES QUE GASTARAM MAIS DE R$700
SELECT cli.nome AS Cliente,
	   SUM(ped.valor) AS Valor_Total
FROM clientes cli
INNER JOIN pedidos ped
ON cli.id_cliente = ped.id_cliente
GROUP BY cli.nome
HAVING Valor_Total > 700.00
ORDER BY 2 DESC;
 


-- DESAFIO 05
-- TOTAL DE PEDIDOS POR CIDADE
-- CIDADE, QUANTIDADE DE PEDIDOS, VALOR TOTAL DOS PEDIDOS
SELECT cli.cidade AS Cidade,
	   COUNT(*) AS Qtde_Pedidos,
       SUM(ped.valor) AS Valor_Total
FROM clientes cli
INNER JOIN pedidos ped
ON cli.id_cliente = ped.id_cliente
GROUP BY cli.cidade
ORDER BY Valor_Total ASC;



-- DESAFIO 06
-- CLIENTES COM MAIS DE R$500 EM PEDIDOS CONCLUÍDOS
SELECT cli.nome AS Cliente,
	   SUM(ped.valor) AS Valor_Total
FROM clientes cli
INNER JOIN pedidos ped
ON cli.id_cliente = ped.id_cliente
WHERE ped.status = 'Concluído'
GROUP BY cli.nome
HAVING SUM(ped.valor) > 500.00
ORDER BY 2 DESC;
