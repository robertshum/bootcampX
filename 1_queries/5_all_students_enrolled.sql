select name,
  id,
  cohort_id
from students
where end_date is NULL
order by cohort_id;