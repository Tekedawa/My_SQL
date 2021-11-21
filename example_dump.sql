-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: localhost    Database: example
-- ------------------------------------------------------
-- Server version	8.0.26

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Kayden'),(2,'Beulah'),(3,'Sierra'),(4,'Else'),(5,'Davonte'),(6,'Lora'),(7,'Chasity'),(8,'Stan'),(9,'Julie'),(10,'Elian'),(11,'Cedrick'),(12,'Grayson'),(13,'Gladys'),(14,'Leonor'),(15,'Solon'),(16,'Newton'),(17,'Rhiannon'),(18,'Rebekah'),(19,'Tyreek'),(20,'Wallace'),(21,'Rubye'),(22,'Leland'),(23,'Winnifred'),(24,'Everette'),(25,'Merle'),(26,'Fausto'),(27,'Nia'),(28,'Jessica'),(29,'Bruce'),(30,'Jenifer'),(31,'Salvador'),(32,'Linnea'),(33,'Cristopher'),(34,'Leonie'),(35,'Malika'),(36,'Issac'),(37,'Zaria'),(38,'Ottilie'),(39,'Nia'),(40,'Dahlia'),(41,'Ursula'),(42,'Ellen'),(43,'Ova'),(44,'Jordyn'),(45,'Scarlett'),(46,'Jean'),(47,'Charity'),(48,'Gideon'),(49,'Cooper'),(50,'Hester'),(51,'Clovis'),(52,'Johnnie'),(53,'Hugh'),(54,'Remington'),(55,'Glenna'),(56,'Reymundo'),(57,'Archibald'),(58,'Destin'),(59,'Kayley'),(60,'Audra'),(61,'Rollin'),(62,'Herta'),(63,'Kaylie'),(64,'Zita'),(65,'Nina'),(66,'Alfonzo'),(67,'Vita'),(68,'Antonetta'),(69,'Fern'),(70,'Nella'),(71,'Mona'),(72,'Travon'),(73,'Buck'),(74,'Freddy'),(75,'Dolly'),(76,'Jamal'),(77,'Haskell'),(78,'Graciela'),(79,'Elvie'),(80,'Giovanni'),(81,'Shakira'),(82,'Carrie'),(83,'Albert'),(84,'Dominique'),(85,'Oceane'),(86,'Hubert'),(87,'Brice'),(88,'Haylie'),(89,'Ambrose'),(90,'Daphnee'),(91,'Glenda'),(92,'Constance'),(93,'Giovanna'),(94,'Allene'),(95,'Lina'),(96,'Koby'),(97,'Lydia'),(98,'Loy'),(99,'Daisha'),(100,'Fletcher');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-10-20 20:52:04
