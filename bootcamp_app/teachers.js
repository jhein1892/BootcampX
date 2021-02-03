const {
  Pool
} = require('pg');

const pool = new Pool({
  user: 'vagrant',
  password: '123',
  host: 'localhost',
  database: 'bootcampx'
});
pool.connect(console.log('Connected'))
const cohortName = process.argv[2];
const values = [`%${cohortName}%`]
const queryString = `SELECT teachers.name as teacher, cohorts.name as cohort, count(teachers.name) as total_assistances 
FROM teachers
JOIN assistance_requests on teachers.id = teacher_id
JOIN students on student_id = students.id
JOIN cohorts on students.cohort_id = cohorts.id
where cohorts.name LIKE $1
GROUP BY teachers.name, cohorts.name
ORDER BY teacher asc;
`;

pool.query(queryString, values)
.then(res => {
  res.rows.forEach(user => {
    console.log(`${user.cohort}: ${user.teacher}`)
  })
}).catch(err => console.error('query error', err.stack));