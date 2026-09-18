
-- 0. ACESSAR O BANCO DE DADOS
USE nome_bd;

-- 1. CRIAR TABELAS
CREATE TABLE fornecedores (
	id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
    );
    
CREATE TABLE produtos (
	id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    preco DECIMAL (8,2) NOT NULL,
    estoque INT NOT NULL,
    id_fornecedor INT,
    FOREIGN KEY (id_fornecedor) REFERENCES fornecedores(id)
);

CREATE TABLE vendas (
	id INT AUTO_INCREMENT PRIMARY KEY,
    quantidade INT NOT NULL,
    data_venda DATE NOT NULL,
    id_produto INT,
    FOREIGN KEY (id_produto) REFERENCES produtos(id)
);


-- 2. INSERIR REGISTROS
INSERT INTO fornecedores (nome) VALUES
('MASSAS INC'),
('BOLOS INC'),
('DOCES INC'),
('SALGADOS INC');

INSERT INTO produtos (nome, preco, estoque, id_fornecedor) VALUES
('Bolo de Chocolate', 20.00, 50, 2),
('Coxinha', 4.00, 20, 4),
('Pão Francês', 0.5, 80, 1),
('Brigadeiro', 1.00, 100, 3);

INSERT INTO vendas (quantidade, data_venda, id_produto) VALUES
(10, '2026-02-01', 2),
(25, '2026-02-01', 1),
(45, '2026-02-01', 4),
(70, '2026-02-01', 3);

-- 3. CONSULTAS INICIAS
SELECT * FROM fornecedores;
SELECT * FROM produtos;
SELECT * FROM vendas;



-- ******INNER JOIN******
-- 'AS' do apelido da tabela é opcional


-- 4. NOME DO PRODUTO E NOME DO FORNECEDOR
SELECT prod.id AS ID,
	   prod.nome AS Produto,
	   prod.estoque AS Estoque,
       forn. nome AS Fornecedor
FROM produtos as prod
INNER JOIN fornecedores as forn
ON prod.id_fornecedor = forn.id;


-- 5. PRODUTOS VENDIDOS, SUAS QUANTIDADES E DATAS DE VENDA
SELECT vend.quantidade AS Quantidade,
	   vend.data_venda AS Data_Venda,
	   prod.nome AS Produto,
       prod.id AS ID_Produto
FROM vendas AS vend
INNER JOIN produtos AS prod
ON vend.id_produto = prod.id
ORDER BY data_venda ASC;

-- 6. NOME DO PRODUTO, VALOR TOTAL DA VENDA E NOME DO FORNECEDOR
SELECT prod.id AS ID, 
	   prod.nome AS Produto,
       prod.preco AS Preco,
       forn.nome AS Fornecedor,
       vend.quantidade AS Quantidade_Venda,
	   vend.data_venda AS Data_Venda,
       (vend.quantidade * prod.preco) AS Valor_Total
FROM produtos AS prod
INNER JOIN fornecedores AS forn 
ON prod.id_fornecedor = forn.id
INNER JOIN vendas AS vend
ON vend.id_produto = prod.id;

-- OU
-- FROM vendas AS vend
-- INNER JOIN produtos AS prod
-- ON vend.id_produto = prod.id
-- INNER JOIN fornecedores AS forn
-- ON prod.id_fornecedor = forn.id;


-- 7. PRODUTOS COM ESTOQOUE ABAIXO DE 30 UNIDADES E SEUS FORNECEDORES
SELECT prod.id AS ID,
	   prod.nome AS Produto,
       prod.estoque AS Estoque,
       forn.nome AS Fornecedor
FROM produtos AS prod
INNER JOIN fornecedores AS forn 
ON prod.id_fornecedor = forn.id
WHERE estoque < 30
ORDER BY estoque ASC;
