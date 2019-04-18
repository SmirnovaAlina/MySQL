Select s.first_name, s.last_name, sum(p.amount) as 'total amount', month(payment_date) as in_month
from staff  s left join payment p
on s.staff_id = p.staff_id
group by s.first_name, s.last_name, month(payment_date) 
having in_month = 8;



