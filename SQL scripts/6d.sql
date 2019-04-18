Select f.title, count(i.film_id) as 'total copies'
from film f, inventory i
where f.film_id = i.film_id
group by f.title
having f.title = 'Hunchback Impossible';



