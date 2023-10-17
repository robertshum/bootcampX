-- Get important data about each assistance request.
select teachers.name,
  students.name,
  assignments.name,
  assistance_requests.completed_at - assistance_requests.started_at as duration
from teachers
  join assistance_requests on teachers.id = assistance_requests.teacher_id
  join students on assistance_requests.student_id = students.id
  join assignments on assistance_requests.assignment_id = assignments.id
  order by duration


-- same results:
-- SELECT teachers.name as teacher, students.name as student, assignments.name as assignment, (completed_at-started_at) as duration
-- FROM assistance_requests
-- JOIN teachers ON teachers.id = teacher_id
-- JOIN students ON students.id = student_id
-- JOIN assignments ON assignments.id = assignment_id
-- ORDER BY duration;