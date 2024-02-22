create database sprint1; 
use sprint1;

create table atleta (
idAtleta int primary key auto_increment,
nome varchar(40),
modalidade varchar(40),
qtdMedalha int);

insert into atleta values 
(null, 'Giovanni', 'Lolzeiro', 1),
(null, 'Yasmin', 'Tiro Esportivo', 3),
(null, 'Guilherme', 'Futebol', 4),
(null, 'Moises', 'Skatista', 35), 
(null, 'Iago', 'Valorant', 50);

select*from atleta;

update atleta set qtdMedalha ='3' where idAtleta= 1; 
update atleta set qtdMedalha= '10' where idAtleta in (2,3);
update atleta set nome = 'Igor guilherme' where idAtleta = 4;
alter table atleta add column dtNasc date;

update atleta set dtNasc = '2023-05-05' where idAtleta=1 ;
update atleta set dtNasc= '2000-05-05' where idAtleta=2 ;
update atleta set dtNasc= '1989-01-01' where idAtleta=3;
update atleta set dtNasc = '2008-05-01' where idAtleta = 4;
update atleta set dtNasc= '2000-05-01' where idAtleta =5;



select*from atleta;

delete from atleta where idAtleta= 5;

select*from atleta where modalidade != 'natação';

select*from atleta where qtdMedalha > 3;

alter table atleta modify column modalidade varchar(60);

truncate atleta; 



-- Exercicio 2 
use sprint1;
create table Musica (
idMusica int primary key auto_increment, 
titulo varchar(40),
artista varchar(40),
genero varchar(40)
);

insert into Musica values 
(null, 'Runaway', 'Kanye west', 'Rap'),
(null, 'Lets go 4', 'Igor Guilherme', 'Funk'),
(null, 'Deixa acontecer', 'Grupo Revelação', 'Pagode'), 
(null, 'too many nights', 'Metro boomin', 'Rap'), 
(null, 'Creep', 'RadioHead', 'rock'), 
(null, 'Duality', 'Slipknot', 'metal'),
(null, 'Nights', 'Frank Ocean', 'Rap');

select*from Musica;

alter table Musica add column Curtidas int;

update Musica set Curtidas = '1000' where idMusica = 1;
update Musica set Curtidas = '5000' where idMusica = 2;
update Musica set Curtidas = '6600' where idMusica = 3;
update Musica set Curtidas = '3300' where idMusica = 4;
update Musica set Curtidas = '5500' where idMusica = 5;
update Musica set Curtidas = '1200' where idMusica = 6;
update Musica set Curtidas = '1350' where idMusica = 7;

alter table Musica modify column artista varchar(80);

update Musica set Curtidas = '3500' where idMusica = 1;
update Musica set Curtidas = '50000' where idMusica in(2,3);
update Musica set titulo = 'Careta Furacao' where idMusica= 4;

delete from Musica where idMusica =5;
select*from Musica;

select*from Musica where genero != 'funk';


select*from Musica where Curtidas >= 20;

describe Musica;

truncate Musica;

-- Exercico 3 

use sprint1 ;

create table Filme (
idFilme int primary key auto_increment,
titulo varchar(50),
genero varchar(40),
diretor varchar(40));

insert into Filme values 
(null, 'Toy story', 'Infantil', 'Giovanni Vitor'),
(null, 'Poderoso Chefão', 'Drama', 'Moises Silva'),
(null, '50 Tons de Cinza', 'Romance', 'Yasmin Carvalho'),
(null, 'Bob Marley', 'Ação', 'Bob Marley Jr'), 
(null, 'Deadpool', 'Ação', 'Deadpool jr'), 
(null, 'ScarFace', 'Drama', 'Robert DE niro'),
(null, 'Divertida Mente', 'Infantil', 'Moises Silva');

select*from Filme;

alter table Filme add column protagonista varchar(50);

update Filme set protagonista = 'Woody' where idFilme =1;
update Filme set protagonista = 'Padrinho' where idFilme =2;
update Filme set protagonista = 'Wesley' where idFilme =3;
update Filme set protagonista = 'Marcos' where idFilme =4;
update Filme set protagonista = 'Moises' where idFilme =5;
update Filme set protagonista = 'Alex' where idFilme =6;
update Filme set protagonista ='Marco Aurelio' where idFilme =1;

alter table Filme modify column diretor varchar(150);

update Filme set diretor = 'Giovanni' where idFilme =5;
update Filme set diretor =' Guilherme Fuinha' where idFilme in (2,7);
update Filme set titulo = 'Stefanini' where idFilme=6;
delete from Filme where idFilme =3 ;

select*from Filme where genero != 'Drama';
select*from Filme where genero= 'Suspense';

describe Filme;



-- Exercicio 4 

use sprint1;

Create table Professor (
idProfessor int primary key auto_increment, 
nome varchar(50),
especialidade varchar(40),
dtNasc date);

insert into Professor values 
(null, 'Eduardo', 'CCO', '1900-05-05'),
(null, 'Vivian', 'BD', '1983-08-13'),
(null, 'Moises', 'Algoritmos', '2005-05-07'),
(null, 'Yasmin', 'ArqComp', '3000-05-05'),
(null, 'Giovanni', 'Educação Fisica', '2004-06-13'),
(null, 'Caramico', 'P.I', '1993-03-20');

alter table Professor add column funcao varchar(50) ;
alter table Professor add constraint chkFuncao check(funcao in ( 'Monitor', 'Assistente', 'Titular') );

update Professor set funcao = 'Titular' where idProfessor= 1;
update Professor set funcao = 'Monitor' where idProfessor= 2;
update Professor set funcao = 'Assistente' where idProfessor= 3;
update Professor set funcao = 'Titular' where idProfessor= 4;
update Professor set funcao = 'Titular' where idProfessor= 5;
update Professor set funcao = 'Monitor' where idProfessor= 6;

select*from Professor;

insert into Professor values 
(null, 'Guilherme', 'SO', '2003-05-05', 'Assistente');

delete from Professor where idProfessor= 5;

select*from Professor where funcao ='Titular';

select especialidade, dtNasc from Professor where funcao ='Monitor';

update Professor set dtNasc = '2000-04-03' where idProfessor = 3;

truncate Professor;


-- Exercicio 5 

use sprint1 ;

create table Curso (
idCurso int primary key auto_increment, 
nome varchar(50),
sigla varchar(3),
coordenador varchar(40));


insert into Curso values 
(null, 'Ciencia da Computação', 'CCO', 'Leonardo'),
(null, 'Analise de Sistemas', 'ADS', 'Gerson'),
(null, 'Sistema da Informação', 'SIS', 'Marise');

select coordenador from Curso;
select*from Curso where sigla= 'SIS';
select*from curso order by nome;
select*from curso order by nome desc;

select*from Curso where nome like 'C%';
select*from Curso where nome like '%O';
select*from Curso where nome like '_I%';
select*from Curso where nome like '%A_';
truncate Curso; 

-- Exercicio 6 
use sprint1;

Create table revista (
idRevista int primary key auto_increment,
nome varchar(40),
categoria varchar(30));


insert into revista (idRevista, nome) values
(null, 'PoupaTempo'),
(null, 'Veja'),
(null, 'Epoca'),
(null, 'Quatro Rodas')
;
update revista set categoria = 'Informações' where idRevista =1;
update revista set categoria = 'Produtos' where idRevista =2;
update revista set categoria = 'Modas' where idRevista =3 ;
update revista set categoria = 'Carros' where idRevista =4 ;

insert into revista  values
(null, 'Acustico' , 'Musica'),
(null, 'TecNo', 'Tecnologia'),
(null, 'ComputerScience' , 'Progamação')

;

select*from revista;

describe revista;
alter table revista modify column categoria varchar(40);
describe revista;

alter table revista add column peridiocidade varchar(15);
select*from revista;

alter table revista drop column peridiocidade;