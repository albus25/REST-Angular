-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 05, 2020 at 11:31 AM
-- Server version: 10.4.8-MariaDB
-- PHP Version: 7.3.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `javadb`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbladdress`
--

CREATE TABLE `tbladdress` (
  `aid` int(11) NOT NULL,
  `street` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL,
  `zip` varchar(20) NOT NULL,
  `cid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbladdress`
--

INSERT INTO `tbladdress` (`aid`, `street`, `city`, `state`, `zip`, `cid`) VALUES
(4, 'Gryffindore', 'London', 'I don\'t know', '789456', 12),
(6, 'Manhatten', 'NewYork', 'Same', '456123', 18);

-- --------------------------------------------------------

--
-- Table structure for table `tblcustomer`
--

CREATE TABLE `tblcustomer` (
  `cid` int(11) NOT NULL,
  `fname` varchar(50) NOT NULL,
  `lname` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tblcustomer`
--

INSERT INTO `tblcustomer` (`cid`, `fname`, `lname`) VALUES
(1, 'Baba', 'Yagaa'),
(2, 'John', 'Wick'),
(12, 'Albus', 'Dumbledore'),
(14, 'Saurabh', 'Sali'),
(16, 'Ujala', 'Khand'),
(17, 'Harry', 'Potter'),
(18, 'Natasha', 'Romanoff'),
(23, 'Tony', 'Stark');

-- --------------------------------------------------------

--
-- Table structure for table `tblcustsub`
--

CREATE TABLE `tblcustsub` (
  `cid` int(11) NOT NULL,
  `sid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tblcustsub`
--

INSERT INTO `tblcustsub` (`cid`, `sid`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tblgroup`
--

CREATE TABLE `tblgroup` (
  `groupname` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tblgroup`
--

INSERT INTO `tblgroup` (`groupname`, `username`) VALUES
('Admin', 'albus25'),
('User', 'saurabh25');

-- --------------------------------------------------------

--
-- Table structure for table `tblsubscription`
--

CREATE TABLE `tblsubscription` (
  `sid` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tblsubscription`
--

INSERT INTO `tblsubscription` (`sid`, `title`, `type`) VALUES
(1, 'HighTable', 'Assasian');

-- --------------------------------------------------------

--
-- Table structure for table `tbluser`
--

CREATE TABLE `tbluser` (
  `username` varchar(50) NOT NULL,
  `password` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbluser`
--

INSERT INTO `tbluser` (`username`, `password`) VALUES
('albus25', '786'),
('saurabh25', '786');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbladdress`
--
ALTER TABLE `tbladdress`
  ADD PRIMARY KEY (`aid`),
  ADD KEY `FK_CUSTOMER1` (`cid`);

--
-- Indexes for table `tblcustomer`
--
ALTER TABLE `tblcustomer`
  ADD PRIMARY KEY (`cid`);

--
-- Indexes for table `tblcustsub`
--
ALTER TABLE `tblcustsub`
  ADD KEY `FK_CUSTOMER` (`cid`),
  ADD KEY `FK_SUBSCRIPTION` (`sid`);

--
-- Indexes for table `tblsubscription`
--
ALTER TABLE `tblsubscription`
  ADD PRIMARY KEY (`sid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbladdress`
--
ALTER TABLE `tbladdress`
  MODIFY `aid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tblcustomer`
--
ALTER TABLE `tblcustomer`
  MODIFY `cid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `tblsubscription`
--
ALTER TABLE `tblsubscription`
  MODIFY `sid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbladdress`
--
ALTER TABLE `tbladdress`
  ADD CONSTRAINT `FK_CUSTOMER1` FOREIGN KEY (`cid`) REFERENCES `tblcustomer` (`cid`);

--
-- Constraints for table `tblcustsub`
--
ALTER TABLE `tblcustsub`
  ADD CONSTRAINT `FK_CUSTOMER` FOREIGN KEY (`cid`) REFERENCES `tblcustomer` (`cid`),
  ADD CONSTRAINT `FK_SUBSCRIPTION` FOREIGN KEY (`sid`) REFERENCES `tblsubscription` (`sid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
