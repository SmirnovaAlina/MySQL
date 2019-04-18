select s.store_id, c.city, b.country
from store s
join address a 
on s.address_id = a.address_id
join city c
on a.city_id = c.city_id
join country b
on c.country_id = b.country_id
 





