CREATE SCHEMA test_movie;
USE test_movie;

DROP TABLE IF EXISTS movie; 

CREATE TABLE `movie` (
	`ID` INT NOT NULL,
    `Title` VARCHAR(40) NOT NULL,
    `ReleaseDate` DATE,
    `RunningTime` INT NOT NULL
    );
ALTER TABLE movie ADD COLUMN `Director` VARCHAR(40) NOT NULL;

ALTER TABLE movie modify column `Director` VARCHAR(32) NULL;

ALTER TABLE movie DROP COLUMN `Director`;

INSERT INTO `movie` (ID, Title, ReleaseDate, RunningTime)
VALUES (1000,'이터널스','2021-11-05',156),
(1001,'트랜스포터','2002-10-02',92),
(1002,'해리포터와 마법사의 돌','2001-12-14',152),
(1003,'해리포터와 비밀의 방','2002-12-14',162),
(1004,'기생충','2019-05-30',153);

UPDATE movie SET title = "해리포터와 불의 잔" WHERE ID = 1003;

DELETE FROM movie WHERE runningtime <= 100;

DELETE FROM movie;

SELECT * FROM movie;