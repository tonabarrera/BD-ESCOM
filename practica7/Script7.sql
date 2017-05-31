Cargar script Home.sql

1. Dar de alta a un socio y asignarlo a una sucursal determinada.

insert into socio (idSocio,nombre,email,credito) 
values ("s1500","Hernandez Contreras Euler",
"eulerelbonito@hotmail.com",12000);

select * from socio where
idSocio="s1500";

insert into hdsocio
values ((select idsocio from socio
where nombre like "Hern% Contr% Eu%"),
(select idHd from homedepot 
where nombre like "Cuautit%"));

select s.idsocio, s.nombre, h.idhd, h.nombre
from socio s, homedepot h, hdsocio x
where s.idsocio=x.socio_idsocio
and x.homedepot_idhd=h.idhd
and s.nombre like "Hern% Contr% Eu%"; 


2. Cambiar el no. de tel de aquellas sucursales que tienes los siguientes C.P. 77500, 21370. 

update homedepot
set tel="55-66-66-66" 
where direccion like "%77500%" 
or direccion like "%21370%";

select nombre, tel from homedepot
where direccion like "%77500%"
or direccion like "%21370%";

select nombre,tel from homedepot;

3. Asignar a los asociados que se apellidan GARCIA a otra sucursal.

select a.nombre, a.homedepot_idhd, h.nombre
from homedepot h, asociado a
where a.homedepot_idhd=h.idhd
and a.nombre like "%Garc_a%";

update asociado
set homedepot_idhd=
(select idhd from homedepot 
where nombre like "%Torres%")
where nombre like "%Garc_a%";


4. Agregar el departamento de quejas y asignarlo a las sucursales existentes en el estado de Jalisco.

insert into depto
values ("D014","QUEJAS");

---Consulta que permite conocer las sucursales en el Ed. de Jalisco

select idhd, nombre, estado
from homedepot
where estado like "%Jalisco%";

---Agregar el depot quejas a dichas sucursales

insert into hddepto
values ("HD036","D014"),("HD037","D014"),
("HD038","D014");

select h.idhd, d.iddepto
from homedepot h, depto d, hddepto x
where h.idhd=x.homedepot_idhd
and x.depto_iddepto=d.iddepto
and h.estado like "%Jalisc%"
and d.nombre like "%Quej%";

5. Eliminar los socios que se apellidan Ortega.

select nombre from socio
where nombre like "%Ortega%";

select count(*) from socio;

delete from socio
where nombre like "%Ortega%";

