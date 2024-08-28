-- phpMyAdmin SQL Dump
-- version 5.3.0-dev+20221031.25fe766a26
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 04, 2024 at 10:59 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `leave_staff`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `UserName` varchar(100) NOT NULL,
  `Password` varchar(100) NOT NULL,
  `updationDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `UserName`, `Password`, `updationDate`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3', '2020-11-03 05:55:30');

-- --------------------------------------------------------

--
-- Table structure for table `tbldepartments`
--

CREATE TABLE `tbldepartments` (
  `id` int(11) NOT NULL,
  `DepartmentName` varchar(150) DEFAULT NULL,
  `DepartmentShortName` varchar(100) NOT NULL,
  `CreationDate` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbldepartments`
--

INSERT INTO `tbldepartments` (`id`, `DepartmentName`, `DepartmentShortName`, `CreationDate`) VALUES
(2, 'Information Technologies', 'ICT', '2017-11-01 07:19:37'),
(3, 'Library', 'LIb', '2021-05-21 08:27:45'),
(4, 'Finance', 'Fn', '2024-01-18 08:52:10'),
(5, 'Procurement', 'Prc', '2024-01-18 09:36:26');

-- --------------------------------------------------------

--
-- Table structure for table `tblemployees`
--

CREATE TABLE `tblemployees` (
  `emp_id` int(11) NOT NULL,
  `FirstName` varchar(150) NOT NULL,
  `LastName` varchar(150) NOT NULL,
  `EmailId` varchar(200) NOT NULL,
  `Password` varchar(180) NOT NULL,
  `Gender` varchar(100) NOT NULL,
  `Dob` varchar(100) NOT NULL,
  `Emp_No` int(50) NOT NULL,
  `Department` varchar(255) NOT NULL,
  `Designation` text NOT NULL,
  `Address` varchar(255) NOT NULL,
  `Av_leave` varchar(150) NOT NULL,
  `Phonenumber` char(11) NOT NULL,
  `Status` int(1) NOT NULL,
  `RegDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `role` varchar(30) NOT NULL,
  `location` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblemployees`
--

INSERT INTO `tblemployees` (`emp_id`, `FirstName`, `LastName`, `EmailId`, `Password`, `Gender`, `Dob`, `Emp_No`, `Department`, `Designation`, `Address`, `Av_leave`, `Phonenumber`, `Status`, `RegDate`, `role`, `location`) VALUES
(2, 'Regina', 'Njuguna', 'regiiwangechi4@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', 'female', '06 January 2020', 0, 'ICT', '', 'Rurii', '30', '0703816218', 1, '2017-11-10 13:40:02', 'Admin', 'WhatsApp Image 2024-01-17 at 23.12.31.jpeg'),
(4, 'Nathaniel', 'Nkrumah', 'nat@gmail.com', 'b4cc344d25a2efe540adbf2678e2304c', 'Male', '3 February, 1990', 0, 'ICT', '', 'N NEPO', '30', '587944255', 1, '2017-11-10 13:40:02', 'Admin', 'NO-IMAGE-AVAILABLE.jpg'),
(6, 'Martha', 'Koome', 'mat@gmail.com', 'b4cc344d25a2efe540adbf2678e2304c', 'Female', '3 February, 1990', 0, 'ICT', 'ICT OFFICER III', 'OLKALOU', '26', '072000000', 1, '2017-11-10 13:40:02', 'Staff', 'NO-IMAGE-AVAILABLE.jpg'),
(8, 'Paul', 'Njoroge', 'paul@gmail.com', 'b4cc344d25a2efe540adbf2678e2304c', 'Female', '3 February, 2006', 0, 'ICT', 'ICT OFFICER II', 'Nyahururu', '30', '076300000', 1, '2017-11-10 13:40:02', 'HOD', 'NO-IMAGE-AVAILABLE.jpg'),
(9, 'Catherene', 'Njuguna', 'catenjuguna@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', 'female', '03 January 2022', 0, 'ICT', 'ICT SUPPORT STAFF', 'olkalou', '89', '0727334105', 1, '2024-01-17 20:32:33', 'Staff', 'NO-IMAGE-AVAILABLE.jpg'),
(10, 'Phillip', 'Njuguna', 'njugunaphillip@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', 'male', '07 January 2019', 0, 'ICT', 'S.I.O', 'Nakuru', '100', '726014242', 1, '2024-01-17 20:44:45', 'HOD', 'NO-IMAGE-AVAILABLE.jpg'),
(11, 'Aurelia', 'Wanjiru', 'aurelia.wanjiru@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', 'female', '05 March 2014', 0, 'ICT', 'P.I.O', 'Nakuru', '30', '0717691440', 1, '2024-01-18 09:44:01', 'HOD', 'NO-IMAGE-AVAILABLE.jpg'),
(12, 'Joseph', 'Wanjohi', 'wanjohimuthoni2000@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', 'male', '06 December 2021', 0, 'ICT', 'LIBRARY OFFICER 11', 'Olkalou', '30', '0700372866', 1, '2024-01-18 10:26:12', 'Staff', 'NO-IMAGE-AVAILABLE.jpg'),
(14, 'Dominic', 'Chege', 'chege@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', 'male', '01 October 2021', 0, 'Fn', '', 'Engineer', '60', '07000000', 1, '2024-01-18 13:44:34', 'HOD', 'NO-IMAGE-AVAILABLE.jpg'),
(15, 'raban', 'MUCHEMI', 'rabanm18@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', 'female', '28 January 2024', 0, 'ICT', '', '128', '69', '+2547412980', 1, '2024-02-04 15:53:01', 'Staff', 'NO-IMAGE-AVAILABLE.jpg'),
(16, 'maina', 'muchemi', 'rabanw@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', 'male', '01 February 2024', 0, 'ICT', '', '123', '55', '0759977380', 1, '2024-02-04 19:01:14', 'Staff', 'NO-IMAGE-AVAILABLE.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `tblleaves`
--

CREATE TABLE `tblleaves` (
  `id` int(11) NOT NULL,
  `LeaveType` varchar(110) NOT NULL,
  `ToDate` varchar(120) NOT NULL,
  `FromDate` varchar(120) NOT NULL,
  `Description` mediumtext NOT NULL,
  `PostingDate` date NOT NULL,
  `AdminRemark` mediumtext DEFAULT NULL,
  `registra_remarks` mediumtext NOT NULL,
  `AdminRemarkDate` varchar(120) DEFAULT NULL,
  `Status` int(1) NOT NULL,
  `admin_status` int(11) NOT NULL DEFAULT 0,
  `IsRead` int(1) NOT NULL,
  `empid` int(11) DEFAULT NULL,
  `num_days` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblleaves`
--

INSERT INTO `tblleaves` (`id`, `LeaveType`, `ToDate`, `FromDate`, `Description`, `PostingDate`, `AdminRemark`, `registra_remarks`, `AdminRemarkDate`, `Status`, `admin_status`, `IsRead`, `empid`, `num_days`) VALUES
(27, 'Medical Leave', ' 2/9/2024', '2024-02-05', 'ty', '2024-02-04', NULL, '', NULL, 0, 0, 0, 15, 4),
(28, 'Annual Leave', ' 2/16/2024', '2024-02-05', '34', '2024-02-04', NULL, '', NULL, 0, 0, 0, 15, 9),
(29, 'Casual Leave', ' 2/10/2024', '2024-02-07', 'sick', '2024-02-04', NULL, '', NULL, 0, 0, 0, 15, 3),
(30, 'Casual Leave', ' 2/20/2024', '2024-02-06', 'sick', '2024-02-04', NULL, '', NULL, 0, 0, 0, 15, 10),
(31, 'Casual Leave', ' 2/10/2024', '2024-02-05', 'tyuio', '2024-02-04', NULL, '', NULL, 0, 0, 0, 15, 5),
(32, 'Medical Leave', ' 2/13/2024', '2024-02-05', 'ertyu', '2024-02-04', NULL, '', NULL, 0, 0, 0, 15, 6);

-- --------------------------------------------------------

--
-- Table structure for table `tblleavetype`
--

CREATE TABLE `tblleavetype` (
  `id` int(11) NOT NULL,
  `LeaveType` varchar(200) DEFAULT NULL,
  `Description` mediumtext DEFAULT NULL,
  `date_from` varchar(200) NOT NULL,
  `date_to` varchar(200) NOT NULL,
  `CreationDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblleavetype`
--

INSERT INTO `tblleavetype` (`id`, `LeaveType`, `Description`, `date_from`, `date_to`, `CreationDate`) VALUES
(5, 'Casual Leave', 'Casual Leave', '2021-05-23', '2021-06-20', '2021-05-19 14:32:03'),
(6, 'Medical Leave', 'Medical Leave', '2021-05-05', '2021-05-28', '2021-05-19 15:29:05'),
(8, 'Other', 'Leave all staff', '31-05-2021', '04-06-2021', '2021-05-20 17:17:43'),
(9, 'Annual Leave', 'Yearly annual leave', '01-01-2024', '30-12-2024', '2024-01-18 08:54:31');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbldepartments`
--
ALTER TABLE `tbldepartments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblemployees`
--
ALTER TABLE `tblemployees`
  ADD PRIMARY KEY (`emp_id`),
  ADD KEY `Emp-No` (`Emp_No`);

--
-- Indexes for table `tblleaves`
--
ALTER TABLE `tblleaves`
  ADD PRIMARY KEY (`id`),
  ADD KEY `UserEmail` (`empid`);

--
-- Indexes for table `tblleavetype`
--
ALTER TABLE `tblleavetype`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbldepartments`
--
ALTER TABLE `tbldepartments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tblemployees`
--
ALTER TABLE `tblemployees`
  MODIFY `emp_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `tblleaves`
--
ALTER TABLE `tblleaves`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `tblleavetype`
--
ALTER TABLE `tblleavetype`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
