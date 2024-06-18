drop database dbConsultorio;

create database dbConsultorio;

use dbConsultorio;

create table tbMedicos(
idMedico int not null auto_increment,
nome varchar(100),
telefone char(10) unique,
primary key(idMedico)
);

create table tbPacientes(
idPaciente int not null auto_increment,
nome varchar(100),
telefone char(10) unique,
convenio varchar(100),
primary key(idPaciente)
);

create table tbReceitaMedica(
idReceitaMedica int not null auto_increment,
descricao varchar(100),
primary key(idReceitaMedica)
);

create table tbConsultas(
idConsulta int not null auto_increment,
dataConsulta datetime,
idMedico int not null,
idPaciente int not null,
idReceitaMedica int not null,
primary key(idConsulta),
foreign key(idMedico) references tbMedicos(idMedico),
foreign key(idPaciente) references tbPacientes(idPaciente),
foreign key(idReceitaMedica) references tbReceitaMedica(idReceitaMedica)
);

desc tbMedicos;
desc tbPacientes;
desc tbReceitaMedica;
desc tbConsultas;

insert into tbMedicos(nome,telefone)values('Divaldo Antunes','97523-4528');
insert into tbMedicos(nome,telefone)values('Marieta Ribeiro','97581-6448');
insert into tbMedicos(nome,telefone)values('Zenilda Fernandez','94215-6478');

insert into tbPacientes(nome,telefone,convenio)values('Regina Alves','98723-4623','Amil');
insert into tbPacientes(nome,telefone,convenio)values('Alef Bueno','98213-6162','Porto Seguro');
insert into tbPacientes(nome,telefone,convenio)values('Luisa Gomes','92236-5454','Unimed');
insert into tbPacientes(nome,telefone,convenio)values('Joel Santana','96345-2121','Bradesco Saude');
insert into tbPacientes(nome,telefone,convenio)values('Joaco Piquerez','96765-2521','Allianz Saúde');

insert into tbReceitaMedica(descricao)values('Atividade física diariamente');
insert into tbReceitaMedica(descricao)values('Rivotril 2 vezes ao dia');
insert into tbReceitaMedica(descricao)values('Loratadina a cada 12h');
insert into tbReceitaMedica(descricao)values('Dipirona a cada 8h');
insert into tbReceitaMedica(descricao)values('Nimesulida a cada 6h');

insert into tbConsultas(dataConsulta,idMedico,idPaciente,idReceitaMedica)values('2024/06/18',2,5,3);
insert into tbConsultas(dataConsulta,idMedico,idPaciente,idReceitaMedica)values('2024/06/15',1,4,1);
insert into tbConsultas(dataConsulta,idMedico,idPaciente,idReceitaMedica)values('2024/06/17',3,3,2);
insert into tbConsultas(dataConsulta,idMedico,idPaciente,idReceitaMedica)values('2024/06/16',1,2,4);
insert into tbConsultas(dataConsulta,idMedico,idPaciente,idReceitaMedica)values('2024/06/17',2,1,5);

select * from tbMedicos;
select * from tbPacientes;
select * from tbReceitaMedica;
select * from tbConsultas;

select med.nome as 'Medico', pac.nome as 'Paciente', rec.descricao as 'Receita' from tbConsultas as con inner join tbMedicos as med 
on con.idMedico = med.idMedico inner join tbPacientes as pac on con.idPaciente = pac.idPaciente inner join tbReceitaMedica as rec 
on con.idReceitaMedica = rec.idReceitaMedica where med.nome like '%n%';

select pac.nome as 'Nome do paciente', med.nome as 'Nome do medico' from tbMedicos as med inner join tbPacientes as pac on med.idMedico = pac.idPaciente;
