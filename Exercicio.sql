drop database dbExercicio;

create database dbExercicio;

use dbExercicio;

create table tbFuncionarios(
codfunc int not null auto_increment,
nome varchar(50) not null,
cpf varchar(11) not null unique,
email varchar(50),
telefone char(10) unique,
endereco varchar(60),
numero char(10),
cep char(9),
bairro varchar(20),
cidade varchar(20),
estado char(2),
primary key (codfunc)
);

insert into tbFuncionarios(nome, cpf, email, telefone, endereco, numero, cep, bairro, cidade, estado)
values
  ('João Silva', '48267928477', 'joaosilva1@hotmail.com', '95856-2112', 'Rua Dezessete', '250', '04758-961', 'Jardim Limoeiro', 'São Paulo', 'SP'),
  ('Maria Lima', '54869203477', 'limaria@hotmail.com', '97528-3490', 'Rua dos Bosques', '27', '05856-500', 'Jardim Laranjais', 'São Paulo', 'SP'),
  ('José Almeida', '02506703247', 'jsalmei@hotmail.com', '96093-6479', 'Alameda Tupiniquins', '500', '02136-001', 'Moema', 'São Paulo', 'SP');

select * from tbFuncionarios;

update tbFuncionarios set telefone = '95267-5115' where codfunc=1;
update tbFuncionarios set numero = '45' where codfunc=2;
update tbFuncionarios set email = 'jose.almeida2@hotmail.com' where codfunc=3;

select codfunc as 'Código', nome as 'Nome', cpf as 'CPF', email as 'E-mail', telefone as 'Telefone', 
endereco as 'Endereço', numero as 'Número', cep as 'CEP', bairro as 'Bairro', cidade as 'Cidade', estado as 'Estado' from tbFuncionarios;

desc tbFuncionarios;