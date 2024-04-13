# JOIN
# ㄴ둘 이상의 테이블에서 데이터를 조회하기 위해서 사용
# ㄴ일반 적으로 조인조건은 PK(Primary Key) 및 FK(Foreign Key)로 구성된다.
# ㄴPK 및 FK 관계가 없더라도 논리적인 연관만으로도 JOIN 가능하다.

# JOIN의 종류
# INNER JOIN : 두 테이블 간에 일치하는 행만 반환
# LEFT OUTER JOIN : 왼쪽 테이블의 모든 행을 반환, 오른쪽 테이블에서 일치하는 행이 있는 경우 반환, 없는 경우 NULL 채움
# RIGHT OUTER JOIN : 오른쪽 테이블의 모든 행을 반환, 왼쪽 테이블에서 일치하는 행이 있는 경우 반환, 없는 경우 NULL 채움
# SELF JOIN : 하나의 테이블 내에서 자기 자신을 조인


USE ssafy_person;
# Q. INNER JOIN을 활용하여 이름과 사용할 수 있는 프로그래밍 언어의 이름을 출력해 봅시다.
SELECT p.name AS '이름', pl.name AS '프로그래밍언어'
FROM person p
INNER JOIN programming_language pl
ON p.pl = pl.id;



# Q. INNER JOIN을 사용하지 않고 위 문제를 해결해 봅시다.
SELECT p.name AS '이름', pl.name AS '프로그래밍언어'
FROM person p, programming_language pl
WHERE p.pl = pl.id;



# Q. '강사'라는 직업을 가진 사람이 사용할 수 있는 프로그래밍 언어가 있다면 이름과 프로그래밍언어, 설명까지 출력해 봅시다.
SELECT p.name AS '이름', pl.name AS '프로그래밍언어', pl.description as '설명'
FROM person p
INNER JOIN  programming_language pl
ON p.pl = pl.id
WHERE p.job LIKE '강사';


# Q. 사용할 수 있는 프로그래밍 언어와 설명을 포함하여 모든 사람들의 정보를 출력해 봅시다.
SELECT *
FROM person p
LEFT OUTER JOIN programming_language pl
ON p.pl = pl.id;



# Q. 각 언어를 사용할 수 있는 사람의 이름과 직업을 출력해 봅시다.
SELECT pl.name AS '프로그래밍언어', p.name AS '이름', p.job AS '직업'
FROM person p
RIGHT OUTER JOIN programming_language pl
ON p.pl = pl.id;



# Q. 혈액형이 'B'형인 사람이 사용할 수 있는 프로그래밍 언어와 정보를 중복없이 출력해 봅시다.
SELECT DISTINCT pl.name, pl.description
FROM person p
RIGHT JOIN programming_language pl
ON p.pl = pl.id
WHERE p.blood_type = 'B';



# Q. 사람들이 사용할 수 없는 언어가 있다면 그 이름과 설명을 출력해 봅시다.
SELECT pl.name, pl.description
FROM programming_language pl
LEFT OUTER JOIN person p
ON pl.id = p.pl
WHERE p.name IS NULL;