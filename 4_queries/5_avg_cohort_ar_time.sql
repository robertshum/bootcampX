-- We need to be able to see the average duration of a single 
-- assistance request for each cohort.  Get the average duration of 
-- assistance requests for each cohort.
select cohorts.name as name,
  avg(
    assistance_requests.completed_at - assistance_requests.started_at
  ) as average_assistance_time
from cohorts
  join students on cohorts.id = students.cohort_id
  join assistance_requests on students.id = assistance_requests.student_id
group by cohorts.name
order by average_assistance_time