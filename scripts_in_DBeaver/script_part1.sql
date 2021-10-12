-- Вывести все поля и все строки:
select * from qa_users;
-- Вывести всех студентов в таблице:
select username from qa_users;
-- Вывести только имя и email пользователей:
select username, email from qa_users;
-- Вывести пользователей где password 12333:
select username from qa_users where password = '12333';
-- Вывести пользователей, которые были созданы 2021-03-26 00:00:00:
select username from qa_users where created_on = '2021-03-26 00:00:00';
-- Вывести пользователей где в конце имени есть 8:
select username from qa_users where username like '%8';
-- Вывести пользователей где в имени есть "a":
select username from qa_users where username like '%a%';
---Вывести пользователей, которые были созданы 2021-07-12
-- и у которых в имени есть цифра 7:
select username from qa_users where created_on = '2021-07-12 00:00:00' and username like '%7%';
--Вывести пользователей, у которых id меньше 27 или больше 88:
select username from qa_users where user_id < 27 or user_id > 88;



