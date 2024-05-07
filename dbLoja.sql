-- apagando banco de dados se existir
drop database dbloja;

-- criando banco de dados
create database dbloja;

--acessando banco de dados
use dbLoja;

-- criando as tabelas no banco de dados
create table tbFuncionarios(
codfunc int not null auto_increment,
nome varchar(100) not null,
email varchar(100),
cpf char(14) not null unique,
telCel char(10),
logradouro varchar(100),
numero char(10),
cep char(9),
bairro varchar(100),
cidade varchar(100),
estado char(2),
primary key(codFunc)
);

create table tbFornecedores(
codForn int not null auto_increment,
nome varchar(100),
email varchar(100),
cnpj char(16) not null unique,
primary key(codForn)
);

create table tbClientes(
codCli int not null auto_increment,
nome varchar(100),
email varchar(100),
cpf char(14) not null unique,
primary key(codCli)
);

create table tbUsuarios(
codUsu int auto_increment,
nome varchar(50),
senha varchar(20),
codfunc int not null,
primary key(codUsu),
foreign key(codFunc) references tbFuncionarios(codFunc)
);

create table tbProdutos(
codProd int not null auto_increment,
descricao varchar(100),
valor decimal(9,2),
quantidade int,
data date,
hora time,
codForn int not null,
primary key(codProd),
foreign key(codForn) references tbFornecedores(codForn)
);

--visualizando as tabelas criadas
show tables;
-- comando: source 'C:\nomedapasta\nomedoarquivo.sql'

--visualizando as estruturas das tabelas
describe tbUsuarios;
desc tbFuncionarios;

--inserindo valores registros nas tabelas
insert into tbFuncionarios(nome,email,cpf,telCel,logradouro,numero,cep,bairro,cidade,estado)
	values('Crislene Santos', 'crislene.santoss13@hotmail.com','431.042.468-66','97727-3875','Rua Alfeneiros','04','05566-123','Eledy','Sao Paulo','SP');
	insert into tbFuncionarios(nome,email,cpf,telCel,logradouro,numero,cep,bairro,cidade,estado)
	values('Ana Frios Delgado Matarazzo', 'ana.fdmatarazzo@hotmail.com','041.042.123-55','96093-6479','Rua da Alegria','123','05766-051','Santo Amaro','Sao Paulo','SP');
insert into tbUsuarios(nome,senha,codFunc)
	values('cris.sansi', 'deximbranco',1);
insert into tbUsuarios(nome,senha,codFunc)
	values('ana.fdmatarazzo', '123456',2);
--visualizando os registros nos campos das tabelas

select * from tbUsuarios;
select * from tbFuncionarios;
