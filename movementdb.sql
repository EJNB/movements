/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 100122
Source Host           : localhost:3306
Source Database       : movementdb

Target Server Type    : MYSQL
Target Server Version : 100122
File Encoding         : 65001

Date: 2018-03-26 17:11:15
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for brand
-- ----------------------------
DROP TABLE IF EXISTS `brand`;
CREATE TABLE `brand` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_id` int(11) DEFAULT NULL,
  `name` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_1C52F9585E237E06` (`name`),
  KEY `IDX_1C52F958C54C8C93` (`type_id`),
  CONSTRAINT `FK_1C52F958C54C8C93` FOREIGN KEY (`type_id`) REFERENCES `type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of brand
-- ----------------------------
INSERT INTO `brand` VALUES ('1', '1', 'HP');
INSERT INTO `brand` VALUES ('2', '2', 'THTF');
INSERT INTO `brand` VALUES ('3', '2', 'ViewSonic');
INSERT INTO `brand` VALUES ('4', '2', 'ATEC-Haier');
INSERT INTO `brand` VALUES ('7', '3', 'PEGATRON');
INSERT INTO `brand` VALUES ('8', '2', 'SAMSUNG');

-- ----------------------------
-- Table structure for department
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `instalation_id` int(11) DEFAULT NULL,
  `name` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_CD1DE18A5E237E06` (`name`),
  KEY `IDX_CD1DE18AEC7EC6CA` (`instalation_id`),
  CONSTRAINT `FK_CD1DE18AEC7EC6CA` FOREIGN KEY (`instalation_id`) REFERENCES `instalation` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of department
-- ----------------------------

-- ----------------------------
-- Table structure for distribution
-- ----------------------------
DROP TABLE IF EXISTS `distribution`;
CREATE TABLE `distribution` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `instalation_id` int(11) DEFAULT NULL,
  `requestDate` datetime NOT NULL,
  `state` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_A4483781EC7EC6CA` (`instalation_id`),
  CONSTRAINT `FK_A4483781EC7EC6CA` FOREIGN KEY (`instalation_id`) REFERENCES `instalation` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of distribution
-- ----------------------------

-- ----------------------------
-- Table structure for equipment
-- ----------------------------
DROP TABLE IF EXISTS `equipment`;
CREATE TABLE `equipment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `model_id` int(11) DEFAULT NULL,
  `distribution_id` int(11) DEFAULT NULL,
  `movement_id` int(11) DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ns` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ni` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `create_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_D338D58373AB7450` (`ns`),
  KEY `IDX_D338D5837975B7E7` (`model_id`),
  KEY `IDX_D338D5836EB6DDB5` (`distribution_id`),
  KEY `IDX_D338D583229E70A7` (`movement_id`),
  CONSTRAINT `FK_D338D583229E70A7` FOREIGN KEY (`movement_id`) REFERENCES `movement` (`id`),
  CONSTRAINT `FK_D338D5836EB6DDB5` FOREIGN KEY (`distribution_id`) REFERENCES `distribution` (`id`),
  CONSTRAINT `FK_D338D5837975B7E7` FOREIGN KEY (`model_id`) REFERENCES `model` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of equipment
-- ----------------------------

-- ----------------------------
-- Table structure for instalation
-- ----------------------------
DROP TABLE IF EXISTS `instalation`;
CREATE TABLE `instalation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_739567365E237E06` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of instalation
-- ----------------------------

-- ----------------------------
-- Table structure for model
-- ----------------------------
DROP TABLE IF EXISTS `model`;
CREATE TABLE `model` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `brand_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_D79572D944F5D008` (`brand_id`),
  CONSTRAINT `FK_D79572D944F5D008` FOREIGN KEY (`brand_id`) REFERENCES `brand` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of model
-- ----------------------------

-- ----------------------------
-- Table structure for movement
-- ----------------------------
DROP TABLE IF EXISTS `movement`;
CREATE TABLE `movement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `person_id` int(11) DEFAULT NULL,
  `instalation_id` int(11) DEFAULT NULL,
  `number` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `descripcion` longtext COLLATE utf8_unicode_ci,
  `od` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_F4DD95F7217BBB47` (`person_id`),
  KEY `IDX_F4DD95F7EC7EC6CA` (`instalation_id`),
  CONSTRAINT `FK_F4DD95F7217BBB47` FOREIGN KEY (`person_id`) REFERENCES `person` (`id`),
  CONSTRAINT `FK_F4DD95F7EC7EC6CA` FOREIGN KEY (`instalation_id`) REFERENCES `instalation` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of movement
-- ----------------------------

-- ----------------------------
-- Table structure for person
-- ----------------------------
DROP TABLE IF EXISTS `person`;
CREATE TABLE `person` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `department_id` int(11) DEFAULT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `cargo` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ci` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_34DCD1763B67F367` (`ci`),
  KEY `IDX_34DCD176AE80F5DF` (`department_id`),
  CONSTRAINT `FK_34DCD176AE80F5DF` FOREIGN KEY (`department_id`) REFERENCES `department` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of person
-- ----------------------------

-- ----------------------------
-- Table structure for type
-- ----------------------------
DROP TABLE IF EXISTS `type`;
CREATE TABLE `type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_8CDE57295E237E06` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of type
-- ----------------------------
INSERT INTO `type` VALUES ('9', 'Escaner de pasaporte');
INSERT INTO `type` VALUES ('1', 'Impresora');
INSERT INTO `type` VALUES ('2', 'Monitor');
INSERT INTO `type` VALUES ('5', 'Mouse');
INSERT INTO `type` VALUES ('3', 'PC');
INSERT INTO `type` VALUES ('8', 'Teclado');
SET FOREIGN_KEY_CHECKS=1;
