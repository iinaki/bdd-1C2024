select i.codigo as codigo_departamento, n.codigo as codigo_carrera, AVG(n.nota) as promedio_general
from inscripto_en i
inner join alumnos a on i.padron = a.padron
inner join notas n on a.padron = n.padron
group by i.codigo, n.codigo
order by i.codigo, n.codigo;

-- Resultados --
-- 5	61	7.0000000000000000
-- 5	62	7.2500000000000000
-- 6	61	8.8000000000000000
-- 6	62	7.0000000000000000
-- 9	71	6.7142857142857143
-- 9	75	6.6923076923076923
-- 10	71	6.7500000000000000
-- 10	75	6.5000000000000000
