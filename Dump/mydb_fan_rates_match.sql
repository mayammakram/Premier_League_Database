-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: mydb
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `fan_rates_match`
--

DROP TABLE IF EXISTS `fan_rates_match`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fan_rates_match` (
  `Fan_Username` varchar(45) NOT NULL,
  `Match_Date` varchar(45) NOT NULL,
  `Match_Away_Club_Name` varchar(45) NOT NULL,
  `Match_Home_Club_Name` varchar(45) NOT NULL,
  `Review` varchar(250) DEFAULT NULL,
  `Rating` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`Fan_Username`,`Match_Date`,`Match_Away_Club_Name`,`Match_Home_Club_Name`),
  KEY `fk_Fan_has_Match_Match1_idx` (`Match_Date`,`Match_Away_Club_Name`,`Match_Home_Club_Name`),
  KEY `fk_Fan_has_Match_Fan1_idx` (`Fan_Username`),
  CONSTRAINT `fk_Fan_has_Match_Fan1` FOREIGN KEY (`Fan_Username`) REFERENCES `fan` (`Username`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Fan_has_Match_Match1` FOREIGN KEY (`Match_Date`, `Match_Away_Club_Name`, `Match_Home_Club_Name`) REFERENCES `match` (`Date`, `Away_Club_Name`, `Home_Club_Name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fan_rates_match`
--

LOCK TABLES `fan_rates_match` WRITE;
/*!40000 ALTER TABLE `fan_rates_match` DISABLE KEYS */;
INSERT INTO `fan_rates_match` VALUES ('mayamakram','12/10/2020','Liverpool','Chelsea','AMAZINGGG GAME!!!','9');
/*!40000 ALTER TABLE `fan_rates_match` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-09 21:14:06
