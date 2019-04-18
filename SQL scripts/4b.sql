Select last_name, count(*) as 'Count'
from  actor
group by last_name
having count(*) >= 2;
