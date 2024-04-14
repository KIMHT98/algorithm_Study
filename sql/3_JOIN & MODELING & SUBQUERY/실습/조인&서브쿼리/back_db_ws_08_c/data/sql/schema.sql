CREATE TABLE IF NOT EXISTS `ssafy_student` (
	`id` VARCHAR(7) PRIMARY KEY,
	`name` varchar(10) NOT NULL,
    `gender` varchar(2) NOT NULL,
    `campus` varchar(10) NOT NULL,
    `class` int DEFAULT 0,
    `curriculum` int DEFAULT 0,
    `birth_date` varchar(20) NOT NULL,
    `major` varchar(20) NOT NULL,
    `in_ssafy` int DEFAULT 1
)ENGINE=InnoDB;

CREATE TABLE ssafy_curriculum (
	`id` int PRIMARY KEY AUTO_INCREMENT,
	`name` varchar(30) NOT NULL,
    `teacher` varchar(10) NOT NULL
)ENGINE=InnoDB;


COMMIT;