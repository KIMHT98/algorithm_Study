-- DB 제공파일

DROP DATABASE IF exists ssafy_car;

CREATE DATABASE ssafy_car CHARACTER SET=utf8;

USE ssafy_car;

DROP TABLE IF EXISTS car;
DROP TABLE IF EXISTS manufacturer;

CREATE TABLE `car` (
	`vin` varchar(45) NOT NULL PRIMARY KEY,
    `modelname` varchar(40) NOT NULL,
    `date_of_manufacture` date,
    `mileage` int NOT NULL,
    `manufacturer_code` int NOT NULL
)ENGINE=InnoDB;

CREATE TABLE `manufacturer` (
	`code` int NOT NULL PRIMARY KEY,
    `company_name` varchar(40) NOT NULL,
    `nation` varchar(40) NOT NULL
)ENGINE=InnoDB;

