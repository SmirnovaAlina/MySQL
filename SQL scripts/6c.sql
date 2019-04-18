Select f.title, count(a.actor_id) as 'total actor'
from film  f inner join film_actor a
on f.film_id = a.film_id
group by f.title;



