select name,
  email,
  phone
from students
where github is null
  AND end_date is not null;