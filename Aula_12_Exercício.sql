
-- 0. ACESSANDO O BANCO DE DADOS
USE nome_banco_de_dados;


-- 1. CRIAR TABELAS: PRODUTOS E VENDAS
CREATE TABLE produtos ( 
  id INT AUTO_INCREMENT PRIMARY KEY, 
  nome VARCHAR(50),
  estoque INT 
); 

CREATE TABLE vendas ( 
 id INT AUTO_INCREMENT PRIMARY KEY, 
 produto_id INT, 
 quantidade INT, 
 FOREIGN KEY (produto_id) REFERENCES produtos(id) 
);
 
 
-- 2. INSERIR REGISTROS (CREATE)
INSERT INTO produtos (nome, estoque) 
VALUES ('Pão Francês', 100), 
	   ('Bolo de Chocolate', 20), 
	   ('Sonho com creme', 15);
       
       
-- 3. CONSULTAR TABELAS
SELECT * FROM produtos;
SELECT * FROM vendas;
       
       
-- 4. INICIAR A TRANSAÇÃO
START TRANSACTION;


-- 5. INSERIR A PRIMEIRA VENDA (+2 PÃES DE SAL)
INSERT INTO vendas (produto_id, quantidade)
VALUES (1, 2);
 
 
-- 6. ATUALIZAR O ESTOQUE DA TABELA PRODUTOS
-- (BOLO DE CHOCOLATE = 0)
UPDATE produtos
SET estoque = 0
WHERE id = 2;


-- 7. CRIAR PONTO DE SALVAMENTO
SAVEPOINT PONTO_SAVE_01;


-- 8. INSERIR A SEGUNDA VENDA (+1 BOLO DE CHOCOLATE)
INSERT INTO vendas (produto_id, quantidade)
VALUES (2, 1);


-- 9. RETORNAR AO PONTO DE SALVAMENTO, DESFAZENDO A SEGUNDA VENDA
ROLLBACK TO SAVEPOINT PONTO_SAVE_01;


-- 10. FINALIZAR A TRANSAÇÃO
COMMIT;


-- 11. CONSULTA FINAL
SELECT * FROM produtos;
SELECT * FROM vendas;
