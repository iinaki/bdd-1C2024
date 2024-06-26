-- 2. (Problemas con el conjunto complemento) Genere dos consultas que devuelvan el padr´on de
-- los alumnos recibidos de la instituci´on secundaria ILSE (primer consulta) y recibidos de otra
-- instituci´on secundaria (segunda consulta), sin saber a priori que la columna nombre inst sec
-- permite nulos.

select padron, nombre, apellido from alumnos where nombre_inst_sec = 'ILSE';

select padron, nombre, apellido from alumnos where nombre_inst_sec <> 'ILSE';

-- 3. (Operador IS) Corrija las consultas anteriores utilizando el operador IS para conocer si una
-- columna tiene o no valores nulos.
select padron, nombre, apellido from alumnos where nombre_inst_sec = 'ILSE' or nombre_inst_sec is null;

select * from alumnos where nombre_inst_sec <> 'ILSE' or nombre_inst_sec is null;

-- 4. (Funci´on COALESCE) Utilizando la funci´on COALESE, devuelva un listado con el padron
-- y la instituci´on secundaria de todos los alumnos. Para aquellos alumnos sin instituci´on
-- secundaria, devolver el nombre ‘SIN INST’.

select padron, COALESCE(nombre_inst_sec,'SIN_INST') from alumnos;

-- 5. (Problemas matem´aticos con valores nulos) En una consulta, devuelva (en tres columnas
-- distintas) la cantidad total de alumnos, la suma total de cr´editos obtenidos y el promedio
-- de cr´editos por alumno.
-- a) ¿Cu´al es el problema que hay si no se consideran valores nulos?
-- b) ¿C´omo puede solucionarse?

select count(padron), sum(cantidad_creditos), sum(cantidad_creditos)/count(padron) from alumnos;

select count(padron), sum(cantidad_creditos is not null), sum(cantidad_creditos is not null)/count(padron) from alumnos;

-- 6. (Problemas de ordenamiento) Obtenga un listado de los alumnos, ordenados en forma descendente por la institucion de la que egresaron. Utilizar la opci´on NULLS FIRST/LAST
-- para cambiar el orden.
-- 7. (Comportamientos distintos de EXISTS y NOT IN) Utilizando NOT EXISTS, devuelva con
-- una consulta las instituciones secundarias de las cuales no egres´o ning´un alumno. Resuelva
-- lo mismo pero utilizando NOT IN en vez de NOT EXISTS.
-- 8. (Filtros en OUTER JOINS) Haga una consulta que devuelva para cada instituci´on secundaria la cantidad de alumnos que egresaron de ella. Revise que CNBA tenga el valor correcto.
-- Modifique la consulta para que cuente ´unicamente alumnos con padron mayor a 40000.
