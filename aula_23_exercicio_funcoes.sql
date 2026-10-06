
-- 0. ACESSANDO O BANCO DE DADOS
USE nome_bd;

-- 1. CRIAÇÃO DA TABELA
CREATE TABLE Pedidos (
    id_pedido INT PRIMARY KEY AUTO_INCREMENT,
    nome_cliente VARCHAR(100),
    produto VARCHAR(100),
    valor DECIMAL(10,2),
    desconto DECIMAL(10,2),
    forma_pagamento VARCHAR(50)
);

-- 2. INSERÇÃO DOS REGISTROS NA TABELA
INSERT INTO Pedidos (nome_cliente, produto, valor, desconto, forma_pagamento) VALUES
('Ana Silva', 'Notebook', 3500.00, 200.00, 'Cartão'),
('Bruno Lima', 'Mouse', 80.00, NULL, 'Pix'),
('Carlos Souza', 'Teclado', 150.00, 0.00, 'Boleto'),
('Daniela Rocha', 'Monitor', 1200.00, 100.00, 'Cartão'),
('Eduardo Mendes', 'Headset', 300.00, NULL, 'Pix'),
('Fernanda Alves', 'Cadeira Gamer', 900.00, 50.00, 'Boleto'),
('Gabriel Costa', 'Webcam', 250.00, 0.00, 'Cartão'),
('Helena Martins', 'Notebook', 4000.00, NULL, 'Cartão'),
('Igor Santos', 'Mouse Pad', 40.00, 5.00, 'Pix'),
('Juliana Freitas', 'Monitor', 1100.00, 0.00, 'Boleto');

-- 3. CONSULTA INICIAL
SELECT * FROM Pedidos;


-- ***EXERCÍCIOS***

-- 1 - (IF) AVALIAR OS VALORES
SELECT nome_cliente AS Cliente,
	   valor AS Valor,
       IF(valor > 1000.00, 'Alto', 'Baixo') AS Descricao
FROM Pedidos
ORDER BY valor ASC;

-- 2 - (IF) AVALIAR AS FORMAS DE PAGAMENTO
SELECT nome_cliente AS Cliente,
	   forma_pagamento AS Forma_Pagamento,
       IF(forma_pagamento = 'Pix', 'À vista', 'Parcelado') AS Tipo_Pagamento
FROM Pedidos
ORDER BY forma_pagamento ASC;


-- 3 - (CASE) CLASSIFICAR OS PEDIDOS DE ACORDO COM OS VALORES
-- AND OU BETWEEN
SELECT nome_cliente AS Cliente,
	   forma_pagamento AS Forma_Pagamento,
	   valor AS Valor,
		CASE
			WHEN valor < 100.00 THEN 'Muito Barato'
            WHEN valor >= 100.00 AND valor <= 500.00 THEN 'Médio'
            WHEN valor BETWEEN 500.00 AND 2000.00 THEN 'Caro'
            ELSE 'Muito Caro'
		END Classificacao
FROM Pedidos
ORDER BY valor ASC; 

-- 4 - (CASE) CRIAR UMA COLUNA DE CATEGORIA DOS PRODUTOS
SELECT nome_cliente AS Cliente,
	   forma_pagamento AS Forma_Pagamento,
       produto AS Produto,
	   CASE
		   WHEN produto IN ('Notebook', 'Mouse', 'Teclado', 'Webcam') THEN 'Informática'
           WHEN produto = 'Cadeira Gamer' THEN 'Móveis'
           ELSE 'Outros'
		END Categoria
FROM Pedidos
ORDER BY Categoria ASC;

-- 5 - (IFNULL) SE O DESCONTO FOR 'NULL', MOSTRAR '0'
SELECT nome_cliente AS Cliente,
	   desconto AS Desconto,
       IFNULL(desconto, 0) AS Desconto_Corrigido
FROM Pedidos
ORDER BY desconto ASC;
