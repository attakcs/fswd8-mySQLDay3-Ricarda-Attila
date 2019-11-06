-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 06, 2019 at 10:45 AM
-- Server version: 10.4.8-MariaDB
-- PHP Version: 7.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `03 airlines`
--
CREATE DATABASE IF NOT EXISTS `03 airlines` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `03 airlines`;

-- --------------------------------------------------------

--
-- Table structure for table `airports`
--

CREATE TABLE `airports` (
  `id` varchar(3) NOT NULL,
  `city` varchar(20) DEFAULT NULL,
  `country` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `flights`
--

CREATE TABLE `flights` (
  `id` int(11) NOT NULL,
  `originAirport` varchar(30) DEFAULT NULL,
  `destinationAirport` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `planes`
--

CREATE TABLE `planes` (
  `registrationNr` int(11) NOT NULL,
  `fk_flightsId` int(11) NOT NULL,
  `manufacture` varchar(30) NOT NULL,
  `model` varchar(20) DEFAULT NULL,
  `capacity` int(11) DEFAULT NULL,
  `flightRange` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `plane_flights`
--

CREATE TABLE `plane_flights` (
  `id` int(11) NOT NULL,
  `fk_planesId` int(11) DEFAULT NULL,
  `fk_flightsId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `airports`
--
ALTER TABLE `airports`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `flights`
--
ALTER TABLE `flights`
  ADD PRIMARY KEY (`id`),
  ADD KEY `originAirport` (`originAirport`),
  ADD KEY `destinationAirport` (`destinationAirport`);

--
-- Indexes for table `planes`
--
ALTER TABLE `planes`
  ADD PRIMARY KEY (`registrationNr`);

--
-- Indexes for table `plane_flights`
--
ALTER TABLE `plane_flights`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_flightsId` (`fk_flightsId`),
  ADD KEY `fk_planesId` (`fk_planesId`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `flights`
--
ALTER TABLE `flights`
  ADD CONSTRAINT `flights_ibfk_1` FOREIGN KEY (`originAirport`) REFERENCES `airports` (`id`),
  ADD CONSTRAINT `flights_ibfk_2` FOREIGN KEY (`destinationAirport`) REFERENCES `airports` (`id`);

--
-- Constraints for table `plane_flights`
--
ALTER TABLE `plane_flights`
  ADD CONSTRAINT `plane_flights_ibfk_1` FOREIGN KEY (`fk_flightsId`) REFERENCES `flights` (`id`),
  ADD CONSTRAINT `plane_flights_ibfk_2` FOREIGN KEY (`fk_planesId`) REFERENCES `planes` (`registrationNr`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
