select a.padron, a.apellido, avg(n.nota)
from alumnos a inner join notas n on n.padron = a.padron
group by a.padron
having count(n.nota) >= 3
and avg(n.nota) >= 5;

-- Resultados --
-- 84000	"López"	7.5000000000000000
-- 86000	"Díaz"	7.8000000000000000
-- 83000	"Gómez"	8.5000000000000000
-- 85000	"Fernández"	8.2500000000000000
-- 73000	"Molina"	6.6000000000000000
-- 75000	"Onelli"	5.2000000000000000
-- 88000	"Vargas"	8.2500000000000000
-- 87000	"Hernández"	7.5000000000000000