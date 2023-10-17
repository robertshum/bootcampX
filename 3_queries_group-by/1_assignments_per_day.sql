-- Get the total number of assignments for each day of bootcamp.
select day,
  count(assignments.*) as total_assignments
from assignments
group by day
order by day;