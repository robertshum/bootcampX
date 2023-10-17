-- We need to be able to see the total amount of time being spent 
-- on an assistance request for each cohort. This number will tell 
-- use how much time is being spent on assistance requests for each cohort.
-- Get the total duration of all assistance requests for each cohort.
select cohorts.name as cohort,
  sum(
    assistance_requests.completed_at - assistance_requests.started_at
  ) as total_duration
from cohorts
  join students on cohorts.id = students.cohort_id
  join assistance_requests on students.id = assistance_requests.student_id
group by cohorts.name
order by total_duration