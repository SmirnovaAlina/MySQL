Select f.title, count(f.film_id) as Count_of_Rental
from film f 
join inventory i 
on f.film_id = i.film_id
join rental r
on i.inventory_id = r.inventory_id
group by title
order by Count_of_Rental desc;




