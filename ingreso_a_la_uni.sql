-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 13-05-2022 a las 21:18:01
-- Versión del servidor: 8.0.17
-- Versión de PHP: 7.3.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `ingreso_a_la_uni`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `cambiarEstado` (IN `nNombre` VARCHAR(50))  BEGIN

  DECLARE listo boolean DEFAULT false;
  DECLARE v_estado varchar(12);
  DECLARE Nombre VARCHAR(15);
   
  
DECLARE c_state CURSOR for SELECT Nombre, Estado
                                FROM personal ;
DECLARE CONTINUE HANDLER for SQLSTATE '02000' SET listo = true;
OPEN c_state;
c_stateLoop:LOOP
FETCH c_state INTO Nombre; 
  if listo THEN LEAVE c_stateLoop;
  END if;
  UPDATE personal set Estado = 'Activo' WHERE Nombre = v_nombre and Nombre =nNombre;
END Loop c_stateLoop;
CLOSE c_state;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado`
--

CREATE TABLE `estado` (
  `Estado` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `estado`
--

INSERT INTO `estado` (`Estado`) VALUES
('Activo'),
('Congelado'),
('Inactivo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal`
--

CREATE TABLE `personal` (
  `Nombre` varchar(100) NOT NULL,
  `Correo` varchar(100) NOT NULL,
  `Estado` varchar(100) NOT NULL,
  `Tipo_de_personal` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `personal`
--

INSERT INTO `personal` (`Nombre`, `Correo`, `Estado`, `Tipo_de_personal`) VALUES
('Valentina Espinoza', 'Vale.espinoza@gmail.com', 'Activo', 'Administrativo\r\n'),
('Madheleyn Perez', 'madhe.perez@gmail.com', 'Congelado', 'Estudiante\r\n'),
('Roberth Machacón', 'robert.macha@gmail.com', 'Inactivo', 'Area de Aseo');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `estado`
--
ALTER TABLE `estado`
  ADD KEY `Estado` (`Estado`);

--
-- Indices de la tabla `personal`
--
ALTER TABLE `personal`
  ADD PRIMARY KEY (`Estado`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `personal`
--
ALTER TABLE `personal`
  ADD CONSTRAINT `personal_ibfk_1` FOREIGN KEY (`Estado`) REFERENCES `estado` (`Estado`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
