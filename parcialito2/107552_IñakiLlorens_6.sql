select distinct n.padron
from notas n
where (n.codigo, n.numero) in (
    select n2.codigo, n2.numero
    from notas n2
    where n2.padron = 71000
    and n2.nota >= 4
)
and n.padron <> 71000
group by n.padron
having count(distinct (n.codigo, n.numero)) >= (
    select count(distinct (n2.codigo, n2.numero))
    from notas n2
    where n2.padron = 107552
    and n2.nota >= 4
);

-- Resultados --
-- 72000
-- 73000
-- 75000
-- 86000
-- 87000
-- 88000
