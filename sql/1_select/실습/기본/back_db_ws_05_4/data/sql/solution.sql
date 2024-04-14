USE sakila;
#rental_duration이 7이상인 id와 title
SELECT film_id, title FROM film WHERE rental_duration >= 7;

#rental_rate >= 4인 film length오름차순
SELECT * FROM film WHERE rental_rate >= 4 ORDER BY length;

#ratin 중복 없이
SELECT DISTINCT rating FROM film;

#데이터 5개
SELECT * FROM rental LIMIT 5;

#rental_date가 2005/5/24/23:00이전인 inventory_id
SELECT inventory_id FROM rental WHERE rental_date < "2005-05-24-23:00";

#성이 z로 시작하는 배우
SELECT * FROM actor WHERE first_name LIKE "Z%";

#성과 이름이 5글자이 배우 3명
SELECT * FROM actor WHERE length(first_name)=5 AND LENGTH(last_name)=5 LIMIT 3;

#id=25인 배우 성을 뒤집어서
SELECT REVERSE(first_name) FROM actor WHERE actor_id = 25;

#문장 만들기
SELECT CONCAT("제가 제일 좋아하는 배우는 ",last_name,first_name,"입니다.") concat FROM actor;
