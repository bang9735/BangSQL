-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jan 17, 2025 at 12:21 PM
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
-- Database: `Relational Schema`
--

-- --------------------------------------------------------

--
-- Table structure for table `Allergy`
--

CREATE TABLE `Allergy` (
  `Allergy_ID` int(11) NOT NULL,
  `Allergy_type` varchar(50) DEFAULT NULL,
  `Severity` varchar(20) DEFAULT NULL,
  `Patient_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Emmergency_Contact`
--

CREATE TABLE `Emmergency_Contact` (
  `Contact_ID` int(11) NOT NULL,
  `Patient_ID` int(11) DEFAULT NULL,
  `Contact_name` varchar(100) DEFAULT NULL,
  `Contact_relation` varchar(50) DEFAULT NULL,
  `Contact_phone_no` varchar(20) DEFAULT NULL,
  `Contact_email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Patient`
--

CREATE TABLE `Patient` (
  `Patient_ID` int(11) NOT NULL,
  `Firstname` varchar(50) DEFAULT NULL,
  `Lastname` varchar(50) DEFAULT NULL,
  `Birth_Date` date DEFAULT NULL,
  `Gender` char(1) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Phon_no` varchar(20) DEFAULT NULL,
  `Address` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Visit_Record`
--

CREATE TABLE `Visit_Record` (
  `Visit_ID` int(11) NOT NULL,
  `Patient_ID` int(11) DEFAULT NULL,
  `Visit_Date` date DEFAULT NULL,
  `Reason_for_Visit` varchar(200) DEFAULT NULL,
  `Diagnosis` varchar(200) DEFAULT NULL,
  `Treatment` varchar(200) DEFAULT NULL,
  `Doctor_Assigned` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Allergy`
--
ALTER TABLE `Allergy`
  ADD PRIMARY KEY (`Allergy_ID`),
  ADD KEY `Patient_ID` (`Patient_ID`);

--
-- Indexes for table `Emmergency_Contact`
--
ALTER TABLE `Emmergency_Contact`
  ADD PRIMARY KEY (`Contact_ID`),
  ADD KEY `Patient_ID` (`Patient_ID`);

--
-- Indexes for table `Patient`
--
ALTER TABLE `Patient`
  ADD PRIMARY KEY (`Patient_ID`);

--
-- Indexes for table `Visit_Record`
--
ALTER TABLE `Visit_Record`
  ADD PRIMARY KEY (`Visit_ID`),
  ADD KEY `Patient_ID` (`Patient_ID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Allergy`
--
ALTER TABLE `Allergy`
  ADD CONSTRAINT `allergy_ibfk_1` FOREIGN KEY (`Patient_ID`) REFERENCES `Patient` (`Patient_ID`);

--
-- Constraints for table `Emmergency_Contact`
--
ALTER TABLE `Emmergency_Contact`
  ADD CONSTRAINT `emmergency_contact_ibfk_1` FOREIGN KEY (`Patient_ID`) REFERENCES `Patient` (`Patient_ID`);

--
-- Constraints for table `Visit_Record`
--
ALTER TABLE `Visit_Record`
  ADD CONSTRAINT `visit_record_ibfk_1` FOREIGN KEY (`Patient_ID`) REFERENCES `Patient` (`Patient_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
