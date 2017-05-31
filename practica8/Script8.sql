Script Practica 8

Cargar Script hosp1.sql


1. Mostrar todos los datos de los pacientes

select * from paciente;


2. Mostrar el nombre y la edad de los pacientes.

select nombre, edad from paciente
order by 2;


3. Mostrar los datos del paciente
que tiene la sig. CURP MALD770810

select * from paciente
where curp like "MALD77%";


4. Datos de aquellos pacientes que tienen
26 años, nombre y edad

select nombre, edad from paciente
where edad=26;


5. Pacientes que tienes más de 25 años de edad 

select nombre, edad 
from paciente where edad>25
order by edad;


6. Paciente cuya edad igual o mayor a 27 años

select nombre, edad
from paciente where edad>=27
order by edad;


7. Pacientes que tiene menor o igual a 27 años

select nombre, edad from paciente
where edad<=27 
order by 2;


8. ¿Quiénes son los pacientes que tienen 27 años?

select nombre, edad from paciente
where edad=27
order by 1;


9. ¿Quienes son los pacientes que tienen 26, 27 y 28 años?

select nombre, edad from paciente
where edad between 26 and 28
order by 2;

select nombre, edad from paciente
where edad in(26,27,28)
order by 2;

select nombre, edad from paciente
where (edad=26 or edad=27 or edad=28)
order by 2;


10. Pacientes que tienen 26 o bien que tengan 28 años

select nombre, edad from paciente
where edad in(26,28)
order by 2;


11. Pacientes que tienen 26 años en adelante
y que no tengan 28 años.

select nombre, edad from paciente
where edad>=26 and edad<>28
order by 2;


12. Mostar el historial de aquellos pacientes
que ingresaron el 26 de marzo de 2003

select * from historial
where fechaIngreso="2003-03-26";


13. Historial de los pacientes que ingresaon 
despues del 25 de marzo del 2003

select * from historial
where fechaIngreso>"2003-03-25"
order by fechaIngreso;


14. Histroial de los pacientes que ingresaron 
desde el 25 al 27 de marzo del 2003

select * from historial
where fechaIngreso between "2003-03-25"
and "2003-03-27"
order by fechaIngreso;


15. ¿Cuántos registros existen de pacientes
cuya causa de hospitalización es igual a 2

select count(*) from historial
where idcausahosp=2;


16. Actualizar el tel del medico
Omar Cortes Landeros

	visualizar el tel

select nombre, tel from medico
where nombre like "Cort% Lan% Omar%";

	update medico

update medico
set tel=55555577
where nombre like "Cort% Lan% Omar%";


17. Actualizar el domicilio de los
neurologos y ponerles... "Viven en el hospital"

select nombre, dir
from medico
where idEsp=(select idEsp from Especialidad
where descEsp like "Neur%");

update medico
set dir="Viven en el hospital"
where idEsp=(select idEsp from Especialidad
where descEsp like "Neur%");


18. Dar de alta 2 mediocs... uno urologo y otro ginecologo.

insert into medico
values (989898,"Garcia Cebada Miguel",
"En su casa",(select idEsp from especialidad
where descEsp like "Urolo%"),55555556),
(989899,"Lopez Lopez Kala","En su casa",
(select idEsp from especialidad
where descEsp like "Ginec%"),55555557);

select * from medico
where cedula in(989898,989899);


19. Para aquellos pacientos que fueron dados de 
alta en dic 2009, cambiar su direccion... "DESCONOCIDA....."

select p.nombre, p.dir, h.fechaAlta
from paciente p, historial h
where h.curp=p.curp
and h.fechaAlta between "2009-12-01" 
and "2009-12-31"
order by 3;

update paciente p, historial h
set p.dir="DESCONOCIDA......"
where h.curp=p.curp
and h.fechaAlta between "2009-12-01" 
and "2009-12-31";


20. Eliminar los pacientes que fueron 
atendidos por el medico Samuel Duran Becerril

delete from paciente p, medico m, historial h
where p.curp=h.curp
and h.cedula=m.cedula
and m.nombre like "Dura% Bece% Samu%";

select p.curp, p.nombre, m.nombre from
paciente p, medico m, historial h
where p.curp=h.curp
and h.cedula=m.cedula
and m.nombre like "Dura% Bece% Samu%";

delete from paciente
where curp in("BBJG881021","MCGI910122","VELF890818");

alter table historial drop
foreign key FK_historial_2;

alter table historial add
foreign key(curp) references paciente(curp)
on delete cascade on update cascade;
