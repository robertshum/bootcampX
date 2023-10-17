-- We need to be able to see the current average time it takes 
-- to complete an assistance request.  Get the average time of 
-- an assistance request.
select avg(completed_at - started_at) as average_assistance_request_duration
from assistance_requests