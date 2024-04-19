select n.padron, a.apellido, count(nota) as cantidad_notas
from notas n inner join alumnos a on n.padron = a.padron
group by n.padron, a.apellido
having count(n.nota) >= all (select count(nota) as cantidad_notas from notas group by padron);

-- Resultados --
-- 72000	"Pérez Alonso"	6