-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 05-01-2018 a las 05:26:24
-- Versión del servidor: 5.7.19
-- Versión de PHP: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `sedipro_palomapp`
--

-- --------------------------------------------------------

drop database if exists sedipro_palomapp;
create database sedipro_palomapp;
use sedipro_palomapp;


DROP TABLE IF EXISTS `administrador`;
CREATE TABLE IF NOT EXISTS `administrador` (
  `id_administrador` int(11) NOT NULL,
  `nombres` varchar(100) NOT NULL,
  `apellidos` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `usuario` varchar(20) NOT NULL,
  `contrasena` varchar(20) NOT NULL,
  `fecha_registro` timestamp(6) NOT NULL,
  PRIMARY KEY (`id_administrador`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `disponibilidad`
--

DROP TABLE IF EXISTS `disponibilidad`;
CREATE TABLE IF NOT EXISTS `disponibilidad` (
  `hor_ini` time(6) NOT NULL,
  `hor_fin` time(6) NOT NULL,
  `estado` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `id_laboratorio` char(6) NOT NULL,
  PRIMARY KEY (`id_laboratorio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `laboratorio`
--

DROP TABLE IF EXISTS `laboratorio`;
CREATE TABLE IF NOT EXISTS `laboratorio` (
  `id_laboratorio` char(6) NOT NULL,
  `num_laboratorio` varchar(30) NOT NULL,
  `capacidad` int(11) NOT NULL,
  `local_id_local` char(6) NOT NULL,
  PRIMARY KEY (`id_laboratorio`,`local_id_local`),
  KEY `fk_laboratorio_local1_idx` (`local_id_local`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `local`
--

DROP TABLE IF EXISTS `local`;
CREATE TABLE IF NOT EXISTS `local` (
  `id_local` char(6) NOT NULL,
  `nom_local` varchar(20) NOT NULL,
  `lat` double NOT NULL,
  `lon` double NOT NULL,
  `direccion` varchar(45) NOT NULL,
  `sigla` varchar(10) NOT NULL,
  PRIMARY KEY (`id_local`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `menu`
--

DROP TABLE IF EXISTS `menu`;
CREATE TABLE IF NOT EXISTS `menu` (
  `id_plato` char(6) NOT NULL,
  `id_local` char(6) NOT NULL,
  `fecha` date NOT NULL,
  `precio` double NOT NULL,
  PRIMARY KEY (`id_plato`,`id_local`),
  KEY `fk_plato_has_local_local1_idx` (`id_local`),
  KEY `fk_plato_has_local_plato_idx` (`id_plato`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `objetos_perdidos`
--

DROP TABLE IF EXISTS `objetos_perdidos`;
CREATE TABLE IF NOT EXISTS `objetos_perdidos` (
  `id_objeto` int(11) NOT NULL AUTO_INCREMENT,
  `nom_objeto` varchar(45) NOT NULL,
  `img` varchar(50) NOT NULL,
  `descripcion` varchar(45) NOT NULL,
  `estado` int(11) NOT NULL,
  `persona` varchar(45) NOT NULL,
  `cod_alumno` varchar(45) DEFAULT NULL,
  `id_local` char(6) NOT NULL,
  PRIMARY KEY (`id_objeto`,`id_local`),
  KEY `fk_objetos_perdidos_local1_idx` (`id_local`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `plato`
--

DROP TABLE IF EXISTS `plato`;
CREATE TABLE IF NOT EXISTS `plato` (
  `id_plato` char(6) NOT NULL,
  `descripcion` varchar(200) NOT NULL,
  `nom_plato` varchar(20) NOT NULL,
  `img_plato` varchar(50) NOT NULL,
  PRIMARY KEY (`id_plato`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `disponibilidad`
--
ALTER TABLE `disponibilidad`
  ADD CONSTRAINT `fk_disponibilidad_laboratorio1` FOREIGN KEY (`id_laboratorio`) REFERENCES `laboratorio` (`id_laboratorio`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `laboratorio`
--
ALTER TABLE `laboratorio`
  ADD CONSTRAINT `fk_laboratorio_local1` FOREIGN KEY (`local_id_local`) REFERENCES `local` (`id_local`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `menu`
--
ALTER TABLE `menu`
  ADD CONSTRAINT `fk_plato_has_local_local1` FOREIGN KEY (`id_local`) REFERENCES `local` (`id_local`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_plato_has_local_plato` FOREIGN KEY (`id_plato`) REFERENCES `plato` (`id_plato`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `objetos_perdidos`
--
ALTER TABLE `objetos_perdidos`
  ADD CONSTRAINT `fk_objetos_perdidos_local1` FOREIGN KEY (`id_local`) REFERENCES `local` (`id_local`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;
ALTER TABLE `administrador` CHANGE `fecha_registro` `fecha_registro` TIMESTAMP(6) NULL DEFAULT CURRENT_TIMESTAMP(6);
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
