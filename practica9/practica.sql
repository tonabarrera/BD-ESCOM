insert into cliente(idCliente, nombre, apPaterno, apMaterno)
  values (161, "Tona","Barrera", "Perez");
insert into tienda(idTienda, nombre, estado, tel) 
    values(777, "MEGA ELEKTRA", "Chiapas", "7777777777"); --ESTE

--consulta para leer el cliente
select * from cliente 
    where nombre like "to%" and apPaterno like "barr%";
select * from tienda 
    where nombre like "mega%" and tel like "777%"; --ESTE

delete from cliente where idcliente=140;
delete from tienda where idTienda=770; --ESTE


select count(*) from cliente;
select count(*) from tienda; --ESTE
select * from cliente 
    where idcliente between 137 and 148;
select * from tienda 
    where idTienda between 90 and 777; --ESTE



begin;
select * from cliente where idcliente between 137 and 148;  --Operacion de lectura
insert into cliente(idCliente, nombre, apPaterno, apMaterno)
  values (161, "Tona","Barrera", "Perez"); --Operacion de escritura
select * from cliente where nombre like "to%" and apPaterno like "barr%";
rollback;
select * from cliente where nombre like "to%" and apPaterno like "barr%";
------------------------ ESTE -----------------------
begin;
select * from tienda 
    where idTienda between 90 and 777;
insert into tienda(idTienda, nombre, estado, tel) 
    values(777, "MEGA ELEKTRA", "Chiapas", "7777777777");
select * from tienda 
    where nombre like "mega%" and tel like "777%";
rollback;
select * from tienda 
    where nombre like "mega%" and tel like "777%";
------------------------------------------------------



begin;
select count(*) from cliente;
select * from cliente where nombre like "to%" and apPaterno like "barr%";
insert into cliente(idCliente, nombre, apPaterno, apMaterno)
  values (161, "Tona","Barrera", "Perez");
select * from cliente where nombre like "to%" and apPaterno like "barr%";
------------------------- ESTE -----------------------
begin;
select count(*) from tienda;
select * from tienda 
    where nombre like "mega%" and tel like "777%";
insert into tienda(idTienda, nombre, estado, tel) 
    values(777, "MEGA ELEKTRA", "Chiapas", "7777777777");
select * from tienda 
    where nombre like "mega%" and tel like "777%";
------------------------------------------------------



begin;
select count(*) from cliente;
insert into cliente(idCliente, nombre, apPaterno, apMaterno)
  values (161, "Tona","Barrera", "Perez");
select * from cliente where nombre like "to%" and apPaterno like "barr%";
commit;
select * from cliente where nombre like "to%" and apPaterno like "barr%";
------------------------- ESTE -----------------------
begin;
select count(*) from tienda;
insert into tienda(idTienda, nombre, estado, tel) 
    values(777, "MEGA ELEKTRA", "Chiapas", "7777777777");
select * from tienda 
    where nombre like "mega%" and tel like "777%";
commit;
select * from tienda 
    where nombre like "mega%" and tel like "777%";
------------------------------------------------------




begin;
select count(*) from cliente;
insert into cliente(idCliente, nombre, apPaterno, apMaterno)
  values (162, "Erika","Hernandez", "Rubio");
select * from cliente where nombre like "Erik%" and apPaterno like "hernan%";
commit;
--Cerramos la terminal y comprobamos
-----------------------------ESTE---------------------
begin;
select count(*) from tienda;
insert into tienda(idTienda, nombre, estado, tel) 
    values(778, "OTRO ELEKTRA", "Campeche", "6666666666");
select * from tienda 
    where nombre like "otro%" and tel like "666%";
commit;
--Cerramos la terminal y comprobamos
------------------------------------------------------




--Terminal negra
begin;
select * from cliente where idcliente between 158 and 165;
select * from tienda where idTienda between 600 and 800; --ESTE


--En la otra sin begin
select * from cliente where idcliente between 158 and 165;
select * from tienda where idTienda between 600 and 800; --ESTE


-- En la negra
insert into cliente(idCliente, nombre, apPaterno, apMaterno)
  values (163, "Jose David","Ortega", "Pacheco");
insert into tienda(idCliente, nombre, estado, tel)
  values (700, "SUPER ELEKTRA","Colima", "9090909090"); -- ESTE

select * from cliente where idcliente between 158 and 165;
select * from tienda where idTienda between 600 and 800; --ESTE


-- En la roja
select * from cliente where idcliente between 158 and 165; -- no debe salir en 163
select * from tienda where idTienda between 600 and 800; --ESTE


-- En la negra
commit;
commit; --ESTE


--En la roja
select * from cliente where idcliente between 158 and 165; -- si sale en 163
select * from tienda where idTienda between 600 and 800; --ESTE
--Todo esto gracias a la propidad de aislamiento


--En la negra
lock tables cliente read; -- Solo pude leer cliente
lock tables tienda read; -- ESTE
-- bloqueo de escritura compartido



--En la verde
select * from cliente where idcliente between 158 and 165;
select * from tienda where idTienda between 600 and 800; --ESTE


--En la negra
unlock table;
unlock table; -- ESTE
lock tables cliente write;
lock tables tienda write; --ESTE
select * from cliente where idcliente between 158 and 165;
select * from tienda where idTienda between 600 and 800; --ESTE
insert into cliente(idCliente, nombre, apPaterno, apMaterno)
  values (164, "Jorge","Maldonado", "Carpio");
insert into tienda(idCliente, nombre, estado, tel)
  values (790, "UlTIMO ELEKTRA","Aguascalientes", "4242424242"); -- ESTE
select * from cliente where idcliente between 158 and 165; --ok
select * from tienda where idTienda between 600 and 800; --ESTE
-- No puedo leer pago, tienda, credito
-- En la verde pude consultar todo menos cliente porque esta bloqueado
--unlock table en el nogro
-- Lo otro lo hacemos con tienda
