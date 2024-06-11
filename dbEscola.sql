drop database dbEscola;

create database dbEscola;

use dbEscola;

create table tbTurmas(
idTurmas int not null,
nome varchar(100),
primary key(idTurmas)
);

create table tbFuncionarios(
idFunc int not null auto_increment,
nome varchar(100) not null,
email varchar(100) not null,
telefone char(9) not null,
cpf char(14) not null unique,
primary key(idFunc)
);

create table tbAlunos(
idAluno int not null auto_increment,
nome varchar(100) not null,
email varchar(100) not null,
cpf char(14) not null unique,
sexo char(1) default 'F' check(sexo in('F','M')),
idade int default 0 check(idade < 0),
primary key(idAluno)
);

create table tbProfessores(
re char(7) not null,
idFunc int not null,
primary key(re),
foreign key(idFunc) references tbFuncionarios(idFunc)
);

create table tbCurso(
idCurso int not null auto_increment,
nome varchar(100) not null,
data date not null,
hora time not null,
re char (7) not null,
primary key(idCurso),
foreign key(re) references tbProfessores(re)
);

create table tbUsuarios(
idUsu int not null auto_increment,
nome varchar(50) not null,
senha varchar(30) not null,
idFunc int not null,
primary key(idUsu),
foreign key(idFunc) references tbFuncionarios(idFunc)
);

create table tbMatricula(
idMatr char(13) not null,
idCurso int not null,
idTurmas int not null,
idUsu int not null,
idAluno int not null,
data date,
hora time,
primary key(idMatr),
foreign key(idCurso) references tbCurso(idCurso),
foreign key(idTurmas) references tbTurmas(idTurmas),
foreign key(idUsu) references tbUsuarios(idUsu),
foreign key(idAluno) references tbAlunos(idAluno)
);

desc tbTurmas;
desc tbFuncionarios;
desc tbAlunos;
desc tbProfessores;
desc tbCurso;
desc tbUsuarios;
desc tbMatricula;
