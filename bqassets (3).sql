-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 30, 2023 at 08:42 AM
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
CREATE DATABASE IF NOT EXISTS `bqassets` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `bqassets`;

-- --------------------------------------------------------

--
-- Table structure for table `assign_laptop`
--

DROP TABLE IF EXISTS `assign_laptop`;
CREATE TABLE `assign_laptop` (
  `software_softwareNo` varchar(7) NOT NULL,
  `laptopAsset_laptopNo` varchar(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `assign_laptop`
--

INSERT INTO `assign_laptop` (`software_softwareNo`, `laptopAsset_laptopNo`) VALUES
('S000001', 'L000016'),
('S000003', 'L000001'),
('S000004', 'B234567'),
('S000004', 'L000000'),
('S000004', 'L000001'),
('S000004', 'L000002'),
('S000004', 'L000003'),
('S000004', 'L000004'),
('S000005', 'B234567'),
('S000005', 'L000000'),
('S000006', 'B234567'),
('S000006', 'L000000'),
('S000006', 'L000001'),
('S000006', 'L000002'),
('S000006', 'L000003'),
('S000006', 'L000004'),
('S000006', 'L000005'),
('S000006', 'L000006'),
('S000006', 'L000007'),
('S000006', 'L000009'),
('S000006', 'L000011'),
('S000006', 'L000013'),
('S000006', 'L000015'),
('S000006', 'L000017'),
('S000007', 'L000000');

--
-- Triggers `assign_laptop`
--
DROP TRIGGER IF EXISTS `assignlaptop`;
DELIMITER $$
CREATE TRIGGER `assignlaptop` AFTER INSERT ON `assign_laptop` FOR EACH ROW BEGIN
    INSERT INTO history (tablename,change_type,changes, time)
    VALUES ('software','Assign', JSON_OBJECT('Software ID', (SELECT softwareID FROM software WHERE NEW.software_softwareNo = software.softwareNo), 'Assigned to Laptop', (SELECT laptopAssetID FROM laptopasset WHERE NEW.laptopAsset_laptopNo = laptopasset.LaptopNo)), NOW());
    
END
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `deassignlaptop`;
DELIMITER $$
CREATE TRIGGER `deassignlaptop` BEFORE DELETE ON `assign_laptop` FOR EACH ROW BEGIN
    INSERT INTO history (tablename,change_type,changes, time)
    VALUES ('software','Deassign', JSON_OBJECT('Software ID',OLD.software_softwareNo,'Laptop ID',OLD.laptopAsset_laptopNo), NOW());
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `deviceasset`
--

DROP TABLE IF EXISTS `deviceasset`;
CREATE TABLE `deviceasset` (
  `inUse` tinyint(1) NOT NULL,
  `DeviceNo` varchar(7) NOT NULL,
  `Brand` varchar(255) DEFAULT NULL,
  `DeviceAssetID` varchar(255) DEFAULT NULL,
  `CodeRef2` varchar(255) DEFAULT NULL,
  `ModelName` varchar(255) DEFAULT NULL,
  `Category` varchar(255) DEFAULT NULL,
  `PurchaseDate` datetime(6) DEFAULT NULL,
  `Emp_ID` varchar(50) DEFAULT NULL,
  `Team_IDf` varchar(50) DEFAULT NULL,
  `IMEICode` varchar(255) DEFAULT NULL,
  `SerialNo` varchar(255) DEFAULT NULL,
  `Accessories` varchar(255) DEFAULT NULL,
  `AdditionalInfo` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `deviceasset`
--

INSERT INTO `deviceasset` (`inUse`, `DeviceNo`, `Brand`, `DeviceAssetID`, `CodeRef2`, `ModelName`, `Category`, `PurchaseDate`, `Emp_ID`, `Team_IDf`, `IMEICode`, `SerialNo`, `Accessories`, `AdditionalInfo`) VALUES
(1, 'D000001', 'Apple', 'B-i2', 'i2', 'iPhone 7', 'iOS', NULL, 'Beqisoft Office', 'Beqisoft Office', '3.55E+14', 'DNPVCM2RJ5KN', 'Cable', 'Device + Cable'),
(0, 'D000002', 'Apple', 'B-i3', 'i6', 'iphone 8 plus', 'iOS', NULL, 'Beqisoft Office', 'Beqisoft Office', '3.57E+14', 'F2QVDM59JCLY', NULL, 'Devices'),
(0, 'D000003', 'Apple', 'B-i4', 'i7', 'iPad pro / 11.4', 'iPAD', NULL, 'NEWTESTEMP', 'NEWTESTTEAM', NULL, 'DMPWTOBIJ28L', NULL, 'Device'),
(0, 'D000004', 'Samsung', 'BA1', 'A3', 'vivo 1725', 'Handset', NULL, 'Monica Seles', 'ESPN Functionality', '868530039072134/868530039072126', 'NULL', 'Adaptor', 'Device + Adaptor'),
(0, 'D000005', 'Samsung', 'BA3', 'A7', 'Samsung Galaxy NOTE 8', 'Handset', NULL, 'manikanta', 'ESPN Functionality', '352016091987628/\r352017091987626', 'RZ8K31F5LSN', NULL, 'Device'),
(0, 'D000006', 'Samsung', 'BA4', 'A9', 'Google pixel 2XL -OS -9,', 'Handset', NULL, 'Chandramouli P', 'Fantasy', '3.58E+14', '804KPRW1753646', 'C USB Cable', 'Device + Cable'),
(0, 'D000007', 'Test', 'Test1', NULL, 'ANEW', NULL, '2023-07-04 00:00:00.000000', 'Kishore Kumar', 'EPE', NULL, NULL, NULL, NULL),
(0, 'D000008', 'Test', 'ATEST2', NULL, 'Test', NULL, '2023-08-16 00:00:00.000000', 'empTest1', 'Fantasy', NULL, NULL, NULL, NULL),
(0, 'D000009', 'ATestMobile', 'ATestMobile', NULL, 'ATestMobile', NULL, '2023-08-01 00:00:00.000000', 'ATest1', 'NEWTESTTEAM', NULL, NULL, NULL, NULL),
(0, 'D000010', 'aTestMobile2', 'aTestMobileq2', NULL, 'aTestMobile2', NULL, NULL, 'empTest1', 'Fantasy', NULL, NULL, NULL, NULL),
(0, 'D000011', 'Test', 'Atestdeviceaseer', NULL, 'Test', NULL, NULL, 'Manoj', 'EPE', NULL, NULL, NULL, NULL);

--
-- Triggers `deviceasset`
--
DROP TRIGGER IF EXISTS `deletedmobile`;
DELIMITER $$
CREATE TRIGGER `deletedmobile` BEFORE DELETE ON `deviceasset` FOR EACH ROW BEGIN
    INSERT INTO history (tablename,change_type,changes, time)
    VALUES ('deviceasset','Deleted', JSON_OBJECT('inUse',OLD.inUse,'DeviceAssetID',OLD.DeviceAssetID,'DeviceNo',OLD.DeviceNo,'Brand',OLD.Brand,'CodeRef2',OLD.CodeRef2,'Category',OLD.Category,'PurchaseDate',OLD.PurchaseDate,'Team_IDf',OLD.Team_IDf,'Emp_ID',OLD.Emp_ID,'IMEICode',OLD.IMEICode,'SerialNo',OLD.SerialNo,'Accessories',OLD.Accessories,'AdditionalInfo',OLD.AdditionalInfo), NOW());
END
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `mobiledevicehistory`;
DELIMITER $$
CREATE TRIGGER `mobiledevicehistory` AFTER UPDATE ON `deviceasset` FOR EACH ROW BEGIN
 IF((OLD.Emp_ID!=NEW.Emp_ID && OLD.Team_IDf=NEW.Team_IDf) OR (OLD.Emp_ID!=NEW.Emp_ID && OLD.Team_IDf!=NEW.Team_IDf))
 THEN
    INSERT INTO history (tablename,change_type,changes, time)
    VALUES ('deviceasset','Reassign', JSON_OBJECT('assignedFrom', OLD.Emp_ID, 'Team', OLD.Team_IDf,'assignedTo',NEW.Emp_ID,'Team',NEW.Team_IDf), NOW());
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee` (
  `PersonID` varchar(7) NOT NULL,
  `EmployeeID` varchar(50) NOT NULL DEFAULT 'admin',
  `EmployeeName` varchar(255) DEFAULT NULL,
  `TeamIDNo` varchar(50) DEFAULT NULL,
  `Designation` varchar(255) DEFAULT NULL,
  `ContactNo` varchar(255) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`PersonID`, `EmployeeID`, `EmployeeName`, `TeamIDNo`, `Designation`, `ContactNo`, `Email`) VALUES
('B000001', 'Ashwini R', 'Ashwini R', 'EPE', 'QA Analyst', '9375676576', ''),
('B000002', 'ATest1', 'atest1', 'NEWTESTTEAM', '', '9999999999', 'test1@test.com'),
('B000003', 'Beqisoft Office', 'Beqisoft Office', 'Beqisoft Office', '', '', ''),
('B000004', 'Chandramouli P', 'Chandramouli P', 'Fantasy', '', '', ''),
('B000005', 'Deepika', 'Deepika', 'ESPN Analytics', '', '', ''),
('B000006', 'Deepika M', 'Deepika M', 'EPE', '', '', ''),
('B000009', 'Karthik D', 'Karthik D', 'EPE', '', '', ''),
('B000010', 'Kishore Kumar', 'Kishore Kumar', 'EPE', '', '', ''),
('B000011', 'Madesh P', 'Madesh P', 'EPE', '', '', ''),
('B000012', 'Madhura', 'Madhura', 'EPE', '', '', ''),
('B000013', 'manikanta', 'manikanta', 'ESPN Functionality', '', '', ''),
('B000014', 'Manoj', 'Manoj', 'EPE', '', '', ''),
('B000015', 'Mohit Kumar', 'Mohit Kumar', 'EPE', '', '', ''),
('B000016', 'Monica Seles', 'Monica Seles', 'ESPN Functionality', '', '', ''),
('B000017', 'NewEmp', 'New', 'Fantasy', '', '', 'dfdfd@dffg'),
('B000018', 'Poosala Chandramouli', 'Poosala Chandramouli', 'EPE', '', '', ''),
('B000019', 'Prathima C', 'Prathima C', 'EPE', '', '', ''),
('B000020', 'Rinu Ponnachan', 'Rinu Ponnachan', 'EPE', '', '', ''),
('B000021', 'Saravanan', 'Saravanan', 'EPE', '', '', ''),
('B000022', 'Sujatha', 'Sujatha', 'EPE', '', '', ''),
('B000023', 'Test0', 'Test0', NULL, '', '', ''),
('B000024', 'empTest1', 'TestUser', 'Fantasy', 'Test', '', 'signuptest@gmail.com'),
('B000026', 'NEWTESTEMP', 'NEWTESTEMP', 'NEWTESTTEAM', '', '3939492434', 'sddfdsdsfssds@fdsfd.wdfd');

--
-- Triggers `employee`
--
DROP TRIGGER IF EXISTS `deletedemployee`;
DELIMITER $$
CREATE TRIGGER `deletedemployee` BEFORE DELETE ON `employee` FOR EACH ROW BEGIN
    INSERT INTO history (tablename,change_type,changes, time)
    VALUES ('employee','Deleted', JSON_OBJECT('EmployeeID',OLD.EmployeeID,'EmployeeName',OLD.EmployeeName,'Designation',OLD.Designation,'Email',OLD.Email,'ContactNo',OLD.ContactNo), NOW());
END
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `employeehistory`;
DELIMITER $$
CREATE TRIGGER `employeehistory` AFTER UPDATE ON `employee` FOR EACH ROW BEGIN
IF (OLD.TeamIDNo!=NEW.TeamIDNo)
 THEN
    INSERT INTO history (tablename,change_type,changes,  time)
    VALUES    ('employee','Reassign',JSON_OBJECT('assignedFrom',    OLD.TeamIDNo,'assignedTo',NEW.TeamIDNo),  NOW());
 END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `hardware`
--

DROP TABLE IF EXISTS `hardware`;
CREATE TABLE `hardware` (
  `HardwareNo` varchar(7) NOT NULL,
  `HardwareID` varchar(255) DEFAULT NULL,
  `HardwareName` varchar(255) DEFAULT NULL,
  `AdditionalInfo` varchar(255) DEFAULT NULL,
  `PurchaseDate` datetime(6) DEFAULT NULL,
  `AssignedToEmp` varchar(50) DEFAULT NULL,
  `InTeamf` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `hardware`
--

INSERT INTO `hardware` (`HardwareNo`, `HardwareID`, `HardwareName`, `AdditionalInfo`, `PurchaseDate`, `AssignedToEmp`, `InTeamf`) VALUES
('H000001', 'ATestHardware1', 'ATestHardware', 'ATestHardware', '2023-08-24 00:00:00.000000', 'ATest1', 'NEWTESTTEAM'),
('H000002', 'ALGOCable2', 'ALGOCable', NULL, '2023-08-01 00:00:00.000000', 'ATest1', 'NEWTESTTEAM'),
('H000003', '4567', 'testhardware', '*AdminTestUser(Admin): test', '2023-08-29 00:00:00.000000', 'Manoj', 'EPE');

--
-- Triggers `hardware`
--
DROP TRIGGER IF EXISTS `deletedhardware`;
DELIMITER $$
CREATE TRIGGER `deletedhardware` BEFORE DELETE ON `hardware` FOR EACH ROW BEGIN
    INSERT INTO history (tablename,change_type,changes, time)
    VALUES ('hardware','Deleted', JSON_OBJECT('HardwareID',OLD.HardwareID,'HardwareNo',OLD.HardwareNo,'HardwareName',OLD.HardwareName,'AssignedTo',OLD.AssignedToEmp,'InTeam',OLD.InTeamf,'AdditionalInformation',OLD.AdditionalInfo), NOW());
END
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `hardwarehistory`;
DELIMITER $$
CREATE TRIGGER `hardwarehistory` AFTER UPDATE ON `hardware` FOR EACH ROW BEGIN
 IF((OLD.AssignedToEmp!=NEW.AssignedToEmp && OLD.InTeamf=NEW.InTeamf) OR (OLD.AssignedToEmp!=NEW.AssignedToEmp && OLD.InTeamf!=NEW.InTeamf))
 THEN
    INSERT INTO history (tablename,change_type,changes, time)
    VALUES ('hardware','Reassign', JSON_OBJECT('assignedFrom', OLD.AssignedToEmp, 'Team', OLD.InTeamf,'assignedTo',NEW.AssignedToEmp,'Team',NEW.InTeamf), NOW());
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `history`
--

DROP TABLE IF EXISTS `history`;
CREATE TABLE `history` (
  `TableName` varchar(255) NOT NULL,
  `Change_type` varchar(255) NOT NULL,
  `Changes` varchar(255) NOT NULL,
  `id` int(11) NOT NULL,
  `Time` datetime(6) DEFAULT NULL,
  `ChangedBy` varchar(255) DEFAULT NULL,
  `Role` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `history`
--

INSERT INTO `history` (`TableName`, `Change_type`, `Changes`, `id`, `Time`, `ChangedBy`, `Role`) VALUES
('software', 'Deleted', '{\"SoftwareID\": \"Software24\", \"SoftwareNo\": \"S000005\", \"SoftwareName\": \"Software24\", \"SoftwareKey\": null, \"AssignedTo\": null, \"InTeam\": null, \"Username\": null, \"Password\": null, \"AdditionalInformation\": null}', 1, '2023-08-25 15:55:01.000000', NULL, NULL),
('employee', 'Deleted', '{\"EmployeeID\": \"TimeStampTest\", \"EmployeeName\": \"TimeStampTest\", \"Designation\": \"\", \"Email\": \"\", \"ContactNo\": \"\"}', 52, '2023-08-21 10:09:52.000000', 'AdminTestUser', 'Admin'),
('employee', 'Deleted', '{\"EmployeeID\": \"TimeStampTest\", \"EmployeeName\": \"TimeStampTest\", \"Designation\": \"\", \"Email\": \"\", \"ContactNo\": \"\"}', 53, '2023-08-21 10:12:10.000000', 'AdminTestUser', 'Admin'),
('employee', 'Deleted', '{\"EmployeeID\": \"TimeStampTest\", \"EmployeeName\": \"TimeStampTest\", \"Designation\": \"\", \"Email\": \"\", \"ContactNo\": \"\"}', 54, '2023-08-21 10:13:16.000000', 'AdminTestUser', 'Admin'),
('laptopasset', 'Reassign', '{\"assignedFrom\": \"NEWTESTEMP\", \"From Team\": \"NEWTESTTEAM\", \"assignedTo\": \"ATest1\", \"To Team\": \"NEWTESTTEAM\"}', 55, '2023-08-21 10:18:25.000000', 'AdminTestUser', 'Admin'),
('team', 'Deleted', '{\"TeamID\": \"TimeStampTest\", \"EmployeeName\": \"TimeStampTest\"}', 56, '2023-08-21 10:24:11.000000', 'AdminTestUser', 'Admin'),
('laptopasset', 'Reassign', '{\"assignedFrom\": \"ATest1\", \"From Team\": \"NEWTESTTEAM\", \"assignedTo\": \"NEWTESTEMP\", \"To Team\": \"NEWTESTTEAM\"}', 57, '2023-08-21 10:24:51.000000', 'AdminTestUser', 'Admin'),
('software', 'Reassign', '{\"assignedFrom\": \"NEWTESTEMP\", \"Team\": \"NEWTESTTEAM\", \"assignedTo\": \"ATest1\", \"Team\": \"NEWTESTTEAM\"}', 58, '2023-08-21 13:11:09.000000', NULL, NULL),
('software', 'Deleted', '{\"SoftwareID\": \"ATestSoftware1\", \"SoftwareNo\": \"L000001\", \"SoftwareName\": \"ATestSoftware\", \"SoftwareKey\": \"ABCDEFG\", \"AssignedTo\": \"ATest1\", \"InTeam\": \"NEWTESTTEAM\", \"Username\": null, \"Password\": null, \"AdditionalInformation\": null}', 59, '2023-08-21 13:13:16.000000', 'AdminTestUser', 'Admin'),
('software', 'Reassign', '{\"assignedFrom\": \"ATest1\", \"Team\": \"NEWTESTTEAM\", \"assignedTo\": \"NEWTESTEMP\", \"Team\": \"NEWTESTTEAM\"}', 60, '2023-08-21 13:13:39.000000', 'AdminTestUser', 'Admin'),
('hardwareware', 'Reassign', '{\"assignedFrom\": \"NEWTESTEMP\", \"Team\": \"NEWTESTTEAM\", \"assignedTo\": \"ATest1\", \"Team\": \"NEWTESTTEAM\"}', 61, '2023-08-21 14:23:39.000000', NULL, NULL),
('hardware', 'Deleted', '{\"HardwareID\": \"ATestHardware2\", \"HardwareNo\": \"H000002\", \"HardwareName\": \"ATestHardware\", \"AssignedTo\": \"ATest1\", \"InTeam\": \"NEWTESTTEAM\", \"AdditionalInformation\": null}', 62, '2023-08-21 14:26:56.000000', 'AdminTestUser', 'Admin'),
('software', 'Deleted', '{\"SoftwareID\": \"Asof\", \"SoftwareNo\": \"S000003\", \"SoftwareName\": \"Asof\", \"SoftwareKey\": null, \"AssignedTo\": \"Kishore Kumar\", \"InTeam\": \"EPE\", \"Username\": null, \"Password\": null, \"AdditionalInformation\": null}', 63, '2023-08-22 14:36:02.000000', 'AdminTestUser', 'Admin'),
('deviceasset', 'Reassign', '{\"assignedFrom\": \"Ashwini R\", \"Team\": \"NEWTESTTEAM\", \"assignedTo\": \"ATest1\", \"Team\": \"NEWTESTTEAM\"}', 64, '2023-08-23 09:30:29.000000', NULL, NULL),
('laptopasset', 'Reassign', '{\"assignedFrom\": \"NEWTESTEMP\", \"From Team\": \"NEWTESTTEAM\", \"assignedTo\": \"ATest1\", \"To Team\": \"NEWTESTTEAM\"}', 65, '2023-08-23 09:30:56.000000', NULL, NULL),
('laptopasset', 'Reassign', '{\"assignedFrom\": \"NewEmp\", \"From Team\": \"NEWTESTTEAM\", \"assignedTo\": \"ATest1\", \"To Team\": \"NEWTESTTEAM\"}', 66, '2023-08-23 09:31:12.000000', NULL, NULL),
('software', 'Deleted', '{\"SoftwareID\": \"rggehrg\", \"SoftwareNo\": \"S000007\", \"SoftwareName\": \"AVPN\", \"SoftwareKey\": null, \"AssignedTo\": null, \"InTeam\": null, \"Username\": null, \"Password\": null, \"AdditionalInformation\": null}', 76, '2023-08-26 16:14:50.000000', 'AdminTestUser', 'Admin'),
('software', 'Deleted', '{\"SoftwareID\": \"brgbrgbr\", \"SoftwareNo\": \"S000006\", \"SoftwareName\": \"AVPN\", \"SoftwareKey\": null, \"AssignedTo\": null, \"InTeam\": null, \"Username\": null, \"Password\": null, \"AdditionalInformation\": null}', 77, '2023-08-26 16:14:58.000000', 'AdminTestUser', 'Admin'),
('software', 'Deleted', '{\"SoftwareID\": \"swfwwrf\", \"SoftwareNo\": \"S000005\", \"SoftwareName\": \"AVPN\", \"SoftwareKey\": null, \"AssignedTo\": null, \"InTeam\": null, \"Username\": null, \"Password\": null, \"AdditionalInformation\": null}', 78, '2023-08-26 16:15:07.000000', 'AdminTestUser', 'Admin'),
('software', 'Deleted', '{\"SoftwareID\": \"effrfr\", \"SoftwareNo\": \"S000012\", \"SoftwareName\": \"ATestSoftware\", \"SoftwareKey\": null, \"AssignedTo\": null, \"InTeam\": null, \"Username\": null, \"Password\": null, \"AdditionalInformation\": null}', 79, '2023-08-26 16:28:02.000000', 'AdminTestUser', 'Admin'),
('software', 'Deleted', '{\"SoftwareID\": \"grewrw\", \"SoftwareNo\": \"S000011\", \"SoftwareName\": \"AVPN\", \"SoftwareKey\": null, \"AssignedTo\": null, \"InTeam\": null, \"Username\": null, \"Password\": null, \"AdditionalInformation\": null}', 80, '2023-08-26 16:28:04.000000', 'AdminTestUser', 'Admin'),
('software', 'Deleted', '{\"SoftwareID\": \"fefqefe\", \"SoftwareNo\": \"S000010\", \"SoftwareName\": \"AVPN\", \"SoftwareKey\": null, \"AssignedTo\": null, \"InTeam\": null, \"Username\": null, \"Password\": null, \"AdditionalInformation\": null}', 81, '2023-08-26 16:28:06.000000', 'AdminTestUser', 'Admin'),
('software', 'Deleted', '{\"SoftwareID\": \"fdasfdf\", \"SoftwareNo\": \"S000009\", \"SoftwareName\": \"AVPN\", \"SoftwareKey\": null, \"AssignedTo\": null, \"InTeam\": null, \"Username\": null, \"Password\": null, \"AdditionalInformation\": null}', 82, '2023-08-26 16:28:08.000000', 'AdminTestUser', 'Admin'),
('software', 'Deleted', '{\"SoftwareID\": \"fwwagfar\", \"SoftwareNo\": \"S000008\", \"SoftwareName\": \"AVPN\", \"SoftwareKey\": null, \"AssignedTo\": null, \"InTeam\": null, \"Username\": null, \"Password\": null, \"AdditionalInformation\": null}', 83, '2023-08-26 16:28:13.000000', 'AdminTestUser', 'Admin'),
('software', 'Deleted', '{\"SoftwareID\": \"efvvfwevffvew\", \"SoftwareNo\": \"S000007\", \"SoftwareName\": \"AVPN\", \"SoftwareKey\": null, \"AssignedTo\": null, \"InTeam\": null, \"Username\": null, \"Password\": null, \"AdditionalInformation\": null}', 84, '2023-08-26 16:28:15.000000', 'AdminTestUser', 'Admin'),
('software', 'Deleted', '{\"SoftwareID\": \"afsdrf\", \"SoftwareNo\": \"S000006\", \"SoftwareName\": \"AVPN\", \"SoftwareKey\": null, \"AssignedTo\": null, \"InTeam\": null, \"Username\": null, \"Password\": null, \"AdditionalInformation\": null}', 85, '2023-08-26 16:28:18.000000', 'AdminTestUser', 'Admin'),
('software', 'Deleted', '{\"SoftwareID\": \"errebgrtgr\", \"SoftwareNo\": \"S000005\", \"SoftwareName\": \"AVPN\", \"SoftwareKey\": null, \"AssignedTo\": null, \"InTeam\": null, \"Username\": null, \"Password\": null, \"AdditionalInformation\": null}', 86, '2023-08-26 16:28:20.000000', 'AdminTestUser', 'Admin'),
('software', 'Deleted', '{\"SoftwareID\": \"wdfwaff\", \"SoftwareNo\": \"S000005\", \"SoftwareName\": \"AVPN\", \"SoftwareKey\": null, \"AssignedTo\": null, \"InTeam\": null, \"Username\": null, \"Password\": null, \"AdditionalInformation\": null}', 87, '2023-08-26 16:40:59.000000', 'AdminTestUser', 'Admin'),
('software', 'Deleted', '{\"SoftwareID\": \"vefvef\", \"SoftwareNo\": \"S000006\", \"SoftwareName\": \"AVPN\", \"SoftwareKey\": null, \"AssignedTo\": null, \"InTeam\": null, \"Username\": null, \"Password\": null, \"AdditionalInformation\": null}', 88, '2023-08-26 16:41:10.000000', 'AdminTestUser', 'Admin'),
('software', 'Deleted', '{\"SoftwareID\": \"ererwrgfe\", \"SoftwareNo\": \"S000005\", \"SoftwareName\": \"AVPN\", \"SoftwareKey\": null, \"AssignedTo\": null, \"InTeam\": null, \"Username\": null, \"Password\": null, \"AdditionalInformation\": null}', 89, '2023-08-26 16:46:56.000000', 'AdminTestUser', 'Admin'),
('software', 'Deleted', '{\"SoftwareID\": \"vfwgbgr\", \"SoftwareNo\": \"S000006\", \"SoftwareName\": \"AVPN\", \"SoftwareKey\": null, \"AssignedTo\": null, \"InTeam\": null, \"Username\": null, \"Password\": null, \"AdditionalInformation\": null}', 90, '2023-08-26 16:46:58.000000', 'AdminTestUser', 'Admin'),
('software', 'Deleted', '{\"SoftwareID\": \"vevefevf\", \"SoftwareNo\": \"S000007\", \"SoftwareName\": \"AVPN\", \"SoftwareKey\": null, \"AssignedTo\": null, \"InTeam\": null, \"Username\": null, \"Password\": null, \"AdditionalInformation\": null}', 91, '2023-08-26 16:47:00.000000', 'AdminTestUser', 'Admin'),
('software', 'Deleted', '{\"SoftwareID\": \"cdcdcd\", \"SoftwareNo\": \"S000008\", \"SoftwareName\": \"AVPN\", \"SoftwareKey\": null, \"AssignedTo\": null, \"InTeam\": null, \"Username\": null, \"Password\": null, \"AdditionalInformation\": null}', 92, '2023-08-26 16:47:04.000000', 'AdminTestUser', 'Admin'),
('software', 'Deleted', '{\"SoftwareID\": \"brgbgbgr\", \"SoftwareNo\": \"S000009\", \"SoftwareName\": \"AVPN\", \"SoftwareKey\": null, \"AssignedTo\": null, \"InTeam\": null, \"Username\": null, \"Password\": null, \"AdditionalInformation\": null}', 93, '2023-08-26 16:47:06.000000', 'AdminTestUser', 'Admin'),
('software', 'Deleted', '{\"SoftwareID\": \"bgrfbgrbrg\", \"SoftwareNo\": \"S000005\", \"SoftwareName\": \"AVPN\", \"SoftwareKey\": null, \"AssignedTo\": null, \"InTeam\": null, \"Username\": null, \"Password\": null, \"AdditionalInformation\": null}', 94, '2023-08-26 16:59:29.000000', 'AdminTestUser', 'Admin'),
('software', 'Deleted', '{\"SoftwareID\": \"avdsvdd\", \"SoftwareNo\": \"S000008\", \"SoftwareName\": \"ATestSoftware\", \"SoftwareKey\": null, \"AssignedTo\": null, \"InTeam\": null, \"Username\": null, \"Password\": null, \"AdditionalInformation\": null}', 95, '2023-08-26 17:02:41.000000', 'AdminTestUser', 'Admin'),
('software', 'Deleted', '{\"SoftwareID\": \"gtrgrwgrt\", \"SoftwareNo\": \"S000007\", \"SoftwareName\": \"ATestSoftware\", \"SoftwareKey\": null, \"AssignedTo\": null, \"InTeam\": null, \"Username\": null, \"Password\": null, \"AdditionalInformation\": null}', 96, '2023-08-26 17:02:44.000000', 'AdminTestUser', 'Admin'),
('software', 'Deleted', '{\"SoftwareID\": \"edwf\", \"SoftwareNo\": \"S000006\", \"SoftwareName\": \"AVPN\", \"SoftwareKey\": null, \"AssignedTo\": null, \"InTeam\": null, \"Username\": null, \"Password\": null, \"AdditionalInformation\": null}', 97, '2023-08-26 17:02:47.000000', 'AdminTestUser', 'Admin'),
('software', 'Deleted', '{\"SoftwareID\": \"gfewrgfwwwr\", \"SoftwareNo\": \"S000005\", \"SoftwareName\": \"AVPN\", \"SoftwareKey\": null, \"AssignedTo\": null, \"InTeam\": null, \"Username\": null, \"Password\": null, \"AdditionalInformation\": null}', 98, '2023-08-26 17:02:50.000000', NULL, NULL),
('software', 'Deleted', '{\"SoftwareID\": \"evfvfvef\", \"SoftwareNo\": \"S000005\", \"SoftwareName\": \"AVPN\", \"SoftwareKey\": null, \"AssignedTo\": null, \"InTeam\": null, \"Username\": null, \"Password\": null, \"AdditionalInformation\": null}', 99, '2023-08-26 17:15:50.000000', 'AdminTestUser', 'Admin'),
('software', 'Deleted', '{\"SoftwareID\": \"feffe\", \"SoftwareNo\": \"S000006\", \"SoftwareName\": \"AVPN\", \"SoftwareKey\": null, \"AssignedTo\": null, \"InTeam\": null, \"Username\": null, \"Password\": null, \"AdditionalInformation\": null}', 100, '2023-08-26 17:15:52.000000', NULL, NULL),
('software', 'Deleted', '{\"SoftwareID\": \"vfevefvfe\", \"SoftwareNo\": \"S000007\", \"SoftwareName\": \"AVPN\", \"SoftwareKey\": null, \"AssignedTo\": null, \"InTeam\": null, \"Username\": null, \"Password\": null, \"AdditionalInformation\": null}', 101, '2023-08-26 17:15:55.000000', 'AdminTestUser', 'Admin'),
('software', 'Deleted', '{\"SoftwareID\": \"wdfdfsdfs\", \"SoftwareNo\": \"S000005\", \"SoftwareName\": \"AVPN\", \"SoftwareKey\": null, \"AssignedTo\": null, \"InTeam\": null, \"Username\": null, \"Password\": null, \"AdditionalInformation\": null}', 102, '2023-08-26 17:16:47.000000', NULL, NULL),
('software', 'Deleted', '{\"SoftwareID\": \"eregrg\", \"SoftwareNo\": \"S000005\", \"SoftwareName\": \"AVPN\", \"SoftwareKey\": null, \"AssignedTo\": null, \"InTeam\": null, \"Username\": null, \"Password\": null, \"AdditionalInformation\": null}', 103, '2023-08-26 17:18:33.000000', 'AdminTestUser', 'Admin'),
('software', 'Deleted', '{\"SoftwareID\": \"ggerg\", \"SoftwareNo\": \"S000006\", \"SoftwareName\": \"AVPN\", \"SoftwareKey\": null, \"AssignedTo\": null, \"InTeam\": null, \"Username\": null, \"Password\": null, \"AdditionalInformation\": null}', 104, '2023-08-26 17:32:35.000000', 'AdminTestUser', 'Admin'),
('software', 'Deleted', '{\"SoftwareID\": \"awererer\", \"SoftwareNo\": \"S000007\", \"SoftwareName\": \"AVPN\", \"SoftwareKey\": null, \"AssignedTo\": null, \"InTeam\": null, \"Username\": null, \"Password\": null, \"AdditionalInformation\": null}', 105, '2023-08-26 17:32:37.000000', 'AdminTestUser', 'Admin'),
('software', 'Deleted', '{\"SoftwareID\": \"assignmenttest\", \"SoftwareNo\": \"S000008\", \"SoftwareName\": \"AVPN\", \"SoftwareKey\": null, \"AssignedTo\": null, \"InTeam\": null, \"Username\": null, \"Password\": null, \"AdditionalInformation\": null}', 106, '2023-08-26 17:32:39.000000', 'AdminTestUser', 'Admin'),
('software', 'Deleted', '{\"SoftwareID\": \"vrfvrf\", \"SoftwareNo\": \"S000005\", \"SoftwareName\": \"ATestSoftware\", \"SoftwareKey\": null, \"AssignedTo\": null, \"InTeam\": null, \"Username\": null, \"Password\": null, \"AdditionalInformation\": null}', 107, '2023-08-26 17:32:44.000000', 'AdminTestUser', 'Admin'),
('software', 'Deleted', '{\"SoftwareID\": \"assignmenttest1\", \"SoftwareNo\": \"S000005\", \"SoftwareName\": \"AVPN\", \"SoftwareKey\": null, \"AssignedTo\": null, \"InTeam\": null, \"Username\": null, \"Password\": null, \"AdditionalInformation\": null}', 108, '2023-08-27 10:15:45.000000', 'AdminTestUser', 'Admin'),
('software', 'Deleted', '{\"SoftwareID\": \"dfssddsf\", \"SoftwareNo\": \"S000007\", \"SoftwareName\": \"AVPN\", \"SoftwareKey\": null, \"AssignedTo\": null, \"InTeam\": null, \"Username\": null, \"Password\": null, \"AdditionalInformation\": null}', 109, '2023-08-27 10:15:54.000000', 'AdminTestUser', 'Admin'),
('software', 'Deleted', '{\"SoftwareID\": \"eweewqfwef\", \"SoftwareNo\": \"S000006\", \"SoftwareName\": \"AVPN\", \"SoftwareKey\": null, \"AssignedTo\": null, \"InTeam\": null, \"Username\": null, \"Password\": null, \"AdditionalInformation\": null}', 110, '2023-08-27 10:15:58.000000', 'AdminTestUser', 'Admin'),
('software', 'Deleted', '{\"SoftwareID\": \"asdfeawef\", \"SoftwareNo\": \"S000006\", \"SoftwareName\": \"AVPN\", \"SoftwareKey\": null, \"AssignedTo\": null, \"InTeam\": null, \"Username\": null, \"Password\": null, \"AdditionalInformation\": null}', 111, '2023-08-27 10:21:06.000000', 'AdminTestUser', 'Admin'),
('software', 'Deleted', '{\"SoftwareID\": \"AnAssignTest\", \"SoftwareNo\": \"S000005\", \"SoftwareName\": \"AVPN\", \"SoftwareKey\": null, \"AssignedTo\": null, \"InTeam\": null, \"Username\": null, \"Password\": null, \"AdditionalInformation\": null}', 112, '2023-08-27 10:21:08.000000', 'AdminTestUser', 'Admin'),
('software', 'Deleted', '{\"SoftwareID\": \"AnotherTest\", \"SoftwareNo\": \"S000006\", \"SoftwareName\": \"ATestSoftware\", \"SoftwareKey\": null, \"AssignedTo\": null, \"InTeam\": null, \"Username\": null, \"Password\": null, \"AdditionalInformation\": null}', 113, '2023-08-27 16:28:04.000000', 'AdminTestUser', 'Admin'),
('laptopasset', 'Reassign', '{\"assignedFrom\": \"ATest1\", \"From Team\": \"NEWTESTTEAM\", \"assignedTo\": \"NEWTESTEMP\", \"To Team\": \"NEWTESTTEAM\"}', 114, '2023-08-28 13:40:18.000000', 'AdminTestUser', 'Admin'),
('laptopasset', 'Reassign', '{\"assignedFrom\": \"NEWTESTEMP\", \"From Team\": \"NEWTESTTEAM\", \"assignedTo\": \"ATest1\", \"To Team\": \"NEWTESTTEAM\"}', 115, '2023-08-28 13:40:45.000000', NULL, NULL),
('laptopasset', 'Reassign', '{\"assignedFrom\": \"empTest1\", \"From Team\": \"Fantasy\", \"assignedTo\": \"NewEmp\", \"To Team\": \"Fantasy\"}', 116, '2023-08-28 13:41:28.000000', NULL, NULL),
('laptopasset', 'Reassign', '{\"assignedFrom\": \"NewEmp\", \"From Team\": \"Fantasy\", \"assignedTo\": \"empTest1\", \"To Team\": \"Fantasy\"}', 117, '2023-08-28 13:41:47.000000', 'AdminTestUser', 'Admin'),
('laptopasset', 'Reassign', '{\"assignedFrom\": \"ATest1\", \"From Team\": \"NEWTESTTEAM\", \"assignedTo\": \"NEWTESTEMP\", \"To Team\": \"NEWTESTTEAM\"}', 118, '2023-08-28 13:43:35.000000', 'AdminTestUser', 'Admin'),
('laptopasset', 'Reassign', '{\"assignedFrom\": \"NEWTESTEMP\", \"From Team\": \"NEWTESTTEAM\", \"assignedTo\": \"ATest1\", \"To Team\": \"NEWTESTTEAM\"}', 119, '2023-08-28 13:44:04.000000', 'AdminTestUser', 'Admin'),
('software', 'Deleted', '{\"SoftwareID\": \"AVPN123\", \"SoftwareNo\": \"S000006\", \"SoftwareName\": \"AVPN\", \"SoftwareKey\": \"A1234\", \"AssignedTo\": null, \"InTeam\": null, \"Username\": null, \"Password\": null, \"AdditionalInformation\": \"AtestVPN\"}', 120, '2023-08-29 15:19:35.000000', 'AdminTestUser', 'Admin'),
('software', 'Deleted', '{\"SoftwareID\": \"ATestSoftware2\", \"SoftwareNo\": \"S000002\", \"SoftwareName\": \"ATestSoftware\", \"SoftwareKey\": null, \"AssignedTo\": \"NEWTESTEMP\", \"InTeam\": \"NEWTESTTEAM\", \"Username\": null, \"Password\": \"\", \"AdditionalInformation\": \"*AdminTestUser(Admin): a new\"}', 121, '2023-08-29 15:20:07.000000', 'AdminTestUser', 'Admin'),
('software', 'Assign', '{\"assignedToSoftware\": \"S000006\", \"Laptop\": \"L000001\"}', 124, '2023-08-29 15:44:57.000000', NULL, NULL),
('software', 'Assign', '{\"assignedToSoftware\": \"S000006\", \"Laptop\": \"L000003\"}', 125, '2023-08-29 15:46:04.000000', NULL, NULL),
('hardware', 'Reassign', '{\"assignedFrom\": \"Deepika M\", \"Team\": \"EPE\", \"assignedTo\": \"Manoj\", \"Team\": \"EPE\"}', 126, '2023-08-29 15:48:14.000000', 'AdminTestUser', 'Admin'),
('software', 'Assign', '{\"assignedToSoftware\": \"S000004\", \"Laptop\": \"L000004\"}', 127, '2023-08-29 15:54:12.000000', NULL, NULL),
('software', 'Reassign', '{\"Software No\": \"S000006\", \"Laptop No\": \"L000003\"}', 128, '2023-08-29 15:59:02.000000', NULL, NULL),
('software', 'Assign', '{\"assignedToSoftware\": \"S000006\", \"Laptop\": \"B234567\"}', 129, '2023-08-29 16:06:45.000000', NULL, NULL),
('software', 'Assign', '{\"assignedToSoftware\": \"S000006\", \"Laptop\": \"L000000\"}', 130, '2023-08-29 16:06:45.000000', NULL, NULL),
('software', 'Assign', '{\"assignedToSoftware\": \"S000006\", \"Laptop\": \"L000004\"}', 131, '2023-08-29 16:08:13.000000', NULL, NULL),
('software', 'Assign', '{\"assignedToSoftware\": \"S000006\", \"Laptop\": \"L000001\"}', 132, '2023-08-29 16:10:03.000000', NULL, NULL),
('software', 'Reassign', '{\"Software No\": \"S000006\", \"Laptop No\": \"L000004\"}', 133, '2023-08-29 16:12:58.000000', NULL, NULL),
('software', 'Assign', '{\"assignedToSoftware\": \"S000006\", \"Laptop\": \"L000003\"}', 134, '2023-08-29 16:14:16.000000', NULL, NULL),
('software', 'Assign', '{\"assignedToSoftware\": \"S000006\", \"Laptop\": \"L000002\"}', 135, '2023-08-29 16:14:17.000000', 'AdminTestUser', 'Admin'),
('software', 'Reassign', '{\"Software No\": \"S000006\", \"Laptop No\": \"L000000\"}', 136, '2023-08-29 16:16:45.000000', NULL, NULL),
('software', 'Reassign', '{\"Software No\": \"S000006\", \"Laptop No\": \"L000001\"}', 137, '2023-08-29 16:17:25.000000', 'AdminTestUser', 'Admin'),
('software', 'Reassign', '{\"Software No\": \"S000006\", \"Laptop No\": \"L000003\"}', 138, '2023-08-29 16:19:00.000000', 'AdminTestUser', 'Admin'),
('software', 'Reassign', '{\"Software No\": \"S000006\", \"Laptop No\": \"B234567\"}', 139, '2023-08-29 16:19:12.000000', 'AdminTestUser', 'Admin'),
('software', 'Reassign', '{\"Software No\": \"S000006\", \"Laptop No\": \"L000002\"}', 140, '2023-08-29 16:19:41.000000', 'AdminTestUser', 'Admin'),
('software', 'Assign', '{\"assignedToSoftware\": \"S000007\", \"Laptop\": \"B234567\"}', 141, '2023-08-29 16:24:40.000000', NULL, NULL),
('software', 'Reassign', '{\"Software No\": \"S000007\", \"Laptop No\": \"B234567\"}', 142, '2023-08-29 16:25:53.000000', 'AdminTestUser', 'Admin'),
('software', 'Assign', '{\"assignedToSoftware\": \"S000007\", \"Laptop\": \"L000000\"}', 143, '2023-08-29 16:27:49.000000', 'AdminTestUser', 'Admin'),
('software', 'Assign', '{\"Software ID\": \"1234\", \"Assigned to Laptop\": \"L000002\"}', 144, '2023-08-29 16:34:40.000000', NULL, NULL),
('software', 'Assign', '{\"Software ID\": \"1234\", \"Assigned to Laptop\": \"L000001\"}', 145, '2023-08-29 16:34:41.000000', 'AdminTestUser', 'Admin'),
('software', 'Assign', '{\"Software ID\": \"1234\", \"Assigned to Laptop\": \"ATest11\"}', 146, '2023-08-29 16:39:52.000000', 'AdminTestUser', 'Admin'),
('software', 'Assign', '{\"Software ID\": \"1234\", \"Assigned to Laptop\": \"ATEST45\"}', 147, '2023-08-29 16:39:52.000000', NULL, NULL),
('software', 'Assign', '{\"Software ID\": \"1234\", \"Assigned to Laptop\": \"BEQI 51780007\"}', 148, '2023-08-29 16:40:56.000000', 'AdminTestUser', 'Admin'),
('software', 'Deassign', '{\"Software ID\": \"S000006\", \"Laptop ID\": \"L000002\"}', 149, '2023-08-29 16:41:14.000000', 'AdminTestUser', 'Admin'),
('software', 'Deassign', '{\"Software ID\": \"S000006\", \"Laptop ID\": \"B234567\"}', 150, '2023-08-29 16:58:07.000000', 'AdminTestUser', 'Admin'),
('software', 'Deassign', '{\"Software ID\": \"S000006\", \"Laptop ID\": \"L000001\"}', 151, '2023-08-29 16:58:17.000000', 'AdminTestUser', 'Admin'),
('software', 'Assign', '{\"Software ID\": \"1234\", \"Assigned to Laptop\": \"BEQI 51780005\"}', 152, '2023-08-29 16:58:32.000000', 'AdminTestUser', 'Admin'),
('software', 'Assign', '{\"Software ID\": \"1234\", \"Assigned to Laptop\": \"BEQI 51780006\"}', 156, '2023-08-29 17:01:17.000000', 'AdminTestUser', 'Admin'),
('software', 'Assign', '{\"Software ID\": \"1234\", \"Assigned to Laptop\": \"BEQI 51780008\"}', 157, '2023-08-29 17:01:17.000000', NULL, NULL),
('software', 'Assign', '{\"Software ID\": \"1234\", \"Assigned to Laptop\": \"BEQI 51780009\"}', 158, '2023-08-29 17:01:17.000000', NULL, NULL),
('software', 'Assign', '{\"Software ID\": \"1234\", \"Assigned to Laptop\": \"BEQI 51780017\"}', 159, '2023-08-29 17:08:26.000000', 'AdminTestUser', 'Admin'),
('software', 'Assign', '{\"Software ID\": \"1234\", \"Assigned to Laptop\": \"BEQI 51780016\"}', 160, '2023-08-29 17:08:26.000000', NULL, NULL),
('software', 'Assign', '{\"Software ID\": \"1234\", \"Assigned to Laptop\": \"BEQI 51780018\"}', 161, '2023-08-29 17:08:26.000000', NULL, NULL),
('software', 'Deassign', '{\"Software ID\": \"S000006\", \"Laptop ID\": \"L000002\"}', 162, '2023-08-29 17:08:52.000000', 'AdminTestUser', 'Admin'),
('software', 'Deassign', '{\"Software ID\": \"S000006\", \"Laptop ID\": \"L000006\"}', 163, '2023-08-29 17:09:00.000000', 'AdminTestUser', 'Admin'),
('software', 'Deassign', '{\"Software ID\": \"S000006\", \"Laptop ID\": \"L000001\"}', 164, '2023-08-29 17:09:10.000000', 'AdminTestUser', 'Admin'),
('software', 'Assign', '{\"Software ID\": \"1234\", \"Assigned to Laptop\": \"BEQI 51780008\"}', 165, '2023-08-29 17:09:28.000000', 'AdminTestUser', 'Admin'),
('software', 'Assign', '{\"Software ID\": \"1234\", \"Assigned to Laptop\": \"BEQI 51780040\"}', 172, '2023-08-29 17:13:34.000000', 'AdminTestUser', 'Admin'),
('software', 'Assign', '{\"Software ID\": \"1234\", \"Assigned to Laptop\": \"BEQI TESE1234\"}', 173, '2023-08-29 17:13:34.000000', NULL, NULL),
('software', 'Deassign', '{\"Software ID\": \"S000006\", \"Laptop ID\": \"L000010\"}', 174, '2023-08-30 10:25:00.000000', 'AdminTestUser', 'Admin'),
('software', 'Deassign', '{\"Software ID\": \"S000006\", \"Laptop ID\": \"L000007\"}', 175, '2023-08-30 10:25:07.000000', 'AdminTestUser', 'Admin'),
('software', 'Deassign', '{\"Software ID\": \"S000006\", \"Laptop ID\": \"L000009\"}', 176, '2023-08-30 10:25:15.000000', 'AdminTestUser', 'Admin'),
('software', 'Deassign', '{\"Software ID\": \"S000006\", \"Laptop ID\": \"L000011\"}', 177, '2023-08-30 10:25:23.000000', 'AdminTestUser', 'Admin'),
('software', 'Deassign', '{\"Software ID\": \"S000006\", \"Laptop ID\": \"L000016\"}', 178, '2023-08-30 10:25:30.000000', 'AdminTestUser', 'Admin'),
('software', 'Deassign', '{\"Software ID\": \"S000006\", \"Laptop ID\": \"L000005\"}', 179, '2023-08-30 10:25:38.000000', 'AdminTestUser', 'Admin'),
('software', 'Deassign', '{\"Software ID\": \"S000006\", \"Laptop ID\": \"L000002\"}', 180, '2023-08-30 10:25:45.000000', 'AdminTestUser', 'Admin'),
('software', 'Deassign', '{\"Software ID\": \"S000006\", \"Laptop ID\": \"L000012\"}', 181, '2023-08-30 10:25:53.000000', 'AdminTestUser', 'Admin'),
('software', 'Deassign', '{\"Software ID\": \"S000006\", \"Laptop ID\": \"L000000\"}', 182, '2023-08-30 10:27:45.000000', 'AdminTestUser', 'Admin'),
('software', 'Deassign', '{\"Software ID\": \"S000006\", \"Laptop ID\": \"L000004\"}', 183, '2023-08-30 10:28:37.000000', 'AdminTestUser', 'Admin'),
('software', 'Deassign', '{\"Software ID\": \"S000006\", \"Laptop ID\": \"L000006\"}', 184, '2023-08-30 10:30:17.000000', 'AdminTestUser', 'Admin'),
('software', 'Deassign', '{\"Software ID\": \"S000006\", \"Laptop ID\": \"L000017\"}', 185, '2023-08-30 10:30:28.000000', 'AdminTestUser', 'Admin'),
('software', 'Deassign', '{\"Software ID\": \"S000006\", \"Laptop ID\": \"L000008\"}', 186, '2023-08-30 10:30:47.000000', 'AdminTestUser', 'Admin'),
('software', 'Assign', '{\"Software ID\": \"1234\", \"Assigned to Laptop\": \"ATest11\"}', 187, '2023-08-30 10:31:21.000000', 'AdminTestUser', 'Admin'),
('software', 'Assign', '{\"Software ID\": \"1234\", \"Assigned to Laptop\": \"BEQI 51780008\"}', 195, '2023-08-30 10:34:15.000000', 'AdminTestUser', 'Admin'),
('software', 'Assign', '{\"Software ID\": \"1234\", \"Assigned to Laptop\": \"BEQI 51780009\"}', 196, '2023-08-30 10:34:15.000000', NULL, NULL),
('software', 'Assign', '{\"Software ID\": \"1234\", \"Assigned to Laptop\": \"BEQI 51780010\"}', 197, '2023-08-30 10:34:15.000000', NULL, NULL),
('software', 'Deassign', '{\"Software ID\": \"S000006\", \"Laptop ID\": \"L000013\"}', 198, '2023-08-30 10:34:29.000000', 'AdminTestUser', 'Admin'),
('software', 'Deassign', '{\"Software ID\": \"S000006\", \"Laptop ID\": \"L000015\"}', 199, '2023-08-30 10:35:30.000000', 'AdminTestUser', 'Admin'),
('software', 'Deassign', '{\"Software ID\": \"S000006\", \"Laptop ID\": \"L000000\"}', 200, '2023-08-30 10:36:09.000000', 'AdminTestUser', 'Admin'),
('laptopasset', 'Reassign', '{\"assignedFrom\": \"ATest1\", \"From Team\": \"NEWTESTTEAM\", \"assignedTo\": \"NEWTESTEMP\", \"To Team\": \"NEWTESTTEAM\"}', 212, '2023-08-30 11:03:16.000000', 'AdminTestUser', 'Admin'),
('software', 'Deassign', '{\"Software ID\": \"S000006\", \"Laptop ID\": \"L000013\"}', 218, '2023-08-30 11:11:22.000000', 'AdminTestUser', 'Admin'),
('software', 'Deassign', '{\"Software ID\": \"S000006\", \"Laptop ID\": \"L000008\"}', 219, '2023-08-30 11:11:40.000000', 'AdminTestUser', 'Admin'),
('software', 'Deassign', '{\"Software ID\": \"S000006\", \"Laptop ID\": \"L000011\"}', 220, '2023-08-30 11:11:44.000000', 'AdminTestUser', 'Admin'),
('software', 'Assign', '{\"Software ID\": \"1234\", \"Assigned to Laptop\": \"BEQI 51780010\"}', 221, '2023-08-30 11:11:55.000000', 'AdminTestUser', 'Admin'),
('software', 'Assign', '{\"Software ID\": \"1234\", \"Assigned to Laptop\": \"BEQI 51780017\"}', 222, '2023-08-30 11:11:55.000000', 'AdminTestUser', 'Admin'),
('software', 'Assign', '{\"Software ID\": \"1234\", \"Assigned to Laptop\": \"BEQI 51780040\"}', 223, '2023-08-30 11:11:55.000000', 'AdminTestUser', 'Admin'),
('software', 'Deassign', '{\"Software ID\": \"S000006\", \"Laptop ID\": \"L000010\"}', 224, '2023-08-30 11:16:54.000000', 'AdminTestUser', 'Admin'),
('software', 'Deassign', '{\"Software ID\": \"S000006\", \"Laptop ID\": \"L000012\"}', 225, '2023-08-30 11:17:11.000000', 'AdminTestUser', 'Admin'),
('software', 'Deassign', '{\"Software ID\": \"S000006\", \"Laptop ID\": \"L000008\"}', 226, '2023-08-30 11:17:33.000000', 'AdminTestUser', 'Admin');

-- --------------------------------------------------------

--
-- Table structure for table `history_seq`
--

DROP TABLE IF EXISTS `history_seq`;
CREATE TABLE `history_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `history_seq`
--

INSERT INTO `history_seq` (`next_val`) VALUES
(1);

-- --------------------------------------------------------

--
-- Table structure for table `laptopasset`
--

DROP TABLE IF EXISTS `laptopasset`;
CREATE TABLE `laptopasset` (
  `inUse` tinyint(1) NOT NULL,
  `LaptopNo` varchar(7) NOT NULL,
  `Brand` varchar(255) DEFAULT NULL,
  `LaptopAssetID` varchar(255) DEFAULT NULL,
  `PurchaseDate` datetime(6) DEFAULT NULL,
  `ModelName` varchar(255) DEFAULT NULL,
  `ModelNo` varchar(255) DEFAULT NULL,
  `SerialNo` varchar(255) DEFAULT NULL,
  `EmpID` varchar(50) DEFAULT NULL,
  `Team_ID` varchar(50) DEFAULT NULL,
  `ScreenSize` varchar(255) DEFAULT NULL,
  `CharlesID` varchar(255) DEFAULT NULL,
  `CharlesKey` varchar(255) DEFAULT NULL,
  `MSOfficeKey` varchar(255) DEFAULT NULL,
  `MSOfficeUsername` varchar(255) DEFAULT NULL,
  `MSOfficePassword` varchar(255) DEFAULT NULL,
  `Accessories` varchar(255) DEFAULT NULL,
  `Warranty` varchar(255) DEFAULT NULL,
  `AdditionalItems` varchar(255) DEFAULT NULL,
  `OtherDetails` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `laptopasset`
--

INSERT INTO `laptopasset` (`inUse`, `LaptopNo`, `Brand`, `LaptopAssetID`, `PurchaseDate`, `ModelName`, `ModelNo`, `SerialNo`, `EmpID`, `Team_ID`, `ScreenSize`, `CharlesID`, `CharlesKey`, `MSOfficeKey`, `MSOfficeUsername`, `MSOfficePassword`, `Accessories`, `Warranty`, `AdditionalItems`, `OtherDetails`) VALUES
(0, 'B234567', 'ATEST', 'ATEST45', NULL, 'ATEST1', 'ATEST', '1234', 'NEWTESTEMP', 'NEWTESTTEAM', '123', NULL, NULL, NULL, NULL, NULL, NULL, '3', '', '*AdminTestUser(Admin): anew'),
(0, 'L000000', 'Test', 'ATest11', '2023-07-19 00:00:00.000000', 'Atest1', NULL, NULL, 'empTest1', 'Fantasy', '13', NULL, NULL, NULL, NULL, NULL, NULL, '4', NULL, 'A test value\n*AdminTestUser(Admin): Another value\n*AdminTestUser(Admin): Another test\n*empTest1(Standard): A third test'),
(1, 'L000001', 'Lenovo', 'BEQI 51780002', NULL, 'ThinkPad T490', '20RYS07R00', 'PF2B1ZL6', 'Deepika M', 'EPE', '35.56', 'Beqisoft Technologies Private Limited', 'a024f38a68e805399f', NULL, 'Deepika@beqisoft.com', ' Xos12751', NULL, '3', NULL, 'Laptop Computer Sysytem-1N, Battery-1N, Adapter-1N, Manual-1N, Power Cord-1N, test'),
(1, 'L000002', 'MacBook', 'BEQI 51780003', '2020-12-09 00:00:00.000000', 'MacBook Air 13-inch', 'A2179', 'FVFDG227M6KG', 'Sujatha', 'EPE', '13', 'BEQISOFT TECHNOLOGIES PRIVATE LIMITED', ' 4e95f35d21b7aa1e87', NULL, 'sujatha@beqisoft.onmicrosoft.com', 'Qug10732', 'HDMI Cable, Adaptor', '3', 'ALOGIC USB Cable', 'test'),
(0, 'L000003', 'Lenovo', 'BEQI 51780005', NULL, 'ThinkPad T14 Gen 1', '20S0S1MC00', 'PF24469N', 'Mohit Kumar', 'EPE', '35.56', 'Beqisoft Technologies Private Limited', 'a024f38a68e805399f', NULL, 'mohit@beqisoft.onmicrosoft.com', 'Jaf77886', NULL, '3', NULL, 'Laptop Computer Sysytem-1N, Battery-1N, Adapter-1N, Manual-1N, Power Cord-1N'),
(0, 'L000004', 'Lenovo', 'BEQI 51780006', NULL, 'ThinkPad T14 Gen 1', '20S0S1MC00', 'PF2419QT', 'Saravanan', 'EPE', '35.56', 'Beqisoft Technologies Private Limited', 'a024f38a68e805399f', NULL, 'nishikar@beqisoft.onmicrosoft.com', 'Rut85340', NULL, '3', 'cable', 'Laptop Computer Sysytem-1N, Battery-1N, Adapter-1N, Manual-1N, Power Cord-1N'),
(0, 'L000005', 'Lenovo', 'BEQI 51780007', NULL, 'ThinkPad T14 Gen 1', '20S0S1MC00', 'PF24563V', 'Kishore Kumar', 'EPE', '35.56', 'Beqisoft Technologies Private Limited', 'a024f38a68e805399f', NULL, 'seema@beqisoft.onmicrosoft.com', 'Dox21868', NULL, '3', NULL, 'Laptop Computer Sysytem-1N, Battery-1N, Adapter-1N, Manual-1N, Power Cord-1N\n*AdminTestUser(Admin): Adaptor'),
(0, 'L000006', 'Lenovo', 'BEQI 51780008', NULL, 'ThinkPad T14 Gen 1', '20S0S1MC00', 'PF2419SY', 'Manoj', 'EPE', '35.56', 'Beqisoft Technologies Private Limited', 'a024f38a68e805399f', NULL, 'n.manoj@beqisoft.onmicrosoft.com', 'Hug29440', NULL, '3', NULL, 'Laptop Computer Sysytem-1N, Battery-1N, Adapter-1N, Manual-1N, Power Cord-1N'),
(0, 'L000007', 'Lenovo', 'BEQI 51780009', NULL, 'ThinkPad T14 Gen 1', '20S0S1MC00', 'PF23SSN7', 'Poosala Chandramouli', 'EPE', '35.56', 'Username: BEQISOFT TECHNOLOGIES PRIVATE LIMIT', '93a344610c39429831', NULL, 'chandramouli@beqisoft.onmicrosoft.com', 'Mav38465', NULL, '3', NULL, 'Laptop Computer Sysytem-1N, Battery-1N, Adapter-1N, Manual-1N, Power Cord-1N'),
(0, 'L000008', 'Lenovo', 'BEQI 51780010', NULL, 'ThinkPad T14 Gen 1', '20S0S1MC00', 'PF22GMYX', 'Madesh P', 'EPE', '35.56', 'Beqisoft Technologies Private Limited', 'a024f38a68e805399f', NULL, 'madesh@beqisoft.onmicrosoft.com', 'Gaq93340', NULL, '3', NULL, 'Laptop Computer Sysytem-1N,Battery-1N,Adapter-1N, Manual-1N,Power Cord-1N'),
(0, 'L000009', 'Lenovo', 'BEQI 51780015', '2021-09-08 00:00:00.000000', 'ThinkPad E14 Gen 2', '20TAS08H00', 'PF2XWK5G', 'Rinu Ponnachan', 'EPE', '35.56', 'BEQISOFT TECHNOLOGIES PRIVATE LIMITED', 'bc3f643bb30c603c4e', NULL, NULL, NULL, NULL, '3', NULL, 'Laptop Computer Sysytem-1N, Battery-1N, Adapter-1N, Manual-1N, Power Cord-1N'),
(0, 'L000010', 'Lenovo', 'BEQI 51780016', '2021-09-08 00:00:00.000000', 'ThinkPad E14 Gen 2', '20TAS08H00', 'PF2XWA4N', 'Ashwini R', 'EPE', '35.56', 'BEQISOFT TECHNOLOGIES PRIVATE LIMITED', '77269c01491161b68a', NULL, NULL, NULL, NULL, '3', NULL, 'Laptop Computer Sysytem-1N, Battery-1N, Adapter-1N, Manual-1N, Power Cord-1N'),
(0, 'L000011', 'Lenovo', 'BEQI 51780017', '2021-09-08 00:00:00.000000', 'ThinkPad E14 Gen 2', '20TAS08H00', 'PF2Z65ZW', 'Madhura', 'EPE', '35.56', 'BEQISOFT TECHNOLOGIES PRIVATE LIMITED', '7f98910acf9679c148', NULL, NULL, NULL, NULL, '3', NULL, 'Laptop Computer Sysytem-1N, Battery-1N, Adapter-1N, Manual-1N, Power Cord-1N'),
(0, 'L000012', 'Lenovo', 'BEQI 51780018', '2021-09-08 00:00:00.000000', 'ThinkPad E14 Gen 2', '20TAS08H00', 'PF2XWRNN', 'Karthik D', 'EPE', '35.56', 'BEQISOFT TECHNOLOGIES PRIVATE LIMITED', '8e3df0229a9eb6d315', NULL, NULL, NULL, NULL, '3', NULL, 'Laptop Computer Sysytem-1N, Battery-1N, Adapter-1N, Manual-1N, Power Cord-1N'),
(0, 'L000013', 'Lenovo', 'BEQI 51780040', NULL, 'ThinkPad E14', '20RAS08A00', 'PF1TMCNQ', 'Prathima C', 'EPE', '35.56', 'Beqisoft Technologies Private Limited', 'a024f38a68e805399f', 'NQYQV-MY89W-JJ9F6-M88TR-GXY9B', NULL, NULL, NULL, '3', NULL, 'Laptop Computer Sysytem-1N, Battery-1N, Adapter-1N, Manual-1N, Power Cord-1N'),
(0, 'L000015', 'Lenovo', 'BEQI TESE1234', NULL, 'ThinkPad T490', '20RYS07R00', 'PF2B1ZL6', NULL, NULL, '35.56', 'Beqisoft Technologies Private Limited', 'a024f38a68e805399f', NULL, 'Deepika@beqisoft.com', ' Xos12751', NULL, '3', NULL, 'Laptop Computer Sysytem-1N, Battery-1N, Adapter-1N, Manual-1N, Power Cord-1N'),
(1, 'L000016', 'TEST', 'ATestLaptop-updated', '2023-08-15 00:00:00.000000', 'Test', '12346', '12347', 'ATest1', 'NEWTESTTEAM', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', NULL, 'ATEST\n*AdminTestUser(Admin): updated\n*AdminTestUser(Admin): Anew comment'),
(0, 'L000017', 'SomeBrand', 'ALaptopTest', NULL, 'SomeModel', '1234', NULL, 'Manoj', 'EPE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

--
-- Triggers `laptopasset`
--
DROP TRIGGER IF EXISTS `deletedlaptop`;
DELIMITER $$
CREATE TRIGGER `deletedlaptop` BEFORE DELETE ON `laptopasset` FOR EACH ROW BEGIN
    INSERT INTO history (tablename,change_type,changes, time)
    VALUES ('laptopasset','Deleted', JSON_OBJECT('inUse',OLD.inUse, 'LaptopNo', OLD.LaptopNo,'Brand', OLD.Brand,'LaptopAssetID',OLD.LaptopAssetID, 'PurchaseDate', OLD.PurchaseDate,'ModelName',OLD.ModelName, 'ModelNo',OLD.ModelNo, 'SerialNo',OLD.SerialNo, 'EmpID',OLD.EmpID ,'Team_ID',OLD.Team_ID, 'ScreenSize',OLD.ScreenSize, 'Accessories', OLD.Accessories,'Warranty',OLD.Warranty, 'AdditionalItems',OLD.AdditionalItems, 'OtherDetails',OLD.OtherDetails), NOW());
END
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `laptophistory`;
DELIMITER $$
CREATE TRIGGER `laptophistory` AFTER UPDATE ON `laptopasset` FOR EACH ROW BEGIN
IF ((OLD.EmpID != NEW.EmpID && OLD.Team_ID=NEW.Team_ID) OR (OLD.EmpID != NEW.EmpID && OLD.Team_ID!=NEW.Team_ID))
 THEN
    INSERT INTO history (tablename,change_type,changes,  time)
    VALUES    ('laptopasset','Reassign',JSON_OBJECT('assignedFrom',    OLD.EmpID, 'From Team',   OLD.Team_ID,'assignedTo',NEW.EmpID,'To Team',NEW.Team_ID),  NOW());
 END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `software`
--

DROP TABLE IF EXISTS `software`;
CREATE TABLE `software` (
  `SoftwareID` varchar(255) NOT NULL,
  `SoftwareNo` varchar(7) NOT NULL,
  `SoftwareName` varchar(255) DEFAULT NULL,
  `Type` varchar(255) DEFAULT NULL,
  `MaxUsers` int(11) DEFAULT NULL,
  `AssignedTo` varchar(50) DEFAULT NULL,
  `InTeam` varchar(50) DEFAULT NULL,
  `PurchaseDate` datetime(6) DEFAULT NULL,
  `ExpirationDate` datetime(6) DEFAULT NULL,
  `SoftwareKey` varchar(255) DEFAULT NULL,
  `Username` varchar(255) DEFAULT NULL,
  `Password` varchar(255) DEFAULT NULL,
  `AdditionalInformation` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='software';

--
-- Dumping data for table `software`
--

INSERT INTO `software` (`SoftwareID`, `SoftwareNo`, `SoftwareName`, `Type`, `MaxUsers`, `AssignedTo`, `InTeam`, `PurchaseDate`, `ExpirationDate`, `SoftwareKey`, `Username`, `Password`, `AdditionalInformation`) VALUES
('AVPN1', 'S000001', 'AVPN', 'SingleUser', 1, 'ATest1', 'NEWTESTTEAM', '2023-08-22 00:00:00.000000', NULL, 'A1234', NULL, NULL, 'AtestVPN'),
('MSOffice1', 'S000003', 'MSOffice', 'SingleUser', 1, 'ATest1', 'NEWTESTTEAM', '2023-08-10 00:00:00.000000', '2028-08-10 00:00:00.000000', 'A123445-234', NULL, NULL, NULL),
('SoftwareTest', 'S000004', 'SoftwareTest', 'MultiUser', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('asdasds', 'S000005', 'AVPN', 'MultiUser', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '*AdminTestUser(Admin): atest'),
('1234', 'S000006', 'backstage pass', 'MultiUser', 100, NULL, NULL, '2023-08-29 00:00:00.000000', '2025-08-29 00:00:00.000000', 'testkey', NULL, NULL, NULL),
('140291', 'S000007', 'Beqitest', 'MultiUser', 150, NULL, NULL, '2023-08-29 00:00:00.000000', '2023-09-30 00:00:00.000000', '010391', 'Beqitest1', 'bqt1', 'test');

--
-- Triggers `software`
--
DROP TRIGGER IF EXISTS `deletedsoftware`;
DELIMITER $$
CREATE TRIGGER `deletedsoftware` BEFORE DELETE ON `software` FOR EACH ROW BEGIN
    INSERT INTO history (tablename,change_type,changes, time)
    VALUES ('software','Deleted', JSON_OBJECT('SoftwareID',OLD.SoftwareID,'SoftwareNo',OLD.SoftwareNo,'SoftwareName',OLD.SoftwareName,'SoftwareKey',OLD.SoftwareKey,'AssignedTo',OLD.AssignedTo,'InTeam',OLD.InTeam,'Username',OLD.Username,'Password',OLD.Password,'AdditionalInformation',OLD.AdditionalInformation), NOW());
END
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `softwarehistory`;
DELIMITER $$
CREATE TRIGGER `softwarehistory` AFTER UPDATE ON `software` FOR EACH ROW BEGIN
 IF((OLD.AssignedTo!=NEW.AssignedTo && OLD.InTeam=NEW.InTeam) OR (OLD.AssignedTo!=NEW.AssignedTo && OLD.InTeam!=NEW.InTeam))
 THEN
    INSERT INTO history (tablename,change_type,changes, time)
    VALUES ('software','Reassign', JSON_OBJECT('assignedFrom', OLD.AssignedTo, 'Team', OLD.InTeam,'assignedTo',NEW.AssignedTo,'Team',NEW.InTeam), NOW());
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `team`
--

DROP TABLE IF EXISTS `team`;
CREATE TABLE `team` (
  `TeamNo` varchar(7) NOT NULL,
  `TeamID` varchar(50) NOT NULL,
  `TeamName` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `team`
--

INSERT INTO `team` (`TeamNo`, `TeamID`, `TeamName`) VALUES
('T000001', 'Beqisoft Office', 'Beqisoft Office'),
('T000002', 'EPE', 'EPE'),
('T000003', 'ESPN Analytics', 'ESPN Analytics'),
('T000004', 'ESPN Functionality', 'ESPN Functionality'),
('T000005', 'Fantasy', 'Fantasy'),
('T000007', 'Test0', 'EditTest0'),
('T000012', 'NEWTESTTEAM', 'NEWTESTTEAM'),
('T000013', 'ATestTeam45', 'Atest'),
('T000014', 'Anew1', 'Anew');

--
-- Triggers `team`
--
DROP TRIGGER IF EXISTS `deletedteam`;
DELIMITER $$
CREATE TRIGGER `deletedteam` BEFORE DELETE ON `team` FOR EACH ROW BEGIN
    INSERT INTO history (tablename,change_type,changes, time)
    VALUES ('team','Deleted', JSON_OBJECT('TeamID',OLD.TeamID,'EmployeeName',OLD.TeamName), NOW());
END
$$
DELIMITER ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `assign_laptop`
--
ALTER TABLE `assign_laptop`
  ADD PRIMARY KEY (`software_softwareNo`,`laptopAsset_laptopNo`),
  ADD KEY `FKq0rpx9xqe00y4ajfc59e5vtxr` (`laptopAsset_laptopNo`);

--
-- Indexes for table `deviceasset`
--
ALTER TABLE `deviceasset`
  ADD PRIMARY KEY (`DeviceNo`),
  ADD UNIQUE KEY `DeviceAssetID` (`DeviceAssetID`),
  ADD KEY `Emp_ID_idx` (`Emp_ID`),
  ADD KEY `Team_IDf_idx` (`Team_IDf`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`PersonID`),
  ADD UNIQUE KEY `EmployeeID` (`EmployeeID`),
  ADD KEY `TeamIDNo` (`TeamIDNo`);

--
-- Indexes for table `hardware`
--
ALTER TABLE `hardware`
  ADD PRIMARY KEY (`HardwareNo`),
  ADD UNIQUE KEY `HardwareID` (`HardwareID`),
  ADD KEY `assignedToEmp_idx` (`AssignedToEmp`),
  ADD KEY `inTeamf_idx` (`InTeamf`);

--
-- Indexes for table `history`
--
ALTER TABLE `history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `laptopasset`
--
ALTER TABLE `laptopasset`
  ADD PRIMARY KEY (`LaptopNo`),
  ADD UNIQUE KEY `LaptopAssetID` (`LaptopAssetID`),
  ADD KEY `EmpID_idx` (`EmpID`),
  ADD KEY `Team_ID_idx` (`Team_ID`);

--
-- Indexes for table `software`
--
ALTER TABLE `software`
  ADD PRIMARY KEY (`SoftwareNo`),
  ADD UNIQUE KEY `softwareID` (`SoftwareID`),
  ADD KEY `assignedTo_idx` (`AssignedTo`),
  ADD KEY `inTeam_idx` (`InTeam`) USING BTREE;

--
-- Indexes for table `team`
--
ALTER TABLE `team`
  ADD PRIMARY KEY (`TeamNo`),
  ADD UNIQUE KEY `TeamID` (`TeamID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `history`
--
ALTER TABLE `history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=227;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `assign_laptop`
--
ALTER TABLE `assign_laptop`
  ADD CONSTRAINT `FK7xg0mafjd8vxyq6tk4fdhx7ai` FOREIGN KEY (`software_softwareNo`) REFERENCES `software` (`SoftwareNo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FKq0rpx9xqe00y4ajfc59e5vtxr` FOREIGN KEY (`laptopAsset_laptopNo`) REFERENCES `laptopasset` (`LaptopNo`) ON DELETE CASCADE ON UPDATE CASCADE;

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
-- Constraints for table `hardware`
--
ALTER TABLE `hardware`
  ADD CONSTRAINT `assignedToEmp_idx` FOREIGN KEY (`AssignedToEmp`) REFERENCES `employee` (`EmployeeID`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `inTeamf_idx` FOREIGN KEY (`InTeamf`) REFERENCES `team` (`TeamID`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `laptopasset`
--
ALTER TABLE `laptopasset`
  ADD CONSTRAINT `EmpID` FOREIGN KEY (`EmpID`) REFERENCES `employee` (`EmployeeID`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `Team_ID` FOREIGN KEY (`Team_ID`) REFERENCES `team` (`TeamID`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `software`
--
ALTER TABLE `software`
  ADD CONSTRAINT `assignedTo_idx` FOREIGN KEY (`assignedTo`) REFERENCES `employee` (`EmployeeID`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `inTeam` FOREIGN KEY (`inTeam`) REFERENCES `team` (`TeamID`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
