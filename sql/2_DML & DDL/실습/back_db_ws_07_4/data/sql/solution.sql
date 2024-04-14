USE sakila;
SELECT @@autocommit;
set autocommit = false;
START TRANSACTION;

DESC film_actor;

SELECT * FROM film_actor WHERE actor_id = 200 ;
#film_actor테이블의 actor_id얄이 actor테이블의 actor_id열을 참조하는 외래 키 제약 조건이 있다.
#해당 키 제약 조건을 위반하여 삽입을 시도했다.
#지금 actor에는 200까지 밖에 없음 201짜리를 추가하던가 추가할 행의 actor_id를 수정할 필요가 있음
#a foreign key constraint fails (`sakila`.`film_actor`, CONSTRAINT `fk_film_actor_actor` 
#FOREIGN KEY (`actor_id`) REFERENCES `actor` (`actor_id`) 
#ON DELETE RESTRICT ON UPDATE CASCADE)
INSERT INTO film_actor(actor_id, film_id, last_update)
VALUES (201, 1, DATE(NOW()));

#외래키 제약 조건 해제하기
ALTER TABLE film_actor DROP FOREIGN KEY fk_film_actor_actor;
#추가되는 것 확인 가능
INSERT INTO film_actor(actor_id, film_id, last_update)
VALUES (201, 1, DATE(NOW()));

SELECT * FROM film_actor WHERE actor_id = 201;
#얘도 외래키 제약 조건때문에 안됨
#해제해보기
ALTER TABLE film_category DROP FOREIGN KEY fk_film_category_film;
ALTER TABLE inventory DROP FOREIGN KEY fk_inventory_film;

#2
DELETE FROM film
WHERE rating = 'G';

#3
UPDATE film 
SET length = length+10
WHERE title LIKE "ACE%";

#4
ROLLBACK;

#5
CREATE DATABASE IF NOT EXISTS ssafy_review;
USE ssafy_review;
#6
DROP TABLE IF EXISTS video;

#7
DROP TABLE IF EXISTS review;

#8 
CREATE TABLE IF NOT EXISTS restaurant(
	resId int NOT NULL PRIMARY KEY AUTO_INCREMENT,
    res_name VARCHAR(100) NOT NULL,
    res_address VARCHAR(10) NOT NULL,
    res_signatureMenu VARCHAR(10) NOT NULL,
    res_rate int NOT NULL);
 

CREATE TABLE IF NOT EXISTS review(
	reviewId int NOT NULL PRIMARY KEY AUTO_INCREMENT,
    resId int NOT NULL,
    review_writer VARCHAR(100) NOT NULL,
    review_content VARCHAR(1000));
    
#9
INSERT INTO restaurant (resId,res_name, res_address,res_signatureMenu,res_rate)
VALUES (101,'을밀대','서울','물냉면',9),
		(0,'도꼭지','서울','도미솥밥',8),
        (401,'도마29','대구','연어초밥',8);

#10
INSERT INTO review
VALUES (1,101,'김싸피',"맛있습니다."),
		(0,101,'박싸피',"국물이 깔끔합니다."),
        (0,401,'이싸피',"역시 연어초밥은 여기가 최고!");

#11
UPDATE review
SET review_content = "강력 추천합니다."
WHERE reviewId = 1;

SELECT * FROM review;

#12
DELETE FROM review
WHERE reviewId = 2;

SELECT * FROM review;

#13
ALTER TABLE review ADD COLUMN review_rate INT;

#14
UPDATE review
SET review_rate = CASE WHEN reviewId = 1 THEN 5
					   WHEN reviewId = 2 THEN 4
                       END;
SELECT *FROM review;

#15 commit;
	commit;
