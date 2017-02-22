-- El primer paso en esta practica fue crear la base de datos que se iba a utilizar junto a las relaciones que la integrarian, para esto se utilizaron los siguientes comandos
create database cine; --Crea la base de datos

use cine; -- Necesario para poder trabajar con la base recien creada
-- Creamos las relaciones propietarias y miembros mostramos como fueron creadas
create table empleado(
    idEmp int not null primary key,
    nombre varchar(30),
    dir varchar(100),
    tel int,
    genero varchar(10)
);

desc empleado;

create table cinemex(
    idCinemex int not null primary key,
    nombre varchar(50),
    dir varchar(100),
    tel int,
    email varchar(60)
);

desc cinemex;

create table ec(
    idEmp int not null,
    idCinemex int not null,
    primary key(idEmp, idCinemex),
    foreign key(idEmp) references empleado(idEmp) on delete cascade on update cascade,
    foreign key(idCinemex) references cinemex(idCinemex) on delete cascade on update cascade
);

desc ec;

-- Ahora comenzamos con la modificacion de las tablas, primero agregamos 2 columnas que permintan almacenar el salario y el correo electronico en los empleados
alter table empleado add column email varchar(60);
alter table empleado add column salario double;

-- Después procedemos a crear una nueva relacion gerente
create table gerente(
    idGerente int not null primary key,
    nombre varchar(30),
    turno varchar(15),
    noCel int,
    salario double,
    idCinemex int,
    foreign key(idCinemex) references cinemex(idCinemex) on delete cascade on update cascade
);

-- Ahora modificamos las gerente, empleado y asociado y observamos los cambios

-- Cambiar el tipo de dato del nocel del gerente a varchar
alter table gerente modify column noCel varchar(15); --modifica la descripcion del tipo de dato

-- Renombrar la relacion empleado a asociado
alter table empleado rename as asociado; -- SOLO modifica el nombre

-- Aumentar el tamaño del tipo de dato de la dir en asociado
alter table asociado modify column dir varchar(200);
-- Procedemos a modificar la llave primaria de cinemex que ahora sera compuesta por el id y el nombre por lo que tambien se tienen que modificar las tablas que esten relacionadas con esta por lo que seguiremos los siguientes pasos
-- Eliminar PK de cinemex, pero antes eliminar la llave foranea con gerente y ec
-- Definir PK compuesta
alter table cinemex drop primary key; -- No se puede
--Eliminar la llave foranea
desc gerente;
show create table gerente; -- Muestra la descripcionde la relacion de una forma mas completa a comparacion del comando desc para poder obtener el constraint de lo contrario no se podria eliminar la primary key de cinemex ya que es utilizada en esta relación
alter table gerente drop foreign key gerente_ibfk_1;

-- Lo mismo para ec
desc ec;
show create table ec;
alter table ec drop foreign key ec_ibfk_2;
alter table cinemex drop primary key; -- Ahora si podemos eliminar la clave primaria
alter table cinemex add primary key(idCinemex, nombre); -- Creamos nuestra nueva PK compuesta
-- Es necesario agregar el campo que falta para la relacion y poder crear la clave foranea compuesta en las tablas de gerente y ec
alter table gerente add column nomCine varchar(50);
alter table ec add column nomCine varchar(50);
-- Se crea la FK compuesta
alter table gerente add foreign key(idCinemex, nomCine) references cinemex(idCinemex, nombre) on delete cascade on update cascade;

alter table ec add foreign key(idCinemex, nomCine) references cinemex(idCinemex, nombre) on delete cascade on update cascade;

-- Por ultimo se crea la relacion cartelera

create table cartelera(
    idCartelera int not null primary key,
    nombre varchar(50),
    fechaInicio date,
    fechaFin date,
    clasificacion varchar(5)
);
-- Finalmente creamos una llave foranea en cinemex que se asocia con la cartelera
alter table cinemex add column idCartelera int;
alter table cinemex add foreign key(idCartelera) references cartelera(idCartelera) on delete cascade on update cascade;

-- Para terminar se exporto la base de datos a un archivo .sql
