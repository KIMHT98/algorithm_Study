USE classicmodels;

SELECT * FROM orders;
#orderNumber=10100
SELECT customerNumber FROM orders WHERE orderNumber=10100;

#cutomernumber 100이상 150이하인 주문건
SELECT * FROM orders WHERE customernumber BETWEEN 100 and 150;

#주문 배송 상태 몇가지
 SELECT DISTINCT status FROM orders;
 
 #상품 가격 높은 순 5개
 SELECT * FROM orderdetails ORDER BY priceeach DESc LIMIT 5;
 
 #latname에 B가 들어가는 친구
 SELECT * FROM employees WHERE lastname LIKE "%B%";
 
 #employeenumber가 1500dlgkdlrh officecode가 4인 직원 풀네임
 SELECT CONCAT(lastname,firstname) as "이름", employeenumber, jobtitle FROM employees WHERE employeenumber <= 1500 AND officecode = 4;
 
 #payment테이블에서 가장 최근에 결제된 건의 checknumver를 뒤집어서 출력
 SELECT REVERSE(checkNumber) FROM payments ORDER BY paymentDate DESC LIMIT 1;
 SELECT * FROM offices;
 #BOSTON에 위치한 사무실의 우편번호와 주소, 전화번호
 SELECT postalcode as 우편번호, addressLIne1 주소, phone 전화번호 FROM offices WHERE city = "BOSTON";
 
 #productline이 motorcycle인 제품 재고 많이 남은 순으로
 SELECT * FROM products WHERE productline = "motorcycles" ORDER BY quantityInStock;