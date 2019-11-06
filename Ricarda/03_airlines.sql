-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 06. Nov 2019 um 14:07
-- Server-Version: 10.4.6-MariaDB
-- PHP-Version: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `03 airlines`
--
CREATE DATABASE IF NOT EXISTS `03 airlines` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `03 airlines`;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `airports`
--

CREATE TABLE `airports` (
  `id` varchar(3) NOT NULL,
  `city` varchar(20) DEFAULT NULL,
  `country` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `airports`
--

INSERT INTO `airports` (`id`, `city`, `country`) VALUES
('AAH', 'Aachen', 'Germany'),
('AAI', 'Arraias', 'Brazil'),
('BCN', 'Barcelona', 'Spain'),
('DAB', 'Daytona Beach', 'USA'),
('DAP', 'Darchula', 'Nepal'),
('EAB', 'Abbse', 'Yemen'),
('EAL', 'Elenak', 'Mejato'),
('EAS', 'San Sebastian', 'Spain'),
('GAB', 'Gabbs', 'USA'),
('GAG', 'Gage', 'USA'),
('MAH', 'Menorca', 'Spain'),
('MAM', 'Matamoros', 'Spain'),
('MAN', 'Manchester', 'UK'),
('YAC', 'CatLake', 'Canada');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `flights`
--

CREATE TABLE `flights` (
  `id` int(11) NOT NULL,
  `originAirport` varchar(30) DEFAULT NULL,
  `destinationAirport` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `flights`
--

INSERT INTO `flights` (`id`, `originAirport`, `destinationAirport`) VALUES
(1, 'AAH', 'AAI'),
(2, 'AAH', 'BCN'),
(3, 'AAH', 'BCN'),
(4, 'BCN', 'AAH'),
(5, 'BCN', 'DAP'),
(6, 'BCN', 'GAB'),
(7, 'DAP', 'EAB'),
(8, 'DAP', 'GAB'),
(9, 'DAP', 'BCN'),
(10, 'EAB', 'MAM'),
(11, 'EAB', 'GAB'),
(12, 'EAB', 'EAS'),
(13, 'GAG', 'GAB'),
(14, 'MAM', 'MAN');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `planes`
--

CREATE TABLE `planes` (
  `registrationNr` int(11) NOT NULL,
  `manufacture` varchar(30) NOT NULL,
  `model` varchar(20) DEFAULT NULL,
  `capacity` int(11) DEFAULT NULL,
  `flightRange` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `planes`
--

INSERT INTO `planes` (`registrationNr`, `manufacture`, `model`, `capacity`, `flightRange`) VALUES
(1, 'Boeing', '737', 200, '05:30:00'),
(2, 'Boeing', '333', 400, '08:00:00'),
(3, 'Boeing', '333', 500, '07:00:00'),
(4, 'Boeing', '333', 300, '07:00:00'),
(5, 'Boeing', '737', 300, '08:00:00'),
(6, 'Boeing', '787', 300, '09:00:00'),
(7, 'Boeing', '787', 400, '08:00:00'),
(8, 'Airbus', 'A380', 300, '08:00:00'),
(9, 'Airbus', 'A380', 500, '07:00:00'),
(10, 'Airbus', 'A380', 300, '07:00:00'),
(11, 'Airbus', 'A320', 400, '09:00:00'),
(12, 'Airbus', 'A320', 400, '08:00:00'),
(13, 'Airbus', 'A220', 500, '09:00:00'),
(14, 'Airbus', 'A220', 500, '08:00:00');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `plane_flights`
--

CREATE TABLE `plane_flights` (
  `id` int(11) NOT NULL,
  `fk_planesId` int(11) DEFAULT NULL,
  `fk_flightsId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `plane_flights`
--

INSERT INTO `plane_flights` (`id`, `fk_planesId`, `fk_flightsId`) VALUES
(1, 1, 2),
(2, 2, 2),
(3, 2, 2),
(4, 2, 3),
(5, 2, 2),
(6, 3, 1),
(7, 3, 2),
(8, 5, 5),
(9, 7, 10),
(10, 9, 11),
(11, 12, 2);

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `airports`
--
ALTER TABLE `airports`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `flights`
--
ALTER TABLE `flights`
  ADD PRIMARY KEY (`id`),
  ADD KEY `originAirport` (`originAirport`),
  ADD KEY `destinationAirport` (`destinationAirport`);

--
-- Indizes für die Tabelle `planes`
--
ALTER TABLE `planes`
  ADD PRIMARY KEY (`registrationNr`);

--
-- Indizes für die Tabelle `plane_flights`
--
ALTER TABLE `plane_flights`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_flightsId` (`fk_flightsId`),
  ADD KEY `fk_planesId` (`fk_planesId`);

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `flights`
--
ALTER TABLE `flights`
  ADD CONSTRAINT `flights_ibfk_1` FOREIGN KEY (`originAirport`) REFERENCES `airports` (`id`),
  ADD CONSTRAINT `flights_ibfk_2` FOREIGN KEY (`destinationAirport`) REFERENCES `airports` (`id`);

--
-- Constraints der Tabelle `plane_flights`
--
ALTER TABLE `plane_flights`
  ADD CONSTRAINT `plane_flights_ibfk_1` FOREIGN KEY (`fk_flightsId`) REFERENCES `flights` (`id`),
  ADD CONSTRAINT `plane_flights_ibfk_2` FOREIGN KEY (`fk_planesId`) REFERENCES `planes` (`registrationNr`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
