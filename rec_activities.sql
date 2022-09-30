CREATE DATABASE  IF NOT EXISTS `rec_activities` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `rec_activities`;
-- MySQL dump 10.13  Distrib 8.0.29, for Linux (x86_64)
--
-- Host: localhost    Database: rec_activities
-- ------------------------------------------------------
-- Server version	8.0.29-0ubuntu0.20.04.3

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Activities`
--

DROP TABLE IF EXISTS `Activities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Activities` (
  `ActivityName` varchar(225) NOT NULL,
  `Department` varchar(225) DEFAULT NULL,
  `MaxRegistrants` int DEFAULT NULL,
  `Cost` int DEFAULT NULL,
  `Date` date DEFAULT NULL,
  PRIMARY KEY (`ActivityName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Activities`
--

LOCK TABLES `Activities` WRITE;
/*!40000 ALTER TABLE `Activities` DISABLE KEYS */;
INSERT INTO `Activities` VALUES ('Basketball','Adults Program',15,35,'2022-10-10'),('Beach Volleyball','Adults Program',20,20,'2022-08-11'),('Canoe','Aqua Athletics',15,35,'2022-07-10'),('Football','Adults Program',35,40,'2022-06-11'),('Guitar','Adults Program',30,25,'2022-06-12'),('Music','Adults Program',30,25,'2022-06-10'),('Painting','Adults Program',15,40,'2022-09-15'),('Soccer','Adults Program',20,25,'2022-09-01'),('Swim','Aqua Athletics',30,25,'2022-09-10'),('Ukulele','Adults Program',30,25,'2022-06-30'),('Yoga','Adults Program',30,25,'2022-08-10');
/*!40000 ALTER TABLE `Activities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ActivityCertification`
--

DROP TABLE IF EXISTS `ActivityCertification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ActivityCertification` (
  `InsAccountID` int DEFAULT NULL,
  `ActivityName` varchar(50) DEFAULT NULL,
  `CertificationName` varchar(50) DEFAULT NULL,
  `DateObtained` date DEFAULT NULL,
  UNIQUE KEY `InsAccountID` (`InsAccountID`),
  UNIQUE KEY `ActivityName` (`ActivityName`),
  UNIQUE KEY `CertificationName` (`CertificationName`),
  UNIQUE KEY `DateObtained` (`DateObtained`),
  KEY `CertificationName_2` (`CertificationName`,`DateObtained`),
  CONSTRAINT `ActivityCertification_ibfk_1` FOREIGN KEY (`ActivityName`) REFERENCES `Activities` (`ActivityName`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ActivityCertification_ibfk_2` FOREIGN KEY (`InsAccountID`) REFERENCES `Instructor` (`AccountID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ActivityCertification_ibfk_3` FOREIGN KEY (`CertificationName`, `DateObtained`) REFERENCES `Certifications` (`CertificationName`, `DateObtained`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ActivityCertification`
--

LOCK TABLES `ActivityCertification` WRITE;
/*!40000 ALTER TABLE `ActivityCertification` DISABLE KEYS */;
INSERT INTO `ActivityCertification` VALUES (115877,'Basketball','NCCP','2022-01-01'),(415792,'Swim','ICF','2022-01-02'),(308914,'Yoga','OFA','2022-01-03'),(839446,'Canoe','OFA2','2022-01-04'),(132182,'Music','OFA3','2022-01-05');
/*!40000 ALTER TABLE `ActivityCertification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Activity_Indoor`
--

DROP TABLE IF EXISTS `Activity_Indoor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Activity_Indoor` (
  `ActivityName` varchar(50) DEFAULT NULL,
  `RoomNumber` varchar(10) DEFAULT NULL,
  `BuildingName` varchar(50) DEFAULT NULL,
  UNIQUE KEY `ActivityName` (`ActivityName`),
  UNIQUE KEY `RoomNumber` (`RoomNumber`),
  KEY `RoomNumber_2` (`RoomNumber`,`BuildingName`),
  CONSTRAINT `Activity_Indoor_ibfk_1` FOREIGN KEY (`ActivityName`) REFERENCES `Activities` (`ActivityName`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Activity_Indoor_ibfk_2` FOREIGN KEY (`RoomNumber`, `BuildingName`) REFERENCES `IndoorLocation` (`RoomNumber`, `BuildingName`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Activity_Indoor`
--

LOCK TABLES `Activity_Indoor` WRITE;
/*!40000 ALTER TABLE `Activity_Indoor` DISABLE KEYS */;
INSERT INTO `Activity_Indoor` VALUES ('Basketball','A01','Sunnyslope Centre'),('Football','B12','Sunnyslope Centre'),('Ukulele','C11','Sunnyslope Centre'),('Yoga','D22','Sunnyslope Centre'),('Guitar','E10','Sunnyslope Centre'),('Painting','P33','MoonlightSlope Center');
/*!40000 ALTER TABLE `Activity_Indoor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Activity_Outdoor`
--

DROP TABLE IF EXISTS `Activity_Outdoor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Activity_Outdoor` (
  `ActivityName` varchar(50) DEFAULT NULL,
  `FieldName` varchar(50) DEFAULT NULL,
  `FieldNumber` varchar(50) DEFAULT NULL,
  UNIQUE KEY `ActivityName` (`ActivityName`),
  UNIQUE KEY `FieldNumber` (`FieldNumber`),
  KEY `FieldName_2` (`FieldName`,`FieldNumber`),
  CONSTRAINT `Activity_Outdoor_ibfk_1` FOREIGN KEY (`ActivityName`) REFERENCES `Activities` (`ActivityName`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Activity_Outdoor_ibfk_2` FOREIGN KEY (`FieldName`, `FieldNumber`) REFERENCES `OutdoorLocation` (`FieldName`, `FieldNumber`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Activity_Outdoor`
--

LOCK TABLES `Activity_Outdoor` WRITE;
/*!40000 ALTER TABLE `Activity_Outdoor` DISABLE KEYS */;
INSERT INTO `Activity_Outdoor` VALUES ('Basketball','Oak Valley','A01'),('Football','Oak Valley','B12'),('Canoe','Oak Valley','C11'),('Yoga','Oak Valley','D22'),('Beach Volleyball','Oak Valley','E10'),('Soccer','Elm Valley','F11');
/*!40000 ALTER TABLE `Activity_Outdoor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Admin`
--

DROP TABLE IF EXISTS `Admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Admin` (
  `AccountID` int NOT NULL,
  `FullName` varchar(225) DEFAULT NULL,
  `AdminName` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`AccountID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Admin`
--

LOCK TABLES `Admin` WRITE;
/*!40000 ALTER TABLE `Admin` DISABLE KEYS */;
INSERT INTO `Admin` VALUES (187554,'Maxwell Hubert','Admin_MH'),(314055,'Augusta Judd','Admin_AJ'),(362716,'Bud Samson','Admin_BS'),(423923,'Kristal Lamb','Admin_KL'),(703518,'Irene Ayers','Admin_IA');
/*!40000 ALTER TABLE `Admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Adults`
--

DROP TABLE IF EXISTS `Adults`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Adults` (
  `AccountID` int NOT NULL,
  `FullName` varchar(50) DEFAULT NULL,
  `ServiceCardNumber` int DEFAULT NULL,
  PRIMARY KEY (`AccountID`),
  UNIQUE KEY `AccountID` (`AccountID`),
  UNIQUE KEY `AccountID_2` (`AccountID`,`ServiceCardNumber`,`FullName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Adults`
--

LOCK TABLES `Adults` WRITE;
/*!40000 ALTER TABLE `Adults` DISABLE KEYS */;
INSERT INTO `Adults` VALUES (198547,'Kris West',1368893430),(331474,'Elnora Garey',1666852085),(521729,'Francois Booth',1725476070),(585209,'Harry Hoggard',1268376978),(755723,'Marcelle Barret',1162227226);
/*!40000 ALTER TABLE `Adults` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AdultsInfo`
--

DROP TABLE IF EXISTS `AdultsInfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AdultsInfo` (
  `AccountID` int DEFAULT NULL,
  `ServiceCardNumber` int DEFAULT NULL,
  `FullName` varchar(50) DEFAULT NULL,
  `MedicalRecord` varchar(50) DEFAULT NULL,
  `Phone` int DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `Address` varchar(50) DEFAULT NULL,
  UNIQUE KEY `AccountID` (`AccountID`),
  UNIQUE KEY `ServiceCardNumber` (`ServiceCardNumber`),
  UNIQUE KEY `FullName` (`FullName`),
  KEY `AccountID_2` (`AccountID`,`ServiceCardNumber`,`FullName`),
  CONSTRAINT `AdultsInfo_ibfk_1` FOREIGN KEY (`AccountID`, `ServiceCardNumber`, `FullName`) REFERENCES `Adults` (`AccountID`, `ServiceCardNumber`, `FullName`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AdultsInfo`
--

LOCK TABLES `AdultsInfo` WRITE;
/*!40000 ALTER TABLE `AdultsInfo` DISABLE KEYS */;
INSERT INTO `AdultsInfo` VALUES (331474,1666852085,'Elnora Garey','Asthma, Peanut Allergy',7788618,'mosses@yahoo.ca','792 Silver Spear Road'),(585209,1268376978,'Harry Hoggard',NULL,6904513,'ninenine@mac.com','8853 Roberts Court'),(198547,1368893430,'Kris West','Nut Allergy, Gluten and Dairy',9584655,'6583tellremote@gmail.com','8515 Heather Avenue'),(521729,1725476070,'Francois Booth',NULL,3904437,'cloud97double@hotmail.com','168 Jefferson Street'),(755723,1162227226,'Marcelle Barret','Low Blood Pressure',7176435,'letsride_71@yahoo.ca','30 Fairview Drive');
/*!40000 ALTER TABLE `AdultsInfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Adults_Enrolls`
--

DROP TABLE IF EXISTS `Adults_Enrolls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Adults_Enrolls` (
  `AccountID` int NOT NULL,
  `ActivityName` varchar(50) NOT NULL,
  PRIMARY KEY (`AccountID`,`ActivityName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Adults_Enrolls`
--

LOCK TABLES `Adults_Enrolls` WRITE;
/*!40000 ALTER TABLE `Adults_Enrolls` DISABLE KEYS */;
INSERT INTO `Adults_Enrolls` VALUES (198547,'Basketball'),(198547,'Beach Volleyball'),(198547,'Canoe'),(198547,'Football'),(198547,'Guitar'),(198547,'Music'),(198547,'Painting'),(198547,'Soccer'),(198547,'Swim'),(198547,'Ukulele'),(198547,'Yoga'),(331474,'Basketball'),(521729,'Canoe'),(585209,'Swim'),(755723,'Basketball');
/*!40000 ALTER TABLE `Adults_Enrolls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Adults_REQUIRES`
--

DROP TABLE IF EXISTS `Adults_REQUIRES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Adults_REQUIRES` (
  `AccountID` int DEFAULT NULL,
  `WaiverType` varchar(50) DEFAULT NULL,
  `WaiverName` varchar(50) DEFAULT NULL,
  `ActivityName` varchar(50) DEFAULT NULL,
  UNIQUE KEY `AccountID` (`AccountID`),
  UNIQUE KEY `ActivityName` (`ActivityName`),
  CONSTRAINT `Adults_REQUIRES_ibfk_1` FOREIGN KEY (`AccountID`) REFERENCES `Adults` (`AccountID`) ON DELETE CASCADE,
  CONSTRAINT `Adults_REQUIRES_ibfk_2` FOREIGN KEY (`ActivityName`) REFERENCES `Activities` (`ActivityName`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Adults_REQUIRES`
--

LOCK TABLES `Adults_REQUIRES` WRITE;
/*!40000 ALTER TABLE `Adults_REQUIRES` DISABLE KEYS */;
INSERT INTO `Adults_REQUIRES` VALUES (331474,'Program Waiver Form','Medicare Waiver','Basketball'),(585209,'Program Waiver Form','Medicare Waiver','Swim'),(198547,'Program Waiver Form','Medicare Waiver','Yoga'),(521729,'Program Waiver Form','Medicare Waiver','Canoe'),(755723,'Program Waiver Form','Medicare Waiver','Music');
/*!40000 ALTER TABLE `Adults_REQUIRES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Adults_Signs_Waivers`
--

DROP TABLE IF EXISTS `Adults_Signs_Waivers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Adults_Signs_Waivers` (
  `AccountID` int DEFAULT NULL,
  `WaiverName` varchar(30) NOT NULL,
  `WaiverType` varchar(30) NOT NULL,
  `DateSigned` date DEFAULT NULL,
  PRIMARY KEY (`WaiverName`,`WaiverType`),
  UNIQUE KEY `AccountID` (`AccountID`),
  CONSTRAINT `Adults_Signs_Waivers_ibfk_1` FOREIGN KEY (`AccountID`) REFERENCES `Adults` (`AccountID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Adults_Signs_Waivers`
--

LOCK TABLES `Adults_Signs_Waivers` WRITE;
/*!40000 ALTER TABLE `Adults_Signs_Waivers` DISABLE KEYS */;
INSERT INTO `Adults_Signs_Waivers` VALUES (331474,'Medicare Waiver','Program Waiver Form-1','2022-06-30'),(585209,'Medicare Waiver','Program Waiver Form-2','2022-06-11'),(198547,'Medicare Waiver','Program Waiver Form-3','2022-06-13'),(521729,'Medicare Waiver','Program Waiver Form-4','2022-06-22'),(755723,'Medicare Waiver','Program Waiver Form-5','2022-06-25');
/*!40000 ALTER TABLE `Adults_Signs_Waivers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Certifications`
--

DROP TABLE IF EXISTS `Certifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Certifications` (
  `CertificationName` varchar(225) NOT NULL,
  `DateObtained` date NOT NULL,
  `Expiry` date DEFAULT NULL,
  PRIMARY KEY (`CertificationName`,`DateObtained`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Certifications`
--

LOCK TABLES `Certifications` WRITE;
/*!40000 ALTER TABLE `Certifications` DISABLE KEYS */;
INSERT INTO `Certifications` VALUES ('ICF','2022-01-02','2025-01-02'),('NCCP','2022-01-01','2025-01-01'),('OFA','2022-01-03','2025-01-03'),('OFA2','2022-01-04','2025-01-04'),('OFA3','2022-01-05','2022-01-05');
/*!40000 ALTER TABLE `Certifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Employee`
--

DROP TABLE IF EXISTS `Employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Employee` (
  `AccountID` int NOT NULL,
  `FullName` varchar(50) DEFAULT NULL,
  `Department` varchar(50) NOT NULL,
  PRIMARY KEY (`AccountID`,`Department`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Employee`
--

LOCK TABLES `Employee` WRITE;
/*!40000 ALTER TABLE `Employee` DISABLE KEYS */;
INSERT INTO `Employee` VALUES (192402,'Lena Pryor','Adults Program'),(378206,'Marnie Hendry','Maintenance'),(501234,'Tasha Lamarre','Outside Athletics'),(627535,'Sophia Westbrook','Maintenance'),(947935,'Reg Tipton','Aqua Athletics');
/*!40000 ALTER TABLE `Employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Equipment`
--

DROP TABLE IF EXISTS `Equipment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Equipment` (
  `EquipmentSetID` int NOT NULL,
  `EquipmentType` varchar(225) DEFAULT NULL,
  `EquipmentSetName` varchar(225) DEFAULT NULL,
  `NumberOfSets` int DEFAULT NULL,
  PRIMARY KEY (`EquipmentSetID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Equipment`
--

LOCK TABLES `Equipment` WRITE;
/*!40000 ALTER TABLE `Equipment` DISABLE KEYS */;
INSERT INTO `Equipment` VALUES (13,'Ukulele','Ukulele and Cover',3),(100,'Guitar','Guitar and Strap',3),(1010,'Basketball','Coaching Set',2),(1012,'Basketball','Cart of Basketball (Women)',2),(2213,'Canoe','Two Person Canoe',2);
/*!40000 ALTER TABLE `Equipment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Given_ParkingPass`
--

DROP TABLE IF EXISTS `Given_ParkingPass`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Given_ParkingPass` (
  `AccountID` int DEFAULT NULL,
  `DriversLicenceID` int DEFAULT NULL,
  `LicencePlateNumber` varchar(10) DEFAULT NULL,
  UNIQUE KEY `AccountID` (`AccountID`),
  UNIQUE KEY `DriversLicenceID` (`DriversLicenceID`),
  UNIQUE KEY `LicencePlateNumber` (`LicencePlateNumber`),
  KEY `DriversLicenceID_2` (`DriversLicenceID`,`LicencePlateNumber`),
  CONSTRAINT `Given_ParkingPass_ibfk_1` FOREIGN KEY (`AccountID`) REFERENCES `Employee` (`AccountID`) ON DELETE CASCADE,
  CONSTRAINT `Given_ParkingPass_ibfk_2` FOREIGN KEY (`DriversLicenceID`, `LicencePlateNumber`) REFERENCES `ParkingPass` (`DriversLicenceID`, `LicencePlateNumber`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Given_ParkingPass`
--

LOCK TABLES `Given_ParkingPass` WRITE;
/*!40000 ALTER TABLE `Given_ParkingPass` DISABLE KEYS */;
INSERT INTO `Given_ParkingPass` VALUES (192402,3848599,'sd023k'),(378206,9948775,'ee297j'),(501234,7456784,'apr34i'),(627535,5484775,'ej388d'),(947935,9863984,'m8t33y');
/*!40000 ALTER TABLE `Given_ParkingPass` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Has_AdminAccess`
--

DROP TABLE IF EXISTS `Has_AdminAccess`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Has_AdminAccess` (
  `Admin_AccountID` int NOT NULL,
  `Admin_AccessLevel` int NOT NULL,
  `AccountID` int DEFAULT NULL,
  `AccessLevel` int DEFAULT NULL,
  PRIMARY KEY (`Admin_AccountID`,`Admin_AccessLevel`),
  UNIQUE KEY `AccountID` (`AccountID`),
  KEY `AccountID_2` (`AccountID`,`AccessLevel`),
  CONSTRAINT `Has_AdminAccess_ibfk_1` FOREIGN KEY (`AccountID`, `AccessLevel`) REFERENCES `OnlineAccounts` (`AccountID`, `AccessLevel`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Has_AdminAccess`
--

LOCK TABLES `Has_AdminAccess` WRITE;
/*!40000 ALTER TABLE `Has_AdminAccess` DISABLE KEYS */;
INSERT INTO `Has_AdminAccess` VALUES (703518,4,198547,1),(314055,4,331474,1),(423923,4,521729,1),(187554,4,585209,1),(362716,4,755723,1);
/*!40000 ALTER TABLE `Has_AdminAccess` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IndoorLocation`
--

DROP TABLE IF EXISTS `IndoorLocation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `IndoorLocation` (
  `RoomNumber` varchar(10) NOT NULL,
  `BuildingName` varchar(225) NOT NULL,
  `Address` varchar(225) DEFAULT NULL,
  PRIMARY KEY (`RoomNumber`,`BuildingName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IndoorLocation`
--

LOCK TABLES `IndoorLocation` WRITE;
/*!40000 ALTER TABLE `IndoorLocation` DISABLE KEYS */;
INSERT INTO `IndoorLocation` VALUES ('A01','Sunnyslope Centre','205 Sunnyslope Drive'),('B12','Sunnyslope Centre','205 Sunnyslope Drive'),('C11','Sunnyslope Centre','205 Sunnyslope Drive'),('D22','Sunnyslope Centre','205 Sunnyslope Drive'),('E10','Sunnyslope Centre','205 Sunnyslope Drive'),('P33','MoonlightSlope Center','502 Moonlightslope Drive');
/*!40000 ALTER TABLE `IndoorLocation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Instructor`
--

DROP TABLE IF EXISTS `Instructor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Instructor` (
  `AccountID` int NOT NULL,
  `FullName` varchar(225) DEFAULT NULL,
  `ActivityType` varchar(225) DEFAULT NULL,
  PRIMARY KEY (`AccountID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Instructor`
--

LOCK TABLES `Instructor` WRITE;
/*!40000 ALTER TABLE `Instructor` DISABLE KEYS */;
INSERT INTO `Instructor` VALUES (115877,'Everett Dupuis','Basketball'),(132182,'Matthias Elmer','Music'),(308914,'Cy Hibbert','Yoga'),(415792,'Florry Renard','Swim/Lifeguard'),(839446,'Victoire Beaulieu','Youth Leader');
/*!40000 ALTER TABLE `Instructor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Minors`
--

DROP TABLE IF EXISTS `Minors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Minors` (
  `AccountID` int NOT NULL,
  `FullName` varchar(50) DEFAULT NULL,
  `GuardianName` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`AccountID`),
  UNIQUE KEY `AccountID` (`AccountID`,`FullName`),
  UNIQUE KEY `AccountID_2` (`AccountID`,`FullName`,`GuardianName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Minors`
--

LOCK TABLES `Minors` WRITE;
/*!40000 ALTER TABLE `Minors` DISABLE KEYS */;
INSERT INTO `Minors` VALUES (145654,'Mitchell Dannel','Harry Hoggard'),(149877,'Oliver McKinley','Kris West'),(388753,'Andie Hawthorne','Elnora Garey'),(782613,'Rudy Hale','Marcelle Barret'),(790957,'Matilda Seabrooke','Francois Booth');
/*!40000 ALTER TABLE `Minors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MinorsInfo`
--

DROP TABLE IF EXISTS `MinorsInfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `MinorsInfo` (
  `AccountID` int DEFAULT NULL,
  `GuardianName` varchar(50) DEFAULT NULL,
  `FullName` varchar(50) DEFAULT NULL,
  `MedicalRecord` varchar(50) DEFAULT NULL,
  `Phone` int DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `Address` varchar(50) DEFAULT NULL,
  UNIQUE KEY `AccountID` (`AccountID`),
  UNIQUE KEY `GuardianName` (`GuardianName`),
  UNIQUE KEY `FullName` (`FullName`),
  KEY `AccountID_2` (`AccountID`,`FullName`,`GuardianName`),
  CONSTRAINT `MinorsInfo_ibfk_1` FOREIGN KEY (`AccountID`, `FullName`, `GuardianName`) REFERENCES `Minors` (`AccountID`, `FullName`, `GuardianName`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MinorsInfo`
--

LOCK TABLES `MinorsInfo` WRITE;
/*!40000 ALTER TABLE `MinorsInfo` DISABLE KEYS */;
INSERT INTO `MinorsInfo` VALUES (388753,'Elnora Garey','Andie Hawthorne',NULL,7788616,'mosses@yahoo.ca','792 Silver Spear Road'),(145654,'Harry Hoggard','Mitchell Dannel','Epilepsy',6904513,'ninenine@mac.com','8853 Roberts Court'),(149877,'Kris West','Oliver McKinley',NULL,9584655,'6583tellremote@gmail.com','8515 Heather Avenue'),(790957,'Francois Booth','Matilda Seabrooke','Asthma',3904437,'cloud97double@hotmail.com','168 Jefferson Street'),(782613,'Marcelle Barret','Rudy Hale',NULL,7176439,'letride_75@yahoo.ca','3 Fairview Drive');
/*!40000 ALTER TABLE `MinorsInfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Minors_Enrolls`
--

DROP TABLE IF EXISTS `Minors_Enrolls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Minors_Enrolls` (
  `AccountID` int DEFAULT NULL,
  `ActivityName` varchar(50) DEFAULT NULL,
  UNIQUE KEY `AccountID` (`AccountID`),
  UNIQUE KEY `ActivityName` (`ActivityName`),
  CONSTRAINT `Minors_Enrolls_ibfk_1` FOREIGN KEY (`AccountID`) REFERENCES `Minors` (`AccountID`) ON DELETE CASCADE,
  CONSTRAINT `Minors_Enrolls_ibfk_2` FOREIGN KEY (`ActivityName`) REFERENCES `Activities` (`ActivityName`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Minors_Enrolls`
--

LOCK TABLES `Minors_Enrolls` WRITE;
/*!40000 ALTER TABLE `Minors_Enrolls` DISABLE KEYS */;
INSERT INTO `Minors_Enrolls` VALUES (388753,'Basketball'),(145654,'Swim'),(149877,'Yoga'),(790957,'Canoe'),(782613,'Music');
/*!40000 ALTER TABLE `Minors_Enrolls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Minors_REQUIRES`
--

DROP TABLE IF EXISTS `Minors_REQUIRES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Minors_REQUIRES` (
  `AccountID` int DEFAULT NULL,
  `WaiverType` varchar(50) DEFAULT NULL,
  `WaiverName` varchar(50) DEFAULT NULL,
  `ActivityName` varchar(50) DEFAULT NULL,
  UNIQUE KEY `AccountID` (`AccountID`),
  UNIQUE KEY `ActivityName` (`ActivityName`),
  CONSTRAINT `Minors_REQUIRES_ibfk_1` FOREIGN KEY (`AccountID`) REFERENCES `Minors` (`AccountID`) ON DELETE CASCADE,
  CONSTRAINT `Minors_REQUIRES_ibfk_2` FOREIGN KEY (`ActivityName`) REFERENCES `Activities` (`ActivityName`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Minors_REQUIRES`
--

LOCK TABLES `Minors_REQUIRES` WRITE;
/*!40000 ALTER TABLE `Minors_REQUIRES` DISABLE KEYS */;
INSERT INTO `Minors_REQUIRES` VALUES (388753,'Program Support Form','Liability Waiver','Basketball'),(145654,'Program Support Form','Liability Waiver','Swim'),(149877,'Program Support Form','Liability Waiver','Yoga'),(790957,'Program Support Form','Liability Waiver','Canoe'),(782613,'Program Support Form','Liability Waiver','Music');
/*!40000 ALTER TABLE `Minors_REQUIRES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Minors_Signs_Waivers`
--

DROP TABLE IF EXISTS `Minors_Signs_Waivers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Minors_Signs_Waivers` (
  `AccountID` int DEFAULT NULL,
  `WaiverName` varchar(30) NOT NULL,
  `WaiverType` varchar(30) NOT NULL,
  `DateSigned` date DEFAULT NULL,
  PRIMARY KEY (`WaiverName`,`WaiverType`),
  UNIQUE KEY `AccountID` (`AccountID`),
  CONSTRAINT `Minors_Signs_Waivers_ibfk_1` FOREIGN KEY (`AccountID`) REFERENCES `Minors` (`AccountID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Minors_Signs_Waivers`
--

LOCK TABLES `Minors_Signs_Waivers` WRITE;
/*!40000 ALTER TABLE `Minors_Signs_Waivers` DISABLE KEYS */;
INSERT INTO `Minors_Signs_Waivers` VALUES (388753,'Liability Waiver','Program Support Form-1','2022-06-10'),(145654,'Liability Waiver','Program Support Form-2','2022-06-22'),(149877,'Liability Waiver','Program Support Form-3','2022-06-24'),(790957,'Liability Waiver','Program Support Form-4','2022-06-15'),(782613,'Liability Waiver','Program Support Form-5','2022-06-17');
/*!40000 ALTER TABLE `Minors_Signs_Waivers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OnlineAccounts`
--

DROP TABLE IF EXISTS `OnlineAccounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `OnlineAccounts` (
  `AccountID` int NOT NULL,
  `AccessLevel` int NOT NULL,
  `FullName` varchar(225) DEFAULT NULL,
  `Address` varchar(225) DEFAULT NULL,
  `Email` varchar(225) DEFAULT NULL,
  `MedicalRecord` varchar(225) DEFAULT NULL,
  `Phone` int DEFAULT NULL,
  `PaymentInfo` int DEFAULT NULL,
  PRIMARY KEY (`AccountID`,`AccessLevel`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OnlineAccounts`
--

LOCK TABLES `OnlineAccounts` WRITE;
/*!40000 ALTER TABLE `OnlineAccounts` DISABLE KEYS */;
INSERT INTO `OnlineAccounts` VALUES (198547,1,'Kris West','8515 Heather Avenue','6583tellremote@gmail.com','Nut Allergy, Gluten and Dairy',9584655,3333333),(331474,1,'Elnora Garey','792 Silver Spear Road','mosses@yahoo.ca','Asthma, Peanut Allergy',7788618,1111111),(521729,1,'Francois Booth','168 Jefferson Street','cloud97double@hotmail.com',NULL,3904437,4444444),(585209,1,'Harry Hoggard','8853 Roberts Court','ninenine@mac.com',NULL,6904513,2222222),(755723,1,'Marcelle Barret','3 Fairview Drive','letride_75@yahoo.ca','Low Blood Pressure',7176439,5555555);
/*!40000 ALTER TABLE `OnlineAccounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OutdoorLocation`
--

DROP TABLE IF EXISTS `OutdoorLocation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `OutdoorLocation` (
  `FieldName` varchar(10) NOT NULL,
  `FieldNumber` varchar(225) NOT NULL,
  `Address` varchar(225) DEFAULT NULL,
  PRIMARY KEY (`FieldName`,`FieldNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OutdoorLocation`
--

LOCK TABLES `OutdoorLocation` WRITE;
/*!40000 ALTER TABLE `OutdoorLocation` DISABLE KEYS */;
INSERT INTO `OutdoorLocation` VALUES ('Elm Valley','F11','15 Elm Street'),('Oak Valley','A01','51 Oak Valley Street'),('Oak Valley','B12','51 Oak Valley Street'),('Oak Valley','C11','51 Oak Valley Street'),('Oak Valley','D22','51 Oak Valley Street'),('Oak Valley','E10','51 Oak Valley Street');
/*!40000 ALTER TABLE `OutdoorLocation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ParkingPass`
--

DROP TABLE IF EXISTS `ParkingPass`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ParkingPass` (
  `DriversLicenceID` int NOT NULL,
  `LicencePlateNumber` varchar(225) NOT NULL,
  `CarColor` varchar(225) DEFAULT NULL,
  `CarMake` varchar(225) DEFAULT NULL,
  PRIMARY KEY (`DriversLicenceID`,`LicencePlateNumber`),
  UNIQUE KEY `LicensePlateNumber` (`LicencePlateNumber`,`DriversLicenceID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ParkingPass`
--

LOCK TABLES `ParkingPass` WRITE;
/*!40000 ALTER TABLE `ParkingPass` DISABLE KEYS */;
INSERT INTO `ParkingPass` VALUES (1234567,'ab012c','red','Honda'),(2345678,'de012f','yellow','Dodge'),(3456789,'gh012i','blue','Toyota'),(3728594,'xy876i','camo','Honda'),(3848599,'sd023k','white','Ford'),(4567890,'jk012l','white','Hyundai'),(5484775,'ej388d','purple','Toyota'),(5678901,'mn012o','black','Ford'),(7456784,'apr34i','green','Toyota'),(9863984,'m8t33y','brown','BMW'),(9948775,'ee297j','black','Dodge');
/*!40000 ALTER TABLE `ParkingPass` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PaysFor`
--

DROP TABLE IF EXISTS `PaysFor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PaysFor` (
  `AccountID` int NOT NULL,
  `LicencePlateNumber` varchar(10) DEFAULT NULL,
  `DriversLicenceID` int DEFAULT NULL,
  `FullName` varchar(50) DEFAULT NULL,
  `MedicalRecord` varchar(50) DEFAULT NULL,
  `Phone` int DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `Address` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`AccountID`),
  UNIQUE KEY `LicencePlateNumber` (`LicencePlateNumber`),
  UNIQUE KEY `DriversLicenceID` (`DriversLicenceID`),
  KEY `LicencePlateNumber_2` (`LicencePlateNumber`,`DriversLicenceID`),
  CONSTRAINT `PaysFor_ibfk_1` FOREIGN KEY (`LicencePlateNumber`, `DriversLicenceID`) REFERENCES `ParkingPass` (`LicencePlateNumber`, `DriversLicenceID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PaysFor`
--

LOCK TABLES `PaysFor` WRITE;
/*!40000 ALTER TABLE `PaysFor` DISABLE KEYS */;
INSERT INTO `PaysFor` VALUES (198547,'gh012i',3456789,'Kris West','Nut Allergy, Gluten and Dairy',9584655,'6583tellremote@gmail. com','8515 Heather Avenue'),(331474,'ab012c',1234567,'Elnora Garey','Asthma, Peanut Allergy',7788618,'mosses@yahoo. ca','792 Silver Spear Road'),(521729,'jk012l',4567890,'Francois Booth',NULL,3904437,'cloud97double@hotmail. com','168 Jefferson Street'),(585209,'de012f',2345678,'Harry Hoggard',NULL,6904513,'ninenine@mac. com','8853 Roberts Court'),(755723,'mn012o',5678901,'Marcelle Barret','Low Blood Pressure',7176439,'letride_75@yahoo. ca','3 Fairview Drive');
/*!40000 ALTER TABLE `PaysFor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QualifiesFor`
--

DROP TABLE IF EXISTS `QualifiesFor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `QualifiesFor` (
  `AccountID` int DEFAULT NULL,
  `CertificationName` varchar(50) DEFAULT NULL,
  `DateObtained` date DEFAULT NULL,
  UNIQUE KEY `AccountID` (`AccountID`),
  UNIQUE KEY `CertificationName` (`CertificationName`),
  UNIQUE KEY `DateObtained` (`DateObtained`),
  KEY `CertificationName_2` (`CertificationName`,`DateObtained`),
  CONSTRAINT `QualifiesFor_ibfk_1` FOREIGN KEY (`AccountID`) REFERENCES `Instructor` (`AccountID`) ON DELETE CASCADE,
  CONSTRAINT `QualifiesFor_ibfk_2` FOREIGN KEY (`CertificationName`, `DateObtained`) REFERENCES `Certifications` (`CertificationName`, `DateObtained`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QualifiesFor`
--

LOCK TABLES `QualifiesFor` WRITE;
/*!40000 ALTER TABLE `QualifiesFor` DISABLE KEYS */;
INSERT INTO `QualifiesFor` VALUES (115877,'NCCP','2022-01-01'),(415792,'ICF','2022-01-02'),(308914,'OFA','2022-01-03'),(839446,'OFA2','2022-01-04'),(132182,'OFA3','2022-01-05');
/*!40000 ALTER TABLE `QualifiesFor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Supervise`
--

DROP TABLE IF EXISTS `Supervise`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Supervise` (
  `SupAccountID` int DEFAULT NULL,
  `InsAccountID` int DEFAULT NULL,
  `ActivityName` varchar(50) DEFAULT NULL,
  UNIQUE KEY `SupAccountID` (`SupAccountID`),
  UNIQUE KEY `InsAccountID` (`InsAccountID`),
  UNIQUE KEY `ActivityName` (`ActivityName`),
  CONSTRAINT `Supervise_ibfk_1` FOREIGN KEY (`SupAccountID`) REFERENCES `Supervisor` (`AccountID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Supervise`
--

LOCK TABLES `Supervise` WRITE;
/*!40000 ALTER TABLE `Supervise` DISABLE KEYS */;
INSERT INTO `Supervise` VALUES (479247,115877,'Basketball'),(946134,415792,'Swim'),(987497,308914,'Yoga'),(688414,839446,'Canoe'),(832998,132182,'Music');
/*!40000 ALTER TABLE `Supervise` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Supervisor`
--

DROP TABLE IF EXISTS `Supervisor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Supervisor` (
  `AccountID` int NOT NULL,
  `SupFullName` varchar(225) DEFAULT NULL,
  `Department` varchar(225) NOT NULL,
  PRIMARY KEY (`AccountID`,`Department`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Supervisor`
--

LOCK TABLES `Supervisor` WRITE;
/*!40000 ALTER TABLE `Supervisor` DISABLE KEYS */;
INSERT INTO `Supervisor` VALUES (479247,'Suzanne Christinsen','Basketball'),(688414,'Jasmine Botwright','Canoe'),(832998,'Corinna Gatsby','Music'),(946134,'Yolande Paul','Swim'),(987497,'Magdalena Drake','Yoga');
/*!40000 ALTER TABLE `Supervisor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TakesPlace_Indoor`
--

DROP TABLE IF EXISTS `TakesPlace_Indoor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TakesPlace_Indoor` (
  `RoomNumber` varchar(10) DEFAULT NULL,
  `BuildingName` varchar(50) DEFAULT NULL,
  `ActivityName` varchar(50) DEFAULT NULL,
  UNIQUE KEY `RoomNumber` (`RoomNumber`),
  UNIQUE KEY `ActivityName` (`ActivityName`),
  KEY `RoomNumber_2` (`RoomNumber`,`BuildingName`),
  CONSTRAINT `TakesPlace_Indoor_ibfk_1` FOREIGN KEY (`RoomNumber`, `BuildingName`) REFERENCES `IndoorLocation` (`RoomNumber`, `BuildingName`) ON DELETE CASCADE,
  CONSTRAINT `TakesPlace_Indoor_ibfk_2` FOREIGN KEY (`ActivityName`) REFERENCES `Activities` (`ActivityName`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TakesPlace_Indoor`
--

LOCK TABLES `TakesPlace_Indoor` WRITE;
/*!40000 ALTER TABLE `TakesPlace_Indoor` DISABLE KEYS */;
INSERT INTO `TakesPlace_Indoor` VALUES ('A01','Sunnyslope Centre','Basketball'),('B12','Sunnyslope Centre','Yoga'),('C11','Sunnyslope Centre','Ukulele'),('D22','Sunnyslope Centre','Guitar'),('E10','Sunnyslope Centre','Music'),('P33','Moonlightslope Center','Painting');
/*!40000 ALTER TABLE `TakesPlace_Indoor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TakesPlace_Outdoor`
--

DROP TABLE IF EXISTS `TakesPlace_Outdoor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TakesPlace_Outdoor` (
  `FieldName` varchar(50) DEFAULT NULL,
  `FieldNumber` varchar(50) DEFAULT NULL,
  `ActivityName` varchar(50) DEFAULT NULL,
  UNIQUE KEY `FieldNumber` (`FieldNumber`),
  UNIQUE KEY `ActivityName` (`ActivityName`),
  KEY `FieldName_2` (`FieldName`,`FieldNumber`),
  CONSTRAINT `TakesPlace_Outdoor_ibfk_1` FOREIGN KEY (`FieldName`, `FieldNumber`) REFERENCES `OutdoorLocation` (`FieldName`, `FieldNumber`) ON DELETE CASCADE,
  CONSTRAINT `TakesPlace_Outdoor_ibfk_2` FOREIGN KEY (`ActivityName`) REFERENCES `Activities` (`ActivityName`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TakesPlace_Outdoor`
--

LOCK TABLES `TakesPlace_Outdoor` WRITE;
/*!40000 ALTER TABLE `TakesPlace_Outdoor` DISABLE KEYS */;
INSERT INTO `TakesPlace_Outdoor` VALUES ('Oak Valley','A01','Basketball'),('Oak Valley','C11','Yoga'),('Oak Valley','D22','Football'),('Oak Valley','E10','Beach Volleyball'),('Oak Valley','B12','Swim'),('Elm Valley','F11','Soccer');
/*!40000 ALTER TABLE `TakesPlace_Outdoor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Teaches`
--

DROP TABLE IF EXISTS `Teaches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Teaches` (
  `ActivityName` varchar(50) DEFAULT NULL,
  `AccountID` int DEFAULT NULL,
  UNIQUE KEY `ActivityName` (`ActivityName`),
  UNIQUE KEY `AccountID` (`AccountID`),
  CONSTRAINT `Teaches_ibfk_1` FOREIGN KEY (`ActivityName`) REFERENCES `Activities` (`ActivityName`) ON DELETE CASCADE,
  CONSTRAINT `Teaches_ibfk_2` FOREIGN KEY (`AccountID`) REFERENCES `Instructor` (`AccountID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Teaches`
--

LOCK TABLES `Teaches` WRITE;
/*!40000 ALTER TABLE `Teaches` DISABLE KEYS */;
INSERT INTO `Teaches` VALUES ('Basketball',115877),('Swim',415792),('Yoga',308914),('Canoe',839446),('Music',132182);
/*!40000 ALTER TABLE `Teaches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Uses`
--

DROP TABLE IF EXISTS `Uses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Uses` (
  `EquipmentSetID` int DEFAULT NULL,
  `ActivityName` varchar(50) DEFAULT NULL,
  UNIQUE KEY `EquipmentSetID` (`EquipmentSetID`),
  UNIQUE KEY `ActivityName` (`ActivityName`),
  CONSTRAINT `Uses_ibfk_1` FOREIGN KEY (`EquipmentSetID`) REFERENCES `Equipment` (`EquipmentSetID`) ON DELETE CASCADE,
  CONSTRAINT `Uses_ibfk_2` FOREIGN KEY (`ActivityName`) REFERENCES `Activities` (`ActivityName`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Uses`
--

LOCK TABLES `Uses` WRITE;
/*!40000 ALTER TABLE `Uses` DISABLE KEYS */;
INSERT INTO `Uses` VALUES (1012,'Basketball'),(13,'Ukulele'),(100,'Guitar'),(2213,'Canoe'),(1010,'Yoga');
/*!40000 ALTER TABLE `Uses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'rec_activities'
--

--
-- Dumping routines for database 'rec_activities'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-07-26 13:01:55
