
-- 아래부터 문제


use ssafy_user;

select * from user;
select * from board;

#1. user 테이블 내의 전체 데이터를 조회하시오.
select * from user;

#2. user 테이블 내의 모든 name 을 조회하시오.
select name from user;

#3.	board 테이블 내의 전체 data를 createtime이 빠른 것부터 (오름차순) 조회하시오.
select * from board ORDER BY createtime;

#4.	name이 '울트론' 인 사용자 정보를 조회하시오.
select * from user WHERE name = '울트론';

#5.	name이 '토' 로 시작하는 사용자 정보를 조회하시오.
select * from user WHERE name LIKE '토%';

#6.	title에 '헐크' 가 포함되는 board 정보를 조회하시오.
select * from board WHERE title Like "%헐크%";

#7.	id가 ‘Ironman’ 또는 ‘CaptainAmerica’ 인 사용자의 정보를 조회하시오.
select * from user WHERE id in ('ironman','captainamerica');

#8.	age 가 50 이상인 user 중에서 name 에 ‘토’ 라는 단어가 포함된 사용자 정보를 조회하시오.
select * from user WHERE age>=50 AND name LIKE '%토%';

#9.	board 에서 createtime을 내림차순 정렬해서 상위 3개만 출력하시오.
select * from board ORDER BY createtime DESC LIMIT 3 ;

#10. board 에서 createtime의 년도 기준으로 내림차순 정렬하여 출력하시오. 작성된 년도가 같다면 num을 기준으로 오름차순 한다.
select * from board ;

#11. user 에서 id의 세번째 글자가 ‘o’ 인 data를 출력하시오.
select * from user WHERE id LIKE '__o%';

#12. board 에서 content의 공백을 모두 ‘+’ 로 치환해서 출력하시오.
select replace(content," ", '+') '치환' from board; 

#13. board 에서 writer를 중복없이 출력하시오.
select DISTINCT writername from board;