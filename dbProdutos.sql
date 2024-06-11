drop database dbProdutos;
create database dbProdutos;
use dbProdutos;

CREATE TABLE TBPRODUTOS 
( 
CODIGO INT, 
NOME VARCHAR(50), 
TIPO VARCHAR(25), 
QUANTIDADE INT, 
VALOR DECIMAL(10,2) 	
);
INSERT INTO TBPRODUTOS ( CODIGO, NOME, TIPO, QUANTIDADE, VALOR ) VALUES ( 1,'IMPRESSORA', 'INFORMATICA', 200, 600.00 ); 
INSERT INTO TBPRODUTOS ( CODIGO, NOME, TIPO, QUANTIDADE, VALOR ) VALUES ( 2,'CAMERA DIGITAL', 'DIGITAIS', 300, 400.00 ); 
INSERT INTO TBPRODUTOS ( CODIGO, NOME, TIPO, QUANTIDADE, VALOR ) VALUES ( 3,'DVD PLAYER', 'ELETRONICOS', 250, 500.00 ); 
INSERT INTO TBPRODUTOS ( CODIGO, NOME, TIPO, QUANTIDADE, VALOR ) VALUES ( 4,'MONITOR', 'INFORMATICA', 400, 900.00 ); 
INSERT INTO TBPRODUTOS ( CODIGO, NOME, TIPO, QUANTIDADE, VALOR ) VALUES ( 5,'TELEVISOR', 'ELETRONICOS', 350, 650.00 ); 
INSERT INTO TBPRODUTOS ( CODIGO, NOME, TIPO, QUANTIDADE, VALOR ) VALUES ( 6,'FILMADORA DIGITAL', 'DIGITAIS', 500, 700.00 );
INSERT INTO TBPRODUTOS ( CODIGO, NOME, TIPO, QUANTIDADE, VALOR ) VALUES ( 7,'CELULAR', 'TELEFONE', 450, 850.00 ); 
INSERT INTO TBPRODUTOS ( CODIGO, NOME, TIPO, QUANTIDADE, VALOR ) VALUES ( 8,'TECLADO', 'INFORMATICA', 300, 450.00 ); 
INSERT INTO TBPRODUTOS ( CODIGO, NOME, TIPO, QUANTIDADE, VALOR ) VALUES ( 9,'VIDEOCASSETE', 'ELETRONICOS', 200, 300.00 ); 
INSERT INTO TBPRODUTOS ( CODIGO, NOME, TIPO, QUANTIDADE, VALOR ) VALUES ( 10,'MOUSE', 'INFORMATICA', 400, 60.00 ); 
 

desc TBPRODUTOS;
select * from TBPRODUTOS;

-- Para os campos não se repetirem
select distinct tipo from TBPRODUTOS order by Tipo;

select * from tbProdutos where valor >= 600;

select valor as 'valor' from tbProdutos where valor >= 600;

-- Busca por código

select * from tbProdutos where codProd = 1;

-- Busca por nome 

select * from tbProdutos where tipo like 'i%'; --(buscar tudo o que começa com i)
select * from tbProdutos where tipo like '%s'; --(buscar tudo o que termina com s)

select * from tbProdutos where tipo like '%o%' and valor <= 600;

select * from tbProdutos where tipo like '%o%' or valor <= 600;

select * from tbProdutos where tipo = 'INFORMATICA' or  tipo = 'TELEFONE';

select * from tbProdutos where tipo in('INFORMATICA','TELEFONE');

 select * from tbProdutos where not tipo in('INFORMATICA','TELEFONE'); --(aparece todos menos os entre parenteses)

 select * from tbProdutos where valor >=100 and valor <=300;

 select * from tbProdutos where valor not between 100 and 300;

 -- 1. Aumente em 12% o valor dos produtos cujos nomes iniciem com a letra 'F' 
select * from tbProdutos where nome like 'f%'; 
update tbProdutos set valor = valor * 1.12 where CODIGO=6;

-- 2. Aumentar em 50 unidades todos os produtos cujo valor seja maior que 400 e inferior a 600 
update tbProdutos set QUANTIDADE = QUANTIDADE +50 where valor between 400 and 600;
select * from tbProdutos where valor between 400 and 600;

--3. Aplicar um desconto de 50% (*0.5) em todos os produtos que as unidades de estoque sejam maiores que 300
update tbProdutos set valor = valor * 0.5 where QUANTIDADE > 300;
select * from tbProdutos where QUANTIDADE > 300;

--4. Exiba o produto de CODIGO = 4 
select * from tbProdutos where CODIGO=4;

--5. Exibir todos os produtos que não tenham a letra 'Y' 
select * from tbProdutos where nome not like '%y%';

--6. Exibir todos os produtos que se iniciem com nome 'MO' e tenham como tipo as letras 'MA' 
select * from tbProdutos where nome like 'mo%' and tipo like '%ma%';


--select * from tbprodutos limit 5 order by valor desc;
--select * from tbprodutos order by valor limit 5;

--1. Escreva uma consulta que exiba os dados da tabela PRODUTOS na forma crescente pelo campo NOME. 
select * from tbprodutos order by nome asc;

--2. Escreva uma consulta que exiba o NOME dos produtos ordenado de forma decrescente e o VALOR de forma crescente. 
select nome, valor from tbProdutos order by nome desc , valor asc;

--3. Escreva uma consulta que exiba os três produtos mais caros. 
select * from tbProdutos order by valor desc limit 3;

--4. Escreva uma consulta que exiba o VALOR do produto mais barato. 
select * from tbProdutos order by valor desc limit 1;

