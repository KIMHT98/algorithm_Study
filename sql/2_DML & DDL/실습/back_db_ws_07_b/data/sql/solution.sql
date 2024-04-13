# DML(Data Manipulation Language) 데이터 조작 언어
# 데이터베이스에서 데이터를 조작하거나 조회할 때 사용

# SELECT : 데이터베이스에서 데이터를 조회하는데 사용
# INSERT : 새로운 데이터를 데이터베이스 테이블에 삽입하는데 사용
# UPDATE : 데이터베이스 테이블의 기존 데이터를 수정하는데 사용
# DELETE : 데이터베이스 테이블에서 특정 행이나 모든 행을 삭제하는데 사용


# Q. programming_language 테이블에 Java를 추가해 봅시다.
INSERT INTO programming_language (name)
VALUES ('Java');

SELECT * FROM programming_language;

# Q. programming_language 테이블에 Python, JavaScript, MySQL을 설명과 함께 한번에 추가해 봅시다.
INSERT INTO programming_language (name, description)
VALUES ('Python', '사용하기 쉽고 쉬운 문법을 갖춘 프로그래밍 언어'),
       ('JavaScript', '웹 브라우저에서 동적인 웹 페이지를 만들기 위한 스크립트 언어'),
       ('SQL', '관계형 데이터베이스에서 데이터를 관리하고 조작하기 위해 표준화된 언어');

SELECT * FROM programming_language;

# Q. programming_language 테이블에 있는 Java 언어의 설명을 수정해 봅시다.
UPDATE programming_language
SET description = '플랫폼에 독립적인 객체지향 프로그래밍 언어'
WHERE name = 'Java';

SELECT * FROM programming_language;

# Q. programming_language 테이블에 있는 Python 데이터를 삭제해 봅시다.
DELETE FROM programming_language
WHERE name = 'Python';

SELECT * FROM programming_language;

# Q. person 테이블에서 O형 혈액형을 C형으로 수정해 봅시다.
UPDATE person
SET blood_type = 'C'
WHERE blood_type = 'O';

SELECT * FROM person;


# Q. person 테이블에서 21세기에 태어난 사람들의 데이터를 모두 삭제해 봅시다.
DELETE FROM person
WHERE birth_year >= 2000;

SELECT * FROM person;
