
CREATE TABLE IF NOT EXISTS `person` (
	`id` int PRIMARY KEY AUTO_INCREMENT,
	`name` varchar(10) NOT NULL,
    `birth_year` int NOT NULL,
    `gender` varchar(1) NOT NULL,
    `job` varchar(20) DEFAULT '무직',
    `blood_type` varchar(2) NOT NULL,
    `MBTI` varchar(4)
)ENGINE=InnoDB;

commit;
