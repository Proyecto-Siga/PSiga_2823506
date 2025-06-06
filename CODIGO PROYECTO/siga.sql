-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 06-06-2025 a las 07:53:02
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
-- Base de datos: `siga`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `acudientes`
--

CREATE TABLE `acudientes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `apellido` varchar(255) NOT NULL,
  `correo` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `acudientes`
--

INSERT INTO `acudientes` (`id`, `nombre`, `apellido`, `correo`, `created_at`, `updated_at`) VALUES
(1, 'Shemar', 'Wolf', 'demarco86@example.net', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(2, 'Tre', 'Runte', 'sconn@example.net', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(3, 'Ned', 'Kessler', 'fabiola14@example.com', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(4, 'Laurianne', 'Legros', 'kchamplin@example.org', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(5, 'Benny', 'Ankunding', 'dbaumbach@example.com', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(6, 'Gia', 'Wisozk', 'johan39@example.com', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(7, 'Bradly', 'Spencer', 'pfannerstill.adrian@example.org', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(8, 'Cali', 'Heathcote', 'bryon42@example.net', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(9, 'Walton', 'Stracke', 'klowe@example.com', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(10, 'Parker', 'Funk', 'verona21@example.com', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(11, 'Claire', 'VonRueden', 'mafalda87@example.org', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(12, 'Velda', 'Rath', 'anita74@example.org', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(13, 'Antonetta', 'Fisher', 'ubradtke@example.net', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(14, 'Dalton', 'West', 'raquel.schumm@example.com', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(15, 'Nayeli', 'Langworth', 'deckow.cathrine@example.org', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(16, 'Pearl', 'Hudson', 'stephen20@example.com', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(17, 'Cristal', 'Marquardt', 'ckiehn@example.org', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(18, 'Leonor', 'Paucek', 'satterfield.aisha@example.com', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(19, 'Flavio', 'O\'Conner', 'angela38@example.com', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(20, 'Russell', 'Pfeffer', 'kiera.jaskolski@example.org', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(21, 'Toney', 'Heaney', 'krajcik.lamont@example.net', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(22, 'Kennith', 'Cartwright', 'ywelch@example.com', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(23, 'Ludie', 'Rempel', 'hailee.jacobi@example.net', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(24, 'Thalia', 'Fay', 'zackery.feeney@example.org', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(25, 'Anahi', 'Thiel', 'lamar.anderson@example.org', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(26, 'Velma', 'Yundt', 'fgutkowski@example.com', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(27, 'Merlin', 'Pagac', 'sauer.jaime@example.com', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(28, 'Rogelio', 'Kerluke', 'ronaldo.price@example.com', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(29, 'Beatrice', 'Kemmer', 'zoe19@example.net', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(30, 'Athena', 'Johnston', 'ohuel@example.com', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(31, 'Anahi', 'Kuvalis', 'alf.blick@example.com', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(32, 'Kellie', 'Stroman', 'brisa97@example.org', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(33, 'Leatha', 'McDermott', 'gerald.batz@example.net', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(34, 'Lilian', 'Kemmer', 'fruecker@example.org', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(35, 'Stephon', 'Kemmer', 'bruen.eduardo@example.com', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(36, 'Kian', 'Ziemann', 'csauer@example.org', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(37, 'Friedrich', 'Padberg', 'stephen73@example.net', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(38, 'Foster', 'Ryan', 'daisha61@example.org', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(39, 'Amie', 'Ritchie', 'yanderson@example.net', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(40, 'Hayley', 'Schaden', 'brekke.jesse@example.org', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(41, 'Arlie', 'Kihn', 'cmoen@example.net', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(42, 'Angus', 'Hand', 'dimitri.treutel@example.org', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(43, 'Benton', 'Dickens', 'metz.theresa@example.net', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(44, 'Edmond', 'Torp', 'alberto39@example.org', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(45, 'Dudley', 'Kihn', 'alyson50@example.net', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(46, 'Helena', 'Hauck', 'harvey.eugenia@example.org', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(47, 'Blanca', 'Nitzsche', 'antwan89@example.com', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(48, 'Isabelle', 'Kulas', 'drice@example.org', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(49, 'Marielle', 'Howell', 'rhea.ryan@example.org', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(50, 'Wanda', 'Skiles', 'torey.ziemann@example.net', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(51, 'Kristofer', 'Huel', 'bmiller@example.org', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(52, 'Howard', 'VonRueden', 'jazlyn93@example.org', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(53, 'Thalia', 'Ritchie', 'mazie.hickle@example.net', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(54, 'Martine', 'Rolfson', 'charlie45@example.net', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(55, 'Kirk', 'Nicolas', 'lboyer@example.com', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(56, 'Beth', 'Rath', 'bins.alejandrin@example.com', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(57, 'Janiya', 'Paucek', 'sarai53@example.com', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(58, 'Tevin', 'Gusikowski', 'arvel35@example.net', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(59, 'Flo', 'Ebert', 'giuseppe19@example.org', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(60, 'Marcelle', 'Heathcote', 'fritsch.jeffry@example.com', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(61, 'Norval', 'Bahringer', 'dwhite@example.com', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(62, 'Linnea', 'Sanford', 'block.derek@example.org', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(63, 'Marlin', 'Morar', 'immanuel61@example.com', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(64, 'Albina', 'Kerluke', 'lilyan.doyle@example.com', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(65, 'Roxanne', 'Crona', 'garry.renner@example.com', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(66, 'Silas', 'Trantow', 'kennith.armstrong@example.com', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(67, 'Carrie', 'Bailey', 'humberto.leuschke@example.org', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(68, 'Julio', 'Bauch', 'anna26@example.org', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(69, 'Richard', 'Bayer', 'kiel.champlin@example.org', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(70, 'Houston', 'Bruen', 'osanford@example.org', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(71, 'Keanu', 'Rogahn', 'laila00@example.org', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(72, 'Madonna', 'Braun', 'alfreda.lueilwitz@example.net', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(73, 'Marco', 'Streich', 'kconroy@example.com', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(74, 'Keith', 'Schiller', 'bosco.king@example.net', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(75, 'Edgar', 'McKenzie', 'hilpert.verda@example.org', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(76, 'Lois', 'Spencer', 'kurtis18@example.net', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(77, 'Eleanora', 'Hyatt', 'lpfeffer@example.org', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(78, 'Tristin', 'Dooley', 'laverne.stanton@example.net', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(79, 'Jordane', 'Lakin', 'noemy07@example.org', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(80, 'Yasmin', 'Brown', 'hickle.leonardo@example.org', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(81, 'Damion', 'Schoen', 'mckenzie.berge@example.org', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(82, 'Leonor', 'Mayer', 'pkihn@example.net', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(83, 'Candice', 'Harris', 'grayson10@example.com', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(84, 'Kyleigh', 'Ryan', 'myrtle89@example.com', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(85, 'Keaton', 'Lakin', 'casper.balistreri@example.com', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(86, 'Carmela', 'Larson', 'amos22@example.org', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(87, 'General', 'Anderson', 'ora.klocko@example.org', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(88, 'Fatima', 'Abshire', 'stark.chaya@example.net', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(89, 'Josiah', 'Casper', 'pratke@example.com', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(90, 'Declan', 'Hickle', 'steve.gleichner@example.org', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(91, 'Bernard', 'Ritchie', 'bechtelar.jimmie@example.net', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(92, 'Daren', 'Wuckert', 'demond76@example.org', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(93, 'Flavie', 'Bogan', 'cleve.greenfelder@example.org', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(94, 'Rebecca', 'Johnston', 'harrison02@example.net', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(95, 'Ada', 'Dicki', 'wintheiser.bernhard@example.com', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(96, 'Jeanette', 'Block', 'koss.jacinto@example.com', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(97, 'Jarod', 'Bosco', 'oberbrunner.fred@example.net', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(98, 'Elenora', 'Prohaska', 'vokeefe@example.org', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(99, 'Patrick', 'Mraz', 'donato07@example.com', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(100, 'Cary', 'Kuhlman', 'qmcglynn@example.com', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(101, 'Edward', 'Spencer', 'sigurd.orn@example.net', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(102, 'Paul', 'Effertz', 'triston.koepp@example.net', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(103, 'Quincy', 'Rippin', 'jprohaska@example.org', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(104, 'Waino', 'Wolff', 'brad14@example.com', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(105, 'Fabian', 'Aufderhar', 'cflatley@example.org', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(106, 'Marshall', 'Hamill', 'strosin.furman@example.net', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(107, 'Dulce', 'Pouros', 'lynch.keven@example.net', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(108, 'Elisha', 'Reinger', 'larkin.pink@example.com', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(109, 'Alysa', 'Kuvalis', 'srippin@example.net', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(110, 'Dorris', 'Toy', 'minerva08@example.net', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(111, 'Vincenza', 'Hoeger', 'sammie66@example.com', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(112, 'Reagan', 'O\'Connell', 'efrain91@example.net', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(113, 'Andreane', 'Anderson', 'barton.shayna@example.org', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(114, 'Jamal', 'Gutkowski', 'tremayne.zulauf@example.net', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(115, 'Orland', 'Cronin', 'major.jast@example.org', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(116, 'Abdullah', 'Turner', 'schaefer.minnie@example.net', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(117, 'Delbert', 'Beahan', 'wendy73@example.org', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(118, 'Yoshiko', 'Schultz', 'stark.reginald@example.com', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(119, 'Delfina', 'Walter', 'sammy.bailey@example.org', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(120, 'Kristoffer', 'Weissnat', 'powlowski.clementina@example.org', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(121, 'Krystal', 'Altenwerth', 'obrekke@example.net', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(122, 'Harmony', 'Larkin', 'berry70@example.org', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(123, 'Patrick', 'Kertzmann', 'josiane31@example.org', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(124, 'Marlon', 'Tillman', 'patricia83@example.org', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(125, 'Audrey', 'Corkery', 'clair.murazik@example.org', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(126, 'Jed', 'Rodriguez', 'bkonopelski@example.net', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(127, 'Javonte', 'Kirlin', 'stanton.schmeler@example.org', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(128, 'Tobin', 'Roberts', 'wilderman.tamia@example.org', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(129, 'Emely', 'Robel', 'knienow@example.org', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(130, 'Michaela', 'Rogahn', 'marjorie.boyle@example.net', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(131, 'Raina', 'Mueller', 'loma19@example.com', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(132, 'Emmanuel', 'Conroy', 'qabernathy@example.com', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(133, 'Serenity', 'Okuneva', 'mckenna.gislason@example.com', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(134, 'Mariam', 'Steuber', 'sabryna96@example.org', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(135, 'Augustine', 'Medhurst', 'donavon96@example.net', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(136, 'Mae', 'Thompson', 'hollie53@example.org', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(137, 'Miller', 'Luettgen', 'lcronin@example.net', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(138, 'Estrella', 'Carter', 'wilfredo.bode@example.net', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(139, 'Bennie', 'Krajcik', 'cwest@example.net', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(140, 'Dante', 'Lebsack', 'lura.swaniawski@example.org', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(141, 'Sammy', 'Stokes', 'rafael06@example.com', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(142, 'Brandy', 'Fritsch', 'nicholas.roberts@example.net', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(143, 'Kasandra', 'Klein', 'pansy03@example.net', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(144, 'Clovis', 'Berge', 'leuschke.sandy@example.org', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(145, 'Fabian', 'Morissette', 'nicklaus62@example.com', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(146, 'Priscilla', 'Wiza', 'clark55@example.net', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(147, 'Catharine', 'Gleason', 'friedrich70@example.com', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(148, 'Delaney', 'Marks', 'zlakin@example.com', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(149, 'Pierce', 'Upton', 'oprohaska@example.net', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(150, 'Jettie', 'Lesch', 'clark.oconner@example.org', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(151, 'Evert', 'Smitham', 'adams.jana@example.com', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(152, 'Marlen', 'Lockman', 'rodriguez.hosea@example.com', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(153, 'Marco', 'Boyle', 'betty74@example.com', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(154, 'Marlin', 'Reichel', 'hirthe.lavada@example.net', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(155, 'Ashlee', 'Witting', 'ischuppe@example.net', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(156, 'Sabina', 'Mitchell', 'nicolette.sauer@example.org', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(157, 'Maya', 'Bayer', 'vicky27@example.net', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(158, 'Sherwood', 'Durgan', 'charlotte.mccullough@example.org', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(159, 'Clare', 'Hansen', 'cpacocha@example.net', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(160, 'Ladarius', 'Bauch', 'heathcote.hillary@example.org', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(161, 'Annabelle', 'Hermann', 'tevin.pagac@example.net', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(162, 'Webster', 'Nolan', 'maudie.labadie@example.org', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(163, 'Georgette', 'Cronin', 'weissnat.brennan@example.org', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(164, 'Seth', 'Schumm', 'wisoky.pedro@example.com', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(165, 'Berenice', 'Wolf', 'eugenia.sipes@example.net', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(166, 'Keaton', 'Windler', 'cmacejkovic@example.com', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(167, 'Hassan', 'White', 'xbarrows@example.net', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(168, 'Cicero', 'Becker', 'shyann.crooks@example.org', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(169, 'Savanah', 'Ortiz', 'hester16@example.net', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(170, 'Monserrate', 'Satterfield', 'eschulist@example.org', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(171, 'Janis', 'Klocko', 'ariane19@example.com', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(172, 'Myrl', 'Schaden', 'sonny.roob@example.com', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(173, 'Fleta', 'Towne', 'lebsack.phyllis@example.org', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(174, 'Unique', 'Buckridge', 'saul51@example.net', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(175, 'Oswaldo', 'Friesen', 'trent67@example.org', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(176, 'Linda', 'Muller', 'sandrine51@example.org', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(177, 'Mossie', 'Boehm', 'koss.zola@example.com', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(178, 'Lambert', 'DuBuque', 'chuel@example.com', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(179, 'Jettie', 'Mosciski', 'harmony18@example.net', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(180, 'Karina', 'O\'Kon', 'asimonis@example.org', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(181, 'Olga', 'Morar', 'oberbrunner.domenico@example.com', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(182, 'Winnifred', 'Beahan', 'pagac.macey@example.net', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(183, 'Karianne', 'Bergstrom', 'elind@example.net', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(184, 'Horace', 'Becker', 'kenya97@example.net', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(185, 'Travon', 'Cummings', 'rachelle32@example.net', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(186, 'Kyle', 'Tremblay', 'marks.blaise@example.net', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(187, 'Gladys', 'Feest', 'rogahn.felipe@example.com', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(188, 'Tierra', 'Anderson', 'xblock@example.com', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(189, 'Thora', 'Kuhic', 'jarrod01@example.org', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(190, 'Rebeka', 'Stroman', 'bernie.dare@example.org', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(191, 'Margaret', 'Blick', 'nquitzon@example.net', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(192, 'Yesenia', 'Tremblay', 'rosenbaum.reagan@example.org', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(193, 'Tia', 'Thiel', 'rherzog@example.com', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(194, 'Laverne', 'Kreiger', 'wdach@example.org', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(195, 'Willis', 'Hessel', 'ywindler@example.org', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(196, 'Alize', 'Fritsch', 'christophe.glover@example.net', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(197, 'Elmo', 'Gaylord', 'ambrose48@example.net', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(198, 'Lenora', 'Spencer', 'vena.sporer@example.com', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(199, 'Keith', 'Heathcote', 'schaefer.alexane@example.org', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(200, 'Mariam', 'Schultz', 'schamberger.hazle@example.com', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(201, 'Chelsea', 'Nikolaus', 'lakin.della@example.com', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(202, 'Tyree', 'Luettgen', 'grover07@example.com', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(203, 'Briana', 'Little', 'claudie22@example.org', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(204, 'Jayde', 'Stanton', 'helen.sanford@example.com', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(205, 'Orrin', 'Sipes', 'christiana.kerluke@example.org', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(206, 'Stephanie', 'Rippin', 'rosenbaum.kristian@example.com', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(207, 'Melvina', 'Effertz', 'temmerich@example.com', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(208, 'Jackson', 'Hammes', 'asha89@example.org', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(209, 'Elda', 'Stamm', 'mckenna.conn@example.com', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(210, 'Ewell', 'Kessler', 'yhansen@example.org', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(211, 'Emelie', 'Schowalter', 'lrenner@example.com', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(212, 'Bradford', 'Swift', 'emmanuelle.connelly@example.net', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(213, 'Aidan', 'Denesik', 'qheathcote@example.com', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(214, 'Casimer', 'Gislason', 'nmccullough@example.org', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(215, 'Johnpaul', 'Jones', 'ebony.stokes@example.com', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(216, 'Carolanne', 'Bartell', 'jaydon.pacocha@example.org', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(217, 'Vivian', 'Okuneva', 'estell07@example.net', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(218, 'April', 'Moen', 'lydia34@example.org', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(219, 'Haley', 'Stracke', 'mheaney@example.org', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(220, 'Kayli', 'Champlin', 'granville53@example.org', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(221, 'Darien', 'Auer', 'rhiannon50@example.com', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(222, 'Mariela', 'Borer', 'kovacek.era@example.org', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(223, 'Gordon', 'Bartell', 'dolly37@example.net', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(224, 'Eleanora', 'Collins', 'wade.steuber@example.com', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(225, 'Floyd', 'Hudson', 'leffler.alexandre@example.com', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(226, 'Benny', 'Kerluke', 'nikko58@example.org', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(227, 'Birdie', 'Torp', 'emertz@example.com', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(228, 'Marcos', 'Larson', 'anabel70@example.com', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(229, 'Betsy', 'Price', 'will.ruecker@example.net', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(230, 'Violette', 'Russel', 'trantow.mya@example.org', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(231, 'Stone', 'Feil', 'cummerata.raymond@example.com', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(232, 'Karson', 'Stark', 'bednar.vilma@example.org', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(233, 'Elouise', 'Ritchie', 'alexandrea.homenick@example.org', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(234, 'Dustin', 'Sipes', 'antonette54@example.com', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(235, 'Jermaine', 'Schumm', 'zkling@example.com', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(236, 'Mariane', 'Mann', 'zjakubowski@example.org', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(237, 'Shyanne', 'Mohr', 'tiana.emard@example.com', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(238, 'Jewel', 'Jacobs', 'angel.lubowitz@example.com', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(239, 'Otilia', 'Schultz', 'edmond47@example.org', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(240, 'Loma', 'Lueilwitz', 'schinner.estelle@example.com', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(241, 'Nickolas', 'Kessler', 'zward@example.org', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(242, 'Ernie', 'Franecki', 'whilpert@example.net', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(243, 'Grover', 'Ullrich', 'kaya13@example.net', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(244, 'Domenick', 'Purdy', 'danial84@example.org', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(245, 'Tony', 'Legros', 'abernathy.eloisa@example.net', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(246, 'London', 'Langworth', 'stokes.cary@example.org', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(247, 'Christopher', 'Hills', 'viviane80@example.org', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(248, 'Clint', 'Pfeffer', 'shomenick@example.net', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(249, 'Carmelo', 'Cartwright', 'everette.bartell@example.org', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(250, 'Emilie', 'Sipes', 'ndenesik@example.net', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(251, 'Rafael', 'Rodriguez', 'botsford.desiree@example.org', '2025-06-06 09:58:14', '2025-06-06 09:58:14'),
(252, 'Maya', 'Koss', 'saige23@example.org', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(253, 'Odessa', 'Abernathy', 'haley.lance@example.com', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(254, 'Ima', 'Ernser', 'rippin.henry@example.com', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(255, 'Reginald', 'Batz', 'elakin@example.org', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(256, 'Noemy', 'Brown', 'feeney.katarina@example.com', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(257, 'Ottis', 'Miller', 'wabernathy@example.com', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(258, 'Gia', 'Bednar', 'domenick.daugherty@example.org', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(259, 'Ettie', 'O\'Hara', 'julius21@example.com', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(260, 'Rahsaan', 'Quigley', 'irath@example.com', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(261, 'Reva', 'Altenwerth', 'rkassulke@example.org', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(262, 'Elise', 'Hayes', 'walter.ibrahim@example.org', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(263, 'Vincenzo', 'Leannon', 'gmetz@example.org', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(264, 'Bernardo', 'Goodwin', 'ssawayn@example.com', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(265, 'Jayce', 'Schamberger', 'jewell89@example.net', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(266, 'Roxanne', 'Ebert', 'loraine92@example.com', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(267, 'Keshaun', 'Davis', 'leanna10@example.net', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(268, 'Savion', 'Gerlach', 'luettgen.alisha@example.net', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(269, 'Antonietta', 'Effertz', 'snikolaus@example.org', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(270, 'Rod', 'Kozey', 'inienow@example.org', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(271, 'Yazmin', 'Carroll', 'langosh.clemens@example.org', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(272, 'Maybelle', 'Gislason', 'price.mariane@example.org', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(273, 'Rhea', 'Gerhold', 'barry.carroll@example.net', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(274, 'Lance', 'Sanford', 'valentina.sawayn@example.org', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(275, 'Arjun', 'Beier', 'jsatterfield@example.org', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(276, 'Linwood', 'Cronin', 'stark.rylan@example.com', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(277, 'Bertha', 'Abbott', 'ron90@example.org', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(278, 'Eriberto', 'Emard', 'schmeler.elisa@example.com', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(279, 'Courtney', 'Moore', 'xyost@example.net', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(280, 'Shayna', 'Mayer', 'kayla11@example.com', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(281, 'Lamar', 'Kuphal', 'adell93@example.com', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(282, 'Tommie', 'Hirthe', 'gaylord.cordelia@example.net', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(283, 'Claudia', 'Gibson', 'sylvester.hansen@example.org', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(284, 'Issac', 'Monahan', 'carley56@example.net', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(285, 'May', 'Kshlerin', 'bernhard75@example.net', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(286, 'Tianna', 'Mohr', 'elody.lind@example.net', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(287, 'Saul', 'Bartell', 'donna53@example.org', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(288, 'Hailey', 'Braun', 'ysmith@example.net', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(289, 'Alberta', 'Murray', 'rbradtke@example.net', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(290, 'Sigrid', 'Olson', 'jlebsack@example.com', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(291, 'Koby', 'Cummings', 'kkulas@example.net', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(292, 'Yazmin', 'McGlynn', 'zander.muller@example.org', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(293, 'Cordia', 'Koss', 'graciela.kautzer@example.com', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(294, 'Roy', 'Rutherford', 'padberg.reina@example.org', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(295, 'Corine', 'Legros', 'lionel41@example.org', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(296, 'Kaelyn', 'Kessler', 'xwisoky@example.org', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(297, 'Johnny', 'Lowe', 'kwalker@example.com', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(298, 'Ettie', 'Cummerata', 'isom06@example.org', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(299, 'Buford', 'Zemlak', 'stokes.carlo@example.com', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(300, 'Myrtle', 'Doyle', 'shyanne.heaney@example.net', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(301, 'Benjamin', 'Jerde', 'grady.anna@example.net', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(302, 'Brooke', 'Lowe', 'amina36@example.net', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(303, 'Natalie', 'Considine', 'marlee37@example.com', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(304, 'Sabina', 'Predovic', 'mcglynn.rahul@example.org', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(305, 'Baby', 'Donnelly', 'rbarton@example.net', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(306, 'Reece', 'Schaefer', 'alia.casper@example.net', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(307, 'Joe', 'Abbott', 'keeley71@example.org', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(308, 'Garnett', 'Stracke', 'mcclure.justice@example.com', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(309, 'Alaina', 'Predovic', 'bstark@example.org', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(310, 'Vinnie', 'Bins', 'morar.viola@example.org', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(311, 'Franz', 'Dare', 'stracke.jermey@example.org', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(312, 'Brown', 'Balistreri', 'blueilwitz@example.com', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(313, 'Marian', 'Reichel', 'winona48@example.org', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(314, 'Andre', 'Jenkins', 'weissnat.javier@example.com', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(315, 'Everette', 'Huel', 'garrison.kovacek@example.org', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(316, 'Jamarcus', 'Lakin', 'korbin93@example.net', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(317, 'Johann', 'Romaguera', 'dshields@example.com', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(318, 'Mohamed', 'Lang', 'hyatt.morris@example.com', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(319, 'Charity', 'Kihn', 'desmond.rutherford@example.com', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(320, 'Jocelyn', 'Daniel', 'ledner.allan@example.com', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(321, 'Hillary', 'Herman', 'graham.martin@example.org', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(322, 'Dale', 'Weber', 'nthiel@example.com', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(323, 'Tyler', 'Waters', 'qnitzsche@example.com', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(324, 'Triston', 'Quitzon', 'hamill.aric@example.net', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(325, 'Kellen', 'Aufderhar', 'nswaniawski@example.org', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(326, 'Althea', 'Raynor', 'larkin.vince@example.net', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(327, 'Jaiden', 'Graham', 'morar.marcos@example.net', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(328, 'Jan', 'Wilderman', 'cgerhold@example.net', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(329, 'Kurtis', 'Crist', 'pkunde@example.org', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(330, 'Felix', 'Jenkins', 'estrella30@example.org', '2025-06-06 09:58:15', '2025-06-06 09:58:15');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `administrativos`
--

CREATE TABLE `administrativos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `usuario_id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `apellido` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `administrativos`
--

INSERT INTO `administrativos` (`id`, `usuario_id`, `nombre`, `apellido`, `created_at`, `updated_at`) VALUES
(1, 1, 'Maria', 'Rodriguez', '2025-06-06 05:46:49', '2025-06-06 05:46:49'),
(2, 2, 'Edwin', 'Casallas', '2025-06-06 05:47:54', '2025-06-06 05:47:54'),
(3, 3, 'Andres', 'Gallo', '2025-06-06 05:48:24', '2025-06-06 05:48:24'),
(4, 4, 'Estiben', 'Cuellar', '2025-06-06 05:48:51', '2025-06-06 05:48:51');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asignaturas`
--

CREATE TABLE `asignaturas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre_asignatura` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `asignaturas`
--

INSERT INTO `asignaturas` (`id`, `nombre_asignatura`, `created_at`, `updated_at`) VALUES
(1, 'Matematicas', '2025-06-06 06:36:59', '2025-06-06 06:36:59'),
(2, 'Español', '2025-06-06 06:37:11', '2025-06-06 06:37:11'),
(3, 'Ingles', '2025-06-06 06:37:19', '2025-06-06 06:37:19'),
(4, 'Ciencias Naturales', '2025-06-06 06:37:34', '2025-06-06 06:37:34'),
(5, 'Fisica', '2025-06-06 06:38:17', '2025-06-06 06:38:17'),
(6, 'Quimica', '2025-06-06 06:38:26', '2025-06-06 06:38:26'),
(7, 'Historia', '2025-06-06 06:38:42', '2025-06-06 06:38:42'),
(8, 'Geografia', '2025-06-06 06:38:54', '2025-06-06 06:38:54'),
(9, 'Informatica', '2025-06-06 06:39:07', '2025-06-06 06:39:07'),
(10, 'Educacion Fisica', '2025-06-06 06:39:19', '2025-06-06 06:39:19'),
(11, 'Artes', '2025-06-06 06:39:34', '2025-06-06 06:39:34'),
(12, 'Filosofia', '2025-06-06 06:40:10', '2025-06-06 06:40:10');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asistencias`
--

CREATE TABLE `asistencias` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `clase_id` bigint(20) UNSIGNED NOT NULL,
  `estudiante_id` bigint(20) UNSIGNED NOT NULL,
  `estado` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aulas`
--

CREATE TABLE `aulas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre_aula` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `aulas`
--

INSERT INTO `aulas` (`id`, `nombre_aula`, `created_at`, `updated_at`) VALUES
(1, 'A', '2025-06-06 06:32:43', '2025-06-06 06:32:43'),
(2, 'B', '2025-06-06 06:32:50', '2025-06-06 06:32:50'),
(3, 'C', '2025-06-06 06:32:57', '2025-06-06 06:32:57'),
(4, 'D', '2025-06-06 06:33:01', '2025-06-06 06:33:01'),
(5, 'E', '2025-06-06 06:33:15', '2025-06-06 06:33:15'),
(6, 'F', '2025-06-06 06:33:21', '2025-06-06 06:33:21'),
(7, 'G', '2025-06-06 06:33:25', '2025-06-06 06:33:25'),
(8, 'H', '2025-06-06 06:33:31', '2025-06-06 06:33:31'),
(9, 'I', '2025-06-06 06:33:36', '2025-06-06 06:33:36'),
(10, 'J', '2025-06-06 06:33:41', '2025-06-06 06:33:41'),
(11, 'K', '2025-06-06 06:33:45', '2025-06-06 06:33:45');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('laravel_cache_wLvs0g28UiyPNY3F', 'a:1:{s:11:\"valid_until\";i:1743744525;}', 1744954005),
('laravel_cache_XNjLvKnKFjedaKd5', 'a:1:{s:11:\"valid_until\";i:1743744461;}', 1744954001);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clases`
--

CREATE TABLE `clases` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `asignatura_id` bigint(20) UNSIGNED NOT NULL,
  `docente_id` bigint(20) UNSIGNED NOT NULL,
  `aula_id` bigint(20) UNSIGNED NOT NULL,
  `curso_id` bigint(20) UNSIGNED NOT NULL,
  `fecha` date NOT NULL,
  `hora_inicio` time NOT NULL,
  `hora_fin` time NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cursos`
--

CREATE TABLE `cursos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `cursos`
--

INSERT INTO `cursos` (`id`, `nombre`, `created_at`, `updated_at`) VALUES
(1, '101', '2025-06-06 06:26:16', '2025-06-06 06:26:16'),
(2, '201', '2025-06-06 06:26:22', '2025-06-06 06:26:22'),
(3, '301', '2025-06-06 06:26:26', '2025-06-06 06:26:26'),
(4, '401', '2025-06-06 06:26:31', '2025-06-06 06:26:31'),
(5, '501', '2025-06-06 06:26:34', '2025-06-06 06:26:34'),
(6, '601', '2025-06-06 06:26:39', '2025-06-06 06:26:39'),
(7, '701', '2025-06-06 06:26:48', '2025-06-06 06:26:48'),
(8, '801', '2025-06-06 06:26:52', '2025-06-06 06:26:52'),
(9, '901', '2025-06-06 06:26:57', '2025-06-06 06:26:57'),
(10, '1001', '2025-06-06 06:27:10', '2025-06-06 06:27:10'),
(11, '1101', '2025-06-06 06:27:19', '2025-06-06 06:27:19');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `docentes`
--

CREATE TABLE `docentes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `usuario_id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `apellido` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `docentes`
--

INSERT INTO `docentes` (`id`, `usuario_id`, `nombre`, `apellido`, `created_at`, `updated_at`) VALUES
(1, 5, 'Juan', 'Perez', '2025-06-06 05:49:13', '2025-06-06 05:49:13'),
(2, 6, 'Maria', 'Lopez', '2025-06-06 05:49:24', '2025-06-06 05:49:24'),
(3, 7, 'Carlos', 'Ramirez', '2025-06-06 05:49:39', '2025-06-06 05:49:39'),
(4, 8, 'Ana', 'Gonzalez', '2025-06-06 05:49:56', '2025-06-06 05:49:56'),
(5, 9, 'Luis', 'Martinez', '2025-06-06 05:50:11', '2025-06-06 05:50:11'),
(6, 10, 'Sofia', 'Torres', '2025-06-06 05:50:26', '2025-06-06 05:50:26'),
(7, 11, 'Diego', 'Fernandez', '2025-06-06 05:50:41', '2025-06-06 05:50:41'),
(8, 12, 'Valentina', 'Sanches', '2025-06-06 05:50:55', '2025-06-06 05:50:55'),
(9, 13, 'Miguel', 'Rodrigiuez', '2025-06-06 05:51:11', '2025-06-06 05:51:11'),
(10, 14, 'Camila', 'Moreles', '2025-06-06 05:51:32', '2025-06-06 05:51:32'),
(11, 15, 'Andres', 'Navarro', '2025-06-06 05:51:46', '2025-06-06 05:51:46'),
(12, 16, 'Laura', 'Ruiz', '2025-06-06 05:51:59', '2025-06-06 05:51:59'),
(13, 17, 'Sebastian', 'Arias', '2025-06-06 05:52:13', '2025-06-06 05:52:13'),
(14, 18, 'Paula', 'Castillo', '2025-06-06 05:52:24', '2025-06-06 05:52:24'),
(15, 19, 'Daniel', 'Mendoza', '2025-06-06 05:52:38', '2025-06-06 05:52:38');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiantes`
--

CREATE TABLE `estudiantes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `acudiente_id` bigint(20) UNSIGNED NOT NULL,
  `curso_id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `apellido` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `estudiantes`
--

INSERT INTO `estudiantes` (`id`, `acudiente_id`, `curso_id`, `nombre`, `apellido`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Alvah', 'Rau', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(2, 2, 1, 'Alexander', 'Muller', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(3, 3, 1, 'Hulda', 'Hamill', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(4, 4, 1, 'Austyn', 'Shanahan', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(5, 5, 1, 'Kariane', 'Schulist', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(6, 6, 1, 'Alaina', 'Ondricka', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(7, 7, 1, 'Aracely', 'Kerluke', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(8, 8, 1, 'Maurine', 'Morar', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(9, 9, 1, 'Bennett', 'Gibson', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(10, 10, 1, 'Ludie', 'Feeney', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(11, 11, 1, 'Lauryn', 'Dach', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(12, 12, 1, 'Antonietta', 'Kuhic', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(13, 13, 1, 'Deion', 'Skiles', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(14, 14, 1, 'Heaven', 'Halvorson', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(15, 15, 1, 'Sam', 'Stoltenberg', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(16, 16, 1, 'Gisselle', 'Lebsack', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(17, 17, 1, 'Isabel', 'Brakus', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(18, 18, 1, 'Shanelle', 'Crist', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(19, 19, 1, 'Leora', 'Beier', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(20, 20, 1, 'Anya', 'Bailey', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(21, 21, 1, 'Houston', 'Feil', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(22, 22, 1, 'Krista', 'Blanda', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(23, 23, 1, 'Isaiah', 'Fadel', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(24, 24, 1, 'Lexi', 'Hill', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(25, 25, 1, 'Merle', 'Hackett', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(26, 26, 1, 'Soledad', 'Jast', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(27, 27, 1, 'Americo', 'Stiedemann', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(28, 28, 1, 'Domenico', 'Greenholt', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(29, 29, 1, 'Linda', 'Hills', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(30, 30, 1, 'Eino', 'Fay', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(31, 31, 2, 'Royce', 'Cormier', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(32, 32, 2, 'Bill', 'Prosacco', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(33, 33, 2, 'Karl', 'Hammes', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(34, 34, 2, 'Clinton', 'Willms', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(35, 35, 2, 'Dasia', 'Strosin', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(36, 36, 2, 'Katheryn', 'Ritchie', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(37, 37, 2, 'Ava', 'Glover', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(38, 38, 2, 'Kale', 'Wiegand', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(39, 39, 2, 'Kallie', 'Block', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(40, 40, 2, 'Christian', 'Hand', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(41, 41, 2, 'Ashtyn', 'Bosco', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(42, 42, 2, 'Marianna', 'Dach', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(43, 43, 2, 'Marlene', 'Farrell', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(44, 44, 2, 'Diego', 'Hermiston', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(45, 45, 2, 'Shyanne', 'Jacobi', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(46, 46, 2, 'Lynn', 'Stracke', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(47, 47, 2, 'Micah', 'Ritchie', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(48, 48, 2, 'Sedrick', 'White', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(49, 49, 2, 'Marcus', 'Mohr', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(50, 50, 2, 'Jakob', 'Sauer', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(51, 51, 2, 'Berneice', 'Price', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(52, 52, 2, 'Jany', 'Spencer', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(53, 53, 2, 'Antonio', 'Botsford', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(54, 54, 2, 'Syble', 'Jacobi', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(55, 55, 2, 'Mathilde', 'Greenfelder', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(56, 56, 2, 'Samara', 'Stiedemann', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(57, 57, 2, 'Berniece', 'Towne', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(58, 58, 2, 'Myrl', 'Hickle', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(59, 59, 2, 'Wilhelm', 'Conn', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(60, 60, 2, 'Lisette', 'D\'Amore', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(61, 61, 3, 'Ophelia', 'Brown', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(62, 62, 3, 'Trent', 'Hilpert', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(63, 63, 3, 'Timothy', 'Witting', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(64, 64, 3, 'Elmira', 'Terry', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(65, 65, 3, 'Geo', 'Boyer', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(66, 66, 3, 'Mittie', 'Cormier', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(67, 67, 3, 'Bettye', 'Hermiston', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(68, 68, 3, 'Paxton', 'Russel', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(69, 69, 3, 'Maria', 'Davis', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(70, 70, 3, 'Daryl', 'McLaughlin', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(71, 71, 3, 'Dorthy', 'Shanahan', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(72, 72, 3, 'Anika', 'Murray', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(73, 73, 3, 'Santos', 'Conn', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(74, 74, 3, 'Lonzo', 'Russel', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(75, 75, 3, 'Arthur', 'Cassin', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(76, 76, 3, 'Emmy', 'Corkery', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(77, 77, 3, 'Jorge', 'Harber', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(78, 78, 3, 'Ruthie', 'Cummings', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(79, 79, 3, 'Anais', 'Kovacek', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(80, 80, 3, 'Judd', 'Dicki', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(81, 81, 3, 'Allan', 'West', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(82, 82, 3, 'Myles', 'Nitzsche', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(83, 83, 3, 'Michaela', 'Batz', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(84, 84, 3, 'Jayden', 'Funk', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(85, 85, 3, 'Madisyn', 'Cassin', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(86, 86, 3, 'Henriette', 'Hudson', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(87, 87, 3, 'Matilde', 'Bartoletti', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(88, 88, 3, 'Jeremie', 'Grady', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(89, 89, 3, 'Rupert', 'Boyle', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(90, 90, 3, 'Cortney', 'Haley', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(91, 91, 4, 'Corene', 'Lubowitz', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(92, 92, 4, 'Mattie', 'Nikolaus', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(93, 93, 4, 'Jaida', 'Nicolas', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(94, 94, 4, 'Theodore', 'Schneider', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(95, 95, 4, 'Orin', 'Mayer', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(96, 96, 4, 'Ellen', 'Christiansen', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(97, 97, 4, 'Fatima', 'Heaney', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(98, 98, 4, 'Frances', 'Lemke', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(99, 99, 4, 'Odell', 'McKenzie', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(100, 100, 4, 'Susan', 'Heathcote', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(101, 101, 4, 'Benny', 'Ferry', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(102, 102, 4, 'Piper', 'Ankunding', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(103, 103, 4, 'Tad', 'Borer', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(104, 104, 4, 'Nash', 'Mayert', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(105, 105, 4, 'Ron', 'Osinski', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(106, 106, 4, 'Francisco', 'Lynch', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(107, 107, 4, 'Adrienne', 'Cummerata', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(108, 108, 4, 'Jamey', 'Prohaska', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(109, 109, 4, 'Keon', 'Jaskolski', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(110, 110, 4, 'Gordon', 'Hagenes', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(111, 111, 4, 'Lauretta', 'Bartoletti', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(112, 112, 4, 'Katelynn', 'Sauer', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(113, 113, 4, 'Ali', 'Littel', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(114, 114, 4, 'Leola', 'Moen', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(115, 115, 4, 'Ebony', 'Stiedemann', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(116, 116, 4, 'Gilbert', 'Farrell', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(117, 117, 4, 'Alphonso', 'Johns', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(118, 118, 4, 'Earline', 'Wolff', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(119, 119, 4, 'Stacy', 'Buckridge', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(120, 120, 4, 'Vernie', 'Conroy', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(121, 121, 5, 'Karl', 'Kshlerin', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(122, 122, 5, 'Erik', 'Larkin', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(123, 123, 5, 'Dameon', 'Wehner', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(124, 124, 5, 'Crystal', 'Windler', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(125, 125, 5, 'Sandra', 'Sipes', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(126, 126, 5, 'Jeremie', 'Treutel', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(127, 127, 5, 'Melyna', 'Gusikowski', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(128, 128, 5, 'Tyreek', 'Nader', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(129, 129, 5, 'Garnet', 'Grant', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(130, 130, 5, 'Bonnie', 'Brakus', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(131, 131, 5, 'Ivory', 'Gulgowski', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(132, 132, 5, 'Birdie', 'Ullrich', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(133, 133, 5, 'Carson', 'Hill', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(134, 134, 5, 'Phoebe', 'Kiehn', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(135, 135, 5, 'Gisselle', 'Gleichner', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(136, 136, 5, 'Maci', 'Mosciski', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(137, 137, 5, 'Collin', 'Krajcik', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(138, 138, 5, 'Albert', 'Macejkovic', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(139, 139, 5, 'Nigel', 'Lesch', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(140, 140, 5, 'Lexie', 'Kuhlman', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(141, 141, 5, 'Florine', 'Veum', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(142, 142, 5, 'Bart', 'Conroy', '2025-06-06 09:58:15', '2025-06-06 09:58:15'),
(143, 143, 5, 'Karen', 'Okuneva', '2025-06-06 09:58:16', '2025-06-06 09:58:16'),
(144, 144, 5, 'Nathaniel', 'Welch', '2025-06-06 09:58:16', '2025-06-06 09:58:16'),
(145, 145, 5, 'Bernadette', 'Altenwerth', '2025-06-06 09:58:16', '2025-06-06 09:58:16'),
(146, 146, 5, 'Sandy', 'Wilkinson', '2025-06-06 09:58:16', '2025-06-06 09:58:16'),
(147, 147, 5, 'Adolphus', 'Pacocha', '2025-06-06 09:58:16', '2025-06-06 09:58:16'),
(148, 148, 5, 'Jaeden', 'Kuvalis', '2025-06-06 09:58:16', '2025-06-06 09:58:16'),
(149, 149, 5, 'Marge', 'Stoltenberg', '2025-06-06 09:58:16', '2025-06-06 09:58:16'),
(150, 150, 5, 'Earl', 'Towne', '2025-06-06 09:58:16', '2025-06-06 09:58:16'),
(151, 151, 6, 'Kathryne', 'Buckridge', '2025-06-06 09:58:16', '2025-06-06 09:58:16'),
(152, 152, 6, 'Mark', 'Ullrich', '2025-06-06 09:58:16', '2025-06-06 09:58:16'),
(153, 153, 6, 'Kenneth', 'Schaden', '2025-06-06 09:58:16', '2025-06-06 09:58:16'),
(154, 154, 6, 'Derick', 'Carter', '2025-06-06 09:58:16', '2025-06-06 09:58:16'),
(155, 155, 6, 'Orrin', 'Dach', '2025-06-06 09:58:16', '2025-06-06 09:58:16'),
(156, 156, 6, 'Berta', 'Dietrich', '2025-06-06 09:58:16', '2025-06-06 09:58:16'),
(157, 157, 6, 'Jazmyn', 'Oberbrunner', '2025-06-06 09:58:16', '2025-06-06 09:58:16'),
(158, 158, 6, 'Jaylon', 'Medhurst', '2025-06-06 09:58:16', '2025-06-06 09:58:16'),
(159, 159, 6, 'Jace', 'Cruickshank', '2025-06-06 09:58:16', '2025-06-06 09:58:16'),
(160, 160, 6, 'Liam', 'Wuckert', '2025-06-06 09:58:16', '2025-06-06 09:58:16'),
(161, 161, 6, 'Prince', 'Kuphal', '2025-06-06 09:58:16', '2025-06-06 09:58:16'),
(162, 162, 6, 'Rebecca', 'Hansen', '2025-06-06 09:58:16', '2025-06-06 09:58:16'),
(163, 163, 6, 'Zelma', 'Hoppe', '2025-06-06 09:58:16', '2025-06-06 09:58:16'),
(164, 164, 6, 'Fay', 'Bogan', '2025-06-06 09:58:16', '2025-06-06 09:58:16'),
(165, 165, 6, 'Rachelle', 'McDermott', '2025-06-06 09:58:16', '2025-06-06 09:58:16'),
(166, 166, 6, 'Austin', 'O\'Kon', '2025-06-06 09:58:16', '2025-06-06 09:58:16'),
(167, 167, 6, 'Quentin', 'Wunsch', '2025-06-06 09:58:16', '2025-06-06 09:58:16'),
(168, 168, 6, 'Maxwell', 'Kling', '2025-06-06 09:58:16', '2025-06-06 09:58:16'),
(169, 169, 6, 'Bobbie', 'Kunze', '2025-06-06 09:58:16', '2025-06-06 09:58:16'),
(170, 170, 6, 'Hunter', 'Bergstrom', '2025-06-06 09:58:16', '2025-06-06 09:58:16'),
(171, 171, 6, 'Garrett', 'Grant', '2025-06-06 09:58:16', '2025-06-06 09:58:16'),
(172, 172, 6, 'Ludie', 'Schoen', '2025-06-06 09:58:16', '2025-06-06 09:58:16'),
(173, 173, 6, 'Abbie', 'Douglas', '2025-06-06 09:58:16', '2025-06-06 09:58:16'),
(174, 174, 6, 'Liza', 'White', '2025-06-06 09:58:16', '2025-06-06 09:58:16'),
(175, 175, 6, 'Penelope', 'Harber', '2025-06-06 09:58:16', '2025-06-06 09:58:16'),
(176, 176, 6, 'Alex', 'Hammes', '2025-06-06 09:58:16', '2025-06-06 09:58:16'),
(177, 177, 6, 'Darron', 'Zemlak', '2025-06-06 09:58:16', '2025-06-06 09:58:16'),
(178, 178, 6, 'Dejon', 'Smith', '2025-06-06 09:58:16', '2025-06-06 09:58:16'),
(179, 179, 6, 'Neil', 'Grady', '2025-06-06 09:58:16', '2025-06-06 09:58:16'),
(180, 180, 6, 'Tabitha', 'Hartmann', '2025-06-06 09:58:16', '2025-06-06 09:58:16'),
(181, 181, 7, 'Luciano', 'Bernier', '2025-06-06 09:58:16', '2025-06-06 09:58:16'),
(182, 182, 7, 'Rhianna', 'Carroll', '2025-06-06 09:58:16', '2025-06-06 09:58:16'),
(183, 183, 7, 'Lenny', 'Mueller', '2025-06-06 09:58:16', '2025-06-06 09:58:16'),
(184, 184, 7, 'Hailee', 'Mills', '2025-06-06 09:58:16', '2025-06-06 09:58:16'),
(185, 185, 7, 'Luis', 'Lemke', '2025-06-06 09:58:16', '2025-06-06 09:58:16'),
(186, 186, 7, 'Maya', 'Collier', '2025-06-06 09:58:16', '2025-06-06 09:58:16'),
(187, 187, 7, 'Reinhold', 'Von', '2025-06-06 09:58:16', '2025-06-06 09:58:16'),
(188, 188, 7, 'Ross', 'Koch', '2025-06-06 09:58:16', '2025-06-06 09:58:16'),
(189, 189, 7, 'Emelia', 'Cremin', '2025-06-06 09:58:16', '2025-06-06 09:58:16'),
(190, 190, 7, 'Ambrose', 'Lesch', '2025-06-06 09:58:16', '2025-06-06 09:58:16'),
(191, 191, 7, 'Trace', 'Fritsch', '2025-06-06 09:58:16', '2025-06-06 09:58:16'),
(192, 192, 7, 'Filomena', 'D\'Amore', '2025-06-06 09:58:16', '2025-06-06 09:58:16'),
(193, 193, 7, 'Daryl', 'Kuvalis', '2025-06-06 09:58:16', '2025-06-06 09:58:16'),
(194, 194, 7, 'Dorothy', 'Mertz', '2025-06-06 09:58:16', '2025-06-06 09:58:16'),
(195, 195, 7, 'Pansy', 'McLaughlin', '2025-06-06 09:58:16', '2025-06-06 09:58:16'),
(196, 196, 7, 'Yoshiko', 'Hammes', '2025-06-06 09:58:16', '2025-06-06 09:58:16'),
(197, 197, 7, 'Lyda', 'Gibson', '2025-06-06 09:58:16', '2025-06-06 09:58:16'),
(198, 198, 7, 'Daphne', 'Ondricka', '2025-06-06 09:58:16', '2025-06-06 09:58:16'),
(199, 199, 7, 'Gunnar', 'Gerlach', '2025-06-06 09:58:16', '2025-06-06 09:58:16'),
(200, 200, 7, 'Tod', 'Sawayn', '2025-06-06 09:58:16', '2025-06-06 09:58:16'),
(201, 201, 7, 'Benny', 'Krajcik', '2025-06-06 09:58:16', '2025-06-06 09:58:16'),
(202, 202, 7, 'Chad', 'Bernier', '2025-06-06 09:58:16', '2025-06-06 09:58:16'),
(203, 203, 7, 'Murl', 'Heathcote', '2025-06-06 09:58:16', '2025-06-06 09:58:16'),
(204, 204, 7, 'Miles', 'Fahey', '2025-06-06 09:58:16', '2025-06-06 09:58:16'),
(205, 205, 7, 'Afton', 'Kiehn', '2025-06-06 09:58:16', '2025-06-06 09:58:16'),
(206, 206, 7, 'Tyra', 'Wilkinson', '2025-06-06 09:58:16', '2025-06-06 09:58:16'),
(207, 207, 7, 'Rusty', 'Bruen', '2025-06-06 09:58:16', '2025-06-06 09:58:16'),
(208, 208, 7, 'Leora', 'Braun', '2025-06-06 09:58:16', '2025-06-06 09:58:16'),
(209, 209, 7, 'Tressie', 'Cronin', '2025-06-06 09:58:16', '2025-06-06 09:58:16'),
(210, 210, 7, 'Amira', 'D\'Amore', '2025-06-06 09:58:16', '2025-06-06 09:58:16'),
(211, 211, 8, 'Gayle', 'Franecki', '2025-06-06 09:58:16', '2025-06-06 09:58:16'),
(212, 212, 8, 'Alysa', 'Ebert', '2025-06-06 09:58:16', '2025-06-06 09:58:16'),
(213, 213, 8, 'Doug', 'Toy', '2025-06-06 09:58:16', '2025-06-06 09:58:16'),
(214, 214, 8, 'Amely', 'Bahringer', '2025-06-06 09:58:16', '2025-06-06 09:58:16'),
(215, 215, 8, 'Jeanette', 'Bahringer', '2025-06-06 09:58:16', '2025-06-06 09:58:16'),
(216, 216, 8, 'Trisha', 'Wilkinson', '2025-06-06 09:58:16', '2025-06-06 09:58:16'),
(217, 217, 8, 'Gerardo', 'Boehm', '2025-06-06 09:58:16', '2025-06-06 09:58:16'),
(218, 218, 8, 'Gwen', 'Abernathy', '2025-06-06 09:58:16', '2025-06-06 09:58:16'),
(219, 219, 8, 'Cora', 'Grant', '2025-06-06 09:58:16', '2025-06-06 09:58:16'),
(220, 220, 8, 'Gladyce', 'O\'Reilly', '2025-06-06 09:58:16', '2025-06-06 09:58:16'),
(221, 221, 8, 'Hertha', 'Cormier', '2025-06-06 09:58:16', '2025-06-06 09:58:16'),
(222, 222, 8, 'Albin', 'Bahringer', '2025-06-06 09:58:16', '2025-06-06 09:58:16'),
(223, 223, 8, 'Queenie', 'Moen', '2025-06-06 09:58:16', '2025-06-06 09:58:16'),
(224, 224, 8, 'Mariana', 'Ledner', '2025-06-06 09:58:16', '2025-06-06 09:58:16'),
(225, 225, 8, 'Nicklaus', 'Feest', '2025-06-06 09:58:16', '2025-06-06 09:58:16'),
(226, 226, 8, 'Mariah', 'Crooks', '2025-06-06 09:58:16', '2025-06-06 09:58:16'),
(227, 227, 8, 'Katrina', 'Stehr', '2025-06-06 09:58:16', '2025-06-06 09:58:16'),
(228, 228, 8, 'Lempi', 'Fisher', '2025-06-06 09:58:16', '2025-06-06 09:58:16'),
(229, 229, 8, 'Declan', 'O\'Reilly', '2025-06-06 09:58:16', '2025-06-06 09:58:16'),
(230, 230, 8, 'Larissa', 'Rogahn', '2025-06-06 09:58:16', '2025-06-06 09:58:16'),
(231, 231, 8, 'Hillard', 'Jacobson', '2025-06-06 09:58:16', '2025-06-06 09:58:16'),
(232, 232, 8, 'Maiya', 'Balistreri', '2025-06-06 09:58:16', '2025-06-06 09:58:16'),
(233, 233, 8, 'Corene', 'Schowalter', '2025-06-06 09:58:16', '2025-06-06 09:58:16'),
(234, 234, 8, 'Ocie', 'Klein', '2025-06-06 09:58:16', '2025-06-06 09:58:16'),
(235, 235, 8, 'Bettie', 'Pollich', '2025-06-06 09:58:16', '2025-06-06 09:58:16'),
(236, 236, 8, 'Magnolia', 'Murray', '2025-06-06 09:58:16', '2025-06-06 09:58:16'),
(237, 237, 8, 'Tremayne', 'Nicolas', '2025-06-06 09:58:16', '2025-06-06 09:58:16'),
(238, 238, 8, 'Grady', 'Klocko', '2025-06-06 09:58:16', '2025-06-06 09:58:16'),
(239, 239, 8, 'Adeline', 'Parker', '2025-06-06 09:58:16', '2025-06-06 09:58:16'),
(240, 240, 8, 'Effie', 'Stehr', '2025-06-06 09:58:16', '2025-06-06 09:58:16'),
(241, 241, 9, 'Jocelyn', 'Wisozk', '2025-06-06 09:58:16', '2025-06-06 09:58:16'),
(242, 242, 9, 'Henderson', 'Shanahan', '2025-06-06 09:58:16', '2025-06-06 09:58:16'),
(243, 243, 9, 'Janae', 'Jones', '2025-06-06 09:58:16', '2025-06-06 09:58:16'),
(244, 244, 9, 'Erika', 'Pfannerstill', '2025-06-06 09:58:16', '2025-06-06 09:58:16'),
(245, 245, 9, 'Aurelie', 'Wunsch', '2025-06-06 09:58:16', '2025-06-06 09:58:16'),
(246, 246, 9, 'Rollin', 'Tremblay', '2025-06-06 09:58:16', '2025-06-06 09:58:16'),
(247, 247, 9, 'Mason', 'Gibson', '2025-06-06 09:58:16', '2025-06-06 09:58:16'),
(248, 248, 9, 'Effie', 'Stiedemann', '2025-06-06 09:58:16', '2025-06-06 09:58:16'),
(249, 249, 9, 'Alessandra', 'Witting', '2025-06-06 09:58:16', '2025-06-06 09:58:16'),
(250, 250, 9, 'Hans', 'Weber', '2025-06-06 09:58:16', '2025-06-06 09:58:16'),
(251, 251, 9, 'Libbie', 'Stark', '2025-06-06 09:58:16', '2025-06-06 09:58:16'),
(252, 252, 9, 'Camden', 'Toy', '2025-06-06 09:58:16', '2025-06-06 09:58:16'),
(253, 253, 9, 'Emmy', 'Altenwerth', '2025-06-06 09:58:16', '2025-06-06 09:58:16'),
(254, 254, 9, 'Maryse', 'Marvin', '2025-06-06 09:58:16', '2025-06-06 09:58:16'),
(255, 255, 9, 'Simone', 'Marvin', '2025-06-06 09:58:16', '2025-06-06 09:58:16'),
(256, 256, 9, 'Erich', 'Hermiston', '2025-06-06 09:58:16', '2025-06-06 09:58:16'),
(257, 257, 9, 'Jeffrey', 'Abshire', '2025-06-06 09:58:16', '2025-06-06 09:58:16'),
(258, 258, 9, 'Tamia', 'Collier', '2025-06-06 09:58:16', '2025-06-06 09:58:16'),
(259, 259, 9, 'Tyra', 'Bahringer', '2025-06-06 09:58:16', '2025-06-06 09:58:16'),
(260, 260, 9, 'Jordane', 'Schultz', '2025-06-06 09:58:16', '2025-06-06 09:58:16'),
(261, 261, 9, 'Karine', 'Heller', '2025-06-06 09:58:16', '2025-06-06 09:58:16'),
(262, 262, 9, 'Bart', 'DuBuque', '2025-06-06 09:58:16', '2025-06-06 09:58:16'),
(263, 263, 9, 'Zachariah', 'Dickinson', '2025-06-06 09:58:16', '2025-06-06 09:58:16'),
(264, 264, 9, 'Stevie', 'Maggio', '2025-06-06 09:58:16', '2025-06-06 09:58:16'),
(265, 265, 9, 'Celestino', 'Pfannerstill', '2025-06-06 09:58:16', '2025-06-06 09:58:16'),
(266, 266, 9, 'Emelia', 'Fritsch', '2025-06-06 09:58:16', '2025-06-06 09:58:16'),
(267, 267, 9, 'Oleta', 'Wunsch', '2025-06-06 09:58:16', '2025-06-06 09:58:16'),
(268, 268, 9, 'Winfield', 'Purdy', '2025-06-06 09:58:16', '2025-06-06 09:58:16'),
(269, 269, 9, 'Myrl', 'Crooks', '2025-06-06 09:58:16', '2025-06-06 09:58:16'),
(270, 270, 9, 'Ova', 'Raynor', '2025-06-06 09:58:16', '2025-06-06 09:58:16'),
(271, 271, 10, 'Madison', 'Hilpert', '2025-06-06 09:58:16', '2025-06-06 09:58:16'),
(272, 272, 10, 'Verna', 'Macejkovic', '2025-06-06 09:58:16', '2025-06-06 09:58:16'),
(273, 273, 10, 'Earnest', 'O\'Keefe', '2025-06-06 09:58:16', '2025-06-06 09:58:16'),
(274, 274, 10, 'Dejuan', 'Strosin', '2025-06-06 09:58:16', '2025-06-06 09:58:16'),
(275, 275, 10, 'Samson', 'Turner', '2025-06-06 09:58:16', '2025-06-06 09:58:16'),
(276, 276, 10, 'Herbert', 'Morissette', '2025-06-06 09:58:16', '2025-06-06 09:58:16'),
(277, 277, 10, 'Macie', 'O\'Connell', '2025-06-06 09:58:16', '2025-06-06 09:58:16'),
(278, 278, 10, 'Terence', 'Cole', '2025-06-06 09:58:16', '2025-06-06 09:58:16'),
(279, 279, 10, 'Davion', 'Howe', '2025-06-06 09:58:16', '2025-06-06 09:58:16'),
(280, 280, 10, 'Meredith', 'Gerlach', '2025-06-06 09:58:16', '2025-06-06 09:58:16'),
(281, 281, 10, 'Enoch', 'Klein', '2025-06-06 09:58:16', '2025-06-06 09:58:16'),
(282, 282, 10, 'Cooper', 'Abbott', '2025-06-06 09:58:16', '2025-06-06 09:58:16'),
(283, 283, 10, 'Bethel', 'Gutmann', '2025-06-06 09:58:16', '2025-06-06 09:58:16'),
(284, 284, 10, 'Xander', 'Ortiz', '2025-06-06 09:58:16', '2025-06-06 09:58:16'),
(285, 285, 10, 'Orville', 'Dietrich', '2025-06-06 09:58:16', '2025-06-06 09:58:16'),
(286, 286, 10, 'Grant', 'Thompson', '2025-06-06 09:58:16', '2025-06-06 09:58:16'),
(287, 287, 10, 'Alessandro', 'Gorczany', '2025-06-06 09:58:16', '2025-06-06 09:58:16'),
(288, 288, 10, 'Elyssa', 'Franecki', '2025-06-06 09:58:16', '2025-06-06 09:58:16'),
(289, 289, 10, 'Cristobal', 'Denesik', '2025-06-06 09:58:16', '2025-06-06 09:58:16'),
(290, 290, 10, 'Stella', 'Schamberger', '2025-06-06 09:58:16', '2025-06-06 09:58:16'),
(291, 291, 10, 'Braeden', 'Bernier', '2025-06-06 09:58:16', '2025-06-06 09:58:16'),
(292, 292, 10, 'Fernando', 'Davis', '2025-06-06 09:58:16', '2025-06-06 09:58:16'),
(293, 293, 10, 'Jeanette', 'Bernhard', '2025-06-06 09:58:16', '2025-06-06 09:58:16'),
(294, 294, 10, 'Eveline', 'McDermott', '2025-06-06 09:58:16', '2025-06-06 09:58:16'),
(295, 295, 10, 'Arielle', 'Zemlak', '2025-06-06 09:58:16', '2025-06-06 09:58:16'),
(296, 296, 10, 'Dahlia', 'Grady', '2025-06-06 09:58:16', '2025-06-06 09:58:16'),
(297, 297, 10, 'Christine', 'Miller', '2025-06-06 09:58:16', '2025-06-06 09:58:16'),
(298, 298, 10, 'Franz', 'Donnelly', '2025-06-06 09:58:16', '2025-06-06 09:58:16'),
(299, 299, 10, 'Immanuel', 'Considine', '2025-06-06 09:58:16', '2025-06-06 09:58:16'),
(300, 300, 10, 'Clarissa', 'Wuckert', '2025-06-06 09:58:16', '2025-06-06 09:58:16'),
(301, 301, 11, 'Stewart', 'Huels', '2025-06-06 09:58:16', '2025-06-06 09:58:16'),
(302, 302, 11, 'Magdalen', 'Koch', '2025-06-06 09:58:16', '2025-06-06 09:58:16'),
(303, 303, 11, 'Ryder', 'Kris', '2025-06-06 09:58:16', '2025-06-06 09:58:16'),
(304, 304, 11, 'Antoinette', 'Dare', '2025-06-06 09:58:16', '2025-06-06 09:58:16'),
(305, 305, 11, 'Amy', 'Macejkovic', '2025-06-06 09:58:16', '2025-06-06 09:58:16'),
(306, 306, 11, 'Astrid', 'Lockman', '2025-06-06 09:58:16', '2025-06-06 09:58:16'),
(307, 307, 11, 'Marguerite', 'Bode', '2025-06-06 09:58:16', '2025-06-06 09:58:16'),
(308, 308, 11, 'Sharon', 'Koss', '2025-06-06 09:58:16', '2025-06-06 09:58:16'),
(309, 309, 11, 'Evangeline', 'Simonis', '2025-06-06 09:58:16', '2025-06-06 09:58:16'),
(310, 310, 11, 'Jordon', 'Thompson', '2025-06-06 09:58:16', '2025-06-06 09:58:16'),
(311, 311, 11, 'Glen', 'Wiegand', '2025-06-06 09:58:16', '2025-06-06 09:58:16'),
(312, 312, 11, 'Kaylah', 'Leffler', '2025-06-06 09:58:16', '2025-06-06 09:58:16'),
(313, 313, 11, 'Lea', 'Hyatt', '2025-06-06 09:58:16', '2025-06-06 09:58:16'),
(314, 314, 11, 'Dalton', 'Weimann', '2025-06-06 09:58:16', '2025-06-06 09:58:16'),
(315, 315, 11, 'Hoyt', 'Boehm', '2025-06-06 09:58:16', '2025-06-06 09:58:16'),
(316, 316, 11, 'Jamar', 'Schimmel', '2025-06-06 09:58:16', '2025-06-06 09:58:16'),
(317, 317, 11, 'Russell', 'Marquardt', '2025-06-06 09:58:16', '2025-06-06 09:58:16'),
(318, 318, 11, 'Stone', 'Erdman', '2025-06-06 09:58:16', '2025-06-06 09:58:16'),
(319, 319, 11, 'Jaylin', 'Steuber', '2025-06-06 09:58:16', '2025-06-06 09:58:16'),
(320, 320, 11, 'Roxane', 'Swaniawski', '2025-06-06 09:58:16', '2025-06-06 09:58:16'),
(321, 321, 11, 'Vincenza', 'Smitham', '2025-06-06 09:58:16', '2025-06-06 09:58:16'),
(322, 322, 11, 'Sincere', 'Mertz', '2025-06-06 09:58:16', '2025-06-06 09:58:16'),
(323, 323, 11, 'Khalid', 'Franecki', '2025-06-06 09:58:16', '2025-06-06 09:58:16'),
(324, 324, 11, 'Raven', 'Greenholt', '2025-06-06 09:58:16', '2025-06-06 09:58:16'),
(325, 325, 11, 'Tobin', 'Bechtelar', '2025-06-06 09:58:16', '2025-06-06 09:58:16'),
(326, 326, 11, 'Brant', 'Walsh', '2025-06-06 09:58:16', '2025-06-06 09:58:16'),
(327, 327, 11, 'Joanne', 'Osinski', '2025-06-06 09:58:16', '2025-06-06 09:58:16'),
(328, 328, 11, 'Jalen', 'Schroeder', '2025-06-06 09:58:16', '2025-06-06 09:58:16'),
(329, 329, 11, 'Esther', 'Hackett', '2025-06-06 09:58:16', '2025-06-06 09:58:16'),
(330, 330, 11, 'Samantha', 'Botsford', '2025-06-06 09:58:16', '2025-06-06 09:58:16');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(11, '0001_01_01_000001_create_cache_table', 1),
(12, '0001_01_01_000002_create_jobs_table', 1),
(13, '2025_04_01_233628_create_personal_access_tokens_table', 1),
(14, '2025_04_01_233929_create_roles_table', 1),
(15, '2025_04_02_004854_create_usuarios_table', 1),
(16, '2025_04_03_163933_create_docentes_table', 1),
(17, '2025_04_03_164900_create_cursos_table', 1),
(18, '2025_04_03_165000_create_acudientes_table', 1),
(19, '2025_04_03_165049_create_estudiantes_table', 1),
(20, '2025_04_03_193844_create_administrativos_table', 1),
(21, '2025_04_04_052100_rename_contraseña_to_password_in_usuarios_table', 2),
(22, '2025_05_12_131516_create_asignaturas_table', 3),
(23, '2025_05_12_135131_create_aulas_table', 3),
(24, '2025_05_12_135200_create_clases_table', 3),
(25, '2025_05_12_135207_create_asistencias_table', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `permisos` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`permisos`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id`, `nombre`, `permisos`, `created_at`, `updated_at`) VALUES
(1, 'Administrador', NULL, '2025-06-06 05:20:34', '2025-06-06 05:20:34'),
(2, 'Docente', NULL, '2025-06-06 05:21:33', '2025-06-06 05:21:33');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `rol_id` bigint(20) UNSIGNED NOT NULL,
  `estado` int(11) NOT NULL,
  `correo` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `rol_id`, `estado`, `correo`, `password`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'maria@gmail.com', '$2y$12$STQ7pRBBlA04V5w9aj9fAu3OBnI.7tvdpDnSC5Hb7gHbEUbHApbSu', '2025-06-06 05:23:26', '2025-06-06 05:23:26'),
(2, 1, 1, 'edwin@gmail.com', '$2y$12$zAoPYnn6OpNpuw.9yy3dzupn4DU4B6erfaN9VFMXcXaEmohYEqrV6', '2025-06-06 05:23:41', '2025-06-06 05:23:41'),
(3, 1, 1, 'andres@gmail.com', '$2y$12$flwR/NdtDjN5ugVI8Jh3/.1kLrWLZJrlSE9q8au5DJc7ryYQnQBCq', '2025-06-06 05:23:50', '2025-06-06 05:23:50'),
(4, 1, 1, 'estiben@gmail.com', '$2y$12$QBvuTrHrdf2Uxei3N9OltulVlgzSs12V.jte9i8b4bzdFEdvrM9.O', '2025-06-06 05:24:21', '2025-06-06 05:24:21'),
(5, 2, 1, 'juan.perez@gmail.com', '$2y$12$Vou3mO6jKMY7OR4qn.5Y6eGE7RDmrY5jsWYzsgiA.gSLQDKdtXFki', '2025-06-06 05:36:59', '2025-06-06 05:36:59'),
(6, 2, 1, 'maria.lopez@gmail.com', '$2y$12$FOWArpCdm3QYL.K9sLBHf.ud3V5gruwHLshdayhylFksyeD935fvC', '2025-06-06 05:37:21', '2025-06-06 05:37:21'),
(7, 2, 1, 'carlos.ramirez@gmail.com', '$2y$12$3ZXdCF7Q/aKPBHyuWMdgHOqvKKfAcFoFTk0uGHHUkUz0fKJ2A7rw2', '2025-06-06 05:37:35', '2025-06-06 05:37:35'),
(8, 2, 1, 'ana.gonzalez@gmail.com', '$2y$12$GI0vrfbvOCRyToLJJPMEtutDJLRs7ocfcFfO7nGEflpXiE/VUY/Gm', '2025-06-06 05:37:50', '2025-06-06 05:37:50'),
(9, 2, 1, 'luis.martinez@gmail.com', '$2y$12$2GbZJWxETd60L1gIfbE4G.GsL7cENpuA0qwVuC37KWcq0kZHbC/w.', '2025-06-06 05:38:02', '2025-06-06 05:38:02'),
(10, 2, 1, 'sofia.torres@gmail.com', '$2y$12$qE7TeNL7a8u5wAv8B.Fh6e2UFcHhxzHhaRUWtzrcplacpj59vaqTK', '2025-06-06 05:38:13', '2025-06-06 05:38:13'),
(11, 2, 1, 'diego.fernandez@gmail.com', '$2y$12$/HNWI01u27st9zzYNCReq.tR/jPmccDY/ZnVxem.xCfHAh6QkncoC', '2025-06-06 05:38:26', '2025-06-06 05:38:26'),
(12, 2, 1, 'valentina.sanchez@gmail.com', '$2y$12$8fqsNeggaYkJW1xR9X6TXe34xQ3AixjTya80.WGypWmtqbQhLrLGO', '2025-06-06 05:38:37', '2025-06-06 05:38:37'),
(13, 2, 1, 'miguel.rodriguez@gmail.com', '$2y$12$uy59Nrlo009I8DOhk5tNLOGF4Tzf32IrO3Eym796oxAMLISSwKhQi', '2025-06-06 05:38:53', '2025-06-06 05:38:53'),
(14, 2, 1, 'camila.morales@gmail.com', '$2y$12$jw./d4q1dM1YDbJVV5TYROxpOKZSfJ9mOrxSHlccBsLIqPhef9LFm', '2025-06-06 05:39:15', '2025-06-06 05:39:15'),
(15, 2, 1, 'andres.navarro@gmail.com', '$2y$12$jRbZ5vTcG1ZXokTSaefzsO7JkMFXJonKTD3uAebOiXsscRrP2GIza', '2025-06-06 05:39:30', '2025-06-06 05:39:30'),
(16, 2, 1, 'laura.ruiz@gmail.com', '$2y$12$MXRVMIpLaQnL.PZsUFA.FObMSlRgN6XUSdh6rNdKT1RhDaNemauA6', '2025-06-06 05:39:46', '2025-06-06 05:39:46'),
(17, 2, 1, 'sebastian.arias@gmail.com', '$2y$12$c11mqkmHvfZkWAtq2AvuZ.Hd6ZI6h7B1ytTGq6nEzrUmw7VF9gyaS', '2025-06-06 05:40:00', '2025-06-06 05:40:00'),
(18, 2, 1, 'paula.castillo@gmail.com', '$2y$12$SZTvMA8etMTVoHpTUqjno.y.DNwoFKnV0uX3xm5gTFdoOiL/msUfe', '2025-06-06 05:40:13', '2025-06-06 05:40:13'),
(19, 2, 1, 'daniel.mendoza@gmail.com', '$2y$12$7BVjZc2NizSYT7frPhXh6.M5FjMH83o.zcyBDOoW47inATNF1.TYC', '2025-06-06 05:40:25', '2025-06-06 05:40:25');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `acudientes`
--
ALTER TABLE `acudientes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `administrativos`
--
ALTER TABLE `administrativos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `administrativos_usuario_id_foreign` (`usuario_id`);

--
-- Indices de la tabla `asignaturas`
--
ALTER TABLE `asignaturas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `asistencias`
--
ALTER TABLE `asistencias`
  ADD PRIMARY KEY (`id`),
  ADD KEY `asistencias_clase_id_foreign` (`clase_id`),
  ADD KEY `asistencias_estudiante_id_foreign` (`estudiante_id`);

--
-- Indices de la tabla `aulas`
--
ALTER TABLE `aulas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indices de la tabla `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indices de la tabla `clases`
--
ALTER TABLE `clases`
  ADD PRIMARY KEY (`id`),
  ADD KEY `clases_asignatura_id_foreign` (`asignatura_id`),
  ADD KEY `clases_docente_id_foreign` (`docente_id`),
  ADD KEY `clases_aula_id_foreign` (`aula_id`),
  ADD KEY `clases_curso_id_foreign` (`curso_id`);

--
-- Indices de la tabla `cursos`
--
ALTER TABLE `cursos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `docentes`
--
ALTER TABLE `docentes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `docentes_usuario_id_foreign` (`usuario_id`);

--
-- Indices de la tabla `estudiantes`
--
ALTER TABLE `estudiantes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `estudiantes_acudiente_id_foreign` (`acudiente_id`),
  ADD KEY `estudiantes_curso_id_foreign` (`curso_id`);

--
-- Indices de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indices de la tabla `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indices de la tabla `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_nombre_unique` (`nombre`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuarios_rol_id_foreign` (`rol_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `acudientes`
--
ALTER TABLE `acudientes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=331;

--
-- AUTO_INCREMENT de la tabla `administrativos`
--
ALTER TABLE `administrativos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `asignaturas`
--
ALTER TABLE `asignaturas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `asistencias`
--
ALTER TABLE `asistencias`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `aulas`
--
ALTER TABLE `aulas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `clases`
--
ALTER TABLE `clases`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cursos`
--
ALTER TABLE `cursos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `docentes`
--
ALTER TABLE `docentes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `estudiantes`
--
ALTER TABLE `estudiantes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=331;

--
-- AUTO_INCREMENT de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `administrativos`
--
ALTER TABLE `administrativos`
  ADD CONSTRAINT `administrativos_usuario_id_foreign` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`);

--
-- Filtros para la tabla `asistencias`
--
ALTER TABLE `asistencias`
  ADD CONSTRAINT `asistencias_clase_id_foreign` FOREIGN KEY (`clase_id`) REFERENCES `clases` (`id`),
  ADD CONSTRAINT `asistencias_estudiante_id_foreign` FOREIGN KEY (`estudiante_id`) REFERENCES `estudiantes` (`id`);

--
-- Filtros para la tabla `clases`
--
ALTER TABLE `clases`
  ADD CONSTRAINT `clases_asignatura_id_foreign` FOREIGN KEY (`asignatura_id`) REFERENCES `asignaturas` (`id`),
  ADD CONSTRAINT `clases_aula_id_foreign` FOREIGN KEY (`aula_id`) REFERENCES `aulas` (`id`),
  ADD CONSTRAINT `clases_curso_id_foreign` FOREIGN KEY (`curso_id`) REFERENCES `cursos` (`id`),
  ADD CONSTRAINT `clases_docente_id_foreign` FOREIGN KEY (`docente_id`) REFERENCES `docentes` (`id`);

--
-- Filtros para la tabla `docentes`
--
ALTER TABLE `docentes`
  ADD CONSTRAINT `docentes_usuario_id_foreign` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`);

--
-- Filtros para la tabla `estudiantes`
--
ALTER TABLE `estudiantes`
  ADD CONSTRAINT `estudiantes_acudiente_id_foreign` FOREIGN KEY (`acudiente_id`) REFERENCES `acudientes` (`id`),
  ADD CONSTRAINT `estudiantes_curso_id_foreign` FOREIGN KEY (`curso_id`) REFERENCES `cursos` (`id`);

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_rol_id_foreign` FOREIGN KEY (`rol_id`) REFERENCES `roles` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
