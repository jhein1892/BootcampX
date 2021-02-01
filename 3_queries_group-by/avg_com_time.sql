SELECT students.name as student, avg(assignment_submissions.duration) as average_assignment_duration
FROM assignment_submissions
JOIN students on students.id = assignment_submissions.student_id
WHERE end_date IS NULL
GROUP BY student
ORDER BY average_assignment_duration desc;