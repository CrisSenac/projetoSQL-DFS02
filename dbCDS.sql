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

create table tbEstados (
siglaEst char(2) not null,
nomeEst varchar(50) not null,
primary key (siglaEst)
);

create table tbCidades (
codCid int not null auto_increment,
siglaEst char(2) not null,
nomeCid varchar(50) not null,
primary key (codCid),
foreign key (siglaEst) references tbEstados(siglaEst)
);

create table tbClientes(
codCli int auto_increment,
codCid int not null,
nomeCli varchar(50) not null,
endCli varchar(100) not null,
rendaCli decimal(9,2) not null default 0,
sexoCli char(1) default 'F',
primary key(codCli),
foreign key(codCid) references tbCidades(codCid)
);

create table tbConjuge(
codConj int not null auto_increment,
nomeConj varchar(50) not null,
rendaConj decimal(9,2) not null default 0,
sexoConj char(1) not null default 'F',
primary key(codConj)
);

create table tbFuncionarios(
codFunc int not null auto_increment,
nomeFunc varchar(50) not null,
endFunc varchar(100) not null,
salFunc decimal(9,2) not null default 0,
sexoFunc char(1) default 'F',
primary key(codFunc)
);

create table tbDependentes(
codDep int not null auto_increment,
codFunc int not null,
nomeDep varchar(100) not null,
sexoDep char(1) not null default 'F',
primary key(codDep),
foreign key(codFunc) references tbFuncionarios(codFunc)
);

create table tbTitulos(
codTit int not null auto_increment,
nomeCd varchar(50) not null unique,
valCd decimal(9,2) not null,
quantEstq int not null,
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
valPed decimal(9,2) not null default 0,
primary key(numPed),
foreign key(codCli) references tbClientes(codCli),
foreign key(codFunc) references tbFuncionarios(codFunc)
);

create table tbTitulosArtista(
codTit int not null,
codArt int not null,
primary key (codTit, codArt),
foreign key(codArt) references tbArtistas(codArt),
foreign key(codTit) references tbTitulos(codTit)
);

create table tbTitulosPedido(
numPed int not null,
codTit int not null,
qtdTit int not null,
qtdCd int not null,
valCd decimal(9,2) not null,
primary key (numPed, codTit),
foreign key(numPed) references tbPedidos(numPed),
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
desc tbTitulosArtista;
desc tbTitulosPedido;

insert into tbArtistas(nomeArt) values ('Marisa Monte');
insert into tbArtistas(nomeArt) values ('Gilberto Gil');
insert into tbArtistas(nomeArt) values ('Caetano Veloso');
insert into tbArtistas(nomeArt) values ('Milton Nascimento');
insert into tbArtistas(nomeArt) values ('Legião Urbana');
insert into tbArtistas(nomeArt) values ('The Beatles');
insert into tbArtistas(nomeArt) values ('Rita Lee');

insert into tbGravadoras(nomeGrav) values ('PolyGram');
insert into tbGravadoras(nomeGrav) values ('EMI');
insert into tbGravadoras(nomeGrav) values ('Som Livre');
insert into tbGravadoras(nomeGrav) values ('Som Music');

insert into tbCategorias(nomeCat) values ('MPB');
insert into tbCategorias(nomeCat) values ('Trilha Sonora');
insert into tbCategorias(nomeCat) values ('Rock Internacional');
insert into tbCategorias(nomeCat) values ('Rock Nacional');

insert into tbEstados(siglaEst, nomeEst) values ('SP', 'São Paulo');
insert into tbEstados(siglaEst, nomeEst) values ('MG', 'Minas Gerais');
insert into tbEstados(siglaEst, nomeEst) values ('RJ', 'Rio de Janeiro');
insert into tbEstados(siglaEst, nomeEst) values ('ES', 'Espírito Santo');

insert into tbCidades(siglaEst, nomeCid) values ('SP', 'Sao Paulo');
insert into tbCidades(siglaEst, nomeCid) values ('SP', 'Sorocaba');
insert into tbCidades(siglaEst, nomeCid) values ('SP', 'Jundiai');
insert into tbCidades(siglaEst, nomeCid) values ('SP', 'Americana');
insert into tbCidades(siglaEst, nomeCid) values ('SP', 'Araraquara');
insert into tbCidades(siglaEst, nomeCid) values ('MG', 'Ouro Preto');
insert into tbCidades(siglaEst, nomeCid) values ('ES', 'Cachoeira do Itapemirim');

insert into tbClientes(codCid, nomeCli, endCli, rendaCli, sexoCli) values (1, 'Jose Nogueira', 'Rua A', 1500.00, 'M');
insert into tbClientes(codCid, nomeCli, endCli, rendaCli, sexoCli) values (1, 'Angelo Pereira', 'Rua B', 2000.00, 'M');
insert into tbClientes(codCid, nomeCli, endCli, rendaCli, sexoCli) values (1, 'Alem Mar Paranhos', 'Rua C', 1500.00, 'M');
insert into tbClientes(codCid, nomeCli, endCli, rendaCli, sexoCli) values (1, 'Catarina Souza', 'Rua D', 892.00, 'F');
insert into tbClientes(codCid, nomeCli, endCli, rendaCli, sexoCli) values (1, 'Vagner Costa', 'Rua E', 950.00, 'M');
insert into tbClientes(codCid, nomeCli, endCli, rendaCli, sexoCli) values (1, 'Antenor da Costa', 'Rua F', 1582.00, 'M');
insert into tbClientes(codCid, nomeCli, endCli, rendaCli, sexoCli) values (1, 'Maria Amelia de Souza', 'Rua G', 1152.00, 'F');
insert into tbClientes(codCid, nomeCli, endCli, rendaCli, sexoCli) values (1, 'Paulo Roberto Silva', 'Rua H', 3250.00, 'M');
insert into tbClientes(codCid, nomeCli, endCli, rendaCli, sexoCli) values (1, 'Fatima Souza', 'Rua I', 1632.00, 'F');
insert into tbClientes(codCid, nomeCli, endCli, rendaCli, sexoCli) values (1, 'Joel da Rocha', 'Rua J',2000.00,'M');

insert into tbConjuge(nomeConj,rendaConj,sexoConj)values('Carla Nogueira',2500.00,'F');
insert into tbConjuge(nomeConj,rendaConj,sexoConj)values('Emilia Pereira',5500.00,'F');
insert into tbConjuge(nomeConj,rendaConj,sexoConj)values('Altiva da Costa',3000.00,'F');
insert into tbConjuge(nomeConj,rendaConj,sexoConj)values('Carlos de Souza',3250.00,'M');

insert into tbFuncionarios(nomeFunc,endFunc,salFunc,sexoFunc)values('Vania Gabriela Pereira','Rua A',2500.00,'F');
insert into tbFuncionarios(nomeFunc,endFunc,salFunc,sexoFunc)values('Norberto Pereira da Silva','Rua B',300.00,'M');
insert into tbFuncionarios(nomeFunc,endFunc,salFunc,sexoFunc)values('Olavo Linhares','Rua C',580.00,'M');
insert into tbFuncionarios(nomeFunc,endFunc,salFunc,sexoFunc)values('Paula da Silva','Rua D',3000.00,'F');
insert into tbFuncionarios(nomeFunc,endFunc,salFunc,sexoFunc)values('Rolando Rocha','Rua E',2000.00,'M');

insert into tbDependentes(codFunc,nomeDep,sexoDep)values('1','Ana Pereira','F');
insert into tbDependentes(codFunc,nomeDep,sexoDep)values('1','Roberto Pereira','M');
insert into tbDependentes(codFunc,nomeDep,sexoDep)values('1','Celso Pereira','M');
insert into tbDependentes(codFunc,nomeDep,sexoDep)values('3','Brisa Linhares','F');
insert into tbDependentes(codFunc,nomeDep,sexoDep)values('3','Mari Sol Linhares','F');
insert into tbDependentes(codFunc,nomeDep,sexoDep)values('4','Sonia da Silva','F');

insert into tbTitulos(codCat,codGrav,nomeCd,valCd,quantEstq)values(1,1,'Tribalistas',30.00,'1500');
insert into tbTitulos(codCat,codGrav,nomeCd,valCd,quantEstq)values(1,2,'Tropicalia',50.00,'500');
insert into tbTitulos(codCat,codGrav,nomeCd,valCd,quantEstq)values(1,1,'Aquele abraço',50.00,'600');
insert into tbTitulos(codCat,codGrav,nomeCd,valCd,quantEstq)values(1,2,'Refazenda',60.00,'1000');
insert into tbTitulos(codCat,codGrav,nomeCd,valCd,quantEstq)values(1,3,'Totalmente demais',50.00,'2000');
insert into tbTitulos(codCat,codGrav,nomeCd,valCd,quantEstq)values(1,3,'Travessia',55.00,'500');
insert into tbTitulos(codCat,codGrav,nomeCd,valCd,quantEstq)values(1,2,'Courage',30.00,'200');
insert into tbTitulos(codCat,codGrav,nomeCd,valCd,quantEstq)values(4,3,'Legiao Urbana',20.00,'100');
insert into tbTitulos(codCat,codGrav,nomeCd,valCd,quantEstq)values(3,2,'The Beatles',30.00,'300');
insert into tbTitulos(codCat,codGrav,nomeCd,valCd,quantEstq)values(4,1,'Rita Lee',30.00,'500');

insert into tbPedidos(codCli,codFunc,datPed,valPed)values(1,2,'02/05/02',1500.00);
insert into tbPedidos(codCli,codFunc,datPed,valPed)values(3,4,'02/05/02'50.00);
insert into tbPedidos(codCli,codFunc,datPed,valPed)values(4,7,'02/06/02',100.00);
insert into tbPedidos(codCli,codFunc,datPed,valPed)values(1,4,'02/02/03',200.00);
insert into tbPedidos(codCli,codFunc,datPed,valPed)values(7,5,'02/03/03',300.00);
insert into tbPedidos(codCli,codFunc,datPed,valPed)values(4,4,'02/02/03',100.00);
insert into tbPedidos(codCli,codFunc,datPed,valPed)values(5,5,'02/03/03',50.00);
insert into tbPedidos(codCli,codFunc,datPed,valPed)values(8,2,'02/03/03',50.00);
insert into tbPedidos(codCli,codFunc,datPed,valPed)values(2,2,'02/03/03',2000.00);
insert into tbPedidos(codCli,codFunc,datPed,valPed)values(7,1,'02/03/03',3000.00);

insert into tbTitulosArtista(codTit,codArt)values(1,'1');
insert into tbTitulosArtista(codTit,codArt)values(2,'2');
insert into tbTitulosArtista(codTit,codArt)values(3,'2');
insert into tbTitulosArtista(codTit,codArt)values(4,'2');
insert into tbTitulosArtista(codTit,codArt)values(5,'3');
insert into tbTitulosArtista(codTit,codArt)values(6,'4');
insert into tbTitulosArtista(codTit,codArt)values(7,'4');
insert into tbTitulosArtista(codTit,codArt)values(8,'5');
insert into tbTitulosArtista(codTit,codArt)values(9,'6');
insert into tbTitulosArtista(codTit,codArt)values(10,'7');

insert into tbTitulosPedido(numPed,codTit,qtdTit,valCd)values(1,1,2,30.00);
insert into tbTitulosPedido(numPed,codTit,qtdTit,valCd)values(1,2,3,20.00);
insert into tbTitulosPedido(numPed,codTit,qtdTit,valCd)values(2,1,1,50.00);
insert into tbTitulosPedido(numPed,codTit,qtdTit,valCd)values(2,2,3,30.00);
insert into tbTitulosPedido(numPed,codTit,qtdTit,valCd)values(3,1,2,40.00);
insert into tbTitulosPedido(numPed,codTit,qtdTit,valCd)values(4,2,3,20.00);
insert into tbTitulosPedido(numPed,codTit,qtdTit,valCd)values(5,1,2,25.00);
insert into tbTitulosPedido(numPed,codTit,qtdTit,valCd)values(6,2,3,30.00);
insert into tbTitulosPedido(numPed,codTit,qtdTit,valCd)values(6,3,1,35.00);
insert into tbTitulosPedido(numPed,codTit,qtdTit,valCd)values(7,4,2,55.00);
insert into tbTitulosPedido(numPed,codTit,qtdTit,valCd)values(8,1,4,60.00);
insert into tbTitulosPedido(numPed,codTit,qtdTit,valCd)values(9,2,3,15.00);
insert into tbTitulosPedido(numPed,codTit,qtdTit,valCd)values(10,7,2,15.00);

select * from tbArtistas;
select * from tbGravadoras;
select * from tbCategorias;
select * from tbEstados;
select * from tbCidades;
select * from tbClientes;
select * from tbConjuge;
select * from tbFuncionarios;
select * from tbDependentes;
select * from tbTitulos;
select * from tbPedidos;
select * from tbTitulosArtista;
select * from tbTitulosPedido;

--Exercícios 88/89

-- 1. Selecione o nome dos CDs e o nome da gravadora de cada CD. 
select t.nomeCd, g.nomeGrav from tbTitulos t inner join tbGravadoras g on t.codGrav = g.codGrav;

-- 2. Selecione o nome dos CDs e o nome da categoria de cada CD. 
select t.nomeCd, c.nomeCat from tbTitulos t inner join tbCategorias c on t.codCat = c.codCat;

-- 3. Selecione o nome dos CDs, o nome das gravadoras de cada CD e o nome da categoria de cada CD. 
select Tit.nomeCd 'CD', Grav.nomeGrav 'Grav', Cat.nomeCat 'Cat' from tbTitulos as Tit 
inner join tbGravadoras as Grav on Tit.codGrav = Grav.codGrav 
inner join tbCategorias as Cat on Tit.codGrav = Cat.codCat;

-- 4. Selecione o nome dos clientes e os títulos dos CDs vendidos em cada pedido que o cliente fez
select cli.nomeCli as Cli, tit.nomeCd as Tit from tbClientes as Cli
inner join tbPedidos as Ped on cli.codCli = ped.codCli
inner join tbTitulosPedido as Tp on ped.numPed = tp.numPed
inner join tbTitulos as Tit on tp.codTit = tit.codTit;

-- 5. Selecione o nome do funcionário, número, data e valor dos pedidos que este funcionário registrou, além do nome do cliente que está fazendo o pedido. 
select func.nomeFunc, ped.numPed, ped.datPed, ped.valPed, cli.nomeCli from tbPedidos as Ped
inner join tbFuncionarios as func on ped.codFunc = func.codFunc
inner join tbClientes as cli on cli.codCli = ped.codCli;

-- 6. Selecione o nome dos funcionários e o nome de todos os dependentes de cada funcionário. 
select func.codFunc, dep.nomeDep from tbDependentes as Dep
inner join tbFuncionarios as Func on 



--9 
select cli.nome, conj.nome, numero, valor, from tbPedidos as ped numPed
inner join tbClientes as cli on ped.codcli = cli.codCli
left join tbConjuge as conj on ped.numped = conj.codConj