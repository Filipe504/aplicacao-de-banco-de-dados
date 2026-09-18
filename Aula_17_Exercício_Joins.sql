
-- 0. ACESSAR O BANCO DE DADOS
USE nome_bd;


-- 1. CRIAR TABELAS
-- Clientes
CREATE TABLE Clientes ( 
        id_cliente INT PRIMARY KEY, 
        nome VARCHAR(50) 
); 

-- Produtos
CREATE TABLE Produtos ( 
       id_produto INT PRIMARY KEY, 
       nome_produto VARCHAR(50) 
); 

-- Pedidos
CREATE TABLE Pedidos ( 
       id_pedido INT PRIMARY KEY, 
       id_cliente INT,
       id_produto INT 
);


-- 2. INSERIR REGISTROS
-- Clientes 
INSERT INTO Clientes (id_cliente, nome) VALUES 
(1, 'Amanda'), 
(2, 'Bernardo'), 
(3, 'Camila');

 -- Produtos 
INSERT INTO Produtos (id_produto, nome_produto) VALUES 
(101, 'Notebook'), 
(102, 'Mouse'), 
(103, 'Teclado'); 

-- Pedidos 
INSERT INTO Pedidos (id_pedido, id_cliente, id_produto) VALUES 
(1, 1, 101), -- Amanda comprou Notebook 
(2, 2, 102), -- Bernardo comprou Mouse 
(3, 4, 101), -- Cliente inexistente 
(4, 2, 105); -- Produto inexistente



-- 3. FAZER CONSULTA INICIAL
SELECT * FROM Clientes;
SELECT * FROM Produtos;
SELECT * FROM Pedidos;


-- EXERCÍCIOS
-- 1. PEDIDOS COM NOME DO CLIENTE E NOME DO PRODUTO, APENAS PEDIDOS VÁLIDOS
SELECT ped.id_pedido AS ID_Pedido,
	   cli.nome AS Cliente,
       prod.nome_produto AS Nome_Produto
FROM Clientes AS cli
INNER JOIN Pedidos AS ped
ON ped.id_cliente = cli.id_cliente
INNER JOIN Produtos AS prod
ON ped.id_produto = prod.id_produto;



-- 2. TODOS OS CLIENTES COM OS PRODUTOS QUE COMPRARAM, SE COMPRARAM
SELECT cli.id_cliente AS ID_Cliente,
	   cli.nome AS Cliente,
       ped.id_pedido AS ID_Pedido,
       prod.id_produto AS ID_Produto,
       prod.nome_produto AS Produto
FROM Clientes cli
LEFT JOIN Pedidos ped
ON cli.id_cliente = ped.id_cliente
LEFT JOIN Produtos prod
ON ped.id_produto = prod.id_produto;



-- 3. TODOS OS PEDIDOS, MESMO OS QUE NÃO TEM CLIENTES NA BASE
SELECT ped.id_pedido AS ID_Pedido,
	   cli.id_cliente AS ID_Cliente_Venda,
       cli.nome AS Cliente,
       ped.id_produto AS ID_Produto_Vendido,
       prod.nome_produto AS Produto
FROM Clientes cli
RIGHT JOIN Pedidos ped
ON cli.id_cliente = ped.id_cliente
LEFT JOIN Produtos prod
ON ped.id_produto = prod.id_produto;



-- 4. CLIENTES QUE NÃO FIZERAM NENHUM PEDIDO
SELECT cli.id_cliente AS ID_Cliente,
	   cli.nome AS Cliente,
       ped.id_pedido AS ID_Pedido
FROM Clientes cli
LEFT JOIN Pedidos ped
ON ped.id_cliente = cli.id_cliente
WHERE ped.id_pedido IS NULL;



-- 5. PEDIDOS COM PRODUTO INEXISTENTE
SELECT ped.id_pedido AS ID_Pedido,
	   prod.id_produto AS ID_Produto,
       prod.nome_produto AS Nome_Produto
FROM Pedidos ped
LEFT JOIN Produtos prod
ON ped.id_produto = prod.id_produto
WHERE prod.id_produto IS NULL;



-- 6. PRODUTOS QUE AINDA NÃO FORAM VENDIDOS
SELECT prod.id_produto AS ID_Produto,
	   prod.nome_produto AS Nome_Produto,
       ped.id_pedido AS ID_Pedido
FROM Produtos prod
LEFT JOIN Pedidos ped
ON prod.id_produto = ped.id_produto
WHERE id_pedido IS NULL;


