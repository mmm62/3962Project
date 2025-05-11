-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- 主机： 127.0.0.1:3306
-- 生成日期： 2025-05-11 08:24:50
-- 服务器版本： 8.0.31
-- PHP 版本： 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 数据库： `ai-powered traffic system`
--

-- --------------------------------------------------------

--
-- 表的结构 `admin`
--

DROP TABLE IF EXISTS `admin`;
CREATE TABLE IF NOT EXISTS `admin` (
  `ID` varchar(10) NOT NULL,
  `Priority` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- 表的结构 `aicontroller`
--

DROP TABLE IF EXISTS `aicontroller`;
CREATE TABLE IF NOT EXISTS `aicontroller` (
  `modelVersion` varchar(10) NOT NULL,
  `realTimeData` varchar(10) NOT NULL,
  `optimizationAlgorithm` varchar(10) NOT NULL,
  `Priority` int NOT NULL,
  KEY `fk3` (`optimizationAlgorithm`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- 表的结构 `emergency vehicle`
--

DROP TABLE IF EXISTS `emergency vehicle`;
CREATE TABLE IF NOT EXISTS `emergency vehicle` (
  `CarPlate` varchar(10) NOT NULL,
  `PriorityLevel` int NOT NULL,
  PRIMARY KEY (`CarPlate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- 表的结构 `sensor`
--

DROP TABLE IF EXISTS `sensor`;
CREATE TABLE IF NOT EXISTS `sensor` (
  `ID` varchar(10) NOT NULL,
  `Location` varchar(10) NOT NULL,
  `type` varchar(10) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- 表的结构 `trafficlight`
--

DROP TABLE IF EXISTS `trafficlight`;
CREATE TABLE IF NOT EXISTS `trafficlight` (
  `state` varchar(10) NOT NULL,
  `countdown` int NOT NULL,
  `intersectionID` varchar(10) NOT NULL,
  PRIMARY KEY (`intersectionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- 表的结构 `vehicle`
--

DROP TABLE IF EXISTS `vehicle`;
CREATE TABLE IF NOT EXISTS `vehicle` (
  `speed` float NOT NULL,
  `position` varchar(10) NOT NULL,
  `Carplate` varchar(10) NOT NULL,
  PRIMARY KEY (`Carplate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- 限制导出的表
--

--
-- 限制表 `aicontroller`
--
ALTER TABLE `aicontroller`
  ADD CONSTRAINT `fk1` FOREIGN KEY (`optimizationAlgorithm`) REFERENCES `vehicle` (`Carplate`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `fk2` FOREIGN KEY (`optimizationAlgorithm`) REFERENCES `sensor` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `fk3` FOREIGN KEY (`optimizationAlgorithm`) REFERENCES `trafficlight` (`intersectionID`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- 限制表 `emergency vehicle`
--
ALTER TABLE `emergency vehicle`
  ADD CONSTRAINT `emergency vehicle_ibfk_1` FOREIGN KEY (`CarPlate`) REFERENCES `vehicle` (`Carplate`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
