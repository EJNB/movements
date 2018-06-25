/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 100122
Source Host           : localhost:3306
Source Database       : movementdb

Target Server Type    : MYSQL
Target Server Version : 100122
File Encoding         : 65001

Date: 2018-06-25 14:15:57
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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of distribution
-- ----------------------------
INSERT INTO `distribution` VALUES ('13', '2018-06-19 22:55:59', 'distribution_e');
INSERT INTO `distribution` VALUES ('14', '2018-06-19 23:02:49', 'distribution_e');

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
INSERT INTO `distribution_e` VALUES ('13', '5', 'TR032018', '1');
INSERT INTO `distribution_e` VALUES ('14', '1', 'TR012018', '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of equipment
-- ----------------------------
INSERT INTO `equipment` VALUES ('1', '7', null, null, 'Scanner de pasaporte', '8515', '547200', '2018-06-01 00:00:00', null);
INSERT INTO `equipment` VALUES ('2', '7', null, null, 'Scanner de pasaporte', '8195', '547201', '2018-06-01 00:00:00', null);
INSERT INTO `equipment` VALUES ('3', '7', null, null, 'Scanner de pasaporte', '8326', '547202', '2018-06-01 00:00:00', null);
INSERT INTO `equipment` VALUES ('4', '7', null, null, 'Scanner de pasaporte', '8278', '547203', '2018-06-01 00:00:00', null);
INSERT INTO `equipment` VALUES ('5', '7', null, null, 'Scanner de pasaporte', '8198', '547204', '2018-06-01 00:00:00', null);
INSERT INTO `equipment` VALUES ('6', '7', null, null, 'Scanner de pasaporte', '1128', '547205', '2018-06-01 00:00:00', null);
INSERT INTO `equipment` VALUES ('7', '7', '14', null, 'Scanner de pasaporte', '1058', '547206', '2018-06-01 00:00:00', null);
INSERT INTO `equipment` VALUES ('8', '7', '14', null, 'Scanner de pasaporte', '8265', '547207', '2018-06-01 00:00:00', null);
INSERT INTO `equipment` VALUES ('9', '7', null, null, 'Scanner de pasaporte', '1086', '547208', '2018-06-01 00:00:00', null);
INSERT INTO `equipment` VALUES ('10', '7', null, null, 'Scanner de pasaporte', '8300', '547209', '2018-06-01 00:00:00', null);
INSERT INTO `equipment` VALUES ('11', '7', null, null, 'Scanner de pasaporte', '8220', '547210', '2018-06-01 00:00:00', null);
INSERT INTO `equipment` VALUES ('12', '7', null, null, 'Scanner de pasaporte', '8257', '547211', '2018-06-01 00:00:00', null);
INSERT INTO `equipment` VALUES ('13', '7', '13', null, 'Scanner de pasaporte', '8324', '547212', '2018-06-01 00:00:00', null);
INSERT INTO `equipment` VALUES ('14', '7', null, null, 'Scanner de pasaporte', '8139', '547213', '2018-06-01 00:00:00', null);
INSERT INTO `equipment` VALUES ('15', '7', null, null, 'Scanner de pasaporte', '8334', '547214', '2018-06-01 00:00:00', null);
INSERT INTO `equipment` VALUES ('16', '7', null, null, 'Scanner de pasaporte', '8287', '547215', '2018-06-01 00:00:00', null);
INSERT INTO `equipment` VALUES ('17', '7', null, null, 'Scanner de pasaporte', '8249', '547216', '2018-06-01 00:00:00', null);
INSERT INTO `equipment` VALUES ('18', '7', null, null, 'Scanner de pasaporte', '8240', '547217', '2018-06-01 00:00:00', null);
INSERT INTO `equipment` VALUES ('19', '7', '14', null, 'Scanner de pasaporte', '8259', '547218', '2018-06-01 00:00:00', null);
INSERT INTO `equipment` VALUES ('20', '7', null, null, 'Scanner de pasaporte', '8222', '547219', '2018-06-01 00:00:00', null);
INSERT INTO `equipment` VALUES ('21', '7', null, null, 'Scanner de pasaporte', '8221', '547220', '2018-06-01 00:00:00', null);
INSERT INTO `equipment` VALUES ('22', '7', null, null, 'Scanner de pasaporte', '8282', '547221', '2018-06-01 00:00:00', null);
INSERT INTO `equipment` VALUES ('23', '7', null, null, 'Scanner de pasaporte', '1076', '547222', '2018-06-01 00:00:00', null);
INSERT INTO `equipment` VALUES ('24', '7', null, null, 'Scanner de pasaporte', '1009', '547223', '2018-06-01 00:00:00', null);
INSERT INTO `equipment` VALUES ('25', '7', null, null, 'Scanner de pasaporte', '1092', '547224', '2018-06-01 00:00:00', null);
INSERT INTO `equipment` VALUES ('26', '7', '13', null, 'Scanner de pasaporte', '8219', '547225', '2018-06-01 00:00:00', null);
INSERT INTO `equipment` VALUES ('27', '7', null, null, 'Scanner de pasaporte', '8197', '547226', '2018-06-01 00:00:00', null);
INSERT INTO `equipment` VALUES ('28', '7', null, null, 'Scanner de pasaporte', '8239', '547227', '2018-06-01 00:00:00', null);
INSERT INTO `equipment` VALUES ('29', '7', null, null, 'Scanner de pasaporte', '1041', '547228', '2018-06-01 00:00:00', null);
INSERT INTO `equipment` VALUES ('30', '7', null, null, 'Scanner de pasaporte', '1175', '547229', '2018-06-01 00:00:00', null);
INSERT INTO `equipment` VALUES ('31', '2', null, null, 'Impresora multifution blancas', 'qqqq', '12345', '2018-06-13 00:00:00', null);
INSERT INTO `equipment` VALUES ('32', '2', null, null, 'Impresora multifution blancas', 'qwerty7899', '566789', '2018-06-13 00:00:00', '3');
INSERT INTO `equipment` VALUES ('33', '3', null, null, 'fdfhjd', 'eeee', '987', '2018-06-22 00:00:00', '4');
INSERT INTO `equipment` VALUES ('34', '3', null, null, 'fdfhjd', 'qqqqfjhgjhfjkghjfg', '321654', '2018-06-22 00:00:00', '4');

-- ----------------------------
-- Table structure for hotel
-- ----------------------------
DROP TABLE IF EXISTS `hotel`;
CREATE TABLE `hotel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(70) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of hotel
-- ----------------------------
INSERT INTO `hotel` VALUES ('1', 'Hotel Los Jazmines');
INSERT INTO `hotel` VALUES ('2', 'Hotel Rancho San Vicente');
INSERT INTO `hotel` VALUES ('3', 'Hotel La Ermita');
INSERT INTO `hotel` VALUES ('4', 'Hotel E Central Viñales');
INSERT INTO `hotel` VALUES ('5', 'Hotel Soroa');
INSERT INTO `hotel` VALUES ('6', 'Complejo Las Terrazas');

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of invoice
-- ----------------------------
INSERT INTO `invoice` VALUES ('3', '2018-05-07 00:00:00', '27b1.jpg', '123');
INSERT INTO `invoice` VALUES ('4', '2018-06-24 00:00:00', '27b1.jpg', '123654');
INSERT INTO `invoice` VALUES ('6', '2018-06-14 00:00:00', 'nuevo-iphone-x.jpg', '789');

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
INSERT INTO `model` VALUES ('5', '2', 'Lasertjet M227');
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
INSERT INTO `type` VALUES ('5', 'Impresora');
INSERT INTO `type` VALUES ('4', 'Monitor');
INSERT INTO `type` VALUES ('3', 'PC');
INSERT INTO `type` VALUES ('7', 'Scanner de pasarporte');
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
