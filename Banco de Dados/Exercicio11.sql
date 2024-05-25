create database Exercicio11;

use Exercicio11;

create table Departamento (
idDepto int primary key,
nomeDepto Varchar(45),
dataInicioGer date);

alter table departamento add column fkGerente int,
add constraint fkGerenteDeparatamento foreign key (fkGerente)
references Funcionario(idFunc);

create table Funcionario 
(idFunc int primary key,
nomeFunc varchar(30),
salario int,
sexo char(1) , 
dataNasc date);

alter table funcionario add column fkSupervisor int,
add constraint fkSupervisorFuncionario foreign key (fkSupervisor)
references Funcionario(idFunc);
alter table funcionario add column fkDepto int,
add constraint fkDeptoFunc foreign  key (fkDepto)
references departamento(idDepto);

create table projeto 
(idProj int primary key, 
nomeProj varchar(45),
localProj varchar(30));

alter table projeto add column fkDepto int,
add constraint fkProjetoDepto foreign key (fkDepto)
references departamento (idDepto);



insert into Departamento values 
(105, 'Pesquisa', '2008-05-22'),
(104, 'Administração', '2015-01-01'),
(101, 'Matriz', '2001-06-19');

insert into funcionario values 
(1, 'Joao Silva', '3500', 'M', '1985-01-09'),
(2, 'Fernando Wong', '4500', 'M', '1975-12-08'),
(3, 'Alice Sousa', '2500', 'f', '1988-01-19'),
(4, 'Janice morais', '4300', 'f', '1970-06-20'),
(5, 'Ronaldo Lima', '3800', 'M', '1982-09-15'),
(6, 'Joice Leite', '2500', 'f', '1992-07-31'),
(7, 'Antonio Pereira', '2500', 'M', '1989-03-29'),
(8, 'Juliano Brito', '5500', 'M', '1957-11-10');

insert into projeto values
(1, 'Produto X', 'Santo André'),
(2, 'Produto Y', 'Itu'),
(3, 'Produto Z', 'São Paulo'),
(10, 'Informatização', 'Mauá'),
(20, 'Reorganização', 'São Paulo'),
(30, 'Benefícios', 'Mauá');

select*from departamento ;
update departamento set fkGerente = 2 where idDepto = 105;
update departamento set fkGerente = 7 where idDepto = 104;
update departamento set fkGerente = 8 where idDepto = 101;


select*from projeto;


update projeto set fkDepto = 101 where idProj = 20;
update projeto set fkDepto = 105 where idProj in (1,2,3);
update projeto set fkDepto = 104 where idProj in (10,30);


select*from funcionario;

update funcionario set fkDepto = 105 where idFunc in (1,2,5,6);
update funcionario set fkDepto = 104 where idFUnc in (3,4,7);
update funcionario set fkDepto =101 where idFunc = 8;

update funcionario set fkSupervisor =2 where idfunc =1;
update funcionario set fkSupervisor =8 where idfunc =2;
update funcionario set fkSupervisor =7 where idfunc =3;
update funcionario set fkSupervisor =8 where idfunc =4;
update funcionario set fkSupervisor =1 where idfunc =5;
update funcionario set fkSupervisor =1 where idfunc =6;
update funcionario set fkSupervisor =4 where idfunc =7;
update funcionario set fkSupervisor =null where idfunc =8;



create table FuncProj  (
fkFunc int,
fkProj int,
primary key (fkFunc, fkProj),
foreign key (fkFunc) references
funcionario(idFunc),
foreign key (fkProj) references
projeto(idProj),
horas decimal(3,1)
);

insert into FuncProj values
(1, 1, 32.5),
(1, 2, 7.5),
(5, 3, 40.0),
(6, 1, 20.0),
(6, 2, 20.0),
(2, 2, 10.0),
(2, 3, 10.0),
(2, 10, 10.0),
(2, 20, 10.0),
(3, 30, 30.0),
(3, 10, 10.0),
(7, 10, 35.0),
(7, 30, 5.0),
(4, 30, 20.0),
(4, 20, 25.0),
(8, 20, null);

select*from funcProj;

insert into funcionario values 
(null,  'Cecília Ribeiro',  2800,  'f',  '1980-04-05', null,   104);
-- Não inseriu porque a idFunc é Nula


insert into funcionario values 
 (3, 'Alice Sousa',  2800,'f',  '1980-04-05', 4,  104);
 -- Não inseriu porque a idFunc 3 já existe
 
 insert into funcionario values
(9, 'Cecília Ribeiro', 2800, 'f', '1980-04-05', 4, 107);
 -- Deu erro porque  a fkDepto 107 não existe
 
  insert into funcionario values
(9, 'Cecília Ribeiro', 2800, 'f', '1980-04-05', 4, 104);

-- Foi inserido porque a idFunc não é nula e a fkDepto 104 existe

delete from funcionario where idFunc = 4;
-- Não consegui excluir pois tem uma chave estrangeira de outra tabela nessa tupla

delete from funcionario where idFunc =2;
-- Não consegui excluir pois tem uma chave estrangeira de outra tabela nessa tupla

update funcionario set salario = 2800 where idFunc =3;
-- Consegui alterar, pois o salario é um campo sem relações com outros 

update funcionario set fkDepto = 101 where idFunc =3;
-- Pois a fkDepto 101 existe
update funcionario set fkDepto = 107 where idFunc =3;
-- Não consegui, pois a fkDepto 107 não existe

select salario, dataNasc from funcionario where funcionario.nomefunc ='João Silva';

select salario from funcionario;

select * from funcionario order by nomeFunc;

select* from funcionario order by salario desc;

select * from funcionario where salario >=2000 and salario <=4000;

select nomeFunc, salario from funcionario where nomeFunc like 'J%';
select nomeFunc, salario from funcionario where nomeFunc like '%A';

select nomeFunc, salario from funcionario where nomeFunc like '__N%'
;
select nomeFunc, dataNasc from funcionario where nomeFunc like  '_____S' order by nomeFunc desc;
-- Não sei fazer

select * from funcionario where fkDepto =105 and nomeFunc like 'J%';

select  funcionario.nomeFunc, supervisor.nomeFunc from funcionario
join funcionario as supervisor on fkSupervisor = idFunc ;

select projeto.idProj, departamento.nomeDepto, gerente.nomeDepto, gerente.dataInicioGer from projeto
join departamento as departamento on idDepto=fkDepto
join departamento as gerente where localProj = 'São Paulo'; 

select funcionario.idFunc, funcionario.nomeFunc, projeto.nomeProj, horas from funcProj
join funcionario on idFunc = fkFunc 
join projeto on idProj = fkProj;

select funcionario.nomeFunc from funcionario where dataNasc < '1980-01-01';

select count(distinct(salario)) as qtdSalariosDiferentes from funcionario;

select count(distinct(localProj)) from projeto;

select avg(salario) as salarioMedio, sum(salario) as somadossalarios from funcionario;

select min(salario), max(salario) from funcionario;


select departamento.idDepto, avg(salario), sum(salario) from funcionario
join departamento on idDepto=fkDepto group by idDepto;

select departamento.idDepto, min(salario), max(salario) from funcionario
join departamento on idDepto =fkDepto group by idDepto;

insert into funcionario values
(10, 'José da Silva', 1800, 'M', '2000-10-12', 3, null),
(11, 'Benedito Almeida', 1200, 'M', '2001-09-01', 5, null);

insert into departamento values
(10, 'RH', '2018-11-10', 3);
