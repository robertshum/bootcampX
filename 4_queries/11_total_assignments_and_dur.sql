-- We need to be able to see the number of assignments that each day has 
-- and the total duration of assignments for each day.  Get each day with the total number of assignments and the total duration of the assignments.
select day,
  count(assignments) as number_of_assignments,
  sum(duration) as duration
from assignments
group by assignments.day
order by assignments.day