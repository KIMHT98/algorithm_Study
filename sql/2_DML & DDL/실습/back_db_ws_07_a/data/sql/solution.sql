# DDL(Data Definition Language) 데이터 정의 언어
# 데이터 베이스 객체의 구조를 정의하고 조작하는데 사용

# CREATE : 데이터 베이스 객체를 생성하는데 사용
# ALTER : 데이터 베이스 객체를 수정하는데 사용
# DROP : 데이터 베이스 객체를 삭제하는데 사용
# TRUNCATE : 테이블의 모든 데이터를 삭제하는데 사용
# RENAME : 데이터 베이스 객체의 이름을 변경하는데 사용

# Q. programming_language 라는 테이블을 생성해 봅시다.
#    컬럼은 다음과 같이 작성합니다.

# id (INT) : 각 언어를 식별하는 ID
# name (VARCHAR(30)) : 프로그래밍 언어 이름
# description (TEXT) : 언어 설명
USE ssafy_person;

CREATE TABLE programming_language (
	`id` int PRIMARY KEY AUTO_INCREMENT,
	`name` varchar(30) NOT NULL,
    `description` TEXT
);

SHOW TABLES;
DESC programming_language;

# Q. person 테이블에 PL(INT)이라는 컬럼을 추가해 봅시다.
ALTER TABLE person
ADD `pl` int;

DESC person;

# Q. programming_language 테이블의 이름을 programming 으로 수정해 봅시다.
RENAME TABLE programming_language
TO programming;

SHOW TABLES;
DESC programming;

# Q. programming 테이블을 삭제해 봅시다.
DROP TABLE programming;