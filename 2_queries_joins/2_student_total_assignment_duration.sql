-- Get the total amount of time that a student has spent 
-- on all assignments.
select sum(duration) as total_duration
from assignment_submissions
  join students on assignment_submissions.student_id = students.id
  where students.name = 'Ibrahim Schimmel';