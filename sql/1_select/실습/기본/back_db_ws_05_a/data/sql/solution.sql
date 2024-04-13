
# DataBase : 여러 사람이 공유하여 사용할 목적으로 통합관리하는 데이터의 집합
# DBMS(DataBase Management System) : DB를 관리해주는 프로그램
# SQL(Structed Query Language) 관계형 DB에서 데이터 조작과 정의를 위해 사용하는 언어
# DML(Data Manipulation Language) : 데이터 조작 언어
# SELECT : DB에서 데이터를 조회할 때 사용할 수 있는 쿼리문, 아래와 같이 사용이 가능함.

# SELECT 구조
# SELECT [DISTINCT] { * | column_name| expresions [alias] }
# FROM table_references
# [WHERE where_condition]
# [GROUP BY {col_name | expr | position},] 
# [HAVING where_condition]
# [ORDER BY {col_name | expr | position} [ASC | DESC]] 
# [LIMIT {[offset,] row_count | row_count OFFSET offset}]


#Q. person 테이블의 데이터를 전체를 조회해 봅시다.
SELECT * FROM person;

#Q. person 테이블에서 job을 조회해 봅시다. 
SELECT job FROM person;

#Q. person 테이블에서 name, MBTI 데이터를 조회해 봅시다.
SELECT name, mbti FROM person;

#Q. person 테이블에서 중복제거한 blood_type 데이터를 조회해 봅시다.
SELECT DISTINCT blood_type FROM person;

#Q. person 테이블에서 중복된 job을 제외하고 컬럼명도 '직업'으로 바꾸어 조회해 봅시다.
SELECT DISTINCT job AS '직업' FROM person;

#Q. person 테이블에서 gender와 job을 묶어 중복제거 후 조회해 봅시다.
SELECT DISTINCT gender, job FROM person; 
SELECT * FROM person;
#Q. person 테이블에서 2024년을 기준으로 name과 age를 조회해 봅시다.
SELECT naem, (2024-birth_year) AS 'age' FROM person;
