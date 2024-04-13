USE classicmodel;
#고객번호가 121인 고객수
SELECT COUNT(*) FROM orders WHERE customernumber = 121;

#각 회원별 주문 횟수
SELECT customernumber, COUNT(*) 주문횟수 FROM orders GROUP BY customernumber;

#주문횟수가 구분해서 등급정하기
SELECT customernumber, CASE WHEN COUNT(*) >= 20 THEN 'VIP'
							WHEN COUNT(*) >= 10 THEN '우수회원'
                            ELSE '일반회원'
                            END 회원등급
FROM orders GROUP BY customernumber ORDER BY COUNT(*) DESC;

#orderline으로 그루핑, 주문제품 수량 총합, 오름차순
SELECT orderlinenumber, SUM(quantityordered) FROM orderdetails GROUP BY orderlinenumber
ORDER BY orderlinenumber;

#마진이 가장 큰 제품
SELECT productname, msrp - buyprice as '마진' FROM products ORDER BY 마진 DESC LIMIT 1;

#권장소비자가격의 소수 둘째자리 반올림과 구매가격을 소수 둘째자리 버림한 가격
SELECT productname, ROUND(MSRP,2), TRUNCATE(buyprice,2) FROM products;

#재고 수량 평균이 5000이상인 제품계열
SELECT productline FROM products GROUP BY productline HAVING AVG(quantityinstock) >= 5000;

#주문금액이 가장 큰 순서대로 10개
SELECT ordernumber, SUM(priceeach * quantityOrdered) 주문금액 FROM orderdetails GROUP BY ordernumber ORDER BY 주문금액 DESC LIMIT 10;

#같은 국가에 사는 고객의 수
SELECT country, COUNT(*) 고객수 FROM customers GROUP BY country;

#고객번호에 Co가 들어가는 고객 수와 고객 평균 한도
SELECT COUNT(*), AVG(creditlimit) FROM customers WHERE customername like "%Co%";
