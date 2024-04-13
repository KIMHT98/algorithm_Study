USE classicmodel;
 #customer와 orders를 이너조인해서 조회
 SELECT ordernumber, orders.customernumber, orderdate
 FROM customers
 JOIN orders
 ON customers.customernumber = orders.customernumber;

#미국과 프랑스 내 사무실들의 ~~를 조회
SELECT officecode, city, phone, country
FROM offices
WHERE city IN (SELECT city
FROm offices 
WHERE country IN ('USA', 'France'));

#미국가 프랑스가 아닌 다른 국가들 조회
SELECT officecode, city, phone, country
FROM offices
WHERE city IN (SELECT city
FROm offices 
WHERE country NOT IN ('USA', 'France'));

#이름이 'signal gift stores'인 고객의 주문정보 조회
SELECT ordernumber, orderdate 
FROM orders
JOIN customers
ON orders.customernumber = customers.customernumber
WHERE customername = 'signal gift stores';

#이름이 'Herkku gifts'인 고객 주묹정보 조회
SELECT ordernumber, orderdate
FROM orders
WHERE customernumber = (SELECT customernumber FROm customers WHERE customername = 'herkku gifts');

#권장소비자가격(MSRP)의 평균 가격보다 원가가 비싼 제품의 주문 정보를 비싼 순으로 10개만 조회하시오.
SELECT orderdetails.ordernumber, orderdetails.productcode, orderdetails.quantityordered, orderdetails.priceeach, orderdetails.orderlinenumber
FROM orderdetails 
RIGHT JOIN products
ON orderdetails.productcode = products.productcode
WHERE products.buyprice > (SELECT AVG(products.MSRP)
				  FROM products) 
ORDER BY priceEach DESC LIMIT 10 ;

#모든 고객의 평균 한도보다 혼다가 큰 고객의 담당자를 한도를 기준으로 오름차순
SELECT c.customernumber, c.salesRepEmployeeNumber, c.creditLimit,e.employeeNumber,e.lastName,e.firstName,e.extension,e.officeCode,e.reportsTo,e.jobTitle 
FROM customers c
Left JOIN employees e
ON c.salesRepEmployeeNumber = e.employeeNumber
WHERE c.creditlimit > (SELECT AVG(creditlimit) FROM customers)
ORDER BY creditlimit;

#고객번호가 300-3580번인 고객들의 고객정보와 담당 직원 이름
SELECT c.customernumber, c.customername, c.salesRepEmployeeNumber, CONCAT(e.lastname," ",e.firstname) 담당자
FROM customers c
Left JOIN employees e
ON c.salesRepEmployeeNumber = e.employeeNumber
WHERE c.customernumber BETWEEN 300 AND 350;

#사무실코드가 3인 직원들의 상사, jobtitle이 동일한 직원들의 직원번호와 이름 
SELECT employeenumber, CONCAT(lastname," ",firstname) 직원이름
FROM employees 
WHERE jobtitle in (SELECT jobtitle FROM employees WHERE officecode = 3);

