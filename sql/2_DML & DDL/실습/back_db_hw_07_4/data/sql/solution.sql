START TRANSACTION;

#products에서 productcode가 ~~인 제품의 원가를 10%증가 후 조회
UPDATE products
SET buyprice = buyprice * 1.1
WHERE productcode = 'S10_2016';

SELECT * FROM products WHERE productcode = 's10_2016';

#주문상세에서 주문번호가 10100인 주문의 주문수량을 100으로 변경
UPDATE orderdetails
SET quantityOrdered = 100
WHERE ordernumber = 10100;

SELECT * FROm orderdetails WHERE ordernumber = 10100;

#주문라인번호 15번이고 주문번호 10103인 주문 삭제
DELETE FROM orderdetails
WHERE orderLineNumber=15 AND ordernumber = 10103;

ROLLBACK;

SELECT * FROM orderdetails WHERE orderLineNumber=15 AND orderNumber = 10103;

CREATE DATABASE IF NOT EXISTS ssafy_shopping; 

USE ssafy_shopping;

DROP TABLE IF EXISTS product;

DROP TABLE IF EXISTS review;

CREATE TABLE product(
	pCode VARCHAR(30) NOT NULL primary key,
    pName VARCHAR(30) NOT NULL,
    price int(30) NOT NULL,
    quantity int NOT NULL,
    brand VARCHAR(30) NOT NULL,
    pDesc VARCHAR(300) NOT NULL
    );
DESC product;

CREATE TABLE review(
	reviewId int NOT NULL primary key auto_increment,
    pCode VARCHAR(30) NOT NULL,
    review_writer VARCHAR(100) NOT NULL,
    review_content VARCHAR(1000) 
    );
DESC review;

INSERT INTO product
VALUES ('R00001', 'S냉장고', 1000000,20,'삼성', "삼성에서 출시한 스마트 냉장고입니다"),
	   ('R00002', 'L냉장고', 100000,10,'엘리스', "엘리스에서 출시한 보급형 냉장고입니다"),
       ('R00003', 'T냉장고', 3000000,200,'로보', "로보에서 출시한 AI냉장고입니다.");

INSERT INTO review(pcode, review_writer, review_content)
VALUES ('R00001', 'yang', "성능이 아주 좋아요!"),
('R00002', 'kim', "스마트한 냉장고라 너무 편해요!"),
('R00003', 'park', "작고 가격도 저렴해서 좋아요!");

SELECT * FROM review;
INSERT INTO review(pcode, review_writer, review_content)
VALUES ('R00003', 'lee', "비싼만큼 좋다");

DELETE FROM review
WHERE reviewid = 3;

SELECT * FROM review;

ALTER TABLE review ADD COLUMN rate int;

UPDATE review
SET rate = CASE
    WHEN reviewid = 1 THEN 4
    WHEN reviewid = 2 THEN 5
    WHEN reviewid = 3 THEN 5
    ELSE rate  
END;

