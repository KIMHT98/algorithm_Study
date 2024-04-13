USE ssafy_country;

#kabul이 속한 국가 이름
SELECT country.code, country.name FROM country INNER JOIN city ON country.code = city.countrycode WHERE city.name = "kabul";

#국가의공식 언어 사용율이 100%인 국가 정보 국가이름 오름차순
SELECT c.name, l.language, l.percentage
FROM country c
LEFT JOIN (SELECT * FROM countrylanguage WHERE isofficial='T') l
ON c.code = l.countrycode
WHERE l.percentage = 100;

#도시명 암스테르담에서 사용되는 주요 언어와 속한 국가
SELECT city.name, language, country.name
FROM country
JOIN city
ON country.code = city.countrycode
JOIN countrylanguage
ON city.countrycode = countrylanguage.countrycode
WHERE city.name = "amsterdam" AND isofficial = 'T';

#국가명이 유나이티드로 시작하는 국가의 정보와 수도의 이름, 수도 null이면 출력x
SELECT country.name, country.capital, city.name 수도, city.population 수도인구
FROM country
LEFT JOIN city
ON country.capital = city.id
WHERE country.name LIKE "United%" AND
country.capital IS NOT NULL;

#국가명이 유나이티드로 시작하는 국가의 정보와 수도의 이름,인구 수도 null이면 없음으로 출력
SELECT country.name, country.capital, IF(country.capital IS NULL,"없음", city.name) 수도, IF(country.capital IS NULL,"없음", city.population) 수도인구
FROM country
LEFT JOIN city
ON country.capital = city.id
WHERE country.name LIKE "United%";

/*SELECT isofficial, percentage FROM countrylanguage WHERE countrycode = 'che';
SELECT MAX(percentage) FROM countrylanguage WHERE countrycode = 'che';
SELECT countrycode FROM countrylanguage WHERE percentage > 63.6;*/
#국가코드 che인 공식 언어 중 가장 사용률이 높은 언어보다 사용율이 높은 언어를 사용하는 국가
SELECT COUNT(DISTINCT countrycode) FROM countrylanguage WHERE percentage > (SELECT MAX(percentage) FROM countrylanguage WHERE countrycode = "che" AND isofficial = 'T') AND isofficial = 'T';

#국가명 south korea의 공식 언어
SELECT language FROM countrylanguage WHERE countrycode = (SELECT code FROM country where name = "south korea") AND Isofficial = "T";

#국가이름이 bo로 시작하는 국가에 속한 도시의 개수
SELECT country.name, IF(count(city.name)=0,"단독",count(city.name)) FROM city RIGHT JOIN country ON city.countrycode = country.code
GROUP BY country.code
HAVING country.name LIKE "Bo%"; 

#인구가 가장 많은 도시
SELECT countrycode, name, population FROM city WHERE population = (SELECT MAX(population) FROM city);

#인구가 가장 적은 도시
SELECT country.name, countrycode, city.name, city.population FROM city LEFT JOIN country ON city.countrycode = country.code WHERE city.population = (SELECT MIN(population) FROM city);

#서울보다 인구가 많은 도시 출력
SELECT countrycode, name, population FROM city WHERE population > (SELECT population FROM city WHERE name='seoul');

#산 미구엘 이라는 도시에 사는 사람들이 사용하는 공식 언어
SELECT countrycode, language FROM countrylanguage WHERE countrycode in (SELECT countrycode FROM city WHERE name = 'san miguel') AND isofficial = 't';

#국가코드와 해당 국가의 최대 인구수 국가코드로 정렬
SELECT countrycode, max(population) FROM city GROUP BY countrycode ORDER BY countrycode;  

#국가별로 가장 인구가 많은 도시의 정보 국가 코드로 정렬
SELECT city.countrycode, city.name , city.population
FROM country
JOIN (SELECT countrycode, MAX(population) 인구 FROM city GROUP BY countrycode) c
ON c.countrycode = country.code
JOIN city
ON c.countrycode = city.countrycode AND c.인구 = city.population;

#국가 이름과 함께 국가별로 가장 인구가 많은 도시의 정보
SELECT city.countrycode,country.name, city.name , city.population
FROM country
LEFT JOIN (SELECT countrycode, MAX(population) 인구 FROM city GROUP BY countrycode) c
ON c.countrycode = country.code
LEFT JOIN city
ON c.countrycode = city.countrycode AND c.인구 = city.population;

#summary라는 viwe를 만들어라
CREATE view summary AS
SELECT city.countrycode 국가코드, country.name 국가이름, city.name 도시이름, city.population 인구
FROM country
LEFT JOIN (SELECT countrycode, MAX(population) 인구 FROM city GROUP BY countrycode) c
ON c.countrycode = country.code
LEFT JOIN city
ON c.countrycode = city.countrycode AND c.인구 = city.population;

#view에서 code가 KOR인 국가의 대표도시
SELECT *
FROM summary
WHERE 국가코드 = 'KOR';