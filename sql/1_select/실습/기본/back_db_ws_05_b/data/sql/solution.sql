
# SELECT 구조
# SELECT [DISTINCT] { * | column_name| expresions [alias] }
# FROM table_references
# [WHERE where_condition]
# [GROUP BY {col_name | expr | position},]
# [HAVING where_condition]
# [ORDER BY {col_name | expr | position} [ASC | DESC]]
# [LIMIT {[offset,] row_count | row_count OFFSET offset}]

# 조건식을 이용하여 원하는 데이터를 얻기위하여 WHERE 절을 사용할 수 있다.
# AND : 둘 다 만족 해야하는 조건식
# OR : 하나라도 만족 해야하는 조건식
# = : 같다의 의미
# != , <> : 다르다는 의미
# IN : 피연산자가 여러 표현 중 하나라도 같다면 TRUE
# IS NULL : 값이 NULL 값인지 아닌지 검사
# LIKE : 컬럼의 값이 특정 패턴을 지니는지 검사하기 위해사용
#      -> % : 0개 이상의 문자를 의미
#      -> _ : 문자 하나를 의미




#Q. person 테이블에서 gender가 '남'인 데이터 전체를 조회해 봅시다.
SELECT * FROM person WHERE gender = '남';

#Q. person 테이블에서 21세기에 태어난 사람을 조회해 봅시다.
SELECT * FROM person WHERE birth_year >= 2000;

#Q. person 테이블에서 job이 '회사원' 이면서 blood_type이 'B'형인 사람의 name과 MBTI를 조회해 봅시다.
SELECT name, MBTI FROM person WHERE job = '회사원' AND blood_type = 'B';

#Q. person 테이블에서 20세기의 사람이거나 blood_type이 'B'형이 아닌 사람의 데이터를 조회해 봅시다.
SELECT * FROM person WHERE birth_year < 2000 or blood_type != 'B';

#Q. person 테이블에서 blood_type이 ‘A’, ‘B’, ‘AB’인 사람들을 조회해 봅시다.
SELECT * FROM person WHERE blood_type in ('A', 'B', 'AB');

#Q. person 테이블에서 '황'씨 성을 가진 사람의 name 데이터를 조회해 봅시다.
SELECT name FROM person WHERE name like '황%';

#Q. person 테이블에서 job이 학생(대학생 포함)인 사람들을 조회해 봅시다.
SELECT * FROM person WHERE job like '%학생';

#Q. person 테이블에서 MBTI가 ‘S’와 ‘J’인 사람의 데이터를 조회해 봅시다.
SELECT * FROM person WHERE MBTI like '_S_J';

#Q. person 테이블에서 2000년 이전에 태어난 사람들 중 MBTI가 ‘E’와 ‘P’ 이면서 ‘A’ 또는 ‘B’형인 사람들을 조회해 봅시다.
SELECT * FROM person WHERE birth_year < 2000 AND MBTI like 'E%P' AND (blood_type in ('A','B'));
