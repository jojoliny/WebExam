/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50540
Source Host           : localhost:3306
Source Database       : webexam

Target Server Type    : MYSQL
Target Server Version : 50540
File Encoding         : 65001

Date: 2017-10-22 11:09:00
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tb_collectquestion
-- ----------------------------
DROP TABLE IF EXISTS `tb_collectquestion`;
CREATE TABLE `tb_collectquestion` (
  `sno` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `qid` int(11) NOT NULL,
  `createTime` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of tb_collectquestion
-- ----------------------------
INSERT INTO `tb_collectquestion` VALUES ('1', '5', '2017-10-20');
INSERT INTO `tb_collectquestion` VALUES ('2017', '10', '2017-10-22');

-- ----------------------------
-- Table structure for tb_errors
-- ----------------------------
DROP TABLE IF EXISTS `tb_errors`;
CREATE TABLE `tb_errors` (
  `sno` varchar(20) DEFAULT NULL,
  `qid` int(11) DEFAULT NULL,
  `major` varchar(20) DEFAULT NULL,
  `wrongAnswer` int(11) DEFAULT NULL,
  `rightAnswer` int(11) DEFAULT NULL,
  KEY `fk_e_sno` (`sno`),
  KEY `fk_e_qno` (`qid`),
  KEY `fk_e_major` (`major`),
  KEY `fk_e_ranswer` (`rightAnswer`),
  CONSTRAINT `fk_e_sno` FOREIGN KEY (`sno`) REFERENCES `tb_student` (`sno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_errors
-- ----------------------------
INSERT INTO `tb_errors` VALUES ('1', '7', 'computer', '2', '3');
INSERT INTO `tb_errors` VALUES ('1', '8', 'computer', '1', '4');
INSERT INTO `tb_errors` VALUES ('1', '7', 'computer', '2', '3');
INSERT INTO `tb_errors` VALUES ('1', '8', 'computer', '1', '4');
INSERT INTO `tb_errors` VALUES ('1', '8', 'computer', '1', '4');
INSERT INTO `tb_errors` VALUES ('1', '7', 'computer', '1', '3');
INSERT INTO `tb_errors` VALUES ('1', '7', 'computer', '2', '3');
INSERT INTO `tb_errors` VALUES ('1', '5', 'computer', '2', '1');
INSERT INTO `tb_errors` VALUES ('1', '6', 'computer', '2', '3');
INSERT INTO `tb_errors` VALUES ('1', '5', 'computer', '4', '1');
INSERT INTO `tb_errors` VALUES ('1', '5', 'computer', '2', '1');
INSERT INTO `tb_errors` VALUES ('1', '5', 'computer', '3', '1');
INSERT INTO `tb_errors` VALUES ('1', '8', 'computer', '3', '4');
INSERT INTO `tb_errors` VALUES ('1', '5', 'computer', '2', '1');
INSERT INTO `tb_errors` VALUES ('1', '8', 'computer', '3', '4');
INSERT INTO `tb_errors` VALUES ('1', '6', 'computer', '2', '3');
INSERT INTO `tb_errors` VALUES ('1', '8', 'computer', '3', '4');
INSERT INTO `tb_errors` VALUES ('1', '8', 'computer', '2', '4');
INSERT INTO `tb_errors` VALUES ('1', '6', 'computer', '2', '3');
INSERT INTO `tb_errors` VALUES ('1', '8', 'computer', '2', '4');
INSERT INTO `tb_errors` VALUES ('1', '8', 'computer', '3', '4');
INSERT INTO `tb_errors` VALUES ('1', '8', 'computer', '2', '4');
INSERT INTO `tb_errors` VALUES ('1', '6', 'computer', '2', '3');
INSERT INTO `tb_errors` VALUES ('1', '8', 'computer', '2', '4');
INSERT INTO `tb_errors` VALUES ('1', '6', 'computer', '4', '3');
INSERT INTO `tb_errors` VALUES ('1', '6', 'computer', '4', '3');
INSERT INTO `tb_errors` VALUES ('1', '6', 'computer', '4', '3');
INSERT INTO `tb_errors` VALUES ('1', '8', 'computer', '3', '4');
INSERT INTO `tb_errors` VALUES ('1', '12', 'computer', '2', '1');
INSERT INTO `tb_errors` VALUES ('1', '12', 'computer', '2', '1');
INSERT INTO `tb_errors` VALUES ('1', '12', 'computer', '2', '1');
INSERT INTO `tb_errors` VALUES ('1', '12', 'computer', '2', '1');
INSERT INTO `tb_errors` VALUES ('1', '11', 'computer', '1', '4');
INSERT INTO `tb_errors` VALUES ('2017', '5', 'computer', '2', '1');
INSERT INTO `tb_errors` VALUES ('2017', '13', 'computer', '2', '4');
INSERT INTO `tb_errors` VALUES ('2017', '8', 'computer', '3', '4');
INSERT INTO `tb_errors` VALUES ('2017', '13', 'computer', '2', '4');
INSERT INTO `tb_errors` VALUES ('2017', '5', 'computer', '2', '1');
INSERT INTO `tb_errors` VALUES ('2017', '13', 'computer', '2', '4');
INSERT INTO `tb_errors` VALUES ('2017', '8', 'computer', '3', '4');
INSERT INTO `tb_errors` VALUES ('2017', '13', 'computer', '2', '4');
INSERT INTO `tb_errors` VALUES ('2017', '10', 'computer', '1', '4');
INSERT INTO `tb_errors` VALUES ('2017', '5', 'computer', '2', '1');
INSERT INTO `tb_errors` VALUES ('2017', '11', 'computer', '2', '4');

-- ----------------------------
-- Table structure for tb_question
-- ----------------------------
DROP TABLE IF EXISTS `tb_question`;
CREATE TABLE `tb_question` (
  `tno` varchar(20) DEFAULT NULL,
  `point` int(11) NOT NULL,
  `answer` int(11) NOT NULL,
  `major` varchar(20) NOT NULL,
  `qid` int(11) NOT NULL AUTO_INCREMENT,
  `question` text,
  PRIMARY KEY (`qid`),
  KEY `answer` (`answer`),
  KEY `major` (`major`),
  KEY `fk_q_manager` (`tno`),
  KEY `question` (`question`(255))
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_question
-- ----------------------------
INSERT INTO `tb_question` VALUES ('no.001', '5', '1', 'computer', '5', '1+1=?##2##3##4##5##1');
INSERT INTO `tb_question` VALUES ('no.001', '5', '3', 'computer', '6', '1+2=?##1##2##3##4##3');
INSERT INTO `tb_question` VALUES ('no.001', '5', '3', 'computer', '7', '1+4=?##1##3##5##7##3');
INSERT INTO `tb_question` VALUES ('no.001', '5', '4', 'computer', '8', '1+4=?##2##4##6##5##4');
INSERT INTO `tb_question` VALUES ('no.001', '5', '4', 'computer', '9', '1+4=?##2##4##6##5##4');
INSERT INTO `tb_question` VALUES ('no.001', '5', '4', 'computer', '10', '1+7=?##2##3##5##8##4');
INSERT INTO `tb_question` VALUES ('no.001', '5', '4', 'computer', '11', '1+5=?##2##3##4##6##4');
INSERT INTO `tb_question` VALUES ('no.002', '5', '1', 'computer', '12', '1+6-2=?##5##4##3##2##1');
INSERT INTO `tb_question` VALUES ('no.003', '5', '4', 'computer', '13', '1+9-6=?##1##2##3##4##4');

-- ----------------------------
-- Table structure for tb_student
-- ----------------------------
DROP TABLE IF EXISTS `tb_student`;
CREATE TABLE `tb_student` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sno` varchar(20) NOT NULL,
  `sname` varchar(20) DEFAULT NULL,
  `sex` int(11) DEFAULT NULL,
  `password` varchar(40) NOT NULL,
  `email` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sno` (`sno`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_student
-- ----------------------------
INSERT INTO `tb_student` VALUES ('1', '1', null, null, '1', '1');
INSERT INTO `tb_student` VALUES ('6', '2', null, null, '2', '2136694384@qq.com');
INSERT INTO `tb_student` VALUES ('7', '3', null, null, '3', '3');
INSERT INTO `tb_student` VALUES ('8', '3', null, null, '3', '2136694384@qq.com');
INSERT INTO `tb_student` VALUES ('9', '2017', null, null, '1', '2136694384@qq.com');
INSERT INTO `tb_student` VALUES ('10', '33', '3', '0', '3', '2136694384@qq.com');

-- ----------------------------
-- Table structure for tb_stu_testpapers
-- ----------------------------
DROP TABLE IF EXISTS `tb_stu_testpapers`;
CREATE TABLE `tb_stu_testpapers` (
  `sno` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `grade` int(11) DEFAULT NULL,
  `pid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `major` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of tb_stu_testpapers
-- ----------------------------
INSERT INTO `tb_stu_testpapers` VALUES ('1', '1', '25', '0b5a5fe2-c741-47de-9f7b-7b1b72b61788', 'computer');
INSERT INTO `tb_stu_testpapers` VALUES ('2017', '1', '0', 'e5cfd687-ce90-4131-93cc-6004983dbf42', 'computer');
INSERT INTO `tb_stu_testpapers` VALUES ('2017', '1', '0', 'a9e37669-839a-4892-92e0-267a573ae1f2', 'computer');
INSERT INTO `tb_stu_testpapers` VALUES ('2017', '1', '0', '8a93da77-6cfa-4bc7-8b20-78445df1f6fa', 'computer');
INSERT INTO `tb_stu_testpapers` VALUES ('2017', '1', '0', '50a6effb-8d13-4e93-863b-fbcc1448f200', 'computer');

-- ----------------------------
-- Table structure for tb_teacher
-- ----------------------------
DROP TABLE IF EXISTS `tb_teacher`;
CREATE TABLE `tb_teacher` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tno` varchar(20) NOT NULL,
  `tname` varchar(20) DEFAULT NULL,
  `tsex` int(11) DEFAULT '1',
  `password` varchar(40) NOT NULL,
  `email` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tno` (`tno`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_teacher
-- ----------------------------
INSERT INTO `tb_teacher` VALUES ('1', 'no.001', '黄家鹏', '1', '1', '1625545295@qq.com');
INSERT INTO `tb_teacher` VALUES ('2', 'no.002', '皇家', '1', '1', '2136694384@qq.com');
INSERT INTO `tb_teacher` VALUES ('3', 'no.003', '黄', '0', '1', '2136694384@qq.com');
INSERT INTO `tb_teacher` VALUES ('4', 'no.004', 'huang', '0', '1', '1234567@qq.com');

-- ----------------------------
-- Table structure for tb_testpapers
-- ----------------------------
DROP TABLE IF EXISTS `tb_testpapers`;
CREATE TABLE `tb_testpapers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `qid` int(11) DEFAULT NULL,
  `major` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `answer` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=621 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of tb_testpapers
-- ----------------------------
INSERT INTO `tb_testpapers` VALUES ('521', '0b5a5fe2-c741-47de-9f7b-7b1b72b61788', '8', 'computer', '4');
INSERT INTO `tb_testpapers` VALUES ('522', '0b5a5fe2-c741-47de-9f7b-7b1b72b61788', '8', 'computer', '4');
INSERT INTO `tb_testpapers` VALUES ('523', '0b5a5fe2-c741-47de-9f7b-7b1b72b61788', '10', 'computer', '4');
INSERT INTO `tb_testpapers` VALUES ('524', '0b5a5fe2-c741-47de-9f7b-7b1b72b61788', '10', 'computer', '4');
INSERT INTO `tb_testpapers` VALUES ('525', '0b5a5fe2-c741-47de-9f7b-7b1b72b61788', '8', 'computer', '4');
INSERT INTO `tb_testpapers` VALUES ('526', '0b5a5fe2-c741-47de-9f7b-7b1b72b61788', '8', 'computer', '4');
INSERT INTO `tb_testpapers` VALUES ('527', '0b5a5fe2-c741-47de-9f7b-7b1b72b61788', '8', 'computer', '4');
INSERT INTO `tb_testpapers` VALUES ('528', '0b5a5fe2-c741-47de-9f7b-7b1b72b61788', '8', 'computer', '4');
INSERT INTO `tb_testpapers` VALUES ('529', '0b5a5fe2-c741-47de-9f7b-7b1b72b61788', '10', 'computer', '4');
INSERT INTO `tb_testpapers` VALUES ('530', '0b5a5fe2-c741-47de-9f7b-7b1b72b61788', '6', 'computer', '3');
INSERT INTO `tb_testpapers` VALUES ('531', '0b5a5fe2-c741-47de-9f7b-7b1b72b61788', '13', 'computer', '4');
INSERT INTO `tb_testpapers` VALUES ('532', '0b5a5fe2-c741-47de-9f7b-7b1b72b61788', '7', 'computer', '3');
INSERT INTO `tb_testpapers` VALUES ('533', '0b5a5fe2-c741-47de-9f7b-7b1b72b61788', '7', 'computer', '3');
INSERT INTO `tb_testpapers` VALUES ('534', '0b5a5fe2-c741-47de-9f7b-7b1b72b61788', '8', 'computer', '4');
INSERT INTO `tb_testpapers` VALUES ('535', '0b5a5fe2-c741-47de-9f7b-7b1b72b61788', '13', 'computer', '4');
INSERT INTO `tb_testpapers` VALUES ('536', '0b5a5fe2-c741-47de-9f7b-7b1b72b61788', '13', 'computer', '4');
INSERT INTO `tb_testpapers` VALUES ('537', '0b5a5fe2-c741-47de-9f7b-7b1b72b61788', '10', 'computer', '4');
INSERT INTO `tb_testpapers` VALUES ('538', '0b5a5fe2-c741-47de-9f7b-7b1b72b61788', '8', 'computer', '4');
INSERT INTO `tb_testpapers` VALUES ('539', '0b5a5fe2-c741-47de-9f7b-7b1b72b61788', '8', 'computer', '4');
INSERT INTO `tb_testpapers` VALUES ('540', '0b5a5fe2-c741-47de-9f7b-7b1b72b61788', '12', 'computer', '1');
INSERT INTO `tb_testpapers` VALUES ('541', 'e5cfd687-ce90-4131-93cc-6004983dbf42', '5', 'computer', '1');
INSERT INTO `tb_testpapers` VALUES ('542', 'e5cfd687-ce90-4131-93cc-6004983dbf42', '13', 'computer', '4');
INSERT INTO `tb_testpapers` VALUES ('543', 'e5cfd687-ce90-4131-93cc-6004983dbf42', '8', 'computer', '4');
INSERT INTO `tb_testpapers` VALUES ('544', 'e5cfd687-ce90-4131-93cc-6004983dbf42', '13', 'computer', '4');
INSERT INTO `tb_testpapers` VALUES ('545', 'e5cfd687-ce90-4131-93cc-6004983dbf42', '12', 'computer', '1');
INSERT INTO `tb_testpapers` VALUES ('546', 'e5cfd687-ce90-4131-93cc-6004983dbf42', '13', 'computer', '4');
INSERT INTO `tb_testpapers` VALUES ('547', 'e5cfd687-ce90-4131-93cc-6004983dbf42', '13', 'computer', '4');
INSERT INTO `tb_testpapers` VALUES ('548', 'e5cfd687-ce90-4131-93cc-6004983dbf42', '8', 'computer', '4');
INSERT INTO `tb_testpapers` VALUES ('549', 'e5cfd687-ce90-4131-93cc-6004983dbf42', '5', 'computer', '1');
INSERT INTO `tb_testpapers` VALUES ('550', 'e5cfd687-ce90-4131-93cc-6004983dbf42', '8', 'computer', '4');
INSERT INTO `tb_testpapers` VALUES ('551', 'e5cfd687-ce90-4131-93cc-6004983dbf42', '12', 'computer', '1');
INSERT INTO `tb_testpapers` VALUES ('552', 'e5cfd687-ce90-4131-93cc-6004983dbf42', '5', 'computer', '1');
INSERT INTO `tb_testpapers` VALUES ('553', 'e5cfd687-ce90-4131-93cc-6004983dbf42', '8', 'computer', '4');
INSERT INTO `tb_testpapers` VALUES ('554', 'e5cfd687-ce90-4131-93cc-6004983dbf42', '5', 'computer', '1');
INSERT INTO `tb_testpapers` VALUES ('555', 'e5cfd687-ce90-4131-93cc-6004983dbf42', '13', 'computer', '4');
INSERT INTO `tb_testpapers` VALUES ('556', 'e5cfd687-ce90-4131-93cc-6004983dbf42', '8', 'computer', '4');
INSERT INTO `tb_testpapers` VALUES ('557', 'e5cfd687-ce90-4131-93cc-6004983dbf42', '11', 'computer', '4');
INSERT INTO `tb_testpapers` VALUES ('558', 'e5cfd687-ce90-4131-93cc-6004983dbf42', '10', 'computer', '4');
INSERT INTO `tb_testpapers` VALUES ('559', 'e5cfd687-ce90-4131-93cc-6004983dbf42', '5', 'computer', '1');
INSERT INTO `tb_testpapers` VALUES ('560', 'e5cfd687-ce90-4131-93cc-6004983dbf42', '10', 'computer', '4');
INSERT INTO `tb_testpapers` VALUES ('561', 'a9e37669-839a-4892-92e0-267a573ae1f2', '10', 'computer', '4');
INSERT INTO `tb_testpapers` VALUES ('562', 'a9e37669-839a-4892-92e0-267a573ae1f2', '8', 'computer', '4');
INSERT INTO `tb_testpapers` VALUES ('563', 'a9e37669-839a-4892-92e0-267a573ae1f2', '5', 'computer', '1');
INSERT INTO `tb_testpapers` VALUES ('564', 'a9e37669-839a-4892-92e0-267a573ae1f2', '5', 'computer', '1');
INSERT INTO `tb_testpapers` VALUES ('565', 'a9e37669-839a-4892-92e0-267a573ae1f2', '13', 'computer', '4');
INSERT INTO `tb_testpapers` VALUES ('566', 'a9e37669-839a-4892-92e0-267a573ae1f2', '11', 'computer', '4');
INSERT INTO `tb_testpapers` VALUES ('567', 'a9e37669-839a-4892-92e0-267a573ae1f2', '8', 'computer', '4');
INSERT INTO `tb_testpapers` VALUES ('568', 'a9e37669-839a-4892-92e0-267a573ae1f2', '13', 'computer', '4');
INSERT INTO `tb_testpapers` VALUES ('569', 'a9e37669-839a-4892-92e0-267a573ae1f2', '13', 'computer', '4');
INSERT INTO `tb_testpapers` VALUES ('570', 'a9e37669-839a-4892-92e0-267a573ae1f2', '12', 'computer', '1');
INSERT INTO `tb_testpapers` VALUES ('571', 'a9e37669-839a-4892-92e0-267a573ae1f2', '11', 'computer', '4');
INSERT INTO `tb_testpapers` VALUES ('572', 'a9e37669-839a-4892-92e0-267a573ae1f2', '10', 'computer', '4');
INSERT INTO `tb_testpapers` VALUES ('573', 'a9e37669-839a-4892-92e0-267a573ae1f2', '13', 'computer', '4');
INSERT INTO `tb_testpapers` VALUES ('574', 'a9e37669-839a-4892-92e0-267a573ae1f2', '5', 'computer', '1');
INSERT INTO `tb_testpapers` VALUES ('575', 'a9e37669-839a-4892-92e0-267a573ae1f2', '11', 'computer', '4');
INSERT INTO `tb_testpapers` VALUES ('576', 'a9e37669-839a-4892-92e0-267a573ae1f2', '8', 'computer', '4');
INSERT INTO `tb_testpapers` VALUES ('577', 'a9e37669-839a-4892-92e0-267a573ae1f2', '12', 'computer', '1');
INSERT INTO `tb_testpapers` VALUES ('578', 'a9e37669-839a-4892-92e0-267a573ae1f2', '11', 'computer', '4');
INSERT INTO `tb_testpapers` VALUES ('579', 'a9e37669-839a-4892-92e0-267a573ae1f2', '7', 'computer', '3');
INSERT INTO `tb_testpapers` VALUES ('580', 'a9e37669-839a-4892-92e0-267a573ae1f2', '13', 'computer', '4');
INSERT INTO `tb_testpapers` VALUES ('581', '8a93da77-6cfa-4bc7-8b20-78445df1f6fa', '5', 'computer', '1');
INSERT INTO `tb_testpapers` VALUES ('582', '8a93da77-6cfa-4bc7-8b20-78445df1f6fa', '5', 'computer', '1');
INSERT INTO `tb_testpapers` VALUES ('583', '8a93da77-6cfa-4bc7-8b20-78445df1f6fa', '7', 'computer', '3');
INSERT INTO `tb_testpapers` VALUES ('584', '8a93da77-6cfa-4bc7-8b20-78445df1f6fa', '11', 'computer', '4');
INSERT INTO `tb_testpapers` VALUES ('585', '8a93da77-6cfa-4bc7-8b20-78445df1f6fa', '6', 'computer', '3');
INSERT INTO `tb_testpapers` VALUES ('586', '8a93da77-6cfa-4bc7-8b20-78445df1f6fa', '7', 'computer', '3');
INSERT INTO `tb_testpapers` VALUES ('587', '8a93da77-6cfa-4bc7-8b20-78445df1f6fa', '7', 'computer', '3');
INSERT INTO `tb_testpapers` VALUES ('588', '8a93da77-6cfa-4bc7-8b20-78445df1f6fa', '8', 'computer', '4');
INSERT INTO `tb_testpapers` VALUES ('589', '8a93da77-6cfa-4bc7-8b20-78445df1f6fa', '11', 'computer', '4');
INSERT INTO `tb_testpapers` VALUES ('590', '8a93da77-6cfa-4bc7-8b20-78445df1f6fa', '13', 'computer', '4');
INSERT INTO `tb_testpapers` VALUES ('591', '8a93da77-6cfa-4bc7-8b20-78445df1f6fa', '8', 'computer', '4');
INSERT INTO `tb_testpapers` VALUES ('592', '8a93da77-6cfa-4bc7-8b20-78445df1f6fa', '12', 'computer', '1');
INSERT INTO `tb_testpapers` VALUES ('593', '8a93da77-6cfa-4bc7-8b20-78445df1f6fa', '12', 'computer', '1');
INSERT INTO `tb_testpapers` VALUES ('594', '8a93da77-6cfa-4bc7-8b20-78445df1f6fa', '10', 'computer', '4');
INSERT INTO `tb_testpapers` VALUES ('595', '8a93da77-6cfa-4bc7-8b20-78445df1f6fa', '8', 'computer', '4');
INSERT INTO `tb_testpapers` VALUES ('596', '8a93da77-6cfa-4bc7-8b20-78445df1f6fa', '11', 'computer', '4');
INSERT INTO `tb_testpapers` VALUES ('597', '8a93da77-6cfa-4bc7-8b20-78445df1f6fa', '13', 'computer', '4');
INSERT INTO `tb_testpapers` VALUES ('598', '8a93da77-6cfa-4bc7-8b20-78445df1f6fa', '11', 'computer', '4');
INSERT INTO `tb_testpapers` VALUES ('599', '8a93da77-6cfa-4bc7-8b20-78445df1f6fa', '8', 'computer', '4');
INSERT INTO `tb_testpapers` VALUES ('600', '8a93da77-6cfa-4bc7-8b20-78445df1f6fa', '11', 'computer', '4');
INSERT INTO `tb_testpapers` VALUES ('601', '50a6effb-8d13-4e93-863b-fbcc1448f200', '11', 'computer', '4');
INSERT INTO `tb_testpapers` VALUES ('602', '50a6effb-8d13-4e93-863b-fbcc1448f200', '10', 'computer', '4');
INSERT INTO `tb_testpapers` VALUES ('603', '50a6effb-8d13-4e93-863b-fbcc1448f200', '13', 'computer', '4');
INSERT INTO `tb_testpapers` VALUES ('604', '50a6effb-8d13-4e93-863b-fbcc1448f200', '8', 'computer', '4');
INSERT INTO `tb_testpapers` VALUES ('605', '50a6effb-8d13-4e93-863b-fbcc1448f200', '8', 'computer', '4');
INSERT INTO `tb_testpapers` VALUES ('606', '50a6effb-8d13-4e93-863b-fbcc1448f200', '8', 'computer', '4');
INSERT INTO `tb_testpapers` VALUES ('607', '50a6effb-8d13-4e93-863b-fbcc1448f200', '6', 'computer', '3');
INSERT INTO `tb_testpapers` VALUES ('608', '50a6effb-8d13-4e93-863b-fbcc1448f200', '8', 'computer', '4');
INSERT INTO `tb_testpapers` VALUES ('609', '50a6effb-8d13-4e93-863b-fbcc1448f200', '12', 'computer', '1');
INSERT INTO `tb_testpapers` VALUES ('610', '50a6effb-8d13-4e93-863b-fbcc1448f200', '8', 'computer', '4');
INSERT INTO `tb_testpapers` VALUES ('611', '50a6effb-8d13-4e93-863b-fbcc1448f200', '10', 'computer', '4');
INSERT INTO `tb_testpapers` VALUES ('612', '50a6effb-8d13-4e93-863b-fbcc1448f200', '10', 'computer', '4');
INSERT INTO `tb_testpapers` VALUES ('613', '50a6effb-8d13-4e93-863b-fbcc1448f200', '12', 'computer', '1');
INSERT INTO `tb_testpapers` VALUES ('614', '50a6effb-8d13-4e93-863b-fbcc1448f200', '5', 'computer', '1');
INSERT INTO `tb_testpapers` VALUES ('615', '50a6effb-8d13-4e93-863b-fbcc1448f200', '8', 'computer', '4');
INSERT INTO `tb_testpapers` VALUES ('616', '50a6effb-8d13-4e93-863b-fbcc1448f200', '13', 'computer', '4');
INSERT INTO `tb_testpapers` VALUES ('617', '50a6effb-8d13-4e93-863b-fbcc1448f200', '11', 'computer', '4');
INSERT INTO `tb_testpapers` VALUES ('618', '50a6effb-8d13-4e93-863b-fbcc1448f200', '13', 'computer', '4');
INSERT INTO `tb_testpapers` VALUES ('619', '50a6effb-8d13-4e93-863b-fbcc1448f200', '13', 'computer', '4');
INSERT INTO `tb_testpapers` VALUES ('620', '50a6effb-8d13-4e93-863b-fbcc1448f200', '6', 'computer', '3');
