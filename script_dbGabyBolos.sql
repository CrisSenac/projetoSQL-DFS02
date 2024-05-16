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


Tipos de registros

Caracter = 'Senac'
Numérico 
	inteiro = 10
	real = 20.35
Data = '2024-05-16'
Hora = '14:06:45'
Booleano = true or false