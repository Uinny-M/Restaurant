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
-- Table structure for table `history_orders_status`
--

DROP TABLE IF EXISTS `history_orders_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `history_orders_status` (
  `id` int NOT NULL AUTO_INCREMENT,
  `orders_sub_status_id` int NOT NULL,
  `date_create` datetime(6) NOT NULL,
  `orders_sub_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fc_orders_sub_status_idx` (`orders_sub_status_id`),
  KEY `fc_from_orders_sub_idx` (`orders_sub_id`),
  CONSTRAINT `fc_from_orders_sub` FOREIGN KEY (`orders_sub_id`) REFERENCES `orders_sub` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fc_orders_sub_status` FOREIGN KEY (`orders_sub_status_id`) REFERENCES `orders_sub_status` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='class HistoryOrdersStatus(models.Model):\n    orders_sub_status_id = models.ForeignKey(OrdersSubStatus)\n    date_create = models.DateTimeField(verbose_name=''date of order creation'')\n    orders_sub_id = models.ForeignKey(OrdersSub)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `history_orders_status`
--

LOCK TABLES `history_orders_status` WRITE;
/*!40000 ALTER TABLE `history_orders_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `history_orders_status` ENABLE KEYS */;
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
