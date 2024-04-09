select id, parentId, body, title
from posts 
where id between 123456 and 120001; -- ids en posts


select id, parentId, body, title
from posts 
where id between 123456 and 120001
and upper(title) like 'HOW _O%'; 


select id, parentId, body, title
from posts 
where id between 123456 and 120001
order by body desc;


select id, body, title
from posts 
order by id
offset 0 rows fetch first 10 rows only;


select min(id), max(id), count(distinct body) -- == con max(id)
from posts;

select count(*)
from users;

select distinct Name
from badges
where tagsbased = 0;


select t.TagName
from users u, posts p, postTags pt, tags t
where u.DisplayName = 'Jon Skeet'
and u.id = p.ownerUserId
and p.id = pt.postId
and pt.tagId = t.id;

-- ==

select t.TagName
from users u inner join posts p on (u.id =  p.ownerUserId)
inner join postTags pt on (p.id = pt.postId)
inner join tags t on (pt.tagId = t.id)
where u.DisplayName = 'Jon Skeet';


select distinct p.id
from posts p inner join postTags pt on (p.id = pt.postId)
inner join tags t on (pt.tagId = t.id)
where p.parentId is not null
and t.TagName = 'relational'
and not exists (
    select distinct p2.id
    from posts p2 inner join postTags pt on (p2.id = pt2.postId)
    inner join tags t2 on (pt2.tagId = t2.id)
    where p2.parentId is not null
    and t2.TagName = 'entity-relational'
);


select u.id, sum(rta.score)
from tags t inner join postTags pt on (t.id = pt.tagId)
    inner join posts p on (p.id = pt.postId)
    inner join posts rta on (rta.parentId = p.id)
    inner join users u on (u.id = rta.ownerUserId)
where t.TagName = 'c#' and p.parentId is null
group by u.id
order by sum(rta.score) desc
offset 0 rows fetch first 10 rows only;


-- WITH RECURSIVO: ciudades alcanzables desde Paris
with recursive DestinosAlcanzables(nombreCiudad) 
    as (values ('paris')
    union(
        select destinio
        from DestinosAlcanzables inner join Vuelos on (origenes = nombreCiudad)
    ))
select * from DestinosAlcanzables;