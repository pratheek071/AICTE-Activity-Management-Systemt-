-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 30, 2023 at 11:13 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `aicte`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `INSERT_STUDENT` (IN `USN` VARCHAR(10), IN `NAME` VARCHAR(50), IN `PHONE` BIGINT(10), IN `DEPARTMENT_ID` VARCHAR(50), IN `STUDENT_TYPE` VARCHAR(30), IN `PASSWORD` VARCHAR(8))   INSERT INTO STUDENT VALUES(USN,NAME,PHONE,DEPARTMENT_ID,STUDENT_TYPE,PASSWORD)$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `activity`
--

CREATE TABLE `activity` (
  `ACTIVITY_ID` varchar(5) NOT NULL,
  `ACTIVITY_NAME` varchar(500) NOT NULL,
  `NUMBER_OF_HOURS` int(5) NOT NULL,
  `TOTAL_POINTS` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `activity`
--

INSERT INTO `activity` (`ACTIVITY_ID`, `ACTIVITY_NAME`, `NUMBER_OF_HOURS`, `TOTAL_POINTS`) VALUES
('A11', 'Helping local schools to achieve good result and enhance their enrolment in Higher/ technical/ Vocational Education.', 80, 20),
('A12', 'Preparing an actionable business proposal for enhancing the village Income.', 80, 20),
('A13', 'Developing Sustainable Water Management system', 80, 20),
('A14', 'Tourism Promotion Innovative Approaches.', 80, 20),
('A15', 'Promotion of Appropriate Technologies.', 80, 20),
('A16', 'Reduction in Energy Consumption.', 80, 20),
('A17', 'To Skill rural population.', 80, 20),
('A18', 'Facilitating 100% Digitized money transactions.', 80, 20),
('A19', 'Setting of the information imparting club for women leading to contribution in social and economic issues.', 80, 20),
('A20', 'Developing and managing efficient garbage disposable system.', 80, 20),
('A21', 'To assist the marketing of rural produce.', 80, 20),
('A22', 'Food preservation/packaging.', 80, 20),
('A23', 'Automation of local activities.', 80, 20),
('A24', 'Spreading public awareness under rural outreach programmes.', 80, 20),
('A25', 'Contribution to any national level initiative of Government of India. For e.g. Digital India/ Skill India/ Swachh Bharat Internship etc.', 80, 20);

-- --------------------------------------------------------

--
-- Table structure for table `activity_completed`
--

CREATE TABLE `activity_completed` (
  `USN` varchar(10) NOT NULL,
  `ACT_ID` varchar(5) NOT NULL,
  `COMPLETED_DATE` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `activity_completed`
--

INSERT INTO `activity_completed` (`USN`, `ACT_ID`, `COMPLETED_DATE`) VALUES
('4NN20CS025', 'A11', '2022-10-20'),
('4NN20CS025', 'A24', '2022-10-21'),
('4NN20CS027', 'A11', '2022-10-17'),
('4NN20CS027', 'A24', '2022-10-21'),
('4NN20CS036', 'A13', '2022-10-25'),
('4NN20CS036', 'A25', '2022-10-18'),
('4NN20EC024', 'A19', '2022-12-21'),
('4NN20EE005', 'A15', '2022-11-13'),
('4NN20EE015', 'A21', '2023-01-04'),
('4NN20ME010', 'A18', '2022-11-10');

--
-- Triggers `activity_completed`
--
DELIMITER $$
CREATE TRIGGER `TRG_ACT_COM` AFTER INSERT ON `activity_completed` FOR EACH ROW UPDATE activity_status SET POINTS_REMAINING = POINTS_REMAINING - 20 ,ACTIVITIES_REMAINING = ACTIVITIES_REMAINING-1 WHERE USN = NEW.USN
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `TRG_DEL` BEFORE DELETE ON `activity_completed` FOR EACH ROW UPDATE activity_status SET POINTS_REMAINING = POINTS_REMAINING + 20,ACTIVITIES_REMAINING = ACTIVITIES_REMAINING+1 WHERE USN = OLD.USN
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `activity_status`
--

CREATE TABLE `activity_status` (
  `USN` varchar(10) NOT NULL,
  `POINTS_REMAINING` int(5) NOT NULL,
  `ACTIVITIES_REMAINING` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `activity_status`
--

INSERT INTO `activity_status` (`USN`, `POINTS_REMAINING`, `ACTIVITIES_REMAINING`) VALUES
('4NN20CS004', 75, 4),
('4NN20CS005', 100, 5),
('4NN20CS025', 60, 3),
('4NN20CS027', 60, 3),
('4NN20CS036', 60, 3),
('4NN20CS066', 50, 2),
('4NN20CS067', 50, 2),
('4NN20CS405', 75, 4),
('4NN20EC005', 100, 5),
('4NN20EC401', 75, 4),
('4NN20EE001', 75, 4),
('4NN20EE015', 100, 5),
('4NN20EE055', 50, 2),
('4NN20IS004', 100, 5),
('4NN20IS017', 100, 5),
('4NN20IS403', 75, 4),
('4NN20ME010', 80, 4),
('4NN20ME024', 100, 5);

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `ADMIN_ID` varchar(10) NOT NULL,
  `PASSWORD` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`ADMIN_ID`, `PASSWORD`) VALUES
('admin', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `DEPARTMENT_NAME` varchar(50) NOT NULL,
  `DEPARTMENT_ID` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`DEPARTMENT_NAME`, `DEPARTMENT_ID`) VALUES
('CSE', 'D1'),
('ISE', 'D2'),
('ECE', 'D3'),
('EEE', 'D4'),
('MECH', 'D5'),
('CIV', 'D6');

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `USN` varchar(10) NOT NULL,
  `NAME` varchar(50) NOT NULL,
  `PHONE` bigint(10) NOT NULL,
  `DEPARTMENT_NAME` varchar(50) NOT NULL,
  `STUDENT_TYPE` varchar(30) NOT NULL,
  `PASSWORD` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`USN`, `NAME`, `PHONE`, `DEPARTMENT_NAME`, `STUDENT_TYPE`, `PASSWORD`) VALUES
('4NN20CS004', 'Abhishek', 9087365421, 'CSE', 'Regular', 'Abhi1234'),
('4NN20CS005', 'Amulya', 6453217890, 'CSE', 'Regular', 'Amul1234'),
('4NN20CS025', 'Koushik', 9356280123, 'CSE', 'Regular', 'Kous1234'),
('4NN20CS027', 'Mahadevaswamy J G', 6362224193, 'CSE', 'Regular', 'Maha1234'),
('4NN20CS036', 'Pratheek Raj Urs C P', 9876543210, 'CSE', 'Regular', 'Prat1234'),
('4NN20CS066', 'Arunkumar', 8936532283, 'CSE', 'Change of collage(5th Sem)', 'Arun1234'),
('4NN20CS067', 'Shivaraj', 8973663873, 'CSE', 'Change of collage(5th Sem)', 'Shiv1234'),
('4NN20CS405', 'Ashoka', 7986035421, 'CSE', 'Lateral', 'Asho1234'),
('4NN20EC005', 'Chandan', 9807653422, 'ECE', 'Regular', 'Chad1234'),
('4NN20EC401', 'Gowtham', 9321039484, 'ECE', 'Lateral', 'Gowt1234'),
('4NN20EE001', 'Anuraj', 6798023145, 'EEE', 'Regular', 'Anuj1234'),
('4NN20EE015', 'Druva', 9863552763, 'EEE', 'Regular', 'Druv1234'),
('4NN20EE055', 'Naveen', 9028735547, 'EEE', 'Change of collage(5th Sem)', 'Nave1234'),
('4NN20IS004', 'Amar', 7689034521, 'ISE', 'Regular', 'Amar1234'),
('4NN20IS017', 'Darshan', 8976329937, 'ISE', 'Regular', 'Dars1234'),
('4NN20IS403', 'Rajendra', 9872563863, 'ISE', 'Lateral', 'Raje1234'),
('4NN20ME010', 'Harsha', 9076853422, 'MECH', 'Regular', 'Hars1234'),
('4NN20ME024', 'Kumar', 8464738736, 'MECH', 'Regular', 'Kuma1234');

--
-- Triggers `student`
--
DELIMITER $$
CREATE TRIGGER `TRG_STU_DEL` BEFORE DELETE ON `student` FOR EACH ROW DELETE FROM activity_status WHERE USN=OLD.USN
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `TRG_STU_REG` AFTER INSERT ON `student` FOR EACH ROW IF NEW.STUDENT_TYPE='Regular' THEN
INSERT INTO activity_status(USN,POINTS_REMAINING,ACTIVITIES_REMAINING) VALUES(NEW.USN, 100, 5);
ELSEIF NEW.STUDENT_TYPE='Lateral' THEN
INSERT INTO activity_status(USN,POINTS_REMAINING,ACTIVITIES_REMAINING) VALUES(NEW.USN, 75, 4);
ELSE
INSERT INTO activity_status(USN,POINTS_REMAINING,ACTIVITIES_REMAINING) VALUES(NEW.USN, 50, 3);
END IF
$$
DELIMITER ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activity`
--
ALTER TABLE `activity`
  ADD PRIMARY KEY (`ACTIVITY_ID`);

--
-- Indexes for table `activity_completed`
--
ALTER TABLE `activity_completed`
  ADD PRIMARY KEY (`USN`,`ACT_ID`),
  ADD KEY `FKYACT` (`ACT_ID`);

--
-- Indexes for table `activity_status`
--
ALTER TABLE `activity_status`
  ADD PRIMARY KEY (`USN`);

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`ADMIN_ID`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`DEPARTMENT_ID`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`USN`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `activity_completed`
--
ALTER TABLE `activity_completed`
  ADD CONSTRAINT `FKYACT` FOREIGN KEY (`ACT_ID`) REFERENCES `activity` (`ACTIVITY_ID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
