/*
SQLyog Professional
MySQL - 10.4.32-MariaDB : Database - center
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`center` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `center`;

/*Table structure for table `absent_form` */

DROP TABLE IF EXISTS `absent_form`;

CREATE TABLE `absent_form` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `center_id` int(11) DEFAULT NULL,
  `student_id` int(11) DEFAULT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `date` varchar(255) DEFAULT NULL,
  `absent_file` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `absent_form` */

/*Table structure for table `account` */

DROP TABLE IF EXISTS `account`;

CREATE TABLE `account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `center_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `balance` decimal(10,2) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `account` */

insert  into `account`(`id`,`center_id`,`name`,`balance`,`status`,`created_at`,`updated_at`) values 
(1,26,'XYZ Campus Account',5000.00,1,'2024-06-21 15:57:05','2024-06-21 15:57:05');

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
  CONSTRAINT `attendances_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `attendances_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `attendances_ibfk_3` FOREIGN KEY (`center_id`) REFERENCES `center` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `attendances_ibfk_4` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `attendances_ibfk_5` FOREIGN KEY (`class_id`) REFERENCES `class` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `attendances` */

insert  into `attendances`(`id`,`student_id`,`admin_id`,`user_id`,`center_id`,`subject_id`,`class_id`,`status`,`createdAt`,`updatedAt`) values 
(1,9,32,NULL,26,NULL,18,1,'2025-02-27 21:23:03','2025-02-27 21:23:03'),
(2,11,32,NULL,26,NULL,18,1,'2025-02-27 21:23:03','2025-02-27 21:23:03');

/*Table structure for table `batch` */

DROP TABLE IF EXISTS `batch`;

CREATE TABLE `batch` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `center_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `year` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `batch` */

insert  into `batch`(`id`,`center_id`,`name`,`status`,`created_at`,`updated_at`,`year`) values 
(1,1,'C12',1,'2023-05-27 01:51:46','2024-02-21 16:35:13','2015'),
(5,1,'C13',0,'2023-11-05 07:51:51','2024-02-21 16:35:18','2016'),
(6,1,'C14',1,'2023-11-05 07:55:40','2024-02-27 14:51:14','2017'),
(7,1,'C15',1,'2023-11-05 15:58:52','2024-02-27 14:51:18','2018'),
(8,26,'C-21',1,'2024-06-21 17:35:32','2024-06-21 17:44:13','2023'),
(9,26,'C-22',1,'2024-06-21 17:35:39','2024-06-21 17:44:23','2024');

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `cchapter` */

insert  into `cchapter`(`id`,`center_id`,`subject_id`,`name`,`status`,`created_at`,`updated_at`) values 
(2,1,13,'abbas',1,'2023-06-27 11:39:01','2024-04-24 20:44:41'),
(4,1,13,'Thermodynamics',1,'2024-04-24 17:23:43','2024-04-24 17:23:43'),
(5,1,13,'Vector',0,'2024-04-24 17:26:13','2024-04-24 17:46:26');

/*Table structure for table `center` */

DROP TABLE IF EXISTS `center`;

CREATE TABLE `center` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `logo` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `address` varchar(255) DEFAULT NULL,
  `phone_no` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `center` */

insert  into `center`(`id`,`name`,`logo`,`status`,`created_at`,`updated_at`,`address`,`phone_no`) values 
(1,'Jinnah Campus','download (3).jpg',1,'2023-05-05 21:43:16','2023-10-02 11:19:50','Hasan Acadmey','02134185108'),
(2,'Iqbal Campus','chap 11.png',1,'2023-05-05 21:43:16','2023-10-02 11:20:45','YCM','03452687541'),
(3,'DL','chap 5.png',1,'2023-05-05 21:47:43','2023-10-02 11:21:04','HA Primary Camps','03011111545'),
(26,'XYZ campus','AKU fee slip.pdf',1,'2024-05-27 14:55:48','2024-05-27 14:55:48','XYZ Karachi','03073077069');

/*Table structure for table `class` */

DROP TABLE IF EXISTS `class`;

CREATE TABLE `class` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `center_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `total_students` int(11) DEFAULT NULL,
  `subjects_id` varchar(255) DEFAULT NULL,
  `status` varchar(50) DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `class` */

insert  into `class`(`id`,`center_id`,`name`,`total_students`,`subjects_id`,`status`,`created_at`,`updated_at`) values 
(1,1,'IX',24,'2,13,14,15,16,17,21,20','1','2023-05-10 11:05:11','2024-02-04 15:44:20'),
(2,1,'X',23,'2,13,14,17,18,19,20,21','1','2023-09-23 22:59:15','2024-02-04 15:45:21'),
(3,1,'XI',22,'2,13,14,15,16,17,22','1','2023-09-23 22:59:15','2024-02-04 15:45:53'),
(4,1,'XII',21,'2,13,14,17,18,15,22','1','2023-09-23 22:59:15','2024-02-04 15:46:23'),
(10,2,'IX',24,'24,25,23,26,27,28,31,32','1','2023-11-13 23:48:52','2023-11-14 10:17:24'),
(11,2,'X',24,'2,24,25,28,29,30,31,32','1','2023-11-13 23:48:52','2023-11-14 11:53:27'),
(12,2,'XI',24,'2','1','2023-11-13 23:48:52','2023-11-13 23:48:52'),
(13,2,'XII',24,'2','1','2023-11-13 23:48:52','2023-11-13 23:48:52'),
(14,3,'IX',24,'2','1','2023-11-13 23:48:52','2023-11-13 23:48:52'),
(15,3,'X',24,'2','1','2023-11-13 23:48:52','2023-11-13 23:48:52'),
(16,3,'XI',24,'2','1','2023-11-13 23:48:52','2023-11-13 23:48:52'),
(17,3,'XII',24,'2','1','2023-11-13 23:48:52','2023-11-13 23:48:52'),
(18,26,'IX',24,'43,44,49,48,47,46,45','1','2024-06-20 15:21:21','2024-06-21 18:13:29'),
(19,26,'X',25,'45,46','1','2024-06-20 15:42:55','2024-06-20 15:42:55');

/*Table structure for table `ctopic` */

DROP TABLE IF EXISTS `ctopic`;

CREATE TABLE `ctopic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `center_id` int(11) DEFAULT NULL,
  `chapter_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `month` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `ctopic` */

insert  into `ctopic`(`id`,`center_id`,`chapter_id`,`name`,`month`,`description`,`status`,`created_at`,`updated_at`) values 
(1,1,2,'m ali','jan','hi i am abbas raza',1,'2023-06-27 11:44:21','2024-04-27 17:42:33'),
(2,13,1,'m ali','jan','hi i am abbas raza',0,'2023-06-27 11:44:29','2023-06-27 11:44:29'),
(4,1,2,'Introduction To Equilibrium Constant','2024-04','None',1,'2024-04-27 13:08:18','2024-04-27 13:53:55');

/*Table structure for table `duty` */

DROP TABLE IF EXISTS `duty`;

CREATE TABLE `duty` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `center_id` int(11) DEFAULT NULL,
  `user_id` char(255) DEFAULT NULL,
  `job` varchar(255) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `duty_time` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `duty` */

insert  into `duty`(`id`,`center_id`,`user_id`,`job`,`date`,`duty_time`,`description`,`status`,`created_at`,`updated_at`) values 
(1,1,'4','invagilatior','2023-06-22','14:30:00','hi i am abbas raza zaidi.....',0,'2023-06-27 18:29:07','2024-02-16 15:19:46'),
(2,13,'4','invagilatior','2023-06-22','14:30:00','hi i am abbas raza zaidi.....',1,'2023-06-27 18:29:14','2023-06-27 18:29:14'),
(4,2,'2','Invagilator','2023-08-07',NULL,'Abbas',1,'2023-09-24 15:02:21','2024-02-16 15:19:57'),
(5,1,'2','Invagilator','2023-08-07',NULL,'Abbas',0,'2023-09-24 15:03:39','2024-02-16 15:19:52'),
(6,13,'2','Invagilator','2023-08-18',NULL,'Abbas',1,'2023-09-24 15:05:48','2023-09-24 15:05:48'),
(7,1,'28','Invagilator','2024-02-22',NULL,'very good',1,'2024-02-16 10:55:16','2024-02-16 10:55:16'),
(8,1,'27','Invagilator','2024-02-24',NULL,'refreshment any',1,'2024-02-16 11:07:18','2024-02-16 11:07:18'),
(9,1,'28','Invagilator','2024-02-20','20:26','anyone',0,'2024-02-16 11:10:27','2024-02-16 12:23:24'),
(10,1,'28','Invagilator','2024-02-22',NULL,'refreshment',1,'2024-02-16 11:13:19','2024-02-16 11:13:19'),
(11,1,'27','non','2024-02-22','21:31','refreshment ',1,'2024-02-16 11:53:33','2024-02-16 12:27:06'),
(12,1,'27','anyne','2024-02-21','12:00','very good',1,'2024-02-16 11:57:13','2024-02-16 12:21:15'),
(13,1,'27,28','Conduction Head','2024-02-20','03:45','anyone',1,'2024-02-16 19:45:26','2024-02-16 19:54:56');

/*Table structure for table `examination` */

DROP TABLE IF EXISTS `examination`;

CREATE TABLE `examination` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `center_id` int(11) NOT NULL,
  `class_id` int(11) DEFAULT NULL,
  `subject_id` int(11) NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  `month` varchar(255) NOT NULL,
  `date` date DEFAULT NULL,
  `total_marks` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `schedule_start_time` varchar(225) DEFAULT NULL,
  `schedule_end_time` varchar(255) DEFAULT NULL,
  `start_time` varchar(255) DEFAULT NULL,
  `end_time` varchar(255) DEFAULT NULL,
  `checking_status` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `file` varchar(255) DEFAULT NULL,
  `duration` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `examination` */

insert  into `examination`(`id`,`center_id`,`class_id`,`subject_id`,`type`,`month`,`date`,`total_marks`,`user_id`,`schedule_start_time`,`schedule_end_time`,`start_time`,`end_time`,`checking_status`,`status`,`created_at`,`updated_at`,`file`,`duration`) values 
(1,1,1,2,'monthly','sep','2023-06-05',60,28,'21:30:00','22:30:00','21:45:00','23:45:00','done',1,'2023-06-17 07:52:12','2024-02-05 23:08:50',NULL,NULL),
(4,1,2,2,'Module','2024-06','2024-02-14',75,28,'21:30:00','23:30:00','21:00:00','23:00:00','Un done',1,'2023-09-26 15:50:55','2024-02-16 17:24:28',NULL,'3hr'),
(5,1,4,2,'Module','2024-02','2024-02-04',75,27,'20:35','22:35','20:35','22:35','Un done',1,'2024-02-04 15:35:30','2024-02-04 22:08:07','4.docx new.pdf',NULL),
(6,1,3,18,'Mock','2024-02','2024-02-14',75,28,'14:32','14:37','14:36','14:56','Done',1,'2024-02-05 09:31:48','2024-02-05 17:27:55',NULL,NULL),
(7,1,4,18,'Module-2','2024-08','2024-02-28',70,28,'22:35','13:35','12:35','14:36','Done',1,'2024-02-05 17:36:06','2024-02-05 17:36:06','urdu tabsira.pdf',NULL),
(8,1,3,17,'Module-2','2024-02','2024-02-21',70,28,'15:30','17:30','13:30','15:30','Not Done',1,'2024-02-16 17:30:27','2024-02-16 17:30:27','PS # 01 Searching.pdf','2hr'),
(9,26,18,46,'Monthly','2024-07','2024-07-04',30,37,'16:00','17:00','16:00','17:00','Not Done',1,'2024-07-02 07:20:10','2024-07-02 07:20:10','CamScanner 04-25-2024 23.53.pdf','1hr');

/*Table structure for table `expense` */

DROP TABLE IF EXISTS `expense`;

CREATE TABLE `expense` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `account_id` int(11) DEFAULT NULL,
  `transaction_id` int(11) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status` int(11) DEFAULT 0,
  `amount` int(11) DEFAULT NULL,
  `balance` int(11) DEFAULT NULL,
  `center_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `expense` */

insert  into `expense`(`id`,`user_id`,`account_id`,`transaction_id`,`description`,`created_at`,`updated_at`,`status`,`amount`,`balance`,`center_id`) values 
(1,27,1,1,'refreshment any','2024-02-10 10:27:43','2024-02-16 09:02:42',1,400,351200,1),
(2,28,1,2,'refreshment any','2024-02-10 10:50:43','2024-02-16 08:55:35',1,300,352000,1),
(3,1,1,2,'Fine','2024-05-12 12:31:37','2024-05-12 12:31:37',1,500,351700,1);

/*Table structure for table `fees_form` */

DROP TABLE IF EXISTS `fees_form`;

CREATE TABLE `fees_form` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `center_id` int(11) DEFAULT NULL,
  `student_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `amount_type` varchar(50) DEFAULT NULL,
  `slip_image` varchar(255) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `date` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `fees_form` */

insert  into `fees_form`(`id`,`center_id`,`student_id`,`user_id`,`amount`,`amount_type`,`slip_image`,`status`,`created_at`,`updated_at`,`date`,`description`) values 
(1,1,4,1,500.00,'Fine','bill march.pdf','1','2024-05-12 12:31:37','2024-05-12 12:31:37','2024-05-12','July Fine');

/*Table structure for table `group` */

DROP TABLE IF EXISTS `group`;

CREATE TABLE `group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `center_id` int(11) NOT NULL,
  `batch_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `subject_id` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `class_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `group` */

insert  into `group`(`id`,`center_id`,`batch_id`,`name`,`subject_id`,`status`,`created_at`,`updated_at`,`class_id`) values 
(1,1,1,'Computer','2,13,14,15,16,17,20',1,'2024-02-21 17:41:36','2024-02-23 17:50:50',1),
(2,1,1,'Biology','2,13,14,15,16,17,21',0,'2024-02-21 17:41:36','2024-02-27 14:08:08',1),
(3,1,5,'Computer','2,13,14,18,19,17,20',1,'2024-02-21 17:41:36','2024-02-23 17:50:57',2),
(4,1,5,'Biology','2,13,14,18,19,17,21',0,'2024-02-21 17:41:36','2024-02-23 17:51:01',2),
(5,1,6,'PreMedical','2,13,16,15,17,21',1,'2024-02-27 09:52:47','2024-02-27 10:34:26',3),
(6,26,9,'Biology','43,44',1,'2024-06-21 18:10:15','2024-06-21 18:10:15',18);

/*Table structure for table `leave_form` */

DROP TABLE IF EXISTS `leave_form`;

CREATE TABLE `leave_form` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `center_id` int(11) DEFAULT NULL,
  `student_id` int(11) DEFAULT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `start_date_time` varchar(255) DEFAULT NULL,
  `end_date_time` varchar(255) DEFAULT NULL,
  `leave_file` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `Status` int(11) DEFAULT NULL,
  `Updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `Created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `leave_form` */

insert  into `leave_form`(`id`,`center_id`,`student_id`,`reason`,`start_date_time`,`end_date_time`,`leave_file`,`user_id`,`type`,`Status`,`Updated_at`,`Created_at`) values 
(1,1,1,'shaddi attend at hyderabad','2024-03-05T14:08','2024-03-08T14:08','New Doc 09-26-2023 21.46.pdf',2,1,1,'2024-03-04 14:46:37','2024-03-04 09:07:14'),
(2,0,1,'IN fever','2024-05-06T16:00','2024-05-06T18:30','Maths10.pdf',1,0,1,'2024-05-06 14:40:42','2024-05-06 08:27:10'),
(3,0,1,'IN fever','2024-05-06T16:00','2024-05-06T18:40','Maths10.pdf',1,0,1,'2024-05-06 14:40:47','2024-05-06 08:27:10');

/*Table structure for table `lform` */

DROP TABLE IF EXISTS `lform`;

CREATE TABLE `lform` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `center_id` int(11) DEFAULT NULL,
  `student_id` int(11) DEFAULT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `time` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `Status` int(11) DEFAULT NULL,
  `Updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `Created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `lform` */

insert  into `lform`(`id`,`center_id`,`student_id`,`reason`,`time`,`user_id`,`Status`,`Updated_at`,`Created_at`,`date`) values 
(1,1,1,'eating lunch','16:06',2,1,'2024-03-02 12:05:29','2024-02-28 10:55:47','2024-02-29'),
(2,1,1,'finding shoes','16:05',2,1,'2024-02-28 10:57:20','2024-02-28 10:57:20','2024-02-29'),
(3,1,1,'gone with mother for market','16:15',2,1,'2024-02-28 10:57:20','2024-02-28 10:57:20','2024-02-27'),
(4,1,1,'eating lunch','2024-03-04T11:42',2,1,'2024-03-02 12:05:29','2024-03-02 12:05:29','2024-03-05'),
(5,1,1,'shaddi attend at hyderabad',NULL,2,1,'2024-03-04 08:59:51','2024-03-04 08:59:51',NULL),
(6,1,1,'shaddi attend at hyderabad',NULL,2,1,'2024-03-04 08:59:51','2024-03-04 08:59:51',NULL);

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

/*Table structure for table `results` */

DROP TABLE IF EXISTS `results`;

CREATE TABLE `results` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `center_id` int(11) DEFAULT NULL,
  `examination_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `teacher_id` int(11) DEFAULT NULL,
  `student_id` int(11) DEFAULT NULL,
  `subject_id` int(11) DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  `percentage` decimal(5,2) DEFAULT NULL,
  `grade` varchar(255) DEFAULT NULL,
  `remarks` varchar(20) DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  `class_id` int(11) DEFAULT NULL,
  `month` varchar(10) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status` int(11) DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `results` */

insert  into `results`(`id`,`center_id`,`examination_id`,`user_id`,`teacher_id`,`student_id`,`subject_id`,`number`,`percentage`,`grade`,`remarks`,`total`,`class_id`,`month`,`created_at`,`updated_at`,`status`) values 
(1,1,4,2,26,7,2,30,40.00,'D','Need Improvement',75,2,'2024-06','2024-04-17 17:15:09','2024-04-20 19:59:15',1),
(2,1,4,2,26,8,2,54,72.00,'A','Very Good',75,2,'2024-07','2024-04-17 17:19:49','2024-07-30 22:40:23',1),
(3,1,4,2,26,5,2,65,86.67,'A+','Excellent',75,2,'2024-06','2024-04-20 13:59:22','2024-04-20 14:00:56',1),
(4,26,9,34,38,9,46,30,100.00,'A+','Marvelous',30,18,'2024-07','2024-07-02 07:24:27','0000-00-00 00:00:00',2024),
(5,1,9,34,38,7,46,23,76.67,'A','Very Good',30,2,'2024-07','2024-07-02 07:24:38','2024-07-31 00:08:46',2024);

/*Table structure for table `rscreen` */

DROP TABLE IF EXISTS `rscreen`;

CREATE TABLE `rscreen` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `center_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `slug` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `rscreen` */

insert  into `rscreen`(`id`,`center_id`,`name`,`status`,`created_at`,`updated_at`,`slug`) values 
(1,1,'User Listing',1,'2023-06-27 11:20:11','2024-05-03 20:26:58','User-Listing'),
(4,1,'User Edit',1,'2023-09-25 19:59:20','2024-05-04 16:11:31','User-Edit'),
(5,1,'User New',1,'2024-04-27 15:38:34','2024-05-03 20:27:48','User-New'),
(6,1,'User Single',0,'2024-04-27 15:40:31','2024-05-03 20:29:04','User-Single'),
(7,1,'Center Listing',1,'2024-05-04 11:12:09','2024-05-04 19:05:12','Center-Listing'),
(8,1,'Center New',1,'2024-05-04 11:12:22','2024-05-04 19:04:51','Center-New'),
(9,1,'Center Single',1,'2024-05-04 11:12:36','2024-05-04 19:04:40','Center-Single'),
(10,1,'Center Edit',1,'2024-05-04 11:12:51','2024-05-04 19:04:31','Center-Edit'),
(11,1,'Coo Listing',1,'2024-05-04 14:00:10','2024-05-04 19:04:22','Coo-Listing'),
(12,1,'Coo New',1,'2024-05-04 14:00:24','2024-05-04 19:04:16','Coo-New'),
(13,1,'Coo Single',1,'2024-05-04 14:00:48','2024-05-04 19:04:04','Coo-Single'),
(14,1,'Coo Edit',1,'2024-05-04 14:01:01','2024-05-04 19:03:54','Coo-Edit'),
(15,1,'Account Listing',1,'2024-05-04 14:01:01','2024-05-04 19:03:54','Account-Listing'),
(16,1,'Account New',1,'2024-05-04 14:00:24','2024-05-04 19:04:16','Account-New'),
(17,1,'Account Single',1,'2024-05-04 14:00:48','2024-05-04 19:04:04','Account-Single'),
(18,1,'Account Edit',1,'2024-05-04 14:01:01','2024-05-04 19:03:54','Account-Edit'),
(19,1,'Expense Listing',1,'2024-05-04 14:00:10','2024-05-04 19:04:22','Expense-Listing'),
(20,1,'Expense New',1,'2024-05-04 14:00:24','2024-05-04 19:04:16','Expense-New'),
(21,1,'Expense Single',1,'2024-05-04 14:00:48','2024-05-04 19:04:04','Expense-Single'),
(22,1,'Expense Edit',1,'2024-05-04 14:01:01','2024-05-04 19:03:54','Expense-Edit'),
(23,1,'Batch Listing',1,'2024-05-04 14:01:01','2024-05-04 19:03:54','Batch-Listing'),
(24,1,'Batch New',1,'2024-05-04 14:00:24','2024-05-04 19:04:16','Batch-New'),
(25,1,'Batch Single',1,'2024-05-04 14:00:48','2024-05-04 19:04:04','Batch-Single'),
(26,1,'Batch Edit',1,'2024-05-04 14:01:01','2024-05-04 19:03:54','Batch-Edit'),
(27,1,'Group Listing',1,'2024-05-04 14:00:10','2024-05-04 19:04:22','Group-Listing'),
(28,1,'Group New',1,'2024-05-04 14:00:24','2024-05-04 19:04:16','Group-New'),
(29,1,'Group Single',1,'2024-05-04 14:00:48','2024-05-04 19:04:04','Group-Single'),
(30,1,'Group Edit',1,'2024-05-04 14:01:01','2024-05-04 19:03:54','Group-Edit'),
(31,1,'Class Listing',1,'2024-05-04 14:01:01','2024-05-04 19:03:54','Class-Listing'),
(32,1,'Class New',1,'2024-05-04 14:00:24','2024-05-04 19:04:16','Class-New'),
(33,1,'Class Single',1,'2024-05-04 14:00:48','2024-05-04 19:04:04','Class-Single'),
(34,1,'Class Edit',1,'2024-05-04 14:01:01','2024-05-04 19:03:54','Class-Edit'),
(35,1,'Timetable Listing',1,'2024-05-04 14:01:01','2024-05-04 19:03:54','Timetable-Listing'),
(36,1,'Timetable New',1,'2024-05-04 14:00:24','2024-05-04 19:04:16','Timetable-New'),
(37,1,'Timetable Single',1,'2024-05-04 14:00:48','2024-05-04 19:04:04','Timetable-Single'),
(38,1,'Timetable Edit',1,'2024-05-04 14:01:01','2024-05-04 19:03:54','Timetable-Edit'),
(39,1,'Teacherattendance Listing',1,'2024-05-04 14:01:01','2024-05-04 19:03:54','Teacherattendance-Listing'),
(40,1,'Teacherattendance New',1,'2024-05-04 14:00:24','2024-05-04 19:04:16','Teacherattendance-New'),
(41,1,'Teacherattendance Single',1,'2024-05-04 14:00:48','2024-05-04 19:04:04','Teacherattendance-Single'),
(42,1,'Teacherattendance Edit',1,'2024-05-04 14:01:01','2024-05-04 19:03:54','Teacherattendance-Edit'),
(43,1,'Duty Listing',1,'2024-05-04 14:01:01','2024-05-04 19:03:54','Duty-Listing'),
(44,1,'Duty New',1,'2024-05-04 14:00:24','2024-05-04 19:04:16','Duty-New'),
(45,1,'Duty Single',1,'2024-05-04 14:00:48','2024-05-04 19:04:04','Duty-Single'),
(46,1,'Duty Edit',1,'2024-05-04 14:01:01','2024-05-04 19:03:54','Duty-Edit'),
(47,1,'Student Listing',1,'2024-05-04 14:01:01','2024-05-04 19:03:54','Student-Listing'),
(48,1,'Student New',1,'2024-05-04 14:00:24','2024-05-04 19:04:16','Student-New'),
(49,1,'Student Single',1,'2024-05-04 14:00:48','2024-05-04 19:04:04','Student-Single'),
(50,1,'Student Edit',1,'2024-05-04 14:01:01','2024-05-04 19:03:54','Student-Edit'),
(51,1,'Subject Listing',1,'2024-05-04 14:01:01','2024-05-04 19:03:54','Subject-Listing'),
(52,1,'Subject New',1,'2024-05-04 14:00:24','2024-05-04 19:04:16','Subject-New'),
(53,1,'Subject Single',1,'2024-05-04 14:00:48','2024-05-04 19:04:04','Subject-Single'),
(54,1,'Subject Edit',1,'2024-05-04 14:01:01','2024-05-04 19:03:54','Subject-Edit'),
(55,1,'Teacher Listing',1,'2024-05-04 14:01:01','2024-05-04 19:03:54','Teacher-Listing'),
(56,1,'Teacher New',1,'2024-05-04 14:00:24','2024-05-04 19:04:16','Teacher-New'),
(57,1,'Teacher Single',1,'2024-05-04 14:00:48','2024-05-04 19:04:04','Teacher-Single'),
(58,1,'Teacher Edit',1,'2024-05-04 14:01:01','2024-05-04 19:03:54','Teacher-Edit'),
(59,1,'Examination Listing',1,'2024-05-04 14:01:01','2024-05-04 19:03:54','Examination-Listing'),
(60,1,'Examination New',1,'2024-05-04 14:00:24','2024-05-04 19:04:16','Examination-New'),
(61,1,'Examination Single',1,'2024-05-04 14:00:48','2024-05-04 19:04:04','Examination-Single'),
(62,1,'Examination Edit',1,'2024-05-04 14:01:01','2024-05-04 19:03:54','Examination-Edit'),
(63,1,'Lateform Listing',1,'2024-05-04 14:01:01','2024-05-04 19:03:54','Lateform-Listing'),
(64,1,'Lateform New',1,'2024-05-04 14:00:24','2024-05-04 19:04:16','Lateform-New'),
(65,1,'Lateform Single',1,'2024-05-04 14:00:48','2024-05-04 19:04:04','Lateform-Single'),
(66,1,'Lateform Edit',1,'2024-05-04 14:01:01','2024-05-04 19:03:54','Lateform-Edit'),
(67,1,'Leaveform Listing',1,'2024-05-04 14:01:01','2024-05-04 19:03:54','Leaveform-Listing'),
(68,1,'Leaveform New',1,'2024-05-04 14:00:24','2024-05-04 19:04:16','Leaveform-New'),
(69,1,'Leaveform Single',1,'2024-05-04 14:00:48','2024-05-04 19:04:04','Leaveform-Single'),
(70,1,'Leaveform Edit',1,'2024-05-04 14:01:01','2024-05-04 19:03:54','Leaveform-Edit'),
(71,1,'Absentform Listing',1,'2024-05-04 14:01:01','2024-05-04 19:03:54','Absentform-Listing'),
(72,1,'Absentform New',1,'2024-05-04 14:00:24','2024-05-04 19:04:16','Absentform-New'),
(73,1,'Absentform Single',1,'2024-05-04 14:00:48','2024-05-04 19:04:04','Absentform-Single'),
(74,1,'Absentform Edit',1,'2024-05-04 14:01:01','2024-05-04 19:03:54','Absentform-Edit'),
(75,1,'Halfleaveform Listing',1,'2024-05-04 14:01:01','2024-05-04 19:03:54','Halfleaveform-Listing'),
(76,1,'Halfleaveform New',1,'2024-05-04 14:00:24','2024-05-04 19:04:16','Halfleaveform-New'),
(77,1,'Halfleaveform Single',1,'2024-05-04 14:00:48','2024-05-04 19:04:04','Halfleaveform-Single'),
(78,1,'Halfleaveform Edit',1,'2024-05-04 14:01:01','2024-05-04 19:03:54','Halfleaveform-Edit'),
(79,1,'Coursechapter Listing',1,'2024-05-04 14:01:01','2024-05-04 19:03:54','Coursechapter-Listing'),
(80,1,'Coursechapter New',1,'2024-05-04 14:00:24','2024-05-04 19:04:16','Coursechapter-New'),
(81,1,'Coursechapter Single',1,'2024-05-04 14:00:48','2024-05-04 19:04:04','Coursechapter-Single'),
(82,1,'Coursechapter Edit',1,'2024-05-04 14:01:01','2024-05-04 19:03:54','Coursechapter-Edit'),
(83,1,'Unit Listing',1,'2024-05-04 14:01:01','2024-05-04 19:03:54','Unit-Listing'),
(84,1,'Unit New',1,'2024-05-04 14:00:24','2024-05-04 19:04:16','Unit-New'),
(85,1,'Unit Single',1,'2024-05-04 14:00:48','2024-05-04 19:04:04','Unit-Single'),
(86,1,'Unit Edit',1,'2024-05-04 14:01:01','2024-05-04 19:03:54','Unit-Edit'),
(87,1,'Rolescreen Listing',1,'2024-05-04 14:01:01','2024-05-04 19:03:54','Rolescreen-Listing'),
(88,1,'Rolescreen New',1,'2024-05-04 14:00:24','2024-05-04 19:04:16','Rolescreen-New'),
(89,1,'Rolescreen Single',1,'2024-05-04 14:00:48','2024-05-04 19:04:04','Rolescreen-Single'),
(90,1,'Rolescreen Edit',1,'2024-05-04 14:01:01','2024-05-04 19:03:54','Rolescreen-Edit'),
(91,1,'Userrole Listing',1,'2024-05-04 14:01:01','2024-05-04 19:03:54','Userrole-Listing'),
(92,1,'Userrole New',1,'2024-05-04 14:00:24','2024-05-04 19:04:16','Userrole-New'),
(93,1,'Userrole Single',1,'2024-05-04 14:00:48','2024-05-04 19:04:04','Userrole-Single'),
(94,1,'Userrole Edit',1,'2024-05-04 14:01:01','2024-05-04 19:03:54','Userrole-Edit'),
(95,1,'Awardlist Listing',1,'2024-05-04 14:00:48','2024-05-04 19:04:04','Awardlist-Listing'),
(96,1,'Awardlist Addnumbers',1,'2024-05-04 14:01:01','2024-05-04 19:03:54','Awardlist-Addnumber');

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
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `group_id` int(11) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `ref_name` varchar(255) DEFAULT NULL,
  `ref_phone_no` varchar(255) DEFAULT NULL,
  `last_class` varchar(255) DEFAULT NULL,
  `last_grade` varchar(255) DEFAULT NULL,
  `percentage` int(11) DEFAULT NULL,
  `marksheet` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `student` */

insert  into `student`(`id`,`image`,`name`,`phone`,`father_name`,`father_phone`,`email`,`address`,`bform`,`roll_no`,`center_id`,`batch_id`,`class_id`,`status`,`created_at`,`updated_at`,`group_id`,`description`,`ref_name`,`ref_phone_no`,`last_class`,`last_grade`,`percentage`,`marksheet`) values 
(1,'uploads/image and bform/chap 6.jpg','abbas','03452627543','raza','03156789423','raza33010@gmail.com','xyz','uploads/image and bform/Novorésumé.pdf','7',1,1,1,0,'2023-05-30 17:29:22','2024-02-21 19:24:10',1,NULL,'Abbas','03073333444','VIII','A',75,NULL),
(4,'download (4).jpg','ahmed','03452627543','syed','03156789423','syed010@gmal.com','abcd','Novorésumé.pdf','7',1,1,1,1,'2023-05-30 17:46:31','2024-02-21 19:24:13',2,NULL,'Hasnain',NULL,'VIII','A+',89,NULL),
(5,'uploads/image and bform/download (4).jpg','ahmed','03452627543','syed','03156789423','syed010@gmal.com','abcd','uploads/image and bform/Novorésumé.pdf','7',1,5,2,1,'2023-05-30 17:48:41','2024-02-21 19:24:16',3,NULL,'Jawwad',NULL,'IX','B',68,NULL),
(7,'chap 2.jpg','abbas','03073077059','Syed','03456677881','useradmin@gmail.com','House No: 160/110 Survey No: 417 Jaffer Tayyar Housing Society Malir','chemistry ppr key.pdf','E15-14',1,5,2,1,'2023-09-25 05:23:14','2024-02-21 19:24:19',4,NULL,'Ali',NULL,'IX','A',79,NULL),
(8,'urdu tabsira.pdf','Hasseb','03473701693','Syed','03456677881','useradmin@gmail.com','zdz','4.docx new.pdf','(\'C13\',)-(7,)',1,5,2,1,'2024-02-23 13:11:10','2024-02-23 13:11:10',3,'very good','Abbas C15','03452627531','undefined','undefined',76,'Chapter^N05 new.pdf'),
(9,'AbbasDeveloperCV.pdf','Hussain','03473701693','Abbas','03456677881','Hussain@gmail.com','House No: 160/110 Survey No: 417 Jaffer Tayyar Housing Society Malir','AbbasDeveloperCV.pdf','(\'C-22\',)-(8,)',26,9,18,1,'2024-06-21 19:01:30','2024-06-21 19:01:30',6,'very good','Abbas C15','03452627531','undefined','undefined',66,'AbbasDeveloperCV.pdf'),
(10,'Maths10.pdf','Jawwad','03073077059','Syed Faraz Raza Zaidi','03456677881','Jawwad@gmail.com','H.No 207A JTCHS, Malir','Maths10.pdf','(\'C-22\',)-(9,)',26,9,19,1,'2024-06-21 19:03:26','2024-06-21 19:03:26',6,'refreshment ','Abbas C15','03452627531','undefined','undefined',85,'Maths10.pdf'),
(11,'CamScanner 04-25-2024 23.53.pdf','Syed Minhal Rizvi','03073077059','Munawar Hassan','03456677881','mr.muzammilh79@gmail.com','HNO R-333 Ghazi Town Phase 1','CamScanner 04-25-2024 23.53.pdf','(\'C-22\',)-(10,)',26,9,18,1,'2024-07-02 07:08:28','2024-07-02 07:08:28',6,'very good','Abbas C15','03452627531','VIII','A',76,'CamScanner 04-25-2024 23.53.pdf');

/*Table structure for table `subject` */

DROP TABLE IF EXISTS `subject`;

CREATE TABLE `subject` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `center_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `user_id` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `subject` */

insert  into `subject`(`id`,`center_id`,`name`,`status`,`created_at`,`updated_at`,`user_id`) values 
(2,1,'Physics',1,'2023-11-14 00:01:10','2024-03-17 17:08:15','24'),
(13,1,'Chemistry',1,'2023-11-14 00:01:10','2024-03-17 17:08:20','26'),
(14,1,'Maths',1,'2023-11-14 00:01:10','2024-03-17 17:08:24','27'),
(15,1,'Urdu',1,'2023-11-14 00:01:10','2024-03-17 17:08:27','28'),
(16,1,'Islamiat',1,'2023-11-14 00:01:10','2023-11-14 00:01:10','2'),
(17,1,'English',1,'2023-11-14 00:01:10','2023-11-14 00:01:10','2'),
(18,1,'PST',1,'2023-11-14 00:01:10','2023-11-14 00:01:10','2'),
(19,1,'Sindhi',1,'2023-11-14 00:01:10','2023-11-14 00:01:10','2'),
(20,1,'Computer',1,'2023-11-14 00:01:10','2023-11-14 00:01:10','2'),
(21,1,'Biology',1,'2023-11-14 00:01:10','2023-11-14 00:01:10','2'),
(22,1,'ATP',1,'2023-11-14 00:01:10','2023-11-14 00:01:10','2'),
(23,2,'Physics',0,'2023-11-14 00:01:10','2023-11-14 10:00:42','24'),
(24,2,'Chemistry',1,'2023-11-14 00:01:10','2023-11-14 00:01:10','2'),
(25,2,'Maths',1,'2023-11-14 00:01:10','2023-11-14 00:01:10','2'),
(26,2,'Urdu',1,'2023-11-14 00:01:10','2023-11-14 00:01:10','2'),
(27,2,'Islamiat',1,'2023-11-14 00:01:10','2023-11-14 00:01:10','2'),
(28,2,'English',1,'2023-11-14 00:01:10','2023-11-14 00:01:10','2'),
(29,2,'PST',1,'2023-11-14 00:01:10','2023-11-14 00:01:10','2'),
(30,2,'Sindhi',1,'2023-11-14 00:01:10','2023-11-14 00:01:10','2'),
(31,2,'Computer',1,'2023-11-14 00:01:10','2023-11-14 00:01:10','2'),
(32,2,'Biology',1,'2023-11-14 00:01:10','2023-11-14 00:01:10','2'),
(33,2,'ATP',1,'2023-11-14 00:01:10','2023-11-14 00:01:10','2'),
(34,3,'Physics',1,'2023-11-14 00:01:10','2023-11-14 00:01:10','2'),
(35,3,'Chemistry',1,'2023-11-14 00:01:10','2023-11-14 00:01:10','2'),
(36,3,'Botany',1,'2023-11-14 00:01:10','2023-11-14 00:01:10','2'),
(37,3,'Urdu',1,'2023-11-14 00:01:10','2023-11-14 00:01:10','2'),
(38,3,'Islamiat',1,'2023-11-14 00:01:10','2023-11-14 00:01:10','2'),
(39,3,'English',1,'2023-11-14 00:01:10','2023-11-14 00:01:10','2'),
(40,3,'PST',1,'2023-11-14 00:01:10','2023-11-14 00:01:10','2'),
(41,3,'Zology',1,'2023-11-14 00:01:10','2023-11-14 00:01:10','2'),
(42,3,'MDCAT',1,'2023-11-14 00:01:10','2023-11-14 00:01:10','2'),
(43,26,'Chemistry',1,'2024-05-28 18:41:02','2024-05-28 18:41:02','35'),
(44,26,'Maths',1,'2024-05-28 18:42:23','2024-05-28 18:42:23','36'),
(45,26,'Physics',1,'2024-06-20 15:40:42','2024-06-20 15:40:42','37'),
(46,26,'Islamiat',1,'2024-06-20 15:40:52','2024-06-21 18:11:46','38'),
(47,26,'Computer',1,'2024-06-21 18:12:04','2024-06-21 18:12:04','36'),
(48,26,'Biology',1,'2024-06-21 18:12:20','2024-06-21 18:12:20','35'),
(49,26,'Urdu',1,'2024-06-21 18:12:53','2024-06-21 18:12:53','38');

/*Table structure for table `teacher` */

DROP TABLE IF EXISTS `teacher`;

CREATE TABLE `teacher` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `center_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `class_id` int(11) DEFAULT NULL,
  `subject_id` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `teacher` */

insert  into `teacher`(`id`,`center_id`,`user_id`,`class_id`,`subject_id`,`status`,`created_at`,`updated_at`) values 
(1,1,26,2,'2',1,'2024-03-26 21:59:38','2024-04-16 06:27:27'),
(2,1,24,4,'14',1,'2024-03-27 11:28:58','2024-03-27 11:28:58'),
(3,1,27,3,'13',1,'2024-03-27 11:29:11','2024-03-27 11:29:11'),
(4,1,28,1,'2',1,'2024-03-27 11:29:22','2024-03-27 11:29:22'),
(5,1,24,2,'14',1,'2024-03-27 11:29:45','2024-03-27 11:29:45'),
(6,1,27,2,'17',1,'2024-03-27 11:29:59','2024-03-27 11:29:59'),
(7,26,35,18,'43',1,'2024-06-20 15:21:37','2024-06-21 18:14:17'),
(8,26,36,18,'44',1,'2024-06-20 15:21:44','2024-06-20 15:21:44'),
(9,26,37,18,'45',1,'2024-06-20 15:43:10','2024-06-21 18:13:49'),
(10,26,38,18,'46',1,'2024-06-20 15:43:22','2024-06-21 18:13:55');

/*Table structure for table `teacher_attendance` */

DROP TABLE IF EXISTS `teacher_attendance`;

CREATE TABLE `teacher_attendance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `timetable_id` int(11) DEFAULT NULL,
  `teacher_status` varchar(20) DEFAULT NULL,
  `user_rep_id` varchar(255) DEFAULT NULL,
  `subject_rep_id` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status` int(11) DEFAULT NULL,
  `center_id` int(11) DEFAULT NULL,
  `date` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `teacher_attendance` */

insert  into `teacher_attendance`(`id`,`timetable_id`,`teacher_status`,`user_rep_id`,`subject_rep_id`,`created_at`,`updated_at`,`status`,`center_id`,`date`) values 
(1,1,'Absent','28','14','2024-03-27 22:16:22','2024-03-28 03:22:35',1,1,'2024-03-28'),
(2,2,'Late','27','2','2024-04-02 13:14:33','2024-04-02 13:14:33',1,1,'2024-04-03'),
(3,1,'Late','None','None','2024-04-02 13:14:33','2024-04-02 13:14:33',1,1,'2024-04-04');

/*Table structure for table `timetable` */

DROP TABLE IF EXISTS `timetable`;

CREATE TABLE `timetable` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `center_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `class_id` int(11) DEFAULT NULL,
  `subject_id` int(11) DEFAULT NULL,
  `day` varchar(20) DEFAULT NULL,
  `start_slot_time` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `end_slot_time` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `timetable` */

insert  into `timetable`(`id`,`center_id`,`user_id`,`class_id`,`subject_id`,`day`,`start_slot_time`,`status`,`created_at`,`updated_at`,`end_slot_time`) values 
(1,1,26,2,18,'Thursday','16:00',1,'2024-03-15 12:56:18','2024-03-27 13:10:36','17:00'),
(2,1,27,2,17,'Wednesday','18:00',1,'2024-03-27 13:10:36','2024-03-27 13:10:36','19:00');

/*Table structure for table `transaction` */

DROP TABLE IF EXISTS `transaction`;

CREATE TABLE `transaction` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status` int(11) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `transaction` */

insert  into `transaction`(`id`,`name`,`created_at`,`updated_at`,`status`) values 
(1,'Debit','2024-02-01 13:29:56','2024-02-01 13:31:45',0),
(2,'Credit','2024-02-01 13:29:56','2024-02-01 13:31:51',0);

/*Table structure for table `u_role` */

DROP TABLE IF EXISTS `u_role`;

CREATE TABLE `u_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `screen_id` varchar(400) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `center_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `u_role` */

insert  into `u_role`(`id`,`name`,`screen_id`,`status`,`created_at`,`updated_at`,`center_id`) values 
(0,'Super Admin','7,8,9,10,11,12,13,14','0','2023-05-10 07:52:33','2024-07-02 06:46:37',1),
(1,'Admin','15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,33,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,53,55,59,61,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,57','0','2023-09-25 14:27:29','2024-05-07 14:11:30',1),
(2,'COO','1,2,3,4,13,14,15,16,17,18,19,20,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,91,92,93,94','0','2023-09-25 14:27:29','2024-07-02 06:46:14',1),
(3,'Examination','31,33,43,44,45,46,47,49,51,53,55,56,59,60,61,62,79,81,83,85,95,96','0','2023-09-25 14:27:29','2024-05-07 16:38:19',1),
(4,'Teacher','31,33,35,37,39,41,47,49,51,53,59,79,81,82,83,85,86,95,96','0','2023-09-25 14:27:29','2024-05-07 17:03:27',1),
(8,'Academia','1,4,5,6,31,32,33,34,35,36,37,38,43,44,45,46,48,49,50,51,52,53,54,55,56,57,58,79,80,81,82,83,84,85,86','1','2024-04-27 20:10:19','2024-05-28 23:31:23',1),
(9,'Junior Examination','5,6','1','2024-04-27 20:11:44','2024-04-27 20:11:44',1);

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `center_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `phone_no` varchar(255) DEFAULT NULL,
  `role_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `user` */

insert  into `user`(`id`,`center_id`,`name`,`status`,`created_at`,`updated_at`,`email`,`password`,`phone_no`,`role_id`) values 
(1,1,'sajdain','1','2023-05-06 23:41:11','2024-05-07 18:59:28','raza33010@gmail.com','Abbas123','03073077059','0'),
(2,26,'Hasseb','1','2023-05-07 15:07:55','2024-05-28 23:18:51','haseeb@gmail.com','haseeb123','03368898647','2'),
(3,2,'Hamdani','1','2023-05-09 20:34:11','2023-11-14 14:57:43','hamdani@gmail.com','hamdani123',NULL,'2,3'),
(4,3,'Zaigham','1','2023-09-23 21:15:07','2023-10-30 14:32:42','zaigham@gmail.com','zaigham123','03462948055','2'),
(24,1,'AbbasRaza','0','2023-10-19 08:14:26','2024-05-07 22:25:04','abbas@gmail.com','Abbas123','03073077069','3'),
(25,3,'DL','1','2023-10-20 21:22:12','2023-11-04 13:50:30','useradmin@gmail.com','zaigham123','03452627542','3'),
(26,1,'osija','1','2023-10-20 21:51:04','2024-03-10 18:27:52','raza33@gmail.com','haseeb123','03452678912','4'),
(27,1,'Jawwad Hasnain','0','2023-10-23 16:52:36','2024-02-05 15:21:05','mr.muzammilh79@gmail.com','haseeb123','03452678912','1,4,3'),
(28,1,'Abbas Ali','0','2023-10-24 20:30:22','2024-03-10 18:28:07','ali@gmail.com','123451111abb','03452627597','3,1,4'),
(29,2,'hasnain','1','2023-11-14 09:59:33','2023-11-14 09:59:33','ali@gmail.com','123451111112','03452678912','4,3'),
(30,2,'abbas raza z','1','2023-11-14 13:39:18','2023-11-14 13:39:18','raza33@gmail.com','Abbasraza1','03452627542','4'),
(31,1,'Jalal Abbas','1','2024-03-28 12:31:49','2024-03-28 12:31:49','jalal@gmail.com','Abbas123','03452678912','4,1'),
(32,26,'Hasnain','1','2024-05-28 18:20:07','2024-05-28 18:20:07','useradmin@gmail.com','haseeb123','03452627542','1'),
(33,26,'Aaon','1','2024-05-28 18:20:29','2024-05-28 18:20:29','ali@gmail.com','zaigham123','03452627542','8'),
(34,26,'Jawad','1','2024-05-28 18:20:58','2024-05-28 18:20:58','raza33@gmail.com','Abbas123','03073077065','3'),
(35,26,'Hur','1','2024-05-28 18:32:30','2024-05-28 18:32:30','raza33@gmail.com','abcd1234','03073077065','4'),
(36,26,'Mujtaba','1','2024-05-28 18:41:48','2024-05-28 18:41:48','abbas@gmail.com','123451111112','03073077059','4'),
(37,26,'Ali Raza','1','2024-06-20 15:29:10','2024-06-20 15:29:10','aliraza@gmail.com','aliraza123','03452627542','4'),
(38,26,'Qasim','1','2024-06-20 15:30:13','2024-06-20 15:30:13','qasim@gmail.com','qasim123','03073077065','4');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
