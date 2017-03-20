--Atributo de reunion (|x|).-asociar las relaciones
--Propietaria y miembro
--Por ejemplo socio es propietaria y tarjeta es miembro
--Homedepot es propietaria y hdsocio es miembro
--Las relaciones pueden ser propietarias y miembros
-- Relacion.campo es como se declara un alias

--El nombre de la sucursal y los empleados asignados
select h.nombre, a.nombre from homedepot h, asociado a where h.idhd=a.homedepot_idhd order by h.nombre, a.nombre; --Se ejecuta un producto cartesiano (todos con todos)
--Primera ordenacion basada en homedepot y la segunda con asociado

-- mostar nombre y correo electronico de los socios, ademas de mostar sucursal donde estan dados de alta
select s.nombre, s.email, h.nombre from socio s, homedepot h, hdsocio x where s.idsocio=x.socio_idsocio and x.homedepot_idhd=h.idHD order by h.nombre, s.nombre;

--El nombre de los socios, su monto de credito y la tarjeta que tienen asignada
select s.nombre, s.credito, t.nombre from socio s, tarjeta t where t.socio_idsocio=s.idsocio order by 3,1; -- entre select y from es una operacion de proyeccion (Pi), entre from y where es producto cartesiano (x) y entre where y order by es una reunion (|x|)

--mostar el departamento que tienen las sucursales existentes en el estado de chihuahua
select h.nombre, d.nombre, h.estado from homedepot h, depto d, hddepto t where h.idhd=t.homedepot_idhd and t.depto_iddepto=d.iddepto and h.estado like "Chihu%" order by 1,2;

--Mostar el nombre de la sucursal y los empleados que tiene, para aquellas sucursales que tienen los siguientes cp 64830, 53569 y 89360
select a.nombre, h.nombre from asociado a, homedepot h where a.homedepot_idhd=h.idhd and h.direccion like "%64830%" or h.direccion like "%53569%" or h.direccion like "%89360%" order by 2,1;

-- cual  es la sucursal donde se encuentran asignados los socios que se apellidan ganzales
select s.nombre, h.nombre from homedepot h, hdsocio hs, socio s where h.idhd=hs.homedepot_idhd and hs.socio_idsocio=s.idsocio and (s.nombre like "GONZALE%" or s.nombre like "% GONZALE%"); --Con el parentesis primero hace el or

--cuantos socios se apellidan garcia
select count(*) from socio where nombre like "GARCI%" or nombre like "% GARCI%";

--Proyeccion de estado para el examen
--Proyeccion elimina duplicidad y hace ordenacion
select estado from homedepot; --Esto no es una proyeccion
select distinct estado from homedepot order by 1; --Esto es una Proyección
select estado from homedepot group by estado order by 1; --Esto tambien es una proyección

--Cuantas sucursales existen en los estados
select estado, count(*) from homedepot group by estado;

--En cuales sucursales existen el departamento de pisos
select h.nombre from homedepot h, hddepto x, depto d where h.idhd=x.homedepot_idhd and x.depto_iddepto=d.iddepto and d.nombre="PISOS";

--Como se llaman las asociadas y en que sucursales se ubican, anexar el estado de dichas sucursales
select a.nombre, h.nombre, h.estado from asociado a, homedepot h where a.homedepot_idhd=h.idhd and a.sexo like "FEME%" order by 3, 2, 1;
