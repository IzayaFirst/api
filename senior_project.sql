-- phpMyAdmin SQL Dump
-- version 4.4.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Feb 13, 2017 at 02:54 PM
-- Server version: 5.6.26
-- PHP Version: 5.6.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `senior_project`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_activity`
--

CREATE TABLE IF NOT EXISTS `tbl_activity` (
  `activity_id` int(11) NOT NULL,
  `activity_name` varchar(100) DEFAULT NULL,
  `activity_desc` varchar(100) DEFAULT NULL,
  `cover_photo` varchar(45) DEFAULT NULL,
  `province` varchar(45) DEFAULT NULL,
  `location` varchar(45) DEFAULT NULL,
  `owener_id` int(11) DEFAULT NULL,
  `type` varchar(45) DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_activity`
--

INSERT INTO `tbl_activity` (`activity_id`, `activity_name`, `activity_desc`, `cover_photo`, `province`, `location`, `owener_id`, `type`, `status`) VALUES
(1, 'MIDNIGHT FESTIVAL 2017 #CHIANGMAI', 'Smirnoff Midnight Festival , Unlock your Style', NULL, 'Chiangmai', NULL, NULL, NULL, NULL),
(23, 'NORTH FEST 2017 THE OASIS', 'North Fest กลับมาระเบิดมันอีกครั้ง 11-12 มีนาคม นี้ณ ลานประเสริฐแลนด์ เชียงใหม่ ที่เดิม!', '', 'Chiangmai', 'ลานประเสริฐแลนด์ เชียงใหม่', NULL, 'One Day', 'opened'),
(24, 'NORTH FEST 2017 THE OASIS', 'North Fest กลับมาระเบิดมันอีกครั้ง 11-12 มีนาคม นี้ณ ลานประเสริฐแลนด์ เชียงใหม่ ที่เดิม!', '', 'Chiangmai', 'ลานประเสริฐแลนด์ เชียงใหม่', NULL, 'One Day', 'opened'),
(25, 'NORTH FEST 2017 THE OASIS', 'North Fest กลับมาระเบิดมันอีกครั้ง 11-12 มีนาคม นี้ณ ลานประเสริฐแลนด์ เชียงใหม่ ที่เดิม!', '', 'Chiangmai', 'ลานประเสริฐแลนด์ เชียงใหม่', NULL, 'One Day', 'opened'),
(26, 'NORTH FEST 2017 THE OASIS', 'North Fest กลับมาระเบิดมันอีกครั้ง 11-12 มีนาคม นี้ณ ลานประเสริฐแลนด์ เชียงใหม่ ที่เดิม!', '', 'Chiangmai', 'ลานประเสริฐแลนด์ เชียงใหม่', NULL, 'One Day', 'opened'),
(27, 'NORTH FEST 2017 THE OASIS', 'North Fest กลับมาระเบิดมันอีกครั้ง 11-12 มีนาคม นี้ณ ลานประเสริฐแลนด์ เชียงใหม่ ที่เดิม!', '', 'Chiangmai', 'ลานประเสริฐแลนด์ เชียงใหม่', NULL, 'One Day', 'opened'),
(28, 'NORTH FEST 2017 THE OASIS', 'North Fest กลับมาระเบิดมันอีกครั้ง 11-12 มีนาคม นี้ณ ลานประเสริฐแลนด์ เชียงใหม่ ที่เดิม!', '', 'Chiangmai', 'ลานประเสริฐแลนด์ เชียงใหม่', NULL, 'One Day', 'opened'),
(29, 'NORTH FEST 2017 THE OASIS', 'North Fest กลับมาระเบิดมันอีกครั้ง 11-12 มีนาคม นี้ณ ลานประเสริฐแลนด์ เชียงใหม่ ที่เดิม!', '', 'Chiangmai', 'ลานประเสริฐแลนด์ เชียงใหม่', NULL, 'One Day', 'opened'),
(30, 'NORTH FEST 2017 THE OASIS', 'North Fest กลับมาระเบิดมันอีกครั้ง 11-12 มีนาคม นี้ณ ลานประเสริฐแลนด์ เชียงใหม่ ที่เดิม!', '', 'Chiangmai', 'ลานประเสริฐแลนด์ เชียงใหม่', NULL, 'One Day', 'opened'),
(32, 'NORTH FEST 2017 THE OASIS', 'North Fest กลับมาระเบิดมันอีกครั้ง 11-12 มีนาคม นี้ณ ลานประเสริฐแลนด์ เชียงใหม่ ที่เดิม!', '', 'Chiangmai', 'ลานประเสริฐแลนด์ เชียงใหม่', NULL, 'One Day', 'opened'),
(33, 'NORTH FEST 2017 THE OASIS', 'North Fest กลับมาระเบิดมันอีกครั้ง 11-12 มีนาคม นี้ณ ลานประเสริฐแลนด์ เชียงใหม่ ที่เดิม!', '', 'Chiangmai', 'ลานประเสริฐแลนด์ เชียงใหม่', NULL, 'One Day', 'opened');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_itinerary`
--

CREATE TABLE IF NOT EXISTS `tbl_itinerary` (
  `itinerary_id` int(11) NOT NULL,
  `activity_id` int(11) DEFAULT NULL,
  `times` time DEFAULT NULL,
  `itinerary_desc` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_photo_activity`
--

CREATE TABLE IF NOT EXISTS `tbl_photo_activity` (
  `photo_activity_id` int(11) NOT NULL,
  `photo_path` varchar(45) DEFAULT NULL,
  `activity_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_price`
--

CREATE TABLE IF NOT EXISTS `tbl_price` (
  `price_id` int(11) NOT NULL,
  `activity_id` int(11) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `amount` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_price`
--

INSERT INTO `tbl_price` (`price_id`, `activity_id`, `price`, `amount`) VALUES
(1, 1, 500, 1),
(2, 30, 999, 1),
(3, 30, 799, 2),
(6, 32, 999, 1),
(7, 32, 799, 2),
(8, 33, 999, 1),
(9, 33, 799, 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_activity`
--
ALTER TABLE `tbl_activity`
  ADD PRIMARY KEY (`activity_id`);

--
-- Indexes for table `tbl_itinerary`
--
ALTER TABLE `tbl_itinerary`
  ADD PRIMARY KEY (`itinerary_id`),
  ADD KEY `FK_ITINERARY_idx` (`activity_id`);

--
-- Indexes for table `tbl_photo_activity`
--
ALTER TABLE `tbl_photo_activity`
  ADD PRIMARY KEY (`photo_activity_id`),
  ADD KEY `FK_PHOTO_idx` (`activity_id`);

--
-- Indexes for table `tbl_price`
--
ALTER TABLE `tbl_price`
  ADD PRIMARY KEY (`price_id`),
  ADD KEY `FK_PRICE_idx` (`activity_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_activity`
--
ALTER TABLE `tbl_activity`
  MODIFY `activity_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=34;
--
-- AUTO_INCREMENT for table `tbl_itinerary`
--
ALTER TABLE `tbl_itinerary`
  MODIFY `itinerary_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_photo_activity`
--
ALTER TABLE `tbl_photo_activity`
  MODIFY `photo_activity_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_price`
--
ALTER TABLE `tbl_price`
  MODIFY `price_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_itinerary`
--
ALTER TABLE `tbl_itinerary`
  ADD CONSTRAINT `FK_ITINERARY` FOREIGN KEY (`activity_id`) REFERENCES `tbl_activity` (`activity_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `tbl_photo_activity`
--
ALTER TABLE `tbl_photo_activity`
  ADD CONSTRAINT `FK_PHOTO` FOREIGN KEY (`activity_id`) REFERENCES `tbl_activity` (`activity_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `tbl_price`
--
ALTER TABLE `tbl_price`
  ADD CONSTRAINT `FK_PRICE` FOREIGN KEY (`activity_id`) REFERENCES `tbl_activity` (`activity_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
