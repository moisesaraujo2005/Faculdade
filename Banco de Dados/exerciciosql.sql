/* Nome: Moises Araujo Silva 1ADSB 
	RA: 01232018 */


/* Exercicio 1 */

/*  No MySQL Workbench, utilizando o banco de dados ‘sprint1’:
Escreva e execute os comandos para:
• Criar a tabela chamada Atleta para conter os dados: idAtleta (int e chave primária da
tabela), nome (varchar, tamanho 40), modalidade (varchar, tamanho 40), qtdMedalha
(int, representando a quantidade de medalhas que o atleta possui)
• Inserir dados na tabela, procurando colocar mais de um atleta para cada modalidade
Escreva e execute os comandos para:
• Exibir todos os dados da tabela.
• Exibir apenas os nomes e quantidade de medalhas dos atletas.
• Exibir apenas os dados dos atletas de uma determinada modalidade.
• Exibir os dados da tabela, dos atletas cujo nome contenha a letra s
• Exibir os dados da tabela, dos atletas cujo nome comece com uma determinada letra.
• Exibir os dados da tabela, dos atletas cujo nome termine com a letra o.
• Exibir os dados da tabela, dos atletas cujo nome tenha a penúltima letra r.*/

/*Criação database */
create database sprint1;
use sprint1;

/* Criando Tabela */
create table atleta (
idAtleta int primary key auto_increment,
nome varchar(40), 
modalidade varchar(40), 
qtdMedalha int );

/* Inserindo Dados */
insert into atleta values 
(null, 'Moises', 'Skate', 20),
(null, 'Giovanni', 'Futebol', 1), 
(null, 'Nathan', 'Futebol', 2), 
(null, 'Debora', 'Volei', 3),
(null, 'Enzo', 'Basquete', 30);

/* Selects */
select*from atleta;
select nome, qtdMedalha from atleta;
select * from atleta where modalidade like  'Volei';
select*from atleta where nome like '%S%';
select*from atleta where nome like 'M%';
select*from atleta where nome like '%O';
select*from atleta where nome like '%R_';


/*Exercicio 2 */ 


/*No MySQL Workbench, utilizando o banco de dados ‘sprint1’:
Criar a tabela chamada Musica para conter os dados: idMusica, titulo (tamanho 40), artista
(tamanho 40), genero (tamanho 40), sendo que idMusica é a chave primária da tabela.
Inserir dados na tabela, procurando colocar um gênero de música que tenha mais de uma
música, e um artista, que tenha mais de uma música cadastrada. Procure inserir pelo
menos umas 7 músicas.
Execute os comandos para:
a) Exibir todos os dados da tabela.
b) Exibir apenas os títulos e os artistas das músicas.
c) Exibir apenas os dados das músicas de um determinado gênero.
d) Exibir apenas os dados das músicas de um determinado artista.
e) Exibir os dados da tabela, das músicas cujo título comece com uma determinada letra.
f) Exibir os dados da tabela, das músicas cujo artista termine com uma determinada letra.
g) Exibir os dados da tabela, das músicas cujo gênero tenha como segunda letra uma
determinada letra.
h) Exibir os dados da tabela, das músicas cujo título tenha como penúltima letra uma
determinada letra.*/


/* Criação tabela */ 
create table Musica (
idMusica int primary key auto_increment, 
titulo varchar(40), 
artista varchar(40), 
genero varchar(40));


/* Inserindo dados */ 
insert into Musica values 
(null, 'Exagerado', 'Cazuza', 'Pop/Rock'), 
(null, 'Runaway', 'Kanye West', 'Rap'),
(null, 'Bad Habit', 'Steve Lacy', 'Pop/Rap'),
(null, 'Too many nights', 'Metro Boom', 'Rap');

/* Selects */ 

select*from Musica;
select titulo, artista from Musica;
select*from Musica where genero like 'Rap';
select*from Musica where artista like 'Metro Boom';
select*from Musica where titulo like 'B%';
select*from Musica where artista like '%Y';
select*from Musica where genero like '_O%';
select*from Musica where titulo like '%A_';
