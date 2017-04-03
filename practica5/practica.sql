--mostrar el numero de tt de aquellos que fueron dirigidos por andres ortigoza
select t.* from tt t, profesor p, dirige d where t.nott=d.nott and d.idprof=p.idprof and p.nombre like "Andr_%" and p.apPaterno like "Orti%" order by t.nott;
--like "her_sdfsd%" para un caracter

--Mostar toda la informaion de aquellos tts que tienen en su titulo "redes neuronales"
select * from tt where titulo like "%redes neuronales%" order by nott;

--Mostar dictamen y la calificacion de los sinodales de aquellos tts que ha dirigido la profesora Fabiola Ocampo
select t.nott, p.califSinodales, p.dictamen from tt t, presentacion p, dirige d, profesor x where p.nott=t.nott 
and t.nott=d.nott and d.idprof=x.idprof and x.nombre="Fabiola" and x.apPaterno="Ocampo" order by 3;

--Mostrar el numero de tt de aquellos profesores que se apellidan martinez, incluir el nombre completo del profesor
select t.nott, p.* from tt t, dirige d, profesor p where t.nott=d.nott and d.idprof=p.idprof 
and (p.apPaterno like "Mart_ne%" or p.apMaterno like "Mart_ne%") order by p.apPaterno;

--Mostrar el grado de estudios que tienen los profesores que se apellidan Maldonado
select p.*, ge.descripcion from profesor p, gradoestudios ge, gradoprof x where p.idprof=x.idprof 
and x.idgrado=ge.idgrado and (p.apPaterno like "Maldona%" or p.apMaterno like "maldona%") order by 2;

--Mostar cuales son los tts que han reprobado, mostrar sus respectivos directores
select p.nott, p.dictamen, d.nombre, d.apPaterno, d.apMaterno from presentacion p, tt t, dirige x, profesor d where p.nott=t.nott 
and t.nott=x.nott and x.idprof=d.idprof and p.dictamen like "repro%" order by 4;

--Que tts se han presentado en el año 2009, mostrar directores
select p.nott, d.nombre, d.apPaterno, d.apMaterno from presentacion p, tt t, dirige x, profesor d where p.nott=t.nott 
and t.nott=x.nott and x.idprof=d.idprof and p.fecha between "2009-01-01" and "2009-12-31" order by 3;

--Que sinodales tiene el tt 2010-0046
select p.* from profesor p, sinodalia s where (s.s1=p.idprof or s.s2=p.idprof or s.s3=p.idprof) and s.nott="2010-0046" order by p.apPaterno;

--que tts ha dirigido euler
select count(*) from profesor p, dirige d, tt t where t.nott=d.nott and d.idprof=p.idprof and p.nombre="euler" and p.apPaterno like "Hern_n%";

--Como se llaman
select t.* from profesor p, dirige d, tt t where t.nott=d.nott and d.idprof=p.idprof and p.nombre="euler" and p.apPaterno like "Hern_n%";

--Quienes son los sinodales
select p.nombre, p.apPaterno, p.apMaterno from profesor p, dirige d, tt t, sinodalia s where t.nott=d.nott and d.idprof=(select idprof from profesor where nombre="euler" and apPaterno like "Hern_n%") and t.nott=s.nott and (s.s1=p.idprof or s.s2=p.idprof or s.s3=p.idprof);



