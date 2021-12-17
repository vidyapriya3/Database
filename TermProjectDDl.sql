/*
SQLyog Enterprise v13.1.1 (32 bit)
MySQL - 8.0.25 : Database - posdb
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`posdb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `posdb`;

/*Table structure for table `itemcategory` */

DROP TABLE IF EXISTS `itemcategory`;

CREATE TABLE `itemcategory` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `NAME` varchar(50) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `NAME` (`NAME`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb3;

/*Table structure for table `itemgroup` */

DROP TABLE IF EXISTS `itemgroup`;

CREATE TABLE `itemgroup` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `GroupName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CATEGORY_ID` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`GroupName`),
  KEY `ID` (`ID`),
  KEY `CATEGORY_ID` (`CATEGORY_ID`),
  CONSTRAINT `itemgroup_ibfk_1` FOREIGN KEY (`CATEGORY_ID`) REFERENCES `itemcategory` (`NAME`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8mb3;

/*Table structure for table `menuitem` */

DROP TABLE IF EXISTS `menuitem`;

CREATE TABLE `menuitem` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `NAME` varchar(50) NOT NULL,
  `GROUP_ID` varchar(50) DEFAULT NULL,
  `BARCODE` varchar(120) DEFAULT NULL,
  `BUY_PRICE` double NOT NULL,
  `STOCK_AMOUNT` double DEFAULT NULL,
  `PRICE` double(10,2) NOT NULL,
  `TAX_ID` int DEFAULT NULL,
  PRIMARY KEY (`NAME`),
  KEY `ID` (`ID`),
  KEY `GROUP_ID` (`GROUP_ID`),
  KEY `TAX_ID` (`TAX_ID`),
  CONSTRAINT `menuitem_ibfk_1` FOREIGN KEY (`GROUP_ID`) REFERENCES `itemgroup` (`GroupName`) ON UPDATE CASCADE,
  CONSTRAINT `menuitem_ibfk_2` FOREIGN KEY (`TAX_ID`) REFERENCES `tax` (`ID`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=647 DEFAULT CHARSET=utf8mb3;

/*Table structure for table `sale` */

DROP TABLE IF EXISTS `sale`;

CREATE TABLE `sale` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `TransactionNo` int NOT NULL,
  `ItemName` varchar(120) DEFAULT NULL,
  `CREATE_DATE` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `SETTLED` enum('Yes','No') DEFAULT 'No',
  `BuyingPrice` double(10,2) DEFAULT NULL,
  `SellingPrice` double(10,2) DEFAULT NULL,
  `Units` int DEFAULT '1',
  `STATUS` varchar(30) DEFAULT NULL,
  `OWNER_ID` int DEFAULT NULL,
  `tax` double DEFAULT NULL,
  `SaleType` enum('Credit Sale','Cash Sale') DEFAULT 'Cash Sale',
  `Customer` text,
  PRIMARY KEY (`ID`),
  KEY `ticketcreateDate` (`CREATE_DATE`),
  KEY `ticketsettled` (`SETTLED`),
  KEY `FK937B5F0CAA075D69` (`OWNER_ID`),
  KEY `ItemName` (`ItemName`),
  CONSTRAINT `sale_ibfk_1` FOREIGN KEY (`ItemName`) REFERENCES `menuitem` (`NAME`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2393 DEFAULT CHARSET=utf8mb3;

/*Table structure for table `tax` */

DROP TABLE IF EXISTS `tax`;

CREATE TABLE `tax` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `NAME` varchar(20) NOT NULL,
  `RATE` double DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

/*Table structure for table `tblbusinessdetails` */

DROP TABLE IF EXISTS `tblbusinessdetails`;

CREATE TABLE `tblbusinessdetails` (
  `NameOfBusiness` varchar(100) NOT NULL,
  `PostalAdress` varchar(100) DEFAULT NULL,
  `OfficeContacts` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`NameOfBusiness`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `tblstaff` */

DROP TABLE IF EXISTS `tblstaff`;

CREATE TABLE `tblstaff` (
  `EmployeeId` int NOT NULL COMMENT 'houses the tsc number of a given teacher in a school',
  `Fname` varchar(50) NOT NULL,
  `Mname` varchar(50) DEFAULT NULL,
  `Lname` varchar(50) NOT NULL,
  `NationalD` int DEFAULT NULL COMMENT 'Houses the National id card number of a guardian of given student',
  `Contacts` varchar(50) DEFAULT NULL,
  `Title` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`EmployeeId`),
  UNIQUE KEY `TscNo` (`EmployeeId`),
  UNIQUE KEY `NationalD` (`NationalD`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `tbluser` */

DROP TABLE IF EXISTS `tbluser`;

CREATE TABLE `tbluser` (
  `UserName` varchar(50) NOT NULL COMMENT 'This is the name used logging into the system',
  `Password` varchar(50) NOT NULL COMMENT 'This is a secret key used logging into the system',
  `Userlevel` enum('Administrator','MANAGER','SR. CASHIER','CASHIER','Waiter','Cook') NOT NULL,
  `EmployeeId` int DEFAULT NULL,
  PRIMARY KEY (`Password`),
  UNIQUE KEY `teacherId_2` (`EmployeeId`),
  CONSTRAINT `tbluser_ibfk_9` FOREIGN KEY (`EmployeeId`) REFERENCES `tblstaff` (`EmployeeId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `user_type` */

DROP TABLE IF EXISTS `user_type`;

CREATE TABLE `user_type` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `P_NAME` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
