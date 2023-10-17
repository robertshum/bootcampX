-- We need to be able to see how many assistance requests any teacher has completed.
select count(assistance_requests) as total_assistances,
  name
from teachers
  join assistance_requests on teachers.id = assistance_requests.teacher_id
where teachers.name = 'Waylon Boehm'
group by name;