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