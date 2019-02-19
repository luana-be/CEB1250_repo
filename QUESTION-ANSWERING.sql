--create table question (question_id int not null, question longtext not null, primary key (question_id))
--create table answer (answer_id int not null, answer longtext not null, primary key (answer_id), question_id int not null, foreign key (question_id) references question(question_id))
--create table category (category_id int not null, category varchar(100) not null, primary key(category_id))
--create table question_category (question_id int not null, category_id int not null, foreign key (question_id) references question(question_id), foreign key (category_id) references category(category_id))

-- Adminer 4.7.1 MySQL dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

DROP TABLE IF EXISTS `answer`;
CREATE TABLE `answer` (
  `answer_id` int(11) NOT NULL,
  `answer` longtext NOT NULL,
  `question_id` int(11) NOT NULL,
  PRIMARY KEY (`answer_id`),
  KEY `question_id` (`question_id`),
  CONSTRAINT `answer_ibfk_1` FOREIGN KEY (`question_id`) REFERENCES `question` (`question_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `category_id` int(11) NOT NULL,
  `category` varchar(100) NOT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `question`;
CREATE TABLE `question` (
  `question_id` int(11) NOT NULL,
  `question` longtext NOT NULL,
  PRIMARY KEY (`question_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `question_category`;
CREATE TABLE `question_category` (
  `question_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  KEY `question_id` (`question_id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `question_category_ibfk_1` FOREIGN KEY (`question_id`) REFERENCES `question` (`question_id`),
  CONSTRAINT `question_category_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- 2019-02-19 19:09:40