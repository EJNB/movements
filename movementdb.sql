/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 100122
Source Host           : localhost:3306
Source Database       : movementdb

Target Server Type    : MYSQL
Target Server Version : 100122
File Encoding         : 65001

Date: 2018-08-16 06:10:50
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of brand
-- ----------------------------
INSERT INTO `brand` VALUES ('1', '4', 'ViewSonic');
INSERT INTO `brand` VALUES ('2', '5', 'HP');
INSERT INTO `brand` VALUES ('4', '4', 'ATEC-Haier');
INSERT INTO `brand` VALUES ('5', '4', 'THTF');
INSERT INTO `brand` VALUES ('7', '4', 'SAMSUNG');
INSERT INTO `brand` VALUES ('8', '7', 'ARH');
INSERT INTO `brand` VALUES ('9', '8', 'GDM');

-- ----------------------------
-- Table structure for department
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_CD1DE18A5E237E06` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of department
-- ----------------------------
INSERT INTO `department` VALUES ('1', 'Calidad');
INSERT INTO `department` VALUES ('5', 'Contabilidad Empresarial');
INSERT INTO `department` VALUES ('6', 'Contabilidad Hotelera');
INSERT INTO `department` VALUES ('4', 'Inversiones');
INSERT INTO `department` VALUES ('3', 'Jurídico');
INSERT INTO `department` VALUES ('11', 'Negocios');
INSERT INTO `department` VALUES ('2', 'Operaciones');
INSERT INTO `department` VALUES ('15', 'Reserva');
INSERT INTO `department` VALUES ('9', 'Riesgos');
INSERT INTO `department` VALUES ('12', 'RRHH');
INSERT INTO `department` VALUES ('7', 'Seguridad y Protección');
INSERT INTO `department` VALUES ('10', 'Tramites');
INSERT INTO `department` VALUES ('14', 'Ventas');
INSERT INTO `department` VALUES ('13', 'VP Operaciones');

-- ----------------------------
-- Table structure for distribution
-- ----------------------------
DROP TABLE IF EXISTS `distribution`;
CREATE TABLE `distribution` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `requestDate` datetime NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `state` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of distribution
-- ----------------------------
INSERT INTO `distribution` VALUES ('2', '2018-08-03 14:11:51', 'distribution_i', '0');
INSERT INTO `distribution` VALUES ('3', '2018-08-07 21:17:56', 'distribution_e', '0');
INSERT INTO `distribution` VALUES ('4', '2018-08-07 21:18:41', 'distribution_e', '1');
INSERT INTO `distribution` VALUES ('5', '2018-08-07 21:19:24', 'distribution_e', '1');
INSERT INTO `distribution` VALUES ('6', '2018-07-02 18:21:54', 'distribution_e', '0');
INSERT INTO `distribution` VALUES ('7', '2018-07-02 18:20:22', 'distribution_e', '1');
INSERT INTO `distribution` VALUES ('8', '2018-08-07 00:00:00', 'distribution_e', '0');
INSERT INTO `distribution` VALUES ('9', '2018-08-07 00:00:00', 'distribution_e', '0');
INSERT INTO `distribution` VALUES ('10', '2017-10-27 00:00:00', 'distribution_e', '1');
INSERT INTO `distribution` VALUES ('11', '2017-10-27 00:00:00', 'distribution_e', '1');
INSERT INTO `distribution` VALUES ('12', '2017-10-27 00:00:00', 'distribution_e', '1');
INSERT INTO `distribution` VALUES ('13', '2017-10-27 00:00:00', 'distribution_e', '1');
INSERT INTO `distribution` VALUES ('14', '2017-10-27 00:00:00', 'distribution_e', '1');
INSERT INTO `distribution` VALUES ('15', '2017-10-27 00:00:00', 'distribution_e', '1');
INSERT INTO `distribution` VALUES ('16', '2017-10-27 00:00:00', 'distribution_e', '1');
INSERT INTO `distribution` VALUES ('17', '2017-10-27 00:00:00', 'distribution_e', '1');
INSERT INTO `distribution` VALUES ('18', '2017-10-27 00:00:00', 'distribution_e', '1');
INSERT INTO `distribution` VALUES ('19', '2017-10-27 00:00:00', 'distribution_e', '1');
INSERT INTO `distribution` VALUES ('20', '2017-10-27 00:00:00', 'distribution_e', '1');
INSERT INTO `distribution` VALUES ('21', '2017-10-27 00:00:00', 'distribution_e', '1');
INSERT INTO `distribution` VALUES ('22', '2017-10-27 00:00:00', 'distribution_e', '1');
INSERT INTO `distribution` VALUES ('23', '2017-10-27 00:00:00', 'distribution_e', '1');
INSERT INTO `distribution` VALUES ('24', '2017-10-27 00:00:00', 'distribution_e', '1');
INSERT INTO `distribution` VALUES ('25', '2017-10-27 00:00:00', 'distribution_e', '1');
INSERT INTO `distribution` VALUES ('26', '2017-10-27 00:00:00', 'distribution_e', '1');
INSERT INTO `distribution` VALUES ('27', '2017-10-27 00:00:00', 'distribution_e', '1');
INSERT INTO `distribution` VALUES ('28', '2017-10-27 00:00:00', 'distribution_e', '1');
INSERT INTO `distribution` VALUES ('29', '2017-10-27 00:00:00', 'distribution_e', '1');
INSERT INTO `distribution` VALUES ('30', '2017-10-27 00:00:00', 'distribution_e', '1');
INSERT INTO `distribution` VALUES ('31', '2017-10-27 00:00:00', 'distribution_e', '1');
INSERT INTO `distribution` VALUES ('32', '2017-10-27 00:00:00', 'distribution_e', '1');
INSERT INTO `distribution` VALUES ('33', '2017-10-27 00:00:00', 'distribution_e', '1');
INSERT INTO `distribution` VALUES ('34', '2017-12-06 00:00:00', 'distribution_e', '1');
INSERT INTO `distribution` VALUES ('35', '2017-12-13 00:00:00', 'distribution_e', '1');
INSERT INTO `distribution` VALUES ('36', '2017-12-18 00:00:00', 'distribution_e', '1');
INSERT INTO `distribution` VALUES ('37', '2017-10-18 00:00:00', 'distribution_e', '1');
INSERT INTO `distribution` VALUES ('38', '2018-02-06 00:00:00', 'distribution_e', '1');
INSERT INTO `distribution` VALUES ('39', '2018-02-05 00:00:00', 'distribution_e', '1');
INSERT INTO `distribution` VALUES ('40', '2018-02-06 00:00:00', 'distribution_e', '1');
INSERT INTO `distribution` VALUES ('41', '2018-02-13 00:00:00', 'distribution_e', '1');

-- ----------------------------
-- Table structure for distributioni_persons
-- ----------------------------
DROP TABLE IF EXISTS `distributioni_persons`;
CREATE TABLE `distributioni_persons` (
  `distribution_i_id` int(11) NOT NULL,
  `person_id` int(11) NOT NULL,
  PRIMARY KEY (`distribution_i_id`,`person_id`),
  KEY `IDX_AEB0FC18F6D7F703` (`distribution_i_id`),
  KEY `IDX_AEB0FC18217BBB47` (`person_id`),
  CONSTRAINT `FK_AEB0FC18217BBB47` FOREIGN KEY (`person_id`) REFERENCES `person` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_AEB0FC18F6D7F703` FOREIGN KEY (`distribution_i_id`) REFERENCES `distribution_i` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of distributioni_persons
-- ----------------------------
INSERT INTO `distributioni_persons` VALUES ('2', '4');
INSERT INTO `distributioni_persons` VALUES ('2', '5');
INSERT INTO `distributioni_persons` VALUES ('2', '6');
INSERT INTO `distributioni_persons` VALUES ('2', '7');

-- ----------------------------
-- Table structure for distribution_e
-- ----------------------------
DROP TABLE IF EXISTS `distribution_e`;
CREATE TABLE `distribution_e` (
  `id` int(11) NOT NULL,
  `hotel_id` int(11) DEFAULT NULL,
  `consecutive_number` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_DB076EFE3243BB18` (`hotel_id`),
  CONSTRAINT `FK_DB076EFE3243BB18` FOREIGN KEY (`hotel_id`) REFERENCES `hotel` (`id`),
  CONSTRAINT `FK_DB076EFEBF396750` FOREIGN KEY (`id`) REFERENCES `distribution` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of distribution_e
-- ----------------------------
INSERT INTO `distribution_e` VALUES ('3', '9', 'TR-14/2018');
INSERT INTO `distribution_e` VALUES ('4', '11', 'TR-15/2018');
INSERT INTO `distribution_e` VALUES ('5', '10', 'TR-16/2018');
INSERT INTO `distribution_e` VALUES ('6', '14', 'TR-13/2018');
INSERT INTO `distribution_e` VALUES ('7', '15', 'TR-12/2018');
INSERT INTO `distribution_e` VALUES ('8', '12', 'TR-18/2018');
INSERT INTO `distribution_e` VALUES ('9', '13', 'TR-17/2018');
INSERT INTO `distribution_e` VALUES ('10', '16', 'TR-46/2017');
INSERT INTO `distribution_e` VALUES ('11', '17', 'TR-47/2017');
INSERT INTO `distribution_e` VALUES ('12', '18', 'TR-48/2017');
INSERT INTO `distribution_e` VALUES ('13', '19', 'TR-49/2017');
INSERT INTO `distribution_e` VALUES ('14', '20', 'TR-50/2017');
INSERT INTO `distribution_e` VALUES ('15', '21', 'TR-51/2017');
INSERT INTO `distribution_e` VALUES ('16', '22', 'TR-52/2017');
INSERT INTO `distribution_e` VALUES ('17', '23', 'TR-53/2017');
INSERT INTO `distribution_e` VALUES ('18', '24', 'TR-54/2017');
INSERT INTO `distribution_e` VALUES ('19', '25', 'TR-55/2017');
INSERT INTO `distribution_e` VALUES ('20', '26', 'TR-56/2017');
INSERT INTO `distribution_e` VALUES ('21', '5', 'TR-57/2017');
INSERT INTO `distribution_e` VALUES ('22', '27', 'TR-58/2017');
INSERT INTO `distribution_e` VALUES ('23', '28', 'TR-59/2017');
INSERT INTO `distribution_e` VALUES ('24', '29', 'TR-60/2017');
INSERT INTO `distribution_e` VALUES ('25', '30', 'TR-61/2017');
INSERT INTO `distribution_e` VALUES ('26', '31', 'TR-62/2017');
INSERT INTO `distribution_e` VALUES ('27', '32', 'TR-63/2017');
INSERT INTO `distribution_e` VALUES ('28', '33', 'TR-64/2017');
INSERT INTO `distribution_e` VALUES ('29', '34', 'TR-65/2017');
INSERT INTO `distribution_e` VALUES ('30', '35', 'TR-66/2017');
INSERT INTO `distribution_e` VALUES ('31', '4', 'TR-67/2017');
INSERT INTO `distribution_e` VALUES ('32', '38', 'TR-68/2017');
INSERT INTO `distribution_e` VALUES ('33', '39', 'TR-69/2017');
INSERT INTO `distribution_e` VALUES ('34', '18', 'TR-72/2017');
INSERT INTO `distribution_e` VALUES ('35', '40', 'TR-73/2017');
INSERT INTO `distribution_e` VALUES ('36', '20', 'TR-74/2017');
INSERT INTO `distribution_e` VALUES ('37', '45', 'TR-75/2017');
INSERT INTO `distribution_e` VALUES ('38', '42', 'TR-01/2018');
INSERT INTO `distribution_e` VALUES ('39', '33', 'TR-03/2018');
INSERT INTO `distribution_e` VALUES ('40', '43', 'TR-04/2018');
INSERT INTO `distribution_e` VALUES ('41', '8', 'TR-05/2018');

-- ----------------------------
-- Table structure for distribution_i
-- ----------------------------
DROP TABLE IF EXISTS `distribution_i`;
CREATE TABLE `distribution_i` (
  `id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `FK_D2B122D5BF396750` FOREIGN KEY (`id`) REFERENCES `distribution` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of distribution_i
-- ----------------------------
INSERT INTO `distribution_i` VALUES ('2');

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
  `invoice_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_D338D58373AB7450` (`ns`),
  UNIQUE KEY `UNIQ_D338D5838EC98D2A` (`ni`),
  KEY `IDX_D338D5837975B7E7` (`model_id`),
  KEY `IDX_D338D5836EB6DDB5` (`distribution_id`),
  KEY `IDX_D338D583229E70A7` (`movement_id`),
  KEY `IDX_D338D5832989F1FD` (`invoice_id`),
  CONSTRAINT `FK_D338D583229E70A7` FOREIGN KEY (`movement_id`) REFERENCES `movement` (`id`),
  CONSTRAINT `FK_D338D5832989F1FD` FOREIGN KEY (`invoice_id`) REFERENCES `invoice` (`id`),
  CONSTRAINT `FK_D338D5836EB6DDB5` FOREIGN KEY (`distribution_id`) REFERENCES `distribution` (`id`),
  CONSTRAINT `FK_D338D5837975B7E7` FOREIGN KEY (`model_id`) REFERENCES `model` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=372 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of equipment
-- ----------------------------
INSERT INTO `equipment` VALUES ('35', '5', '21', '21', 'Impresoras multifution', 'VNB3C30759', '547255', '2017-08-15 00:00:00', '8');
INSERT INTO `equipment` VALUES ('36', '5', '22', '22', 'Impresoras multifution', 'VNB3C31692', '547256', '2017-08-15 00:00:00', '8');
INSERT INTO `equipment` VALUES ('37', '5', '22', '22', 'Impresoras multifution', 'VNB3C31697', '547257', '2017-08-15 00:00:00', '8');
INSERT INTO `equipment` VALUES ('38', '5', '23', '23', 'Impresoras multifution', 'VNB3C31698', '547258', '2017-08-15 00:00:00', '8');
INSERT INTO `equipment` VALUES ('39', '5', '24', '25', 'Impresoras multifution', 'VNB3C31700', '547259', '2017-08-15 00:00:00', '8');
INSERT INTO `equipment` VALUES ('40', '5', '14', '13', 'Impresoras multifution', 'VNB3C31702', '547260', '2017-08-15 00:00:00', '8');
INSERT INTO `equipment` VALUES ('41', '5', '14', '13', 'Impresoras multifution', 'VNB3C31701', '547261', '2017-08-15 00:00:00', '8');
INSERT INTO `equipment` VALUES ('42', '5', '25', '26', 'Impresoras multifution', 'VNB3C31706', '547262', '2017-08-15 00:00:00', '8');
INSERT INTO `equipment` VALUES ('43', '5', '25', '26', 'Impresoras multifution', 'VNB3C31708', '547263', '2017-08-15 00:00:00', '8');
INSERT INTO `equipment` VALUES ('44', '5', '26', '27', 'Impresoras multifution', 'VNB3C31710', '547264', '2017-08-15 00:00:00', '8');
INSERT INTO `equipment` VALUES ('45', '5', '26', '27', 'Impresoras multifution', 'VNB3C31711', '547265', '2017-08-15 00:00:00', '8');
INSERT INTO `equipment` VALUES ('46', '5', '11', '9', 'Impresoras multifution', 'VNB3C31712', '547266', '2017-08-15 00:00:00', '8');
INSERT INTO `equipment` VALUES ('47', '5', '11', '9', 'Impresoras multifution', 'VNB3C32133', '547267', '2017-08-15 00:00:00', '8');
INSERT INTO `equipment` VALUES ('48', '5', '10', '8', 'Impresoras multifution', 'VNB3C32211', '547268', '2017-08-15 00:00:00', '8');
INSERT INTO `equipment` VALUES ('49', '5', '10', '8', 'Impresoras multifution', 'VNB3C32213', '547269', '2017-08-15 00:00:00', '8');
INSERT INTO `equipment` VALUES ('50', '5', '27', '28', 'Impresoras multifution', 'VNB3C32214', '547270', '2017-08-15 00:00:00', '8');
INSERT INTO `equipment` VALUES ('51', '5', '27', '28', 'Impresoras multifution', 'VNB3C32216', '547271', '2017-08-15 00:00:00', '8');
INSERT INTO `equipment` VALUES ('52', '5', '28', '45', 'Impresoras multifution', 'VNB3C32218', '547272', '2017-08-15 00:00:00', '8');
INSERT INTO `equipment` VALUES ('53', '5', '20', '20', 'Impresoras multifution', 'VNB3C32219', '547273', '2017-08-15 00:00:00', '8');
INSERT INTO `equipment` VALUES ('54', '5', '15', '14', 'Impresoras multifution', 'VNB3C32220', '547274', '2017-08-15 00:00:00', '8');
INSERT INTO `equipment` VALUES ('55', '5', '16', '15', 'Impresoras multifution', 'VNB3C32222', '547275', '2017-08-15 00:00:00', '8');
INSERT INTO `equipment` VALUES ('56', '5', '18', '18', 'Impresoras multifution', 'VNB3C32221', '547276', '2017-08-15 00:00:00', '8');
INSERT INTO `equipment` VALUES ('57', '5', '29', '30', 'Impresoras multifution', 'VNB3C32225', '547277', '2017-08-15 00:00:00', '8');
INSERT INTO `equipment` VALUES ('58', '5', null, null, 'Impresoras multifution', 'VNB3C02279', '547280', '2017-08-15 00:00:00', '8');
INSERT INTO `equipment` VALUES ('59', '5', '30', '31', 'Impresoras multifution', 'VNB3C32226', '547283', '2017-08-15 00:00:00', '8');
INSERT INTO `equipment` VALUES ('60', '5', '30', '31', 'Impresoras multifution', 'VNB3C32229', '547284', '2017-08-15 00:00:00', '8');
INSERT INTO `equipment` VALUES ('61', '5', '31', '33', 'Impresoras multifution', 'VNB3C32231', '547285', '2017-08-15 00:00:00', '8');
INSERT INTO `equipment` VALUES ('62', '5', '31', '33', 'Impresoras multifution', 'VNB3C32232', '547286', '2017-08-15 00:00:00', '8');
INSERT INTO `equipment` VALUES ('63', '5', '32', '32', 'Impresoras multifution', 'VNB3C32234', '547287', '2017-08-15 00:00:00', '8');
INSERT INTO `equipment` VALUES ('64', '5', '32', '32', 'Impresoras multifution', 'VNB3C32240', '547288', '2017-08-15 00:00:00', '8');
INSERT INTO `equipment` VALUES ('65', '5', '33', '34', 'Impresoras multifution', 'VNB3C32241', '547289', '2017-08-15 00:00:00', '8');
INSERT INTO `equipment` VALUES ('66', '5', '33', '34', 'Impresoras multifution', 'VNB3C32339', '547290', '2017-08-15 00:00:00', '8');
INSERT INTO `equipment` VALUES ('67', '5', null, null, 'Impresoras multifution', 'VNB3C32440', '547291', '2017-08-15 00:00:00', '8');
INSERT INTO `equipment` VALUES ('68', '5', null, null, 'Impresoras multifution', 'VNB3C02311', '547292', '2017-08-15 00:00:00', '8');
INSERT INTO `equipment` VALUES ('69', '5', null, null, 'Impresoras multifution', 'VNB3C02338', '547293', '2017-08-15 00:00:00', '8');
INSERT INTO `equipment` VALUES ('70', '5', null, null, 'Impresoras multifution', 'VNB3C02341', '547294', '2017-08-15 00:00:00', '8');
INSERT INTO `equipment` VALUES ('71', '5', null, null, 'Impresoras multifution', 'VNB3C02500', '547295', '2017-08-15 00:00:00', '8');
INSERT INTO `equipment` VALUES ('72', '5', null, null, 'Impresoras multifution', 'VNB3C02512', '547296', '2017-08-15 00:00:00', '8');
INSERT INTO `equipment` VALUES ('73', '5', null, null, 'Impresoras multifution', 'VNB3C02518', '547297', '2017-08-15 00:00:00', '8');
INSERT INTO `equipment` VALUES ('74', '5', null, null, 'Impresoras multifution', 'VNB3C02521', '547298', '2017-08-15 00:00:00', '8');
INSERT INTO `equipment` VALUES ('75', '5', null, null, 'Impresoras multifution', 'VNB3C03526', '547299', '2017-08-15 00:00:00', '8');
INSERT INTO `equipment` VALUES ('76', '5', null, null, 'Impresoras multifution', 'VNB3C02527', '547300', '2017-08-15 00:00:00', '8');
INSERT INTO `equipment` VALUES ('77', '5', null, null, 'Impresoras multifution', 'VNB3C02529', '547301', '2017-08-15 00:00:00', '8');
INSERT INTO `equipment` VALUES ('78', '5', null, null, 'Impresoras multifution', 'VNB3C02530', '547302', '2017-08-15 00:00:00', '8');
INSERT INTO `equipment` VALUES ('79', '5', null, null, 'Impresoras multifution', 'VNB3C02531', '547303', '2017-08-15 00:00:00', '8');
INSERT INTO `equipment` VALUES ('80', '5', '40', '6', 'Impresoras multifution', 'VNB3C02532', '547304', '2017-08-15 00:00:00', '8');
INSERT INTO `equipment` VALUES ('81', '5', '41', '7', 'Impresoras multifution', 'VNB3C02533', '547305', '2017-08-15 00:00:00', '8');
INSERT INTO `equipment` VALUES ('82', '5', null, null, 'Impresoras multifution', 'VNB3C02535', '547306', '2017-08-15 00:00:00', '8');
INSERT INTO `equipment` VALUES ('83', '5', null, null, 'Impresoras multifution', 'VNB3C02536', '547307', '2017-08-15 00:00:00', '8');
INSERT INTO `equipment` VALUES ('84', '5', null, null, 'Impresoras multifution', 'VNB3C02537', '547308', '2017-08-15 00:00:00', '8');
INSERT INTO `equipment` VALUES ('93', '7', null, null, 'ESCANER DE PASAPORTE COMBO SMART(NORMAL,IR,RFID,UV,WITH)', '8515', '547248-1', '2017-06-12 00:00:00', '7');
INSERT INTO `equipment` VALUES ('94', '7', null, null, 'ESCANER DE PASAPORTE COMBO SMART(NORMAL,IR,RFID,UV,WITH)', '8195', '547248-2', '2017-06-12 00:00:00', '7');
INSERT INTO `equipment` VALUES ('95', '7', null, null, 'ESCANER DE PASAPORTE COMBO SMART(NORMAL,IR,RFID,UV,WITH)', '8326', '547248-3', '2017-06-12 00:00:00', '7');
INSERT INTO `equipment` VALUES ('96', '7', null, null, 'ESCANER DE PASAPORTE COMBO SMART(NORMAL,IR,RFID,UV,WITH)', '8278', '547248-4', '2017-06-12 00:00:00', '7');
INSERT INTO `equipment` VALUES ('97', '7', null, null, 'ESCANER DE PASAPORTE COMBO SMART(NORMAL,IR,RFID,UV,WITH)', '8198', '547248-5', '2017-06-12 00:00:00', '7');
INSERT INTO `equipment` VALUES ('98', '7', null, null, 'ESCANER DE PASAPORTE COMBO SMART(NORMAL,IR,RFID,UV,WITH)', '1128', '547248-6', '2017-06-12 00:00:00', '7');
INSERT INTO `equipment` VALUES ('99', '7', null, null, 'ESCANER DE PASAPORTE COMBO SMART(NORMAL,IR,RFID,UV,WITH)', '1058', '547248-7', '2017-06-12 00:00:00', '7');
INSERT INTO `equipment` VALUES ('100', '7', null, null, 'ESCANER DE PASAPORTE COMBO SMART(NORMAL,IR,RFID,UV,WITH)', '8265', '547248-8', '2017-06-12 00:00:00', '7');
INSERT INTO `equipment` VALUES ('101', '7', null, null, 'ESCANER DE PASAPORTE COMBO SMART(NORMAL,IR,RFID,UV,WITH)', '1086', '547248-9', '2017-06-12 00:00:00', '7');
INSERT INTO `equipment` VALUES ('102', '7', null, null, 'ESCANER DE PASAPORTE COMBO SMART(NORMAL,IR,RFID,UV,WITH)', '8300', '547248-10', '2017-06-12 00:00:00', '7');
INSERT INTO `equipment` VALUES ('103', '7', null, null, 'ESCANER DE PASAPORTE COMBO SMART(NORMAL,IR,RFID,UV,WITH)', '8220', '547248-11', '2017-06-12 00:00:00', '7');
INSERT INTO `equipment` VALUES ('104', '7', null, null, 'ESCANER DE PASAPORTE COMBO SMART(NORMAL,IR,RFID,UV,WITH)', '8257', '547248-12', '2017-06-12 00:00:00', '7');
INSERT INTO `equipment` VALUES ('105', '7', null, null, 'ESCANER DE PASAPORTE COMBO SMART(NORMAL,IR,RFID,UV,WITH)', '8324', '547248-13', '2017-06-12 00:00:00', '7');
INSERT INTO `equipment` VALUES ('106', '7', null, null, 'ESCANER DE PASAPORTE COMBO SMART(NORMAL,IR,RFID,UV,WITH)', '8139', '547248-14', '2017-06-12 00:00:00', '7');
INSERT INTO `equipment` VALUES ('107', '7', null, null, 'ESCANER DE PASAPORTE COMBO SMART(NORMAL,IR,RFID,UV,WITH)', '8334', '547248-15', '2017-06-12 00:00:00', '7');
INSERT INTO `equipment` VALUES ('108', '7', null, null, 'ESCANER DE PASAPORTE COMBO SMART(NORMAL,IR,RFID,UV,WITH)', '8287', '547248-16', '2017-06-12 00:00:00', '7');
INSERT INTO `equipment` VALUES ('109', '7', null, null, 'ESCANER DE PASAPORTE COMBO SMART(NORMAL,IR,RFID,UV,WITH)', '8249', '547248-17', '2017-06-12 00:00:00', '7');
INSERT INTO `equipment` VALUES ('110', '7', null, null, 'ESCANER DE PASAPORTE COMBO SMART(NORMAL,IR,RFID,UV,WITH)', '8240', '547248-18', '2017-06-12 00:00:00', '7');
INSERT INTO `equipment` VALUES ('111', '7', null, null, 'ESCANER DE PASAPORTE COMBO SMART(NORMAL,IR,RFID,UV,WITH)', '8259', '547248-19', '2017-06-12 00:00:00', '7');
INSERT INTO `equipment` VALUES ('112', '7', null, null, 'ESCANER DE PASAPORTE COMBO SMART(NORMAL,IR,RFID,UV,WITH)', '8222', '547248-20', '2017-06-12 00:00:00', '7');
INSERT INTO `equipment` VALUES ('113', '7', null, null, 'ESCANER DE PASAPORTE COMBO SMART(NORMAL,IR,RFID,UV,WITH)', '8221', '547248-21', '2017-06-12 00:00:00', '7');
INSERT INTO `equipment` VALUES ('114', '7', null, null, 'ESCANER DE PASAPORTE COMBO SMART(NORMAL,IR,RFID,UV,WITH)', '8282', '547248-22', '2017-06-12 00:00:00', '7');
INSERT INTO `equipment` VALUES ('115', '7', null, null, 'ESCANER DE PASAPORTE COMBO SMART(NORMAL,IR,RFID,UV,WITH)', '1076', '547248-23', '2017-06-12 00:00:00', '7');
INSERT INTO `equipment` VALUES ('116', '7', null, null, 'ESCANER DE PASAPORTE COMBO SMART(NORMAL,IR,RFID,UV,WITH)', '1009', '547248-24', '2017-06-12 00:00:00', '7');
INSERT INTO `equipment` VALUES ('117', '7', null, null, 'ESCANER DE PASAPORTE COMBO SMART(NORMAL,IR,RFID,UV,WITH)', '1092', '547248-25', '2017-06-12 00:00:00', '7');
INSERT INTO `equipment` VALUES ('118', '7', null, null, 'ESCANER DE PASAPORTE COMBO SMART(NORMAL,IR,RFID,UV,WITH)', '8219', '547248-26', '2017-06-12 00:00:00', '7');
INSERT INTO `equipment` VALUES ('119', '7', null, null, 'ESCANER DE PASAPORTE COMBO SMART(NORMAL,IR,RFID,UV,WITH)', '8197', '547248-27', '2017-06-12 00:00:00', '7');
INSERT INTO `equipment` VALUES ('120', '7', null, null, 'ESCANER DE PASAPORTE COMBO SMART(NORMAL,IR,RFID,UV,WITH)', '8239', '547248-28', '2017-06-12 00:00:00', '7');
INSERT INTO `equipment` VALUES ('121', '7', null, null, 'ESCANER DE PASAPORTE COMBO SMART(NORMAL,IR,RFID,UV,WITH)', '1041', '547248-29', '2017-06-12 00:00:00', '7');
INSERT INTO `equipment` VALUES ('122', '7', null, null, 'ESCANER DE PASAPORTE COMBO SMART(NORMAL,IR,RFID,UV,WITH)', '1175', '547248-30', '2017-06-12 00:00:00', '7');
INSERT INTO `equipment` VALUES ('131', '7', null, null, 'ESCANER DE PASAPORTE COMBO SMART(NORMAL,IR,RFID,UV,WITH)', '8292', '547248-31', '2017-06-12 00:00:00', '7');
INSERT INTO `equipment` VALUES ('132', '7', null, null, 'ESCANER DE PASAPORTE COMBO SMART(NORMAL,IR,RFID,UV,WITH)', '8269', '547248-32', '2017-06-12 00:00:00', '7');
INSERT INTO `equipment` VALUES ('135', '7', null, null, 'ESCANER DE PASAPORTE COMBO SMART(NORMAL,IR,RFID,UV,WITH)', '8274', '547248-33', '2017-06-12 00:00:00', '7');
INSERT INTO `equipment` VALUES ('136', '7', null, null, 'ESCANER DE PASAPORTE COMBO SMART(NORMAL,IR,RFID,UV,WITH)', '8231', '547248-34', '2017-06-12 00:00:00', '7');
INSERT INTO `equipment` VALUES ('137', '7', null, null, 'ESCANER DE PASAPORTE COMBO SMART(NORMAL,IR,RFID,UV,WITH)', '8331', '547248-35', '2017-06-12 00:00:00', '7');
INSERT INTO `equipment` VALUES ('138', '7', null, null, 'ESCANER DE PASAPORTE COMBO SMART(NORMAL,IR,RFID,UV,WITH)', '1109', '547248-36', '2017-06-12 00:00:00', '7');
INSERT INTO `equipment` VALUES ('139', '7', null, null, 'ESCANER DE PASAPORTE COMBO SMART(NORMAL,IR,RFID,UV,WITH)', '8211', '547248-37', '2017-06-12 00:00:00', '7');
INSERT INTO `equipment` VALUES ('140', '7', null, null, 'ESCANER DE PASAPORTE COMBO SMART(NORMAL,IR,RFID,UV,WITH)', '8232', '547248-38', '2017-06-12 00:00:00', '7');
INSERT INTO `equipment` VALUES ('141', '7', null, null, 'ESCANER DE PASAPORTE COMBO SMART(NORMAL,IR,RFID,UV,WITH)', '1151', '547248-39', '2017-06-12 00:00:00', '7');
INSERT INTO `equipment` VALUES ('142', '7', null, null, 'ESCANER DE PASAPORTE COMBO SMART(NORMAL,IR,RFID,UV,WITH)', '8158', '547248-40', '2017-06-12 00:00:00', '7');
INSERT INTO `equipment` VALUES ('143', '7', null, null, 'ESCANER DE PASAPORTE COMBO SMART(NORMAL,IR,RFID,UV,WITH)', '8264', '547248-41', '2017-06-12 00:00:00', '7');
INSERT INTO `equipment` VALUES ('144', '7', null, null, 'ESCANER DE PASAPORTE COMBO SMART(NORMAL,IR,RFID,UV,WITH)', '8314', '547248-42', '2017-06-12 00:00:00', '7');
INSERT INTO `equipment` VALUES ('145', '7', null, null, 'ESCANER DE PASAPORTE COMBO SMART(NORMAL,IR,RFID,UV,WITH)', '1005', '547248-43', '2017-06-12 00:00:00', '7');
INSERT INTO `equipment` VALUES ('146', '7', null, null, 'ESCANER DE PASAPORTE COMBO SMART(NORMAL,IR,RFID,UV,WITH)', '8212', '547248-44', '2017-06-12 00:00:00', '7');
INSERT INTO `equipment` VALUES ('147', '7', null, null, 'ESCANER DE PASAPORTE COMBO SMART(NORMAL,IR,RFID,UV,WITH)', '8210', '547248-45', '2017-06-12 00:00:00', '7');
INSERT INTO `equipment` VALUES ('148', '8', null, null, 'LAPTOP 15.6 /CEL/4GB/500GB/DVD-RW(FM12) Model ', 'GDM017CELW950LU08280', '547309', '2017-09-15 00:00:00', '9');
INSERT INTO `equipment` VALUES ('149', '8', null, null, 'LAPTOP 15.6 /CEL/4GB/500GB/DVD-RW(FM12) Model ', 'GDM017CELW950LU08560', '547310', '2017-09-15 00:00:00', '9');
INSERT INTO `equipment` VALUES ('150', '8', null, null, 'LAPTOP 15.6 /CEL/4GB/500GB/DVD-RW(FM12) Model ', 'GDM017CELW950LU08637', '547311', '2017-09-15 00:00:00', '9');
INSERT INTO `equipment` VALUES ('151', '8', null, null, 'LAPTOP 15.6 /CEL/4GB/500GB/DVD-RW(FM12) Model ', 'GDM017CELW950LU08620', '547312', '2017-09-15 00:00:00', '9');
INSERT INTO `equipment` VALUES ('152', '8', '39', '43', 'LAPTOP 15.6 /CEL/4GB/500GB/DVD-RW(FM12) Model ', 'GDM017CELW950LU08648', '547313', '2017-09-15 00:00:00', '9');
INSERT INTO `equipment` VALUES ('153', '8', null, null, 'LAPTOP 15.6 /CEL/4GB/500GB/DVD-RW(FM12) Model ', 'GDM017CELW950LU08626', '547314', '2017-09-15 00:00:00', '9');
INSERT INTO `equipment` VALUES ('154', '8', null, null, 'LAPTOP 15.6 /CEL/4GB/500GB/DVD-RW(FM12) Model ', 'GDM017CELW950LU08632', '547315', '2017-09-15 00:00:00', '9');
INSERT INTO `equipment` VALUES ('155', '8', '20', '20', 'LAPTOP 15.6 /CEL/4GB/500GB/DVD-RW(FM12) Model ', 'GDM017CELW950LU08643', '547316', '2017-09-15 00:00:00', '9');
INSERT INTO `equipment` VALUES ('156', '8', '19', '19', 'LAPTOP 15.6 /CEL/4GB/500GB/DVD-RW(FM12) Model ', 'GDM017CELW950LU08621', '547317', '2017-09-15 00:00:00', '9');
INSERT INTO `equipment` VALUES ('157', '8', '18', '18', 'LAPTOP 15.6 /CEL/4GB/500GB/DVD-RW(FM12) Model ', 'GDM017CELW950LU08589', '547318', '2017-09-15 00:00:00', '9');
INSERT INTO `equipment` VALUES ('158', '8', '16', '15', 'LAPTOP 15.6 /CEL/4GB/500GB/DVD-RW(FM12) Model ', 'GDM017CELW950LU08631', '547320', '2017-09-15 00:00:00', '9');
INSERT INTO `equipment` VALUES ('159', '8', '14', '13', 'LAPTOP 15.6 /CEL/4GB/500GB/DVD-RW(FM12) Model ', 'GDM017CELW950LU08607', '547321', '2017-09-15 00:00:00', '9');
INSERT INTO `equipment` VALUES ('160', '8', '12', '11', 'LAPTOP 15.6 /CEL/4GB/500GB/DVD-RW(FM12) Model ', 'GDM017CELW950LU08614', '547322', '2017-09-15 00:00:00', '9');
INSERT INTO `equipment` VALUES ('161', '8', '10', '8', 'LAPTOP 15.6 /CEL/4GB/500GB/DVD-RW(FM12) Model ', 'GDM017CELW950LU08575', '547323', '2017-09-15 00:00:00', '9');
INSERT INTO `equipment` VALUES ('162', '8', '11', '9', 'LAPTOP 15.6 /CEL/4GB/500GB/DVD-RW(FM12) Model ', 'GDM017CELW950LU08573', '547324', '2017-09-15 00:00:00', '9');
INSERT INTO `equipment` VALUES ('163', '8', '15', '14', 'LAPTOP 15.6 /CEL/4GB/500GB/DVD-RW(FM12) Model ', 'GDM017CELW950LU08613', '547325', '2017-09-15 00:00:00', '9');
INSERT INTO `equipment` VALUES ('164', '8', null, null, 'LAPTOP 15.6 /CEL/4GB/500GB/DVD-RW(FM12) Model ', 'GDM017CELW950LU08581', '547327', '2017-09-15 00:00:00', '9');
INSERT INTO `equipment` VALUES ('165', '8', '7', '3', 'LAPTOP 15.6 /CEL/4GB/500GB/DVD-RW(FM12) Model ', 'GDM017CELW950LU08594', '547328', '2017-09-15 00:00:00', '9');
INSERT INTO `equipment` VALUES ('166', '8', '7', '3', 'LAPTOP 15.6 /CEL/4GB/500GB/DVD-RW(FM12) Model ', 'GDM017CELW950LU08327', '547329', '2017-09-15 00:00:00', '9');
INSERT INTO `equipment` VALUES ('167', '8', null, null, 'LAPTOP 15.6 /CEL/4GB/500GB/DVD-RW(FM12) Model ', 'GDM017CELW950LU08588', '547330', '2017-09-15 00:00:00', '9');
INSERT INTO `equipment` VALUES ('168', '8', '6', null, 'LAPTOP 15.6 /CEL/4GB/500GB/DVD-RW(FM12) Model ', 'GDM017CELW950LU08638', '547331', '2017-09-15 00:00:00', '9');
INSERT INTO `equipment` VALUES ('169', '8', '3', null, 'LAPTOP 15.6 /CEL/4GB/500GB/DVD-RW(FM12) Model ', 'GDM017CELW950LU08536', '547332', '2017-09-15 00:00:00', '9');
INSERT INTO `equipment` VALUES ('170', '8', '4', '17', 'LAPTOP 15.6 /CEL/4GB/500GB/DVD-RW(FM12) Model ', 'GDM017CELW950LU08617', '547333', '2017-09-15 00:00:00', '9');
INSERT INTO `equipment` VALUES ('171', '8', '5', '1', 'LAPTOP 15.6 /CEL/4GB/500GB/DVD-RW(FM12) Model ', 'GDM017CELW950LU08612', '547334', '2017-09-15 00:00:00', '9');
INSERT INTO `equipment` VALUES ('172', '8', '17', '16', 'LAPTOP 15.6 /CEL/4GB/500GB/DVD-RW(FM12) Model ', 'GDM017CELW950LU08633', '547319', '2017-09-15 00:00:00', '9');
INSERT INTO `equipment` VALUES ('173', '8', '13', '12', 'LAPTOP 15.6 /CEL/4GB/500GB/DVD-RW(FM12) Model ', 'GDM017CELW950LU08323', '547326', '2017-09-15 00:00:00', '9');
INSERT INTO `equipment` VALUES ('174', '9', '2', null, 'LAPTOP GDM 15.6 /I3-61000/4GB/500GB/DVD-RW(FMT2)', 'GDM01713W950JU01696', '547240', '2017-05-12 00:00:00', '11');
INSERT INTO `equipment` VALUES ('175', '9', '2', null, 'LAPTOP GDM 15.6 /I3-61000/4GB/500GB/DVD-RW(FMT2)', 'GDM01713W950JU01657', '547241', '2017-05-12 00:00:00', '11');
INSERT INTO `equipment` VALUES ('176', '9', '2', null, 'LAPTOP GDM 15.6 /I3-61000/4GB/500GB/DVD-RW(FMT2)', 'GDM01713W950JU01655', '547242', '2017-05-12 00:00:00', '11');
INSERT INTO `equipment` VALUES ('177', '9', '2', null, 'LAPTOP GDM 15.6 /I3-61000/4GB/500GB/DVD-RW(FMT2)', 'GDM01713W950JU01632', '547243', '2017-05-12 00:00:00', '11');
INSERT INTO `equipment` VALUES ('178', '8', null, null, 'LAPTOP GDM 15.6 /CEL/4GB/500GB/DVD-RW(FMT2)', 'GDM017CELW950JU03382', '547230', '2017-05-12 00:00:00', '11');
INSERT INTO `equipment` VALUES ('179', '8', null, null, 'LAPTOP GDM 15.6 /CEL/4GB/500GB/DVD-RW(FMT2)', 'GDM017CELW950JU03360', '547231', '2017-05-12 00:00:00', '11');
INSERT INTO `equipment` VALUES ('180', '8', null, null, 'LAPTOP GDM 15.6 /CEL/4GB/500GB/DVD-RW(FMT2)', 'GDM017CELW950JU03364', '547232', '2017-05-12 00:00:00', '11');
INSERT INTO `equipment` VALUES ('181', '8', null, null, 'LAPTOP GDM 15.6 /CEL/4GB/500GB/DVD-RW(FMT2)', 'GDM017CELW950JU02996', '547233', '2017-05-12 00:00:00', '11');
INSERT INTO `equipment` VALUES ('182', '8', null, null, 'LAPTOP GDM 15.6 /CEL/4GB/500GB/DVD-RW(FMT2)', 'GDM017CELW950JU03045', '547234', '2017-05-12 00:00:00', '11');
INSERT INTO `equipment` VALUES ('183', '8', null, null, 'LAPTOP GDM 15.6 /CEL/4GB/500GB/DVD-RW(FMT2)', 'GDM017CELW950JU03386', '547235', '2017-05-12 00:00:00', '11');
INSERT INTO `equipment` VALUES ('184', '8', null, null, 'LAPTOP GDM 15.6 /CEL/4GB/500GB/DVD-RW(FMT2)', 'GDM017CELW950JU03084', '547236', '2017-05-12 00:00:00', '11');
INSERT INTO `equipment` VALUES ('185', '8', null, null, 'LAPTOP GDM 15.6 /CEL/4GB/500GB/DVD-RW(FMT2)', 'GDM017CELW950JU03035', '547237', '2017-05-12 00:00:00', '11');
INSERT INTO `equipment` VALUES ('186', '8', null, null, 'LAPTOP GDM 15.6 /CEL/4GB/500GB/DVD-RW(FMT2)', 'GDM017CELW950JU03397', '547238', '2017-05-12 00:00:00', '11');
INSERT INTO `equipment` VALUES ('187', '8', null, null, 'LAPTOP GDM 15.6 /CEL/4GB/500GB/DVD-RW(FMT2)', 'GDM017CELW950JU03378', '547239', '2017-05-12 00:00:00', '11');
INSERT INTO `equipment` VALUES ('222', '10', null, null, 'MONITOR TFT LCD-LED de 21.5 HL-215B22 S/HDMI', 'J200F6E0G00Y6H2G5331', '547335', '2017-10-27 11:15:04', '13');
INSERT INTO `equipment` VALUES ('223', '10', null, null, 'MONITOR TFT LCD-LED de 21.5 HL-215B22 S/HDMI', 'J200F6E0G00Y6H2G6148', '547336', '2017-10-27 11:15:04', '13');
INSERT INTO `equipment` VALUES ('224', '10', null, null, 'MONITOR TFT LCD-LED de 21.5 HL-215B22 S/HDMI', 'J200F6E0G00Y6H2G3013', '547337', '2017-10-27 11:15:04', '13');
INSERT INTO `equipment` VALUES ('225', '10', null, null, 'MONITOR TFT LCD-LED de 21.5 HL-215B22 S/HDMI', 'J200F6E0G00Y6H2G0352', '547338', '2017-10-27 11:15:04', '13');
INSERT INTO `equipment` VALUES ('226', '10', null, null, 'MONITOR TFT LCD-LED de 21.5 HL-215B22 S/HDMI', 'J200F6E0G00Y6H2G0324', '547339', '2017-10-27 11:15:04', '13');
INSERT INTO `equipment` VALUES ('227', '10', null, null, 'MONITOR TFT LCD-LED de 21.5 HL-215B22 S/HDMI', 'J200F6E0G00Y6H2G5335', '547340', '2017-10-27 11:15:04', '13');
INSERT INTO `equipment` VALUES ('228', '10', null, null, 'MONITOR TFT LCD-LED de 21.5 HL-215B22 S/HDMI', 'J200F6E0G00Y6H2G0339', '547341', '2017-10-27 11:15:04', '13');
INSERT INTO `equipment` VALUES ('229', '10', null, null, 'MONITOR TFT LCD-LED de 21.5 HL-215B22 S/HDMI', 'J200F6E0G00Y6H2G0322', '547342', '2017-10-27 11:15:04', '13');
INSERT INTO `equipment` VALUES ('230', '10', null, null, 'MONITOR TFT LCD-LED de 21.5 HL-215B22 S/HDMI', 'J200F6E0G00Y6H2G0359', '547343', '2017-10-27 11:15:04', '13');
INSERT INTO `equipment` VALUES ('231', '10', null, null, 'MONITOR TFT LCD-LED de 21.5 HL-215B22 S/HDMI', 'J200F6E0G00Y6H2G0358', '547344', '2017-10-27 11:15:04', '13');
INSERT INTO `equipment` VALUES ('232', '10', null, null, 'MONITOR TFT LCD-LED de 21.5 HL-215B22 S/HDMI', 'J200F6E0G00Y6H2G5332', '547345', '2017-10-27 11:15:04', '13');
INSERT INTO `equipment` VALUES ('233', '10', null, null, 'MONITOR TFT LCD-LED de 21.5 HL-215B22 S/HDMI', 'J200F6E0G00Y6H2G5393', '547346', '2017-10-27 11:15:04', '13');
INSERT INTO `equipment` VALUES ('234', '10', null, null, 'MONITOR TFT LCD-LED de 21.5 HL-215B22 S/HDMI', 'J200F6E0G00Y6H2G0353', '547347', '2017-10-27 11:15:04', '13');
INSERT INTO `equipment` VALUES ('235', '10', null, null, 'MONITOR TFT LCD-LED de 21.5 HL-215B22 S/HDMI', 'J200F6E0G00Y6H2G0328', '547348', '2017-10-27 11:15:04', '13');
INSERT INTO `equipment` VALUES ('236', '10', null, null, 'MONITOR TFT LCD-LED de 21.5 HL-215B22 S/HDMI', 'J200F6E0G00Y6H2G6123', '547349', '2017-10-27 11:15:04', '13');
INSERT INTO `equipment` VALUES ('237', '10', null, null, 'MONITOR TFT LCD-LED de 21.5 HL-215B22 S/HDMI', 'J200F6E0G00Y6H2G5334', '547350', '2017-10-27 11:15:04', '13');
INSERT INTO `equipment` VALUES ('238', '10', null, null, 'MONITOR TFT LCD-LED de 21.5 HL-215B22 S/HDMI', 'J200F6E0G00Y6H2G5352', '547351', '2017-10-27 11:15:04', '13');
INSERT INTO `equipment` VALUES ('239', '10', null, null, 'MONITOR TFT LCD-LED de 21.5 HL-215B22 S/HDMI', 'J200F6E0G00Y6H2G0912', '547352', '2017-10-27 11:15:04', '13');
INSERT INTO `equipment` VALUES ('240', '10', null, null, 'MONITOR TFT LCD-LED de 21.5 HL-215B22 S/HDMI', 'J200F6E0G00Y6H2G2962', '547353', '2017-10-27 11:15:04', '13');
INSERT INTO `equipment` VALUES ('241', '10', null, null, 'MONITOR TFT LCD-LED de 21.5 HL-215B22 S/HDMI', 'J200F6E0G00Y6H2G6149', '547354', '2017-10-27 11:15:04', '13');
INSERT INTO `equipment` VALUES ('242', '10', null, null, 'MONITOR TFT LCD-LED de 21.5 HL-215B22 S/HDMI', 'J200F6E0G00Y6H2G6151', '547355', '2017-10-27 11:15:04', '13');
INSERT INTO `equipment` VALUES ('243', '10', null, null, 'MONITOR TFT LCD-LED de 21.5 HL-215B22 S/HDMI', 'J200F6E0G00Y6H2G0334', '547356', '2017-10-27 11:15:04', '13');
INSERT INTO `equipment` VALUES ('244', '10', null, null, 'MONITOR TFT LCD-LED de 21.5 HL-215B22 S/HDMI', 'J200F6E0G00Y6H2G5339', '547357', '2017-10-27 11:15:04', '13');
INSERT INTO `equipment` VALUES ('245', '10', null, null, 'MONITOR TFT LCD-LED de 21.5 HL-215B22 S/HDMI', 'J200F6E0G00Y6H2G5338', '547358', '2017-10-27 11:15:04', '13');
INSERT INTO `equipment` VALUES ('246', '10', '8', null, 'MONITOR TFT LCD-LED de 21.5 HL-215B22 S/HDMI', 'J200F6E0G00Y6H2G0326', '547359', '2017-10-27 11:15:04', '13');
INSERT INTO `equipment` VALUES ('247', '10', '8', null, 'MONITOR TFT LCD-LED de 21.5 HL-215B22 S/HDMI', 'J200F6E0G00Y6H2G0331', '547360', '2017-10-27 11:15:04', '13');
INSERT INTO `equipment` VALUES ('248', '10', null, null, 'MONITOR TFT LCD-LED de 21.5 HL-215B22 S/HDMI', 'J200F6E0G00Y6H2G5340', '547361', '2017-10-27 11:15:04', '13');
INSERT INTO `equipment` VALUES ('249', '10', null, null, 'MONITOR TFT LCD-LED de 21.5 HL-215B22 S/HDMI', 'J200F6E0G00Y6H2G5349', '547362', '2017-10-27 11:15:04', '13');
INSERT INTO `equipment` VALUES ('250', '10', null, null, 'MONITOR TFT LCD-LED de 21.5 HL-215B22 S/HDMI', 'J200F6E0G00Y6H2G5358', '547363', '2017-10-27 11:15:04', '13');
INSERT INTO `equipment` VALUES ('251', '10', null, null, 'MONITOR TFT LCD-LED de 21.5 HL-215B22 S/HDMI', 'J200F6E0G00Y6H2G0356', '547364', '2017-10-27 11:15:04', '13');
INSERT INTO `equipment` VALUES ('252', '10', null, null, 'MONITOR TFT LCD-LED de 21.5 HL-215B22 S/HDMI', 'J200F6E0G00Y6H2G0351', '547365', '2017-10-27 11:15:04', '13');
INSERT INTO `equipment` VALUES ('253', '10', null, null, 'MONITOR TFT LCD-LED de 21.5 HL-215B22 S/HDMI', 'J200F6E0G00Y6H2G5396', '547366', '2017-10-27 11:15:04', '13');
INSERT INTO `equipment` VALUES ('254', '10', null, null, 'MONITOR TFT LCD-LED de 21.5 HL-215B22 S/HDMI', 'J200F6E0G00Y6H2G0329', '547367', '2017-10-27 11:15:04', '13');
INSERT INTO `equipment` VALUES ('255', '10', null, null, 'MONITOR TFT LCD-LED de 21.5 HL-215B22 S/HDMI', 'J200F6E0G00Y6H2G0337', '547368', '2017-10-27 11:15:04', '13');
INSERT INTO `equipment` VALUES ('256', '10', null, null, 'MONITOR TFT LCD-LED de 21.5 HL-215B22 S/HDMI', 'J200F6E0G00Y6H2G6139', '547369', '2017-10-27 11:15:04', '13');
INSERT INTO `equipment` VALUES ('257', '10', null, null, 'MONITOR TFT LCD-LED de 21.5 HL-215B22 S/HDMI', 'J200F6E0G00Y6H2G6143', '547370', '2017-10-27 11:15:04', '13');
INSERT INTO `equipment` VALUES ('258', '10', null, null, 'MONITOR TFT LCD-LED de 21.5 HL-215B22 S/HDMI', 'J200F6E0G00Y6H2G2997', '547371', '2017-10-27 11:15:04', '13');
INSERT INTO `equipment` VALUES ('259', '10', null, null, 'MONITOR TFT LCD-LED de 21.5 HL-215B22 S/HDMI', 'J200F6E0G00Y6H2G0871', '547372', '2017-10-27 11:15:04', '13');
INSERT INTO `equipment` VALUES ('260', '10', null, null, 'MONITOR TFT LCD-LED de 21.5 HL-215B22 S/HDMI', 'J200F6E0G00Y6H2G6131', '547373', '2017-10-27 11:15:04', '13');
INSERT INTO `equipment` VALUES ('261', '10', null, null, 'MONITOR TFT LCD-LED de 21.5 HL-215B22 S/HDMI', 'J200F6E0G00Y6H2G6135', '547374', '2017-10-27 11:15:04', '13');
INSERT INTO `equipment` VALUES ('262', '10', null, null, 'MONITOR TFT LCD-LED de 21.5 HL-215B22 S/HDMI', 'J200F6E0G00Y6H2G6163', '547375', '2017-10-27 11:15:04', '13');
INSERT INTO `equipment` VALUES ('263', '10', null, null, 'MONITOR TFT LCD-LED de 21.5 HL-215B22 S/HDMI', 'J200F6E0G00Y6H2G6141', '547376', '2017-10-27 11:15:04', '13');
INSERT INTO `equipment` VALUES ('264', '10', null, null, 'MONITOR TFT LCD-LED de 21.5 HL-215B22 S/HDMI', 'J200F6E0G00Y6H2G5344', '547377', '2017-10-27 11:15:04', '13');
INSERT INTO `equipment` VALUES ('265', '10', null, null, 'MONITOR TFT LCD-LED de 21.5 HL-215B22 S/HDMI', 'J200F6E0G00Y6H2G5392', '547378', '2017-10-27 11:15:04', '13');
INSERT INTO `equipment` VALUES ('266', '10', null, null, 'MONITOR TFT LCD-LED de 21.5 HL-215B22 S/HDMI', 'J200F6E0G00Y6H2G5353', '547379', '2017-10-27 11:15:04', '13');
INSERT INTO `equipment` VALUES ('267', '10', null, null, 'MONITOR TFT LCD-LED de 21.5 HL-215B22 S/HDMI', 'J200F6E0G00Y6H2G5345', '547380', '2017-10-27 11:15:04', '13');
INSERT INTO `equipment` VALUES ('268', '10', null, null, 'MONITOR TFT LCD-LED de 21.5 HL-215B22 S/HDMI', 'J200F6E0G00Y6H2G5341', '547381', '2017-10-27 11:15:04', '13');
INSERT INTO `equipment` VALUES ('269', '10', null, null, 'MONITOR TFT LCD-LED de 21.5 HL-215B22 S/HDMI', 'J200F6E0G00Y6H2G0305', '547382', '2017-10-27 11:15:04', '13');
INSERT INTO `equipment` VALUES ('270', '10', null, null, 'MONITOR TFT LCD-LED de 21.5 HL-215B22 S/HDMI', 'J200F6E0G00Y6H2G0335', '547383', '2017-10-27 11:15:04', '13');
INSERT INTO `equipment` VALUES ('271', '10', null, null, 'MONITOR TFT LCD-LED de 21.5 HL-215B22 S/HDMI', 'J200F6E0G00Y6H2G0302', '547384', '2017-10-27 11:15:04', '13');
INSERT INTO `equipment` VALUES ('272', '10', null, null, 'MONITOR TFT LCD-LED de 21.5 HL-215B22 S/HDMI', 'J200F6E0G00Y6H2G0341', '547385', '2017-10-27 11:15:04', '13');
INSERT INTO `equipment` VALUES ('273', '10', null, null, 'MONITOR TFT LCD-LED de 21.5 HL-215B22 S/HDMI', 'J200F6E0G00Y6H2G2951', '547386', '2017-10-27 11:15:04', '13');
INSERT INTO `equipment` VALUES ('274', '10', null, null, 'MONITOR TFT LCD-LED de 21.5 HL-215B22 S/HDMI', 'J200F6E0G00Y6H2G0970', '547387', '2017-10-27 11:15:04', '13');
INSERT INTO `equipment` VALUES ('275', '10', null, null, 'MONITOR TFT LCD-LED de 21.5 HL-215B22 S/HDMI', 'J200F6E0G00Y6H2G2998', '547388', '2017-10-27 11:15:04', '13');
INSERT INTO `equipment` VALUES ('276', '10', null, null, 'MONITOR TFT LCD-LED de 21.5 HL-215B22 S/HDMI', 'J200F6E0G00Y6H2G0319', '547389', '2017-10-27 11:15:04', '13');
INSERT INTO `equipment` VALUES ('277', '10', '36', '37', 'MONITOR TFT LCD-LED de 21.5 HL-215B22 S/HDMI', 'J200F6E0G00Y6H2G0349', '547390', '2017-10-27 11:15:04', '13');
INSERT INTO `equipment` VALUES ('278', '10', '36', '37', 'MONITOR TFT LCD-LED de 21.5 HL-215B22 S/HDMI', 'J200F6E0G00Y6H2G5351', '547391', '2017-10-27 11:15:04', '13');
INSERT INTO `equipment` VALUES ('279', '10', '36', '37', 'MONITOR TFT LCD-LED de 21.5 HL-215B22 S/HDMI', 'J200F6E0G00Y6H2G5330', '547392', '2017-10-27 11:15:04', '13');
INSERT INTO `equipment` VALUES ('280', '10', '36', '37', 'MONITOR TFT LCD-LED de 21.5 HL-215B22 S/HDMI', 'J200F6E0G00Y6H2G5347', '547393', '2017-10-27 11:15:04', '13');
INSERT INTO `equipment` VALUES ('281', '10', '36', '37', 'MONITOR TFT LCD-LED de 21.5 HL-215B22 S/HDMI', 'J200F6E0G00Y6H2G6128', '547394', '2017-10-27 11:15:04', '13');
INSERT INTO `equipment` VALUES ('282', '10', '36', '37', 'MONITOR TFT LCD-LED de 21.5 HL-215B22 S/HDMI', 'J200F6E0G00Y6H2G3003', '547395', '2017-10-27 11:15:04', '13');
INSERT INTO `equipment` VALUES ('283', '10', '36', '37', 'MONITOR TFT LCD-LED de 21.5 HL-215B22 S/HDMI', 'J200F6E0G00Y6H2G0340', '547396', '2017-10-27 11:15:04', '13');
INSERT INTO `equipment` VALUES ('284', '10', '36', '37', 'MONITOR TFT LCD-LED de 21.5 HL-215B22 S/HDMI', 'J200F6E0G00Y6H2G0347', '547397', '2017-10-27 11:15:04', '13');
INSERT INTO `equipment` VALUES ('285', '10', null, null, 'MONITOR TFT LCD-LED de 21.5 HL-215B22 S/HDMI', 'J200F6E0G00Y6H2G5336', '547398', '2017-10-27 11:15:04', '13');
INSERT INTO `equipment` VALUES ('286', '10', '8', null, 'MONITOR TFT LCD-LED de 21.5 HL-215B22 S/HDMI', 'J200F6E0G00Y6H2G0229', '547399', '2017-10-27 11:15:04', '13');
INSERT INTO `equipment` VALUES ('287', '10', null, null, 'MONITOR TFT LCD-LED de 21.5 HL-215B22 S/HDMI', 'J200F6E0G00Y6H2G0357', '547400', '2017-10-27 11:15:04', '13');
INSERT INTO `equipment` VALUES ('288', '10', '8', null, 'MONITOR TFT LCD-LED de 21.5 HL-215B22 S/HDMI', 'J200F6E0G00Y6H2G0348', '547401', '2017-10-27 11:15:04', '13');
INSERT INTO `equipment` VALUES ('289', '10', null, null, 'MONITOR TFT LCD-LED de 21.5 HL-215B22 S/HDMI', 'J200F6E0G00Y6H2G0342', '547402', '2017-10-27 11:15:04', '13');
INSERT INTO `equipment` VALUES ('290', '10', '8', null, 'MONITOR TFT LCD-LED de 21.5 HL-215B22 S/HDMI', 'J200F6E0G00Y6H2G0360', '547403', '2017-10-27 11:15:04', '13');
INSERT INTO `equipment` VALUES ('291', '10', null, null, 'MONITOR TFT LCD-LED de 21.5 HL-215B22 S/HDMI', 'J200F6E0G00Y6H2G0332', '547404', '2017-10-27 11:15:04', '13');
INSERT INTO `equipment` VALUES ('292', '11', null, null, 'MONITOR TFT LDC-LED de 18.5 HL-1805WH', 'J200F6E0H00Y6H161280', '547405', '2017-10-28 10:00:56', '12');
INSERT INTO `equipment` VALUES ('293', '11', null, null, 'MONITOR TFT LDC-LED de 18.5 HL-1805WH', 'J200F6E0H00Y6H163058', '547406', '2017-10-28 10:00:56', '12');
INSERT INTO `equipment` VALUES ('294', '11', null, null, 'MONITOR TFT LDC-LED de 18.5 HL-1805WH', 'J200F6E0H00Y6H163159', '547407', '2017-10-28 10:00:56', '12');
INSERT INTO `equipment` VALUES ('295', '11', null, null, 'MONITOR TFT LDC-LED de 18.5 HL-1805WH', 'J200F6E0H00Y6H161806', '547408', '2017-10-28 10:00:56', '12');
INSERT INTO `equipment` VALUES ('296', '11', null, null, 'MONITOR TFT LDC-LED de 18.5 HL-1805WH', 'J200F6E0H00Y6H162636', '547409', '2017-10-28 10:00:56', '12');
INSERT INTO `equipment` VALUES ('297', '11', null, null, 'MONITOR TFT LDC-LED de 18.5 HL-1805WH', 'J200F6E0H00Y6H163050', '547410', '2017-10-28 10:00:56', '12');
INSERT INTO `equipment` VALUES ('298', '11', null, null, 'MONITOR TFT LDC-LED de 18.5 HL-1805WH', 'J200F6E0H00Y6H161792', '547411', '2017-10-28 10:00:56', '12');
INSERT INTO `equipment` VALUES ('299', '11', null, null, 'MONITOR TFT LDC-LED de 18.5 HL-1805WH', 'J200F6E0H00Y6H162625', '547412', '2017-10-28 10:00:56', '12');
INSERT INTO `equipment` VALUES ('300', '11', null, null, 'MONITOR TFT LDC-LED de 18.5 HL-1805WH', 'J200F6E0H00Y6H162612', '547413', '2017-10-28 10:00:56', '12');
INSERT INTO `equipment` VALUES ('301', '11', null, null, 'MONITOR TFT LDC-LED de 18.5 HL-1805WH', 'J200F6E0H00Y6H161734', '547414', '2017-10-28 10:00:56', '12');
INSERT INTO `equipment` VALUES ('302', '11', null, null, 'MONITOR TFT LDC-LED de 18.5 HL-1805WH', 'J200F6E0H00Y6H162594', '547415', '2017-10-28 10:00:56', '12');
INSERT INTO `equipment` VALUES ('303', '11', null, null, 'MONITOR TFT LDC-LED de 18.5 HL-1805WH', 'J200F6E0H00Y6H161813', '547416', '2017-10-28 10:00:56', '12');
INSERT INTO `equipment` VALUES ('304', '11', null, null, 'MONITOR TFT LDC-LED de 18.5 HL-1805WH', 'J200F6E0H00Y6H161828', '547417', '2017-10-28 10:00:56', '12');
INSERT INTO `equipment` VALUES ('305', '11', '34', '35', 'MONITOR TFT LDC-LED de 18.5 HL-1805WH', 'J200F6E0H00Y6H162672', '547418', '2017-10-28 10:00:56', '12');
INSERT INTO `equipment` VALUES ('306', '11', '34', '35', 'MONITOR TFT LDC-LED de 18.5 HL-1805WH', 'J200F6E0H00Y6H162678', '547419', '2017-10-28 10:00:56', '12');
INSERT INTO `equipment` VALUES ('307', '11', '34', '35', 'MONITOR TFT LDC-LED de 18.5 HL-1805WH', 'J200F6E0H00Y6H164799', '547420', '2017-10-28 10:00:56', '12');
INSERT INTO `equipment` VALUES ('308', '11', '34', '35', 'MONITOR TFT LDC-LED de 18.5 HL-1805WH', 'J200F6E0H00Y6H162663', '547421', '2017-10-28 10:00:56', '12');
INSERT INTO `equipment` VALUES ('309', '11', '34', '35', 'MONITOR TFT LDC-LED de 18.5 HL-1805WH', 'J200F6E0H00Y6H162615', '547422', '2017-10-28 10:00:56', '12');
INSERT INTO `equipment` VALUES ('310', '11', '34', '35', 'MONITOR TFT LDC-LED de 18.5 HL-1805WH', 'J200F6E0H00Y6H162647', '547423', '2017-10-28 10:00:56', '12');
INSERT INTO `equipment` VALUES ('311', '11', '34', '35', 'MONITOR TFT LDC-LED de 18.5 HL-1805WH', 'J200F6E0H00Y6H161809', '547424', '2017-10-28 10:00:56', '12');
INSERT INTO `equipment` VALUES ('312', '11', '34', '35', 'MONITOR TFT LDC-LED de 18.5 HL-1805WH', 'J200F6E0H00Y6H161824', '547425', '2017-10-28 10:00:56', '12');
INSERT INTO `equipment` VALUES ('313', '11', '34', '35', 'MONITOR TFT LDC-LED de 18.5 HL-1805WH', 'J200F6E0H00Y6H163066', '547426', '2017-10-28 10:00:56', '12');
INSERT INTO `equipment` VALUES ('314', '11', '36', '37', 'MONITOR TFT LDC-LED de 18.5 HL-1805WH', 'J200F6E0H00Y6H161771', '547427', '2017-10-28 10:00:56', '12');
INSERT INTO `equipment` VALUES ('315', '11', '36', '37', 'MONITOR TFT LDC-LED de 18.5 HL-1805WH', 'J200F6E0H00Y6H162703', '547428', '2017-10-28 10:00:56', '12');
INSERT INTO `equipment` VALUES ('316', '11', '36', '37', 'MONITOR TFT LDC-LED de 18.5 HL-1805WH', 'J200F6E0H00Y6H162720', '547429', '2017-10-28 10:00:56', '12');
INSERT INTO `equipment` VALUES ('317', '11', '36', '37', 'MONITOR TFT LDC-LED de 18.5 HL-1805WH', 'J200F6E0H00Y6H162696', '547430', '2017-10-28 10:00:56', '12');
INSERT INTO `equipment` VALUES ('318', '11', '36', '37', 'MONITOR TFT LDC-LED de 18.5 HL-1805WH', 'J200F6E0H00Y6H162734', '547431', '2017-10-28 10:00:56', '12');
INSERT INTO `equipment` VALUES ('319', '11', '36', '37', 'MONITOR TFT LDC-LED de 18.5 HL-1805WH', 'J200F6E0H00Y6H161804', '547432', '2017-10-28 10:00:56', '12');
INSERT INTO `equipment` VALUES ('320', '11', '36', '37', 'MONITOR TFT LDC-LED de 18.5 HL-1805WH', 'J200F6E0H00Y6H161772', '547433', '2017-10-28 10:00:56', '12');
INSERT INTO `equipment` VALUES ('321', '11', '36', '37', 'MONITOR TFT LDC-LED de 18.5 HL-1805WH', 'J200F6E0H00Y6H162677', '547434', '2017-10-28 10:00:56', '12');
INSERT INTO `equipment` VALUES ('322', '11', '36', '37', 'MONITOR TFT LDC-LED de 18.5 HL-1805WH', 'J200F6E0H00Y6H164066', '547435', '2017-10-28 10:00:56', '12');
INSERT INTO `equipment` VALUES ('323', '11', '36', '37', 'MONITOR TFT LDC-LED de 18.5 HL-1805WH', 'J200F6E0H00Y6H162707', '547436', '2017-10-28 10:00:56', '12');
INSERT INTO `equipment` VALUES ('324', '11', '36', '37', 'MONITOR TFT LDC-LED de 18.5 HL-1805WH', 'J200F6E0H00Y6H162736', '547437', '2017-10-28 10:00:56', '12');
INSERT INTO `equipment` VALUES ('325', '11', '36', '37', 'MONITOR TFT LDC-LED de 18.5 HL-1805WH', 'J200F6E0H00Y6H162692', '547438', '2017-10-28 10:00:56', '12');
INSERT INTO `equipment` VALUES ('326', '11', '36', '37', 'MONITOR TFT LDC-LED de 18.5 HL-1805WH', 'J200F6E0H00Y6H162676', '547439', '2017-10-28 10:00:56', '12');
INSERT INTO `equipment` VALUES ('327', '11', '36', '37', 'MONITOR TFT LDC-LED de 18.5 HL-1805WH', 'J200F6E0H00Y6H162639', '547440', '2017-10-28 10:00:56', '12');
INSERT INTO `equipment` VALUES ('328', '11', '36', '37', 'MONITOR TFT LDC-LED de 18.5 HL-1805WH', 'J200F6E0H00Y6H163916', '547441', '2017-10-28 10:00:56', '12');
INSERT INTO `equipment` VALUES ('329', '11', '36', '37', 'MONITOR TFT LDC-LED de 18.5 HL-1805WH', 'J200F6E0H00Y6H162697', '547442', '2017-10-28 10:00:56', '12');
INSERT INTO `equipment` VALUES ('330', '11', '36', '37', 'MONITOR TFT LDC-LED de 18.5 HL-1805WH', 'J200F6E0H00Y6H162679', '547443', '2017-10-28 10:00:56', '12');
INSERT INTO `equipment` VALUES ('331', '11', '36', '37', 'MONITOR TFT LDC-LED de 18.5 HL-1805WH', 'J200F6E0H00Y6H161817', '547444', '2017-10-28 10:00:56', '12');
INSERT INTO `equipment` VALUES ('332', '11', '36', '37', 'MONITOR TFT LDC-LED de 18.5 HL-1805WH', 'J200F6E0H00Y6H163029', '547445', '2017-10-28 10:00:56', '12');
INSERT INTO `equipment` VALUES ('333', '11', '36', '37', 'MONITOR TFT LDC-LED de 18.5 HL-1805WH', 'J200F6E0H00Y6H161795', '547446', '2017-10-28 10:00:56', '12');
INSERT INTO `equipment` VALUES ('334', '11', '37', '38', 'MONITOR TFT LDC-LED de 18.5 HL-1805WH', 'J200F6E0H00Y6H161186', '547447', '2017-10-28 10:00:56', '12');
INSERT INTO `equipment` VALUES ('335', '11', '37', '38', 'MONITOR TFT LDC-LED de 18.5 HL-1805WH', 'J200F6E0H00Y6H163121', '547448', '2017-10-28 10:00:56', '12');
INSERT INTO `equipment` VALUES ('336', '11', '37', '38', 'MONITOR TFT LDC-LED de 18.5 HL-1805WH', 'J200F6E0H00Y6H161221', '547449', '2017-10-28 10:00:56', '12');
INSERT INTO `equipment` VALUES ('337', '11', '37', '38', 'MONITOR TFT LDC-LED de 18.5 HL-1805WH', 'J200F6E0H00Y6H162633', '547450', '2017-10-28 10:00:56', '12');
INSERT INTO `equipment` VALUES ('338', '11', '37', '38', 'MONITOR TFT LDC-LED de 18.5 HL-1805WH', 'J200F6E0H00Y6H163952', '547451', '2017-10-28 10:00:56', '12');
INSERT INTO `equipment` VALUES ('339', '11', '37', '38', 'MONITOR TFT LDC-LED de 18.5 HL-1805WH', 'J200F6E0H00Y6H163065', '547452', '2017-10-28 10:00:56', '12');
INSERT INTO `equipment` VALUES ('340', '11', '37', '38', 'MONITOR TFT LDC-LED de 18.5 HL-1805WH', 'J200F6E0H00Y6H163937', '547453', '2017-10-28 10:00:56', '12');
INSERT INTO `equipment` VALUES ('341', '11', '37', '38', 'MONITOR TFT LDC-LED de 18.5 HL-1805WH', 'J200F6E0H00Y6H162724', '547454', '2017-10-28 10:00:56', '12');
INSERT INTO `equipment` VALUES ('342', '11', '37', '38', 'MONITOR TFT LDC-LED de 18.5 HL-1805WH', 'J200F6E0H00Y6H162685', '547455', '2017-10-28 10:00:56', '12');
INSERT INTO `equipment` VALUES ('343', '11', '37', '38', 'MONITOR TFT LDC-LED de 18.5 HL-1805WH', 'J200F6E0H00Y6H161743', '547456', '2017-10-28 10:00:56', '12');
INSERT INTO `equipment` VALUES ('344', '11', '37', '38', 'MONITOR TFT LDC-LED de 18.5 HL-1805WH', 'J200F6E0H00Y6H161802', '547457', '2017-10-28 10:00:56', '12');
INSERT INTO `equipment` VALUES ('345', '11', '37', '38', 'MONITOR TFT LDC-LED de 18.5 HL-1805WH', 'J200F6E0H00Y6H161789', '547458', '2017-10-28 10:00:56', '12');
INSERT INTO `equipment` VALUES ('346', '11', '37', '38', 'MONITOR TFT LDC-LED de 18.5 HL-1805WH', 'J200F6E0H00Y6H161769', '547459', '2017-10-28 10:00:56', '12');
INSERT INTO `equipment` VALUES ('347', '11', '9', null, 'MONITOR TFT LDC-LED de 18.5 HL-1805WH', 'J200F6E0H00Y6H161729', '547460', '2017-10-28 10:00:56', '12');
INSERT INTO `equipment` VALUES ('348', '11', '35', '36', 'MONITOR TFT LDC-LED de 18.5 HL-1805WH', 'J200F6E0H00Y6H162627', '547461', '2017-10-28 10:00:56', '12');
INSERT INTO `equipment` VALUES ('349', '11', '35', '36', 'MONITOR TFT LDC-LED de 18.5 HL-1805WH', 'J200F6E0H00Y6H162712', '547462', '2017-10-28 10:00:56', '12');
INSERT INTO `equipment` VALUES ('350', '11', '35', '36', 'MONITOR TFT LDC-LED de 18.5 HL-1805WH', 'J200F6E0H00Y6H162694', '547463', '2017-10-28 10:00:56', '12');
INSERT INTO `equipment` VALUES ('351', '11', '35', '36', 'MONITOR TFT LDC-LED de 18.5 HL-1805WH', 'J200F6E0H00Y6H161992', '547464', '2017-10-28 10:00:56', '12');
INSERT INTO `equipment` VALUES ('352', '11', '35', '36', 'MONITOR TFT LDC-LED de 18.5 HL-1805WH', 'J200F6E0H00Y6H163026', '547465', '2017-10-28 10:00:56', '12');
INSERT INTO `equipment` VALUES ('353', '11', '35', '36', 'MONITOR TFT LDC-LED de 18.5 HL-1805WH', 'J200F6E0H00Y6H164806', '547466', '2017-10-28 10:00:56', '12');
INSERT INTO `equipment` VALUES ('354', '11', '38', '4', 'MONITOR TFT LDC-LED de 18.5 HL-1805WH', 'J200F6E0H00Y6H162731', '547467', '2017-10-28 10:00:56', '12');
INSERT INTO `equipment` VALUES ('355', '11', '38', '4', 'MONITOR TFT LDC-LED de 18.5 HL-1805WH', 'J200F6E0H00Y6H162691', '547468', '2017-10-28 10:00:56', '12');
INSERT INTO `equipment` VALUES ('356', '11', '38', '4', 'MONITOR TFT LDC-LED de 18.5 HL-1805WH', 'J200F6E0H00Y6H162641', '547469', '2017-10-28 10:00:56', '12');
INSERT INTO `equipment` VALUES ('357', '11', '38', '4', 'MONITOR TFT LDC-LED de 18.5 HL-1805WH', 'J200F6E0H00Y6H162695', '547470', '2017-10-28 10:00:56', '12');
INSERT INTO `equipment` VALUES ('358', '11', '38', '4', 'MONITOR TFT LDC-LED de 18.5 HL-1805WH', 'J200F6E0H00Y6H163964', '547471', '2017-10-28 10:00:56', '12');
INSERT INTO `equipment` VALUES ('359', '11', '38', '4', 'MONITOR TFT LDC-LED de 18.5 HL-1805WH', 'J200F6E0H00Y6H161748', '547472', '2017-10-28 10:00:56', '12');
INSERT INTO `equipment` VALUES ('360', '11', '38', '4', 'MONITOR TFT LDC-LED de 18.5 HL-1805WH', 'J200F6E0H00Y6H162604', '547473', '2017-10-28 10:00:56', '12');
INSERT INTO `equipment` VALUES ('361', '11', '38', '4', 'MONITOR TFT LDC-LED de 18.5 HL-1805WH', 'J200F6E0H00Y6H162600', '547474', '2017-10-28 10:00:56', '12');
INSERT INTO `equipment` VALUES ('362', '11', '38', '4', 'MONITOR TFT LDC-LED de 18.5 HL-1805WH', 'J200F6E0H00Y6H162675', '547475', '2017-10-28 10:00:56', '12');
INSERT INTO `equipment` VALUES ('363', '11', '38', '4', 'MONITOR TFT LDC-LED de 18.5 HL-1805WH', 'J200F6E0H00Y6H163977', '547476', '2017-10-28 10:00:56', '12');
INSERT INTO `equipment` VALUES ('364', '11', null, null, 'MONITOR TFT LDC-LED de 18.5 HL-1805WH', 'J200F6E0H00Y6H161801', '547477', '2017-10-28 10:00:56', '12');
INSERT INTO `equipment` VALUES ('365', '11', null, null, 'MONITOR TFT LDC-LED de 18.5 HL-1805WH', 'J200F6E0H00Y6H162596', '547478', '2017-10-28 10:00:56', '12');
INSERT INTO `equipment` VALUES ('366', '11', null, null, 'MONITOR TFT LDC-LED de 18.5 HL-1805WH', 'J200F6E0H00Y6H162670', '547479', '2017-10-28 10:00:56', '12');
INSERT INTO `equipment` VALUES ('367', '11', null, null, 'MONITOR TFT LDC-LED de 18.5 HL-1805WH', 'J200F6E0H00Y6H162658', '547480', '2017-10-28 10:00:56', '12');
INSERT INTO `equipment` VALUES ('368', '11', null, null, 'MONITOR TFT LDC-LED de 18.5 HL-1805WH', 'J200F6E0H00Y6H162713', '547481', '2017-10-28 10:00:56', '12');
INSERT INTO `equipment` VALUES ('369', '11', null, null, 'MONITOR TFT LDC-LED de 18.5 HL-1805WH', 'J200F6E0H00Y6H162664', '547482', '2017-10-28 10:00:56', '12');
INSERT INTO `equipment` VALUES ('370', '11', '9', null, 'MONITOR TFT LDC-LED de 18.5 HL-1805WH', 'J200F6E0H00Y6H162687', '547483', '2017-10-28 10:00:56', '12');
INSERT INTO `equipment` VALUES ('371', '11', '9', null, 'MONITOR TFT LDC-LED de 18.5 HL-1805WH', 'J200F6E0H00Y6H162628', '547484', '2017-10-28 10:00:56', '12');

-- ----------------------------
-- Table structure for hotel
-- ----------------------------
DROP TABLE IF EXISTS `hotel`;
CREATE TABLE `hotel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(70) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_3535ED95E237E06` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of hotel
-- ----------------------------
INSERT INTO `hotel` VALUES ('15', 'Auditores Santiago de Cuba');
INSERT INTO `hotel` VALUES ('39', 'Complejo Camagüey Ciudad');
INSERT INTO `hotel` VALUES ('33', 'Complejo Caneyes');
INSERT INTO `hotel` VALUES ('13', 'Complejo Copa-Chateu');
INSERT INTO `hotel` VALUES ('6', 'Complejo Las Terrazas');
INSERT INTO `hotel` VALUES ('32', 'Complejo Marina Hemingway');
INSERT INTO `hotel` VALUES ('35', 'Complejo Quinta');
INSERT INTO `hotel` VALUES ('19', 'Complejo Remedios');
INSERT INTO `hotel` VALUES ('41', 'Complejo Trinidad Ciudad');
INSERT INTO `hotel` VALUES ('45', 'Complejo Trinidad del Mar');
INSERT INTO `hotel` VALUES ('12', 'Complejo Tuxpan-Cactus');
INSERT INTO `hotel` VALUES ('44', 'Complejo Viñales');
INSERT INTO `hotel` VALUES ('23', 'Delegación Camagüey');
INSERT INTO `hotel` VALUES ('22', 'Delegación Ciego de Avila');
INSERT INTO `hotel` VALUES ('26', 'Delegación Occidente');
INSERT INTO `hotel` VALUES ('24', 'Delegación Stgo de Cuba');
INSERT INTO `hotel` VALUES ('21', 'Delegación Trinidad');
INSERT INTO `hotel` VALUES ('25', 'Delegación Varadero');
INSERT INTO `hotel` VALUES ('20', 'Empresa Integral Cienaga de Zapata');
INSERT INTO `hotel` VALUES ('38', 'Empresa Integral Turística de Gibara');
INSERT INTO `hotel` VALUES ('14', 'Hotel  Caracol Santa Lucia');
INSERT INTO `hotel` VALUES ('42', 'Hotel  Sierra Mar-Los Galeones');
INSERT INTO `hotel` VALUES ('7', 'Hotel Acuario');
INSERT INTO `hotel` VALUES ('8', 'Hotel Bella Costa');
INSERT INTO `hotel` VALUES ('17', 'Hotel Brisas Cobarrubias');
INSERT INTO `hotel` VALUES ('18', 'Hotel Brisas Santa Lucia');
INSERT INTO `hotel` VALUES ('16', 'Hotel Cayo Levisa');
INSERT INTO `hotel` VALUES ('28', 'Hotel Chateau Miramar');
INSERT INTO `hotel` VALUES ('40', 'Hotel Club Amigo Mayanabo');
INSERT INTO `hotel` VALUES ('30', 'Hotel Colonial Cayo Coco');
INSERT INTO `hotel` VALUES ('4', 'Hotel E Central Viñales');
INSERT INTO `hotel` VALUES ('3', 'Hotel La Ermita');
INSERT INTO `hotel` VALUES ('1', 'Hotel Los Jazmines');
INSERT INTO `hotel` VALUES ('10', 'Hotel Marazul');
INSERT INTO `hotel` VALUES ('31', 'Hotel Mariposa');
INSERT INTO `hotel` VALUES ('27', 'Hotel Melía Cohíba');
INSERT INTO `hotel` VALUES ('2', 'Hotel Rancho San Vicente');
INSERT INTO `hotel` VALUES ('29', 'Hotel Roc Santa Lucia');
INSERT INTO `hotel` VALUES ('9', 'Hotel Siboney');
INSERT INTO `hotel` VALUES ('5', 'Hotel Soroa');
INSERT INTO `hotel` VALUES ('34', 'Hotel Tryp Cayo Coco');
INSERT INTO `hotel` VALUES ('43', 'Hotel Versalles');
INSERT INTO `hotel` VALUES ('11', 'Hotel Villa Eulalia');

-- ----------------------------
-- Table structure for invoice
-- ----------------------------
DROP TABLE IF EXISTS `invoice`;
CREATE TABLE `invoice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `document` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `invoice_id` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of invoice
-- ----------------------------
INSERT INTO `invoice` VALUES ('7', '2017-06-12 00:00:00', 'Escaner de pasaporte COMBO SMART(45).pdf', 'F-17330133');
INSERT INTO `invoice` VALUES ('8', '2017-08-15 00:00:00', 'Factura Impresoras HP Laserjet pro MFP 227(50).pdf', 'FAC70622338');
INSERT INTO `invoice` VALUES ('9', '2017-09-17 00:00:00', 'Factura 26 Laptops GDM Celerones(26).pdf', 'FAC70622577');
INSERT INTO `invoice` VALUES ('11', '2017-05-12 00:00:00', '14 Laptop GDM (10 Celerones y 4 i3).pdf', 'FAC70621271');
INSERT INTO `invoice` VALUES ('12', '2017-10-27 00:00:00', 'Factura Monitores 18.5 ATEC-Haier HL-1805WH (80).pdf', 'FAC70623263');
INSERT INTO `invoice` VALUES ('13', '2017-10-27 00:00:00', null, 'FAC70623263');

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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of model
-- ----------------------------
INSERT INTO `model` VALUES ('1', '1', 'VG1930wm');
INSERT INTO `model` VALUES ('2', '2', 'LaserJet Pro 400');
INSERT INTO `model` VALUES ('3', '2', 'Laserjet P2015');
INSERT INTO `model` VALUES ('4', '2', 'Laserjet P2035');
INSERT INTO `model` VALUES ('5', '2', 'Lasertjet Pro MFP M227');
INSERT INTO `model` VALUES ('6', '2', 'Lasertjet 1536dnf MFP');
INSERT INTO `model` VALUES ('7', '8', 'COMBOSMART');
INSERT INTO `model` VALUES ('8', '9', 'W950LU');
INSERT INTO `model` VALUES ('9', '9', 'W950JU');
INSERT INTO `model` VALUES ('10', '4', 'HL 2105WH');
INSERT INTO `model` VALUES ('11', '4', 'HL-1805WH');

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
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of movement
-- ----------------------------
INSERT INTO `movement` VALUES ('1', '7', 'ME01-2018', '2018-08-09 00:00:00', null, 'me');
INSERT INTO `movement` VALUES ('3', '8', 'ME02-2018', '2018-07-02 00:00:00', null, 'me');
INSERT INTO `movement` VALUES ('4', '7', 'ME03-2018', '2018-02-06 00:00:00', null, 'me');
INSERT INTO `movement` VALUES ('6', '7', 'ME05-2018', '2018-02-08 00:00:00', null, 'me');
INSERT INTO `movement` VALUES ('7', '7', 'ME06-2018', '2018-02-13 00:00:00', null, 'me');
INSERT INTO `movement` VALUES ('8', '7', 'ME07-2018', '2017-11-06 00:00:00', null, 'me');
INSERT INTO `movement` VALUES ('9', '7', 'ME08-2018', '2017-11-08 00:00:00', null, 'me');
INSERT INTO `movement` VALUES ('11', '7', 'ME09-2018', '2017-11-17 00:00:00', null, 'me');
INSERT INTO `movement` VALUES ('12', '7', 'ME10-2018', '2017-11-17 00:00:00', null, 'me');
INSERT INTO `movement` VALUES ('13', '7', 'ME11-2018', '2017-11-24 00:00:00', null, 'me');
INSERT INTO `movement` VALUES ('14', '7', 'ME12-2018', '2017-11-07 00:00:00', null, 'me');
INSERT INTO `movement` VALUES ('15', '7', 'ME13-2018', '2018-01-30 00:00:00', null, 'me');
INSERT INTO `movement` VALUES ('16', '7', 'ME14-2018', '2017-11-17 00:00:00', null, 'me');
INSERT INTO `movement` VALUES ('17', '7', 'ME15-2018', '2018-08-10 00:00:00', null, 'me');
INSERT INTO `movement` VALUES ('18', '7', 'ME16-2018', '2017-11-21 00:00:00', null, 'me');
INSERT INTO `movement` VALUES ('19', '7', 'ME17-2018', '2017-11-15 00:00:00', null, 'me');
INSERT INTO `movement` VALUES ('20', '7', 'ME18-2018', '2017-11-06 00:00:00', null, 'me');
INSERT INTO `movement` VALUES ('21', '7', 'ME19-2018', '2017-11-14 00:00:00', null, 'me');
INSERT INTO `movement` VALUES ('22', '7', 'ME20-2018', '2017-11-20 00:00:00', null, 'me');
INSERT INTO `movement` VALUES ('23', '7', 'ME21-2018', '2017-11-13 00:00:00', null, 'me');
INSERT INTO `movement` VALUES ('25', '7', 'ME22-2018', '2017-11-17 00:00:00', null, 'me');
INSERT INTO `movement` VALUES ('26', '7', 'ME23-2018', '2017-11-08 00:00:00', null, 'me');
INSERT INTO `movement` VALUES ('27', '7', 'ME24-2018', '2017-11-10 00:00:00', null, 'me');
INSERT INTO `movement` VALUES ('28', '7', 'ME25-2018', '2017-11-10 00:00:00', null, 'me');
INSERT INTO `movement` VALUES ('30', '7', 'ME27-2018', '2017-11-08 00:00:00', null, 'me');
INSERT INTO `movement` VALUES ('31', '7', 'ME28-2018', '2017-11-28 00:00:00', null, 'me');
INSERT INTO `movement` VALUES ('32', '7', 'ME29-2018', '2017-11-21 00:00:00', null, 'me');
INSERT INTO `movement` VALUES ('33', '7', 'ME30-2018', '2017-11-06 00:00:00', null, 'me');
INSERT INTO `movement` VALUES ('34', '7', 'ME31-2018', '2017-11-14 00:00:00', null, 'me');
INSERT INTO `movement` VALUES ('35', '7', 'ME32-2018', '2017-12-06 00:00:00', null, 'me');
INSERT INTO `movement` VALUES ('36', '8', 'ME33-2018', '2018-01-06 00:00:00', null, 'me');
INSERT INTO `movement` VALUES ('37', '7', 'ME34-2018', '2018-02-07 00:00:00', null, 'me');
INSERT INTO `movement` VALUES ('38', '7', 'ME35-2018', '2018-01-19 00:00:00', null, 'me');
INSERT INTO `movement` VALUES ('43', '7', 'ME34-2018', '2018-02-06 00:00:00', null, 'me');
INSERT INTO `movement` VALUES ('45', '7', 'ME35-2018', '2017-11-07 00:00:00', null, 'me');

-- ----------------------------
-- Table structure for m_e
-- ----------------------------
DROP TABLE IF EXISTS `m_e`;
CREATE TABLE `m_e` (
  `id` int(11) NOT NULL,
  `hotel_id` int(11) DEFAULT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ocupation` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `CI` bigint(20) NOT NULL,
  `license` bigint(20) DEFAULT NULL,
  `number_plate` varchar(8) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_BFB5552D3243BB18` (`hotel_id`),
  CONSTRAINT `FK_BFB5552D3243BB18` FOREIGN KEY (`hotel_id`) REFERENCES `hotel` (`id`),
  CONSTRAINT `FK_BFB5552DBF396750` FOREIGN KEY (`id`) REFERENCES `movement` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of m_e
-- ----------------------------
INSERT INTO `m_e` VALUES ('1', '10', 'Jannette Garcés Díaz', 'Subdirectora General', '71110814334', null, null);
INSERT INTO `m_e` VALUES ('3', '15', 'Omar Milán Torres', 'Director General(Complejo Los Caneyes)', '68122516086', null, 'B107578');
INSERT INTO `m_e` VALUES ('4', '42', 'Javier Francisco Bermúdez Olivares', 'Especialista Informático', '63062012806', null, null);
INSERT INTO `m_e` VALUES ('6', '43', 'Luis Alverto Zayas Muguercia', 'Asesor Jurídico(Melía Santiago)', '75010748106', null, null);
INSERT INTO `m_e` VALUES ('7', '8', 'Ibia Betancourt Asen', 'Directora General', '61120913336', null, null);
INSERT INTO `m_e` VALUES ('8', '16', 'Diosdado Guerrero Piñeiro', 'Comprador', '74052700909', null, null);
INSERT INTO `m_e` VALUES ('9', '17', 'Salvador Otazua Peña', 'Subdirector Económico', '73092202308', null, null);
INSERT INTO `m_e` VALUES ('11', '18', 'Hildemar Izada', 'Especialista Informático', '77012216828', '0', 'T0124112');
INSERT INTO `m_e` VALUES ('12', '19', 'Erick Castillo Mesa', 'Subdirector Económico', '74121129901', null, null);
INSERT INTO `m_e` VALUES ('13', '20', 'Jorge Miranda', 'Subdirector Económico', '68120309289', null, null);
INSERT INTO `m_e` VALUES ('14', '21', 'Yusleidy González Cabeza', 'Delegada', '75022908510', null, null);
INSERT INTO `m_e` VALUES ('15', '22', 'Rogelio Garcia Garcia', 'Delegado', '69051807941', null, null);
INSERT INTO `m_e` VALUES ('16', '23', 'Raicel Pacheco Mora', 'Económico', '79040216428', null, null);
INSERT INTO `m_e` VALUES ('17', '11', 'Esperanza Julia Sotolongo Ramos', 'Subdirectora General', '65030501233', null, null);
INSERT INTO `m_e` VALUES ('18', '24', 'Liudmila Vicente Fonseca', 'Especialista en Gestión Economica', '72120911812', null, null);
INSERT INTO `m_e` VALUES ('19', '25', 'Leandro Rodríguez Cedeño', 'Especialista Energético', '90082530465', null, null);
INSERT INTO `m_e` VALUES ('20', '26', 'Carlos Miguel Rosales Paz', 'Delegado', '68092610702', null, null);
INSERT INTO `m_e` VALUES ('21', '5', 'Dairon Soler Garcia', 'Especialista SSTT', '88102701324', null, null);
INSERT INTO `m_e` VALUES ('22', '27', 'Rolando Llanes Peña', 'Esp. Principal de informática', '87121109663', null, null);
INSERT INTO `m_e` VALUES ('23', '28', 'Jorge Enrrique Fernández Garcia', 'Sudirector Económico', '86022507767', null, null);
INSERT INTO `m_e` VALUES ('25', '29', 'Hildemar Izada Santana', 'Especialista Informático', '77012216828', '0', 'T0124112');
INSERT INTO `m_e` VALUES ('26', '30', 'Osiry Alvarez Morales', 'Subdirector de RRHH', '68111404789', null, null);
INSERT INTO `m_e` VALUES ('27', '31', 'Alexander Aguilar Rodríguez', 'Director General', '871110831786', null, null);
INSERT INTO `m_e` VALUES ('28', '32', 'Brucerlie García García', 'Encargado de Almacen', '80082919108', null, null);
INSERT INTO `m_e` VALUES ('30', '34', 'Osiry Alvarez Morales', 'Subdirector de RRHH', '68111404789', null, null);
INSERT INTO `m_e` VALUES ('31', '35', 'Yaisley Rodríguez Marrero', 'Directora  General', '83061908733', null, null);
INSERT INTO `m_e` VALUES ('32', '38', 'Yudirka Ramirez Tejeda', 'Especialista en Gestión Económica', '84072020814', null, null);
INSERT INTO `m_e` VALUES ('33', '4', 'Diosdado Guerrero Piñeiro', 'Comprador', '74052700909', null, null);
INSERT INTO `m_e` VALUES ('34', '39', 'Juan José Díaz Tong', 'Director General', '63032708508', null, null);
INSERT INTO `m_e` VALUES ('35', '18', 'Vladimir Aguilera Garrido', 'J\' SSTT', '66011005201', null, null);
INSERT INTO `m_e` VALUES ('36', '40', 'Pedro Suarez Chamorro', 'J\' Compra', '54111303905', '1871145', 'B091-648');
INSERT INTO `m_e` VALUES ('37', '20', 'Osmany Vazquez Carballea', 'Comprador', '67072022360', null, null);
INSERT INTO `m_e` VALUES ('38', '45', 'Loanny Ruíz Rojas', 'Chofer', '83122513160', null, null);
INSERT INTO `m_e` VALUES ('43', '33', 'Omar Milan Torres', 'Director General', '68122516086', null, null);
INSERT INTO `m_e` VALUES ('45', '33', 'Alberto Cardenas Aguiar', 'Esp. Informatico', '88072214207', null, null);

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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of person
-- ----------------------------
INSERT INTO `person` VALUES ('1', '1', 'Odalis Villalobo Crespo', 'Especialista');
INSERT INTO `person` VALUES ('2', '1', 'Rafael Llames Izquierdo', 'Director');
INSERT INTO `person` VALUES ('3', '1', 'Rudy Gomez', 'Especialista');
INSERT INTO `person` VALUES ('4', '13', 'José Garrido Silverio', 'Vicepresidente');
INSERT INTO `person` VALUES ('5', '14', 'Niurka Pérez Denis', 'Directora');
INSERT INTO `person` VALUES ('6', '15', 'Humberto Cornillot', 'J\' Grupo');
INSERT INTO `person` VALUES ('7', '4', 'Moises Garcia Suarez', 'Director');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `role` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', 'Aministrador', 'ROLE_ADMIN');
INSERT INTO `role` VALUES ('2', 'Director', 'ROLE_DIRECTOR');

-- ----------------------------
-- Table structure for type
-- ----------------------------
DROP TABLE IF EXISTS `type`;
CREATE TABLE `type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_8CDE57295E237E06` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of type
-- ----------------------------
INSERT INTO `type` VALUES ('1', 'Celular');
INSERT INTO `type` VALUES ('7', 'Escaner de pasarporte');
INSERT INTO `type` VALUES ('5', 'Impresora');
INSERT INTO `type` VALUES ('8', 'Laptop');
INSERT INTO `type` VALUES ('4', 'Monitor');
INSERT INTO `type` VALUES ('3', 'PC');
INSERT INTO `type` VALUES ('2', 'Teclado');

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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('7', 'informatico4@cubananan.tur.cu', 'javier', '$2y$12$PxUEx2wOuBkK8WAB8t9sLup/49lo96UfO3Rvalh3pUN3CVgOr7HMa', 'Enio Javier Nieto Basnueva', 'Especialista Informático', '1');
INSERT INTO `user` VALUES ('8', 'dirinfo@cubanacan.tur.cu', 'yudy', '$2y$12$OQ.7iCEJbeyvuSntseisMuhwWA3OkJQ5XXoGjAru1EtjS.7c9gr92', 'Yudy Manzur Castañon', 'Directora', '1');

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
INSERT INTO `users_roles` VALUES ('7', '1');
INSERT INTO `users_roles` VALUES ('8', '2');
