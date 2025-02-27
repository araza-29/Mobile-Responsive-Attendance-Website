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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `attendances` */

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
(1,'Campus 1','download (3).jpg',1,'Hasan Acadmey','01234567899'),
(2,'Campus 2','chap 11.png',1,'YCM','01234567899'),
(3,'Campus 3','chap 5.png',1,'HA Primary Camps','03011111545');

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
