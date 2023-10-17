-- Get the total number of assignment submissions for each cohort.
select cohorts.name as cohort,
  count(assignment_submissions.*) total_submissions
from cohorts
  join students on cohorts.id = students.cohort_id
  join assignment_submissions on students.id = assignment_submissions.student_id
group by cohort
order by total_submissions DESC;