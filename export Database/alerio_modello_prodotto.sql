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
-- Table structure for table `modello_prodotto`
--

DROP TABLE IF EXISTS `modello_prodotto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `modello_prodotto` (
  `codice` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `data_di_aggiunta` date NOT NULL,
  `collezione` varchar(40) NOT NULL,
  `categoria` varchar(40) NOT NULL,
  `informazioni` varchar(100) NOT NULL,
  PRIMARY KEY (`codice`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modello_prodotto`
--

LOCK TABLES `modello_prodotto` WRITE;
/*!40000 ALTER TABLE `modello_prodotto` DISABLE KEYS */;
INSERT INTO `modello_prodotto` VALUES (1,'Anello','2021-06-25','diamante','anello','anello in oro con morganite e diamanti (1.44/14 Carati)'),(3,'Anello','2021-06-25','minimal','anello','L\'acciaio microfuso conferisce un\'insolita veste di trasgressione e sobrietÃ .'),(4,'Tennis','2021-06-25','energia','bracciale','Realizzato in acciaio inox: igienico, resistente alle macchie ai graffi e facile da pulire.'),(5,'Bracciale','2021-06-25','minimal','bracciale','bracciale realizzato in acciaio, oro e brillanti. Diamante 0,005 Carati.'),(6,'nota musicale','2021-06-25','elegance','ciondolo','Ciondolo in oro giallo e zirconi.'),(7,'Mezza-luna','2021-06-25','energia','collana','Collana in oro giallo con zirconi, super fine ed elegante.'),(8,'Collana','2021-06-25','energia','collana','Collana in acciaio 316L con pendente grande a forma di ancora e cristalli Swarovski'),(9,'madre-perla','2021-06-25','elegance','coordinato','collana e orecchini a perno con perle naturali e pietre di zirconia cubica.'),(10,'orecchini-pendente','2021-06-25','elegance','orecchini','Orecchini a cerchio in oro e con pendente in zirconi.'),(11,'Fedi nunziali','2021-07-03','Dante e Beatrice','fedi nunziali','Anelli matrimoniali: fascia in oro (18 kt) e finitura lucida. Incisione laser gratuita.'),(12,'Bracciale-unisex','2021-07-03','minimal','bracciale','Bracciale con cordoncino e croce in argento 925 con cristalli. Ideale per soggetti allergici.');
/*!40000 ALTER TABLE `modello_prodotto` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-07-05 22:43:22
