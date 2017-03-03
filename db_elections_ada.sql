-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         5.7.15-log - MySQL Community Server (GPL)
-- SO del servidor:              Win64
-- HeidiSQL Versión:             9.3.0.5117
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Volcando estructura de base de datos para db_elections_ada
DROP DATABASE IF EXISTS `db_elections_ada`;
CREATE DATABASE IF NOT EXISTS `db_elections_ada` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `db_elections_ada`;

-- Volcando estructura para tabla db_elections_ada.politicalparty
DROP TABLE IF EXISTS `politicalparty`;
CREATE TABLE IF NOT EXISTS `politicalparty` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `logo` varchar(45) NOT NULL,
  `votes` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla db_elections_ada.politicalparty: ~3 rows (aproximadamente)
DELETE FROM `politicalparty`;
/*!40000 ALTER TABLE `politicalparty` DISABLE KEYS */;
INSERT INTO `politicalparty` (`id`, `name`, `logo`, `votes`) VALUES
	(1, 'ppsoe', 'ppsoe', 0),
	(2, 'podemos', 'podemos', 0),
	(3, 'ciudadanos', 'ciudadanos', 0),
	(4, 'others', 'others', 0);
/*!40000 ALTER TABLE `politicalparty` ENABLE KEYS */;

-- Volcando estructura para tabla db_elections_ada.user
DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nif` varchar(9) NOT NULL,
  `password` varchar(45) NOT NULL,
  `voted` enum('Y','N') NOT NULL DEFAULT 'N',
  PRIMARY KEY (`id`),
  UNIQUE KEY `IDENTIFIER` (`nif`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla db_elections_ada.user: ~0 rows (aproximadamente)
DELETE FROM `user`;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
