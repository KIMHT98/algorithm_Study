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

# Q. ssafy_curriculum 테이블을 생성해 봅시다.
#   (아래는 예시를 참고하여 다양하게 컬럼을 작성)

# id (INT) : 각 커리큘럼을 식별하는 식별자
# name (VARCHAR(30)) : 커리큘럼 이름
# teacher (VARCHAR(10) : 선생님 이름 (트랙별로 1명만 있다고 가정)

CREATE TABLE ssafy_curriculum (
	`id` int PRIMARY KEY AUTO_INCREMENT,
	`name` varchar(30) NOT NULL,
    `teacher` varchar(10) NOT NULL
);

SHOW TABLES;



# Q. ssafy_curriculum에 (Python, Java비전공, Java전공, Embedded, Mobile) 1학기 트랙을 추가해 봅시다.
INSERT INTO ssafy_curriculum (name, teacher)
VALUES ('Python', '김강사'),
	   ('Java비전공', '양강사'),
       ('Java전공', '이강사'),
       ('Embedded', '박강사'),
       ('Mobile', '최강사');

SELECT * FROM ssafy_curriculum;



# Q. 학번을 기준으로 8기를 ssafy_student 테이블에서 삭제해 봅시다.
DELETE FROM ssafy_student
WHERE id like '08%';

SELECT * FROM ssafy_student;



# Q. ssafy_student의 in_ssafy가 0인 데이터를 3으로 수정해 봅시다.
UPDATE ssafy_student
SET in_ssafy = 3
WHERE in_ssafy = 0;

SELECT * FROM ssafy_student;


# Q. Java 트랙과 마찬가지로 다음 기수 부터는 Python 트랙도 Python비전공, Python전공으로 만드려고 합니다.
# 관련하여 필요한 SQL문을 작성하여 만들어 봅시다. (강사 이름은 '홍강사')
# hint. ssafy_student, ssafy_curriculum 테이블을 모두 사용해야 합니다.

UPDATE ssafy_student
SET curriculum = 'Python비전공'
WHERE curriculum LIKE 'Python';

UPDATE ssafy_curriculum
SET name = 'Python비전공'
WHERE id = 1;

INSERT INTO ssafy_curriculum
VALUES (0, 'Python전공', '홍강사');


SELECT * FROM ssafy_student;

SELECT * FROM ssafy_curriculum;

# Q. 다양한 상황과 데이터를 생각해보고 직접 추가적으로 작성을 해봅시다.