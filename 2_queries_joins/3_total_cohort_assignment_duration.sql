-- Get the total amount of time that all students from 
-- a specific cohort have spent on all assignments.
select sum(duration)
from cohorts
  join students on cohorts.id = students.cohort_id
  join assignment_submissions on students.id = assignment_submissions.student_id
where cohorts.name = 'FEB12';