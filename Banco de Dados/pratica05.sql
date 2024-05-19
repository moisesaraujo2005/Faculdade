create database pratica05;

use pratica05;

create table pet (


idPet int primary key auto_increment,
tipo char(10),
nome varchar(45),
raça varchar(30),
dtNasc date);

create table cliente(
idCliente int primary key auto_increment, 
nome varchar(45),
telFixo char(11),
telCelular char(11),
cep char(8),
numero varchar(40),
complemento varchar(40));

alter table pet add column fkCliente int, add constraint fkPetCliente foreign key (fkCliente) references cliente(idCliente);

insert into cliente
 values 
(null, 'Moises Silva' ,'11-341231', '11931314', '0931034', '53', 'Apto 55'),
(null, 'Giovanni Victor', '11-31312', '11939213', '093140', '56', 'Apto 80'),
(null,'Yasmin Caetano', '11-31313','19293913', '413' ,'45', 'Apto 90'),
(null, 'Debora Silva', '12-3131', '31312213', '550', '53' , 'Apto 55');

insert into pet values 
(null, 'Cachorro', 'Rex', 'Labrador', '2015-05-05', 2),
(null, 'Gato' , 'James', 'Syphnx', '2022-03-03', 1),
(null, 'Cachorro', 'Bartolomeu', 'YorkShire', '2023-03-03', 1),
(null, 'Papagaio', 'PEPE', 'Trinca-ferro','2001-04-05', 3),
(null, 'Macaco', 'Monkey', 'Babuino','1999-04-04', 4);

select*from cliente join pet on idCliente=fkCliente;

alter table cliente  modify column  nome varchar(100);

select*from pet where tipo = 'Cachorro';

select pet.nome, pet.dtNasc from pet ;

select pet.nome from pet order by nome;

select * from cliente order by cep, numero, complemento desc;

select*from pet where nome like 'J%';

select*from cliente where nome like '%Silva%';

update cliente set telCelular = '11915636598' where idCliente = 1;

select*from cliente;

select*from cliente join pet on idCliente=fkCliente where idCliente =1;

delete from pet where idPet =4;

select*from pet;

drop table pet;
drop table cliente;




create table Pessoa ( 
idPessoa int primary key auto_increment, 
nome varchar(45),
dtNasc date,
profissao varchar(45));

create table Gasto (
idGasto int primary key auto_increment, 
dataGasto date, 
valor decimal(10,2), 
descrição varchar(30));

alter table Gasto add column fkPessoa int, add constraint fkPessoaGasto foreign key (fkPessoa) references Pessoa(idPessoa);

insert into Pessoa values 
(null, 'Moisés', '2005-05-07', 'Desenvolvedor') ,
(null, 'Giovanni' ,'2005-03-03', 'Analista de Dados'), 
(null, 'Debora', '2005-03-15', 'Barista');

insert into Gasto values 
(null, '2024-04-05', 100 , 'Araras de roupa', 3),
(null, '2024-06-07', 2000, 'Notebook Linux', 1),
(null, '2030-03-05', 1000000, 'Bmw M3', 2);

select* from Pessoa;

select*from Gasto;

select profissao from Pessoa;

select*from Pessoa join Gasto on idPessoa=fkPessoa;

select*from Pessoa join Gasto on idPessoa=fkPessoa where descrição ='Araras de roupa';

update Pessoa set profissao ='Desenvolvedor Senior' where idPessoa = 1;

delete from Gasto where idGasto = 3;


create table setor(
idSetor int primary key auto_increment, 
nome varchar(45) ,
numeroAndar int);

create table funcionario (
idFuncionario int primary key auto_increment,
nome varchar(45), 
telefone char(11) ,
salario int,
fkAcompanhate int, 
constraint fkFuncAcompanhate foreign key (fkAcompanhate) references funcionario(idFuncionario),
nomeAcompanhte varchar(40),
relacao varchar(40),
dtNascAcompanhate date

);

alter table setor add column fkFuncionario int, add constraint fkSetorFunc foreign key (fkFuncionario) references funcionario(idFuncionario);


insert into funcionario(idFuncionario, nome, telefone, salario) values 
(null, 'Moises', '11-213131', 5000),
(null, 'Giovanni', '314-3134' ,5000),
(null, 'GIlvan', '314-1231', 6000);

insert into funcionario (fkAcompanhate, nomeAcompanhte, relacao, dtNascAcompanhate) values 
(1, 'Debora' ,'Noiva', '2005-03-15'),
(2, 'Mamae', 'Mae', '1970-03-05'),
(1, 'Ana Paula', 'Mae', '1976-01-08');

insert into setor values
(null, 'Consultoria', 6,1),
(null, 'SteelLog', 1, 3),
(null, 'Consultoria', 6, 2);

select*from Funcionario; 

select*from funcionario join setor on idFuncionario = fkFuncionario;

select*from funcionario join setor on idFuncionario = fkFuncionario where idSetor = 2;

select*From funcionario as funcionarioEmpresa join funcionario as acompanhate 
on acompanhate.fkAcompanhate = funcionarioEmpresa.idFuncionario;

select*from funcionario as funcionarioEmpresa join funcionario as acompanhate on 
acompanhate.fkAcompanhate = funcionarioEmpresa.idFuncionario where funcionarioEmpresa.nome = 'Moises';

select*from Funcionario as funcionarioEmpresa join funcionario as acompanhate on
acompanhate.fkAcompanhate = funcionarioEmpresa.idFuncionario
join setor as setor on setor.fkFuncionario = funcionarioEmpresa.idFuncionario;



create table nadador 
(idNadador int primary key auto_increment,
nome varchar(45),
uf char(2),
dtNasc date)
auto_increment = 100;

create table treinador (
idTreinador int primary key auto_increment, 
nome varchar(45),
telefone char(11),
email varchar(45)
)
auto_increment=10;

alter table nadador add column fkTreinador int, add constraint fkNadadorTreinador foreign key(fkTreinador)
references treinador(idTreinador);

alter table treinador add column fkOrientador int, add constraint fkOrientadorTreinador foreign key(fkOrientador)
references treinador(idTreinador);



insert into treinador values 
(null, 'Moises', '11-31414', 'moises@gmial.com'),
(null, 'Giovani', '13-313', 'giovanni@gmail.com');

insert into treinador values
(null, 'Matheus', '32-4141', 'matheus@gmail.com', null),
(null, 'Lu', '314-213', 'lu@gmail.com', null),
(null, 'Leo', '2313031', 'leo@gmail.com', null);








insert into nadador values 
(null, 'Debora', 'SP', '2005-05-15', 10),
(null, 'Yasmin', 'SP', '2003-05-05', 10),
(null, 'Leo', 'RS', '1941-04-04',11),
(null, 'Osvaldo', 'RN', '1930-05-19',11);

select*from nadador;
select*from treinador;

select*from treinador join nadador on idTreinador = fkTreinador;

select*from treinador as treinadorChefe join treinador as orientador
 on orientador.fkOrientador = treinadorChefe.idTreinador;
 select*from treinador as treinadorChefe join treinador as orientador
 on orientador.fkOrientador = treinadorChefe.idTreinador where orientador.nome = 'Matheus';
 
 select*from treinador as treinadorChefe join treinador as orientador
 on orientador.fkOrientador = treinadorChefe.idTreinador 
 join nadador as nadador on nadador.fkTreinador = treinadorChefe.idTreinador;
 
  select*from treinador as treinadorChefe join treinador as orientador
 on orientador.fkOrientador = treinadorChefe.idTreinador 
 join nadador as nadador on nadador.fkTreinador = treinadorChefe.idTreinador where treinadorChefe.nome = 'Moises';
 


