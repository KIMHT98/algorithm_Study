USE world;
SELECT * FROM city;
SELECT * FROM country;
SELECT * FROM countrylanguage;

#code=ㅏKOR
SELECT * FROM country WHERE code = "KOR";

#gnp변동량 양수이면서 오름차순
SELECT code, name, gnp, gnpold, (gnp - gnpold) as gnp변동량 FROM country WHERE (gnp - gnpold) > 0 ORDER BY gnp변동량;

#continent중복없이 길이로 정렬
SELECT DISTINCT continent FROM country ORDER BY length(continent);

#asi 대륙에 속하는 국가 정보 / name으로 정렬
SELECT concat(name,"은",region,"에 속하며 인구는",population,"명이다.") 정보 FROM country WHERE continent="asia";

#독립년도에 대한 기록 없고, 인구가 10000이상인 국가 정보를 인구 오름차순
SELECT * FROM country WHERE isnull(indepyear) AND population >= 10000 ORDER BY population;

#인구가 1억이상 2억 이하인 나라 인구 내림차순
SELECT code, name, population FROM country WHERE population BETWEEN 100000000 and 200000000 ORDER BY population DESC limit 3;

#독립년 기준으로 오름차순 같으면 code 내림차순
SELECT code, name, indepyear FROM country WHERE indepyear in (800,1810,1811,1901) ORDER BY indepyear, code DESC;

#region에 asia들어가고 name의 두번째가 o인 국가
SELECT code, name, region FROM country WHERE region LIKE "%asia%" AND name LIKE "_o%"; 

#홍길동과 hong의 글자 길이
SELECT length("홍길동") 한글 , length("hong") 영문 FROM DUAL;

#code가 모음으로 시작하는 나라 name 오름차순 & 3번 부터 3개만
SELECT code, name FROM country WHERE left(code,1) in ('a','e','i','o','u') ORDER BY name LIMIT 2,3;

#name을 맨 앞과 맨뒤 2글자를 제외하고 *로 처리
SELECT 
    name,
    CONCAT(SUBSTRING(name, 1, 2),
            REPEAT('*', LENGTH(name) - 4),
            SUBSTRING(name, LENGTH(name) - 1, 2)) AS guess
FROM
    country;

SELECT DISTINCT REPLACE(region,' ','_') as 지역들 FROM country ORDER BY length(지역들) DESC;

#인구 1억 이상인데 점유면적 반올림 소수3자리 점유면적 오름차순
SELECT name, surfacearea, population, round((surfacearea / population),3) "1인당 점유 면적" FROM country WHERE population >= 100000000 ORDER BY "1인당 점유 면적";