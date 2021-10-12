--Подключится к 
--Host: 159.69.151.___
--Port: ____
--DB: qa_db_2
--User: user_n
--Pass: ***

-- 1. Вывести всех работников чьи зарплаты есть в базе, вместе с зарплатами.
select employee_name, monthly_salary from employees e 
join employees_salary salary on  e.id = salary.employee_id

-- 2. Вывести всех работников у которых ЗП меньше 2000.
select employee_name, monthly_salary from employees e
join employees_salary salary on  e.id = salary.employee_id
where monthly_salary < 2000

-- 3. Вывести все зарплатные позиции, но работник по ним не назначен.
--    (ЗП есть, но не понятно кто её получает.)
select employee_name, monthly_salary from employees e
right join employees_salary salary on  e.id = salary.employee_id
where employee_name is null

--  4. Вывести все зарплатные позиции  меньше 2000 но работник по ним не назначен.
--    (ЗП есть, но не понятно кто её получает.)
select employee_name, monthly_salary from employees e
right join employees_salary salary on  e.id = salary.employee_id
where employee_name is null and  monthly_salary < 2000

-- 5. Найти всех работников кому не начислена ЗП.
select employee_name, monthly_salary from employees e
left join employees_salary salary on  e.id = salary.employee_id
where monthly_salary is null

-- 6. Вывести всех работников с названиями их должности.
select employee_name, role_name from employees e 
join roles_employees mid on e.id = mid.employee_id
join roles on mid.role_id = roles.id

-- 7. Вывести имена и должность только Java разработчиков.
select employee_name, role_name from employees e 
join roles_employees mid on e.id = mid.employee_id
join roles on mid.role_id = roles.id
where role_name like '%Java %'

-- 8. Вывести имена и должность только Python разработчиков.
select employee_name, role_name from employees e 
join roles_employees mid on e.id = mid.employee_id
join roles on mid.role_id = roles.id
where role_name like '%Python %'

-- 9. Вывести имена и должность всех QA инженеров.
select employee_name, role_name from employees e 
join roles_employees mid on e.id = mid.employee_id
join roles on mid.role_id = roles.id
where role_name like '%QA%'

-- 10. Вывести имена и должность ручных QA инженеров.
select employee_name, role_name from employees e 
join roles_employees mid on e.id = mid.employee_id
join roles on mid.role_id = roles.id
where role_name like '%Manual_QA%'

-- 11. Вывести имена и должность автоматизаторов QA
select employee_name, role_name from employees e 
join roles_employees mid on e.id = mid.employee_id
join roles on mid.role_id = roles.id
where role_name like '%Automation_QA%'

-- 12. Вывести имена и зарплаты Junior специалистов
select employee_name, monthly_salary, role_name from employees e 
join roles_employees mid on e.id = mid.employee_id
join employees_salary salary on e.id = salary.employee_id
join roles on mid.role_id = roles.id
where role_name like '%Junior%'

-- 13. Вывести имена и зарплаты Middle специалистов
select employee_name, monthly_salary, role_name from employees e 
join roles_employees mid on e.id = mid.employee_id
join employees_salary salary on e.id = salary.employee_id
join roles on mid.role_id = roles.id
where role_name like '%Middle%'

-- 14. Вывести имена и зарплаты Senior специалистов
select employee_name, monthly_salary, role_name from employees e 
join roles_employees mid on e.id = mid.employee_id
join employees_salary salary on e.id = salary.employee_id
join roles on mid.role_id = roles.id
where role_name like '%Senior%'

-- 15. Вывести зарплаты Java разработчиков
select employee_name, monthly_salary, role_name from employees e 
join roles_employees mid on e.id = mid.employee_id
join employees_salary salary on e.id = salary.employee_id
join roles on mid.role_id = roles.id
where role_name like '%Java %'

-- 16. Вывести зарплаты Python разработчиков
select employee_name, monthly_salary, role_name from employees e 
join roles_employees mid on e.id = mid.employee_id
join employees_salary salary on e.id = salary.employee_id
join roles on mid.role_id = roles.id
where role_name like '%Python%'

-- 17. Вывести имена и зарплаты Junior Python разработчиков
select employee_name, monthly_salary, role_name from employees e 
join roles_employees mid on e.id = mid.employee_id
join employees_salary salary on e.id = salary.employee_id
join roles on mid.role_id = roles.id
where role_name like '%Junior_Python%'

-- 18. Вывести имена и зарплаты Middle JS разработчиков
select employee_name, monthly_salary, role_name from employees e 
join roles_employees mid on e.id = mid.employee_id
join employees_salary salary on e.id = salary.employee_id
join roles on mid.role_id = roles.id
where role_name like '%Middle_JavaS%'

-- 19. Вывести имена и зарплаты Senior Java разработчиков
select employee_name, monthly_salary, role_name from employees e 
join roles_employees mid on e.id = mid.employee_id
join employees_salary salary on e.id = salary.employee_id
join roles on mid.role_id = roles.id
where role_name like '%Senior_Java %'

-- 20. Вывести зарплаты Junior QA инженеров
select monthly_salary from employees e 
join roles_employees mid on e.id = mid.employee_id
join employees_salary salary on e.id = salary.employee_id
join roles on mid.role_id = roles.id
where role_name like '%Junior%QA%'

-- 21. Вывести среднюю зарплату всех Junior специалистов
select AVG(monthly_salary) "Average salary" from employees e    -- role_name "Role",
join roles_employees mid on e.id = mid.employee_id
join employees_salary salary on e.id = salary.employee_id
join roles on mid.role_id = roles.id where role_name like '%Junior%QA%'
--group by role_name

-- 22. Вывести сумму зарплат JS разработчиков
select role_name "Role", SUM(monthly_salary) "Total salary" from employees e 
join roles_employees mid on e.id = mid.employee_id
join employees_salary salary on e.id = salary.employee_id
join roles on mid.role_id = roles.id where role_name like '%JavaS%'
group by role_name

-- 23. Вывести минимальную ЗП QA инженеров
select role_name "Role", MIN(monthly_salary) "Minimal salary" from employees e 
join roles_employees mid on e.id = mid.employee_id
join employees_salary salary on e.id = salary.employee_id
join roles on mid.role_id = roles.id where role_name like '%QA%'
group by role_name

-- 24. Вывести максимальную ЗП QA инженеров
select role_name "Role", MIN(monthly_salary) "Minimal salary" from employees e 
join roles_employees mid on e.id = mid.employee_id
join employees_salary salary on e.id = salary.employee_id
join roles on mid.role_id = roles.id where role_name like '%QA%'
group by role_name

-- 25. Вывести количество QA инженеров
select count(role_name)"Quantity" from employees e   --role_name "Role",
join roles_employees mid on e.id = mid.employee_id
join roles on mid.role_id = roles.id where role_name like '%QA%'
--group by role_name

-- 26. Вывести количество Middle специалистов.
select count(role_name)"Quantity" from employees e   --role_name "Role",
join roles_employees mid on e.id = mid.employee_id
join roles on mid.role_id = roles.id where role_name like '%Middle%'
--group by role_name

-- 27. Вывести количество разработчиков
select count(role_name)"Quantity" from employees e   --role_name "Role",
join roles_employees mid on e.id = mid.employee_id
join roles on mid.role_id = roles.id where role_name like '%developer%'
--group by role_name

-- 28. Вывести фонд (сумму) зарплаты разработчиков.
select SUM(monthly_salary) "Total dev fund" from employees e    --role_name "Role",
join roles_employees mid on e.id = mid.employee_id
join employees_salary salary on e.id = salary.employee_id
join roles on mid.role_id = roles.id where role_name like '%dev%'
--group by role_name

-- 29. Вывести имена, должности и ЗП всех специалистов по возрастанию
select employee_name "Name", role_name "Role", monthly_salary "Salary" from employees e 
join roles_employees mid on e.id = mid.employee_id
join employees_salary salary on e.id = salary.employee_id
join roles on mid.role_id = roles.id
order by "Salary" asc

-- 30. Вывести имена, должности и ЗП всех специалистов по возрастанию, у которых ЗП от 1700 до 2300
select employee_name "Name", role_name "Role", monthly_salary "Salary" from employees e 
join roles_employees mid on e.id = mid.employee_id
join employees_salary salary on e.id = salary.employee_id
join roles on mid.role_id = roles.id
where monthly_salary between 1700 and 2300
order by "Salary" asc

-- 31. Вывести имена, должности и ЗП всех специалистов по возрастанию, у которых ЗП меньше 2300
select employee_name "Name", role_name "Role", monthly_salary "Salary" from employees e 
join roles_employees mid on e.id = mid.employee_id
join employees_salary salary on e.id = salary.employee_id
join roles on mid.role_id = roles.id
where monthly_salary < 2300
order by "Salary" asc

-- 32. Вывести имена, должности и ЗП всех специалистов по возрастанию, у которых ЗП равна 1100, 1500, 2000
select employee_name "Name", role_name "Role", monthly_salary "Salary" from employees e 
join roles_employees mid on e.id = mid.employee_id
join employees_salary salary on e.id = salary.employee_id
join roles on mid.role_id = roles.id
where monthly_salary in (1100, 1500, 2000)
order by "Salary" asc
