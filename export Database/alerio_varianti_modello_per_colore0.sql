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
-- Table structure for table `varianti_modello_per_colore`
--

DROP TABLE IF EXISTS `varianti_modello_per_colore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `varianti_modello_per_colore` (
  `codice` int NOT NULL AUTO_INCREMENT,
  `modello_prodotto` int NOT NULL,
  `colore` varchar(30) NOT NULL,
  `in_vendita` tinyint(1) NOT NULL,
  `genere` varchar(20) DEFAULT NULL,
  `prezzo_attuale` double DEFAULT NULL,
  PRIMARY KEY (`codice`),
  UNIQUE KEY `colore` (`colore`,`modello_prodotto`),
  KEY `modello_prodotto` (`modello_prodotto`),
  CONSTRAINT `varianti_modello_per_colore_ibfk_1` FOREIGN KEY (`modello_prodotto`) REFERENCES `modello_prodotto` (`codice`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `varianti_modello_per_colore`
--

LOCK TABLES `varianti_modello_per_colore` WRITE;
/*!40000 ALTER TABLE `varianti_modello_per_colore` DISABLE KEYS */;
INSERT INTO `varianti_modello_per_colore` VALUES (1,1,'oro rosa',1,'Donna',819.672131147541),(2,3,'nero',1,'Uomo',32.78688524590164),(3,4,'rosa',1,'Donna',36.885245901639344),(4,5,'argento e oro',1,'Uomo',327.8688524590164),(5,6,'oro',1,'Donna',31.9672131147541),(6,7,'oro',1,'Donna',81.9672131147541),(7,8,'nero',1,'Uomo',36.885245901639344),(8,9,'bianco',1,'Donna',245.9016393442623),(9,10,'oro giallo',1,'Donna',90.16393442622952),(10,4,'nero',1,'Donna',40.98360655737705),(11,11,'oro',1,'Unisex',409.8360655737705),(12,12,'oro',1,'Unisex',24.59016393442623),(13,1,'blu',1,'Donna',819.672131147541);
/*!40000 ALTER TABLE `varianti_modello_per_colore` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-07-05 22:34:07
