-- sistema de permisao     usuario,perfil,permisao    permissao usuario

create database permissao;
use permissao;


create table perfil (
perfil_id int not null auto_increment,
primary key (perfil_id),

nomeP varchar (30) not null

);


create table usuario (
usuario_id int not null auto_increment,
primary key (usuario_id),

perefilFOR int not null,
foreign key(perefilFOR) references perfil (perfil_id),

nomeU varchar(30) not null

);


create table permisao (
permisao_id int not null auto_increment,
primary key (permisao_id),

permisao varchar(50) not null

);

create table permisao_perfil (
ID int not null auto_increment,
primary key(ID),

id_perfil int not null,
foreign key (id_perfil) references perfil (perfil_id),
id_usuario int not null,
foreign key (id_usuario) references usuario (Usuario_id),
id_permisao int not null,
foreign key (id_permisao) references permisao (permisao_id)

);

create view Vizu as (
-- seleciona e especifica o que cada coisa vai ser
select 
p.nomeP as nome_perfil,
b.nomeU as nome_usuario,
a.permisao as permisao

-- from da primeira tabela
from perfil p

-- chave primaria com chave extrangeira
join permisao_perfil Q on Q.id_perfil = p.perfil_id
join usuario b on  Q.id_usuario = b.usuario_id 
join permisao a on a.permisao_id = Q.id_permisao

-- ordem dos produtos
order by p.nomeP , b.nomeU , a.permisao
);

select * from Vizu;