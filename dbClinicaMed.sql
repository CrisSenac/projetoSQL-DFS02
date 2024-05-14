drop database dbClinicaMed;

create database dbClinicaMed;

use dbClinicaMed;



create table tbPaciente(
idPaciente int not null auto_increment,
nomePaciente varchar(50) not null,
telPaciente varchar(11),
convenio varchar(45) not null,
primary key(idPaciente)
);

create table tbMedico(
idMedico int not null auto_increment,
nomMedico varchar(45),
telMedico varchar(11),
primary key(idMedico)
);

create table tbReceita(
idReceMed int not null auto_increment,
descricao varchar(500),
primary key(idReceMed)
);

create table tbConsulta(
idConsulta int not null auto_increment,
dtConsulta date,
hrConsulta time,
idMedico int not null,
idPaciente int not null,
idReceMed int,
primary key(idConsulta),
foreign key(idPaciente) references tbPaciente(idPaciente),
foreign key(idMedico) references tbMedico(idMedico),
foreign key(idReceMed) references tbReceita(idReceMed)
);

desc tbPaciente;
desc tbMedico;
desc tbReceita;
desc tbConsulta;





