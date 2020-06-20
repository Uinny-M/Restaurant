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

--
-- Table structure for table `account_buh_sub`
--

DROP TABLE IF EXISTS `account_buh_sub`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_buh_sub` (
  `id` int NOT NULL AUTO_INCREMENT,
  `account_buh_id` int NOT NULL,
  `orders_sub_id` int NOT NULL,
  `summ` decimal(12,2) NOT NULL,
  `sale` decimal(8,2) NOT NULL,
  `nameofposition` varchar(200) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_from_account_buh_idx` (`account_buh_id`),
  KEY `fk_from_orders_idx` (`orders_sub_id`),
  CONSTRAINT `fk_from_account_buh` FOREIGN KEY (`account_buh_id`) REFERENCES `account_buh` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_from_orders` FOREIGN KEY (`orders_sub_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='class AccountBuhSub(models.Model):\n    account_buh_id = models.ForeignKey(AccountBuh)\n    orders_sub_id = models.ForeignKey(Orders)\n    summ = models.DecimalField(verbose_name=''payment'', max_digits=12, decimal_places=2, default=0)\n    sale = models.DecimalField(verbose_name=''discount'', max_digits=8, decimal_places=2, default=0)\n    nameofposition = models.CharField(verbose_name=''Наименование (на момент продажи)'', max_length=''200'')';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_buh_sub`
--

LOCK TABLES `account_buh_sub` WRITE;
/*!40000 ALTER TABLE `account_buh_sub` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_buh_sub` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accountbuh_cashcheck`
--

DROP TABLE IF EXISTS `accountbuh_cashcheck`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accountbuh_cashcheck` (
  `id` int NOT NULL AUTO_INCREMENT,
  `account_buh_id` int NOT NULL,
  `date_cashcheck` datetime NOT NULL,
  `num_kkm` varchar(200) COLLATE utf8_bin NOT NULL,
  `num_shift` varchar(200) COLLATE utf8_bin NOT NULL,
  `summ` decimal(12,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fc_account_buh_idx` (`account_buh_id`),
  CONSTRAINT `fc_account_buh` FOREIGN KEY (`account_buh_id`) REFERENCES `account_buh` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='class AccountBuhCashcheck(models.Model):\n    account_buh_id = models.ForeignKey(AccountBuh)\n    date_cashcheck = models.DateTimeField(verbose_name=''cash check date'')\n    num_kkm = models.CharField(verbose_name=''KKM number'', max_length=''200'')\n    num_shift = models.CharField(verbose_name=''duty number'', max_length=''200'')\n    summ = models.DecimalField(verbose_name=''payment'', max_digits=12, decimal_places=2, default=0)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accountbuh_cashcheck`
--

LOCK TABLES `accountbuh_cashcheck` WRITE;
/*!40000 ALTER TABLE `accountbuh_cashcheck` DISABLE KEYS */;
/*!40000 ALTER TABLE `accountbuh_cashcheck` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dish`
--

DROP TABLE IF EXISTS `dish`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dish` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8_bin NOT NULL,
  `image` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `note` longtext COLLATE utf8_bin,
  `price` decimal(8,2) NOT NULL,
  `weight_serving` decimal(8,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='class Dish(models.Model):\n    name = models.CharField(verbose_name=''dish name'', max_length=''200'')\n    image = models.ImageField(upload_to=''dish_images'', blank=True)\n    note = models.TextField(verbose_name=''describe'', max_length=''2000'', blank=True)\n    price = models.DecimalField(verbose_name=''price of dish'', max_digits=8, decimal_places=2, default=0)\n    weight_serving = models.IntegerField(verbose_name=''weight of dish'', max_length=4, default=0)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dish`
--

LOCK TABLES `dish` WRITE;
/*!40000 ALTER TABLE `dish` DISABLE KEYS */;
/*!40000 ALTER TABLE `dish` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dish_ingridients`
--

DROP TABLE IF EXISTS `dish_ingridients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dish_ingridients` (
  `id` int NOT NULL AUTO_INCREMENT,
  `dish_id` int NOT NULL,
  `ingridient_id` int NOT NULL,
  `weight_menu` int DEFAULT NULL,
  `weight_recipe` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='class DishIngridients(models.Model):\n    dish_id = models.ForeignKey(Dish)\n    ingridient_id = models.ForeignKey(NutritionalValue)\n    weight_menu = models.IntegerField(verbose_name=''weight after cooking'', max_length=4, default=0)\n    weight_recipe = models.IntegerField(verbose_name=''weight before cooking'', max_length=4, default=0)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dish_ingridients`
--

LOCK TABLES `dish_ingridients` WRITE;
/*!40000 ALTER TABLE `dish_ingridients` DISABLE KEYS */;
/*!40000 ALTER TABLE `dish_ingridients` ENABLE KEYS */;
UNLOCK TABLES;

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

--
-- Table structure for table `nutritional_value`
--

DROP TABLE IF EXISTS `nutritional_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nutritional_value` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8_bin NOT NULL,
  `kkal100` decimal(6,2) DEFAULT NULL,
  `fats100` decimal(6,2) DEFAULT NULL,
  `protein100` decimal(6,2) DEFAULT NULL,
  `carbs100` decimal(6,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='class NutritionalValue(models.Model):\n    name = models.CharField(verbose_name=''dish name'', max_length=''200'')\n    kkal100 = models.DecimalField(verbose_name=''Kilocalories in 100 grams'', max_digits=6, decimal_places=1, default=0)\n    fats100 = models.DecimalField(verbose_name=''Fats in 100 grams'', max_digits=6, decimal_places=1, default=0)\n    protein100 = models.DecimalField(verbose_name=''Proteins in 100 grams'', max_digits=6, decimal_places=1, default=0)\n    carbs100 = models.DecimalField(verbose_name=''Carbonises in 100 grams'', max_digits=6, decimal_places=1, default=0)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nutritional_value`
--

LOCK TABLES `nutritional_value` WRITE;
/*!40000 ALTER TABLE `nutritional_value` DISABLE KEYS */;
/*!40000 ALTER TABLE `nutritional_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_status`
--

DROP TABLE IF EXISTS `order_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_status` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8_bin NOT NULL,
  `short_name` varchar(200) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='class OrderStatus(models.Model):\n    name = models.CharField(verbose_name=''name'', max_length=''200'')\n    short_name = models.CharField(verbose_name=''short name'', max_length=''200'')';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_status`
--

LOCK TABLES `order_status` WRITE;
/*!40000 ALTER TABLE `order_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `num` varchar(200) COLLATE utf8_bin NOT NULL,
  `table_id` int NOT NULL,
  `date_create` datetime NOT NULL,
  `date_close` datetime DEFAULT NULL,
  `peoplecount` tinyint NOT NULL,
  `status_id` int NOT NULL,
  `promocode` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `organization_id` int NOT NULL,
  `user_create_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_id_from_tables_idx` (`table_id`),
  KEY `fk_status_idx` (`status_id`),
  KEY `fk_user_create_id_idx` (`user_create_id`),
  CONSTRAINT `fk_id_from_tables` FOREIGN KEY (`table_id`) REFERENCES `tables` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_status` FOREIGN KEY (`status_id`) REFERENCES `order_status` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_user_create_id` FOREIGN KEY (`user_create_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='class Orders(models.Model):\n    num = models.CharField(verbose_name=''order number'', max_length=''200'')\n    table_id = models.ForeignKey(Tables)\n    date_create = models.DateTimeField(verbose_name=''date of creation'')\n    date_close = models.DateTimeField(verbose_name=''date of creation'', blank=True)\n    peoplecount = models.IntegerField(verbose_name=''number of clients'', max_length=''2'')\n    status_id = models.ForeignKey(OrderStatus)\n    promocode = models.CharField(verbose_name=''promotion code'', max_length=''200'', blank=True)\n    organization_id = models.ForeignKey(Organizations)\n    user_create_id = models.ForeignKey(Users)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

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

--
-- Table structure for table `orders_sub_status`
--

DROP TABLE IF EXISTS `orders_sub_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders_sub_status` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8_bin NOT NULL,
  `short_name` varchar(200) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='class OrdersSubStatus(models.Model):\n    name = models.CharField(verbose_name=''name'', max_length=''200'')\n    short_name = models.CharField(verbose_name=''short name'', max_length=''200'')';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders_sub_status`
--

LOCK TABLES `orders_sub_status` WRITE;
/*!40000 ALTER TABLE `orders_sub_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders_sub_status` ENABLE KEYS */;
UNLOCK TABLES;

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

--
-- Table structure for table `parameters`
--

DROP TABLE IF EXISTS `parameters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `parameters` (
  `id` int NOT NULL AUTO_INCREMENT,
  `parameter` varchar(200) COLLATE utf8_bin NOT NULL,
  `arguments` varchar(200) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='class Parameters(models.Model):\\n    parametr = models.CharField(verbose_name=''parametr'', max_length=''200'')\\n    arguments = models.CharField(verbose_name=''arguments'', max_length=''200'')';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parameters`
--

LOCK TABLES `parameters` WRITE;
/*!40000 ALTER TABLE `parameters` DISABLE KEYS */;
/*!40000 ALTER TABLE `parameters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8_bin NOT NULL,
  `short_name` varchar(200) COLLATE utf8_bin NOT NULL,
  `active` tinyint NOT NULL,
  `is_delete` tinyint DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='class Roles(models.Model):\n    name = models.CharField(verbose_name=''name'', max_length=''200'')\n    short_name = models.CharField(verbose_name=''short name'', max_length=''200'')\n    active = models.IntegerField(verbose_name=''active user'', max_length=1, default=1)\n    is_delete = models.IntegerField(verbose_name=''user deleted'', max_length=1, default=0)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rooms`
--

DROP TABLE IF EXISTS `rooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rooms` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8_bin NOT NULL,
  `note` longtext COLLATE utf8_bin,
  `picture` varchar(2000) COLLATE utf8_bin DEFAULT NULL,
  `peoplecountmax` smallint NOT NULL,
  `seasonplace` tinyint NOT NULL,
  `active` tinyint NOT NULL,
  `is_delete` tinyint DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='class Rooms(models.Model):\n    name = models.CharField(verbose_name=''name of Room'', max_length=''200'')\n    note = models.TextField(verbose_name=''describe'', max_length=''2000'', blank=True)\n    picture = models.CharField(verbose_name=''picture'', max_length=''2000'', blank=True)\n    peoplecountmax = models.IntegerField(verbose_name=''room capacity'')\n    seasonplace = models.IntegerField(verbose_name=''only summer room if 1'', max_length=1, default=2)\n    active = models.IntegerField(verbose_name=''active user'', max_length=1, default=1)\n    is_delete = models.IntegerField(verbose_name=''user deleted'', max_length=1, default=0)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rooms`
--

LOCK TABLES `rooms` WRITE;
/*!40000 ALTER TABLE `rooms` DISABLE KEYS */;
/*!40000 ALTER TABLE `rooms` ENABLE KEYS */;
UNLOCK TABLES;

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

--
-- Table structure for table `users_organizations`
--

DROP TABLE IF EXISTS `users_organizations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_organizations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `organization_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_users_idx` (`user_id`),
  KEY `fk_organizations_idx` (`organization_id`),
  CONSTRAINT `fk_organizations` FOREIGN KEY (`organization_id`) REFERENCES `organizations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='class UsersOrganizations(models.Model):\n    user_id = models.ForeignKey(Users)\n    organization_id = models.ForeignKey(Organizations)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_organizations`
--

LOCK TABLES `users_organizations` WRITE;
/*!40000 ALTER TABLE `users_organizations` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_organizations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_role`
--

DROP TABLE IF EXISTS `users_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_role` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `roles_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_role_idx` (`roles_id`),
  KEY `fk_users_to_users_role_idx` (`user_id`),
  CONSTRAINT `fk_role` FOREIGN KEY (`roles_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_users_to_users_role` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='class UsersRole(models.Model):\n    user_id = models.ForeignKey(Users)\n    roles_id = models.ForeignKey(Roles)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_role`
--

LOCK TABLES `users_role` WRITE;
/*!40000 ALTER TABLE `users_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_role` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-06-20  6:00:14
