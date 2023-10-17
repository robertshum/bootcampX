-- We need to know the average amount of time that students are waiting 
-- for an assistance request. This is the duration between an 
-- assistance request being created, and it being started.  
-- Calculate the average time it takes to start an assistance request.
select avg(started_at - created_at) as average_wait_time
from assistance_requests;