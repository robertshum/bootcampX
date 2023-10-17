-- Get currently enrolled students' average assignment completion time.
select students.name as student,
  avg(assignment_submissions.duration) as average_assignment_duration
from students
  join assignment_submissions on students.id = assignment_submissions.student_id
where students.end_date is null
group by student
order by average_assignment_duration desc;