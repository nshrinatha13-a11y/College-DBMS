select * from DEPARTMENTS d ;

select * from faculty f ;

select * from students s ;

select * from courses c ;

select * from enrollments e ;
--number of students enrolled for each course
select 
    c.course_id,
    c.course_name,
    count(e.student_id) as total_enrolled
from courses c
left join enrollments e on c.course_id = e.course_id
group by c.course_id, c.course_name
order by total_enrolled desc;

--- how many students enrolled per semester
select  
    semester,
    count(enrollment_id) as total_enrollments
from enrollments
group by semester
order by semester;

---departmentwise total enrollments
select 
    d.department_name,
    count(e.enrollment_id) AS total_enrollments
from enrollments e
join courses c on e.course_id = c.course_id
join departments d ON c.department_id = d.department_id
group by d.department_name
order by total_enrollments desc;

---number of courses handled by each faculty
select 
    f.faculty_id,
    f.name AS faculty_name,
    count(c.course_id) AS total_courses
from faculty f
left join courses c on f.faculty_id = c.faculty_id
group by f.faculty_id, f.name
order by total_courses desc limit 3;

---number of students with their departmenst
select 
    s.student_id,
    s.name,
    d.department_name
from students s
join departments d on s.department_id = d.department_id
order by s.name;

--faculty with their department and designation
select 
    f.name as faculty_name,
    f.designation,
    d.department_name
from faculty f
join departments d on f.department = d.department_id
order by d.department_name, f.designation;


--list all computer science students
select * from departments where department_name = 'CS'

-- Find courses with capacity > 50
select * from courses where max_capacity > 50;

--Show faculty with Professor designation
select * from faculty where designation = 'professor'

--Student enrollments with course names and grades

SELECT 
    s.student_id,            
    s.name AS student_name,  
    c.course_id,            
    c.course_name,          
    e.semester,              
    e.enrollment_date,      
    e.grade                  
FROM ENROLLMENTS e
JOIN STUDENTS s 
    ON e.student_id = s.student_id     
JOIN COURSES c 
    ON e.course_id = c.course_id       
ORDER BY s.name, e.semester;      

--All students with their enrollment count

SELECT 
    s.student_id,                 
    s.name AS student_name,      
    COUNT(e.enrollment_id) AS total_enrollments  
FROM STUDENTS s
LEFT JOIN ENROLLMENTS e 
    ON s.student_id = e.student_id   
GROUP BY s.student_id, s.name        
ORDER BY total_enrollments DESC; 


--Count of students by department and gender

   

 