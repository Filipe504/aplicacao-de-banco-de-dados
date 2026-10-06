
-- ACESSAR O BANCO DE DADOS
USE nome_bd;

-- 1. CRIAR A TABELA
CREATE TABLE PedidosKarrot ( 
     id INT AUTO_INCREMENT PRIMARY KEY, 
     cliente VARCHAR(50), 
     produto VARCHAR(50), 
     data_pedido DATE, 
     hora_pedido TIME,  
     preco DECIMAL(6,2),
     observacao VARCHAR(100) 
);
 
 -- 3. INSERIR OS REGISTROS
 INSERT INTO PedidosKarrot (cliente, produto, data_pedido, hora_pedido, preco, observacao) VALUES
('Ana Paula', 'Café Expresso', '2025-07-19', '08:10:00', 6.50, 'Com açúcar'),
('Bruno Costa', 'Cappuccino', '2025-07-19', '08:35:00', 8.00, 'Leite vegetal'),
('Carla Dias', 'Latte', '2025-07-19', '09:05:00', 7.50, 'Sem espuma'),
('Daniela Souza', 'Croissant', '2025-07-18', '10:15:00', 5.00, 'Com queijo'),
('Eduardo Lima', 'Chá Gelado', '2025-07-18', '11:20:00', 6.00, 'Com limão'),
('Fernanda Alves', 'Café Expresso', '2025-07-17', '14:30:00', 6.50, 'Sem açúcar'),
('Gabriel Silva', 'Pão de Queijo', '2025-07-16', '08:50:00', 4.00, 'Quentinho'),
('Heloísa Martins', 'Café Expresso', '2025-07-15', '07:45:00', 6.50, 'Com leite'),
('Igor Monteiro', 'Latte', '2025-07-14', '09:20:00', 7.50, 'Espuma extra'),
('Juliana Mendes', 'Cappuccino', '2025-07-14', '10:50:00', 8.00, 'Com canela'),
('Karen Rocha', 'Café Gelado', '2025-07-13', '16:00:00', 6.00, 'Com caramelo'),
('Lucas Prado', 'Chá Verde', '2025-07-13', '17:25:00', 6.00, 'Bem quente'),
('Mariana Borges', 'Pão de Queijo', '2025-07-13', '08:15:00', 4.00, 'Sem sal'),
('Nicolas Duarte', 'Croissant', '2025-07-12', '12:45:00', 5.00, 'Simples'),
('Olívia Ribeiro', 'Cappuccino', '2025-07-12', '13:00:00', 8.00, 'Com leite'),
('Paulo Vitor', 'Café Expresso', '2025-07-11', '08:05:00', 6.50, 'Forte'),
('Quésia Freitas', 'Latte', '2025-07-10', '11:40:00', 7.50, 'Com baunilha'),
('Rodrigo Lopes', 'Chá Gelado', '2025-07-10', '12:10:00', 6.00, 'Com hortelã'),
('Sara Oliveira', 'Café Expresso', '2025-07-10', '09:55:00', 6.50, 'Duplo'),
('Thiago Nunes', 'Cappuccino', '2025-07-10', '10:15:00', 8.00, 'Meio amargo');
 
 
 
-- 4. CONSULTA INICIAL
SELECT * FROM PedidosKarrot;
 
 
 
-- DESAFIO 01 
-- QUANTOS PEDIDOS FORAM FEITOS POR DATA DO PEDIDO
-- (1)
SELECT data_pedido AS Pedido, COUNT(*) AS Qtde_Pedidos
FROM PedidosKarrot
GROUP BY data_pedido
ORDER BY Qtde_Pedidos DESC;

-- (2)
-- QUANTIDADE DE PEDIDOS MAIOR QUE 2
SELECT data_pedido AS Pedido, COUNT(*) AS Qtde_Pedidos
FROM PedidosKarrot
GROUP BY data_pedido
HAVING Qtde_Pedidos > 2
ORDER BY Qtde_Pedidos DESC;


-- DESAFIO 02
-- VALOR TOTAL DOS PRODUTOS
-- OBERSERVAÇÃO QUE CONTENHA A PALAVRA 'LEITE'
SELECT produto as Produto, SUM(preco) AS Valor_Total
FROM PedidosKarrot
WHERE observacao LIKE '%leite%'
GROUP BY produto;


-- DESAFIO 03
-- MÉDIA DOS PREÇOS DOS PEDIDOS FEITOS NO TURNO DA MANHÃ (ANTES DE 12H)
-- AGRUPADA POR PRODUTO
SELECT produto AS Produto, ROUND(AVG(preco), 2) AS Preco_Medio
FROM PedidosKarrot
WHERE hora_pedido < '12:00:00'
GROUP BY produto
ORDER BY Preco_Medio ASC;


-- DESAFIO 04
-- O MENOR E O MAIOR VALOR COBRADO DOS CLIENTES
-- CUJO O SOBRENOME TERMINE COM A LETRA 'a'
SELECT cliente AS Cliente,
	  MIN(preco) AS Menor_Valor,
	  MAX(preco) AS Maior_Valor
FROM PedidosKarrot
WHERE cliente LIKE '%a'
GROUP BY Cliente;


-- DESAFIO 05
-- PRODUTOS QUE TIVERAM MAIS DE 3 PEDIDOS
-- (1)
SELECT produto AS Produto, COUNT(*) AS Qtde_Pedidos
FROM PedidosKarrot
GROUP BY produto
Having COUNT(*) > 3;
 
-- (2)
SELECT produto AS Produto, COUNT(*) AS Qtde_Pedidos
FROM PedidosKarrot
GROUP BY produto
Having Qtde_Pedidos > 3;
 