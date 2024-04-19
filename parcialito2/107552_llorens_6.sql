select padron, count(distinct (codigo, numero)) as cantidad_materias
from notas
group by padron
having count(distinct (codigo, numero)) >= (
    select count(distinct (codigo, numero)) from materias
    where (codigo, numero) in (select codigo, numero from notas where padron = 71000 and nota >= 4)
)
and padron != 71000; 

-- Resultados --
-- <Texto del resultado>



select padron,
from notas
group by padron
having count(distinct (codigo, numero)) >= (
    select count(distinct (codigo, numero)) from materias
    where 
)
and padron != 71000; 

select distinct padron
from notas
where (codigo, numero) in (select codigo, numero from notas where padron = 71000 and nota >= 4)
and padron != 71000;


SELECT DISTINCT n1.padron
FROM notas n1
WHERE n1.nota >= 4
AND EXISTS (
    SELECT 1
    FROM notas n2
    WHERE n2.padron = 71000
    AND n2.nota >= 4
    AND n2.codigo = n1.codigo
    AND n2.numero = n1.numero
);