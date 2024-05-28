drop database dbBarbearia;

create database dbBarbearia;

use dbBarbearia;

create table tbProdutos(
codProd int not null auto_increment,
descricao varchar(100),
marca varchar(50),
preco decimal(9,2),
primary key(codProd)
);

insert into tbProdutos(descricao,marca,preco)values('Shampoo','Nivea', 30.00);
insert into tbProdutos(descricao,marca,preco)values('Sabonete','Phebo', 5.00);
insert into tbProdutos(descricao,marca,preco)values('Creme de barbear','Barbers', 30.00);
insert into tbProdutos(descricao,marca,preco)values('Gel para cabelos','Nylooks', 25.00);
 select * from tbProdutos;

-- delete from tbProdutos where codProd = 2;

select * from tbProdutos;

select codProd as 'Código', descricao as 'Descrição', marca as 'Marca', preco as 'Preço' from tbProdutos;

-- Colunas virtuais
-- select codProd,descricao,'promoção' as 'promo',marca,preco, 
	--from tbProdutos;

select codProd as 'Código', descricao as 'Descrição', marca as 'Marca','Sim' as 'Vendido', preco as 'Preço' from tbProdutos;

-- utilizando calculos no sql

update tbProdutos set preco = preco * 1.10 where codProd=3;

select * from tbProdutos;

select preco * 0.90 as 'Desconto' from tbProdutos;

update tbProdutos set preco = preco * 0.20 where codProd=1;