-- Get all cohorts with 18 or more students.
select cohorts.name as cohort_name,
  count(students.*) as student_count
from cohorts
  join students on cohorts.id = students.cohort_id
group by cohort_name
having count(students.*) >= 18
order by student_count;