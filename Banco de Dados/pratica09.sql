create database pratica09;
use pratica09;

create table grupo (
idGrupo int primary key auto_increment, 
nome varchar(45),
descricao varchar(45),
fkSistema int,
foreign key(fkSistema) references grupo(idGrupo),
dataGrupo date,
horario dateTime,
nota int);

create table professor(
idProfessor int primary key auto_increment, 
nome varchar(45),
disciplina varchar(45));

create table grupo_professor (
fkGrupo int,
fkProfessor int,
primary key (fkGrupo, fkProfessor),
foreign key (fkGrupo) references grupo(idGrupo),
foreign key (fkProfessor) references professor(idProfessor));


create table aluno(
idAluno int primary key auto_increment,
nome varchar(45),
email varchar(45),
fkGrupo int,
foreign key (fkGrupo) references grupo(idGrupo));

insert into grupo values 
(null, 'Grupo das abelhas', 'Temperatura de abelhas', 1, '2022-04-05', '2022-04-05 16:00:00', 10),
(null, 'Grupo das prateleiras', 'Presença de produtos nas prateleiras', 2, '2024-06-18', '2024-06-18 13:00:00', 10 );

select*from grupo;

insert into professor values 
(null, 'Fernanda Caramico', 'Pesquisa&Inovação'),
(null, 'Fernando Brandão', 'Pesquisa&Inovação'),
(null, 'Freezaa', 'Pesquisa&Inovação');
select*from professor;

insert into grupo_professor values
(1, 2),
(2, 1);
select*from grupo_professor;

insert into aluno values (
null, 'Moises', 'moises.silva@sptech.school', 1),
(null, 'Lucas', 'lucas@sptech.school', 1),  
(null, 'Victor', 'victor@sptech.school', 1),
(null, 'Juan', 'juan@sptech.school', 1),
(null, 'Yasmin', 'yasmin@sptech.school', 1), 
(null, 'Reynald', 'reynald@sptech.school', 1),
(null, 'Eder', 'eder@gmail.com', 2),
(null, 'Iago', 'iago@gmail.com', 2),
(null, 'Kayk', 'kayk@gmail.com', 2),
(null, 'Matheus', 'matheus@gmail.com',2),
(null, 'Murillo', 'murillo@gmail.com', 2),
(null, 'Rodolfo', 'rodolfo@gmail.com', 2);

select*from aluno;

select*from aluno join grupo on idGrupo=fkGrupo where idGrupo=1;

select avg(nota) from aluno join grupo on idGrupo=fkGrupo;
select min(nota), max(nota)from aluno join grupo on idGrupo=fkGrupo;
select sum(nota) from aluno join grupo on idGrupo=fkGrupo;

select professor.nome, professor.disciplina, professor.idProfessor, grupo.dataGrupo, grupo.horario, grupo.idGrupo
from grupo_professor join professor on idProfessor=fkProfessor 
 join grupo on idGrupo=fkGrupo;
 
select professor.nome, professor.disciplina, professor.idProfessor, grupo.idGrupo, grupo.horario, grupo.dataGrupo
from grupo_professor join professor on idProfessor =fkProfessor
join grupo on idGrupo=fkGrupo where idGrupo =1;

select grupo.nome from grupo_professor join grupo on idGrupo=fkGrupo join professor on idProfessor=fkProfessor
where professor.nome ='Fernando Brandão';

select a.idAluno, a.nome, a.email, professor.nome, professor.disciplina, professor.idProfessor, g.dataGrupo, g.horario
from grupo_professor as gp join grupo as g on g.idGrupo=gp.fkGrupo join professor on idProfessor = fkProfessor 
join aluno as a on g.idGrupo= a.fkGrupo ;

select count(distinct(nota)) from aluno join grupo on idGrupo=fkGrupo;


select p.nome, avg(nota) as MédiaNotas, sum(nota) as somaNotas from grupo_professor 
join professor as p on idProfessor=fkProfessor
join grupo on idGrupo=fkGrupo group by p.nome;

select g.nome, avg(nota) as médiaNotas, sum(nota) from grupo_professor
join professor as p on idProfessor=fkProfessor
join grupo as g on idGrupo=fkGrupo group by g.nome;

select p.nome, min(nota) as menorNota, max(nota) as maiorNota from grupo_professor
join professor as p on idProfessor=fkProfessor
join grupo on idGrupo = fkGrupo group by p.nome;

select g.nome, min(nota) as menorNota, max(nota) as maiorNota from grupo_professor
join professor on idProfessor=fkProfessor
join grupo as g on idGrupo=fkGrupo group by g.nome;
