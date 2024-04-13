USE sakila;
SELECT DATEDIFF("2024-12-25",DATE(NOW()));

SELECT AVG(rental_rate), SUM(length) FROM film;

SELECT COUNT(*) FROM rental WHERE DATE(return_date) = '2005-06-01';

#상영시간 60~120인 데이터 중 설명에 robot이 들어있는 영화 시간 순으로 오름차순
SELECT film_id, title, description, length FROM film WHERE length BETWEEN 60 AND 120 AND description LIKE "%robot%" ORDER BY length LIMIT 11,3;

#총 영화 수, 평균 대여기간, 최장길이,최단길이를 등급별
SELECT rating, COUNT(*), AVG(rental_duration),MAX(length), MIN(length) FROM film GROUP BY rating;

#고객 아이디 별로 렌탈 횟수가 가장 많은 고개 ㄱ10명
SELECT customer_id, COUNT(*) FROM rental GROUP BY customer_id ORDER BY COUNT(*) DESC LIMIT 10;

#렌달 기간별로 영화 가격의 평균, 렌탈 비용의 평균
SELECT AVG(replacement_cost), AVG(rental_rate) FROm film GROUP BY rental_duration;

#렌탈기간이 5일 이상인 필름의 가격의 총합
SELECT SUM(replacement_cost) FROM film WHERE rental_duration >= 5;

#C로 시작하는 영화의 평균 대여 기간, 가격 합, 평균 길이
SELECT rating, AVG(rental_duration), SUM(replacement_cost), AVG(length) FROM film GROUP BY rating;