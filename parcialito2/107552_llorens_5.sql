select n.padron, n.codigo, n.numero, n.nota
from alumnos a inner join notas n on a.padron = n.padron
where a.fecha_ingreso <= all (select fecha_ingreso from alumnos);

-- Resultados --
-- 71000	75	1	4
-- 71000	75	6	2
-- 71000	75	6	6
-- 71000	71	14	7