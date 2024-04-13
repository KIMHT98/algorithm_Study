
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
SELECT * FROM salgrade;
# Q. 현재 SSAFY에 재학 중인 학생을 조회해 봅시다.
SELECT * FROM ssafy_student WHERE in_ssafy = 1;

# Q. 서울 캠퍼스에 속한 학생의 이름과 전공을 조회해 봅시다.
SELECT name, major FROM ssafy_student WHERE campus LIKE '서울%';

# Q. 대전 캠퍼스의 비전공 트랙에서 교육을 받은 교육생을 조회해 봅시다.
SELECT * FROM ssafy_student WHERE campus LIKE '대전' AND curriculum IN ( 'java비전공' , 'Python');

# Q. 서울을 제외한 나머지 캠퍼스에 재학 중인 교육생의 이름, 캠퍼스, 트랙을 조회해 봅시다.
SELECT name, campus, curriculum 트랙 FROM ssafy_student WHERE campus <> '서울' AND in_ssafy = 1;

# Q. Java 트랙을 이수하고 졸업한 교육생 중 ‘이’씨 성을 가진 교육생을 조회해 봅시다.
SELECT * FROM ssafy_student WHERE curriculum LIKE 'J%' AND name LIKE '이%' AND in_ssafy = 0;

# Q. 교육학을 전공( OO 교육 )한 교육생을 조회해 봅시다.
SELECT * FROM ssafy_student WHERE major LIKE '%교육';


# Q. 공학을 전공( OO 공학)한 교육생 중 반이 짝수인 교육생을 조회해 봅시다.
SELECT * FROM ssafy_student WHERE class % 2 = 0 AND major LIKE '%공학%';


# Q. 서울 캠퍼스이면서 홀수 반 교육생 중 전공 트랙인 교육생을 조회해 봅시다.
SELECT * FROM ssafy_student WHERE campus = '서울' AND class % 2 <> 0 AND curriculum NOT IN ('Python', 'Java비전공');
