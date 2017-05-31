create view v1 as
  select tt.noTT as numero, p.nombre as nombre, p.appaterno as paterno, p.apmaterno materno
  from tt, profesor p, dirige d
  where tt.nott=d.nott and d.idprof=p.idprof;

create view v2 as
  select tt.noTT as numero, p.fecha as fecha
  from tt, presentacion p where tt.nott=p.nott;

create view v3 as
  select tt.noTT as numero, tt.titulo as titulo, p.tipo as tipo
  from tt, presentacion p where tt.nott=p.nott;

create view v4 as
  select tt.nott as numero, p.nombre as nombre, p.appaterno as paterno, p.apmaterno materno
  from tt, profesor p, sinodalia s
  where tt.nott=s.nott and (s.s1=p.idprof or s.s2=p.idprof or s.s3=idprof);

  create view v5 as
    select tt.noTT as numero, p.dictamen as dictamen
    from tt, presentacion p where tt.nott=p.nott;

create view v6 as
  select p.nombre as nombre, p.appaterno as paterno, p.apmaterno materno, g.cedula as cedula
  from profesor p, gradoProf g
  where p.idprof=g.idprof;

  create view v7 as
    select p.nombre as nombre, p.appaterno as paterno, p.apmaterno materno, g.institucion as institucion, ge.descripcion as grado
    from profesor p, gradoProf g, gradoestudios ge
    where p.idprof=g.idprof and g.idgrado=ge.idgrado;

  create view v8 as
    select tt.nott as numero, p.nombre as nombre, p.appaterno as paterno, p.apmaterno materno
    from tt, sinodalia s, profesor p
    where tt.nott=s.nott and s.revisor=p.idprof;

create view v9 as
  select tt.nott as numero, p.califsinodales as calificacion
  from tt, presentacion p
  where tt.nott=p.nott;

  create view v10 as
    select tt.nott as numero, p.califrevisor as calificacion
    from tt, presentacion p
    where tt.nott=p.nott;

select  from v1 where nombre like "%benjam_n%" and paterno like "%luna%";

select v3.titulo from v3, v8 where v3.numero=v8.numero and v8.nombre like "%lorena%" and v8.paterno like "%chavar_ia%";

select v3.titulo from v2, v3 where v3.numero=v2.numero and fecha like "%2005%";
