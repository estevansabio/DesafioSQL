create database db_instrumental;
use db_instrumental;

create table instrumentos(
	cod int auto_increment primary key,
    nome varchar(100) not null,
    preco decimal(10, 2),
    tipo varchar (100) null
);
create table nacionalidade(
	cod int auto_increment primary key,
    nacionalidade varchar(100),
    continente varchar(100)
);
create table marca(
	cod int auto_increment primary key,
    marca varchar(100) not null,
    cod_instrumento int,
    cod_nacio int,
    foreign key (cod_instrumento) references instrumentos (cod),
     foreign key (cod_nacio) references nacionalidade (cod)
);

drop table nacionalidade;
drop table marca;
insert into instrumentos(nome,preco, tipo) values
( "Violão",600.00, "Cordofone"),
( "Acordeon",14000.99, "Palheta Livre"),
( "Euphonium",7000.00, "Metais"),
( "Violino",3000.00, "Cordas"),
( "Tuba",20000.00, "metais"),
( "Sax",5000.00, "Madeiras"),
( "Bateria",10000.00, null),
( "Guitarra", 2000.00, null),
( "Flauta Transversal",2000.00,"Madeira"),
( "Trombone",5000.00, "Metais");

insert into marca( marca, cod_instrumento,cod_nacio ) values
( "Rozini",1,1),
( "Yamaha",2,2),
( "Dolphin",3,3),
( "Eagle",4,4),
( "HS Musical",5,5),
( "Yanagisawa",6,6),
( "Pearl",7,7),
( "Squier",8,8),
( "Jupiter",9,9),
( "Weril",10,10);

insert into nacionalidade( nacionalidade, continente) values
("Brasileira", "Ameríca do sul"),
( "Japonesa", "Ásia"),
("Brasileira", "Ameríca do sul"),
( "Brasileira",  "Ameríca do sul"),
( "Brasileira",  "Ameríca do sul"),
( "Japonesa", "Ásia"),
( "Japonesa", "Ásia"),
( "Americana", "Ámerica do norte"),
( "taiwanesa", "Ásia Oriental"),
( "Brasileira",  "Ameríca do sul");

-- Exercicio 01

select
    i.nome as instrumento, 
    m.marca as marca
from
    instrumentos as i
inner join marca as m 
on i.cod = m.cod_instrumento
inner join nacionalidade as n
on m.cod_nacio = n.cod;


-- ----------------------------------------------

-- Exercicio 02

select
    i.nome, 
    m.*
from
    instrumentos as i
inner join marca as m 
on i.cod = m.cod_instrumento
inner join nacionalidade as n
on m.cod_nacio = n.cod;

-- ----------------------------------------------

-- Exercicio 03

select 
	i.nome,
	m.marca,
    n.nacionalidade
from nacionalidade n
inner join instrumentos i on n.cod = i.cod
inner join marca m on n.cod = m.cod; 

-- ----------------------------------------------

-- Exercico 04

select 
    m.marca,
    n.nacionalidade,
    i.nome
from marca m
inner join instrumentos i  
on m.cod_instrumento = i.cod
inner join nacionalidade n 
ON m.cod_nacio = n.cod;

-- ----------------------------------------------

-- Exercico 05

 select
	i.nome,
    i.preco,
    m.marca
from marca m
inner join instrumentos i  
on m.cod_instrumento = i.cod
inner join nacionalidade n 
ON m.cod_nacio = n.cod;
	
-- ----------------------------------------------

-- Exercico 06

select 
	i.nome,
	m.marca,
    n.nacionalidade
from nacionalidade n
inner join marca m on m.cod_nacio = n.cod
inner join instrumentos i on i.cod = m.cod_instrumento
where n.nacionalidade = "Brasileira";


-- ----------------------------------------------

-- Exercico 07

 select
	i.nome,
    m.marca
from marca m
left join instrumentos i  
on m.cod_instrumento = i.cod
left join nacionalidade n 
on m.cod_nacio = n.cod;

-- ----------------------------------------------

-- Exercico 08
 select
	i.*,
    m.marca
from marca m
left join instrumentos i  
on m.cod_instrumento = i.cod
left join nacionalidade n 
on m.cod_nacio = n.cod;

-- ----------------------------------------------

-- Exercico 09
 select
	m.marca,
    i.nome
from marca m
left join nacionalidade n  
on m.cod_nacio = n.cod
left join instrumentos i 
on n.cod = i.cod;

-- ----------------------------------------------

-- Exercico 10

select 
	i.nome,
	m.marca,
    n.nacionalidade
from marca m
left join instrumentos i on m.cod_instrumento = i.cod
left join nacionalidade n on m.cod_nacio = n.cod;

-- ----------------------------------------------

-- Exercico 11

select 
	i.nome,
    i.tipo,
	m.marca
from marca m
left join instrumentos i on m.cod_instrumento = i.cod
where i.tipo is null;

-- ----------------------------------------------


	
