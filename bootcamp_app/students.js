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
  console.log("please provide at least 1 input");
  return;
}

const cohortName = args[0];
const limit = args[1] || 5;

// Store all potentially malicious values in an array.
const values = [`%${cohortName}%`, limit];

// start querying
pool.query(`

SELECT students.id, students.name as student_name, cohorts.name as cohort_name
FROM students JOIN cohorts on students.cohort_id = cohorts.id
WHERE cohorts.name LIKE $1
LIMIT $2;

`, values).then(res => {
  res.rows.forEach(user => {
    console.log(`${user.student_name} has an id of ${user.id} and was in the ${user.cohort_name} cohort`);
  });

  //end the connection(s)
  pool.end();

}).catch(err => {
  console.error('query error', err.stack);

  //end the connection(s)
  pool.end();
}
);

