-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: localhost    Database: dbms
-- ------------------------------------------------------
-- Server version	8.0.45

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
-- Table structure for table `booking`
--

DROP TABLE IF EXISTS `booking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booking` (
  `booking_Id` int NOT NULL,
  `room_Id` int DEFAULT NULL,
  `checkindate` date NOT NULL,
  `checkout` date NOT NULL,
  `totalprice` decimal(10,2) NOT NULL,
  PRIMARY KEY (`booking_Id`),
  KEY `room_Id_idx` (`room_Id`),
  CONSTRAINT `room_Id` FOREIGN KEY (`room_Id`) REFERENCES `rooms` (`room_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking`
--

LOCK TABLES `booking` WRITE;
/*!40000 ALTER TABLE `booking` DISABLE KEYS */;
INSERT INTO `booking` VALUES (56493,405,'2026-02-13','2026-02-15',7000.00),(564967,401,'2026-02-14','2026-02-16',10000.00);
/*!40000 ALTER TABLE `booking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `employee_id` int NOT NULL,
  `emp_fname` varchar(100) NOT NULL,
  `emp_lname` varchar(45) NOT NULL,
  `emp_age` int NOT NULL,
  `emp_doj` varchar(50) DEFAULT NULL,
  `emp_phone` int NOT NULL,
  `emp_email` varchar(45) NOT NULL,
  `emp_dep` varchar(100) NOT NULL,
  `emp_salary` decimal(26,2) NOT NULL,
  PRIMARY KEY (`employee_id`),
  UNIQUE KEY `emp_email_UNIQUE` (`emp_email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hotel`
--

DROP TABLE IF EXISTS `hotel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hotel` (
  `hotel_Id` int NOT NULL,
  `hotel_Name` varchar(100) NOT NULL,
  `hotel_Location` varchar(250) NOT NULL,
  `hotel_Description` varchar(300) NOT NULL,
  `hotel_StarRating` varchar(200) NOT NULL,
  `hotel_ContactInfo` varchar(300) NOT NULL,
  `is_open_24_7` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`hotel_Id`),
  UNIQUE KEY `hotel_id_UNIQUE` (`hotel_Id`),
  UNIQUE KEY `hotel_name_UNIQUE` (`hotel_Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hotel`
--

LOCK TABLES `hotel` WRITE;
/*!40000 ALTER TABLE `hotel` DISABLE KEYS */;
INSERT INTO `hotel` VALUES (1033,'Taj-hotel','bez-circle','its-feel-like-home ',' 4-star','tel-556773,taj@13hotel.com',1),(1043,'raj-hotel','near-temple','peacefull-location','3.8-star','tel-789342,raj23@hotel.com',NULL);
/*!40000 ALTER TABLE `hotel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rooms`
--

DROP TABLE IF EXISTS `rooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rooms` (
  `room_Id` int NOT NULL,
  `hotel_Id` int NOT NULL,
  `room_type` varchar(300) NOT NULL,
  `room_price` float NOT NULL,
  `room_availability` varchar(100) NOT NULL,
  `room_Features` varchar(500) NOT NULL,
  PRIMARY KEY (`room_Id`),
  UNIQUE KEY `room_Id_UNIQUE` (`room_Id`),
  UNIQUE KEY `room_type_UNIQUE` (`room_type`),
  KEY `hotel_Id_idx` (`hotel_Id`),
  CONSTRAINT `hotel_Id` FOREIGN KEY (`hotel_Id`) REFERENCES `hotel` (`hotel_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rooms`
--

LOCK TABLES `rooms` WRITE;
/*!40000 ALTER TABLE `rooms` DISABLE KEYS */;
INSERT INTO `rooms` VALUES (401,1033,'suite',5000,'available','Bed-single-king size,Air Conditioning,wi-fi and '),(405,1033,'single',3500.25,'available','Bed-king-size ,wi-fi ,hot water,air conditions,food'),(406,1033,'double',4500.65,'available','Bed-king-size,wi-fi,hot water,air conditioning,food\n,room services ');
/*!40000 ALTER TABLE `rooms` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-02-12 18:05:14
