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
-- Table structure for table `club`
--

DROP TABLE IF EXISTS `club`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `club` (
  `Name` varchar(45) NOT NULL,
  `Stadium_Home_Name` varchar(45) DEFAULT NULL,
  `Website` varchar(200) NOT NULL,
  PRIMARY KEY (`Name`),
  KEY `fk_Club_Stadium1_idx` (`Stadium_Home_Name`),
  CONSTRAINT `fk_Club_Stadium1` FOREIGN KEY (`Stadium_Home_Name`) REFERENCES `stadium` (`Name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `club`
--

LOCK TABLES `club` WRITE;
/*!40000 ALTER TABLE `club` DISABLE KEYS */;
INSERT INTO `club` VALUES ('Arsenal',' Emirates Stadium','https://www.arsenal.com/?utm_source=premier-league-website&utm_campaign=website&utm_medium=link'),('Aston Villa',' Villa Park','https://www.avfc.co.uk?utm_source=premier-league-website&utm_campaign=website&utm_medium=link'),('Blackburn Rovers',' Ewood Park','http://www.facebook.com/1Rovers'),('Brentdford',' Brentdford Community Stadium','https://www.facebook.com/thebantams'),('Burnley',' Turf Moor','http://www.burnleyfootballclub.com/?utm_source=premier-league-website&utm_campaign=website&utm_medium=link'),('Chelsea',' Stamford Bridge','https://www.chelseafc.com/?utm_source=premier-league-website&utm_campaign=website&utm_medium=link?utm_source=premier-league-website&utm_campaign=website&utm_medium=link'),('Crystal Palace',' Selhurst Park','http://www.cpfc.co.uk/?utm_source=premier-league-website&utm_campaign=website&utm_medium=link'),('Everton',' Goodison Park','http://www.evertonfc.com/?utm_source=premier-league-website&utm_campaign=website&utm_medium=link?utm_source=premier-league-website&utm_campaign=website&utm_medium=link'),('Leeds United',' Elland Road','http://www.leedsunited.com?utm_source=premier-league-website&utm_campaign=website&utm_medium=link'),('Leicester City',' King Power Stadium','http://www.lcfc.com/?utm_source=premier-league-website&utm_campaign=website&utm_medium=link'),('Liverpool',' Anfield','http://www.liverpoolfc.com/?utm_source=premier-league-website&utm_campaign=website&utm_medium=link?utm_source=premier-league-website&utm_campaign=website&utm_medium=link'),('Manchester City',' Etihad Stadium','http://www.mancity.com/?utm_source=premier-league-website&utm_campaign=website&utm_medium=link?utm_source=premier-league-website&utm_campaign=website&utm_medium=link'),('Manchester United',' Old Trafford','http://www.manutd.com/?utm_source=premier-league-website&utm_campaign=website&utm_medium=link?utm_source=premier-league-website&utm_campaign=website&utm_medium=link'),('Newcastle United',' St. James\' Park','http://www.nufc.co.uk/?utm_source=premier-league-website&utm_campaign=website&utm_medium=link?utm_source=premier-league-website&utm_campaign=website&utm_medium=link'),('Norwich City',' Carrow Road','http://www.canaries.co.uk?utm_source=premier-league-website&utm_campaign=website&utm_medium=link'),('Sheffield Wednesday',' Loftus Road Stadium','https://www.facebook.com/sheffieldwednesday'),('Southampton',' St Mary\'s Stadium','https://www.southamptonfc.com/?utm_source=premier-league-website&utm_campaign=website&utm_medium=link?utm_source=premier-league-website&utm_campaign=website&utm_medium=link'),('Tottenham Hotspur',' Tottenham Hotspur Stadium','http://www.tottenhamhotspur.com/?utm_source=premier-league-website&utm_campaign=website&utm_medium=link?utm_source=premier-league-website&utm_campaign=website&utm_medium=link'),('Watford',' Vicarage Road','https://www.watfordfc.com/?utm_source=premier-league-website&utm_campaign=website&utm_medium=link?utm_source=premier-league-website&utm_campaign=website&utm_medium=link'),('West Ham United',' London Stadium','http://www.whufc.com/?utm_source=premier-league-website&utm_campaign=website&utm_medium=link?utm_source=premier-league-website&utm_campaign=website&utm_medium=link'),('Wolverhampton Wanderers',' Molineux Stadium','http://www.wolves.co.uk?utm_source=premier-league-website&utm_campaign=website&utm_medium=link');
/*!40000 ALTER TABLE `club` ENABLE KEYS */;
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
