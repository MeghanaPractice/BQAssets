-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 12, 2023 at 11:35 AM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 8.0.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bqassets`
--

-- --------------------------------------------------------

--
-- Table structure for table `deviceasset`
--

CREATE TABLE `deviceasset` (
  `Brand` varchar(45) NOT NULL,
  `DeviceAssetID` varchar(45) NOT NULL,
  `CodeRef2` varchar(45) DEFAULT NULL,
  `ModelName` varchar(45) DEFAULT NULL,
  `Category` varchar(45) DEFAULT NULL,
  `PurchaseDate` date DEFAULT NULL,
  `Emp_ID` varchar(50) DEFAULT NULL,
  `Team_IDf` varchar(50) DEFAULT NULL,
  `ContactNo1` bigint(10) DEFAULT NULL,
  `ContactNo2` bigint(10) DEFAULT NULL,
  `IMEICode` varchar(45) DEFAULT NULL,
  `SerialNo` varchar(45) DEFAULT NULL,
  `Accessories` varchar(45) DEFAULT NULL,
  `AdditionalInfo` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `deviceasset`
--

INSERT INTO `deviceasset` (`Brand`, `DeviceAssetID`, `CodeRef2`, `ModelName`, `Category`, `PurchaseDate`, `Emp_ID`, `Team_IDf`, `ContactNo1`, `ContactNo2`, `IMEICode`, `SerialNo`, `Accessories`, `AdditionalInfo`) VALUES
('Apple', 'B-i2', 'i2', 'iPhone 7', 'iOS', NULL, 'Beqisoft Office', 'Beqisoft Office', NULL, NULL, '3.55E+14', 'DNPVCM2RJ5KN', 'Cable', 'Device + Cable'),
('Apple', 'B-i3', 'i6', 'iphone 8 plus', 'iOS', NULL, 'Deepika', 'ESPN Analytics', 7259432876, NULL, '3.57E+14', 'F2QVDM59JCLY', NULL, 'Device'),
('Apple', 'B-i4', 'i7', 'iPad pro / 11.4', 'iPAD', NULL, NULL, NULL, NULL, NULL, NULL, 'DMPWTOBIJ28L', NULL, 'Device'),
('Samsung', 'BA1', 'A3', 'vivo 1725', 'Handset', NULL, 'Monica Seles', 'ESPN Functionality', 9150280168, NULL, '868530039072134/868530039072126', 'NULL', 'Adaptor', 'Device + Adaptor'),
('Samsung', 'BA3', 'A7', 'Samsung Galaxy NOTE 8', 'Handset', NULL, 'manikanta', 'ESPN Functionality', 8125235231, 8143813326, '352016091987628/\r352017091987626', 'RZ8K31F5LSN', NULL, 'Device'),
('Samsung', 'BA4', 'A9', 'Google pixel 2XL -OS -9,', 'Handset', NULL, 'Chandramouli P', 'Fantasy', 9740442115, 9110534846, '3.58E+14', '804KPRW1753646', 'C USB Cable', 'Device + Cable'),
('Test2', 'Test2', 'i2', 'iPhone 7', 'iOS', '2021-09-02', 'Test0', 'Test0', NULL, NULL, '3.55E+14', 'DNPVCM2RJ5KN', 'Cable', 'Device + Cable');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `EmployeeID` varchar(50) NOT NULL,
  `EmployeeName` varchar(50) DEFAULT NULL,
  `TeamIDNo` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`EmployeeID`, `EmployeeName`, `TeamIDNo`) VALUES
('Ashwini R', 'Ashwini R', 'EPE'),
('Beqisoft Office', 'Beqisoft Office', 'Beqisoft Office'),
('Chandramouli P', 'Chandramouli P', 'Fantasy'),
('Deepika', 'Deepika', 'ESPN Analytics'),
('Deepika M', 'Deepika M', 'EPE'),
('Karthik D', 'Karthik D', 'EPE'),
('Kishore Kumar', 'Kishore Kumar', 'EPE'),
('Madesh P', 'Madesh P', 'EPE'),
('Madhura', 'Madhura', 'EPE'),
('manikanta', 'manikanta', 'ESPN Functionality'),
('Manoj', 'Manoj', 'EPE'),
('Mohit Kumar', 'Mohit Kumar', 'EPE'),
('Monica Seles', 'Monica Seles', 'ESPN Functionality'),
('Poosala Chandramouli', 'Poosala Chandramouli', 'EPE'),
('Prathima C', 'Prathima C', 'EPE'),
('Rinu Ponnachan', 'Rinu Ponnachan', 'EPE'),
('Saravanan', 'Saravanan', 'EPE'),
('Sujatha', 'Sujatha', 'EPE'),
('Test0', 'Test0', 'Test0');

-- --------------------------------------------------------

--
-- Table structure for table `laptopasset`
--

CREATE TABLE `laptopasset` (
  `Brand` varchar(45) NOT NULL,
  `LaptopAssetID` varchar(45) NOT NULL,
  `PurchaseDate` date DEFAULT NULL,
  `ModelName` varchar(45) DEFAULT NULL,
  `ModelNo` varchar(45) DEFAULT NULL,
  `SerialNo` varchar(45) DEFAULT NULL,
  `EmpID` varchar(50) DEFAULT NULL,
  `Team_ID` varchar(50) DEFAULT NULL,
  `ScreenSize` varchar(20) DEFAULT NULL,
  `CharlesID` varchar(45) DEFAULT NULL,
  `CharlesKey` varchar(45) DEFAULT NULL,
  `MSOfficeKey` varchar(45) DEFAULT NULL,
  `MSOfficeUsername` varchar(45) DEFAULT NULL,
  `MSOfficePassword` varchar(45) DEFAULT NULL,
  `WLANMac` varchar(12) DEFAULT NULL,
  `EthernetMAC` varchar(12) DEFAULT NULL,
  `Accessories` varchar(100) DEFAULT NULL,
  `Warranty` int(11) DEFAULT NULL,
  `AdditionalItems` varchar(100) DEFAULT NULL,
  `OtherDetails` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `laptopasset`
--

INSERT INTO `laptopasset` (`Brand`, `LaptopAssetID`, `PurchaseDate`, `ModelName`, `ModelNo`, `SerialNo`, `EmpID`, `Team_ID`, `ScreenSize`, `CharlesID`, `CharlesKey`, `MSOfficeKey`, `MSOfficeUsername`, `MSOfficePassword`, `WLANMac`, `EthernetMAC`, `Accessories`, `Warranty`, `AdditionalItems`, `OtherDetails`) VALUES
('Lenovo', 'BEQI 51780002', NULL, 'ThinkPad T490', '20RYS07R00', 'PF2B1ZL6', 'Deepika M', 'EPE', '35.56', 'Beqisoft Technologies Private Limited', 'a024f38a68e805399f', '', 'Deepika@beqisoft.com', ' Xos12751', '', '', '', 3, '', 'Laptop Computer Sysytem-1N, Battery-1N, Adapter-1N, Manual-1N, Power Cord-1N'),
('MacBook', 'BEQI 51780003', '2020-12-09', 'MacBook Air 13-inch', 'A2179', 'FVFDG227M6KG', 'Sujatha', 'EPE', '13', 'BEQISOFT TECHNOLOGIES PRIVATE LIMITED', ' 4e95f35d21b7aa1e87', NULL, 'sujatha@beqisoft.onmicrosoft.com', 'Qug10732', '14:7D:DA:94:', '14:7D:DA:84:', 'HDMI Cable, Adaptor', 3, 'ALOGIC USB Cable', NULL),
('Lenovo', 'BEQI 51780005', NULL, 'ThinkPad T14 Gen 1', '20S0S1MC00', 'PF24469N', 'Mohit Kumar', 'EPE', '35.56', 'Beqisoft Technologies Private Limited', 'a024f38a68e805399f', '', 'mohit@beqisoft.onmicrosoft.com', 'Jaf77886', '', '', '', 3, '', 'Laptop Computer Sysytem-1N, Battery-1N, Adapter-1N, Manual-1N, Power Cord-1N'),
('Lenovo', 'BEQI 51780006', NULL, 'ThinkPad T14 Gen 1', '20S0S1MC00', 'PF2419QT', 'Saravanan', 'EPE', '35.56', 'Beqisoft Technologies Private Limited', 'a024f38a68e805399f', '', 'nishikar@beqisoft.onmicrosoft.com', 'Rut85340', '', '', '', 3, '', 'Laptop Computer Sysytem-1N, Battery-1N, Adapter-1N, Manual-1N, Power Cord-1N'),
('Lenovo', 'BEQI 51780007', NULL, 'ThinkPad T14 Gen 1', '20S0S1MC00', 'PF24563V', 'Kishore Kumar', 'EPE', '35.56', 'Beqisoft Technologies Private Limited', 'a024f38a68e805399f', '', 'seema@beqisoft.onmicrosoft.com', 'Dox21868', '', '', '', 3, '', 'Laptop Computer Sysytem-1N, Battery-1N, Adapter-1N, Manual-1N, Power Cord-1N'),
('Lenovo', 'BEQI 51780008', NULL, 'ThinkPad T14 Gen 1', '20S0S1MC00', 'PF2419SY', 'Manoj', 'EPE', '35.56', 'Beqisoft Technologies Private Limited', 'a024f38a68e805399f', '', 'n.manoj@beqisoft.onmicrosoft.com', 'Hug29440', '', '', '', 3, '', 'Laptop Computer Sysytem-1N, Battery-1N, Adapter-1N, Manual-1N, Power Cord-1N'),
('Lenovo', 'BEQI 51780009', NULL, 'ThinkPad T14 Gen 1', '20S0S1MC00', 'PF23SSN7', 'Poosala Chandramouli', 'EPE', '35.56', 'Username: BEQISOFT TECHNOLOGIES PRIVATE LIMIT', '93a344610c39429831', '', 'chandramouli@beqisoft.onmicrosoft.com', 'Mav38465', '', '', '', 3, '', 'Laptop Computer Sysytem-1N, Battery-1N, Adapter-1N, Manual-1N, Power Cord-1N'),
('Lenovo', 'BEQI 51780010', NULL, 'ThinkPad T14 Gen 1', '20S0S1MC00', 'PF22GMYX', 'Madesh P', 'EPE', '35.56', 'Beqisoft Technologies Private Limited', 'a024f38a68e805399f', '', 'madesh@beqisoft.onmicrosoft.com', 'Gaq93340', '', '', '', 3, '', 'Laptop Computer Sysytem-1N, Battery-1N, Adapter-1N, Manual-1N, Power Cord-1N'),
('Lenovo', 'BEQI 51780015', '2021-09-08', 'ThinkPad E14 Gen 2', '20TAS08H00', 'PF2XWK5G', 'Rinu Ponnachan', 'EPE', '35.56', 'BEQISOFT TECHNOLOGIES PRIVATE LIMITED', 'bc3f643bb30c603c4e', '', '', '', '', '', '', 3, '', 'Laptop Computer Sysytem-1N, Battery-1N, Adapter-1N, Manual-1N, Power Cord-1N'),
('Lenovo', 'BEQI 51780016', '2021-09-08', 'ThinkPad E14 Gen 2', '20TAS08H00', 'PF2XWA4N', 'Ashwini R', 'EPE', '35.56', 'BEQISOFT TECHNOLOGIES PRIVATE LIMITED', '77269c01491161b68a', '', '', '', '', '', '', 3, '', 'Laptop Computer Sysytem-1N, Battery-1N, Adapter-1N, Manual-1N, Power Cord-1N'),
('Lenovo', 'BEQI 51780017', '2021-09-08', 'ThinkPad E14 Gen 2', '20TAS08H00', 'PF2Z65ZW', 'Madhura', 'EPE', '35.56', 'BEQISOFT TECHNOLOGIES PRIVATE LIMITED', '7f98910acf9679c148', '', '', '', '', '', '', 3, '', 'Laptop Computer Sysytem-1N, Battery-1N, Adapter-1N, Manual-1N, Power Cord-1N'),
('Lenovo', 'BEQI 51780018', '2021-09-08', 'ThinkPad E14 Gen 2', '20TAS08H00', 'PF2XWRNN', 'Karthik D', 'EPE', '35.56', 'BEQISOFT TECHNOLOGIES PRIVATE LIMITED', '8e3df0229a9eb6d315', '', '', '', '', '', '', 3, '', 'Laptop Computer Sysytem-1N, Battery-1N, Adapter-1N, Manual-1N, Power Cord-1N'),
('Lenovo', 'BEQI 51780040', NULL, 'ThinkPad E14', '20RAS08A00', 'PF1TMCNQ', 'Prathima C', 'EPE', '35.56', 'Beqisoft Technologies Private Limited', 'a024f38a68e805399f', 'NQYQV-MY89W-JJ9F6-M88TR-GXY9B', '', '', '', '', '', 3, '', 'Laptop Computer Sysytem-1N, Battery-1N, Adapter-1N, Manual-1N, Power Cord-1N');

-- --------------------------------------------------------

--
-- Table structure for table `team`
--

CREATE TABLE `team` (
  `TeamID` varchar(50) NOT NULL,
  `TeamName` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `team`
--

INSERT INTO `team` (`TeamID`, `TeamName`) VALUES
('Beqisoft Office', 'Beqisoft Office'),
('EPE', 'EPE'),
('ESPN Analytics', 'ESPN Analytics'),
('ESPN Functionality', 'ESPN Functionality'),
('Fantasy', 'Fantasy'),
('Test0', 'EditTest0');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `deviceasset`
--
ALTER TABLE `deviceasset`
  ADD PRIMARY KEY (`DeviceAssetID`),
  ADD KEY `Emp_ID_idx` (`Emp_ID`),
  ADD KEY `Team_IDf_idx` (`Team_IDf`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`EmployeeID`),
  ADD KEY `TeamIDNo` (`TeamIDNo`);

--
-- Indexes for table `laptopasset`
--
ALTER TABLE `laptopasset`
  ADD PRIMARY KEY (`LaptopAssetID`),
  ADD KEY `EmpID_idx` (`EmpID`),
  ADD KEY `Team_ID_idx` (`Team_ID`);

--
-- Indexes for table `team`
--
ALTER TABLE `team`
  ADD PRIMARY KEY (`TeamID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `deviceasset`
--
ALTER TABLE `deviceasset`
  ADD CONSTRAINT `Emp_ID` FOREIGN KEY (`Emp_ID`) REFERENCES `employee` (`EmployeeID`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `Team_IDf` FOREIGN KEY (`Team_IDf`) REFERENCES `team` (`TeamID`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `TeamIDNo` FOREIGN KEY (`TeamIDNo`) REFERENCES `team` (`TeamID`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `laptopasset`
--
ALTER TABLE `laptopasset`
  ADD CONSTRAINT `EmpID` FOREIGN KEY (`EmpID`) REFERENCES `employee` (`EmployeeID`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `Team_ID` FOREIGN KEY (`Team_ID`) REFERENCES `team` (`TeamID`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
