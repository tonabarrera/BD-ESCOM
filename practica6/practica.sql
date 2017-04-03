-- Nombre del socio y la tarjeta asgnada
create view v1 as
  select s.nombre as socio,
  from socio s, tarjeta t
  where t.socio_idsocio-s.idsocio
  order by 2,1;
-- Nombre de asociado y su tel
create view v2 as
  select nombre as asociado, tel
  from asociado
  order by asociado;
-- Nommbre de socio y su email
create view v3 as
  select nombre as socio, email
  from socio
  order by nombre;

select * from v3;
-- Nombre de la sucursal y el estado donde se ubica
create view v4 as
  select nombre as sucursal, estado
  from homedepot
  order by 2, 1;
-- Nombre del socio y su monto de credito
create view v5 as
  select nombre as socio, credito
  from socio order by 2,1;
-- Nombre del asociado y su genero
create view v6 as
  select nombre as asociado,
  sexo as genero
  from asociado
  order by 2, 1;
-- Nombre de la sucursal y su departamento
create view v7 as
  select h.nombre as sucursal, d.nombre as depto
  from homedepot h, depto d, hddepto x
  where h.idhd=x.homedepot_idhd
  and x.depto_iddepto=d.iddepto
  order by 2, 1;
-- Nombre del socio y su direccion
create view v8 as
  select nombre as socio, direccion
  from socio
  order by 1;
-- Nombre de la sucirsañ u si directorio
create view v9 as
  select nombre as sucursal, direccion
  from homedepot
  order by 1;
-- Nombre del socio y su tel
create view v10 as
  select nombre as socio, tel
  from socio order by 1;
-- Nombre de 1 asociado y su sucursal
create view v11 as
  select a.nombre as asociado, s.nombre as sucursal
  from asociado a, homedepot s
  where a.homedepot_idhd=s.idhd
  order by 2, 1;
-- Nombre del socio
create view v12 as
  select s.nombre as socio, h.nombre as sucursal
  from socio s, homdepot h, hdsocio x
  where s.idsocio=x.socio_idsocio
  and x.homedepot_idhd = h.idhd
  order by 2, 1;

-- Segunda ronda
--Mostar el nombre del asociado, genero y sucursal, solo de aquellos que se apellidan garcia
select v6.*, v11.sucursal
from v6, v11
where v6.asociado=v11.asociado
and (v6.asociado like "Garc_a%"
or v6.asociado like "% garc_a%");

--Mostar el nombre de la sucursal, el estado y su direccion
select v4.*, v9.direccion
from v4, v9
where v4.sucursal=v9.sucursal;
-- Mostar el nombre de los socios que se apellidan perez
select v5.*, v10.tel
from v5, v10
where v5.socio like "%p_rez%"
and v5.socio = v10.socio;

-- Mostrar el nombre del socio, direccion y la sucursal donde estan inscritos
select v8.*, v12.sucursal
from v8, v12
where v8.socio = v12.socio
order by 2;

-- Mostrar el nombre de las sucursales, estado y el nombre de sus asociados, para aquellas sucursales ubicadas en el edomex
 select v4.* v11.asociado
 from v4, v11
 where v4.sucursal=v11.sucursal
 and v4.estado like "%mexico%"
 order by 3;
