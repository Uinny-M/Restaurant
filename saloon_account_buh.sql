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
-- Table structure for table `account_buh`
--

DROP TABLE IF EXISTS `account_buh`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_buh` (
  `id` int NOT NULL,
  `num` varchar(200) COLLATE utf8_bin NOT NULL,
  `date_create` datetime(6) NOT NULL,
  `summ` decimal(12,2) DEFAULT NULL,
  `active` tinyint NOT NULL,
  `is_delete` tinyint DEFAULT NULL,
  `is_paeid` tinyint DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='class AccountBuh(models.Model):\n    num = models.CharField(verbose_name=''receipt number'', max_length=''200'')\n    date_create = models.DateTimeField(verbose_name=''date of order creation'')\n    summ = models.DecimalField(verbose_name=''payment'', max_digits=12, decimal_places=2, default=0)\n    active = models.IntegerField(verbose_name=''active account'', max_length=1, default=1)\n    is_delete = models.IntegerField(verbose_name=''account was deleted'', max_length=1, default=0)\n    is_paeid = models.IntegerField(verbose_name=''Payment completed if 1'', max_length=1, default=0)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_buh`
--

LOCK TABLES `account_buh` WRITE;
/*!40000 ALTER TABLE `account_buh` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_buh` ENABLE KEYS */;
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
