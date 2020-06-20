-- MySQL dump 10.13  Distrib 8.0.20, for Win64 (x86_64)
--
-- Host: localhost    Database: saloon
-- ------------------------------------------------------
-- Server version	8.0.20

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
-- Table structure for table `tables`
--

DROP TABLE IF EXISTS `tables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tables` (
  `id` int NOT NULL AUTO_INCREMENT,
  `num` varchar(200) COLLATE utf8_bin NOT NULL,
  `qrcode` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `room_id` int NOT NULL,
  `note` longtext COLLATE utf8_bin,
  `cordx` tinyint DEFAULT NULL,
  `cordy` tinyint DEFAULT NULL,
  `peoplecount` tinyint NOT NULL,
  `smoke` tinyint DEFAULT NULL,
  `active` tinyint NOT NULL,
  `is_delete` tinyint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_rooms_idx` (`room_id`),
  CONSTRAINT `fk_rooms` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='class Tables(models.Model):\n    num = models.CharField(verbose_name=''order number'', max_length=''200'')\n    qrcode = models.CharField(verbose_name=''QR-code'', max_length=''200'', blank=True)\n    room_id = models.ForeignKey(Rooms)\n    note = models.TextField(verbose_name=''describe'', max_length=''2000'', blank=True)\n    cordx = models.IntegerField(verbose_name=''X coordinate'')\n    cordy = models.IntegerField(verbose_name=''Y coordinate'')\n    peoplecount = models.IntegerField(verbose_name=''table capacity'')\n    smoke = models.IntegerField(verbose_name=''smoke table if 1'', max_length=1, default=0)\n    active = models.IntegerField(verbose_name=''active user'', max_length=1, default=1)\n    is_delete = models.IntegerField(verbose_name=''user deleted'', max_length=1, default=0)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tables`
--

LOCK TABLES `tables` WRITE;
/*!40000 ALTER TABLE `tables` DISABLE KEYS */;
/*!40000 ALTER TABLE `tables` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-06-20  5:59:45
