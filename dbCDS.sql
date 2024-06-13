drop database dbCDS;

create database dbCDS;

use dbCDS;

create table tbArtistas(
codArt int not null auto_increment,
nomeArt varchar(100) not null unique,
primary key (codArt)
);


create table tbGravadoras(
codGrav int not null auto_increment,
nomeGrav varchar(50) not null unique,
primary key (codGrav)
);


CREATE TABLE tbCategorias (
codCat INT NOT NULL AUTO_INCREMENT,
nomeCat VARCHAR(50) NOT NULL UNIQUE,
primary key (codCat)
);

create table tbEstados(
siglaEst char(2) not null,
nomeEst varchar(50) not null unique,
primary key (siglaEst)
);

create table tbCidades(
codCid int not null auto_increment,
siglaEst char(2) not null,
nomeCid varchar(50) not null,
primary key (codCid),
foreign key (siglaEst) references tbEstados(siglaEst)
);


insert into tbCidades(siglaEst,nomeCid)values()
insert into tbCidades(siglaEst,nomeCid)values()
insert into tbCidades(siglaEst,nomeCid)values()
insert into tbCidades(siglaEst,nomeCid)values()
insert into tbCidades(siglaEst,nomeCid)values()
insert into tbCidades(siglaEst,nomeCid)values()
insert into tbCidades(siglaEst,nomeCid)values()


create table tbClientes(
codCli int not null auto_increment,
codCid int not null,
nomeCli varchar(50) not null,
endCli varchar(100) not null,
rendaCli decimal(9,2) not null default 0 check(rendaCli >= 0),
sexoCli char(1) default 'F' check(sexoCli in('F','M')),
primary key(codCli),
foreign key(codCid) references tbCidades(codCid)
);

create table tbConjuge(
codConj int not null auto_increment,
nomeConj varchar(50) not null,
rendaConj decimal(9,2) not null default 0 check(rendaConj >= 0),
sexoConj char(1) not null default 'F' check(sexoConj in('F','M')),
primary key(codConj)
);

create table tbFuncionarios(
codFunc int not null auto_increment,
nomeFunc varchar(50) not null,
endFunc varchar(100) not null,
salFunc decimal(9,2) not null default 0 check(salFunc >= 0),
sexoFunc char(1) default 'F' check(sexoFunc in('F','M')),
primary key(codFunc)
);

create table tbDependentes(
codDep int not null auto_increment,
codFunc int not null,
nomeDep varchar(100) not null,
sexoDep char(1) not null default 'F' check(sexoDep in('F','M')),
primary key(codDep),
foreign key(codFunc) references tbFuncionarios(codFunc)
);

create table tbTitulos(
codTit int not null auto_increment,
nomeCd varchar(50) not null unique,
valCd decimal(9,2) not null check(valCd >= 0),
quantEstq int not null check(quantEstq >= 0),
codCat int not null,
codGrav int not null,
primary key(codTit),
foreign key(codCat) references tbCategorias(codCat),
foreign key(codGrav) references tbGravadoras(codGrav)
);

create table tbPedidos(
numPed int not null auto_increment,
codCli int not null,
codFunc int not null,
datPed datetime not null,
valPed decimal(9,2) not null default 0 check(valPed >= 0),
primary key(numPed),
foreign key(codCli) references tbClientes(codCli),
foreign key(codFunc) references tbFuncionarios(codFunc)
);

create table tbTitulosPedido(
numPed int not null,
codTit int not null,
qtdTit int not null,
qtdCd int not null check(qtdCd >= 1),
valCd decimal(9,2) not null check(valCd >= 0),
foreign key(numPed) references tbPedidos(numPed),
foreign key(codTit) references tbTitulos(codTit)
);

create table tbTitulosArtista(
codTit int not null,
codArt int not null,
foreign key(codArt) references tbArtistas(codArt),
foreign key(codTit) references tbTitulos(codTit)
);

desc tbArtistas;
desc tbGravadoras;
desc tbCategorias;
desc tbEstados;
desc tbCidades;
desc tbClientes;
desc tbConjuge;
desc tbFuncionarios;
desc tbDependentes;
desc tbTitulos;
desc tbPedidos;
desc tbTitulosPedido;
desc tbTitulosArtista;

insert into tbArtistas(nomeArt)values('Marisa Monte');
insert into tbArtistas(nomeArt)values('Gilberto Gil');
insert into tbArtistas(nomeArt)values('Caetano Veloso');
insert into tbArtistas(nomeArt)values('Milton Nascimento');
insert into tbArtistas(nomeArt)values('Legião Urbana');
insert into tbArtistas(nomeArt)values('The Beatles');
insert into tbArtistas(nomeArt)values('Rita Lee');

insert into tbGravadoras(nomeGrav)values('PolyGram');
insert into tbGravadoras(nomeGrav)values('EMI');
insert into tbGravadoras(nomeGrav)values('Som Livre');
insert into tbGravadoras(nomeGrav)values('Som Music');

INSERT INTO tbCategorias(nomeCat) VALUES ('MPB');
INSERT INTO tbCategorias(nomeCat) VALUES ('Trilha Sonora');
INSERT INTO tbCategorias(nomeCat) VALUES ('Rock Internacional');
INSERT INTO tbCategorias(nomeCat) VALUES ('Rock Nacional');

insert into tbEstados(siglaEst,nomeEst)values('SP','São Paulo');
insert into tbEstados(siglaEst,nomeEst)values('MG','Minas Gerais');
insert into tbEstados(siglaEst,nomeEst)values('RJ','Rio de Janeiro');