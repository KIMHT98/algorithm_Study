USE ssafy_review;

#식당별 리뷰 조회
SELECT res_name, review_writer, review_content FROM restaurant JOIN review ON restaurant.resId = review.resId;

#country와 city 이너조인
USE sakila;
SELECT country.country_id, country, city
FROM country
INNER JOIN city
ON country.country_id = city.country_id;

#스태프의 거주지 정보 조회
SELECT first_name, last_name, ADDRESS, DISTRICT, CITY_ID
FROM address
INNER JOIN staff
ON address.address_id = staff.address_id;

#2005년 7월 스태프가 얼마 받았는지 조회
SELECT first_name, last_name, SUM(pay.amount)
FROM staff
INNER JOIN payment as pay
on staff.staff_id = pay.staff_id
WHERE DATE(pay.payment_date) BETWEEN '2005-07-01' AND '2005-07-31'
GROUP BY staff.staff_id, staff.first_name, staff.last_name;

#영화별 출연 배우 수
SELECT film.title, COUNT(*) "배우수"
FROM film_actor
LEFT JOIN film ON film_actor.film_id= film.film_id
GROUP BY title
ORDER BY COUNT(*) DESC;

#가장 많은 영화에 출연한 배우순으로 출력
SELECT film_actor.actor_id, CONCAT(actor.first_name,actor.last_name) "이름", COUNT(film_actor.film_id) "출연한 영화 수"
FROM film_actor
LEFT JOIN actor
ON film_actor.actor_id = actor.actor_id
group by film_actor.actor_id
ORDER BY COUNT(film_actor.film_id) DESC;

#영화별로 출연한 배우의 이름 조회, 영화제목 오름차순
SELECT f.title, CONCAT(a.first_name, a.last_name)
FROM film_actor fa
LEFT JOIN film f ON fa.film_id = f.film_id
LEFT JOIN actor a ON fa.actor_id = a.actor_id
ORDER BY f.title;

#각각의 도시의 고객이 몇명인지 조회
SELECT c.country_id,c.city, COUNT(*) "도시별 고객 수"
FROM address a
LEFT JOIN city c
ON a.city_id = c.city_id
GROUP BY c.city_id
ORDER BY c.city;

#도시별 고객수를 구한 것을 이용해서 나라별 고객수 조회, 고객수 내림차순
SELECT co.country, COUNT(*) "나라별 고객 수"
FROM (SELECT c.country_id country_id ,c.city, COUNT(*) "도시별 고객 수"
FROM address a
LEFT JOIN city c
ON a.city_id = c.city_id
GROUP BY c.city_id) city_cnt
LEFT JOIN country co
ON city_cnt.country_id = co.country_id
GROUP BY co.country
ORDER BY COUNT(*) DESC;

# category가 comedy인 데이터의 film_id
SELECT fc.film_id
FROM film_category fc
LEFT JOIN film f
ON fc.film_id = f.film_id
LEFT JOIN category c
ON fc.category_id = c.category_id
WHERE c.name = 'comedy';

#city_id가 16인 나라 이름
SELECT co.country
FROM city c
LEFT JOIN country co
ON c.country_id = co.country_id
WHERE c.city_id = 16;