drop database dbLivraria;

create database dbLivraria;

use dbLivraria;

create table tbGenero(
idGenero int not null auto_increment,
descricao varchar(100),
primary key(idGenero)
);

create table tbAutor(
idAutor int not null auto_increment,
nome varchar(100),
email varchar(60),
primary key(idAutor)
);

create table tbCliente(
idCliente int not null auto_increment,
nome varchar(100),
telefone char(9) unique,
primary key(idCliente)
);

create table tbLivro(
idLivro int not null auto_increment,
titulo varchar(100),
preco decimal(9,2) not null,
estoque int,
idGenero int not null,
primary key(idLivro),
foreign key(idGenero) references tbGenero(idGenero)
);

create table tbVenda(
idVenda int not null auto_increment,
data datetime,
total decimal(9,2),
idCliente int not null,
primary key(idVenda),
foreign key(idCliente) references tbCliente(idCliente)
);

create table tbItensVenda(
idVenda int not null,
idLivro int not null,
quantidade int,
subtotal decimal(9,2),
foreign key(idVenda) references tbVenda(idVenda),
foreign key(idLivro) references tbLivro(idLivro)
);

create table tbEscreve(
idLivro int not null,
idAutor int not null,
foreign key(idLivro) references tbLivro(idLivro),
foreign key(idAutor) references tbAutor(idAutor)
);

desc tbGenero;
desc tbAutor;
desc tbCliente;
desc tbLivro;
desc tbVenda;
desc tbItensVenda;
desc tbEscreve;

-- cadastrando os registros nas tabelas
insert into tbGenero(descricao)values('Acao');
insert into tbGenero(descricao)values('Ficcao');
insert into tbGenero(descricao)values('Aventura');
insert into tbGenero(descricao)values('Terror');
insert into tbGenero(descricao)values('Comedia');
insert into tbGenero(descricao)values('Romance');
insert into tbGenero(descricao)values('Documentario');

insert into tbAutor(nome,email)values('H.G. Wells','hg.wells@hotmail.com');
insert into tbAutor(nome,email)values('J.K. Rowling','jk.rowling@hotmail.com');
insert into tbAutor(nome,email)values('Suzanne Collins','suz.collins@hotmail.com');
insert into tbAutor(nome,email)values('Gerald Bittle','gerald.b@hotmail.com');
insert into tbAutor(nome,email)values('Ariano Suassuna','ari.sussu@hotmail.com');
insert into tbAutor(nome,email)values('Jojo Moyes','jojo.mo@hotmail.com');
insert into tbAutor(nome,email)values('Franthiesco Ballerini','frant.balle@hotmail.com');

insert into tbCliente(nome,telefone)values('Ana Lima','97575-8282');
insert into tbCliente(nome,telefone)values('Gabrielly Costa','97574-8186');
insert into tbCliente(nome,telefone)values('Lary Ramos','99375-4272');

insert into tbLivro(titulo,preco,estoque,idGenero)values('Harry Potter e a Pedra Filosofal',44.92,3,2);
insert into tbLivro(titulo,preco,estoque,idGenero)values('A Guerra dos Mundos',54.68,5,1);
insert into tbLivro(titulo,preco,estoque,idGenero)values('Jogos Vorazes - A Esperanca',52.47,10,3);
insert into tbLivro(titulo,preco,estoque,idGenero)values('Ed & Lorraine Warren - Demonologos',57.38,7,4);
insert into tbLivro(titulo,preco,estoque,idGenero)values('O Auto da Compadecida',44.92,25,5);
insert into tbLivro(titulo,preco,estoque,idGenero)values('Como eu era antes de voce',29.45,2,6);
insert into tbLivro(titulo,preco,estoque,idGenero)values('Historia do cinema mundial',86.00,3,7);

insert into tbVenda(data,total,idCliente)values('2024-05-16',150.00,2);
insert into tbVenda(data,total,idCliente)values('2024-05-12',52.47,1);
insert into tbVenda(data,total,idCliente)values('2024-05-16',75.50,3);


insert into tbItensVenda(idVenda,idLivro,quantidade,subtotal)values(3,4,5,150.00);
insert into tbItensVenda(idVenda,idLivro,quantidade,subtotal)values(1,3,10,230.00);
insert into tbItensVenda(idVenda,idLivro,quantidade,subtotal)values(2,4,12,550.00);

insert into tbEscreve(idLivro,idAutor)values(4,7);
insert into tbEscreve(idLivro,idAutor)values(3,5);
insert into tbEscreve(idLivro,idAutor)values(1,6);

-- Pesquisar os campos das tabelas
select * from tbGenero;
select * from tbAutor;
select * from tbCliente;
select * from tbLivro;
select * from tbVenda;
select * from tbItensVenda;
select * from tbEscreve;