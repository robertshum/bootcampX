select students.start_date as student_start_date,
  cohorts.start_date as cohort_start_date
from students
  join cohorts on cohort_id = cohorts.id
where students.start_date != cohorts.start_date
order by cohort_start_date;