/*
SQLyog Professional v13.1.1 (64 bit)
MySQL - 10.4.32-MariaDB : Database - test
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`test` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `test`;

/*Table structure for table `account` */

DROP TABLE IF EXISTS `account`;

CREATE TABLE `account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `center_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `bank_id` int(11) NOT NULL,
  `amount` decimal(10,0) NOT NULL,
  `transaction_id` varchar(255) DEFAULT NULL,
  `transaction_type` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `account` */

insert  into `account`(`id`,`center_id`,`user_id`,`description`,`bank_id`,`amount`,`transaction_id`,`transaction_type`,`status`,`created_at`,`updated_at`) values 
(1,14,2,'anyone',1,275,'raza33010','debit',1,'2023-06-17 19:41:57','2023-06-17 19:41:57'),
(2,14,2,'anyone',1,275,'raza33010','credit',1,'2023-06-17 19:42:20','2023-06-17 19:42:20'),
(5,14,2,'very good',2,340000,'abcd3020','debit',0,'2023-09-23 19:39:25','2023-09-23 19:39:25');

/*Table structure for table `attendances` */

DROP TABLE IF EXISTS `attendances`;

CREATE TABLE `attendances` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) NOT NULL,
  `admin_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `center_id` int(11) NOT NULL,
  `subject_id` int(11) DEFAULT NULL,
  `class_id` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `student_id` (`student_id`),
  KEY `user_id` (`user_id`),
  KEY `center_id` (`center_id`),
  KEY `subject_id` (`subject_id`),
  KEY `class_id` (`class_id`),
  CONSTRAINT `attendances_ibfk_46` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `attendances_ibfk_47` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `attendances_ibfk_48` FOREIGN KEY (`center_id`) REFERENCES `center` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `attendances_ibfk_49` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `attendances_ibfk_50` FOREIGN KEY (`class_id`) REFERENCES `class` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `attendances` */

insert  into `attendances`(`id`,`student_id`,`admin_id`,`user_id`,`center_id`,`subject_id`,`class_id`,`status`,`createdAt`,`updatedAt`) values 
(1,8,NULL,2,1,1,1,1,'2024-05-31 19:50:41','2024-05-31 19:50:41'),
(2,8,NULL,2,1,1,1,1,'2024-06-01 01:00:00','2024-06-01 01:00:00'),
(3,18,2,NULL,1,NULL,2,1,'2024-06-03 18:52:17','2024-06-03 18:52:17'),
(4,9,2,NULL,1,NULL,2,1,'2024-06-03 18:52:17','2024-06-03 18:52:17'),
(5,21,2,NULL,1,NULL,2,1,'2024-06-03 18:52:17','2024-06-03 18:52:17'),
(6,22,2,NULL,1,NULL,2,1,'2024-06-03 18:52:17','2024-06-03 18:52:17'),
(7,19,2,NULL,1,NULL,2,1,'2024-06-03 18:52:17','2024-06-03 18:52:17'),
(8,20,2,NULL,1,NULL,2,1,'2024-06-03 18:52:17','2024-06-03 18:52:17'),
(9,10,2,NULL,1,NULL,3,1,'2024-06-03 18:52:48','2024-06-03 18:52:48'),
(10,23,2,NULL,1,NULL,3,1,'2024-06-03 18:52:48','2024-06-03 18:52:48'),
(11,24,2,NULL,1,NULL,3,1,'2024-06-03 18:52:48','2024-06-03 18:52:48'),
(12,26,2,NULL,1,NULL,3,1,'2024-06-03 18:52:48','2024-06-03 18:52:48'),
(13,25,2,NULL,1,NULL,3,1,'2024-06-03 18:52:48','2024-06-03 18:52:48'),
(14,27,2,NULL,1,NULL,3,1,'2024-06-03 18:52:48','2024-06-03 18:52:48'),
(15,11,2,NULL,1,NULL,4,1,'2024-06-03 19:24:00','2024-06-03 19:24:00'),
(16,11,NULL,2,1,1,4,1,'2024-06-03 19:24:20','2024-06-03 19:24:20');

/*Table structure for table `bank` */

DROP TABLE IF EXISTS `bank`;

CREATE TABLE `bank` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `center_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `balance` decimal(10,2) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `bank` */

insert  into `bank`(`id`,`center_id`,`name`,`balance`,`status`,`created_at`,`updated_at`) values 
(1,13,'ali hasnain',10500.00,1,'2023-06-27 11:32:04','2023-06-27 11:32:04'),
(2,13,'ali hasnain',10000.00,1,'2023-06-27 11:32:11','2023-06-27 11:32:11');

/*Table structure for table `batch` */

DROP TABLE IF EXISTS `batch`;

CREATE TABLE `batch` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `center_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `batch` */

insert  into `batch`(`id`,`center_id`,`name`,`status`,`created_at`,`updated_at`) values 
(1,2,'Pre_Medical',1,'2023-05-27 01:51:46','2023-11-05 20:58:39'),
(4,14,'C-17',0,'2023-09-23 21:53:16','2023-09-23 21:53:16'),
(5,3,'Computer',0,'2023-11-05 07:51:51','2023-11-05 07:51:51'),
(6,3,'Pre_Engineering',1,'2023-11-05 07:55:40','2023-11-05 07:55:40'),
(7,3,'Biology',1,'2023-11-05 15:58:52','2023-11-05 15:58:52');

/*Table structure for table `cchapter` */

DROP TABLE IF EXISTS `cchapter`;

CREATE TABLE `cchapter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `center_id` int(11) DEFAULT NULL,
  `subject_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `cchapter` */

insert  into `cchapter`(`id`,`center_id`,`subject_id`,`name`,`status`,`created_at`,`updated_at`) values 
(1,13,1,'abbas',0,'2023-06-27 11:38:54','2023-06-27 11:38:54'),
(2,13,1,'abbas',1,'2023-06-27 11:39:01','2023-06-27 11:39:01');

/*Table structure for table `center` */

DROP TABLE IF EXISTS `center`;

CREATE TABLE `center` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `logo` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `address` varchar(255) DEFAULT NULL,
  `phone_no` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `center` */

insert  into `center`(`id`,`name`,`logo`,`status`,`address`,`phone_no`) values 
(1,'Jinnah Campus','download (3).jpg',1,'Hasan Acadmey','01234567899'),
(2,'Iqbal Campus','chap 11.png',1,'YCM','01234567899'),
(3,'DL','chap 5.png',1,'HA Primary Camps','03011111545');

/*Table structure for table `class` */

DROP TABLE IF EXISTS `class`;

CREATE TABLE `class` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `center_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `total_students` int(11) DEFAULT NULL,
  `subjects_id` varchar(11) DEFAULT NULL,
  `status` varchar(50) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `class` */

insert  into `class`(`id`,`center_id`,`name`,`total_students`,`subjects_id`,`status`) values 
(1,1,'IX',24,'2','1'),
(2,1,'X',23,'2','1'),
(3,1,'XI',22,'2','1'),
(4,1,'XII',21,'2','1'),
(10,2,'IX',24,'2','1'),
(11,2,'X',24,'2','1'),
(12,2,'XI',24,'2','1'),
(13,2,'XII',24,'2','1'),
(14,3,'IX',24,'2','1'),
(15,3,'X',24,'2','1'),
(16,3,'XI',24,'2','1'),
(17,3,'XII',24,'2','1');

/*Table structure for table `ctopic` */

DROP TABLE IF EXISTS `ctopic`;

CREATE TABLE `ctopic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `center_id` int(11) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `unit_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `month` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `ctopic` */

insert  into `ctopic`(`id`,`center_id`,`course_id`,`unit_id`,`name`,`month`,`description`,`status`,`created_at`,`updated_at`) values 
(1,13,1,11,'m ali','jan','hi i am abbas raza',1,'2023-06-27 11:44:21','2023-06-27 11:44:21'),
(2,13,1,11,'m ali','jan','hi i am abbas raza',0,'2023-06-27 11:44:29','2023-06-27 11:44:29');

/*Table structure for table `duty` */

DROP TABLE IF EXISTS `duty`;

CREATE TABLE `duty` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `center_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `job` varchar(255) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `duty_time` varchar(225) DEFAULT NULL,
  `assigned_by` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `duty` */

insert  into `duty`(`id`,`center_id`,`user_id`,`job`,`date`,`duty_time`,`assigned_by`,`status`,`created_at`,`updated_at`) values 
(1,13,4,'invagilatior','2023-06-22','14:30:00','hi i am abbas raza zaidi.....',0,'2023-06-27 18:29:07','2023-06-27 18:29:07'),
(2,13,4,'invagilatior','2023-06-22','14:30:00','hi i am abbas raza zaidi.....',1,'2023-06-27 18:29:14','2023-06-27 18:29:14'),
(4,14,2,'Invagilator','2023-08-07',NULL,'Abbas',1,'2023-09-24 15:02:21','2023-09-24 15:02:21'),
(5,14,2,'Invagilator','2023-08-07',NULL,'Abbas',0,'2023-09-24 15:03:39','2023-09-24 15:03:39'),
(6,13,2,'Invagilator','2023-08-18',NULL,'Abbas',1,'2023-09-24 15:05:48','2023-09-24 15:05:48');

/*Table structure for table `examination` */

DROP TABLE IF EXISTS `examination`;

CREATE TABLE `examination` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `center_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  `month` varchar(255) NOT NULL,
  `date` date DEFAULT NULL,
  `total_marks` int(11) DEFAULT NULL,
  `invigilator` varchar(255) DEFAULT NULL,
  `schedule_start_time` varchar(225) DEFAULT NULL,
  `schedule_end_time` varchar(255) DEFAULT NULL,
  `start_time` varchar(255) DEFAULT NULL,
  `end_time` varchar(255) DEFAULT NULL,
  `checking_status` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `examination` */

insert  into `examination`(`id`,`center_id`,`name`,`subject_id`,`type`,`month`,`date`,`total_marks`,`invigilator`,`schedule_start_time`,`schedule_end_time`,`start_time`,`end_time`,`checking_status`,`status`,`created_at`,`updated_at`) values 
(1,11,'tel',2,'monthly','sep','2023-06-05',60,'abbas raza','21:30:00','22:30:00','21:45:00','23:45:00','done',1,'2023-06-17 07:52:12','2023-06-17 08:13:18'),
(4,15,'DL',1,'Module','September','2023-08-07',75,'Abbas','21:30:00','23:30:00','21:00:00','23:00:00','Un done',1,'2023-09-26 15:50:55','2023-09-26 15:50:55');

/*Table structure for table `notification_status` */

DROP TABLE IF EXISTS `notification_status`;

CREATE TABLE `notification_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `center_id` int(11) DEFAULT NULL,
  `notifications_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `seen_status` int(11) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `notification_status` */

/*Table structure for table `result` */

DROP TABLE IF EXISTS `result`;

CREATE TABLE `result` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `center_id` int(11) NOT NULL,
  `exam_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `mark` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `result` */

insert  into `result`(`id`,`center_id`,`exam_id`,`student_id`,`mark`,`status`,`created_at`,`updated_at`) values 
(1,11,1,5,60,1,'2023-06-17 14:03:41','2023-06-17 14:03:41'),
(2,11,1,5,75,1,'2023-06-17 14:06:09','2023-06-17 14:06:09'),
(6,11,1,4,35,0,'2023-09-25 13:45:22','2023-09-25 13:45:22');

/*Table structure for table `rscreen` */

DROP TABLE IF EXISTS `rscreen`;

CREATE TABLE `rscreen` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `center_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `rscreen` */

insert  into `rscreen`(`id`,`center_id`,`name`,`status`,`created_at`,`updated_at`) values 
(1,13,'abbas',1,'2023-06-27 11:20:11','2023-06-27 11:20:11'),
(4,15,'aaon',1,'2023-09-25 19:59:20','2023-09-25 19:59:20');

/*Table structure for table `srecord` */

DROP TABLE IF EXISTS `srecord`;

CREATE TABLE `srecord` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `center_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `file` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `srecord` */

insert  into `srecord`(`id`,`center_id`,`student_id`,`file`,`description`,`date`,`status`,`created_at`,`updated_at`) values 
(1,14,4,'download (3).jpg','anyone','2023-06-18',1,'2023-06-17 21:21:25','2023-06-17 21:21:25'),
(4,15,4,'chemistry ppr key.pdf','very good','2023-08-07',0,'2023-09-25 19:29:45','2023-09-25 19:29:45');

/*Table structure for table `student` */

DROP TABLE IF EXISTS `student`;

CREATE TABLE `student` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `father_name` varchar(255) DEFAULT NULL,
  `father_phone` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `bform` varchar(255) DEFAULT NULL,
  `roll_no` varchar(255) DEFAULT NULL,
  `center_id` int(11) DEFAULT NULL,
  `batch_id` int(11) DEFAULT NULL,
  `class_id` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `student` */

insert  into `student`(`id`,`image`,`name`,`phone`,`father_name`,`father_phone`,`email`,`address`,`bform`,`roll_no`,`center_id`,`batch_id`,`class_id`,`status`) values 
(8,'image1.jpg','John Smith','1234567890','Michael Smith','0987654321','john.smith@example.com','123 Main St, Anytown','ABC12345','001',1,1,1,1),
(9,'image2.jpg','Emily Johnson','1234567891','Daniel Johnson','0987654322','emily.johnson@example.com','456 Elm St, Anytown','DEF67890','002',1,1,2,1),
(10,'image3.jpg','Michael Williams','1234567892','James Williams','0987654323','michael.williams@example.com','789 Oak St, Anytown','GHI23456','003',1,1,3,1),
(11,'image4.jpg','Emma Jones','1234567893','William Jones','0987654324','emma.jones@example.com','321 Pine St, Anytown','JKL78901','004',1,1,4,1),
(12,'image5.jpg','James Brown','1234567894','John Brown','0987654325','james.brown@example.com','654 Cedar St, Anytown','MNO34567','005',1,1,1,1),
(13,'image1.jpg','John Smith','1234567890','Michael Smith','0987654321','john.smith@example.com','123 Main St, Anytown','ABC12345','001',1,1,1,1),
(14,'image2.jpg','Emily Johnson','1234567891','Daniel Johnson','0987654322','emily.johnson@example.com','456 Elm St, Anytown','DEF67890','002',1,1,1,1),
(15,'image3.jpg','Michael Williams','1234567892','James Williams','0987654323','michael.williams@example.com','789 Oak St, Anytown','GHI23456','003',1,1,1,1),
(16,'image4.jpg','Emma Jones','1234567893','William Jones','0987654324','emma.jones@example.com','321 Pine St, Anytown','JKL78901','004',1,1,1,1),
(17,'image5.jpg','James Brown','1234567894','John Brown','0987654325','james.brown@example.com','654 Cedar St, Anytown','MNO34567','005',1,1,1,1),
(18,'image6.jpg','Sarah Miller','1234567895','David Miller','0987654326','sarah.miller@example.com','789 Maple St, Anytown','PQR90123','006',1,1,2,1),
(19,'image7.jpg','Matthew Wilson','1234567896','Christopher Wilson','0987654327','matthew.wilson@example.com','123 Oak St, Anytown','STU45678','007',1,1,2,1),
(20,'image8.jpg','Olivia Taylor','1234567897','Thomas Taylor','0987654328','olivia.taylor@example.com','456 Pine St, Anytown','VWX12345','008',1,1,2,1),
(21,'image9.jpg','Daniel Anderson','1234567898','Andrew Anderson','0987654329','daniel.anderson@example.com','789 Cedar St, Anytown','YZA67890','009',1,1,2,1),
(22,'image10.jpg','Sophia Martinez','1234567899','Jose Martinez','0987654330','sophia.martinez@example.com','321 Elm St, Anytown','BCD23456','010',1,1,2,1),
(23,'image11.jpg','William Hernandez','1234567900','Robert Hernandez','0987654331','william.hernandez@example.com','654 Oak St, Anytown','EFG78901','011',1,1,3,1),
(24,'image12.jpg','Isabella Gonzalez','1234567901','William Gonzalez','0987654332','isabella.gonzalez@example.com','987 Maple St, Anytown','HIJ34567','012',1,1,3,1),
(25,'image13.jpg','Ethan Lewis','1234567902','Edward Lewis','0987654333','ethan.lewis@example.com','654 Pine St, Anytown','KLM90123','013',1,1,3,1),
(26,'image14.jpg','Mia King','1234567903','Richard King','0987654334','mia.king@example.com','321 Cedar St, Anytown','NOP45678','014',1,1,3,1),
(27,'image15.jpg','Alexander Lee','1234567904','Ryan Lee','0987654335','alexander.lee@example.com','789 Elm St, Anytown','QRS12345','015',1,1,3,1);

/*Table structure for table `subject` */

DROP TABLE IF EXISTS `subject`;

CREATE TABLE `subject` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `center_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `user_id` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `subject` */

insert  into `subject`(`id`,`center_id`,`name`,`status`,`user_id`) values 
(1,1,'Physics',1,'2'),
(13,1,'Chemistry',1,'2'),
(14,1,'Maths',1,'2'),
(15,1,'Urdu',1,'2'),
(16,1,'Islamiat',1,'2'),
(17,1,'English',1,'2'),
(18,1,'PST',1,'2'),
(19,1,'Sindhi',1,'2'),
(20,1,'Computer',1,'2'),
(21,1,'Biology',1,'2'),
(22,1,'ATP',1,'2'),
(23,2,'Physics',1,'2'),
(24,2,'Chemistry',1,'2'),
(25,2,'Maths',1,'2'),
(26,2,'Urdu',1,'2'),
(27,2,'Islamiat',1,'2'),
(28,2,'English',1,'2'),
(29,2,'PST',1,'2'),
(30,2,'Sindhi',1,'2'),
(31,2,'Computer',1,'2'),
(32,2,'Biology',1,'2'),
(33,2,'ATP',1,'2'),
(34,3,'Physics',1,'2'),
(35,3,'Chemistry',1,'2'),
(36,3,'Botany',1,'2'),
(37,3,'Urdu',1,'2'),
(38,3,'Islamiat',1,'2'),
(39,3,'English',1,'2'),
(40,3,'PST',1,'2'),
(41,3,'Zology',1,'2'),
(42,3,'MDCAT',1,'2');

/*Table structure for table `teacher` */

DROP TABLE IF EXISTS `teacher`;

CREATE TABLE `teacher` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `center_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `subject_id` (`subject_id`),
  KEY `class_id` (`class_id`),
  CONSTRAINT `teacher_ibfk_473` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `teacher_ibfk_474` FOREIGN KEY (`class_id`) REFERENCES `class` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `teacher` */

insert  into `teacher`(`id`,`center_id`,`user_id`,`subject_id`,`class_id`,`status`) values 
(1,12,1,1,1,0),
(2,13,2,1,1,0),
(5,14,2,1,4,0);

/*Table structure for table `u_role` */

DROP TABLE IF EXISTS `u_role`;

CREATE TABLE `u_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `screen` varchar(50) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `u_role_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `u_role` */

insert  into `u_role`(`id`,`name`,`screen`,`status`,`role_id`) values 
(0,'Super Admin','abcd','0',NULL),
(1,'Admin','Adminstration','0',NULL),
(2,'COO','Adminstration','0',NULL),
(3,'Examination','Adminstration','0',NULL),
(4,'Teacher','Adminstration','0',NULL);

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `center_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT '1',
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `phone_no` varchar(255) DEFAULT NULL,
  `role_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `user` */

insert  into `user`(`id`,`center_id`,`name`,`status`,`email`,`password`,`phone_no`,`role_id`) values 
(1,1,'Raza','1','raza1234@gmail.com','raza123','01234567899','0,2'),
(2,1,'Ali','1','ali1234@gmail.com','ali123','01234567899','1,4');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
