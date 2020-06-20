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
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `login` varchar(200) COLLATE utf8_bin NOT NULL,
  `fullname` varchar(500) COLLATE utf8_bin NOT NULL,
  `email` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `phonenumber` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `note` longtext COLLATE utf8_bin,
  `password` varchar(200) COLLATE utf8_bin NOT NULL,
  `salt` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `email_code` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `phone_code` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `active` tinyint NOT NULL,
  `is_delete` tinyint DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='class Users(models.Model):\n    login = models.CharField(verbose_name=''login'', max_length=''200'')\n    fullname = models.CharField(verbose_name=''full name'', max_length=''500'')\n    email = models.EmailField(verbose_name=''e-mail'', max_length=''200'')\n    phonenumber = models.CharField(verbose_name=''phone number'', max_length=''200'')\n    note = models.TextField(verbose_name=''notes'', max_length=''2000'')\n    password = models.CharField(verbose_name=''password'', max_length=''200'')\n    salt = models.CharField(verbose_name=''salt'', max_length=''200'')\n    email_code = models.CharField(verbose_name=''e-mail confirmation'', max_length=''200'', blank=True)\n    phone_code = models.CharField(verbose_name=''phone confirmation'', max_length=''200'', blank=True)\n    active = models.IntegerField(verbose_name=''active user'', max_length=1, default=1)\n    is_delete = models.IntegerField(verbose_name=''user deleted'', max_length=1, default=0)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
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

-- Dump completed on 2020-06-20  5:59:44
