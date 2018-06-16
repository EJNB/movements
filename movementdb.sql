/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 100122
Source Host           : localhost:3306
Source Database       : movementdb

Target Server Type    : MYSQL
Target Server Version : 100122
File Encoding         : 65001

Date: 2018-04-18 16:53:14
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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of brand
-- ----------------------------
INSERT INTO `brand` VALUES ('1', '1', 'HP');
INSERT INTO `brand` VALUES ('2', '2', 'THTF');
INSERT INTO `brand` VALUES ('3', '2', 'ViewSonic');
INSERT INTO `brand` VALUES ('4', '2', 'ATEC-Haier');
INSERT INTO `brand` VALUES ('7', '3', 'PEGATRON');
INSERT INTO `brand` VALUES ('8', '2', 'SAMSUNG');
INSERT INTO `brand` VALUES ('11', '16', 'MITEL');
INSERT INTO `brand` VALUES ('12', '16', 'Panasonic');
INSERT INTO `brand` VALUES ('13', '16', 'ETECSA');
INSERT INTO `brand` VALUES ('14', '17', 'ALCATEL');

-- ----------------------------
-- Table structure for c_m
-- ----------------------------
DROP TABLE IF EXISTS `c_m`;
CREATE TABLE `c_m` (
  `id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `FK_BBF0F015BF396750` FOREIGN KEY (`id`) REFERENCES `instalation` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of c_m
-- ----------------------------

-- ----------------------------
-- Table structure for department
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cm_id` int(11) DEFAULT NULL,
  `name` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_CD1DE18A5E237E06` (`name`),
  KEY `IDX_CD1DE18A48FCC97C` (`cm_id`),
  CONSTRAINT `FK_CD1DE18A48FCC97C` FOREIGN KEY (`cm_id`) REFERENCES `c_m` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of department
-- ----------------------------
INSERT INTO `department` VALUES ('1', null, 'Infomática');
INSERT INTO `department` VALUES ('2', null, 'Organización y sistemas');
INSERT INTO `department` VALUES ('3', null, 'Presidencia');
INSERT INTO `department` VALUES ('4', null, 'Calidad');
INSERT INTO `department` VALUES ('5', null, 'Compras');
INSERT INTO `department` VALUES ('6', null, 'SSTT');
INSERT INTO `department` VALUES ('7', null, 'Operaciones');
INSERT INTO `department` VALUES ('8', null, 'Riesgos');
INSERT INTO `department` VALUES ('9', null, 'Desarrollo');
INSERT INTO `department` VALUES ('10', null, 'Jurídico');
INSERT INTO `department` VALUES ('11', null, 'Inversiones');

-- ----------------------------
-- Table structure for distribution
-- ----------------------------
DROP TABLE IF EXISTS `distribution`;
CREATE TABLE `distribution` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `requestDate` datetime NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of distribution
-- ----------------------------
INSERT INTO `distribution` VALUES ('1', '2018-04-13 12:58:59', 'distribution_e');
INSERT INTO `distribution` VALUES ('2', '2018-04-13 12:59:33', 'distribution_e');
INSERT INTO `distribution` VALUES ('3', '2018-04-13 13:01:37', 'distribution_e');
INSERT INTO `distribution` VALUES ('4', '2018-04-13 13:20:03', 'distribution_e');
INSERT INTO `distribution` VALUES ('5', '2018-04-13 13:20:05', 'distribution_e');
INSERT INTO `distribution` VALUES ('6', '2018-04-13 13:25:54', 'distribution_e');
INSERT INTO `distribution` VALUES ('7', '2018-04-13 14:48:13', 'distribution_e');

-- ----------------------------
-- Table structure for distribution_e
-- ----------------------------
DROP TABLE IF EXISTS `distribution_e`;
CREATE TABLE `distribution_e` (
  `id` int(11) NOT NULL,
  `hotel_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_DB076EFE3243BB18` (`hotel_id`),
  CONSTRAINT `FK_DB076EFE3243BB18` FOREIGN KEY (`hotel_id`) REFERENCES `hotel` (`id`),
  CONSTRAINT `FK_DB076EFEBF396750` FOREIGN KEY (`id`) REFERENCES `distribution` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of distribution_e
-- ----------------------------
INSERT INTO `distribution_e` VALUES ('4', '1');
INSERT INTO `distribution_e` VALUES ('5', '1');
INSERT INTO `distribution_e` VALUES ('6', '1');
INSERT INTO `distribution_e` VALUES ('2', '2');
INSERT INTO `distribution_e` VALUES ('3', '2');
INSERT INTO `distribution_e` VALUES ('1', '3');
INSERT INTO `distribution_e` VALUES ('7', '3');

-- ----------------------------
-- Table structure for distribution_i
-- ----------------------------
DROP TABLE IF EXISTS `distribution_i`;
CREATE TABLE `distribution_i` (
  `id` int(11) NOT NULL,
  `person_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_D2B122D5217BBB47` (`person_id`),
  CONSTRAINT `FK_D2B122D5217BBB47` FOREIGN KEY (`person_id`) REFERENCES `person` (`id`),
  CONSTRAINT `FK_D2B122D5BF396750` FOREIGN KEY (`id`) REFERENCES `distribution` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of distribution_i
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
  UNIQUE KEY `UNIQ_D338D5838EC98D2A` (`ni`),
  KEY `IDX_D338D5837975B7E7` (`model_id`),
  KEY `IDX_D338D5836EB6DDB5` (`distribution_id`),
  KEY `IDX_D338D583229E70A7` (`movement_id`),
  CONSTRAINT `FK_D338D583229E70A7` FOREIGN KEY (`movement_id`) REFERENCES `movement` (`id`),
  CONSTRAINT `FK_D338D5836EB6DDB5` FOREIGN KEY (`distribution_id`) REFERENCES `distribution` (`id`),
  CONSTRAINT `FK_D338D5837975B7E7` FOREIGN KEY (`model_id`) REFERENCES `model` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of equipment
-- ----------------------------
INSERT INTO `equipment` VALUES ('1', '10', '6', null, 'dfdfdf', '5555', '444', '2013-01-01 00:00:00');
INSERT INTO `equipment` VALUES ('3', '12', null, null, 'dfdf', '66788', '33333', '2018-04-02 13:02:14');
INSERT INTO `equipment` VALUES ('5', '10', '6', null, 'dfdf', '44CFRFGVV$', '547821', '2018-04-02 13:03:42');
INSERT INTO `equipment` VALUES ('6', '12', null, null, 'dfkjdk', '4545', '54875', '2017-12-12 00:00:00');
INSERT INTO `equipment` VALUES ('7', '13', null, null, 'dfdf', '454588888', '547898', '2018-02-13 00:00:00');
INSERT INTO `equipment` VALUES ('9', '18', '7', null, '', '25357687686', '78945', '2018-04-03 00:00:00');
INSERT INTO `equipment` VALUES ('10', '18', '7', null, '', '868686', '4562', '2018-04-03 00:00:00');

-- ----------------------------
-- Table structure for hotel
-- ----------------------------
DROP TABLE IF EXISTS `hotel`;
CREATE TABLE `hotel` (
  `id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `FK_3535ED9BF396750` FOREIGN KEY (`id`) REFERENCES `instalation` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of hotel
-- ----------------------------
INSERT INTO `hotel` VALUES ('1');
INSERT INTO `hotel` VALUES ('2');
INSERT INTO `hotel` VALUES ('3');
INSERT INTO `hotel` VALUES ('4');
INSERT INTO `hotel` VALUES ('5');
INSERT INTO `hotel` VALUES ('6');

-- ----------------------------
-- Table structure for instalation
-- ----------------------------
DROP TABLE IF EXISTS `instalation`;
CREATE TABLE `instalation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_739567365E237E06` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of instalation
-- ----------------------------
INSERT INTO `instalation` VALUES ('1', 'Hotel Brisas Guardalavaca', 'hotel');
INSERT INTO `instalation` VALUES ('2', 'Hotel Brisas Cobarrubias', 'hotel');
INSERT INTO `instalation` VALUES ('3', 'Hotel Melia Cohiba', 'hotel');
INSERT INTO `instalation` VALUES ('4', 'Hotel Copacabana', 'hotel');
INSERT INTO `instalation` VALUES ('5', 'Hotel Mariposa', 'hotel');
INSERT INTO `instalation` VALUES ('6', 'Hotel Chateau Miramar', 'hotel');

-- ----------------------------
-- Table structure for model
-- ----------------------------
DROP TABLE IF EXISTS `model`;
CREATE TABLE `model` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `brand_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_D79572D95E237E06` (`name`),
  KEY `IDX_D79572D944F5D008` (`brand_id`),
  CONSTRAINT `FK_D79572D944F5D008` FOREIGN KEY (`brand_id`) REFERENCES `brand` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of model
-- ----------------------------
INSERT INTO `model` VALUES ('1', '1', 'Lasertjet M225');
INSERT INTO `model` VALUES ('10', '1', 'Lasertjet M227');
INSERT INTO `model` VALUES ('12', '1', 'Laserjet P2035');
INSERT INTO `model` VALUES ('13', '1', 'LaserJet Pro 400');
INSERT INTO `model` VALUES ('14', '1', 'Laserjet P2015');
INSERT INTO `model` VALUES ('15', '11', 'SUPERSET 401+');
INSERT INTO `model` VALUES ('16', '14', 'One Touch 2100');
INSERT INTO `model` VALUES ('17', '7', 'H1M1-CT');
INSERT INTO `model` VALUES ('18', '3', 'VG1930wm');

-- ----------------------------
-- Table structure for movement
-- ----------------------------
DROP TABLE IF EXISTS `movement`;
CREATE TABLE `movement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `movement_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `date` datetime NOT NULL,
  `document_file` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_F4DD95F7A76ED395` (`user_id`),
  CONSTRAINT `FK_F4DD95F7A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of movement
-- ----------------------------

-- ----------------------------
-- Table structure for m_e
-- ----------------------------
DROP TABLE IF EXISTS `m_e`;
CREATE TABLE `m_e` (
  `id` int(11) NOT NULL,
  `hotel_id` int(11) DEFAULT NULL,
  `CI` bigint(20) NOT NULL,
  `license` bigint(20) DEFAULT NULL,
  `number_plate` varchar(7) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ocupation` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_BFB5552D3243BB18` (`hotel_id`),
  CONSTRAINT `FK_BFB5552D3243BB18` FOREIGN KEY (`hotel_id`) REFERENCES `hotel` (`id`),
  CONSTRAINT `FK_BFB5552DBF396750` FOREIGN KEY (`id`) REFERENCES `movement` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of m_e
-- ----------------------------

-- ----------------------------
-- Table structure for m_i
-- ----------------------------
DROP TABLE IF EXISTS `m_i`;
CREATE TABLE `m_i` (
  `id` int(11) NOT NULL,
  `person_id` int(11) DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_B6031906217BBB47` (`person_id`),
  CONSTRAINT `FK_B6031906217BBB47` FOREIGN KEY (`person_id`) REFERENCES `person` (`id`),
  CONSTRAINT `FK_B6031906BF396750` FOREIGN KEY (`id`) REFERENCES `movement` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of m_i
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
  PRIMARY KEY (`id`),
  KEY `IDX_34DCD176AE80F5DF` (`department_id`),
  CONSTRAINT `FK_34DCD176AE80F5DF` FOREIGN KEY (`department_id`) REFERENCES `department` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of person
-- ----------------------------
INSERT INTO `person` VALUES ('1', '1', 'Enio Javier Nieto Basnueva', 'Esp. Informático');
INSERT INTO `person` VALUES ('2', '1', 'Andy Garcia Mirabal', 'Tec. Informático');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `role` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of role
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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of type
-- ----------------------------
INSERT INTO `type` VALUES ('18', 'Bocinas');
INSERT INTO `type` VALUES ('17', 'Celular');
INSERT INTO `type` VALUES ('9', 'Escaner de pasaporte');
INSERT INTO `type` VALUES ('1', 'Impresora');
INSERT INTO `type` VALUES ('2', 'Monitor');
INSERT INTO `type` VALUES ('5', 'Mouse');
INSERT INTO `type` VALUES ('3', 'PC');
INSERT INTO `type` VALUES ('11', 'Regulador de voltage');
INSERT INTO `type` VALUES ('8', 'Teclado');
INSERT INTO `type` VALUES ('16', 'Telefono');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `occupation` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`),
  UNIQUE KEY `UNIQ_8D93D649F85E0677` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of user
-- ----------------------------

-- ----------------------------
-- Table structure for users_roles
-- ----------------------------
DROP TABLE IF EXISTS `users_roles`;
CREATE TABLE `users_roles` (
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `IDX_51498A8EA76ED395` (`user_id`),
  KEY `IDX_51498A8ED60322AC` (`role_id`),
  CONSTRAINT `FK_51498A8EA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_51498A8ED60322AC` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of users_roles
-- ----------------------------
SET FOREIGN_KEY_CHECKS=1;
