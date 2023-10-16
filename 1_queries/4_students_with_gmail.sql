select name,
  email,
  id,
  cohort_id
from students
where email not like '%gmail.com%'
  and phone is null;