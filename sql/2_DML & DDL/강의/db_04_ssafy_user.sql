# Q1. ssafydb 데이터 베이스 생성 및 사용
CREATE DATABASE IF NOT EXISTS ssafydb;
# Q2. ssafy_user 테이블 생성
CREATE TABLE ssafy_user(
	-- 학번
    user_num INT NOT NULL AUTO_INCREMENT PRIMARY KEY, -- (자동으로 1씩 증가)  
    -- ID
    user_id VARCHAR(20) NOT NULL,
    -- 이름
    user_name VARCHAR(20) NOT NULL,
    -- 비밀번호
    user_password VARCHAR(20) NOT NULL,
    -- email
    user_email VARCHAR(30),
    -- 가입날짜
    signup_data TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
    );
-- 테이블 정보 확인
DESC ssafy_user;
    
# Q3. INSERT 쿼리를 사용해보자.\
-- 모든 컬럼 입력
INSERT INTO ssafy_user
VALUES(1, 'terry', '김현태', '1234', 'terry@gmail.com', NOW());

-- 원하는 컬럼 입력
INSERT INTO ssafy_user (user_id, user_name, user_password)
VALUES ("ssafy" , "KIM", "1234");

-- 여러 개의 데이터 한 번에 넣기
INSERT INTO ssafy_user (user_id, user_name, user_password)
VALUES ("ssafy1" , "KIM1", "1234"),
("ssafy2" , "KIM2", "1234"),
("ssafy3" , "KIM3", "1234"),
("ssafy4" , "KIM4", "1234");
SELECT * FROM ssafy_user;

# Q4. 데이터를 수정해보자
-- 조건에 맞는 것만 변경
UPDATE ssafy_user
SET user_name = "PARK"
WHERE user_name = "KIM1";

-- 모든 것을 변경
UPDATE ssafy_user
SET user_name = 'anonymous';

# Q5. 데이터를 삭제해보자
 -- 조건에 맞는 것 삭제
 DELETE FROM ssafy_user
 WHERE user_num = 4;
 
 -- 모든 것 삭제
 DELETE FROM ssafy_user;

