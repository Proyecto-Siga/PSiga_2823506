-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 09-05-2025 a las 01:49:29
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `sigav1`
--

--
-- Volcado de datos para la tabla `docente`
--

INSERT INTO `docente` (`id_docente`, `nombre_docente`, `apellido_docente`, `id_usuario`) VALUES
(1, 'Edwin', 'Casallas', 1),
(2, 'Maria', 'Suarez', 2);

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`id_rol`, `nombre_rol`, `Permisos`) VALUES
(1, 'Estudiante', ''),
(2, 'Docente', ''),
(3, 'Acudiente', ''),
(4, 'Administrativo', '');

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `id_rol`, `estado`, `Correo`, `Contraseña`) VALUES
(1, 2, 1, 'edwincasallas57@gmail.com', '$2y$10$p0hpz63S31uGcXnePKQnseBwKBQLkIRxOHux2W/iiMvY0WeaFeIUq'),
(2, 2, 1, 'hola@gmail.com', '$2y$10$vt6LjLXpBGqtf.28jeyhNuXkVNRXvPSp8C.uN6wS0CztA5mRc4PR.');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
