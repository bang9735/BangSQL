-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jan 10, 2025 at 11:07 AM
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
-- Database: `VU Healthcare Database`
--

-- --------------------------------------------------------

--
-- Table structure for table `Healthcare_Facility`
--

CREATE TABLE `Healthcare_Facility` (
  `Facility_ID` int(11) NOT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `Location` varchar(100) DEFAULT NULL,
  `Type` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Laboratory_Test`
--

CREATE TABLE `Laboratory_Test` (
  `Test_ID` int(11) NOT NULL,
  `Visit_ID` int(11) DEFAULT NULL,
  `Test_Type` varchar(100) DEFAULT NULL,
  `Test_Result` text DEFAULT NULL,
  `Test_Date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Patient_Data`
--

CREATE TABLE `Patient_Data` (
  `Patient_ID` int(11) NOT NULL,
  `Name` varchar(10) DEFAULT NULL,
  `Date_of_Birth` date DEFAULT NULL,
  `Gender` varchar(10) DEFAULT NULL,
  `Contact_Info` varchar(200) DEFAULT NULL,
  `Medical_History` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Resource`
--

CREATE TABLE `Resource` (
  `Resource_ID` int(11) NOT NULL,
  `Resource_Name` varchar(100) DEFAULT NULL,
  `Resource_Type` varchar(100) DEFAULT NULL,
  `Quantity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Supply_Chain`
--

CREATE TABLE `Supply_Chain` (
  `Supply_ID` int(11) NOT NULL,
  `Resource_ID` int(11) DEFAULT NULL,
  `Supply_Date` date DEFAULT NULL,
  `Quantity_Supplied` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Treatment_Record`
--

CREATE TABLE `Treatment_Record` (
  `Treatment_ID` int(11) NOT NULL,
  `Visit_ID` int(11) DEFAULT NULL,
  `Treatment_Type` varchar(100) DEFAULT NULL,
  `Medication` varchar(100) DEFAULT NULL,
  `Dosage` varchar(50) DEFAULT NULL,
  `Start_Date` date DEFAULT NULL,
  `End_Date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `User_Facility`
--

CREATE TABLE `User_Facility` (
  `User_ID` int(11) NOT NULL,
  `Facility_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `User_Role`
--

CREATE TABLE `User_Role` (
  `User_ID` int(11) NOT NULL,
  `Role_Name` varchar(50) DEFAULT NULL,
  `Permissions` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Visit_Record`
--

CREATE TABLE `Visit_Record` (
  `Visit_ID` int(11) NOT NULL,
  `Patient_ID` int(11) DEFAULT NULL,
  `Visit_Date` date DEFAULT NULL,
  `Symptoms` text DEFAULT NULL,
  `Diagnosis` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Healthcare_Facility`
--
ALTER TABLE `Healthcare_Facility`
  ADD PRIMARY KEY (`Facility_ID`);

--
-- Indexes for table `Laboratory_Test`
--
ALTER TABLE `Laboratory_Test`
  ADD PRIMARY KEY (`Test_ID`),
  ADD KEY `Visit_ID` (`Visit_ID`);

--
-- Indexes for table `Patient_Data`
--
ALTER TABLE `Patient_Data`
  ADD PRIMARY KEY (`Patient_ID`);

--
-- Indexes for table `Resource`
--
ALTER TABLE `Resource`
  ADD PRIMARY KEY (`Resource_ID`);

--
-- Indexes for table `Supply_Chain`
--
ALTER TABLE `Supply_Chain`
  ADD PRIMARY KEY (`Supply_ID`),
  ADD KEY `Resource_ID` (`Resource_ID`);

--
-- Indexes for table `Treatment_Record`
--
ALTER TABLE `Treatment_Record`
  ADD PRIMARY KEY (`Treatment_ID`),
  ADD KEY `Visit_ID` (`Visit_ID`);

--
-- Indexes for table `User_Facility`
--
ALTER TABLE `User_Facility`
  ADD PRIMARY KEY (`User_ID`,`Facility_ID`),
  ADD KEY `Facility_ID` (`Facility_ID`);

--
-- Indexes for table `User_Role`
--
ALTER TABLE `User_Role`
  ADD PRIMARY KEY (`User_ID`);

--
-- Indexes for table `Visit_Record`
--
ALTER TABLE `Visit_Record`
  ADD PRIMARY KEY (`Visit_ID`),
  ADD KEY `Patient_ID` (`Patient_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Healthcare_Facility`
--
ALTER TABLE `Healthcare_Facility`
  MODIFY `Facility_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Laboratory_Test`
--
ALTER TABLE `Laboratory_Test`
  MODIFY `Test_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Patient_Data`
--
ALTER TABLE `Patient_Data`
  MODIFY `Patient_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Resource`
--
ALTER TABLE `Resource`
  MODIFY `Resource_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Supply_Chain`
--
ALTER TABLE `Supply_Chain`
  MODIFY `Supply_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Treatment_Record`
--
ALTER TABLE `Treatment_Record`
  MODIFY `Treatment_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `User_Role`
--
ALTER TABLE `User_Role`
  MODIFY `User_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Visit_Record`
--
ALTER TABLE `Visit_Record`
  MODIFY `Visit_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Laboratory_Test`
--
ALTER TABLE `Laboratory_Test`
  ADD CONSTRAINT `laboratory_test_ibfk_1` FOREIGN KEY (`Visit_ID`) REFERENCES `Visit_Record` (`Visit_ID`);

--
-- Constraints for table `Supply_Chain`
--
ALTER TABLE `Supply_Chain`
  ADD CONSTRAINT `supply_chain_ibfk_1` FOREIGN KEY (`Resource_ID`) REFERENCES `Resource` (`Resource_ID`);

--
-- Constraints for table `Treatment_Record`
--
ALTER TABLE `Treatment_Record`
  ADD CONSTRAINT `treatment_record_ibfk_1` FOREIGN KEY (`Visit_ID`) REFERENCES `Visit_Record` (`Visit_ID`);

--
-- Constraints for table `User_Facility`
--
ALTER TABLE `User_Facility`
  ADD CONSTRAINT `user_facility_ibfk_1` FOREIGN KEY (`User_ID`) REFERENCES `User_Role` (`User_ID`),
  ADD CONSTRAINT `user_facility_ibfk_2` FOREIGN KEY (`Facility_ID`) REFERENCES `Healthcare_Facility` (`Facility_ID`);

--
-- Constraints for table `Visit_Record`
--
ALTER TABLE `Visit_Record`
  ADD CONSTRAINT `visit_record_ibfk_1` FOREIGN KEY (`Patient_ID`) REFERENCES `Patient_Data` (`Patient_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
