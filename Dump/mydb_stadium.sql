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
-- Table structure for table `stadium`
--

DROP TABLE IF EXISTS `stadium`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stadium` (
  `Name` varchar(45) NOT NULL,
  `Capacity` varchar(10) DEFAULT NULL,
  `Address` varchar(200) DEFAULT NULL,
  `League Attendence` varchar(200) DEFAULT NULL,
  `Pitch Size` varchar(45) DEFAULT NULL,
  `Building Date` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stadium`
--

LOCK TABLES `stadium` WRITE;
/*!40000 ALTER TABLE `stadium` DISABLE KEYS */;
INSERT INTO `stadium` VALUES (' Anfield','Â 53,394',' Anfield,Â Anfield Road,Â Liverpool,Â L4 0TH','Â 53,292 v AFC Bournemouth (5 April 2017)',' 101m x 68m',' 1884'),(' Brentdford Community Stadium','Â 17,250','Â Brentford Community Stadium, Lionel Road South, Brentford, TW8 0RU','',' 105m x 68m',' 2020'),(' Carrow Road',' 27,359','Â Carrow Road, Norwich, NR1 1JE','',' 104m x 68m',' 1935'),(' Elland Road','Â 37,890','Â Elland Road, Leeds, LS11 0ES','','Â 106m x 69m',' 1897'),(' Emirates Stadium','Â 60,260','Â Highbury House, 75 Drayton Park, London, N5 1BU',' 60,161 v Manchester United (3 November 2007)',' 105m x 68m',' 2006'),(' Etihad Stadium',' 55,017',' Etihad Stadium,Â Etihad Campus,Â Manchester,Â M11 3FF','54,693 v Leicester City (6 February 2016)',' 105m x 68m',' 2002'),(' Ewood Park','Â 31,367','Â Ewood Park, Blackburn, Lancashire, BB2 4JF','','Â 105m x 68m',' 1882'),(' Goodison Park',' 39,221',' Goodison Park,Â Goodison Road,Â Liverpool,Â L4 4EL','40,552 v Liverpool (11 December 2004)',' 100.48m x 68m',' 1892'),(' King Power Stadium','Â 32,273','King Power Stadium, Filbert Way, Leicester, LE2 7FL','','Â 105m x 68m',' 2002'),(' Loftus Road Stadium','Â 18,439','Â Loftus Road Stadium, South Africa Road, London, W12 7PJ','','Â 102m x 66m',' 1904'),(' London Stadium',' 60,000',' London Stadium, Queen Elizabeth Olympic Park, London, E20 2ST',' 59,946 v Arsenal (12 January 2019)',' 105m x 68m',' 2011'),(' Molineux Stadium',' 32,050',' Molineux Stadium, Waterloo Rd, Wolverhampton, WV1 4QR',' 32,322 v Manchester City (25 August 2018)',' 105m x 68m',' 1889'),(' Old Trafford',' 74,879','Â Sir Matt Busby Way, Old Trafford, Manchester,Â M16 0RA',' 76,098 v Blackburn Rovers (31 March 2007)',' 105m x 68m',' 1909'),(' Selhurst Park',' 25,486',' Selhurst Park Stadium,Â Holmesdale Road,Â London,Â SE25 6PU',' 30,115 v Manchester United (21 April 1993)',' 101m x 68m',' 1924'),(' St Mary\'s Stadium',' 32,384',' St Mary\'s Stadium,Â Britannia Road,Â Southampton,Â SO14 5FP',' 32,151 v Arsenal (29 December 2003)',' 105m x 68m',' 2001'),(' St. James\' Park','52,305','Â St. James\' Park, Strawberry Place, Newcastle Upon Tyne, NE1 4ST',' 2,490 v West Ham United (11 November 2012)',' 105m x 68m',' 1892'),(' Stamford Bridge',' 40,853',' Stamford Bridge,Â Fulham Road,Â London,Â SW6 1HS',' 42,332 v Newcastle United (4 December 2004)',' 103m x 67.5m',' 1877'),(' Tottenham Hotspur Stadium','Â 62,062','Â Lilywhite House, 782 High Road, Tottenham, London, N17 0BX','','Â 100m x 67m',' 2019Â '),(' Turf Moor',' 21,944',' Turf Moor, Harry Potts Way, Burnley, Lancashire, BB10 4BX',' 21,870 v Manchester United (24 April 2017)',' 105m x 68m',' 1883'),(' Vicarage Road',' 21,000','Vicarage Road Stadium, Watford, Hertfordshire, WD18 0ER',' 21,590 v Sunderland (27 November 1999)',' 105m x 68m',' 1922'),(' Villa Park','Â 42,682',' Villa Park,Â Trinity Road, Birmingham,Â B6Â 6HE','',' 105m x 68m',' 1897');
/*!40000 ALTER TABLE `stadium` ENABLE KEYS */;
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
