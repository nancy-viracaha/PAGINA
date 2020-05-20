-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 19-05-2020 a las 03:34:44
-- Versión del servidor: 10.4.11-MariaDB
-- Versión de PHP: 7.2.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `mydb`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `controlresiduos`
--

CREATE TABLE `controlresiduos` (
  `idControlResiduos` int(11) NOT NULL,
  `Fecha` date NOT NULL,
  `Drogueria_idDrogueria` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cronograma`
--

CREATE TABLE `cronograma` (
  `idCronograma` int(11) NOT NULL,
  `Fecha` date NOT NULL,
  `NombreAutor` varchar(45) NOT NULL,
  `Drogueria_idDrogueria` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle`
--

CREATE TABLE `detalle` (
  `idDetalle` int(11) NOT NULL,
  `Cantidad` int(11) NOT NULL,
  `ControlResiduos_idControlResiduos` int(11) NOT NULL,
  `TipoResiduo_idTipoResiduo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `drogueria`
--

CREATE TABLE `drogueria` (
  `idDrogueria` int(11) NOT NULL,
  `NombreDrogueria` varchar(20) NOT NULL,
  `Direccion` varchar(20) NOT NULL,
  `HorarioApertura` int(11) NOT NULL,
  `HorarioCierre` int(11) NOT NULL,
  `Telefono` int(11) NOT NULL,
  `Correo` varchar(45) NOT NULL,
  `Password` varchar(30) NOT NULL,
  `Nit` varchar(30) NOT NULL,
  `Localidad` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registrodocumento`
--

CREATE TABLE `registrodocumento` (
  `idRegistroDocumento` int(11) NOT NULL,
  `Fecha` date NOT NULL,
  `UrlDocumento` varchar(45) NOT NULL,
  `Observacion` varchar(45) NOT NULL,
  `TipoDocumento_idTipoDocumento` int(11) NOT NULL,
  `Drogueria_idDrogueria` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registrotemperaturahumedad`
--

CREATE TABLE `registrotemperaturahumedad` (
  `idRegistroTemperaturaHumedad` int(11) NOT NULL,
  `Fecha` date NOT NULL,
  `Temperatura` int(11) NOT NULL,
  `Humedad` int(11) NOT NULL,
  `Drogueria_idDrogueria` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipodocumento`
--

CREATE TABLE `tipodocumento` (
  `idTipoDocumento` int(11) NOT NULL,
  `NombreTipoDcomento` varchar(45) NOT NULL,
  `TipoDocumentocol` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tiporesiduo`
--

CREATE TABLE `tiporesiduo` (
  `idTipoResiduo` int(11) NOT NULL,
  `TipoResiduocol` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `controlresiduos`
--
ALTER TABLE `controlresiduos`
  ADD PRIMARY KEY (`idControlResiduos`),
  ADD KEY `fk_ControlResiduos_Drogueria1_idx` (`Drogueria_idDrogueria`);

--
-- Indices de la tabla `cronograma`
--
ALTER TABLE `cronograma`
  ADD PRIMARY KEY (`idCronograma`),
  ADD KEY `fk_Cronograma_Drogueria1_idx` (`Drogueria_idDrogueria`);

--
-- Indices de la tabla `detalle`
--
ALTER TABLE `detalle`
  ADD PRIMARY KEY (`idDetalle`),
  ADD KEY `fk_Detalle_ControlResiduos1_idx` (`ControlResiduos_idControlResiduos`),
  ADD KEY `fk_Detalle_TipoResiduo1_idx` (`TipoResiduo_idTipoResiduo`);

--
-- Indices de la tabla `drogueria`
--
ALTER TABLE `drogueria`
  ADD PRIMARY KEY (`idDrogueria`),
  ADD UNIQUE KEY `NombreDrogueria_UNIQUE` (`NombreDrogueria`),
  ADD UNIQUE KEY `Direccion_UNIQUE` (`Direccion`);

--
-- Indices de la tabla `registrodocumento`
--
ALTER TABLE `registrodocumento`
  ADD PRIMARY KEY (`idRegistroDocumento`),
  ADD KEY `fk_RegistroDocumento_TipoDocumento_idx` (`TipoDocumento_idTipoDocumento`),
  ADD KEY `fk_RegistroDocumento_Drogueria1_idx` (`Drogueria_idDrogueria`);

--
-- Indices de la tabla `registrotemperaturahumedad`
--
ALTER TABLE `registrotemperaturahumedad`
  ADD PRIMARY KEY (`idRegistroTemperaturaHumedad`),
  ADD KEY `fk_RegistroTemperaturaHumedad_Drogueria1_idx` (`Drogueria_idDrogueria`);

--
-- Indices de la tabla `tipodocumento`
--
ALTER TABLE `tipodocumento`
  ADD PRIMARY KEY (`idTipoDocumento`);

--
-- Indices de la tabla `tiporesiduo`
--
ALTER TABLE `tiporesiduo`
  ADD PRIMARY KEY (`idTipoResiduo`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `controlresiduos`
--
ALTER TABLE `controlresiduos`
  MODIFY `idControlResiduos` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cronograma`
--
ALTER TABLE `cronograma`
  MODIFY `idCronograma` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `detalle`
--
ALTER TABLE `detalle`
  MODIFY `idDetalle` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `drogueria`
--
ALTER TABLE `drogueria`
  MODIFY `idDrogueria` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `registrodocumento`
--
ALTER TABLE `registrodocumento`
  MODIFY `idRegistroDocumento` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `registrotemperaturahumedad`
--
ALTER TABLE `registrotemperaturahumedad`
  MODIFY `idRegistroTemperaturaHumedad` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipodocumento`
--
ALTER TABLE `tipodocumento`
  MODIFY `idTipoDocumento` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tiporesiduo`
--
ALTER TABLE `tiporesiduo`
  MODIFY `idTipoResiduo` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `controlresiduos`
--
ALTER TABLE `controlresiduos`
  ADD CONSTRAINT `fk_ControlResiduos_Drogueria1` FOREIGN KEY (`Drogueria_idDrogueria`) REFERENCES `drogueria` (`idDrogueria`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `cronograma`
--
ALTER TABLE `cronograma`
  ADD CONSTRAINT `fk_Cronograma_Drogueria1` FOREIGN KEY (`Drogueria_idDrogueria`) REFERENCES `drogueria` (`idDrogueria`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `detalle`
--
ALTER TABLE `detalle`
  ADD CONSTRAINT `fk_Detalle_ControlResiduos1` FOREIGN KEY (`ControlResiduos_idControlResiduos`) REFERENCES `controlresiduos` (`idControlResiduos`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Detalle_TipoResiduo1` FOREIGN KEY (`TipoResiduo_idTipoResiduo`) REFERENCES `tiporesiduo` (`idTipoResiduo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `registrodocumento`
--
ALTER TABLE `registrodocumento`
  ADD CONSTRAINT `fk_RegistroDocumento_Drogueria1` FOREIGN KEY (`Drogueria_idDrogueria`) REFERENCES `drogueria` (`idDrogueria`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_RegistroDocumento_TipoDocumento` FOREIGN KEY (`TipoDocumento_idTipoDocumento`) REFERENCES `tipodocumento` (`idTipoDocumento`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `registrotemperaturahumedad`
--
ALTER TABLE `registrotemperaturahumedad`
  ADD CONSTRAINT `fk_RegistroTemperaturaHumedad_Drogueria1` FOREIGN KEY (`Drogueria_idDrogueria`) REFERENCES `drogueria` (`idDrogueria`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
