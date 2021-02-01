SELECT students.name as student, avg(assignment_submissions.duration) as average_assignment_duration, avg(assignments.duration) as average_estimated_duration
FROM assignment_submissions
JOIN students on students.id = assignment_submissions.student_id
JOIN assignments on assignments.id = assignment_submissions.assignment_id
WHERE end_date IS NULL
GROUP BY student
HAVING avg(assignments.duration) > avg(assignment_submissions.duration)
ORDER BY average_assignment_duration asc;

