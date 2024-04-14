# DBA (database administrator, 데이터베이스 관리자)는 한 조직 내에서 데이터베이스를 설치, 구성, 업그레이드 등의 업무를 하는 직무이다.
# SSAFY DBA 인턴 업무를 맡게 된 김싸피를 위해 문제를 해결해보자.
# ssafy_student의 컬럼의 의미는 다음과 같다.
	# id : 학번
	# name : 이름
	# gender : 성별
	# campus : 지역 (서울, 대전, 광주, 구미, 부울경)
	# class : 분반
	# curriculum : 1학기 트랙
	# birth_date : 생년월일
	# major : 전공
	# in_ssafy : (0 : 미분류, 1 : 1학기 재학중, 2 : 2학기 재학중, 3 : 졸업, 4 : 취업퇴소, 5 : 중도퇴소)


# ssafy_curriculum 컬럼의 의미는 다음과 같다.
	# id (INT) : 각 커리큘럼을 식별하는 식별자
	# name (VARCHAR(30)) : 커리큘럼 이름
	# teacher (VARCHAR(10) : 선생님 이름 (트랙별로 1명만 있다고 가정)


# Q. 재학 중인 교육생의 학번, 이름, 트랙, 담당 강사 정보를 출력해 봅시다.
SELECT st.id AS '학번', st.name AS '이름', c.name AS '1학기트랙', c.teacher AS '강사'
FROM ssafy_student st, ssafy_curriculum c
WHERE st.curriculum = c.id AND st.in_ssafy IN (1,2);



# Q. '양강사'의 교육생의 학번, 이름, 캠퍼스를 출력해 봅시다.
SELECT st.id, st.name, st.campus
FROM ssafy_student st
WHERE curriculum = (SELECT id FROM ssafy_curriculum WHERE teacher = '양강사');


# Q. 'Java 전공'' 에서 취업 퇴소(4)한 교육생 정보를 출력해 봅시다.
SELECT *
FROM ssafy_student
WHERE in_ssafy = 4 AND curriculum = (SELECT id
 									 FROM ssafy_curriculum
 									 WHERE name = 'Java전공');



# Q. 생일이 가장 많은 달의 교육생 정보를 출력해 봅시다.
SELECT *
FROM ssafy_student
WHERE MONTH(birth_date) = (SELECT MONTH(birth_date) as 'month'
							FROM ssafy_student
							GROUP BY MONTH(birth_date)
							ORDER BY COUNT(*) DESC
							LIMIT 1);



# Q. 2024년 기준 트랙 별 평균 나이 보다 큰 교육생의 학번, 이름, 트랙, 트랙 평균 나이를 출력해 봅시다.
SELECT st.id, st.name AS '이름', c.name '트랙이름', s.avg_age
FROM ssafy_student st, (SELECT curriculum, round((AVG(2024-YEAR(birth_date)+1)),1) AS 'avg_age' FROM ssafy_student GROUP BY curriculum) s, ssafy_curriculum c
WHERE st.curriculum = s.curriculum AND s.curriculum = c.id AND (2024-YEAR(st.birth_date)+1) > s.avg_age;


# Q. 다양한 상황과 데이터를 생각해보고 직접 추가적으로 작성을 해보자.

