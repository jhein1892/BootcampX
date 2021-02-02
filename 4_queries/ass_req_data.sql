SELECT teachers.name as teacher, students.name as student, assignments.name as assignment, (completed_at - started_at) as duration
FROM assistance_requests 
JOIN teachers on teacher_id = teachers.id
JOIN students on student_id = students.id
JOIN assignments on assignment_id = assignments.id
ORDER BY duration;