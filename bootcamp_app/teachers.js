const { Pool } = require('pg');

const pool = new Pool({
  user: 'labber',
  password: 'labber',
  host: 'localhost',
  database: 'bootcampx'
});

//input from user
//[0] = "FEB", cohort name
const args = process.argv.slice(2);
if (args.length == 0) {
  return;
}

// start querying
pool.query(`

SELECT DISTINCT teachers.name AS teacher,
  cohorts.name AS cohort
FROM teachers
  join assistance_requests on teachers.id = assistance_requests.teacher_id
  join students on assistance_requests.student_id = students.id
  join cohorts on students.cohort_id = cohorts.id
WHERE cohorts.name LIKE '%${args[0]}%'
ORDER BY teacher;

`).then(res => {
  res.rows.forEach(user => {
    console.log(`${user.cohort} : ${user.teacher}`);
  });
}).catch(err => console.error('query error', err.stack));

//end the connection(s)
pool.end();;