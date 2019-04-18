Select title
from film
where (title like 'K%' or title like 'Q%') and language_id in
(select language_id 
from language 
where name = 'English');




