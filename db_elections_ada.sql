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


-- Volcando estructura de base de datos para db_colegio_ada
DROP DATABASE IF EXISTS `db_colegio_ada`;
CREATE DATABASE IF NOT EXISTS `db_colegio_ada` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `db_colegio_ada`;

-- Volcando estructura para tabla db_colegio_ada.alumno
DROP TABLE IF EXISTS `alumno`;
CREATE TABLE IF NOT EXISTS `alumno` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `apellidos` varchar(45) NOT NULL,
  `direccion` varchar(45) NOT NULL,
  `poblacion` varchar(45) NOT NULL,
  `familiar` int(11) NOT NULL,
  `grupo` int(11) NOT NULL,
  `ultimoaviso` enum('Y','N') NOT NULL DEFAULT 'N',
  PRIMARY KEY (`id`),
  KEY `fk_alumno_familiar1_idx` (`familiar`),
  KEY `fk_alumno_grupo1_idx` (`grupo`),
  CONSTRAINT `fk_alumno_familiar1` FOREIGN KEY (`familiar`) REFERENCES `familiar` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_alumno_grupo1` FOREIGN KEY (`grupo`) REFERENCES `grupo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla db_colegio_ada.alumno: ~2 rows (aproximadamente)
DELETE FROM `alumno`;
/*!40000 ALTER TABLE `alumno` DISABLE KEYS */;
INSERT INTO `alumno` (`id`, `nombre`, `apellidos`, `direccion`, `poblacion`, `familiar`, `grupo`, `ultimoaviso`) VALUES
	(3, 'Alejandro', 'Donate Avendaño', 'Paseo Cincunvalacion 78 3ºI', 'Albacete', 1, 2, 'Y'),
	(4, 'Sergio', 'Alarcon Felipe', 'Calle de la informatica nº 32', 'Albacete', 2, 2, 'N');
/*!40000 ALTER TABLE `alumno` ENABLE KEYS */;

-- Volcando estructura para tabla db_colegio_ada.alumno_asignatura
DROP TABLE IF EXISTS `alumno_asignatura`;
CREATE TABLE IF NOT EXISTS `alumno_asignatura` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `alumno` int(11) NOT NULL,
  `asignatura` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_alumno_grupo_asignatura_alumno1_idx` (`alumno`),
  KEY `fk_alumno_grupo_asignatura_asignatura1_idx` (`asignatura`),
  CONSTRAINT `fk_alumno_grupo_asignatura_alumno1` FOREIGN KEY (`alumno`) REFERENCES `alumno` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_alumno_grupo_asignatura_asignatura1` FOREIGN KEY (`asignatura`) REFERENCES `asignatura` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla db_colegio_ada.alumno_asignatura: ~4 rows (aproximadamente)
DELETE FROM `alumno_asignatura`;
/*!40000 ALTER TABLE `alumno_asignatura` DISABLE KEYS */;
INSERT INTO `alumno_asignatura` (`id`, `alumno`, `asignatura`) VALUES
	(1, 3, 3),
	(2, 3, 2),
	(3, 4, 2),
	(4, 4, 3);
/*!40000 ALTER TABLE `alumno_asignatura` ENABLE KEYS */;

-- Volcando estructura para tabla db_colegio_ada.amonestacion
DROP TABLE IF EXISTS `amonestacion`;
CREATE TABLE IF NOT EXISTS `amonestacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `asignatura` int(11) NOT NULL,
  `profesor` int(11) NOT NULL,
  `alumno` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `fechafirmajefatura` date DEFAULT NULL,
  `horafirmajefatura` time DEFAULT NULL,
  `fechafirmafamiliar` date DEFAULT NULL,
  `horafirmafamiliar` time DEFAULT NULL,
  `motivo` varchar(255) NOT NULL,
  `sancion` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_amonestacion_profesor1_idx` (`profesor`),
  KEY `fk_amonestacion_alumno1_idx` (`alumno`),
  KEY `fk_amonestacion_asignatura1_idx` (`asignatura`),
  CONSTRAINT `fk_amonestacion_alumno1` FOREIGN KEY (`alumno`) REFERENCES `alumno` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_amonestacion_asignatura1` FOREIGN KEY (`asignatura`) REFERENCES `asignatura` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_amonestacion_profesor1` FOREIGN KEY (`profesor`) REFERENCES `profesor` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla db_colegio_ada.amonestacion: ~0 rows (aproximadamente)
DELETE FROM `amonestacion`;
/*!40000 ALTER TABLE `amonestacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `amonestacion` ENABLE KEYS */;

-- Volcando estructura para tabla db_colegio_ada.asignatura
DROP TABLE IF EXISTS `asignatura`;
CREATE TABLE IF NOT EXISTS `asignatura` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre_UNIQUE` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla db_colegio_ada.asignatura: ~2 rows (aproximadamente)
DELETE FROM `asignatura`;
/*!40000 ALTER TABLE `asignatura` DISABLE KEYS */;
INSERT INTO `asignatura` (`id`, `nombre`) VALUES
	(3, 'Diseño de Interfaces Web'),
	(2, 'Diseño Web Entorno Cliente'),
	(1, 'Sistemas Operativos');
/*!40000 ALTER TABLE `asignatura` ENABLE KEYS */;

-- Volcando estructura para tabla db_colegio_ada.expulsion
DROP TABLE IF EXISTS `expulsion`;
CREATE TABLE IF NOT EXISTS `expulsion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `asignatura` int(11) NOT NULL,
  `profesor` int(11) NOT NULL,
  `alumno` int(11) NOT NULL,
  `tarea` varchar(45) NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `fechafirmajefatura` date DEFAULT NULL,
  `horafirmajefatura` time DEFAULT NULL,
  `fechafirmafamiliar` date DEFAULT NULL,
  `horafirmafamiliar` time DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_expulsion_profesor1_idx` (`profesor`),
  KEY `fk_expulsion_alumno1_idx` (`alumno`),
  KEY `fk_expulsion_asignatura1_idx` (`asignatura`),
  CONSTRAINT `fk_expulsion_alumno1` FOREIGN KEY (`alumno`) REFERENCES `alumno` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_expulsion_asignatura1` FOREIGN KEY (`asignatura`) REFERENCES `asignatura` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_expulsion_profesor1` FOREIGN KEY (`profesor`) REFERENCES `profesor` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla db_colegio_ada.expulsion: ~0 rows (aproximadamente)
DELETE FROM `expulsion`;
/*!40000 ALTER TABLE `expulsion` DISABLE KEYS */;
/*!40000 ALTER TABLE `expulsion` ENABLE KEYS */;

-- Volcando estructura para tabla db_colegio_ada.familiar
DROP TABLE IF EXISTS `familiar`;
CREATE TABLE IF NOT EXISTS `familiar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `apellidos` varchar(45) NOT NULL,
  `direccion` varchar(45) NOT NULL,
  `poblacion` varchar(45) NOT NULL,
  `correo_electronico` varchar(45) NOT NULL,
  `telefono` int(9) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla db_colegio_ada.familiar: ~2 rows (aproximadamente)
DELETE FROM `familiar`;
/*!40000 ALTER TABLE `familiar` DISABLE KEYS */;
INSERT INTO `familiar` (`id`, `nombre`, `apellidos`, `direccion`, `poblacion`, `correo_electronico`, `telefono`) VALUES
	(1, 'Mariangeles', 'Avendaño Cuerda', 'Paseo Cincunvalacion 78 3ºI', 'Albacete', 'correo@hotmail.com', 667432221),
	(2, 'Luis', 'Alarcon', 'Calle el tinte nº 43', 'Albacete', 'correo3@otmail.com', 553634523);
/*!40000 ALTER TABLE `familiar` ENABLE KEYS */;

-- Volcando estructura para tabla db_colegio_ada.grupo
DROP TABLE IF EXISTS `grupo`;
CREATE TABLE IF NOT EXISTS `grupo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `curso` varchar(45) NOT NULL,
  `denominacion` varchar(45) NOT NULL,
  `tutor` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tutor_UNIQUE` (`tutor`),
  KEY `fk_grupo_profesor1_idx` (`tutor`),
  CONSTRAINT `fk_grupo_profesor1` FOREIGN KEY (`tutor`) REFERENCES `profesor` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla db_colegio_ada.grupo: ~2 rows (aproximadamente)
DELETE FROM `grupo`;
/*!40000 ALTER TABLE `grupo` DISABLE KEYS */;
INSERT INTO `grupo` (`id`, `curso`, `denominacion`, `tutor`) VALUES
	(1, '1º', 'DAW', 1),
	(2, '2º', 'DAW', 2);
/*!40000 ALTER TABLE `grupo` ENABLE KEYS */;

-- Volcando estructura para tabla db_colegio_ada.profesor
DROP TABLE IF EXISTS `profesor`;
CREATE TABLE IF NOT EXISTS `profesor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `apellidos` varchar(45) NOT NULL,
  `usuario` varchar(45) NOT NULL,
  `contrasena` varchar(45) NOT NULL,
  `tipo` enum('P','T','J') NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `usuario_UNIQUE` (`usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla db_colegio_ada.profesor: ~2 rows (aproximadamente)
DELETE FROM `profesor`;
/*!40000 ALTER TABLE `profesor` DISABLE KEYS */;
INSERT INTO `profesor` (`id`, `nombre`, `apellidos`, `usuario`, `contrasena`, `tipo`) VALUES
	(1, 'Rosa', 'Ropero', '77', '77', 'T'),
	(2, 'Inma', 'Roldan Lozano', '22', '22', 'T');
/*!40000 ALTER TABLE `profesor` ENABLE KEYS */;

-- Volcando estructura para tabla db_colegio_ada.profesor_asignatura_grupo
DROP TABLE IF EXISTS `profesor_asignatura_grupo`;
CREATE TABLE IF NOT EXISTS `profesor_asignatura_grupo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `profesor` int(11) NOT NULL,
  `asignatura` int(11) NOT NULL,
  `grupo` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `profesor_asignatura_grupo_grupo1_idx` (`grupo`),
  KEY `profesor_asignatura_grupo_asignatura1_idx` (`asignatura`),
  KEY `profesor_asignatura_grupo_profesor1_idx` (`profesor`),
  CONSTRAINT `profesor_asignatura_grupo_asignatura1` FOREIGN KEY (`asignatura`) REFERENCES `asignatura` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `profesor_asignatura_grupo_grupo1` FOREIGN KEY (`grupo`) REFERENCES `grupo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `profesor_asignatura_grupo_profesor1` FOREIGN KEY (`profesor`) REFERENCES `profesor` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla db_colegio_ada.profesor_asignatura_grupo: ~3 rows (aproximadamente)
DELETE FROM `profesor_asignatura_grupo`;
/*!40000 ALTER TABLE `profesor_asignatura_grupo` DISABLE KEYS */;
INSERT INTO `profesor_asignatura_grupo` (`id`, `profesor`, `asignatura`, `grupo`) VALUES
	(1, 2, 3, 2),
	(2, 1, 2, 2),
	(3, 1, 1, 1);
/*!40000 ALTER TABLE `profesor_asignatura_grupo` ENABLE KEYS */;

-- Volcando estructura para tabla db_colegio_ada.sancion
DROP TABLE IF EXISTS `sancion`;
CREATE TABLE IF NOT EXISTS `sancion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `alumno` int(11) NOT NULL,
  `profesor` int(11) NOT NULL,
  `sancion` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `fechafirma` date DEFAULT NULL,
  `horafirma` time DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_sancion_profesor1_idx` (`profesor`),
  KEY `fk_sancion_alumno1_idx` (`alumno`),
  CONSTRAINT `fk_sancion_alumno1` FOREIGN KEY (`alumno`) REFERENCES `alumno` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_sancion_profesor1` FOREIGN KEY (`profesor`) REFERENCES `profesor` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla db_colegio_ada.sancion: ~0 rows (aproximadamente)
DELETE FROM `sancion`;
/*!40000 ALTER TABLE `sancion` DISABLE KEYS */;
/*!40000 ALTER TABLE `sancion` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
