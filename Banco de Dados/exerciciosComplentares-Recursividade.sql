/* Realizado por Moisés Silva, RA : 01232018; */

create database exercicios;
use exercicios;

create table Aluno (
idAluno int primary key auto_increment,
nome varchar(45),
telefone char(11));

create table Projeto(
idProjeto int primary key auto_increment,
nomeProjeto varchar(45),
descricao varchar(30));

alter table aluno add column fkRepresentante int, add constraint fkAlunoRepresentante foreign key(fkRepresentante) references Aluno(idAluno);

alter table aluno add column fkProjeto int, add constraint fkAlunoProjeto foreign key (fkProjeto) references Projeto(idProjeto);





insert into Projeto values 
(null, 'Bee', 'Colmeia abelhas'),
(null, 'Wine', 'Barris de vinho');

insert into aluno (nome,telefone,fkProjeto) values
('Moises', '112213311', 1),
('Giovanni', '123131' , 1),
('Lucas' , '3131311', 1),
('Yasmin', '1313131', 2),
('Natalia', '99999', 2), 
('Debora', '9998', 2);

update aluno set fkRepresentante = 1 where idAluno in (2,3);
update aluno set fkRepresentante = 4 where idAluno in (5,6);

select*from Aluno join projeto on idProjeto=fkProjeto;

select aluno.nome as nomeAluno, representante.nome as Representante, projeto.nomeProjeto
 from Aluno as aluno join Projeto as projeto on idProjeto = fkProjeto
 join Aluno as representante on aluno.fkRepresentante = representante.idAluno;
 
 
 select aluno.nome as nomeAluno, projeto.nomeProjeto
 from Aluno as aluno join Projeto as projeto on idProjeto = fkProjeto;
 
 
 select aluno.nome as nomeAluno, representante.nome as Representante from Aluno as aluno 
 join Aluno as representante on aluno.fkRepresentante  = representante.idAluno;
 
 select aluno.nome as nomeAluno, projeto.nomeProjeto as nomeProjeto from Aluno join Projeto on idProjeto=fkProjeto where nomeProjeto = 'Bee';
 
 

 


create table Organizador (
idOrganizador int primary key auto_increment,
nome varchar(45),
rua varchar(45),
bairro varchar(45),
email varchar(45));

create table Campanha (
idCampanha int primary key auto_increment,
categoria varchar(45),
instituição varchar(45),
dataFinal date);

alter table Organizador add column fkExperiente int, add constraint fkOrganizadorExperiente foreign key (fkExperiente) 
references Organizador(idOrganizador);

alter table Campanha add column fkOrganizador int, add constraint fkOrganizadorCampanha foreign key(fkOrganizador) 
references Organizador(idOrganizador);

insert into Organizador values 
(null, 'Moises', 'horacio borgiani', 'São Joao' , 'moises@sptech', null),
(null, 'Giovanni', 'rua do coqueiros', 'Juta', 'giovanni@sptech', 1),
(null, 'Lucas', 'haddock lobo', 'Consoloção','lucas@sptech', 1),
(null, 'Debora', 'Jardim tamoio', 'Jardim Iguatemi', 'debora@sptech' , null),
(null, 'Yasmin', 'Cocolandia', 'Avenida Brasil', 'yasmin@sptech', 4),
(null, 'Bianca', 'Rua um', 'Jardim Iguatemi', 'bianca@sptech', 4);

insert into Campanha values 
(null, 'Alimentos', 'Ensino fundamental 2' , '2000-05-05', 4),
(null, 'Roupas', 'brécho da zenaide', '2015-03-03', 1);

select*from Campanha join Organizador on idOrganizador=fkOrganizador;
select*from Organizador;
select organizador.nome, campanha.categoria, campanha.instituição, campanha.dataFinal from Campanha as campanha join Organizador as organizador
 on idOrganizador = fkOrganizador where organizador.nome = 'Moises';
 
 select organizador.nome, experiente.nome from Organizador 

 join Organizador as experiente on organizador.fkExperiente = experiente.idOrganizador;
 
 select organizador.nome as NomeOrganizadorNovato, experiente.nome as NomeOrganizadorExperiente
 from Organizador as organizador join Organizador as experiente on organizador.fkExperiente = experiente.idOrganizador where experiente.nome ='Debora';
 
 select organizador.nome as nomeOrganizadorNovato, experiente.nome as nomeOrganizadorExperiente,  campanha.categoria, campanha.instituição, campanha.dataFinal from Campanha
 join Organizador as organizador on idOrganizador=fkOrganizador
 join Organizador as experiente on organizador.fkExperiente = experiente.idOrganizador;
 
 select organizador.nome, organizador.rua, organizador.bairro, organizador.email, experiente.nome, experiente.rua, experiente.bairro,experiente.email , 
 campanha.categoria, campanha.instituição, campanha.dataFinal from Campanha 
 join Organizador as organizador on idOrganizador=fkOrganizador
 join Organizador as experiente on organizador.fkExperiente = experiente.idOrganizador where organizador.nome ='Moises';
 
 
 
 
 
 
 