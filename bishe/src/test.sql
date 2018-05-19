/*
Navicat MySQL Data Transfer

Source Server         : 11
Source Server Version : 50623
Source Host           : localhost:3306
Source Database       : test

Target Server Type    : MYSQL
Target Server Version : 50623
File Encoding         : 65001

Date: 2018-05-19 21:42:39
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for liuyan
-- ----------------------------
DROP TABLE IF EXISTS `liuyan`;
CREATE TABLE `liuyan` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `neirong` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of liuyan
-- ----------------------------
INSERT INTO `liuyan` VALUES ('1', '1', '13');
INSERT INTO `liuyan` VALUES ('3', '不错', '这个');

-- ----------------------------
-- Table structure for turang
-- ----------------------------
DROP TABLE IF EXISTS `turang`;
CREATE TABLE `turang` (
  `time` datetime NOT NULL,
  `hum` varchar(255) NOT NULL,
  `illum` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of turang
-- ----------------------------
INSERT INTO `turang` VALUES ('2018-05-04 22:12:58', '540', '20');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `ident` char(1) NOT NULL,
  `telephone` varchar(20) NOT NULL,
  `address` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'admin', '123', '1', '123542321', '0');
INSERT INTO `user` VALUES ('2', 'user1', '123', '0', '041184835202', '大连东软信息学院A3座117室');
INSERT INTO `user` VALUES ('11', 'zay', '789', '1', '111', '');
INSERT INTO `user` VALUES ('12', 'sss', '111', '0', '234567', '');

-- ----------------------------
-- Table structure for user_copy
-- ----------------------------
DROP TABLE IF EXISTS `user_copy`;
CREATE TABLE `user_copy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `ident` char(1) NOT NULL,
  `telephone` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of user_copy
-- ----------------------------
INSERT INTO `user_copy` VALUES ('1', 'admin', '123', '1', '0');
INSERT INTO `user_copy` VALUES ('2', 'user1', '123', '0', '041184835202');
INSERT INTO `user_copy` VALUES ('12', '寮犱笁', '111', '0', '');

-- ----------------------------
-- Table structure for xiangce
-- ----------------------------
DROP TABLE IF EXISTS `xiangce`;
CREATE TABLE `xiangce` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `num` int(11) DEFAULT NULL,
  `img` varchar(40) DEFAULT NULL,
  `beizhu` int(255) DEFAULT '0' COMMENT '0是喜欢  1是一般 2是不喜欢',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xiangce
-- ----------------------------
INSERT INTO `xiangce` VALUES ('10', '风景', '1', null, '0');
INSERT INTO `xiangce` VALUES ('11', '美食', '33', null, '0');
INSERT INTO `xiangce` VALUES ('12', '服装', '23', null, '1');
INSERT INTO `xiangce` VALUES ('14', '22', '1', null, '0');

-- ----------------------------
-- Function structure for currval
-- ----------------------------
DROP FUNCTION IF EXISTS `currval`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `currval`(seq_name VARCHAR(50)) RETURNS int(11)
BEGIN
	  DECLARE value INTEGER;
	  SET value = 0;
	  SELECT current_value INTO value
	  FROM sequence
	  WHERE name = seq_name;
	  RETURN value;
	END
;;
DELIMITER ;

-- ----------------------------
-- Function structure for nextval
-- ----------------------------
DROP FUNCTION IF EXISTS `nextval`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `nextval`(seq_name VARCHAR(50)) RETURNS int(11)
BEGIN
	   UPDATE sequence
	   SET    current_value = current_value + increment
	   WHERE name = seq_name;
	   RETURN currval(seq_name);
	END
;;
DELIMITER ;

-- ----------------------------
-- Function structure for setval
-- ----------------------------
DROP FUNCTION IF EXISTS `setval`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `setval`(seq_name VARCHAR(50), value INTEGER) RETURNS int(11)
BEGIN
	   UPDATE sequence
	   SET          current_value = value
	   WHERE name = seq_name;
	   RETURN currval(seq_name);
	END
;;
DELIMITER ;
