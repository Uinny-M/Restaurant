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
-- Table structure for table `orders_sub`
--

DROP TABLE IF EXISTS `orders_sub`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders_sub` (
  `id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `dish_id` int NOT NULL,
  `status_id` int NOT NULL,
  `date_create` datetime NOT NULL,
  `date_kitchen` datetime DEFAULT NULL,
  `date_end_cook` datetime DEFAULT NULL,
  `date_table` datetime DEFAULT NULL,
  `date_pay` datetime DEFAULT NULL,
  `orderby` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_orders_idx` (`order_id`),
  KEY `fk_dish_idx` (`dish_id`),
  KEY `fk_status_idx` (`status_id`),
  KEY `fk_from_order_status_idx` (`status_id`),
  CONSTRAINT `fk_dish` FOREIGN KEY (`dish_id`) REFERENCES `dish` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_from_order_status` FOREIGN KEY (`status_id`) REFERENCES `order_status` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_orders` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='class OrdersSub(models.Model):\n    order_id = models.ForeignKey(Orders)\n    dish_id = models.ForeignKey(Dish)\n    status_id = models.ForeignKey(OrderStatus)\n    date_create = models.DateTimeField(verbose_name=''date of order creation'')\n    date_kitchen = models.DateTimeField(verbose_name=''date of start cooking'', blank=True)\n    date_end_cook = models.DateTimeField(verbose_name=''date of finish cooking'', blank=True)\n    date_table = models.DateTimeField(verbose_name="date of get to client''s table", blank=True)\n    date_pay = models.DateTimeField(verbose_name=''date of payment'', blank=True)\n    orderby = models.IntegerField(verbose_name=''client priority'', max_length=3, default=0)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders_sub`
--

LOCK TABLES `orders_sub` WRITE;
/*!40000 ALTER TABLE `orders_sub` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders_sub` ENABLE KEYS */;
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
