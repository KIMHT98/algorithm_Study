USE world;

#현재 날짜오 ㅏ올해가 몇일 지났는지 100일후는 몇일인지
SELECT DATE(NOW()) 오늘, DATEDIFF(DATE(NOW()),"2024-01-01") 올해지난날, adddate(DATE(NOW()),100);

#asia에 있는 나라 중 희망 수명이 있는 경우 기대수명에 따라 구분
SELECT name, continent, LifeExpectancy, 
CASE WHEN LifeExpectancy > 80 THEN '장수국가'
	 WHEN LifeExpectancy > 60 THEN '일반국가'
     ELSE '단명국가'
     END 구분
FROM country
WHERE continent = 'asia' AND NOT ISNULL(LifeExpectancy);

#gnp 향상이 gnpold가 없으면 신규 이름으로 정렬
SELECT name, gnp, gnpold, IF(isnull(gnpold),"향상",gnp - gnpold) gnp향상 
FROM country
ORDER BY name;
SELECT (3+null);
#2020년 어린이날이 평일이면 행복, 주말이면 불행
SELECT IF(weekday('2020-05-05') in ('6','5'), '불행', '행복') 행복여부;

#전체 자료의 수와 독립 연도가 있는 자료의 수
SELECT COUNT(*) 전체, COUNT(indepyear) 독립연도보유 FROM country;

#기대 수명의 합계, 평균, 최대, 최소
SELECT SUM(IFNULL(LifeExpectancy,0)) 합계, AVG(IFNULL(LifeExpectancy,0)) 평균, MAX(IFNULL(LifeExpectancy,0)) 최대, MIN(IFNULL(LifeExpectancy,0)) 최소
FROM country; # 집계함수는 null 빼고 계산함
SELECT SUM(LifeExpectancy) 합계, ROUND(AVG(LifeExpectancy),2) 평균, MAX(LifeExpectancy) 최대, MIN(LifeExpectancy) 최소
FROM country;

# 대륙별 국가 개수 / 인구 합
SELECT continent, COUNT(*) 국가개수, SUM(population) 인구합 FROM country
GROUP BY continent ORDER BY 국가개수 DESC;

#대륙별 표면적 합 내림차순 상위 3건
SELECT continent,  SUM(surfacearea) 표면적합 FROM country
GROUP BY continent ORDER BY 표면적합 DESC LIMIT 3;

#대륙별 인구가 5천만 이상인 나라 gnp 총합
SELECT continent, SUM(gnp) FROM country
WHERE population >= 50000000 
GROUP BY continent
ORDER BY continent;

#연도별로 10개 이상의 나라가 독립한 해
SELECT indepyear, COUNT(*) FROM country
GROUP BY indepyear HAVING NOT ISNULL(indepyear) AND COUNT(*) >= 10;

#국가별 gnp와 평균 gnp, 대륙 평균 gnp
SELECT continent, name, gnp, avg(gnp) over () as "전세계 평균", avg(gnp) over (PARTITION BY continent) as "대륙 평균" FROM country;

SELECT continent