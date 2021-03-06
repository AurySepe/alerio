CREATE DATABASE  IF NOT EXISTS `alerio` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `alerio`;
-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: localhost    Database: alerio
-- ------------------------------------------------------
-- Server version	8.0.22

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
-- Table structure for table `prodotto`
--

DROP TABLE IF EXISTS `prodotto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prodotto` (
  `codice` int NOT NULL AUTO_INCREMENT,
  `varianti_modello_per_colore` int NOT NULL,
  `taglia` char(1) NOT NULL,
  `quantita` int DEFAULT NULL,
  PRIMARY KEY (`codice`),
  UNIQUE KEY `taglia` (`taglia`,`varianti_modello_per_colore`),
  KEY `varianti_modello_per_colore` (`varianti_modello_per_colore`),
  CONSTRAINT `prodotto_ibfk_1` FOREIGN KEY (`varianti_modello_per_colore`) REFERENCES `varianti_modello_per_colore` (`codice`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `prodotto_chk_1` CHECK ((`taglia` in (_utf8mb4'S',_utf8mb4'M',_utf8mb4'L')))
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prodotto`
--

LOCK TABLES `prodotto` WRITE;
/*!40000 ALTER TABLE `prodotto` DISABLE KEYS */;
INSERT INTO `prodotto` VALUES (1,1,'S',10),(2,1,'M',10),(3,2,'M',30),(4,2,'L',20),(8,3,'S',40),(9,3,'M',30),(10,4,'S',10),(11,4,'M',30),(12,4,'L',20),(13,5,'S',50),(14,6,'S',50),(15,6,'M',30),(16,7,'S',3),(17,7,'M',20),(18,7,'L',3),(19,8,'S',15),(20,9,'S',23),(21,10,'S',15),(22,10,'M',15),(23,11,'M',20),(24,12,'S',10),(25,12,'M',15),(26,13,'S',20),(27,13,'M',10);
/*!40000 ALTER TABLE `prodotto` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-07-05 22:43:23
