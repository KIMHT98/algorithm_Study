USE board_db;
#오늘 기준 1일 후, 1주일 후, 1달 후 날짜 조회
SELECT DATE(NOW()), date_add(DATE(NOW()),INTERVAL 1 DAY),date_add(DATE(NOW()),INTERVAL 1 Week),date_add(DATE(NOW()),INTERVAL 1 MONTH);

#하루이내 작성된 게시글의 id, title, 작성일
SELECT id, title, created_at FROm article WHERE DATEDIFF( NOW(),created_at) <= 1;

#s날짜를 DATE타입으로 변환
SELECT date_format(STR_TO_DATE("2022년 07월 06일 13시 50분 20초","%Y년 %m월 %d일 %H시 %i분 %s초") ,"%Y-%m-%d %H:%i:%s") 날짜;

#보드 아이디에 따른 게시글 수와 게시글의 총 조회수
SELECT board_id, COUNT(*) 게시글수, SUM(view_cnt) 총조회수 FROM article GROUP BY board_id;

#article에서 게시글을 가장 많이 작성한 user조회해서 comment에서 그 user가 작성항것 조회
SELECT id, user_seq, article_id, content FROM comment WHERE user_seq = 
(SELECT user_seq FROM article GROUP BY user_seq ORDER BY COUNT(*) DESC LIMIT 1);

#article에서 user_seq=1인 user가 작성한 게시글을 조회하고 comment에서 각 게시글들에 달린 댓글의 아이디, 개수 
SELECT article_id, COUNT(*) 댓글개수 
FROM comment 
WHERE article_id in (SELECT id FROM article WHERE user_seq = 1);

#article에서 게시판 별 평균 조회수 null이면 0으로 계산
SELECT board_id, ROUND(AVG(view_cnt),2) FROm article GROUP BY board_id;
SELECT board_id, ROUND(AVG(IFNULL(view_cnt,0)),2) FROm article GROUP BY board_id;

SELECT id,  view_cnt, rank() over(ORDER BY view_cnt DESC) as '순위'
FROM article WHERE '순위' = 1;
SELECT user_seq 
FROM comment 
WHERE article_id = (SELECT id 
FROM(SELECT id, RANK() OVER (ORDER BY view_cnt DESC) as 순위 
FROM article) as a 
WHERE 순위 = 1);

#조회수 가장 큰 게시글 조회하고, 그 게시글에 댓글 단 사용자 조회 / 이름 중간은 *
SELECT id, REPLACE(user_name,substring(user_name,2,char_length(user_name)-2),REPEAT('*',char_length(user_name)-2)) 이름,nickname FROM user
WHERE user_seq in (SELECT user_seq 
FROM comment 
WHERE article_id = (SELECT id 
FROM(SELECT id, RANK() OVER (ORDER BY view_cnt DESC) as 순위 
FROM article) as a 
WHERE 순위 = 1));

#게시판이 작성된 게시글에 첨부파일이 가장 많은 게시판의 id, name
SELECT id, name 
