# SubQuery
# 서브 쿼리란 하나의 SQL 문안에 포함되어 있는 SQL문을 의미
# 서브 쿼리를 포함하는 SQL을 외부 쿼리(outer query) 또는 메인 쿼리라고 부르며, 서브 쿼리는 내부 쿼리 (inner query) 라고도 부른다.

# WHERE 절에서 사용 : 특정 조건을 만족하는 데이터를 필터링 할 수 있음
# FROM 절에서 사용 : 하위 쿼리의 결과를 가상 테이블로 사용할 수 있음
# SELECT 절에서 사용 : 계산된 값을 선택할 수 있음


# Q. '표*곤'이 사용할 수 있는 프로그래밍 언어를 출력해 봅시다.
SELECT *
FROM programming_language
WHERE id = (SELECT pl FROM person WHERE name = '표*곤');



# Q. '이*훈'과 동일한 MBTI를 가진 사람들을 출력해 봅시다.
SELECT *
FROM person
WHERE mbti = (SELECT mbti FROM person WHERE name = '이*훈');



# Q. '정*현'의 birth_year 이후에 태어난 사람들을 오름차순으로 출력해 봅시다
SELECT *
FROM person
WHERE birth_year > (SELECT birth_year FROM person WHERE name = '정*현')
ORDER BY birth_year;



# Q. 1명 이상이 사용할 수 있는 프로그래밍 언어를 출력해 봅시다.
SELECT *
FROM programming_language
WHERE id IN (SELECT DISTINCT pl FROM person);



# Q. 아무도 사용할 수 없는 언어를 출력해 봅시다.
SELECT *
FROM programming_language
WHERE id NOT IN (SELECT DISTINCT pl FROM person);



# Q. 프로그래머가 사용하는 언어를 사용할 수 있는 사람들을 출력해 봅시다.
SELECT person.name, person.job, p.pName
FROM person, ( SELECT DISTINCT pl, programming_language.name AS 'pName'
               FROM person, programming_language
               WHERE job = '프로그래머' AND person.pl = programming_language.id) p
WHERE person.pl = p.pl;



# Q. 각 직업 별 2024년 기준 평균 나이를 구하고, 사람들의 이름, 나이, 직업, 직업 별 평균 나이를 출력해 봅시다. (FROM 절 SubQuery)
SELECT name, (2024-birth_year+1) AS 'age', p.job, p.avg_age
FROM person, (SELECT job, CONVERT(AVG(2024-birth_year+1), UNSIGNED) AS 'avg_age'
               FROM person
               GROUP BY job) p
WHERE person.job = p.job
ORDER BY job;


# Q. 각 직업 별 2024년 기준 평균 나이를 구하고, 사람들의 이름, 나이, 직업, 직업 별 평균 나이를 출력해 봅시다. (SELECT 절 SubQuery)
SELECT name, (2024-birth_year+1) AS 'age', p.job, (SELECT CONVERT(AVG(2024-birth_year+1), UNSIGNED) AS 'avg_age'
               FROM person
               WHERE job = p.job) AS 'avg_age'
FROM person p
ORDER BY job;
