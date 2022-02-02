-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 31, 2019 at 07:51 PM
-- Server version: 10.3.16-MariaDB
-- PHP Version: 7.3.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `schooldb`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `aId` int(11) NOT NULL,
  `aName` varchar(70) NOT NULL,
  `joinDate` date NOT NULL,
  `aAddress` text NOT NULL,
  `aPassword` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`aId`, `aName`, `joinDate`, `aAddress`, `aPassword`) VALUES
(2001, 'Mr John', '2019-07-08', 'CA, USA.', 'passMe01'),
(2099, 'Micky Arther', '2019-07-11', 'NY, USA.', 'passMe99');

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

CREATE TABLE `attendance` (
  `sId` int(11) NOT NULL,
  `aDate` date NOT NULL,
  `aStatus` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `attendance`
--

INSERT INTO `attendance` (`sId`, `aDate`, `aStatus`) VALUES
(210110, '2019-07-01', 'Yes'),
(2101101, '2019-07-01', 'No');

-- --------------------------------------------------------

--
-- Table structure for table `smarks`
--

CREATE TABLE `smarks` (
  `sID` int(11) NOT NULL,
  `subject` varchar(30) NOT NULL,
  `marks` int(11) NOT NULL,
  `grade` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `smarks`
--

INSERT INTO `smarks` (`sID`, `subject`, `marks`, `grade`) VALUES
(200110, 'Bangla', 87, 'A+'),
(200111, 'Bangla', 76, 'A');

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `sId` int(11) NOT NULL,
  `sName` varchar(70) NOT NULL,
  `sClass` int(11) NOT NULL,
  `supervisorId` int(11) NOT NULL,
  `admissionDate` date NOT NULL,
  `sAddress` text NOT NULL,
  `sPassword` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`sId`, `sName`, `sClass`, `supervisorId`, `admissionDate`, `sAddress`, `sPassword`) VALUES
(190513, 'Sheikh Meher', 9, 2011, '2019-05-22', 'Uttara, Dhaka', 'passMe'),
(221001, 'Rasel', 10, 20100, '2019-06-11', 'bashundhara R/A , Dhaka', 'passMe'),
(2207001, 'Sheikh Meher', 9, 2011, '2019-05-22', 'Uttara, Dhaka', 'passMe');

-- --------------------------------------------------------

--
-- Table structure for table `teacher`
--

CREATE TABLE `teacher` (
  `tId` int(11) NOT NULL,
  `tName` varchar(70) NOT NULL,
  `position` varchar(20) NOT NULL,
  `supervisorOf` int(11) NOT NULL,
  `assignDate` date NOT NULL,
  `tSalary` int(11) NOT NULL,
  `tAddress` text NOT NULL,
  `tPassword` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `teacher`
--

INSERT INTO `teacher` (`tId`, `tName`, `position`, `supervisorOf`, `assignDate`, `tSalary`, `tAddress`, `tPassword`) VALUES
(1, 'Joban Mia', 'Lecturer ', 201002, '2019-05-13', 22000, 'kashor, Bhaluka.', 'passTeacher123'),
(2, 'Jasim Islam', 'Assistant Head', 201003, '2019-05-22', 35000, 'hobirbari, Bhaluka.', 'passTeacher2');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`aId`);

--
-- Indexes for table `attendance`
--
ALTER TABLE `attendance`
  ADD PRIMARY KEY (`sId`);

--
-- Indexes for table `smarks`
--
ALTER TABLE `smarks`
  ADD PRIMARY KEY (`sID`,`subject`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`sId`);

--
-- Indexes for table `teacher`
--
ALTER TABLE `teacher`
  ADD PRIMARY KEY (`tId`),
  ADD UNIQUE KEY `supervisorOf` (`supervisorOf`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
