-- Get the total number of assistance_requests for a student.
select count(assistance_requests) as total_assistances,
  name
from students
  join assistance_requests on students.id = assistance_requests.student_id
where students.name = 'Elliot Dickinson'
group by name;