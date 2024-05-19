
create database sprint2;

use sprint2;

-- Exercício 1 
create table Atleta (
idAtleta int primary key, 
nome varchar(40),
modalidade varchar(40),
qtdMedalha int);


create table País (
idPais int primary key, 
nome varchar(30),
capital varchar(40));

insert into País values 
(1, 'Brasil' , 'Brasilia'),
(2, 'Espanha', 'Barcelona') ,
(3, 'Argentina', 'Buenos Aires');

alter table Atleta add column fkPais int, add constraint fkPaisAtleta foreign key (fkPais) references País (idPais);
describe Atleta;

insert into Atleta values
(1, 'Giovanni' , 'Basquete', 3, 3),
(2, 'Eduardo', 'Futebol' ,10, 1),
(3, 'Debora', 'Volei', 30, 1) ,
(4, 'Moises', 'Skate', 3, 2),
(5, 'Yasmin', 'Tenis', 5, 2);

select*from Atleta join País on idPais = fkPais;

select a.nome as NomeAtleta, p.nome as PaisNome from Atleta as a  join País as p on idPais = fkPais ;

select a.nome, a.modalidade, a.qtdMedalha , p.nome from Atleta as a join País as p on idPais = fkPais where capital = 'Barcelona' ;


-- Exercício 2  
create table Musica (
idMusica int primary key , 
titulo varchar(40),
artista varchar(40),
genero varchar(40), 
fkAlbum int,
constraint fkAlbumMusica foreign key (fkAlbum) references Album (idAlbum));

create table Album (
idAlbum int primary key, 
nome varchar(40),
tipo char (7), 
dtLancamento date );


insert into Musica values 
(1, 'Runaway', 'Kanye West', 'Rap', 1),
(2, 'Too many nights', 'Metro Boomin', 'Rap', 2),
(3, 'Blame Game', 'Kanye West', 'Rap', 1),
(4, 'Exagerado' , 'Cazuza', 'MPB', 3);

insert into Album values 
(1, 'My Beatiful Dark Twisted Fantasy', 'Digital', '2008-03-10'),
(2, 'Heroes&Villans', 'Digital','2022-03-03'), 
(3, 'CazuzaAlbum', 'Fisico', '1980-03-05');


select*from Musica join Album on idAlbum=fkAlbum;


select m.titulo, a.nome from Musica as m join Album as a on idAlbum=fkAlbum;

select m.titulo, m.artista, m.genero, a.nome from Musica as m join Album as a on idAlbum=fkAlbum where tipo = 'Fisico';

