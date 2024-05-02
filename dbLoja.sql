-- apagando banco de dados se existir
drop database dbloja;

-- criando banco de dados
create database dbloja;

--acessando banco de dados
use dbLoja;

-- criando as tabelas no banco de dados
create table tbUsuarios(
codUsu int,
nome varchar(50),
senha varchar(20)
);


create table tbFuncionarios(
codfunc int,
nome varchar(100),
email varchar(100),
cpf char(14),
telCel char(10)
);



--visualizando as tabelas criadas
show tables;

--visualizando as estruturas das tabelas
describe tbUsuarios;
desc tbFuncionarios;

--inserindo valores registros nas tabelas
insert into tbUsuarios(codUsu,nome,senha)
	values(1, 'cris.sansi', 'deximbranco');

insert into tbFuncionarios(codFunc,nome,email,cpf,telCel)
	values(10,'Crislene Santos', 'crislene.santoss13@hotmail.com','431.042.468-66','97727-3875');

--visualizando os registros nos campos das tabelas

select * from tbUsuarios;
select * from tbFuncionarios;
