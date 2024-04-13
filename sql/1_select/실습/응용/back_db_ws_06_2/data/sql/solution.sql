USE ssafy_cinema;
SELECT 
    *
FROM
    movie;
#행 개수
SELECT COUNT(*) FROM movie;

#상영시간 평균
SELECT AVG(runningtime) FROM movie;

#상영시간 합
SELECT SUM(runningtime) FROM movie;

#포터가 포함된 영화 상영시간 평균 둘째자리 반올림
SELECT ROUND(AVG(runningtime),2) "포터평균" FROM movie WHERE title like "%포터%";

#극장코드로 그룹화 각 그룹 영화 개수
SELECT cinemacode, COUNT(*) "영화개수" FROM movie GROUP BY cinemacode;

#극장코드로 그룹화 제일 긴 상영시간 
SELECT cinemacode, MAX(runningtime) as 최대 FROM movie GROUP BY cinemacode;

#극장코드 그룹화 상영시간 평균 150이상
SELECT cinemacode FROM movie GROUP BY cinemacode HAVING AVG(runningtime)>=150;

#극장코드 그룹화 상영시간 합이 300 이상
SELECT cinemacode FROM movie GROUP BY cinemacode HAVING SUM(runningtime)>=300;

#극장코드 그룹화 상영시간 평균>= 150 & 총합 300 이상ALTER
SELECT cinemacode FROM movie GROUP BY cinemacode HAVING AVG(runningtime)>=150 AND SUM(runningtime)>=300;
