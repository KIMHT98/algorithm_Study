# Q1. ssafy DB를 생성해보자.
CREATE DATABASE IF NOT EXISTS ssafy; 
# Q2. DB 목록을 조회해보자.
SHOW DATABASES;
# Q3. ssafy DB를 사용해보자.
USE ssafy;
-- 명령어 없이 왼쪽 스키마에서 더블클릭해서 사용 가능
# Q4. ssafy DB를 삭제해보자.
DROP DATABASE IF EXISTS ssafy;
# Q5. 문자집합 설정해보자.
ALTER DATABASE ssafy
DEFAULT CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci
-- 이모지 저장 가능!
