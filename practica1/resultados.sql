--En esta practica se comenzo creando la base de datos y seleccionandola para poder usarla

create table trabajos_terminales;
use trabajos_terminales;


--Se crearon las relaciones con las que se planeaba trabajar
create table tt(
    nott int not null primary key,
    titulo varchar(100)
);

create table profesor(
    idProf int not null primary key,
    nombre varchar(20),
    ap varchar(30),
    am varchar(30),
    academia varchar(50),
    salario double,
    idDepto int,
    foreign key(idDepto) references depto(idDepto)
    on delete cascade on update cascade
);

create table depto(
    idDepto int not null primary key,
    nombre varchar(50)
);

create table presentacion(
    idPresentacion int not null primary key,
    fecha date,
    califRevisor float,
    califSinodales float,
    tipo varchar(30)
);

create table dirige(
    idProf int not null,
    nott int not null,
    primary key(idProf, nott),
    foreign key(idProf) references profesor(idProf) on delete cascade on update cascade,
    foreign key(nott) references tt(nott) on delete cascade on update cascade
);

--En este punto se empezo a modificar la descripcion de las tablas

alter table profesor rename as catedratico;

alter table presentacion add column dictamen varchar(30);

alter table depto change column nombre depto varchar(50) not null;

alter table catedratico add column tel int;

alter table catedratico change column tel tel varchar(30);

--Ahora se procedio a agregar una llave foranea a la tabla presentacion, para esto primero se creo la columna que seria la futura FK y se especifica con que tabla tiene relacion

alter table presentacion add column nott int;

alter table presentacion add FOREIGN KEY(nott) references tt(nott)
on delete cascade on update cascade;

Ahora todavia mejor:

--Despues se modifico la llave primaria haciendola compuesta para lograr esto se borra la anterior PK y se agrega la nueva
alter table presentacion drop primary key;
alter table presentacion add primary key(idPresentacion, fecha);



--Finalemente se elimino la clave foranea de una tabla, esto es mas complejo que la llave primaria ya que se debe observar la descripcion de la relacion para obtener el constraint que tiene asignado dicha clave

show create table catedratico;

alter table catedratico drop foreign key catedratico_ibfk_1;

--Para finalizar se hizo un respaldo, es importante estar en la ruta que se muestra en la imagen para poder realizar esto
mysql dump -u root -p nombrebase> ruta nombre.sql