Select c.first_name, c.last_name, sum(p.amount) as 'Total Amount Paid'
from customer c inner join payment p
where c.customer_id = p.customer_id
group by c.first_name, c.last_name
order by c.last_name;



