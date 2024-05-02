-- apagando banco de dados
drop database dbGabybolos;
-- criando banco de dados 
create database dbGabybolos;
-- acessando o banco de dados
use dbGabybolos;
-- visualizando o banco de dados
show tables;
--criando tabelas 
create table tbFuncionarios(
codfunc int,
nome varchar(100),
email varchar(100),
telefone char(9)
);

show tables;

desc tbFuncionarios;