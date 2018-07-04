/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 100122
Source Host           : localhost:3306
Source Database       : movementdb

Target Server Type    : MYSQL
Target Server Version : 100122
File Encoding         : 65001

Date: 2018-06-28 16:40:01
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of brand
-- ----------------------------
INSERT INTO `brand` VALUES ('1', '4', 'ViewSonic');
INSERT INTO `brand` VALUES ('2', '5', 'HP');
INSERT INTO `brand` VALUES ('4', '4', 'ATEC-Haier');
INSERT INTO `brand` VALUES ('5', '4', 'THTF');
INSERT INTO `brand` VALUES ('7', '4', 'SAMSUNG');
INSERT INTO `brand` VALUES ('8', '7', 'ARH');

-- ----------------------------
-- Table structure for department
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_CD1DE18A5E237E06` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of department
-- ----------------------------
INSERT INTO `department` VALUES ('1', 'Calidad');
INSERT INTO `department` VALUES ('2', 'Operaciones');

-- ----------------------------
-- Table structure for distribution
-- ----------------------------
DROP TABLE IF EXISTS `distribution`;
CREATE TABLE `distribution` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `requestDate` datetime NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of distribution
-- ----------------------------

-- ----------------------------
-- Table structure for distribution_e
-- ----------------------------
DROP TABLE IF EXISTS `distribution_e`;
CREATE TABLE `distribution_e` (
  `id` int(11) NOT NULL,
  `hotel_id` int(11) DEFAULT NULL,
  `consecutive_number` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `state` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_DB076EFE3243BB18` (`hotel_id`),
  CONSTRAINT `FK_DB076EFE3243BB18` FOREIGN KEY (`hotel_id`) REFERENCES `hotel` (`id`),
  CONSTRAINT `FK_DB076EFEBF396750` FOREIGN KEY (`id`) REFERENCES `distribution` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of distribution_e
-- ----------------------------

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
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of equipment
-- ----------------------------
INSERT INTO `equipment` VALUES ('35', '5', null, null, 'Impresoras multifution', 'VNB3C30759', '547255', '2017-08-15 00:00:00', '8');
INSERT INTO `equipment` VALUES ('36', '5', null, null, 'Impresoras multifution', 'VNB3C31692', '547256', '2017-08-15 00:00:00', '8');
INSERT INTO `equipment` VALUES ('37', '5', null, null, 'Impresoras multifution', 'VNB3C31697', '547257', '2017-08-15 00:00:00', '8');
INSERT INTO `equipment` VALUES ('38', '5', null, null, 'Impresoras multifution', 'VNB3C31698', '547258', '2017-08-15 00:00:00', '8');
INSERT INTO `equipment` VALUES ('39', '5', null, null, 'Impresoras multifution', 'VNB3C31700', '547259', '2017-08-15 00:00:00', '8');
INSERT INTO `equipment` VALUES ('40', '5', null, null, 'Impresoras multifution', 'VNB3C31702', '547260', '2017-08-15 00:00:00', '8');
INSERT INTO `equipment` VALUES ('41', '5', null, null, 'Impresoras multifution', 'VNB3C31701', '547261', '2017-08-15 00:00:00', '8');
INSERT INTO `equipment` VALUES ('42', '5', null, null, 'Impresoras multifution', 'VNB3C31706', '547262', '2017-08-15 00:00:00', '8');
INSERT INTO `equipment` VALUES ('43', '5', null, null, 'Impresoras multifution', 'VNB3C31708', '547263', '2017-08-15 00:00:00', '8');
INSERT INTO `equipment` VALUES ('44', '5', null, null, 'Impresoras multifution', 'VNB3C31710', '547264', '2017-08-15 00:00:00', '8');
INSERT INTO `equipment` VALUES ('45', '5', null, null, 'Impresoras multifution', 'VNB3C31711', '547265', '2017-08-15 00:00:00', '8');
INSERT INTO `equipment` VALUES ('46', '5', null, null, 'Impresoras multifution', 'VNB3C31712', '547266', '2017-08-15 00:00:00', '8');
INSERT INTO `equipment` VALUES ('47', '5', null, null, 'Impresoras multifution', 'VNB3C32133', '547267', '2017-08-15 00:00:00', '8');
INSERT INTO `equipment` VALUES ('48', '5', null, null, 'Impresoras multifution', 'VNB3C32211', '547268', '2017-08-15 00:00:00', '8');
INSERT INTO `equipment` VALUES ('49', '5', null, null, 'Impresoras multifution', 'VNB3C32213', '547269', '2017-08-15 00:00:00', '8');
INSERT INTO `equipment` VALUES ('50', '5', null, null, 'Impresoras multifution', 'VNB3C32214', '547270', '2017-08-15 00:00:00', '8');
INSERT INTO `equipment` VALUES ('51', '5', null, null, 'Impresoras multifution', 'VNB3C32216', '547271', '2017-08-15 00:00:00', '8');
INSERT INTO `equipment` VALUES ('52', '5', null, null, 'Impresoras multifution', 'VNB3C32218', '547272', '2017-08-15 00:00:00', '8');
INSERT INTO `equipment` VALUES ('53', '5', null, null, 'Impresoras multifution', 'VNB3C32219', '547273', '2017-08-15 00:00:00', '8');
INSERT INTO `equipment` VALUES ('54', '5', null, null, 'Impresoras multifution', 'VNB3C32220', '547274', '2017-08-15 00:00:00', '8');
INSERT INTO `equipment` VALUES ('55', '5', null, null, 'Impresoras multifution', 'VNB3C32222', '547275', '2017-08-15 00:00:00', '8');
INSERT INTO `equipment` VALUES ('56', '5', null, null, 'Impresoras multifution', 'VNB3C32221', '547276', '2017-08-15 00:00:00', '8');
INSERT INTO `equipment` VALUES ('57', '5', null, null, 'Impresoras multifution', 'VNB3C32225', '547277', '2017-08-15 00:00:00', '8');
INSERT INTO `equipment` VALUES ('58', '5', null, null, 'Impresoras multifution', 'VNB3C02279', '547280', '2017-08-15 00:00:00', '8');
INSERT INTO `equipment` VALUES ('59', '5', null, null, 'Impresoras multifution', 'VNB3C32226', '547283', '2017-08-15 00:00:00', '8');
INSERT INTO `equipment` VALUES ('60', '5', null, null, 'Impresoras multifution', 'VNB3C32229', '547284', '2017-08-15 00:00:00', '8');
INSERT INTO `equipment` VALUES ('61', '5', null, null, 'Impresoras multifution', 'VNB3C32231', '547285', '2017-08-15 00:00:00', '8');
INSERT INTO `equipment` VALUES ('62', '5', null, null, 'Impresoras multifution', 'VNB3C32232', '547286', '2017-08-15 00:00:00', '8');
INSERT INTO `equipment` VALUES ('63', '5', null, null, 'Impresoras multifution', 'VNB3C32234', '547287', '2017-08-15 00:00:00', '8');
INSERT INTO `equipment` VALUES ('64', '5', null, null, 'Impresoras multifution', 'VNB3C32240', '547288', '2017-08-15 00:00:00', '8');
INSERT INTO `equipment` VALUES ('65', '5', null, null, 'Impresoras multifution', 'VNB3C32241', '547289', '2017-08-15 00:00:00', '8');
INSERT INTO `equipment` VALUES ('66', '5', null, null, 'Impresoras multifution', 'VNB3C32339', '547290', '2017-08-15 00:00:00', '8');
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
INSERT INTO `equipment` VALUES ('80', '5', null, null, 'Impresoras multifution', 'VNB3C02532', '547304', '2017-08-15 00:00:00', '8');
INSERT INTO `equipment` VALUES ('81', '5', null, null, 'Impresoras multifution', 'VNB3C02533', '547305', '2017-08-15 00:00:00', '8');
INSERT INTO `equipment` VALUES ('82', '5', null, null, 'Impresoras multifution', 'VNB3C02535', '547306', '2017-08-15 00:00:00', '8');
INSERT INTO `equipment` VALUES ('83', '5', null, null, 'Impresoras multifution', 'VNB3C02536', '547307', '2017-08-15 00:00:00', '8');
INSERT INTO `equipment` VALUES ('84', '5', null, null, 'Impresoras multifution', 'VNB3C02537', '547308', '2017-08-15 00:00:00', '8');

-- ----------------------------
-- Table structure for hotel
-- ----------------------------
DROP TABLE IF EXISTS `hotel`;
CREATE TABLE `hotel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(70) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of hotel
-- ----------------------------
INSERT INTO `hotel` VALUES ('1', 'Hotel Los Jazmines');
INSERT INTO `hotel` VALUES ('2', 'Hotel Rancho San Vicente');
INSERT INTO `hotel` VALUES ('3', 'Hotel La Ermita');
INSERT INTO `hotel` VALUES ('4', 'Hotel E Central Viñales');
INSERT INTO `hotel` VALUES ('5', 'Hotel Soroa');
INSERT INTO `hotel` VALUES ('6', 'Complejo Las Terrazas');
INSERT INTO `hotel` VALUES ('7', 'Hotel Acuario');
INSERT INTO `hotel` VALUES ('8', 'Hotel Bella Costa');

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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of invoice
-- ----------------------------
INSERT INTO `invoice` VALUES ('7', '2017-06-12 00:00:00', 'Escaner de pasaporte COMBO SMART(45).pdf', 'F-17330133');
INSERT INTO `invoice` VALUES ('8', '2017-08-15 00:00:00', 'Factura Impresoras HP Laserjet pro MFP 227(50).pdf', 'FAC70622338');
INSERT INTO `invoice` VALUES ('9', '2017-09-17 00:00:00', 'Factura 26 Laptops GDM Celerones(26).pdf', 'FAC70622577');
INSERT INTO `invoice` VALUES ('11', '2017-05-12 00:00:00', '14 Laptop GDM (10 Celerones y 4 i3).pdf', 'FAC70621271');
INSERT INTO `invoice` VALUES ('12', '2017-10-27 00:00:00', 'Factura Monitores 18.5 ATEC-Haier HL-1805WH (80).pdf', 'FAC70623263');

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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ocupation` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `CI` bigint(20) NOT NULL,
  `license` bigint(20) DEFAULT NULL,
  `number_plate` varchar(7) COLLATE utf8_unicode_ci DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of person
-- ----------------------------
INSERT INTO `person` VALUES ('1', '1', 'Odalis Villalobo Crespo', 'Especialista');
INSERT INTO `person` VALUES ('2', '1', 'Rafael Llames Izquierdo', 'Director');
INSERT INTO `person` VALUES ('3', '1', 'Rudy Gomez', 'Especialista');

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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of type
-- ----------------------------
INSERT INTO `type` VALUES ('1', 'Celular');
INSERT INTO `type` VALUES ('7', 'Escaner de pasarporte');
INSERT INTO `type` VALUES ('5', 'Impresora');
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
SET FOREIGN_KEY_CHECKS=1;
