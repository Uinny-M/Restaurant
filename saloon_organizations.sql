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
-- Table structure for table `organizations`
--

DROP TABLE IF EXISTS `organizations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `organizations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `org_name` varchar(200) COLLATE utf8_bin NOT NULL,
  `inn` varchar(200) COLLATE utf8_bin NOT NULL,
  `kpp` varchar(200) COLLATE utf8_bin NOT NULL,
  `postaddress` varchar(200) COLLATE utf8_bin NOT NULL,
  `factaddress` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `phonenumber` varchar(2000) COLLATE utf8_bin NOT NULL,
  `email` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `contactname` varchar(2000) COLLATE utf8_bin NOT NULL,
  `active` tinyint NOT NULL,
  `is_delete` tinyint DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='class Organizations(models.Model):\n    org_name = models.CharField(verbose_name=''Company name'', max_length=''200'')\n    inn = models.CharField(verbose_name=''Individual tax number'', max_length=''200'')\n    kpp = models.CharField(verbose_name=''КПП'', max_length=''200'')\n    postaddress = models.CharField(verbose_name=''post address'', max_length=''200'')\n    factaddress = models.CharField(verbose_name=''real address'', max_length=''200'', blank=True)\n    phonenumber = models.CharField(verbose_name=''phone number'', max_length=''2000'')\n    email = models.EmailField(verbose_name=''e-mail'', max_length=''200'')\n    contactname = models.CharField(verbose_name=''Контактное лицо'', max_length=''2000'')\n    active = models.IntegerField(verbose_name=''active user'', max_length=1, default=1)\n    is_delete = models.IntegerField(verbose_name=''user deleted'', max_length=1, default=0)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organizations`
--

LOCK TABLES `organizations` WRITE;
/*!40000 ALTER TABLE `organizations` DISABLE KEYS */;
/*!40000 ALTER TABLE `organizations` ENABLE KEYS */;
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
