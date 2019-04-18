Select s.store_id, sum(p.amount) as Total_amount_by_store
from payment p 
join  store s
on p.staff_id = s.manager_staff_id
group by store_id;




