-- MariaDB dump 10.19  Distrib 10.4.19-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: hederaticulture
-- ------------------------------------------------------
-- Server version	10.4.19-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `donation`
--

DROP TABLE IF EXISTS `donation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `donation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reciever_id` varchar(100) DEFAULT NULL,
  `reciever_name` varchar(100) DEFAULT NULL,
  `donor_name` varchar(100) DEFAULT NULL,
  `donor_account_id` varchar(200) DEFAULT NULL,
  `donor_amount` varchar(100) DEFAULT NULL,
  `donor_private_key` varchar(100) DEFAULT NULL,
  `timing` varchar(100) DEFAULT NULL,
  `reciever_account` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `donation`
--

LOCK TABLES `donation` WRITE;
/*!40000 ALTER TABLE `donation` DISABLE KEYS */;
INSERT INTO `donation` VALUES (12,'18','Luke Cool','Ruichard More','0.0.4161416','1000','3030020100300706052b8104000a0422042084c276293c4947a4d19e66d654b870d631c814d3c49cc592c926ca97fba8d117','1682028648','0.0.4303490'),(13,'12','Ted Cannon','Michael Bruce','0.0.4161416','1000','3030020100300706052b8104000a0422042084c276293c4947a4d19e66d654b870d631c814d3c49cc592c926ca97fba8d117','1682028746','0.0.4303490'),(14,'12','Ted Cannon','Rose Good','0.0.4161416','1700','3030020100300706052b8104000a0422042084c276293c4947a4d19e66d654b870d631c814d3c49cc592c926ca97fba8d117','1682028782','0.0.4303490'),(15,'19','Augustine Blessing','Ann Ball','0.0.4161416','500','3030020100300706052b8104000a0422042084c276293c4947a4d19e66d654b870d631c814d3c49cc592c926ca97fba8d117','1682029806','0.0.4303490');
/*!40000 ALTER TABLE `donation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `posts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fullname` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `location` varchar(100) DEFAULT NULL,
  `title` varchar(200) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `amounting` varchar(100) DEFAULT NULL,
  `video_id` varchar(100) DEFAULT NULL,
  `timing` varchar(100) DEFAULT NULL,
  `crypto_accountId` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (12,'Ted Cannon','tedcannon@gmail.com','Michigan, USA','I need  help to fight Wild Fire on My Farm','My name is Ted Cannon from United State, My entire Farm land is under wildfire and I need  financial Help','1000','tIfwQkNMp8Q','1682027025','0.0.4303490'),(18,'Luke Cool','lukeCool@gmail.com','Texas, United State','I need help as my Farm is over run by Flood','My name is Luke Cool from United State, My entire Farm Products is over run by Flood  and I need financial Help','1200','F6VsvDL0Bv8','1682027902','0.0.4303490'),(19,'Augustine Blessing','blessing@gmail.com','Florida, US','My Farm is under Pest Attack. Can Someone Help Me','My name is Augustine Blessing from United State, My entire Farm Products is under pest attack and I need financial Help','5000','nEIpX3bPSlE','1682029733','0.0.4303490');
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'hederaticulture'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-21 14:49:12
