CREATE TABLE IF NOT EXISTS `person` (
	`id` int PRIMARY KEY AUTO_INCREMENT,
	`name` varchar(10) NOT NULL,
    `birth_year` int NOT NULL,
    `gender` varchar(1) NOT NULL,
    `job` varchar(20) DEFAULT '무직',
    `blood_type` varchar(2) NOT NULL,
    `MBTI` varchar(4),
    `pl` int DEFAULT 0
)ENGINE=InnoDB;

CREATE TABLE programming_language (
	`id` int PRIMARY KEY AUTO_INCREMENT,
	`name` varchar(30) NOT NULL,
    `description` TEXT 
)ENGINE=InnoDB;


COMMIT;