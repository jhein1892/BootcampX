SELECT teachers.name as teacher, cohorts.name as cohort
FROM teachers
JOIN assistance_requests on teachers.id = teacher_id
JOIN students on student_id = students.id
JOIN cohorts on students.cohort_id = cohorts.id
where cohorts.name = 'JUL02'
GROUP BY teachers.name, cohorts.name
ORDER BY teacher asc;