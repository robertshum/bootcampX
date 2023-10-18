const { Pool } = require('pg');

const pool = new Pool({
  user: 'labber',
  password: 'labber',
  host: 'localhost',
  database: 'bootcampx'
});

//input from user
//[0] = "FEB", cohort name
//[1] = 2, number of results
const args = process.argv.slice(2);
if (args.length == 0) {
  return;
}

const cohortName = args[0];
const limit = args[1] || 5;

// Store all potentially malicious values in an array.
const values = [`%${cohortName}%`, limit];

// start querying
pool.query(`

SELECT DISTINCT teachers.name AS teacher,
  cohorts.name AS cohort
FROM teachers
  join assistance_requests on teachers.id = assistance_requests.teacher_id
  join students on assistance_requests.student_id = students.id
  join cohorts on students.cohort_id = cohorts.id
WHERE cohorts.name LIKE $1
ORDER BY teacher
LIMIT $2;

`, values).then(res => {
  res.rows.forEach(user => {
    console.log(`${user.cohort} : ${user.teacher}`);
  });

  //end the connection(s)
  pool.end();

}).catch(err => {

  //end the connection(s)
  pool.end();

  console.error('query error', err.stack);
});
