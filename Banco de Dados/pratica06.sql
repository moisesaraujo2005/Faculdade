-- Realizado por Moisés Silva, 1ADS-B, 19.04.24

create database pratica06;

use pratica06;

create table projeto (
idProjeto int primary key auto_increment, 
nome varchar(45),
descricao varchar(45));

create table acompanhantes (
idAcompanhante int primary key auto_increment, 
nome varchar(45),
relacao varchar(45));

create table aluno (
idAluno int primary key auto_increment,
nome varchar(45),
telefone char(14));


alter table aluno add column fkProjeto int, add constraint fkAlunoProjeto foreign key (fkProjeto) references
projeto(idProjeto);

alter table aluno add column fkRepresentante int, add constraint fkAlunoRepresentante foreign key (fkRepresentante)
references aluno(idAluno);

alter table acompanhantes add column fkAluno int, add constraint fkAlunoAcompanhante  foreign key (fkAluno)
references acompanhantes(idAcompanhante);

describe projeto;

insert into projeto values
(null, 'WineCare', 'Monitoramento de vinhos'),
(null, 'FluxSync', 'Monitoramento de prateleiras de atacado'),
(null, 'BuzzTherm', 'Monitoramento de colmeias de abelha');

describe aluno;


insert into aluno (idAluno, nome, telefone) values 
(null, 'Moises', '11-9999'),
(null, 'Giovanni', '11-3333'),
(null, 'Debora', '13-4444'),
(null, 'Vivian', '14-5555'),
(null, 'Yasmin', '56-4444'),
(null, 'Lucas', '45-555');


describe acompanhantes;

insert into acompanhantes values 
(null, 'Debora', 'namorada', 1),
(null, 'Ana Paula', 'Mae', 1),
(null, 'Marcos', 'Tio', 3),
(null, 'Marcia', 'Mae', 3);

select*from acompanhantes;
select*from aluno;



update aluno set fkProjeto = 2 where idAluno in (1,5,6);
update aluno set fkProjeto = 1 where idAluno in (2,4);
update aluno set fkProjeto =3 where idAluno = 3;

update aluno set fkRepresentante = 1 where idAluno in (2,3);
update aluno set fkRepresentante = 6 where idAluno in (5,4);

select*from projeto join aluno on idProjeto = fkProjeto;

select*from aluno join acompanhantes on idAluno =fkAluno;

select*from aluno as aluno join aluno as representante on representante.fkRepresentante = aluno.idAluno;

select*from projeto join aluno on idProjeto = fkProjeto where idProjeto = 2;

select*from projeto  join aluno on idProjeto = fkProjeto join acompanhantes on idAluno=fkAluno;


-- Exercício 2 

create database campanha;

use campanha;

create table campanha (
idCampanha int auto_increment, 
fkOrganizador int,
constraint pkComposta primary key (idCampanha, fkOrganizador),
categoria varchar(45),
instituicao varchar(45),
dtFinal date,
 constraint fkCampanhaOrganizador foreign key(fkOrganizador)
references organizador(idOrganizador) );

create table organizador (
idOrganizador int primary key auto_increment, 
nome varchar(45),
rua varchar(30),
bairro varchar(30),
email varchar(30));

alter table organizador add column fkExperiente int, add constraint fkExperienteOrganizador foreign key
(fkExperiente) references organizador(idOrganizador);

insert into campanha  values
(1,2 ,'Alimento', 'Barbosa', '2005-05-05'),
(2,2, 'Roupas', 'Lucia', '2024-07-15'),
(3,1, 'Skate', 'JdIguatemi', '2020-06-05'),
(4,1, 'Remedios', 'FarmaciaJAcu', '2013-05-05'),
(5,3, 'Material Escolar', 'Dirce', '2023-12-31');
insert into campanha values
(6,6, 'iniciativa', 'educando', '2018-06-06');

insert into organizador (idOrganizador, nome, rua, bairro, email) values
(null, 'Moises', 'Horacio Ameida', 'Dom Bosco', 'moises@gmail'),
(null, 'Giovanni' , 'Bolinhas', 'Sta Barbara', 'giovanni@gmail'),
(null, 'Anthony', 'Horacio ameida', 'Dom Bosco', 'anthony@gmail.com'),
(null, 'Lincoln', 'Horacio ameida 2', 'Dom no','lincoln@gmail.com'),
(null, 'Lucas', 'Roosevelt', 'Anhagabau', 'lucas@gmail.com'),
(null, 'Vitor', 'Rua itaquera', 'Itaquera', 'vitor@gmail.com');



update organizador set fkExperiente = 1 where idOrganizador in (4,5);
update organizador set fkExperiente = 3 where idOrganizador = 6;


select*from campanha;

select*from organizador;

select*from organizador join campanha on idOrganizador=fkOrganizador;

select*from organizador as organizador join organizador experiente 
on experiente.fkExperiente = organizador.idOrganizador;

select*from organizador as organizador join organizador as experiente 
on experiente.fkExperiente = organizador.idOrganizador where organizador.nome ='Moises';

select*from organizador as organizador join organizador as experiente 
on experiente.fkExperiente = organizador.idOrganizador
join campanha on organizador.idOrganizador = fkOrganizador;

select*from organizador as organizador
join organizador as novato on organizador.fkExperiente = novato.idOrganizador
join campanha on novato.idOrganizador=fkOrganizador ;

