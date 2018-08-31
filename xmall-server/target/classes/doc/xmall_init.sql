/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 5.5.15 : Database - xmall
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`xmall` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `xmall`;

/*Table structure for table `sys_role` */

DROP TABLE IF EXISTS `sys_role`;

CREATE TABLE `sys_role` (
  `role_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '角色主键',
  `role_name` varchar(200) DEFAULT NULL COMMENT '角色名称',
  `status_id` int(10) DEFAULT NULL COMMENT '角色状态',
  PRIMARY KEY (`role_id`),
  KEY `FKt2d90b5jl28b0h0evkiuopwj2` (`status_id`),
  CONSTRAINT `FKt2d90b5jl28b0h0evkiuopwj2` FOREIGN KEY (`status_id`) REFERENCES `sys_status` (`status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

/*Data for the table `sys_role` */

insert  into `sys_role`(`role_id`,`role_name`,`status_id`) values (1,'超级管理员',1);

/*Table structure for table `sys_status` */

DROP TABLE IF EXISTS `sys_status`;

CREATE TABLE `sys_status` (
  `status_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '状态主键',
  `status_name` varchar(100) DEFAULT NULL COMMENT '状态名称',
  PRIMARY KEY (`status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

/*Data for the table `sys_status` */

insert  into `sys_status`(`status_id`,`status_name`) values (1,'启用'),(2,'禁用');

/*Table structure for table `sys_user` */

DROP TABLE IF EXISTS `sys_user`;

CREATE TABLE `sys_user` (
  `user_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '用户主键',
  `user_no` varchar(500) DEFAULT NULL COMMENT '员工编号',
  `username` varchar(200) DEFAULT NULL COMMENT '用户姓名',
  `login_name` varchar(500) DEFAULT NULL COMMENT '登录名',
  `password` varchar(500) DEFAULT NULL COMMENT '登录密码，MD5加密',
  `gender` varchar(10) DEFAULT NULL COMMENT '性别：M-男，F-女',
  `role_id` int(10) DEFAULT NULL COMMENT '用户角色',
  `id_card` varchar(100) DEFAULT NULL COMMENT '身份证号码',
  `user_img` varchar(500) DEFAULT NULL COMMENT '员工照片',
  `cellphone` varchar(100) DEFAULT NULL COMMENT '联系电话',
  `email` varchar(500) DEFAULT NULL COMMENT '电子邮件',
  `birthday` date DEFAULT NULL COMMENT '出生日期',
  `status_id` int(10) DEFAULT NULL COMMENT '用户状态',
  `create_user` int(10) DEFAULT NULL COMMENT '创建人',
  `create_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_user` int(10) DEFAULT NULL COMMENT '更新人',
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  PRIMARY KEY (`user_id`),
  KEY `FKij1watx0thkhbwejfd7n45lu7` (`create_user`),
  KEY `FK4dm5kxn3potpfgdigehw7pdyu` (`role_id`),
  KEY `FK3o84pad2thdlhf3hx5t8jwtjm` (`status_id`),
  KEY `FKc8h2si62bavlfgmn4hi7161r8` (`update_user`),
  CONSTRAINT `FKc8h2si62bavlfgmn4hi7161r8` FOREIGN KEY (`update_user`) REFERENCES `sys_user` (`user_id`),
  CONSTRAINT `FK3o84pad2thdlhf3hx5t8jwtjm` FOREIGN KEY (`status_id`) REFERENCES `sys_status` (`status_id`),
  CONSTRAINT `FK4dm5kxn3potpfgdigehw7pdyu` FOREIGN KEY (`role_id`) REFERENCES `sys_role` (`role_id`),
  CONSTRAINT `FKij1watx0thkhbwejfd7n45lu7` FOREIGN KEY (`create_user`) REFERENCES `sys_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

/*Data for the table `sys_user` */

insert  into `sys_user`(`user_id`,`user_no`,`username`,`login_name`,`password`,`gender`,`role_id`,`id_card`,`user_img`,`cellphone`,`email`,`birthday`,`status_id`,`create_user`,`create_time`,`update_user`,`update_time`) values (1,'AUG_00001','张昊','zhanghao','21232f297a57a5a743894a0e4a801fc3','M',1,NULL,NULL,NULL,NULL,NULL,1,NULL,'2018-08-31 14:34:57',NULL,'0000-00-00 00:00:00');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
