select distinct n.padron, a.apellido
from notas n inner join alumnos a on n.padron = a.padron
where n.padron in (select padron from notas where codigo = 71 and numero = 14)
and n.padron in (select padron from notas where codigo = 71 and numero = 15)
and n.padron not in (select padron from notas where codigo = 75 and numero = 01)
and n.padron not in (select padron from notas where codigo = 75 and numero = 15);


-- Resultados --
-- 86000	"Díaz"