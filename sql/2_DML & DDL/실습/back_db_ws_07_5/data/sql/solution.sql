USE ssafy_board;

#2
UPDATE article
SET content = "내용 없음"
WHERE isnull(content);

SELECT * FROM article WHERE content="내용 없음";

#3
#기존에 에러가 발생한 이유 -> 열의 개수가 맞지 않아서.
#열을 지정하지 않으면 전체 열에 대해서 값을 넣는 것이 된다.
#article에는 11개의 열이 있는데 문제에서는 5개만 넣으려고 했다.
#나머지 열들은 디폴트 값이 있긴 하지만 일부 컬럼의 값만 넣고 싶다면 열을 지정해줘야 한다.
INSERT INTO article (id, user_seq, board_id, title, content)
VALUES(21,10,1,'제목1','내용');

#4
INSERT INTO article (id, user_seq,board_id, title, content)
VALUES(0,12,2,'제목2','내용');

SELECT id FROm article WHERE created_at >= ALL (SELECT created_at FROM article);

INSERT INTO article (user_seq, board_id, title, content)
VALUES (10, 1, '제목1', '내용'),
       (20, 2, '제목2', '내용2');
SELECT * FROM article;
SELECT LAST_INSERT_ID() AS "마지막 입력 id";
ROLLBACK;
#5
-- user-article테이블 외래 키 정의
ALTER TABLE article
ADD CONSTRAINT fk_article_user
FOREIGN KEY (user_seq) REFERENCES user(user_seq);

-- board-article 관계의 외래 키 정의
ALTER TABLE article
ADD CONSTRAINT fk_article_board
FOREIGN KEY(board_id) REFERENCES board(id);

ALTER TABLE comment
ADD CONSTRAINT fk_comment_user
FOREIGN KEY(user_seq) REFERENCES user(user_seq);

ALTER TABLE comment
ADD CONSTRAINT fk_comment_article
FOREIGN KEY(article_id) REFERENCES article(id);

ALTER TABLE file 
ADD CONSTRAINT fk_file_article
FOREIGN KEY (article_id) REFERENCES article(id);

DESC user;
SELECT * FROM user;
INSERT INTO user (user_seq,id,user_pwd,user_name,nickname,email)
VALUES (100,'kht1234',123,'김현태','현타이','kht19684@gmail.com');
#6
#외래키 제약 조건을 해지하던지
#user테이블에 user_seq=100인 데이터를 삽입하던지00
 INSERT INTO article (user_seq,board_id,title,content)
VALUES (100,1,"새로 입력한 글","새로 입력한 글의 내용");

#7
UPDATE article
SET lft = id * 2 -1, rgt = 2*id;
SELECT * FROM article;

UPDATE comment
SET lft = id * 2 -1, rgt = 2*id;
SELECT * FROM comment;

#8
INSERT INTO article (user_seq, board_id,title,content,lft,rgt,depth)
VALUES (3,1,'안녕하세요','반갑습니다',last_insert_id()*2+1,last_insert_id()*2+2,0);
SELECT * FROM article;

#9
CREATE TABLE IF NOT EXISTS article_like(
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    user_user_seq INT NOT NULL,
    article_id INT NOT NULL,
    FOREIGN KEY (user_user_seq) REFERENCES user(user_seq),
	FOREIGN KEY (article_id) REFERENCES article(id),
    CONSTRAINT UNIQUE(user_user_seq, article_id));
    
DESC article_like;

commit;