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