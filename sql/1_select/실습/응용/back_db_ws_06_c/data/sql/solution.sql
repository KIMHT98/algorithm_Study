USE ssafy_corporation;
# DBA (database administrator, 데이터베이스 관리자)는 한 조직 내에서 데이터베이스를 설치, 구성, 업그레이드 등의 업무를 하는 직무이다.
# SSAFY DBA 인턴 업무를 맡게 된 김싸피를 위해 문제를 해결해보자.
# ssafy_student의 컬럼의 의미는 다음과 같다.
	# id : 학번
	# name : 이름
	# gender : 성별
	# campus : 지역 (서울, 대전, 광주, 구미, 부울경)
	# class : 분반
	# curriculum : 1학기 트랙 (Python, Java비전공, Java전공, Embedded, Mobile)
	# birth_date : 생년월일
	# major : 전공
	# in_ssafy : 재학여부 (1 : 재학중, 0 : 퇴소)


# Q. 교육생 중 '김'씨가 캠퍼스 별 몇 명인지 출력해 봅시다.
SELECT campus, COUNT(*) AS '인원'
FROM ssafy_student
WHERE name LIKE '김%'
GROUP BY campus;


# Q. 학번을 이용하여 기수 별로 존재하는 인원을 출력해 봅시다.
SELECT LEFT(id, 2) AS '기수' , COUNT(*) AS '인원'
FROM ssafy_student
GROUP BY LEFT(id, 2);

# Q. 생일이 가장 많은 달과 인원을 출력해 봅시다.
SELECT MONTH(birth_date) AS 'month' , COUNT(MONTH(birth_date)) '인원'
FROM ssafy_student
GROUP BY MONTH(birth_date)
ORDER BY COUNT(MONTH(birth_date)) DESC
LIMIT 1;

# Q. 각 캠퍼스의 최연소와 최고령 나이를 출력해 봅시다.
SELECT campus, MIN(2024-YEAR(birth_date)+1) AS '최연소', MAX(2024-YEAR(birth_date)+1) AS '최고령'
FROM ssafy_student
GROUP BY campus;

# Q. 9기의 수료식은 2023-12-19 입니다. 9기가 수료한 후 시간이 얼마나 지났는지를 출력해 봅시다.
SELECT DATEDIFF(CURDATE(), '2023-12-19') AS '9기 수료 후';

SELECT count(*), curriculum
FROM ssafy_student
GROUP BY curriculum;
# Q. 트랙 별 인원이 5명이 되지 않는 트랙의 이름을 출력해 봅시다.
SELECT count(*), curriculum
FROM ssafy_student
GROUP BY curriculum
HAVING COUNT(curriculum) < 5;

# Q. 2024년 기준 나이가 30 이상인 학생의 수를 각 캠퍼스 별로 출력해 봅시다.
SELECT campus, COUNT(*) AS '인원'
FROM ssafy_student
WHERE (2024-YEAR(birth_date)+1) >= 30
GROUP BY campus;

# Q. 이후 원하는 질문과 쿼리를 자유롭게 작성하여 결과를 확인해 봅시다.