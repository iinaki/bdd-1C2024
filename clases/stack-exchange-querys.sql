select id, parentId, body, title
from posts 
where id between 123456 and 120001; -- ids en posts


select id, parentId, body, title
from posts 
where id between 123456 and 120001
and upper(title) like 'HOW _O%'; 






