Select s.first_name, s.last_name, a.address
from staff  s inner join address  a
on s.address_id = a.address_id

