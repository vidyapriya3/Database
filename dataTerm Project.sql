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

/*Data for the table `itemcategory` */

insert  into `itemcategory`(`ID`,`NAME`) values 
(27,'AOB'),
(20,'Beddings'),
(21,'Clothes'),
(19,'Kitchenware');

/*Data for the table `itemgroup` */

insert  into `itemgroup`(`ID`,`GroupName`,`CATEGORY_ID`) values 
(55,'bags','Clothes'),
(67,'balls','AOB'),
(60,'blankets','Beddings'),
(50,'chopping board','Kitchenware'),
(41,'Knives','Kitchenware'),
(28,'Plates','Kitchenware'),
(33,'Spoons','Kitchenware');

/*Data for the table `menuitem` */

insert  into `menuitem`(`ID`,`NAME`,`GROUP_ID`,`BARCODE`,`BUY_PRICE`,`STOCK_AMOUNT`,`PRICE`,`TAX_ID`) values 
(332,'big ball','balls',NULL,200,22,300.00,2),
(295,'hand bag','bags',NULL,250,33,500.00,2),
(240,'kitchen small Knives','Knives',NULL,80,17,120.00,2),
(104,'Line plate','Plates',NULL,125,60,150.00,2),
(276,'proffesional','chopping board',NULL,250,7,350.00,2),
(251,'Serviet holder uniq','Spoons',NULL,400,4,700.00,2),
(313,'soft throw','blankets',NULL,550,10,1000.00,2),
(337,'tenniss','balls',NULL,30,46,50.00,2);

/*Data for the table `sale` */

insert  into `sale`(`ID`,`TransactionNo`,`ItemName`,`CREATE_DATE`,`SETTLED`,`BuyingPrice`,`SellingPrice`,`Units`,`STATUS`,`OWNER_ID`,`tax`,`SaleType`,`Customer`) values 
(186,5,'big ball','2020-04-03 07:20:08','Yes',200.00,300.00,1,NULL,7,0,'Cash Sale',NULL),
(187,6,'kitchen small Knives','2020-04-03 07:26:02','Yes',80.00,120.00,1,NULL,7,0,'Cash Sale',NULL),
(189,8,'proffesional','2020-04-03 07:35:15','Yes',250.00,350.00,1,NULL,7,0,'Cash Sale',NULL),
(190,9,'big ball','2020-04-03 07:38:50','Yes',200.00,300.00,1,NULL,7,0,'Cash Sale',NULL),
(191,10,'Line plate','2020-04-03 07:44:07','Yes',125.00,150.00,1,NULL,7,0,'Cash Sale',NULL),
(192,11,'hand bag','2020-04-03 07:46:12','Yes',250.00,500.00,1,NULL,7,0,'Cash Sale',NULL),
(193,12,'hand bag','2020-04-03 07:48:13','Yes',250.00,500.00,1,NULL,7,0,'Cash Sale',NULL),
(194,13,'soft throw','2020-04-03 07:52:44','Yes',550.00,1000.00,2,NULL,7,0,'Cash Sale',NULL),
(195,14,'tenniss','2020-04-03 08:06:47','Yes',30.00,50.00,1,NULL,7,0,'Cash Sale',NULL),
(196,15,'Serviet holder uniq','2020-04-04 01:53:54','Yes',400.00,700.00,1,NULL,7,0,'Cash Sale',NULL);

/*Data for the table `tax` */

insert  into `tax`(`ID`,`NAME`,`RATE`) values 
(1,'General Rate',16),
(2,'Zero Rated',0),
(3,'Exempted',0);

/*Data for the table `tblbusinessdetails` */

insert  into `tblbusinessdetails`(`NameOfBusiness`,`PostalAdress`,`OfficeContacts`) values 
('BrightMatt','123 Kabarnet','92736353553');

/*Data for the table `tblstaff` */

insert  into `tblstaff`(`EmployeeId`,`Fname`,`Mname`,`Lname`,`NationalD`,`Contacts`,`Title`) values 
(1,'MELLEN','N','NYABERI',1,'0713915303','Ms'),
(7,'NANCY','','MESOCHO',2,'','Ms');

/*Data for the table `tbluser` */

insert  into `tbluser`(`UserName`,`Password`,`Userlevel`,`EmployeeId`) values 
('ngeresa','1111','Administrator',1),
('ongeri','2890','CASHIER',7);

/*Data for the table `user_type` */

insert  into `user_type`(`ID`,`P_NAME`) values 
(1,'Administrator'),
(2,'MANAGER'),
(3,'CASHIER'),
(4,'SR. CASHIER');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
