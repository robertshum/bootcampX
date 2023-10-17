-- We need to know which teachers actually assisted students 
-- during any cohort.  Get the name of all teachers that 
-- performed an assistance request during a cohort.
select DISTINCT teachers.name as teacher,
  cohorts.name as cohort
from teachers
  join assistance_requests on teachers.id = assistance_requests.teacher_id
  join students on assistance_requests.student_id = students.id
  join cohorts on students.cohort_id = cohorts.id
where cohorts.name = 'JUL02'
order by teacher