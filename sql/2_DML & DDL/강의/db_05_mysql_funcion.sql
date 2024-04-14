# Q1. 숫자관련 함수 사용
-- 2의 3제곱
SELECT power(2,3) AS "2**3"
FROM DUAL;
-- 8 나누기 3의 나머지
SELECT MOD(8,3) AS "8%3"
FROM DUAL;
-- 최대값, 최솟값
SELECT greatest(2,4,1,6) AS "MAX", least(1,2,101,-1) AS "MIN"
FROM DUAL;
-- 반올림
SELECT ROUND(1.123,0), ROUND(1.123,1), ROUND(1.123,2)
FROM DUAL;
# Q2. 문자 관련 함수
-- 아스키 코드값 얻기
SELECT ascii('0'), ascii('A'), ascii('a');

-- concat 메서드를 써보자.
SELECT concat('president의 이름은 ' , ename, '입니다.') AS '소개'
FROM emp
WHERE job = 'president';

-- 이름의 길이가 5인 직원의 이름을 조회
SELECT ename
FROM emp
WHERE length(ename) = 5;

SELECT length("홍길동"), char_length("홍길동");#바이트 / 문자

-- 문자열 변경
SELECT replace("HELLO","L","*");

-- 문자열 인덱스
SELECT INSTR('hello ssafy !!!','o'); #5 / 인덱스 1부터 시작하는듯

-- 모든 직원의 이름 3자리조회
SELECT SUBSTR(ename,1,3) FROM emp;
SELECT LEFT(ename, 3) FROM emp;

-- LPAD RPAD
SELECT LPAD('SSAFY',10,'*'), RPAD('SSAFY',10,'*');#총 10자리 중 왼쪽/오른쪽에 *넣는다

-- REVERSE
SELECT REVERSE('EAT NOEYH MIK');

# Q3. 날짜 관련함수
-- 2초 더하기
SELECT ADDTIME(now(),"100");
-- 날짜차이
SELECT DATEDIFF(date(now()),"2024-03-19");
-- 오늘은?
SELECT NOW(), DAY(NOW()), MONTH(NOW()), YEAR(NOW()), YEARWEEK(NOW());

# Q4. 트랜잭셕 사용해보기
SET autocommit = 0;
CREATE TABLE test_table(val VARCHAR(20));

# 롤백
START TRANSACTION;
INSERT INTO test_table VALUE('A');
INSERT INTO test_table VALUE('B');
INSERT INTO test_table VALUE('C');
INSERT INTO test_table VALUE('D');

ROLLBACK;
SELECT * FROM test_table;

# 커밋
START TRANSACTION;
INSERT INTO test_table VALUE('S');
INSERT INTO test_table VALUE('S');
INSERT INTO test_table VALUE('A');
INSERT INTO test_table VALUE('F');
INSERT INTO test_table VALUE('Y');
COMMIT;
SELECT * FROM test_table;
