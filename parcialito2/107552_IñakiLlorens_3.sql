select i.codigo as codigo_carrera, n.codigo as codigo_departamento, avg(notas_por_alumno.cantidad_notas) as promedio_cantidad_notas
from inscripto_en i inner join notas n on i.padron = n.padron
    inner join (
        select padron, count(*) as cantidad_notas
        from notas
        group by padron ) notas_por_alumno on n.padron = notas_por_alumno.padron
group by i.codigo, n.codigo
order by i.codigo, n.codigo;

-- Resultados --
-- 5	61	2.0000000000000000
-- 5	62	2.0000000000000000
-- 6	61	2.0000000000000000
-- 6	62	2.0000000000000000
-- 9	71	4.5714285714285714
-- 9	75	4.1538461538461538
-- 10	71	4.6666666666666667
-- 10	75	4.7000000000000000