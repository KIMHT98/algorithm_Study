USE country_db;

SELECT @@autocommit;
SET autocommit=0;

START TRANSACTION;

INSERT INTO countrylanguage 
VALUES ('AAA','외계어','F',10);

SELECT * FROM countrylanguage WHERE language = '외계어';

INSERT INTO countrylanguage 
VALUES ('ABW','Dutch','F',10); #ABW-DUTCH가 이미 한 쌍으로 존재해서 넣을 수 없음(기본키라서) -> Dutch2로 바꿈ㅋ / 아니면 기본키를 삭제.
SELECT * FROM countrylanguage WHERE countrycode = 'ABW';

-- INSERT INTO country 
-- VALUES ('TCode', 'TRegion', 'TC'); #code는 3글자까지 됨 / NULL값이 많음

DESC country;

INSERT INTO country (Code, Name, Region, code2) 
VALUES ('TCo','이름', 'TRegion', 'TC'); #NAME은 디폴트 값이 없어서 값을 넣어줘야 함

UPDATE city
SET population = population * 1.1
WHERE id = 2337;

DELETE FROM country
WHERE code = 'USA';

rollback;

SELECT * FROM country WHERE code = 'USA';

CREATE DATABASE test_user;

USE test_user;

DROP TABLE if exists user;

CREATE TABLE user (
	id VARCHAR(50) NOT NULL primary key,
    name VARCHAR(100) NOT NULL default '익명',
    pass VARCHAR(100) NOT NULL);
DESC user;

