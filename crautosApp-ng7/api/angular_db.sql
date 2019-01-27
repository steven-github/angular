-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 13-03-2019 a las 08:00:27
-- Versión del servidor: 10.1.37-MariaDB
-- Versión de PHP: 5.6.40

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `angular_db`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `brands`
--

CREATE TABLE `brands` (
  `id` int(11) UNSIGNED NOT NULL,
  `brand` varchar(20) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `brands`
--

INSERT INTO `brands` (`id`, `brand`) VALUES
(1, 'Acura'),
(2, 'Alfa Romeo'),
(3, 'AMC'),
(4, 'Aro'),
(5, 'Asia'),
(6, 'Aston Martin'),
(7, 'Audi'),
(8, 'Austin'),
(9, 'Bentley'),
(10, 'Bluebird'),
(11, 'BMW'),
(12, 'Buick'),
(13, 'BYD'),
(14, 'Cadillac'),
(15, 'Chana'),
(16, 'Changan'),
(17, 'Chery'),
(18, 'Chevrolet'),
(19, 'Chrysler'),
(20, 'Citroen'),
(21, 'Dacia'),
(22, 'Daewoo'),
(23, 'Daihatsu'),
(24, 'Datsun'),
(25, 'Dodge/RAM'),
(26, 'Donfeng (ZNA)'),
(27, 'Eagle'),
(28, 'Faw'),
(29, 'Ferrari'),
(30, 'Fiat'),
(31, 'Ford'),
(32, 'Foton'),
(33, 'Freightliner'),
(34, 'Geely'),
(35, 'Genesis'),
(36, 'Geo'),
(37, 'GMC'),
(38, 'Gonow'),
(39, 'Great Wall'),
(40, 'Hafei'),
(41, 'Heibao'),
(42, 'Higer'),
(43, 'Hino'),
(44, 'Honda'),
(45, 'Hummer'),
(46, 'Hyundai'),
(47, 'Infiniti'),
(48, 'International'),
(49, 'Isuzu'),
(50, 'Iveco'),
(51, 'JAC'),
(52, 'Jaguar'),
(53, 'Jeep'),
(54, 'Jinbei'),
(55, 'JMC'),
(56, 'Kenworth'),
(57, 'Kia'),
(58, 'Lada'),
(59, 'Lamborghini'),
(60, 'Lancia'),
(61, 'Land Rover'),
(62, 'Lexus'),
(63, 'Lifan'),
(64, 'Lincoln'),
(65, 'Lotus'),
(66, 'Mack'),
(67, 'Magiruz'),
(68, 'Mahindra'),
(69, 'Maserati'),
(70, 'Mazda'),
(71, 'Mercedes Benz'),
(72, 'Mercury'),
(73, 'MG'),
(74, 'Mini'),
(75, 'Mitsubishi'),
(76, 'Nissan'),
(77, 'Oldsmobile'),
(78, 'Opel'),
(79, 'Peterbilt'),
(80, 'Peugeot'),
(81, 'Plymouth'),
(82, 'Polarsun'),
(83, 'Pontiac'),
(84, 'Porsche'),
(85, 'Proton'),
(86, 'Rambler'),
(87, 'Renault'),
(88, 'Reva'),
(89, 'Rolls Royce'),
(90, 'Rover'),
(91, 'Saab'),
(92, 'Samsung'),
(93, 'Saturn'),
(94, 'Scania'),
(95, 'Scion'),
(96, 'Seat'),
(97, 'Skoda'),
(98, 'Smart'),
(99, 'Ssang Yong'),
(100, 'Subaru'),
(101, 'Suzuki'),
(102, 'Tianma'),
(103, 'Tiger Truck'),
(104, 'Toyota'),
(105, 'Volkswagen'),
(106, 'Volvo'),
(107, 'Western Star'),
(108, 'Yugo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cars`
--

CREATE TABLE `cars` (
  `id` int(11) UNSIGNED NOT NULL,
  `brand` int(11) NOT NULL,
  `model` varchar(20) NOT NULL DEFAULT '',
  `style` int(11) NOT NULL,
  `fuel` int(11) NOT NULL,
  `transmission` int(11) NOT NULL,
  `internal_color` int(11) NOT NULL,
  `external_color` int(11) NOT NULL,
  `year` int(11) NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cars`
--

INSERT INTO `cars` (`id`, `brand`, `model`, `style`, `fuel`, `transmission`, `internal_color`, `external_color`, `year`, `price`) VALUES
(1, 104, 'Corolla', 1, 1, 1, 1, 2, 59, 12000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `colors`
--

CREATE TABLE `colors` (
  `id` int(11) UNSIGNED NOT NULL,
  `color` varchar(20) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `colors`
--

INSERT INTO `colors` (`id`, `color`) VALUES
(1, 'negro'),
(2, 'blanco'),
(3, 'rojo'),
(4, 'azul'),
(5, 'verde'),
(6, 'amarillo'),
(7, 'gris');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fuel`
--

CREATE TABLE `fuel` (
  `id` int(11) UNSIGNED NOT NULL,
  `fuel` varchar(20) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `fuel`
--

INSERT INTO `fuel` (`id`, `fuel`) VALUES
(1, 'Gasolina'),
(2, 'Diesel'),
(3, 'Hibrido'),
(4, 'Electrico');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `styles`
--

CREATE TABLE `styles` (
  `id` int(11) UNSIGNED NOT NULL,
  `style` varchar(20) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `styles`
--

INSERT INTO `styles` (`id`, `style`) VALUES
(1, 'Sedan'),
(2, 'Hatchback'),
(3, 'Pickup 4x2'),
(4, 'Pickup 4x4'),
(5, 'Todo terreno 4x2'),
(6, 'Todo terreno 4x4');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `transmission`
--

CREATE TABLE `transmission` (
  `id` int(11) UNSIGNED NOT NULL,
  `transmission` varchar(20) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `transmission`
--

INSERT INTO `transmission` (`id`, `transmission`) VALUES
(1, 'Manual'),
(2, 'Automatica');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(11) UNSIGNED NOT NULL,
  `first_name` varchar(20) NOT NULL DEFAULT '',
  `last_name` varchar(20) NOT NULL DEFAULT '',
  `email` varchar(20) NOT NULL DEFAULT '',
  `password` varchar(512) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `password`) VALUES
(1, 'Edgar Steven', 'Marin', 'stvn20@gmail.com', 'ba3253876aed6bc22d4a6ff53d8406c6ad864195ed144ab5c87621b6c233b548baeae6956df346ec8c17f5ea10f35ee3cbc514797ed7ddd3145464e2a0bab413'),
(2, 'Edgar Steven', 'Marin', 'freelancers2010@gmai', '3627909a29c31381a071ec27f7c9ca97726182aed29a7ddd2e54353322cfb30abb9e3a6df2ac2c20fe23436311d678564d0c8d305930575f60e2d3d048184d79');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `years`
--

CREATE TABLE `years` (
  `id` int(11) UNSIGNED NOT NULL,
  `year` varchar(20) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `years`
--

INSERT INTO `years` (`id`, `year`) VALUES
(1, '1960'),
(2, '1961'),
(3, '1962'),
(4, '1963'),
(5, '1964'),
(6, '1965'),
(7, '1966'),
(8, '1967'),
(9, '1968'),
(10, '1969'),
(11, '1970'),
(12, '1971'),
(13, '1972'),
(14, '1973'),
(15, '1974'),
(16, '1975'),
(17, '1976'),
(18, '1977'),
(19, '1978'),
(20, '1979'),
(21, '1980'),
(22, '1981'),
(23, '1982'),
(24, '1983'),
(25, '1984'),
(26, '1985'),
(27, '1986'),
(28, '1987'),
(29, '1988'),
(30, '1989'),
(31, '1990'),
(32, '1991'),
(33, '1992'),
(34, '1993'),
(35, '1994'),
(36, '1995'),
(37, '1996'),
(38, '1997'),
(39, '1998'),
(40, '1999'),
(41, '2000'),
(42, '2001'),
(43, '2002'),
(44, '2003'),
(45, '2004'),
(46, '2005'),
(47, '2006'),
(48, '2007'),
(49, '2008'),
(50, '2009'),
(51, '2010'),
(52, '2011'),
(53, '2012'),
(54, '2013'),
(55, '2014'),
(56, '2015'),
(57, '2016'),
(58, '2017'),
(59, '2018'),
(60, '2019');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `cars`
--
ALTER TABLE `cars`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `colors`
--
ALTER TABLE `colors`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `fuel`
--
ALTER TABLE `fuel`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `styles`
--
ALTER TABLE `styles`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `transmission`
--
ALTER TABLE `transmission`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `years`
--
ALTER TABLE `years`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `brands`
--
ALTER TABLE `brands`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=109;

--
-- AUTO_INCREMENT de la tabla `cars`
--
ALTER TABLE `cars`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `colors`
--
ALTER TABLE `colors`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `fuel`
--
ALTER TABLE `fuel`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `styles`
--
ALTER TABLE `styles`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `transmission`
--
ALTER TABLE `transmission`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `years`
--
ALTER TABLE `years`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
