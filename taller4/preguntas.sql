-- departamentos: C´odigo y nombre de los departamentos de la facultad.
-- materias: C´odigo (de departamento), n´umero y nombre de las materias en las que puede
-- tener nota cada alumno.
-- alumnos: Varios datos de cada alumno de la facultad, tengan o no notas registradas. Se
-- tiene la fecha de ingreso a la facultad y un indicador de si es o no de intercambio.
-- notas: Registra todas las notas que hayan tenido los alumnos y la fecha de cada una de
-- ellas. Puede haber varias notas de un mismo alumno y materia en caso de que no haya
-- aprobado en la primer instancia.
-- carreras: C´odigo y nombre de las carreras de la facultad.
-- inscripto en: Vincula a cada alumno con la o las carreras en las que est´e inscripto.

-- Para familiarizarse, muestre por pantalla las cinco primeras filas de cada tabla y observe sus estructuras.
select * from departamentos;
select * from materias;
select * from alumnos;
select * from inscripto_en;
select * from notas;

--  Devuelva todos los datos de las notas que no sean de la materia 75.1.
-- ✄
-- ✂

select * from notas where codigo != 75 and numero != 1;

-- ✁
-- 2 Devuelva para cada materia dos columnas: una llamada “codigo” que contenga una concatenaci´on del c´odigo de departamento, un punto y el n´umero de materia, con el formato
-- “XX.YY” (ambos valores con dos d´ıgitos, agregando ceros a la izquierda en caso de ser
-- necesario) y otra con el nombre de la materia.
-- ✄
-- ✂

select concat(lpad(codigo::text, 2, '0'), '.', lpad(numero::text, 2, '0')) as codigo, nombre from materias;

-- ✁
-- 3 Para cada nota registrada, devuelva el padr´on, c´odigo de departamento, n´umero de materia,
-- fecha y nota expresada como un valor entre 1 y 100.
-- ✄
-- ✂

select padron, codigo, numero, fecha, nota*10 from notas;

-- ✁
-- 4
-- ´Idem al anterior pero mostrando los resultados paginados en p´aginas de 5 resultados cada
-- una, devolviendo la segunda p´agina.
-- ✄
-- ✂

select padron, codigo, numero, fecha, nota*10 from notas
offset 1 rows fetch first 5 rows only;


-- ✁
-- 5 Ejecute una consulta SQL que devuelva el padr´on y nombre de los alumnos cuyo apellido
-- es “Molina”.
-- ✄
select padron,nombre,apellido from alumnos where LOWER(apellido) = 'molina';


-- ✁
-- 6 Obtener el padr´on de los alumnos que ingresaron a la facultad en el a˜no  2010

select padron from alumnos where fecha_ingreso >= '2010-01-01' and fecha_ingreso <= '2010-12-31';

-- Parte B: Funciones de agregacion´
-- 7 Obtener la mejor nota registrada en la materia 75.15.
select max(nota) from notas where codigo = 75 and numero = 15;

-- ✁
-- 8 Obtener el promedio de notas de las materias del departamento de c´odigo 75.

select avg(nota) from notas where codigo = 75;
-- ✁
-- 9 Obtener el promedio de nota de aprobaci´on de las materias del departamento de c´odigo 75.

select avg(nota) from notas where codigo = 75 and nota >= 4;
-- ☎
-- 10 ✆Obtener la cantidad de alumnos que tienen al menos una nota

select count(distinct padron) from notas;

-- Parte C: Operadores de conjunto
-- 11 ✆Devolver los padrones de los alumnos que no registran nota en materias.

select padron from alumnos where padron not in (select padron from notas);

-- 12 ✆Con el objetivo de traducir a otro idioma los nombres de materias y departamentos, devolver
-- en una ´unica consulta los nombres de todas las materias y de todos los depart

SELECT nombre FROM materia
UNION
SELECT nombre FROM departamento

-- Parte D: Joins
-- 13 ✆Devolver para cada materia su nombre y el nombre del departamento.
select d.nombre as departamento, m.nombre as materia
from materias m inner join departamentos d on m.codigo = d.codigo;

-- 14 ✆Para cada 10 registrado, devuelva el padron y nombre del alumno y el nombre de la materia
-- correspondientes a dicha nota.

select a.padron, a.nombre, m.nombre
from alumnos a inner join notas n on a.padron = n.padron
inner join materias m on n.codigo = m.codigo and n.numero = m.numero
where n.nota = 10;

-- 15 ✆Listar para cada carrera su nombre y el padr´on de los alumnos que est´en anotados en ella.
-- Incluir tambi´en las carreras sin alumnos inscriptos.

select c.nombre, i.padron
from carreras c left outer join inscripto_en i on c.codigo = i.codigo
order by c.nombre, i.padron;

-- 16 ✆Listar para cada carrera su nombre y el padron de los alumnos con padron mayor a 75000
-- que est´en anotados en ella. Incluir tambi´en las carreras sin alumnos inscriptos con padr´on
-- mayor a 75000.

select c.nombre, i.padron
from carreras c left outer join inscripto_en i on c.codigo = i.codigo and i.padron > 75000
order by c.nombre, i.padron;

-- 17 ✆Listar el padr´on de aquellos alumnos que tengan m´as de una nota en la materia 75.15.

select padron
from notas
where codigo = 75 and numero = 15;

select distinct n1.padron
from notas n1, notas n2
where n1.codigo = 75 and n1.numero = 15
and n1.padron = n2.padron 
and n1.fecha <> n2.fecha;

-- 18 ✆Obtenga el padr´on y nombre de los alumnos que aprobaron la materia 71.14 y no aprobaron la materia 71.15.

select distinct padron 
from notas
where codigo = 71 and numero = 14 and nota >= 4
and padron not in (select padron from notas where codigo = 71 and numero = 15 and nota >= 4);

-- 19 ✆Obtener, sin repeticiones, todos los pares de padrones de alumnos tales que ambos alumnos
-- rindieron la misma materia el mismo d´ıa. Devuelva tambi´en la fecha y el c´odigo y n´umero

select distinct least(n1.padron, n2.padron) as padron1, greatest(n1.padron, n2.padron) as padron2, n1.fecha, n1.codigo, n1.numero
from notas n1, notas n2
where n1.fecha = n2.fecha and n1.padron != n2.padron
order by n1.fecha;

-- Parte E: Agrupamiento
-- 20 ✆Para cada departamento, devuelva su c´odigo, nombre, la cantidad de materias que tiene y la
-- cantidad total de notas registradas en materias del departamento. Ordene por la cantidad
-- de materias descendente.

-- d.codigo, d.nombre, count(materias) as cantidad_materias, count(notas) as cantidad_notas
select d.codigo, d.nombre, count(distinct m.nombre) as cantidad_materias, count(n.nota) as cantidad_notas
from departamentos d inner join materias m on d.codigo = m.codigo
inner join notas n on m.codigo = n.codigo and m.numero = n.numero
group by d.codigo
order by cantidad_materias desc;

-- 21 ✆Para cada carrera devuelva su nombre y la cantidad de alumnos inscriptos. Incluya las
-- carreras sin alumnos.

select c.nombre, count(i.padron)
from carreras c left outer join join inscripto_en i on c.codigo = i.codigo
group by c.codigo;


-- 22 ✆Para cada alumno con al menos tres notas, devuelva su padr´on, nombre, promedio de notas
-- y mejor nota registrada.

select a.padron, a.nombre, a.apellido, avg(n.nota), max(n.nota)
from alumnos a inner join notas n on n.padron = a.padron
group by a.padron
having count(*) >= 3;

-- Parte F: Consultas avanzadas
-- 23 ✆Obtener el c´odigo y n´umero de la o las materias con mayor cantidad de notas registradas.
select codigo, numero, count(nota) as cantidad_notas
from notas
group by codigo, numero
having count(nota) >= all (select count(nota) as cantidad_notas from notas group by codigo, numero);

-- 24 ✆Obtener el padr´on de los alumnos que tienen nota en todas las materias.

select padron
from notas
group by padron
having count(distinct (codigo, numero)) = (select count(distinct (codigo, numero)) from materias); 

-- 25 ✆Obtener el promedio general de notas por alumno (cuantas notas tiene en promedio un
-- alumno), considerando ´unicamente alumnos con al menos una nota

select avg(cantidad_notas) from (
    select padron, count(nota) as cantidad_notas
    from notas
    group by padron) as subconsulta;


