USE board_db;

#id=1인 게시글 제목, 내요ㅕㅇ
SELECT id , title, content FROM article WHERE board_id = 1;

#제목에 청춘이 포함된 게시글
SELECT id, board_id, title, created_at FROM article WHERE title LIKE "%청춘%";

#조회수가 10이상이 게시글 viewcnt 내림차순
SELECT id, title, content, view_cnt FROM article WHERE view_cnt >= 10 ORDER BY view_cnt DESC;

#조회수 10미만
SELECT id, title, content, ifnull(view_cnt,0) view_cnt FROM article WHERE ifnull(view_cnt,0 )< 10 ORDER BY view_cnt;

#조회수 15이상 
SELECT id, title, view_cnt FROM article WHERE view_cnt>=15;

SELECT 
    id, article_id, content
FROM
    comment
WHERE
    article_id IN (SELECT 
            id
        FROM
                article
            WHERE
                view_cnt >= 15);

#view_cnt내림차수, 상위 5개 항목의 ~를 조회
SELECT id, user_seq, board_id, title, content, view_cnt FROM (SELECT * FROM article ORDER BY view_cnt DESC) a LIMIT 5;

SELECT * FROM file;
#첨부파일이 존재하는 게시글 id 조회 -> article에서 ~를 조회 content null 이면 내용 없음으로 조회
SELECT id, title, IFNULL(content,"내용 없음") as content FROM article WHERE id in (SELECT DISTINCT article_id FROM file);

#id 앞 네글자만 보이고 나머지 *로 하고 user_seq로 오름차순
SELECT user_seq, CONCAT(LEFT(id,4),REPEAT('*',char_length(id)-4)) id FROM user ORDER BY user_seq;

#id와 파일 저장 경로 조회
SELECT id, CONCAT(savefolder,'/',savefile,'/',originfile) as 저장경로 FROM file;