-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jan 08, 2025 at 03:28 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `Estate DBMS`
--

-- --------------------------------------------------------

--
-- Table structure for table `Properties`
--

CREATE TABLE `Properties` (
  `PropertyID` int(11) NOT NULL,
  `Address` varchar(250) NOT NULL,
  `City` varchar(100) NOT NULL,
  `Type` varchar(50) DEFAULT NULL CHECK (`Type` in ('Residential','Commercial','Industrial')),
  `Size` int(11) NOT NULL,
  `Price` decimal(10,2) NOT NULL,
  `Statas` varchar(20) DEFAULT NULL CHECK (`Statas` in ('Available','Sold','Rented'))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Properties`
--

INSERT INTO `Properties` (`PropertyID`, `Address`, `City`, `Type`, `Size`, `Price`, `Statas`) VALUES
(1, '123 Main St, Kampala', 'Kampala', 'Residential', 1200, 250000.00, 'Available'),
(4, '101 Lakeview Blvd, Kampala', 'Kampala', 'Residential', 2000, 350000.00, 'Available'),
(9, '606 Sunset Blvd, Kampala', 'Kampala', 'Residential', 800, 350000.00, 'Available');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Properties`
--
ALTER TABLE `Properties`
  ADD PRIMARY KEY (`PropertyID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
