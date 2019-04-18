CREATE TABLE Top_five
AS (select c.name as Top_five, sum(p.amount) as Gross 
from payment p
join rental r
on p.rental_id = r.rental_id
join inventory i
on r.inventory_id = i.inventory_id 
join film_category f
on  i.film_id = f.film_id
join category c
on f.category_id = c.category_id
group by c.name
order by Gross desc limit 5) ;
 





