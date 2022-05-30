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
-- Table structure for table `match`
--

DROP TABLE IF EXISTS `match`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `match` (
  `Date` varchar(45) NOT NULL,
  `Season` varchar(45) DEFAULT NULL,
  `Away_Club_Name` varchar(45) NOT NULL,
  `Home_Club_Name` varchar(45) NOT NULL,
  `Result T1` int DEFAULT '0',
  `Result T2` int DEFAULT '0',
  `Possession %` varchar(45) DEFAULT '0.0',
  `Yellow Cards` int DEFAULT '0',
  `Shots` int DEFAULT '0',
  `Fouls` int DEFAULT '0',
  `Stadium_Name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Date`,`Away_Club_Name`,`Home_Club_Name`),
  KEY `fk_Match_Stadium1_idx` (`Stadium_Name`),
  KEY `fk_Match_Club1_idx` (`Away_Club_Name`),
  KEY `fk_Match_Club2_idx` (`Home_Club_Name`),
  CONSTRAINT `fk_Match_Club1` FOREIGN KEY (`Away_Club_Name`) REFERENCES `club` (`Name`),
  CONSTRAINT `fk_Match_Club2` FOREIGN KEY (`Home_Club_Name`) REFERENCES `club` (`Name`),
  CONSTRAINT `fk_Match_Stadium1` FOREIGN KEY (`Stadium_Name`) REFERENCES `stadium` (`Name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `match`
--

LOCK TABLES `match` WRITE;
/*!40000 ALTER TABLE `match` DISABLE KEYS */;
INSERT INTO `match` VALUES ('1/1/2018','2018/2019','Manchester United','Southampton',1,0,'74%',1,3,1,' Etihad Stadium'),('1/1/2020','2020/2021','Newcastle United','Leicester City',2,2,'55%',1,4,1,' Carrow Road'),('12/10/2020','2020/2021','Liverpool','Chelsea',2,3,'56%',3,2,4,' Anfield');
/*!40000 ALTER TABLE `match` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-09 22:39:05
