-- We need to know which assignments are causing the most assistance requests.
-- List each assignment with the total number of assistance requests with it.
select assignments.id as id,
  assignments.name as name,
  assignments.day,
  assignments.chapter,
  count(assistance_requests) as total_requests
from assignments
  join assistance_requests on assignments.id = assistance_requests.assignment_id
group by name,
  assignments.id
order by total_requests desc