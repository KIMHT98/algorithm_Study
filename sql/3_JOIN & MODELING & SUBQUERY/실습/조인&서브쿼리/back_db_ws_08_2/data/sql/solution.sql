USE ssafy_cinema;

#조인 시 전체 행 개수
SELECT COUNT(*) FROM movie, cinema;

#모든 영화가 극장에서 상영중인지 알 수 있도록 시네마정보 모두
SELECT * FROM movie LEFT JOIN cinema ON movie.cinemaCode = cinema.cinemaCode;

#서울에 있는 시네마에서 상영하는 영화들
SELECT * FROM movie 
LEFT JOIN cinema ON movie.cinemaCode = cinema.cinemaCode
WHERE cinema.location = "서울";

#광주에 있는 시네마 상영 영화 개수
SELECT COUNT(Title) FROM movie 
LEFT JOIN cinema ON movie.cinemaCode = cinema.cinemaCode
WHERE cinema.location = "광주";

#극장으로 그루핑해서 각 시네마 당 몇개 영화 상영중인지 
SELECT cinemaName, COUNT(title) 상영중 FROM movie RIGHT JOIN cinema ON movie.cinemacode = cinema.cinemacode
GROUP BY cinema.cinemacode;

# 극장위치로 그루핑 해서 상영중영화 1개인 곳
SELECT COUNT(title) 상영중, cinema.location 지역 FROM movie RIGHT JOIN cinema ON movie.cinemacode = cinema.cinemacode
GROUP BY cinema.cinemacode
HAVING 상영중 = 1;

#영화 이름이 이터널스인 영화의 상영 시간 이상인 영화 이름과 상영시간
SELECT title, runningTIME FROM movie WHERE runningtime >= (SELECT runningtime FROM movie WHERE title = '이터널스');

#상영시간 156분 이상인 영화들 상영중인 시네마
SELECT cinemaname FROM movie left join cinema on movie.cinemacode = cinema.cinemacode WHERE runningtime >= 156;

#상영시간 156분 이상인 영화들 중 제목에 해리포터 포함
SELECT title, runningTIME FROM movie WHERE runningtime >= (SELECT runningtime FROM movie WHERE title = '이터널스') AND title LIKE "%해리포터%";
