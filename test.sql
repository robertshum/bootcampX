select students.name as student_name,
  count(assignment_submissions.*) as total_submissions
from students
  join assignment_submissions on students.id = student_id
GROUP BY student_name
HAVING count(assignment_submissions.*) < 100