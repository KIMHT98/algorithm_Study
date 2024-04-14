USE ssafy_cinema;
SELECT 
    *
FROM
    movie;
    
#모든 title조회
SELECT title FROM movie;

#이터널스 정보 조회
SELECT * FROM movie WHERE title='이터널스';

#해리로 시작하는 영화
SELECT * FROM movie WHERE title like "해리%";

#제목에 포터가 들어간 영화
SELECT * FROM movie WHERE title LIKE "%포터%";

#ID가 100또는 1004인 영화
SELECT title FROM movie WHERE id in (1000,1004);

#대문자로 바꾸기
SELECT UPPER("touppercase") as 대문자 FROM DUAL;

#해리포터와 마법사의 돌 두 단어를 연결
SELECT CONCAT("해리포터","마법사의 돌") as 연결 FROM DUAL;

#개봉일이 2018년 1월 1일 이후인 영화 제목 두글자
SELECT LEFT(title, 2) as 두글자 FROM movie WHERE ReleaseDate >= "2018-01-01";

#해리가 포함된 영화들의 제목을 말포이로 바꿔
SELECT replace(title, '해리포터','말포이') as 영화제목 FROM movie WHERE title like "%해리%";