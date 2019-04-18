/* 1a. Display the first and last names of all actors from the table actor*/
use sakila;
Select first_name, last_name from actor;

/* 1b. Display the first and last name of each actor in a single column in upper case letters. Name the column Actor Name.*/
Select concat (upper(first_name), ' ', upper(last_name)) as 'Actor Name' from actor;

/* 2a. You need to find the ID number, first name, and last name of an actor, of whom 
you know only the first name, "Joe." What is one query would you use to obtain this information?*/
Select actor_id, first_name,  last_name 
from actor
where first_name = "Joe";

/* 2b. Find all actors whose last name contain the letters GEN:*/

Select actor_id, first_name,  last_name 
from actor
where last_name like "%GEN%";

/* 2c. Find all actors whose last names contain the letters LI. 
This time, order the rows by last name and first name, in that order:*/
Select last_name, first_name  
from actor
where last_name like "%LI%"
order by last_name, first_name;

/* 2d. Using IN, display the country_id and country 
columns of the following countries: Afghanistan, Bangladesh, and China:*/
Select country_id, country 
from country
where country in ('Afghanistan', 'Bangladesh', 'China');

/* 3a. You want to keep a description of each actor. You don't think you will be performing queries on a description, 
so create a column in the table actor named description and use the data type BLOB*/
Alter table actor 
add description BLOB(50);
SELECT * FROM sakila.actor;

/* 3b. Very quickly you realize that entering descriptions for each actor is too much effort. 
Delete the description column.*/
Alter table actor 
drop description;
select * from actor;

/* 4a. List the last names of actors, as well as how many actors have that last name.*/
Select last_name, count(*) as 'Count'
from  actor
group by last_name;

/* 4b. List last names of actors and the number of actors who have that last name, 
but only for names that are shared by at least two actors*/

Select last_name, count(*) as 'Count'
from  actor
group by last_name
having count(*) >= 2;
/* 4c. The actor HARPO WILLIAMS was accidentally entered in the actor table as GROUCHO WILLIAMS.
 Write a query to fix the record.*/

update actor
set first_name = 'HARPO'
where first_name = 'GROUCHO' and last_name = 'WILLIAMS';

/* 4d. Perhaps we were too hasty in changing GROUCHO to HARPO. It turns out that GROUCHO was the correct name after all!
 In a single query, if the first name of the actor is currently HARPO, change it to GROUCHO*/

update actor
set first_name = 'GROUCHO'
where first_name = 'HARPO' and last_name = 'WILLIAMS';


/* 5a. You cannot locate the schema of the address table. 
Which query would you use to re-create it?*/

DESCRIBE sakila.address;

/* 6a. Use JOIN to display the first and last names, as well as the address, of each staff member. 
Use the tables staff and address*/

Select s.first_name, s.last_name, a.address
from staff as s inner join address as a
on s.address_id = a.address_id;


/* 6b. Use JOIN to display the total amount rung up by each staff member in August of 2005. 
Use tables staff and payment*/

Select s.first_name, s.last_name, sum(p.amount) as 'total amount', month(payment_date) as in_month
from staff  s left join payment p
on s.staff_id = p.staff_id
group by s.first_name, s.last_name, month(payment_date) 
having in_month = 8;


/* 6c. List each film and the number of actors who are listed for that film.
 Use tables film_actor and film. Use inner join.*/

Select f.title, count(a.actor_id) as 'total actor'
from film  f inner join film_actor a
on f.film_id = a.film_id
group by f.title;

/* 6d. How many copies of the film Hunchback Impossible exist in the inventory system?  (6) */

Select f.title, count(i.film_id) as 'total copies'
from film f, inventory i
where f.film_id = i.film_id
group by f.title
having f.title = 'Hunchback Impossible'; 

/* 6e. Using the tables payment and customer and the JOIN command, list the total paid by each customer. 
List the customers alphabetically by last name:*/

Select c.first_name, c.last_name, sum(p.amount) as 'Total Amount Paid'
from customer c inner join payment p
where c.customer_id = p.customer_id
group by c.first_name, c.last_name
order by c.last_name;

/*7a. The music of Queen and Kris Kristofferson have seen an unlikely resurgence. As an unintended consequence, 
films starting with the letters K and Q have also soared in popularity.*/
Select title
from film
where (title like 'K%' or title like 'Q%') and language_id in
(select language_id 
from language 
where name = 'English');

/*7b. Use subqueries to display all actors who appear in the film Alone Trip.*/

Select first_name, last_name 
from actor
where actor_id  in 
(select actor_id from film_actor
where film_id in 
(select film_id 
from film 
where title = 'Alone Trip'));

/* 7c. You want to run an email marketing campaign in Canada, for which you will need the names and email addresses of all Canadian customers. 
Use joins to retrieve this information.*/
Select first_name, last_name, email
from customer
where address_id  in 
(select address_id from address
where city_id in 
(select city_id 
from city  
where country_id  in 
(select country_id 
from country
where country = "Canada")));


/* 7d. Sales have been lagging among young families, and you wish to target all family movies for a promotion.  */

Select title
from film
where film_id  in 
(select film_id from film_category
where category_id in 
(select category_id 
from category  
where name = "Family"));

/* 7e. Display the most frequently rented movies in descending order.*/
Select f.title, count(f.film_id) as Count_of_Rental
from film f 
join inventory i 
on f.film_id = i.film_id
join rental r
on i.inventory_id = r.inventory_id
group by title
order by Count_of_Rental desc;

/* 7f. Write a query to display how much business, in dollars, each store brought in.*/

Select s.store_id, sum(p.amount) as Total_amount_by_store
from payment p 
join  store s
on p.staff_id = s.manager_staff_id
group by store_id;

/* 7g. Write a query to display for each store its store ID, city, and country.*/


/* 7h. List the top five genres in gross revenue in descending order.*/


/* 8a. In your new role as an executive, you would like to have an easy way of viewing the Top five genres by gross revenue.*/



/* 8b. How would you display the view that you created in 8a?*/



/* 8c. You find that you no longer need the view top_five_genres. Write a query to delete it.*/







