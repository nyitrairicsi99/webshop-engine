-- MariaDB dump 10.19  Distrib 10.4.20-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: webshop
-- ------------------------------------------------------
-- Server version	10.4.20-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `2fa_codes`
--

DROP TABLE IF EXISTS `2fa_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `2fa_codes` (
  `id` int(11) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `users_id` int(11) DEFAULT NULL,
  `expiry` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `users_id` (`users_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `2fa_codes`
--

LOCK TABLES `2fa_codes` WRITE;
/*!40000 ALTER TABLE `2fa_codes` DISABLE KEYS */;
/*!40000 ALTER TABLE `2fa_codes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `addresses`
--

DROP TABLE IF EXISTS `addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `addresses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cities_id` int(11) DEFAULT NULL,
  `streets_id` int(11) DEFAULT NULL,
  `house_numbers_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `house_numbers_id` (`house_numbers_id`),
  KEY `streets_id` (`streets_id`),
  KEY `cities_id` (`cities_id`),
  CONSTRAINT `addresses_ibfk_1` FOREIGN KEY (`house_numbers_id`) REFERENCES `house_numbers` (`id`),
  CONSTRAINT `addresses_ibfk_2` FOREIGN KEY (`streets_id`) REFERENCES `streets` (`id`),
  CONSTRAINT `addresses_ibfk_3` FOREIGN KEY (`cities_id`) REFERENCES `cities` (`id`),
  CONSTRAINT `addresses_ibfk_4` FOREIGN KEY (`house_numbers_id`) REFERENCES `house_numbers` (`id`),
  CONSTRAINT `addresses_ibfk_5` FOREIGN KEY (`streets_id`) REFERENCES `streets` (`id`),
  CONSTRAINT `addresses_ibfk_6` FOREIGN KEY (`cities_id`) REFERENCES `cities` (`id`),
  CONSTRAINT `addresses_ibfk_7` FOREIGN KEY (`house_numbers_id`) REFERENCES `house_numbers` (`id`),
  CONSTRAINT `addresses_ibfk_8` FOREIGN KEY (`streets_id`) REFERENCES `streets` (`id`),
  CONSTRAINT `addresses_ibfk_9` FOREIGN KEY (`cities_id`) REFERENCES `cities` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addresses`
--

LOCK TABLES `addresses` WRITE;
/*!40000 ALTER TABLE `addresses` DISABLE KEYS */;
INSERT INTO `addresses` VALUES (1,1,1,1),(2,4,2,2),(3,5,2,2),(4,6,3,3),(5,7,2,2),(6,7,2,4);
/*!40000 ALTER TABLE `addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parentcategory` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `short` varchar(255) DEFAULT NULL,
  `display_navbar` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `parentcategory` (`parentcategory`),
  CONSTRAINT `categories_ibfk_1` FOREIGN KEY (`parentcategory`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,NULL,'Shoes','shoes',1),(2,1,'Boots','boots',1),(3,1,'Sandals','sandals',1),(4,NULL,'Books','books',1),(5,4,'Fantasy','fantasy',1),(6,4,'Horror','horror',1),(7,NULL,'Games','games',1),(8,4,'Action','action',1),(10,7,'Videogame','videogame',1),(11,7,'Table games','tablegames',1);
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cities`
--

DROP TABLE IF EXISTS `cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  `postcodes_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `postcodes_id` (`postcodes_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cities`
--

LOCK TABLES `cities` WRITE;
/*!40000 ALTER TABLE `cities` DISABLE KEYS */;
INSERT INTO `cities` VALUES (1,'P??cs',1),(4,'Edenderry',4),(5,'Edenderry',5),(6,'G??doros',6),(7,'Edenderry',7);
/*!40000 ALTER TABLE `cities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coupons`
--

DROP TABLE IF EXISTS `coupons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coupons` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL,
  `start_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `end_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `discount` int(11) NOT NULL DEFAULT 0,
  `singleuse` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coupons`
--

LOCK TABLES `coupons` WRITE;
/*!40000 ALTER TABLE `coupons` DISABLE KEYS */;
INSERT INTO `coupons` VALUES (1,'CODE01','2022-01-31 16:15:04','2022-01-31 16:15:04',80,0),(2,'CODE02','2022-01-31 15:39:14','2022-01-31 15:39:14',0,1),(3,'CODE03','2022-01-31 15:39:14','2022-01-31 15:39:14',0,1),(5,'CODE05','2022-01-31 15:39:14','2022-01-31 15:39:14',0,1),(7,'CODE06','2022-01-31 16:00:26','2022-01-31 16:00:26',0,1),(8,'CODE07','2022-01-31 15:39:14','2022-01-31 15:39:14',0,1),(9,'CODE08','2022-01-31 15:39:14','2022-01-31 15:39:14',0,1),(10,'CODE09','2022-01-31 15:39:14','2022-01-31 15:39:14',0,1),(12,'CODE11','2022-01-31 15:39:14','2022-01-31 15:39:14',0,1),(14,'NEWYEAR','2022-01-30 23:00:00','2034-01-30 23:00:00',30,1);
/*!40000 ALTER TABLE `coupons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `currencies`
--

DROP TABLE IF EXISTS `currencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `currencies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shortname` varchar(255) DEFAULT NULL,
  `longname` varchar(255) DEFAULT NULL,
  `sign` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currencies`
--

LOCK TABLES `currencies` WRITE;
/*!40000 ALTER TABLE `currencies` DISABLE KEYS */;
INSERT INTO `currencies` VALUES (1,'Ft','Forint','Ft'),(2,'Euro','Euro','???'),(3,'Dollar','Dollar','$');
/*!40000 ALTER TABLE `currencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `house_numbers`
--

DROP TABLE IF EXISTS `house_numbers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `house_numbers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `house_numbers`
--

LOCK TABLES `house_numbers` WRITE;
/*!40000 ALTER TABLE `house_numbers` DISABLE KEYS */;
INSERT INTO `house_numbers` VALUES (1,'10'),(2,'44'),(3,'3/A'),(4,'45');
/*!40000 ALTER TABLE `house_numbers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `installed_plugins`
--

DROP TABLE IF EXISTS `installed_plugins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `installed_plugins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `installed_plugins`
--

LOCK TABLES `installed_plugins` WRITE;
/*!40000 ALTER TABLE `installed_plugins` DISABLE KEYS */;
INSERT INTO `installed_plugins` VALUES (1,'example',1),(2,'testimport',1);
/*!40000 ALTER TABLE `installed_plugins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `languages`
--

DROP TABLE IF EXISTS `languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `languages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shortname` varchar(255) DEFAULT NULL,
  `longname` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `languages`
--

LOCK TABLES `languages` WRITE;
/*!40000 ALTER TABLE `languages` DISABLE KEYS */;
INSERT INTO `languages` VALUES (2,'EN','English'),(5,'HU','Hungarian');
/*!40000 ALTER TABLE `languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_states`
--

DROP TABLE IF EXISTS `order_states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_states` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_states`
--

LOCK TABLES `order_states` WRITE;
/*!40000 ALTER TABLE `order_states` DISABLE KEYS */;
INSERT INTO `order_states` VALUES (1,'ordered'),(2,'done');
/*!40000 ALTER TABLE `order_states` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `state_id` int(11) DEFAULT NULL,
  `users_id` int(11) DEFAULT NULL,
  `order_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `pay_types_id` int(11) NOT NULL,
  `addresses_id` int(11) NOT NULL,
  `people_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `state_id` (`state_id`),
  KEY `users_id` (`users_id`),
  KEY `pay_types_id` (`pay_types_id`),
  KEY `addresses_id` (`addresses_id`),
  KEY `people_id` (`people_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`pay_types_id`) REFERENCES `pay_types` (`id`),
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`addresses_id`) REFERENCES `addresses` (`id`),
  CONSTRAINT `orders_ibfk_3` FOREIGN KEY (`people_id`) REFERENCES `people` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,1,16,'2022-02-06 17:38:36',1,6,0),(2,1,16,'2022-02-06 17:49:24',1,6,0),(3,2,16,'2022-02-06 22:34:16',1,6,0),(4,1,16,'2022-02-23 22:30:18',1,6,4),(5,1,16,'2022-02-23 23:39:39',1,6,5);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pay_types`
--

DROP TABLE IF EXISTS `pay_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pay_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pay_types`
--

LOCK TABLES `pay_types` WRITE;
/*!40000 ALTER TABLE `pay_types` DISABLE KEYS */;
INSERT INTO `pay_types` VALUES (1,'cash_on_delivery'),(2,'paypal');
/*!40000 ALTER TABLE `pay_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `people`
--

DROP TABLE IF EXISTS `people`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `people` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phone_number` varchar(16) DEFAULT NULL,
  `addresses_id` int(11) DEFAULT NULL,
  `first_name` varchar(32) DEFAULT NULL,
  `last_name` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `addresses_id` (`addresses_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `people`
--

LOCK TABLES `people` WRITE;
/*!40000 ALTER TABLE `people` DISABLE KEYS */;
INSERT INTO `people` VALUES (1,'+36308961902',1,'Richard','Nyitrai'),(2,'0894972173',6,'Stewie','Highmountain'),(3,'+36721234567',4,'Zolt??n','V??mosi'),(4,'0894972173',NULL,'Stewie','Highmountain'),(5,'0894972171',NULL,'Stewie2','Highmountain2');
/*!40000 ALTER TABLE `people` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` VALUES (1,'admin_access'),(2,'ignore_ban'),(3,'view_statistics'),(4,'view_coupons'),(5,'manage_coupons'),(6,'view_products'),(7,'create_product'),(8,'manage_products'),(9,'delete_product'),(10,'view_users'),(11,'manage_users'),(12,'view_permissions'),(13,'manage_permissions'),(14,'manage_settings'),(15,'manage_addons'),(16,'view_orders'),(17,'manage_orders');
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phrases`
--

DROP TABLE IF EXISTS `phrases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phrases` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `languages_id` int(11) DEFAULT NULL,
  `phrase` varchar(255) DEFAULT NULL,
  `translated` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `languages_id` (`languages_id`)
) ENGINE=InnoDB AUTO_INCREMENT=326 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phrases`
--

LOCK TABLES `phrases` WRITE;
/*!40000 ALTER TABLE `phrases` DISABLE KEYS */;
INSERT INTO `phrases` VALUES (1,1,'search','Keres??s'),(2,2,'search','Search'),(4,4,'search','Tra??i'),(5,5,'search','Keres??s'),(6,6,'search','Keres??s'),(7,5,'webshop','Web??ruh??z'),(38,1,'statistics','Statisztik??k'),(39,2,'statistics','Statistics'),(40,5,'user_details','Felhaszn??l??i adatok'),(41,5,'username','Felhaszn??l??n??v'),(42,5,'email','E-mail'),(43,5,'password','Jelsz??'),(44,5,'new_password','??j jelsz??'),(45,5,'password_again','Jelsz?? ??jra'),(46,5,'password_now','Jelenlegi jelsz??'),(47,5,'personal_informations','Szem??lyes adatok'),(48,5,'name','N??v'),(49,5,'first_name','Keresztn??v'),(50,5,'last_name','Vezet??kn??v'),(51,5,'phone_number','Telefonsz??m'),(52,5,'address','C??m'),(53,5,'postcode','Ir??ny??t??sz??m'),(54,5,'city','V??ros'),(55,5,'street','Utca'),(56,5,'housenumber','H??zsz??m'),(57,5,'save','Ment??s'),(58,5,'piece','Darab'),(59,5,'basket_add','Kos??rhoz ad'),(60,5,'login','Bejelenetkez??s'),(61,5,'rememberme','Jegyezz meg'),(62,5,'register','Regisztr??ci??'),(63,5,'basket','Kos??r'),(64,5,'price','??r'),(65,5,'edit','Szerkeszt??s'),(66,5,'redirect_to_shipping','Tov??bb a sz??ll??t??shoz'),(67,5,'delete','T??rl??s'),(68,5,'id','Azonos??t??'),(69,5,'rank','Rang'),(70,5,'modify','M??dos??t??s'),(71,5,'admin','Admin'),(72,5,'theme','T??ma'),(73,5,'edit_categories','Kateg??ri??k szerkeszt??se'),(74,5,'webshop_language','Web??ruh??z nyelve'),(75,5,'edit_language','Nyelv szerkeszt??s'),(76,5,'import_language','Nyelv import??l??sa'),(77,5,'import','Import??l??s'),(78,5,'export_language','Nyelv export??l??s'),(79,5,'export','Export??l??s'),(80,5,'stock','Rakt??r'),(81,5,'add','Hozz??ad??s'),(82,5,'back','Vissza'),(83,5,'edit_product','Term??k szerkeszt??se'),(84,5,'delete_product','Term??k t??rl??se'),(85,5,'description','Le??r??s'),(86,5,'add_new_images','??j k??pek hozz??ad??sa'),(87,5,'available','El??rhet??'),(88,5,'appear','Megjelen??s'),(89,5,'disappear','Elt??n??s'),(90,5,'webshop_details','Web??ruh??z adatok'),(91,5,'theme','T??ma'),(92,5,'edit_categories','Kateg??ri??k szerkeszt??se'),(93,5,'webshop_language','Web??ruh??z nyelve'),(94,5,'edit_language','Nyelv szerkeszt??s'),(95,5,'import_language','Nyelv import??l??sa'),(96,5,'import','Import??l??s'),(97,5,'export_language','Nyelv export??l??s'),(98,5,'export','Export??l??s'),(99,5,'stock','Rakt??r'),(100,5,'add','Hozz??ad??s'),(101,5,'back','Vissza'),(102,5,'edit_product','Term??k szerkeszt??se'),(103,5,'delete_product','Term??k t??rl??se'),(104,5,'description','Le??r??s'),(105,5,'add_new_images','??j k??pek hozz??ad??sa'),(106,5,'available','El??rhet??'),(107,5,'appear','Megjelen??s'),(108,5,'disappear','Elt??n??s'),(109,5,'always_available','Mindig el??rhet??'),(110,5,'first','Els??'),(111,5,'last','Utols??'),(112,5,'phrase','Kifejez??s'),(113,5,'translated','Ford??tott'),(114,5,'delete_language','Nyelv t??rl??se'),(115,5,'show','Megjelen??t??s'),(116,5,'new','??j'),(117,5,'category','Kateg??ria'),(118,5,'main_category','F?? kateg??ria'),(119,5,'unused_categories','Nem haszn??lt kateg??ri??k'),(120,5,'used_categories','Haszn??lt kateg??ri??k'),(121,5,'remove','Elt??vol??t??s'),(122,5,'create_product','Term??k l??trehoz??sa'),(123,5,'images','K??pek'),(124,5,'create','L??trehoz??s'),(125,5,'statistics','Statisztik??k'),(126,5,'coupons','Kuponok'),(127,5,'products','Term??kek'),(128,5,'users','Felhaszn??l??k'),(129,5,'orders','Rendel??sek'),(130,5,'permissions','Jogok'),(131,5,'bans','Tilt??sok'),(132,5,'settings','Be??ll??t??sok'),(133,5,'addons','B??v??tm??nyek'),(134,5,'back_to_shop','Vissza az ??ruh??zhoz'),(135,5,'profile','Profil'),(136,5,'logout','Kil??p??s'),(137,5,'profile_operations','Profil m??veletek'),(138,5,'code','K??d'),(139,5,'available_from','-t??l el??rhet??'),(140,5,'available_to','-ig el??rhet??'),(141,5,'uses','Felhaszn??l??sok'),(142,5,'discount','Kedvezm??ny'),(143,5,'single_use','Egyszer haszn??lhat??'),(144,5,'new_coupon','??j kupon'),(145,5,'coupon','Kuponk??d'),(146,5,'order','Rendel??s'),(147,5,'cash_on_delivery','Ut??nv??t'),(148,5,'paypal','Paypal'),(149,5,'ordered','Megrendelve'),(150,5,'date','D??tum'),(151,5,'done','K??sz'),(152,2,'add','Add'),(153,2,'addons','Addons'),(154,2,'address','Address'),(155,2,'add_new_images','Add new images'),(156,2,'admin','Admin'),(157,2,'always_available','Always available'),(158,2,'appear','Appear'),(159,2,'available','Available'),(160,2,'available_from','Available from'),(161,2,'available_to','Available to'),(162,2,'back','Back'),(163,2,'back_to_shop','Back to shop'),(164,2,'bans','Bans'),(165,2,'basket','Basket'),(166,2,'basket_add','Add to basket'),(167,2,'cash_on_delivery','Cash on delivery'),(168,2,'category','Category'),(169,2,'city','City'),(170,2,'code','Code'),(171,2,'coupon','Coupon'),(172,2,'coupons','Coupons'),(173,2,'create','Create'),(174,2,'create_product','Create product'),(175,2,'date','Date'),(176,2,'delete','Delete'),(177,2,'delete_language','Delete language'),(178,2,'delete_product','Delete product'),(179,2,'description','Description'),(180,2,'disappear','Disappear'),(181,2,'discount','Discount'),(182,2,'done','Done'),(183,2,'edit','Edit'),(184,2,'edit_categories','Edit categories'),(185,2,'edit_language','Edit language'),(186,2,'edit_product','Edit product'),(187,2,'email','Email'),(188,2,'export','Export'),(189,2,'export_language','Export language'),(190,2,'first','First'),(191,2,'first_name','First name'),(192,2,'housenumber','House number'),(193,2,'id','Id'),(194,2,'images','Images'),(195,2,'import','Import'),(196,2,'import_language','Import language'),(197,2,'last','Last'),(198,2,'last_name','Last name'),(199,2,'login','Login'),(200,2,'logout','Logout'),(201,2,'main_category','Main category'),(202,2,'modify','Modify'),(203,2,'name','Name'),(204,2,'new','New'),(205,2,'new_coupon','New coupon'),(206,2,'new_password','New password'),(207,2,'order','Order'),(208,2,'ordered','Ordered'),(209,2,'orders','Orders'),(210,2,'password','Password'),(211,2,'password_again','Password again'),(212,2,'password_now','Password now'),(213,2,'paypal','PayPal'),(214,2,'permissions','Permissions'),(215,2,'personal_informations','Personal informations'),(216,2,'phone_number','Phone number'),(217,2,'phrase','Phrase'),(218,2,'piece','Quantity'),(219,2,'postcode','Postcode'),(220,2,'price','Price'),(221,2,'products','Products'),(222,2,'profile','Profile'),(223,2,'profile_operations','Profile operations'),(224,2,'rank','Rank'),(225,2,'redirect_to_shipping','Redirect to shipping'),(226,2,'register','Register'),(227,2,'rememberme','Remember me'),(228,2,'remove','Remove'),(229,2,'save','Save'),(230,2,'settings','Settings'),(231,2,'show','Show'),(232,2,'single_use','Single use'),(233,2,'stock','Stock'),(235,2,'street','Street'),(236,2,'theme','Theme'),(237,2,'translated','Translated'),(238,2,'unused_categories','Unused categories'),(239,2,'used_categories','Used categories'),(240,2,'username','Username'),(241,2,'users','Users'),(242,2,'user_details','User details'),(243,2,'uses','Uses'),(244,2,'webshop','Webshop'),(245,2,'webshop_details','Webshop details'),(246,2,'webshop_language','Webshop language'),(247,5,'details','Adatok'),(248,2,'details','Details'),(249,5,'order_state','Megrendel??s ??llapota'),(250,5,'pay_type','Fizet??s t??pusa'),(251,2,'pay_type','Pay type'),(252,2,'order_state','Order state'),(253,5,'edit_permission','Jogok szerkeszt??se'),(254,2,'edit_permission','Edit permission'),(255,5,'perm_admin_access',''),(256,5,'perm_ignore_ban',''),(257,5,'perm_view_statistics',''),(258,5,'perm_view_coupons',''),(259,5,'perm_manage_coupons',''),(260,5,'perm_view_products',''),(261,5,'perm_create_product',''),(262,5,'perm_manage_products',''),(263,5,'perm_delete_product',''),(264,5,'perm_view_users',''),(265,5,'perm_manage_users',''),(266,5,'perm_view_permissions',''),(267,5,'perm_manage_permissions',''),(268,5,'perm_manage_settings',''),(269,5,'perm_manage_addons',''),(270,5,'perm_desc_admin_access',''),(271,5,'perm_desc_ignore_ban',''),(272,5,'perm_desc_view_statistics',''),(273,5,'perm_desc_view_coupons',''),(274,5,'perm_desc_manage_coupons',''),(275,5,'perm_desc_view_products',''),(276,5,'perm_desc_create_product',''),(277,5,'perm_desc_manage_products',''),(278,5,'perm_desc_delete_product',''),(279,5,'perm_desc_view_users',''),(280,5,'perm_desc_manage_users',''),(281,5,'perm_desc_view_permissions',''),(282,5,'perm_desc_manage_permissions',''),(283,5,'perm_desc_manage_settings',''),(284,5,'perm_desc_manage_addons',''),(285,2,'perm_admin_access','View admin interface'),(286,2,'perm_create_product','Create product'),(287,2,'perm_delete_product','Delete product'),(288,2,'perm_ignore_ban','Ignore ban'),(289,2,'perm_manage_addons','Manage addons'),(290,2,'perm_manage_coupons','Manage coupons'),(291,2,'perm_manage_permissions','Manage permissions'),(292,2,'perm_manage_products','Manage products'),(293,2,'perm_manage_settings','Manage settings'),(294,2,'perm_manage_users','Manage users'),(295,2,'perm_view_coupons','View coupons'),(296,2,'perm_view_permissions','View permissions'),(297,2,'perm_view_products','View products'),(298,2,'perm_view_statistics','View statistics'),(299,2,'perm_view_users','View users'),(300,5,'perm_view_orders',''),(301,5,'perm_manage_orders',''),(302,5,'perm_desc_view_orders',''),(303,5,'perm_desc_manage_orders',''),(304,2,'perm_manage_orders','Manage orders'),(305,2,'perm_view_orders','View orders'),(306,5,'check_for_addons','B??v??tm??ny keres??s'),(307,5,'check_for_themes','T??m??k keres??s'),(308,5,'visitors','L??togat??k'),(309,5,'banned','Kitiltva'),(310,5,'on','Bekapcsolva'),(311,5,'off','Kikapcsolva'),(312,5,'visitors_daily','Napi l??togat??k'),(313,5,'visitors_monthly','Havi l??togat??k'),(314,5,'orders_daily','Napi rendel??sek'),(315,5,'orders_monthly','Havi rendel??sek'),(316,2,'banned','Banned'),(317,2,'check_for_addons','Check for addons'),(318,2,'check_for_themes','Check for themes'),(319,2,'off','Off'),(320,2,'on','On'),(321,2,'orders_daily','Daily orders'),(322,2,'orders_monthly','Monthly orders'),(323,2,'visitors','Visitors'),(324,2,'visitors_daily','Daily visitors'),(325,2,'visitors_monthly','Monthly visitors');
/*!40000 ALTER TABLE `phrases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `postcodes`
--

DROP TABLE IF EXISTS `postcodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `postcodes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `postcode` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `postcodes`
--

LOCK TABLES `postcodes` WRITE;
/*!40000 ALTER TABLE `postcodes` DISABLE KEYS */;
INSERT INTO `postcodes` VALUES (1,'7632'),(4,'0'),(5,'R45W328'),(6,'5932'),(7,'R45W329');
/*!40000 ALTER TABLE `postcodes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_images`
--

DROP TABLE IF EXISTS `product_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `products_id` int(11) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `products_id` (`products_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_images`
--

LOCK TABLES `product_images` WRITE;
/*!40000 ALTER TABLE `product_images` DISABLE KEYS */;
INSERT INTO `product_images` VALUES (24,1,'IMG_4240.JPG'),(26,1,'1642262473istockphoto-1249496770-170667a.jpg');
/*!40000 ALTER TABLE `product_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_order`
--

DROP TABLE IF EXISTS `product_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `products_id` int(11) DEFAULT NULL,
  `orders_id` int(11) DEFAULT NULL,
  `discounts_id` int(11) DEFAULT NULL,
  `piece` int(11) NOT NULL DEFAULT 0,
  `discount_percent` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `discounts_id` (`discounts_id`),
  KEY `products_id` (`products_id`),
  KEY `orders_id` (`orders_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_order`
--

LOCK TABLES `product_order` WRITE;
/*!40000 ALTER TABLE `product_order` DISABLE KEYS */;
INSERT INTO `product_order` VALUES (1,36,3,NULL,1,0),(2,36,3,NULL,5,0),(3,34,3,NULL,10,0),(4,1,4,NULL,10,0),(5,1,5,NULL,11,30);
/*!40000 ALTER TABLE `product_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `currencies_id` int(11) DEFAULT NULL,
  `units_id` int(11) DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `active_from` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `active_to` timestamp NULL DEFAULT current_timestamp(),
  `display_notactive` tinyint(1) DEFAULT NULL,
  `categories_id` int(11) DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `units_id` (`units_id`),
  KEY `currencies_id` (`currencies_id`),
  KEY `categories_id` (`categories_id`),
  CONSTRAINT `products_ibfk_1` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Sztyuji telefonja','Ha megveszed elrakathatod a hal??l fasz??ra a telefonj??t ??s nem fog h??vni.',20000,2,NULL,111,'2022-01-14 23:00:00','2034-01-10 23:00:00',0,7,0),(32,'','',0,1,NULL,0,'2022-01-15 16:11:07','2034-01-10 23:00:00',0,2,1),(33,'','',0,1,NULL,0,'2022-01-15 16:11:09','2034-01-10 23:00:00',0,2,1),(34,'light','asddasaddaasd',101010,1,NULL,110,'2022-01-10 23:00:00','2034-01-10 23:00:00',1,5,0),(35,'asSS','SADAD',2313,1,NULL,32,'2022-01-15 16:22:56','2034-01-10 23:00:00',1,2,1),(36,'Sztyuji telefonja','Ha megveszed elrakathatod a hal??l fasz??ra a telefonj??t ??s nem fog h??vni.',20000,1,NULL,1000,'2022-01-10 23:00:00','2034-01-10 23:00:00',1,2,0),(37,'','',0,1,NULL,0,'2022-01-15 16:11:22','2034-01-14 23:00:00',1,2,1),(38,'','',0,1,NULL,0,'2022-01-15 16:11:23','2034-01-14 23:00:00',1,2,1);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rank_permission`
--

DROP TABLE IF EXISTS `rank_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rank_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ranks_id` int(11) DEFAULT NULL,
  `permissions_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `permissions_id` (`permissions_id`),
  KEY `ranks_id` (`ranks_id`)
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rank_permission`
--

LOCK TABLES `rank_permission` WRITE;
/*!40000 ALTER TABLE `rank_permission` DISABLE KEYS */;
INSERT INTO `rank_permission` VALUES (45,2,1),(46,2,2),(47,2,3),(48,2,4),(49,2,5),(50,2,6),(51,2,7),(52,2,8),(53,2,9),(54,2,10),(55,2,11),(56,2,12),(57,2,13),(58,2,14),(59,2,15),(60,2,16),(61,2,17),(79,5,1),(80,5,2),(81,5,3),(82,5,4),(83,5,6),(84,5,8),(85,5,10),(86,5,11),(87,5,12),(88,5,16);
/*!40000 ALTER TABLE `rank_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ranks`
--

DROP TABLE IF EXISTS `ranks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ranks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ranks`
--

LOCK TABLES `ranks` WRITE;
/*!40000 ALTER TABLE `ranks` DISABLE KEYS */;
INSERT INTO `ranks` VALUES (1,'user'),(2,'admin'),(5,'moderator');
/*!40000 ALTER TABLE `ranks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `settings` (
  `themes_id` int(11) DEFAULT NULL,
  `languages_id` int(11) DEFAULT NULL,
  `license_hash` varchar(255) DEFAULT NULL,
  `webshop_name` varchar(255) DEFAULT NULL,
  `root_directory` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES (1,2,NULL,'Szakdolgozat webshop',NULL);
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `streets`
--

DROP TABLE IF EXISTS `streets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `streets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `street` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `streets`
--

LOCK TABLES `streets` WRITE;
/*!40000 ALTER TABLE `streets` DISABLE KEYS */;
INSERT INTO `streets` VALUES (1,'Gad?? u.'),(2,'st Patriks Wood'),(3,'Bajcsy-Zsilinszky utca');
/*!40000 ALTER TABLE `streets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `themes`
--

DROP TABLE IF EXISTS `themes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `themes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `folder` varchar(255) DEFAULT NULL,
  `version` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `themes`
--

LOCK TABLES `themes` WRITE;
/*!40000 ALTER TABLE `themes` DISABLE KEYS */;
INSERT INTO `themes` VALUES (1,'Default','default','1.0'),(3,'Dark theme','dark','1.0');
/*!40000 ALTER TABLE `themes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `units`
--

DROP TABLE IF EXISTS `units`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `units` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `short` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `units`
--

LOCK TABLES `units` WRITE;
/*!40000 ALTER TABLE `units` DISABLE KEYS */;
/*!40000 ALTER TABLE `units` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `used_coupons`
--

DROP TABLE IF EXISTS `used_coupons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `used_coupons` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `coupons_id` int(11) DEFAULT NULL,
  `users_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `coupons_id` (`coupons_id`),
  KEY `users_id` (`users_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `used_coupons`
--

LOCK TABLES `used_coupons` WRITE;
/*!40000 ALTER TABLE `used_coupons` DISABLE KEYS */;
INSERT INTO `used_coupons` VALUES (1,1,15),(2,1,16),(3,14,16);
/*!40000 ALTER TABLE `used_coupons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `people_id` int(11) DEFAULT NULL,
  `ranks_id` int(11) DEFAULT NULL,
  `banned` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `people_id` (`people_id`),
  KEY `ranks_id` (`ranks_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (15,'William','$2y$10$kiBqHALNfO.tNigrp1TlDeniiD08jQHU1futht6tmc7N6xWLsOUA6','admin@webshop.hu',1,5,0),(16,'admin','$2y$10$KZ/Z.VOStTVGIBt6o3DKhOr0wLVaTWkFB8m6ntJbJLcd0kFSK2hdm','admin@webshop.hu1',2,2,0),(17,'user1234','$2y$10$m0r5URVj.osEQ4cEenjLcOn68S/Sg1Yxtw.QrUseGODuxLcB152Wi','valami@valami.hu',3,2,0);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `visitors`
--

DROP TABLE IF EXISTS `visitors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `visitors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visitors`
--

LOCK TABLES `visitors` WRITE;
/*!40000 ALTER TABLE `visitors` DISABLE KEYS */;
INSERT INTO `visitors` VALUES (2,'54.37.88.104','FR','2022-02-24 18:27:37'),(3,'54.37.88.104','FR','2022-02-26 18:27:59'),(4,'','','2022-02-26 18:34:31'),(5,'54.37.88.104','FR','2022-01-29 19:48:41'),(6,'','','2022-02-26 21:00:28'),(7,'','','2022-02-27 16:30:32'),(8,'','','2022-02-27 18:35:31'),(9,'','','2022-02-27 19:41:31');
/*!40000 ALTER TABLE `visitors` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-02-27 21:43:09
