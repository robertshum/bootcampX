-- We also need to know the average total amount of time being spent 
-- on an assistance request for each cohort. This is just the average 
-- of the total_duration column from the previous query.
-- Calculate the average total duration of assistance requests for each cohort.
select AVG(total_duration) as average_total_duration
from (
    select sum(
        assistance_requests.completed_at - assistance_requests.started_at
      ) as total_duration
    from cohorts
      join students on cohorts.id = students.cohort_id
      join assistance_requests on students.id = assistance_requests.student_id
    group by cohorts.name
    order by total_duration
  ) as subquery