/*
SQLyog Ultimate v11.24 (32 bit)
MySQL - 5.5.58 : Database - edoc
*********************************************************************
*/
/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
DROP DATABASE IF EXISTS `edoc`;

CREATE DATABASE /*!32312 IF NOT EXISTS*/`edoc` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;

USE `edoc`;

/*Table structure for table `edoc_category` */

DROP TABLE IF EXISTS `edoc_category`;

CREATE TABLE `edoc_category` (
  `id` int(5) NOT NULL AUTO_INCREMENT COMMENT '分类编号',
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL COMMENT '分类名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `edoc_category` */

insert  into `edoc_category`(`id`,`name`) values (1,'java类'),(2,'mysql类');

/*Table structure for table `edoc_entry` */

DROP TABLE IF EXISTS `edoc_entry`;

CREATE TABLE `edoc_entry` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT COMMENT '文档编号',
  `category_id` int(5) NOT NULL COMMENT '分类编号',
  `title` varchar(50) COLLATE utf8_turkish_ci NOT NULL COMMENT '文档名称',
  `summary` varchar(255) COLLATE utf8_turkish_ci DEFAULT NULL COMMENT '文档摘要',
  `upload_user` varchar(10) COLLATE utf8_turkish_ci DEFAULT NULL COMMENT '上传人',
  `create_date` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `edoc_entry_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `edoc_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

/*Data for the table `edoc_entry` */

insert  into `edoc_entry`(`id`,`category_id`,`title`,`summary`,`upload_user`,`create_date`) values (2,2,'mybatis入门到精通，被修改了','mybatis入门到放弃','小明','2018-03-01'),(5,1,'java入门到精通1111','java入门到放弃','小红','2018-04-10'),(7,1,'Java入门到精通3323232','JavaScript入门到放弃','小兰','2018-02-16'),(10,2,'mysql入门到精通','mysql入门到放弃','小吕','2018-04-13'),(28,1,'java入门到精通22222','java入门到放弃22222','小计','2018-04-30'),(29,2,'mysql入门到精通2222','mysql入门到放弃2222','小明','2018-05-04'),(30,2,'mysql入门到精通3333','mysql入门到放弃3333','小计','2018-05-04'),(31,1,'java入门到精通44444','java入门到放弃44444','小区','2018-05-01'),(32,2,'mysql入门到精通','删库到跑路......','小钱','2018-05-04');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
