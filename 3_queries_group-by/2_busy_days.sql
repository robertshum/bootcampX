-- The same query as before, but only return rows 
-- where total assignments is greater than or equal to 10.
select day,
  count(*) as total_assignments
from assignments
group by day
having count(*) >= 10
order by day;