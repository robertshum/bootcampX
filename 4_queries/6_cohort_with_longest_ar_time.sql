-- Get the cohort with the longest average duration of assistance requests.
-- The same requirements as the previous query, but only return 
-- the single row with the longest average.
select cohorts.name as name,
  avg(
    assistance_requests.completed_at - assistance_requests.started_at
  ) as average_assistance_time
from cohorts
  join students on cohorts.id = students.cohort_id
  join assistance_requests on students.id = assistance_requests.student_id
group by cohorts.name
order by average_assistance_time DESC limit 1;