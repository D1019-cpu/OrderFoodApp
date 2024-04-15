-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: foodapp
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add user',6,'add_customuser'),(22,'Can change user',6,'change_customuser'),(23,'Can delete user',6,'delete_customuser'),(24,'Can view user',6,'view_customuser'),(25,'Can add City',7,'add_city'),(26,'Can change City',7,'change_city'),(27,'Can delete City',7,'delete_city'),(28,'Can view City',7,'view_city'),(29,'Can add customer',8,'add_customer'),(30,'Can change customer',8,'change_customer'),(31,'Can delete customer',8,'delete_customer'),(32,'Can view customer',8,'view_customer'),(33,'Can add Dish',9,'add_dish'),(34,'Can change Dish',9,'change_dish'),(35,'Can delete Dish',9,'delete_dish'),(36,'Can view Dish',9,'view_dish'),(37,'Can add Menu',10,'add_menu'),(38,'Can change Menu',10,'change_menu'),(39,'Can delete Menu',10,'delete_menu'),(40,'Can view Menu',10,'view_menu'),(41,'Can add Order',11,'add_order'),(42,'Can change Order',11,'change_order'),(43,'Can delete Order',11,'delete_order'),(44,'Can view Order',11,'view_order'),(45,'Can add Restaurant',12,'add_restaurant'),(46,'Can change Restaurant',12,'change_restaurant'),(47,'Can delete Restaurant',12,'delete_restaurant'),(48,'Can view Restaurant',12,'view_restaurant'),(49,'Can add staff',13,'add_staff'),(50,'Can change staff',13,'change_staff'),(51,'Can delete staff',13,'delete_staff'),(52,'Can view staff',13,'view_staff'),(53,'Can add Review',14,'add_review'),(54,'Can change Review',14,'change_review'),(55,'Can delete Review',14,'delete_review'),(56,'Can view Review',14,'view_review'),(57,'Can add provider',15,'add_provider'),(58,'Can change provider',15,'change_provider'),(59,'Can delete provider',15,'delete_provider'),(60,'Can view provider',15,'view_provider'),(61,'Can add OrderDish',16,'add_orderdish'),(62,'Can change OrderDish',16,'change_orderdish'),(63,'Can delete OrderDish',16,'delete_orderdish'),(64,'Can view OrderDish',16,'view_orderdish'),(65,'Can add Toping',17,'add_toping'),(66,'Can change Toping',17,'change_toping'),(67,'Can delete Toping',17,'delete_toping'),(68,'Can view Toping',17,'view_toping');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_city`
--

DROP TABLE IF EXISTS `core_city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_city` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_city`
--

LOCK TABLES `core_city` WRITE;
/*!40000 ALTER TABLE `core_city` DISABLE KEYS */;
INSERT INTO `core_city` VALUES (1,'Thành Phố Hà Nội','2024-04-09 14:37:36.561788'),(2,'Thành Phố Hồ Chí Minh','2024-04-09 14:37:47.311777'),(3,'Hà Nam','2024-04-09 14:38:02.857053'),(4,'Bắc Ninh','2024-04-09 14:38:07.720421'),(5,'Hải Phòng','2024-04-09 14:38:15.414804'),(6,'Long An','2024-04-09 14:38:19.113733'),(7,'Bình Định','2024-04-09 14:38:24.408807'),(8,'Đà Nẵng','2024-04-09 14:38:30.649554'),(9,'Nha Trang','2024-04-09 14:38:35.174693'),(10,'Cần Thơ','2024-04-09 14:38:40.181077');
/*!40000 ALTER TABLE `core_city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_customer`
--

DROP TABLE IF EXISTS `core_customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_customer` (
  `id` int NOT NULL AUTO_INCREMENT,
  `address` longtext,
  `phone_number` varchar(20) DEFAULT NULL,
  `avatar` varchar(100) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `admin_id` bigint NOT NULL,
  `city_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_id` (`admin_id`),
  KEY `core_customer_city_id_d330fbe7_fk_core_city_id` (`city_id`),
  CONSTRAINT `core_customer_admin_id_b7beab0a_fk_core_customuser_id` FOREIGN KEY (`admin_id`) REFERENCES `core_customuser` (`id`),
  CONSTRAINT `core_customer_city_id_d330fbe7_fk_core_city_id` FOREIGN KEY (`city_id`) REFERENCES `core_city` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_customer`
--

LOCK TABLES `core_customer` WRITE;
/*!40000 ALTER TABLE `core_customer` DISABLE KEYS */;
INSERT INTO `core_customer` VALUES (1,NULL,NULL,'','2024-04-09 12:58:47.016454',NULL,1,NULL),(2,NULL,NULL,'','2024-04-13 01:56:11.809103',NULL,2,NULL),(3,NULL,NULL,'default/user.png','2024-04-15 01:08:46.446770',NULL,6,NULL),(4,NULL,NULL,'default/user.png','2024-04-15 13:16:05.480191',NULL,9,NULL),(5,NULL,NULL,'default/user.png','2024-04-15 13:16:17.051978',NULL,10,NULL),(6,NULL,NULL,'default/user.png','2024-04-15 13:16:27.123929',NULL,11,NULL);
/*!40000 ALTER TABLE `core_customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_customuser`
--

DROP TABLE IF EXISTS `core_customuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_customuser` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `user_type` varchar(15) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_customuser`
--

LOCK TABLES `core_customuser` WRITE;
/*!40000 ALTER TABLE `core_customuser` DISABLE KEYS */;
INSERT INTO `core_customuser` VALUES (1,'pbkdf2_sha256$600000$IHNzJsUNpX8p1Hv52Je5Hz$LM9QnqSOMhG8QrlG5tGCpZI8Wiy8B5jpXRHzZdfxlp8=','2024-04-15 13:46:45.791227',1,'admin','','','admin@gmail.com',1,1,'2024-04-09 12:58:46.798939','1'),(2,'pbkdf2_sha256$600000$a4efcciFf0Av1wbrfp7Zi9$v2w+0rDc3G+7cqsuXMVtZAK+cFCxXKxUA1he3tWd/IQ=','2024-04-13 01:58:06.699430',0,'user','','','test@gmail.com',0,1,'2024-04-13 01:56:11.778329','1'),(4,'pbkdf2_sha256$600000$5v9f8Koj59ar4O6VW4yaTY$pLkQJPIHk4XAwDjBsSxH/Ed2BzRUGACo+kdX60YCH6U=',NULL,0,'provider1','','','provider@gmail.com',0,1,'2024-04-13 03:35:44.086837','2'),(5,'pbkdf2_sha256$600000$Spxu4pTq7YuGfXhbZUSePL$QOYDd+4Px+8jvcs9QBQayygx9V6HcLEoeIl6blGwHAQ=',NULL,0,'username2','','','user2name@gmail.com',0,1,'2024-04-14 16:37:50.419072','2'),(6,'pbkdf2_sha256$600000$qz57nnxRpIU3DZwSZnJzVu$kzFHZFN6DZMcavJXK5J5YfZJvYZTdQKKuJNIqzjtYQY=',NULL,0,'userZS2PEY','','','tesst2@gmail.com',0,1,'2024-04-15 01:08:46.439502','1'),(7,'pbkdf2_sha256$600000$MW3z60CL5ITEkdWrrXqLqp$cO7Td16Hl8HIY/kqDCvjRs4eHf+xs6a/TasTG/IK/aw=','2024-04-15 13:06:45.452386',0,'userD1019','','','rinnmusic2.2@gmail.com',0,1,'2024-04-15 01:11:31.785924','2'),(8,'pbkdf2_sha256$600000$hN3YXlC7o4ciRKYbYdOqqP$m01VktlqJM6slItpcvZq/yTiWQ+Nrvu704y4TOMgukw=','2024-04-15 10:33:29.872229',0,'test21222','','','test111@gmail.com',0,1,'2024-04-15 10:32:51.136271','2'),(9,'pbkdf2_sha256$600000$TKwwAbuaYPtWQ6rKPIpgKv$5tM47V8BCkrNQbToUkq5KBQnsHHXy31vRPck1pw5+48=',NULL,0,'userUxWQeQ','','','test1@gmail.com',0,1,'2024-04-15 13:16:05.472128','1'),(10,'pbkdf2_sha256$600000$6P5lrvo1lMN3KukNSM7TDc$oP88tIzVEn7PGR19+tigOeRqPS3gVRBZetWk19QyUsY=',NULL,0,'usertjpBJ0','','','test2@gmail.com',0,1,'2024-04-15 13:16:17.044061','1'),(11,'pbkdf2_sha256$600000$tU3JuKycDYfcogmjGnrG4F$hmmFUMKCrwOTj9/nQWuM0M9P8teGD53tiSk7Qllscqs=',NULL,0,'userV3CqaB','','','test3@gmail.com',0,1,'2024-04-15 13:16:27.110238','1');
/*!40000 ALTER TABLE `core_customuser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_customuser_groups`
--

DROP TABLE IF EXISTS `core_customuser_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_customuser_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `customuser_id` bigint NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `core_customuser_groups_customuser_id_group_id_7990e9c6_uniq` (`customuser_id`,`group_id`),
  KEY `core_customuser_groups_group_id_301aeff4_fk_auth_group_id` (`group_id`),
  CONSTRAINT `core_customuser_grou_customuser_id_976bc4d7_fk_core_cust` FOREIGN KEY (`customuser_id`) REFERENCES `core_customuser` (`id`),
  CONSTRAINT `core_customuser_groups_group_id_301aeff4_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_customuser_groups`
--

LOCK TABLES `core_customuser_groups` WRITE;
/*!40000 ALTER TABLE `core_customuser_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_customuser_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_customuser_user_permissions`
--

DROP TABLE IF EXISTS `core_customuser_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_customuser_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `customuser_id` bigint NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `core_customuser_user_per_customuser_id_permission_49ea742a_uniq` (`customuser_id`,`permission_id`),
  KEY `core_customuser_user_permission_id_80ceaab9_fk_auth_perm` (`permission_id`),
  CONSTRAINT `core_customuser_user_customuser_id_ebd2ce6c_fk_core_cust` FOREIGN KEY (`customuser_id`) REFERENCES `core_customuser` (`id`),
  CONSTRAINT `core_customuser_user_permission_id_80ceaab9_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_customuser_user_permissions`
--

LOCK TABLES `core_customuser_user_permissions` WRITE;
/*!40000 ALTER TABLE `core_customuser_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_customuser_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_dish`
--

DROP TABLE IF EXISTS `core_dish`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_dish` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `image` varchar(100) NOT NULL,
  `price` int NOT NULL,
  `old_price` int NOT NULL,
  `product_status` varchar(10) NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  `description` longtext,
  `featured` tinyint(1) NOT NULL,
  `distance` decimal(10,2) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `restaurant_id` int DEFAULT NULL,
  `menu_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `core_dish_restaurant_id_6a5e825f_fk_core_restaurant_id` (`restaurant_id`),
  KEY `core_dish_menu_id_a5d26262_fk_core_menu_id` (`menu_id`),
  CONSTRAINT `core_dish_menu_id_a5d26262_fk_core_menu_id` FOREIGN KEY (`menu_id`) REFERENCES `core_menu` (`id`),
  CONSTRAINT `core_dish_restaurant_id_6a5e825f_fk_core_restaurant_id` FOREIGN KEY (`restaurant_id`) REFERENCES `core_restaurant` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_dish`
--

LOCK TABLES `core_dish` WRITE;
/*!40000 ALTER TABLE `core_dish` DISABLE KEYS */;
INSERT INTO `core_dish` VALUES (1,'Big Beef Burger','items/bugger.jpg',55000,65000,'published','Cỡ lớn','Burger Bò Nướng Hành Chiên',0,1.70,'2024-04-11 00:37:19.043942','2024-04-11 00:35:40.000000',1,1),(2,'Trà Chanh Mật Ong 500ML','items/menueditor_item_85e2db724c0249dea76aa01d98e7d417_1689861893322979818.webp',22000,30000,'published','Cỡ vừa','Trà Chanh Truyền Thống Kết Hợp Cùng Mật Ong Tạo Hương Vị Thanh Mát , Chua Ngọt Vừa Đủ .',0,1.20,'2024-04-11 00:44:02.403096','2024-04-11 00:44:00.000000',4,3),(3,'Trà Chanh Thái Lan 700ML','items/menueditor_item_a5c190fa7c854d208b9695f1facb9577_1712216179141080436.webp',22000,30000,'published','Cỡ lớn','Trà Chanh Thái Lan Kết Hợp Trà Lài + Trà Thái Tạo Nên Hương Vị Đặc Trưng , Thanh Mát , Dễ Uống',0,1.20,'2024-04-11 00:45:24.882742','2024-04-11 00:45:22.000000',4,NULL),(4,'Trà Dâu Tây 700ML','items/menueditor_item_3bea2008c1b440569c2c0c24e0304ecf_1695232942590297269.webp',26000,35000,'published','Cỡ lớn','Trà Dâu Tây Có Vị Chua Nhẹ , Ngọt Vừa , Thanh Mát',0,1.20,'2024-04-11 00:46:53.910109','2024-04-11 00:46:46.000000',4,3),(5,'Đen đá','items/menueditor_item_38b78cd494f84b20a26b9832196600bd_1689593035729059010.webp',20000,25000,'published','Vừa','Đen đá: Định Lượng Cafe : 50ml cafe + 10ml đường',0,1.10,'2024-04-11 01:52:36.765640','2024-04-11 01:52:25.000000',4,5),(6,'Combo King B 99k','items/king-deli-2.jpg',99000,129000,'published','Phần ăn vừa','2 Fried chicken + 1 Fries M + 1 Drink',1,1.20,'2024-04-13 05:30:37.494731','2024-04-13 05:30:35.000000',1,1),(7,'Cheese Ring Beef Burger Combo','items/cheese-ring-beef-burger-combo.jpg',149000,169000,'published','Size L','Combo Burger bò phô mai ( Size L )',0,1.20,'2024-04-13 05:32:53.606458','2024-04-13 05:32:46.000000',1,1),(8,'Pizza Singapore','items/PIZZASINGAPORECHILICRAB.jpg',215500,250000,'published','Medium','PIZZA SINGAPORE CUA XỐT ỚT SINGAPORE - SINGAPORE CHILI CRAB',1,1.30,'2024-04-13 05:34:45.427096','2024-04-13 05:34:44.000000',3,2),(9,'PIZZA SIÊU TOPPING HẢI SẢN','items/PizzaExtraTopping3.jpg',235000,250000,'published','Medium','PIZZA SIÊU TOPPING HẢI SẢN NHIỆT ĐỚI XỐT TIÊU - SUPER TOPPING PIZZAMIN SEA',0,1.40,'2024-04-13 05:35:56.003525','2024-04-13 05:35:54.000000',3,2),(10,'Trà Ổi Hồng 700ML','items/menueditor_item_2d45127db24e4e3a875fcf2d6fc01c9b_1695232809017277836.webp',26000,35000,'published','Cỡ lớn','Trà Ổi Hồng 700ML',1,1.10,'2024-04-13 05:37:31.667506','2024-04-13 05:37:30.000000',4,3),(11,'Trà Đào Cam Sả 700ML','items/menueditor_item_a239655b69ea421a8aa89d9bda09e352_1689597904887704860.webp',26000,35000,'published','Cỡ lớn','Trà Đào Cam Sả 700ML',0,1.10,'2024-04-13 05:38:21.418726','2024-04-13 05:38:20.000000',4,3),(12,'Ốc Quế Hạt Dẻ','items/1330a09a760d255286441fcf87d21028.png',18000,25000,'published','Medium','KEM ỐC QUẾ HẠT DẺ CALIFORNIA (PISTACHIO)',1,1.30,'2024-04-13 05:42:13.532387','2024-04-13 05:42:12.000000',6,4),(13,'Phô Mai Hoàng Kim','items/f48f1f0e6c89d90a41273f45bffb4813.jpg',20000,25000,'published','Medium','Phomai béo ngậy cùng trân châu hoàng kim',0,1.50,'2024-04-13 05:43:05.924354','2024-04-13 05:43:04.000000',6,4),(14,'PHINDI CHOCO','items/270_crop_HLC_New_logo_5.1_Products__PHINDI_CHOCO.jpg',45000,55000,'published','Medium','Phindi Choco',0,1.60,'2024-04-13 05:45:16.836488','2024-04-13 05:45:15.000000',2,5),(15,'PHINDI Kem Sữa','items/270_crop_HLC_New_logo_5.1_Products__PHINDI_KEM_SUA.jpg',45000,65000,'published','Medium','PHINDI Kem Sữa',1,1.90,'2024-04-13 05:46:14.725067','2024-04-13 05:46:13.000000',2,5),(16,'Ốc Hương Trang','items/95cbdea7e5c24c50b8d7527b0698e8e5_1668904700813124507.webp',250000,250000,'published','Medium','Ốc Hương Trang - 637 Đê La Thành',1,2.20,'2024-04-13 05:49:18.333491','2024-04-13 05:49:17.000000',7,6),(17,'Bún Thái Hải Sản','items/db868a54b88d4ac4905b45ea4d91b41a_1678344613391809320.webp',65000,65000,'published','Medium','Bún Thái Hải Sản - 45 Hàng Điếu',0,1.90,'2024-04-13 05:50:18.807667','2024-04-13 05:50:17.000000',7,6),(18,'Cơm lứt thăn heo sốt cà','items/menueditor_item_82066237e11d4a3a81820d77cee23e3d_1686900994795398308.webp',66000,66000,'published','Medium','Cơm lứt / Thăn heo viên / nấm hương / sốt cà chua / Rau củ/ Muối vừng mè đen',0,1.90,'2024-04-13 05:52:38.668091','2024-04-13 05:52:37.000000',8,NULL),(19,'Ức gà cuộn rong biển 8 - Salad - KO cơm','items/menueditor_item_409382f0b96549afb0801aaf9612e790_1686901136718594639.webp',68000,68000,'published','Medium','Ức gà cuộn rong biển 8 - Salad - KO cơm / Ức gà cuộn rong biển 8 miếng / salad mini / nửa trứng / sốt chấm',1,1.00,'2024-04-13 05:53:41.737055','2024-04-13 05:53:40.000000',8,7),(20,'Cơm rang thập cẩm nhiều cơm','items/menueditor_item_c6209fededb54c63b4d450e92941ac55_1690716475778799299.webp',33000,33000,'published','Suất trung bình','Cơm rang thập cẩm nhiều cơm gồm xúc xích, giò,đậu cove, ngô...',0,1.10,'2024-04-15 07:14:38.638341','2024-04-15 07:14:37.000000',10,8),(21,'Cơm Rang Hải Sản','items/menueditor_item_ea5e0a49640048bc9df116540e489fe3_1690545477231528754.webp',67500,67500,'published','Suất trung bình','cơm rang, Tôm, xúc xích, giò,ngô,cà rốt....',0,1.10,'2024-04-15 07:15:51.187987','2024-04-15 07:15:49.000000',10,8),(22,'Cơm Rang Dưa Bò+1 Pepsi (Coca)','items/menueditor_item_2cb09d6b5d90436aa96669210a6e4777_1690948504240852177.webp',52000,52000,'published','Suất trung bình','Cơm Rang Dưa Bò+1 Pepsi (Coca)',0,1.50,'2024-04-15 07:16:48.124910','2024-04-15 07:16:46.000000',10,8),(23,'Bánh mì nem khoai','items/468a5f02799746a88ee7a78edf7d1fa0_1600094574281140034.webp',20000,20000,'published','Medium','Bánh mì nem khoai',0,1.20,'2024-04-15 07:25:53.047830','2024-04-15 07:25:51.000000',10,9),(24,'Bánh mì xúc xích, lạp sườn','items/468a5f02799746a88ee7a78edf7d1fa0_1600094574281140034_6O8vPWS.webp',25000,25000,'published','Medium','Bánh mì xúc xích, lạp sườn',0,1.20,'2024-04-15 07:26:30.549612','2024-04-15 07:26:29.000000',10,9),(25,'KFC Deal 149K','items/2989346863eb44c282118ecb1a90bb05_1713108600517091672.webp',150000,0,'published','Medium','04 miếng Gà + 03 Gà Miếng Nuggets + 01 Khoai Tây Nghiền (vừa) + 01 Bắp Cải Trộn (vừa)',0,1.80,'2024-04-15 08:18:47.410500',NULL,10,1);
/*!40000 ALTER TABLE `core_dish` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_menu`
--

DROP TABLE IF EXISTS `core_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_menu` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  `slug` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `core_menu_slug_18a2ff93` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_menu`
--

LOCK TABLES `core_menu` WRITE;
/*!40000 ALTER TABLE `core_menu` DISABLE KEYS */;
INSERT INTO `core_menu` VALUES (1,'Fast Food','2024-04-10 15:51:40.372560','menu/fast-food.png','fast-food'),(2,'Pizza','2024-04-10 15:51:47.563202','menu/pizza.png','pizza'),(3,'Đồ uống','2024-04-10 15:51:54.776992','menu/drink.png','drink'),(4,'Ice Cream','2024-04-10 15:52:01.775392','menu/ice-cream.png','ice-cream'),(5,'Cà Phê','2024-04-10 15:52:10.780893','menu/coffee-cup.png','coffee'),(6,'Hải Sản','2024-04-10 15:52:20.705607','menu/lobster.png','sea-food'),(7,'Healthy','2024-04-13 04:40:01.264887','menu/diet.png','healthy'),(8,'Cơm','2024-04-15 07:12:53.713985','menu/782d2085-530e-48fa-9fa2-f392d8f54a4f__store_cover__2023__08__01__06__31__39.webp','com'),(9,'Bánh Mì','2024-04-15 07:24:06.431285','menu/upload-photo-icon_3408dc71ae96497c82a6f5fb35763840_1549033935837593141.webp','banh-mi');
/*!40000 ALTER TABLE `core_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_order`
--

DROP TABLE IF EXISTS `core_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_order` (
  `id` int NOT NULL AUTO_INCREMENT,
  `total_price` int NOT NULL,
  `customer_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `core_order_customer_id_9e4576b7_fk_core_customer_id` (`customer_id`),
  CONSTRAINT `core_order_customer_id_9e4576b7_fk_core_customer_id` FOREIGN KEY (`customer_id`) REFERENCES `core_customer` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_order`
--

LOCK TABLES `core_order` WRITE;
/*!40000 ALTER TABLE `core_order` DISABLE KEYS */;
INSERT INTO `core_order` VALUES (3,500000,1);
/*!40000 ALTER TABLE `core_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_orderdish`
--

DROP TABLE IF EXISTS `core_orderdish`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_orderdish` (
  `id` int NOT NULL AUTO_INCREMENT,
  `status` varchar(31) NOT NULL,
  `delivery_address` longtext NOT NULL,
  `phone_number` varchar(20) NOT NULL,
  `price` int NOT NULL,
  `quantity` int NOT NULL,
  `note` longtext,
  `created_at` datetime(6) DEFAULT NULL,
  `dish_id` int DEFAULT NULL,
  `order_id` int DEFAULT NULL,
  `restaurant_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `core_orderdish_dish_id_1d2996d4_fk_core_dish_id` (`dish_id`),
  KEY `core_orderdish_order_id_d2a54379_fk_core_order_id` (`order_id`),
  KEY `core_orderdish_restaurant_id_4d1c5ab2_fk_core_restaurant_id` (`restaurant_id`),
  CONSTRAINT `core_orderdish_dish_id_1d2996d4_fk_core_dish_id` FOREIGN KEY (`dish_id`) REFERENCES `core_dish` (`id`),
  CONSTRAINT `core_orderdish_order_id_d2a54379_fk_core_order_id` FOREIGN KEY (`order_id`) REFERENCES `core_order` (`id`),
  CONSTRAINT `core_orderdish_restaurant_id_4d1c5ab2_fk_core_restaurant_id` FOREIGN KEY (`restaurant_id`) REFERENCES `core_restaurant` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_orderdish`
--

LOCK TABLES `core_orderdish` WRITE;
/*!40000 ALTER TABLE `core_orderdish` DISABLE KEYS */;
INSERT INTO `core_orderdish` VALUES (3,'Hoàn thành','Cầu giấy, Hà Nội','0234436579',100000,1,'','2024-04-15 01:42:53.000000',25,3,10),(4,'Đã hủy','Cầu giấy, Hà Nội','0394367566',250000,1,'','2024-04-15 03:59:34.000000',23,3,10),(5,'Đã tiếp nhận','Cầu giấy, Hà Nội','0324845566',150000,1,'','2024-04-15 04:05:03.000000',21,3,10),(6,'Hoàn thành','Cầu Giấy, Hà Nội','0324345456',50000,1,'','2024-04-15 10:27:04.000000',24,3,10),(7,'Đã tiếp nhận','Cầu Giấy, Hà Nội','0324325666',50000,1,'','2024-04-15 10:30:12.000000',24,3,10);
/*!40000 ALTER TABLE `core_orderdish` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_provider`
--

DROP TABLE IF EXISTS `core_provider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_provider` (
  `id` int NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `admin_id` bigint NOT NULL,
  `restaurant_id` int DEFAULT NULL,
  `ID_card` varchar(12) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `business_license` varchar(100) DEFAULT NULL,
  `business_number` varchar(20) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `food_safty_cert` varchar(100) DEFAULT NULL,
  `fullname` varchar(255) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_id` (`admin_id`),
  KEY `core_provider_restaurant_id_f6429aa2_fk_core_restaurant_id` (`restaurant_id`),
  CONSTRAINT `core_provider_admin_id_0d7e8aec_fk_core_customuser_id` FOREIGN KEY (`admin_id`) REFERENCES `core_customuser` (`id`),
  CONSTRAINT `core_provider_restaurant_id_f6429aa2_fk_core_restaurant_id` FOREIGN KEY (`restaurant_id`) REFERENCES `core_restaurant` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_provider`
--

LOCK TABLES `core_provider` WRITE;
/*!40000 ALTER TABLE `core_provider` DISABLE KEYS */;
INSERT INTO `core_provider` VALUES (3,'2024-04-13 03:35:44.092347',NULL,4,5,'002352565465','Cầu giấy, Hà Nội','business_license/dang-ky-giay-phep-kinh-doanh_wEyZ8IY.jpg','KD-214522-TX-HN24','2000-03-02','safty_cert/chungnhan_nDVDqBK.jpg','Nguyễn Văn A','0234655677'),(4,'2024-04-14 16:37:50.424343',NULL,5,9,'023423567777','Cầu Giấy, Hà Nội','business_license/dang-ky-giay-phep-kinh-doanh_Dmeh8b9.jpg','KD-21153524','2001-03-02','safty_cert/chungnhan_ACWpTFX.jpg','Nguyễn Văn A','0328667846'),(5,'2024-04-15 01:11:31.790080',NULL,7,10,'023046565777','Cầu giấy, Hà nội','business_license/dang-ky-giay-phep-kinh-doanh_szDBgNr.jpg','KD-12i45832','2001-02-08','safty_cert/chungnhan_ehwZU3L.jpg','Nguyễn Văn Long','0324672349'),(6,'2024-04-15 10:32:51.141270',NULL,8,11,'234245456699','Cầu Giấy, Hà Nội','business_license/dang-ky-giay-phep-kinh-doanh_CNVwq8D.jpg','KD-21153524ư3we','2024-04-15','safty_cert/chungnhan_kKZkvW0.jpg','Nguyễn Văn A','0234234665');
/*!40000 ALTER TABLE `core_provider` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_restaurant`
--

DROP TABLE IF EXISTS `core_restaurant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_restaurant` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `address` longtext NOT NULL,
  `phone_number` varchar(20) NOT NULL,
  `banner` varchar(100) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `city_id` int NOT NULL,
  `logo` varchar(100) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `slug` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `core_restaurant_city_id_d59f3cac_fk_core_city_id` (`city_id`),
  KEY `core_restaurant_slug_7f0fc696` (`slug`),
  CONSTRAINT `core_restaurant_city_id_d59f3cac_fk_core_city_id` FOREIGN KEY (`city_id`) REFERENCES `core_city` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_restaurant`
--

LOCK TABLES `core_restaurant` WRITE;
/*!40000 ALTER TABLE `core_restaurant` DISABLE KEYS */;
INSERT INTO `core_restaurant` VALUES (1,'Burger King VietNam','15B/8 Lê Thánh Tôn, phường Bến Nghé, quận 1, TPHCM','19006960','banners/bgking.png','2024-04-10 16:00:44.592983',1,'default/logo.png',0,'burger-king'),(2,'Highlands Coffee','343E-343F Lạc Long Quân, Phường 5, Quận 11, Tp. Hồ Chí Minh','19001755','banners/highlands.png','2024-04-10 16:04:36.925371',2,'default/logo.png',0,'highlands-coffee'),(3,'Domino Pizza','491 Phan Văn Trị, Phường 5, Quận Gò Vấp','0234566734','banners/domipiz.jpg','2024-04-10 16:07:05.021662',2,'default/logo.png',0,'dominos-pizza'),(4,'Xôi Chú Ngọng - Đê La Thành','115 Hồ Đắc Di - Đống Đa','0394351950','banners/xoi.jpeg','2024-04-11 00:42:09.301485',1,'default/logo.png',0,'xoi-chu-ngong'),(5,'Nhà Hàng 289','289 Hoàng Quốc Việt, Cầu Giấy, Hà Nội','0234467688','default/banner.png','2024-04-13 03:35:44.100268',1,'default/logo.png',0,'nha-hang-289'),(6,'Kem Tràng Tiền','Tràng Tiền, Hà Nội','0234567999','default/banner.png','2024-04-13 05:41:50.931962',1,'default/logo.png',0,'kem-trang-tien'),(7,'Ốc Hương Trang','Ốc Hương Trang - 637 Đê La Thành, Hà Nội','0934567633','default/banner.png','2024-04-13 05:49:02.985221',1,'default/logo.png',0,'oc-huong-trang'),(8,'Eat Wise Healthy Food Store - 38 Nguyễn Khuyến','Eat Wise Healthy Food Store - 38 Nguyễn Khuyến, Hà Nội','0324579845','default/banner.png','2024-04-13 05:52:16.272045',1,'default/logo.png',0,'eat-wise-healthy'),(9,'Test Rest','Cầu Giấy, Hà Nội','0242566666','default/banner.png','2024-04-14 16:37:50.457358',1,'default/logo.png',1,NULL),(10,'Nhà Hàng WH','289 Hoàng Quốc Việt, Cầu Giấy, Hà Nội, Việt Nam','0123564336','banners/Yellow_Creative_Noodle_Food_Promotion_Banner__ImGfauZ.png','2024-04-15 01:11:31.802280',1,'default/logo.png',1,'nha-hang-wh'),(11,'Test Rest 1','Cầu Giấy, Hà Nội','6234325659','default/banner.png','2024-04-15 10:32:51.153322',1,'default/logo.png',1,NULL);
/*!40000 ALTER TABLE `core_restaurant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_review`
--

DROP TABLE IF EXISTS `core_review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_review` (
  `id` int NOT NULL AUTO_INCREMENT,
  `review` longtext NOT NULL,
  `rating` int DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `dish_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `core_review_dish_id_26ea04c5_fk_core_dish_id` (`dish_id`),
  KEY `core_review_user_id_b6106194_fk_core_customer_id` (`user_id`),
  CONSTRAINT `core_review_dish_id_26ea04c5_fk_core_dish_id` FOREIGN KEY (`dish_id`) REFERENCES `core_dish` (`id`),
  CONSTRAINT `core_review_user_id_b6106194_fk_core_customer_id` FOREIGN KEY (`user_id`) REFERENCES `core_customer` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_review`
--

LOCK TABLES `core_review` WRITE;
/*!40000 ALTER TABLE `core_review` DISABLE KEYS */;
INSERT INTO `core_review` VALUES (1,'Khá ngon',4,'2024-04-15 13:14:41.511505',25,1),(2,'Ngon',5,'2024-04-15 13:15:13.223782',24,3),(3,'Bánh mì nóng khá ngon, nhưng rau chưa ngon lắm',3,'2024-04-15 13:17:01.588747',23,4),(4,'Cơm ngon nhưng hơi nhiều dầu mỡ',3,'2024-04-15 13:17:48.869145',21,4),(5,'Cơm khá ngon',4,'2024-04-15 13:18:07.780461',21,5),(6,'Ngon',5,'2024-04-15 13:18:21.210145',22,6),(7,'Ngon',5,'2024-04-15 13:23:46.713945',25,5),(8,'Ngon',4,'2024-04-15 13:49:05.082886',20,1);
/*!40000 ALTER TABLE `core_review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_staff`
--

DROP TABLE IF EXISTS `core_staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_staff` (
  `id` int NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `admin_id` bigint NOT NULL,
  `restaurant_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_id` (`admin_id`),
  KEY `core_staff_restaurant_id_4e69c7b3_fk_core_restaurant_id` (`restaurant_id`),
  CONSTRAINT `core_staff_admin_id_da263703_fk_core_customuser_id` FOREIGN KEY (`admin_id`) REFERENCES `core_customuser` (`id`),
  CONSTRAINT `core_staff_restaurant_id_4e69c7b3_fk_core_restaurant_id` FOREIGN KEY (`restaurant_id`) REFERENCES `core_restaurant` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_staff`
--

LOCK TABLES `core_staff` WRITE;
/*!40000 ALTER TABLE `core_staff` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_toping`
--

DROP TABLE IF EXISTS `core_toping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_toping` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  `price` int NOT NULL,
  `dish_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `core_toping_dish_id_305e832e_fk_core_dish_id` (`dish_id`),
  CONSTRAINT `core_toping_dish_id_305e832e_fk_core_dish_id` FOREIGN KEY (`dish_id`) REFERENCES `core_dish` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_toping`
--

LOCK TABLES `core_toping` WRITE;
/*!40000 ALTER TABLE `core_toping` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_toping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_core_customuser_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_core_customuser_id` FOREIGN KEY (`user_id`) REFERENCES `core_customuser` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2024-04-09 14:37:36.566178','1','ID: 1 - Hà Nội',1,'[{\"added\": {}}]',7,1),(2,'2024-04-09 14:37:47.313934','2','ID: 2 - Thành Phố Hồ Chí Minh',1,'[{\"added\": {}}]',7,1),(3,'2024-04-09 14:37:57.654864','1','ID: 1 - Thành Phố Hà Nội',2,'[{\"changed\": {\"fields\": [\"Name\"]}}]',7,1),(4,'2024-04-09 14:38:02.858054','3','ID: 3 - Hà Nam',1,'[{\"added\": {}}]',7,1),(5,'2024-04-09 14:38:07.721928','4','ID: 4 - Bắc Ninh',1,'[{\"added\": {}}]',7,1),(6,'2024-04-09 14:38:15.415804','5','ID: 5 - Hải Phòng',1,'[{\"added\": {}}]',7,1),(7,'2024-04-09 14:38:19.114740','6','ID: 6 - Long An',1,'[{\"added\": {}}]',7,1),(8,'2024-04-09 14:38:24.410807','7','ID: 7 - Bình Định',1,'[{\"added\": {}}]',7,1),(9,'2024-04-09 14:38:30.650555','8','ID: 8 - Đà Nẵng',1,'[{\"added\": {}}]',7,1),(10,'2024-04-09 14:38:35.175796','9','ID: 9 - Nha Trang',1,'[{\"added\": {}}]',7,1),(11,'2024-04-09 14:38:40.182415','10','ID: 10 - Cần Thơ',1,'[{\"added\": {}}]',7,1),(12,'2024-04-10 15:51:40.376707','1','ID: 1 - Name: Fast Food',1,'[{\"added\": {}}]',10,1),(13,'2024-04-10 15:51:47.567122','2','ID: 2 - Name: Pizza',1,'[{\"added\": {}}]',10,1),(14,'2024-04-10 15:51:54.779989','3','ID: 3 - Name: Đồ uống',1,'[{\"added\": {}}]',10,1),(15,'2024-04-10 15:52:01.780191','4','ID: 4 - Name: Ice Cream',1,'[{\"added\": {}}]',10,1),(16,'2024-04-10 15:52:10.783049','5','ID: 5 - Name: Cà Phê',1,'[{\"added\": {}}]',10,1),(17,'2024-04-10 15:52:20.706705','6','ID: 6 - Name: Hải Sản',1,'[{\"added\": {}}]',10,1),(18,'2024-04-10 16:00:44.605478','1','ID: 1 - Name: Burger King VietNam - City:Thành Phố Hà Nội',1,'[{\"added\": {}}]',12,1),(19,'2024-04-10 16:04:36.933581','2','ID: 2 - Name: Highlands Coffee - City:Thành Phố Hồ Chí Minh',1,'[{\"added\": {}}]',12,1),(20,'2024-04-10 16:07:05.025405','3','ID: 3 - Name: Domino Pizza - City:Thành Phố Hồ Chí Minh',1,'[{\"added\": {}}]',12,1),(21,'2024-04-11 00:37:19.061324','1','ID: 1 - Name: Big Beef Burger - Restaurant: Burger King VietNam',1,'[{\"added\": {}}]',9,1),(22,'2024-04-11 00:40:21.243892','1','ID: 1 - Name: Big Beef Burger - Restaurant: Burger King VietNam',2,'[{\"changed\": {\"fields\": [\"Menu\"]}}]',9,1),(23,'2024-04-11 00:42:09.304486','4','ID: 4 - Name: Xôi Chú Ngọng - Đê La Thành - City:Thành Phố Hà Nội',1,'[{\"added\": {}}]',12,1),(24,'2024-04-11 00:44:02.403096','2','ID: 2 - Name: Trà Chanh Mật Ong 500ML - Restaurant: Xôi Chú Ngọng - Đê La Thành',1,'[{\"added\": {}}]',9,1),(25,'2024-04-11 00:45:24.882742','3','ID: 3 - Name: Trà Chanh Thái Lan 700ML - Restaurant: Xôi Chú Ngọng - Đê La Thành',1,'[{\"added\": {}}]',9,1),(26,'2024-04-11 00:45:34.560157','2','ID: 2 - Name: Trà Chanh Mật Ong 500ML - Restaurant: Xôi Chú Ngọng - Đê La Thành',2,'[{\"changed\": {\"fields\": [\"Type\"]}}]',9,1),(27,'2024-04-11 00:46:53.910109','4','ID: 4 - Name: Trà Dâu Tây 700ML - Restaurant: Xôi Chú Ngọng - Đê La Thành',1,'[{\"added\": {}}]',9,1),(28,'2024-04-11 01:52:36.774873','5','ID: 5 - Name: Đen đá - Restaurant: Xôi Chú Ngọng - Đê La Thành',1,'[{\"added\": {}}]',9,1),(29,'2024-04-13 03:35:24.538481','3','provider1',3,'',6,1),(30,'2024-04-13 04:40:01.267885','7','ID: 7 - Name: Healthy',1,'[{\"added\": {}}]',10,1),(31,'2024-04-13 05:30:37.503371','6','ID: 6 - Name: Combo King B 99k - Restaurant: Burger King VietNam',1,'[{\"added\": {}}]',9,1),(32,'2024-04-13 05:32:53.609971','7','ID: 7 - Name: Cheese Ring Beef Burger Combo - Restaurant: Burger King VietNam',1,'[{\"added\": {}}]',9,1),(33,'2024-04-13 05:34:45.429858','8','ID: 8 - Name: Pizza Singapore - Restaurant: Domino Pizza',1,'[{\"added\": {}}]',9,1),(34,'2024-04-13 05:35:56.006524','9','ID: 9 - Name: PIZZA SIÊU TOPPING HẢI SẢN - Restaurant: Domino Pizza',1,'[{\"added\": {}}]',9,1),(35,'2024-04-13 05:37:31.669499','10','ID: 10 - Name: Trà Ổi Hồng 700ML - Restaurant: Xôi Chú Ngọng - Đê La Thành',1,'[{\"added\": {}}]',9,1),(36,'2024-04-13 05:38:21.419725','11','ID: 11 - Name: Trà Đào Cam Sả 700ML - Restaurant: Xôi Chú Ngọng - Đê La Thành',1,'[{\"added\": {}}]',9,1),(37,'2024-04-13 05:41:50.934862','6','ID: 6 - Name: Kem Tràng Tiền - City:Thành Phố Hà Nội',1,'[{\"added\": {}}]',12,1),(38,'2024-04-13 05:42:13.533391','12','ID: 12 - Name: Ốc Quế Hạt Dẻ - Restaurant: Kem Tràng Tiền',1,'[{\"added\": {}}]',9,1),(39,'2024-04-13 05:43:05.928572','13','ID: 13 - Name: Phô Mai Hoàng Kim - Restaurant: Kem Tràng Tiền',1,'[{\"added\": {}}]',9,1),(40,'2024-04-13 05:45:16.840583','14','ID: 14 - Name: PHINDI CHOCO - Restaurant: Highlands Coffee',1,'[{\"added\": {}}]',9,1),(41,'2024-04-13 05:46:14.728550','15','ID: 15 - Name: PHINDI Kem Sữa - Restaurant: Highlands Coffee',1,'[{\"added\": {}}]',9,1),(42,'2024-04-13 05:49:02.988205','7','ID: 7 - Name: Ốc Hương Trang - City:Thành Phố Hà Nội',1,'[{\"added\": {}}]',12,1),(43,'2024-04-13 05:49:18.335502','16','ID: 16 - Name: Ốc Hương Trang - Restaurant: Ốc Hương Trang',1,'[{\"added\": {}}]',9,1),(44,'2024-04-13 05:50:18.809685','17','ID: 17 - Name: Bún Thái Hải Sản - Restaurant: Ốc Hương Trang',1,'[{\"added\": {}}]',9,1),(45,'2024-04-13 05:52:16.273716','8','ID: 8 - Name: Eat Wise Healthy Food Store - 38 Nguyễn Khuyến - City:Thành Phố Hà Nội',1,'[{\"added\": {}}]',12,1),(46,'2024-04-13 05:52:38.669599','18','ID: 18 - Name: Cơm lứt thăn heo sốt cà - Restaurant: Eat Wise Healthy Food Store - 38 Nguyễn Khuyến',1,'[{\"added\": {}}]',9,1),(47,'2024-04-13 05:53:41.739381','19','ID: 19 - Name: Ức gà cuộn rong biển 8 - Salad - KO cơm - Restaurant: Eat Wise Healthy Food Store - 38 Nguyễn Khuyến',1,'[{\"added\": {}}]',9,1),(48,'2024-04-13 08:27:04.307443','1','ID: 1 - Name: Fast Food',2,'[{\"changed\": {\"fields\": [\"Image\", \"Slug\"]}}]',10,1),(49,'2024-04-13 08:27:21.888823','2','ID: 2 - Name: Pizza',2,'[{\"changed\": {\"fields\": [\"Image\", \"Slug\"]}}]',10,1),(50,'2024-04-13 08:27:35.395340','3','ID: 3 - Name: Đồ uống',2,'[{\"changed\": {\"fields\": [\"Image\", \"Slug\"]}}]',10,1),(51,'2024-04-13 08:27:49.527865','4','ID: 4 - Name: Ice Cream',2,'[{\"changed\": {\"fields\": [\"Image\", \"Slug\"]}}]',10,1),(52,'2024-04-13 08:28:00.398327','5','ID: 5 - Name: Cà Phê',2,'[{\"changed\": {\"fields\": [\"Image\", \"Slug\"]}}]',10,1),(53,'2024-04-13 08:28:57.016204','6','ID: 6 - Name: Hải Sản',2,'[{\"changed\": {\"fields\": [\"Image\", \"Slug\"]}}]',10,1),(54,'2024-04-13 08:29:09.710235','7','ID: 7 - Name: Healthy',2,'[{\"changed\": {\"fields\": [\"Image\", \"Slug\"]}}]',10,1),(55,'2024-04-14 03:28:07.470286','1','ID: 1 - Name: Burger King VietNam - City:Thành Phố Hà Nội',2,'[{\"changed\": {\"fields\": [\"Slug\"]}}]',12,1),(56,'2024-04-14 03:28:29.677425','2','ID: 2 - Name: Highlands Coffee - City:Thành Phố Hồ Chí Minh',2,'[{\"changed\": {\"fields\": [\"Slug\"]}}]',12,1),(57,'2024-04-14 03:28:51.307300','3','ID: 3 - Name: Domino Pizza - City:Thành Phố Hồ Chí Minh',2,'[{\"changed\": {\"fields\": [\"Slug\"]}}]',12,1),(58,'2024-04-14 03:29:01.439992','4','ID: 4 - Name: Xôi Chú Ngọng - Đê La Thành - City:Thành Phố Hà Nội',2,'[{\"changed\": {\"fields\": [\"Slug\"]}}]',12,1),(59,'2024-04-14 03:29:10.981366','5','ID: 5 - Name: Nhà Hàng 289 - City:Thành Phố Hà Nội',2,'[{\"changed\": {\"fields\": [\"Slug\"]}}]',12,1),(60,'2024-04-14 03:29:20.936575','6','ID: 6 - Name: Kem Tràng Tiền - City:Thành Phố Hà Nội',2,'[{\"changed\": {\"fields\": [\"Slug\"]}}]',12,1),(61,'2024-04-14 03:29:31.565980','7','ID: 7 - Name: Ốc Hương Trang - City:Thành Phố Hà Nội',2,'[{\"changed\": {\"fields\": [\"Slug\"]}}]',12,1),(62,'2024-04-14 03:29:45.838188','8','ID: 8 - Name: Eat Wise Healthy Food Store - 38 Nguyễn Khuyến - City:Thành Phố Hà Nội',2,'[{\"changed\": {\"fields\": [\"Slug\"]}}]',12,1),(63,'2024-04-14 04:00:56.060676','3','ID: 3 - Name: Trà Chanh Thái Lan 700ML - Restaurant: Xôi Chú Ngọng - Đê La Thành',2,'[{\"changed\": {\"fields\": [\"Menu\"]}}]',9,1),(64,'2024-04-14 16:38:26.375504','9','ID: 9 - Name: Test Rest - City:Thành Phố Hà Nội',2,'[{\"changed\": {\"fields\": [\"Is active\"]}}]',12,1),(65,'2024-04-15 01:18:29.471311','10','ID: 10 - Name: Nhà Hàng WH - City:Thành Phố Hà Nội',2,'[{\"changed\": {\"fields\": [\"Slug\", \"Is active\"]}}]',12,1),(66,'2024-04-15 01:33:20.319713','3','ID: 3 - ITEM: admin - TOTAL PRICE: 500',1,'[{\"added\": {}}]',11,1),(67,'2024-04-15 01:39:12.382048','3','ID: 3 - ITEM: admin - TOTAL PRICE: 500000',2,'[{\"changed\": {\"fields\": [\"Total price\"]}}]',11,1),(68,'2024-04-15 01:42:53.939386','3','3 - FROM Nhà Hàng WH TO admin PRICE 100000 STATUS Đang chờ xử lý AT 2024-04-15 01:42:53.928682+00:00',1,'[{\"added\": {}}]',16,1),(69,'2024-04-15 02:03:00.164444','3','3 - FROM Nhà Hàng WH TO admin PRICE 100000 STATUS Hoàn thành AT 2024-04-15 01:42:53.928682+00:00',2,'[{\"changed\": {\"fields\": [\"Status\"]}}]',16,1),(70,'2024-04-15 03:59:34.140796','4','4 - FROM Nhà Hàng WH TO admin PRICE 250000 STATUS Đang chờ xử lý AT 2024-04-15 03:59:34.128645+00:00',1,'[{\"added\": {}}]',16,1),(71,'2024-04-15 04:05:03.534651','5','5 - FROM Nhà Hàng WH TO admin PRICE 150000 STATUS Đang chờ xử lý AT 2024-04-15 04:05:03.525248+00:00',1,'[{\"added\": {}}]',16,1),(72,'2024-04-15 07:12:53.722577','8','ID: 8 - Name: Cơm',1,'[{\"added\": {}}]',10,1),(73,'2024-04-15 07:14:38.644993','20','ID: 20 - Name: Cơm rang thập cẩm nhiều cơm - Restaurant: Nhà Hàng WH',1,'[{\"added\": {}}]',9,1),(74,'2024-04-15 07:15:51.190986','21','ID: 21 - Name: Cơm Rang Hải Sản - Restaurant: Nhà Hàng WH',1,'[{\"added\": {}}]',9,1),(75,'2024-04-15 07:16:48.128407','22','ID: 22 - Name: Cơm Rang Dưa Bò+1 Pepsi (Coca) - Restaurant: Nhà Hàng WH',1,'[{\"added\": {}}]',9,1),(76,'2024-04-15 07:24:06.437488','9','ID: 9 - Name: Bánh Mì',1,'[{\"added\": {}}]',10,1),(77,'2024-04-15 07:25:53.051072','23','ID: 23 - Name: Bánh mì nem khoai - Restaurant: Nhà Hàng WH',1,'[{\"added\": {}}]',9,1),(78,'2024-04-15 07:26:30.553622','24','ID: 24 - Name: Bánh mì xúc xích, lạp sườn - Restaurant: Nhà Hàng WH',1,'[{\"added\": {}}]',9,1),(79,'2024-04-15 09:12:08.764088','5','5 - FROM Nhà Hàng WH TO admin PRICE 150000 STATUS Đang chờ xử lý AT 2024-04-15 11:05:03+07:00',2,'[{\"changed\": {\"fields\": [\"Dish\"]}}]',16,1),(80,'2024-04-15 09:12:25.699252','4','4 - FROM Nhà Hàng WH TO admin PRICE 250000 STATUS Đang chờ xử lý AT 2024-04-15 10:59:34+07:00',2,'[{\"changed\": {\"fields\": [\"Dish\"]}}]',16,1),(81,'2024-04-15 09:12:34.458822','3','3 - FROM Nhà Hàng WH TO admin PRICE 100000 STATUS Hoàn thành AT 2024-04-15 08:42:53+07:00',2,'[{\"changed\": {\"fields\": [\"Dish\"]}}]',16,1),(82,'2024-04-15 10:27:05.860208','6','6 - FROM Nhà Hàng WH TO admin PRICE 50000 STATUS Đang chờ xử lý AT 2024-04-15 17:27:04+07:00',1,'[{\"added\": {}}]',16,1),(83,'2024-04-15 10:30:16.295055','7','7 - FROM Nhà Hàng WH TO admin PRICE 50000 STATUS Đang chờ xử lý AT 2024-04-15 17:30:12+07:00',1,'[{\"added\": {}}]',16,1),(84,'2024-04-15 10:33:20.480708','11','ID: 11 - Name: Test Rest 1 - City:Thành Phố Hà Nội',2,'[{\"changed\": {\"fields\": [\"Is active\"]}}]',12,1),(85,'2024-04-15 13:14:41.522708','1','ID: 1 - Dish: KFC Deal 149K - Rating: 4',1,'[{\"added\": {}}]',14,1),(86,'2024-04-15 13:15:13.230587','2','ID: 2 - Dish: Bánh mì xúc xích, lạp sườn - Rating: 5',1,'[{\"added\": {}}]',14,1),(87,'2024-04-15 13:17:01.588747','3','ID: 3 - Dish: Bánh mì nem khoai - Rating: 3',1,'[{\"added\": {}}]',14,1),(88,'2024-04-15 13:17:48.873830','4','ID: 4 - Dish: Cơm Rang Hải Sản - Rating: 3',1,'[{\"added\": {}}]',14,1),(89,'2024-04-15 13:18:07.789446','5','ID: 5 - Dish: Cơm Rang Hải Sản - Rating: 4',1,'[{\"added\": {}}]',14,1),(90,'2024-04-15 13:18:21.210145','6','ID: 6 - Dish: Cơm Rang Dưa Bò+1 Pepsi (Coca) - Rating: 5',1,'[{\"added\": {}}]',14,1),(91,'2024-04-15 13:23:46.716396','7','ID: 7 - Dish: KFC Deal 149K - Rating: 5',1,'[{\"added\": {}}]',14,1),(92,'2024-04-15 13:47:04.131388','4','ID: 4 - Dish: Cơm Rang Hải Sản - Rating: 3',2,'[{\"changed\": {\"fields\": [\"User\"]}}]',14,1),(93,'2024-04-15 13:49:05.084391','8','ID: 8 - Dish: Cơm rang thập cẩm nhiều cơm - Rating: 4',1,'[{\"added\": {}}]',14,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'contenttypes','contenttype'),(7,'core','city'),(8,'core','customer'),(6,'core','customuser'),(9,'core','dish'),(10,'core','menu'),(11,'core','order'),(16,'core','orderdish'),(15,'core','provider'),(12,'core','restaurant'),(14,'core','review'),(13,'core','staff'),(17,'core','toping'),(5,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2024-04-09 12:45:07.687738'),(2,'contenttypes','0002_remove_content_type_name','2024-04-09 12:45:07.746019'),(3,'auth','0001_initial','2024-04-09 12:45:08.032682'),(4,'auth','0002_alter_permission_name_max_length','2024-04-09 12:45:08.128878'),(5,'auth','0003_alter_user_email_max_length','2024-04-09 12:45:08.137787'),(6,'auth','0004_alter_user_username_opts','2024-04-09 12:45:08.143786'),(7,'auth','0005_alter_user_last_login_null','2024-04-09 12:45:08.149787'),(8,'auth','0006_require_contenttypes_0002','2024-04-09 12:45:08.152927'),(9,'auth','0007_alter_validators_add_error_messages','2024-04-09 12:45:08.158301'),(10,'auth','0008_alter_user_username_max_length','2024-04-09 12:45:08.163301'),(11,'auth','0009_alter_user_last_name_max_length','2024-04-09 12:45:08.170335'),(12,'auth','0010_alter_group_name_max_length','2024-04-09 12:45:08.185322'),(13,'auth','0011_update_proxy_permissions','2024-04-09 12:45:08.193303'),(14,'auth','0012_alter_user_first_name_max_length','2024-04-09 12:45:08.204730'),(15,'core','0001_initial','2024-04-09 12:45:09.542982'),(16,'admin','0001_initial','2024-04-09 12:45:09.652643'),(17,'admin','0002_logentry_remove_auto_add','2024-04-09 12:45:09.664674'),(18,'admin','0003_logentry_add_action_flag_choices','2024-04-09 12:45:09.671412'),(19,'sessions','0001_initial','2024-04-09 12:45:09.715499'),(20,'core','0002_dish_menu','2024-04-11 00:39:51.531257'),(21,'core','0003_provider_id_card_provider_address_and_more','2024-04-13 02:05:48.415078'),(22,'core','0004_restaurant_logo_alter_customer_avatar_and_more','2024-04-13 03:01:28.809538'),(23,'core','0005_alter_restaurant_city','2024-04-13 03:03:13.037972'),(24,'core','0006_alter_provider_admin_alter_staff_admin','2024-04-13 03:13:34.520129'),(25,'core','0007_restaurant_is_active','2024-04-13 03:24:56.675242'),(26,'core','0008_menu_image','2024-04-13 08:07:24.387419'),(27,'core','0009_menu_slug','2024-04-13 08:24:27.243063'),(28,'core','0010_toping','2024-04-14 03:25:52.923339'),(29,'core','0011_restaurant_slug','2024-04-14 03:27:04.880450'),(30,'core','0012_alter_orderdish_status','2024-04-15 01:38:07.703215'),(31,'core','0013_alter_toping_dish','2024-04-15 08:29:01.510071'),(32,'core','0014_review_review_type_alter_orderdish_created_at','2024-04-15 13:21:14.713800'),(33,'core','0015_remove_review_review_type','2024-04-15 13:23:05.869005'),(34,'core','0016_rename_creted_at_dish_created_at','2024-04-15 13:38:33.534456');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('3nofw2byywbh45k85p2jgdu1pdq7xjbg','.eJxVjMsOwiAURP-FtSEg4RZduvcbyH2AVA1NSrtq_Hdp0oXuJnPOzKYirkuJa0tzHEVdlVWn346QX6nuQJ5YH5PmqS7zSHpX9EGbvk-S3rfD_Tso2EpfO-sxubOYgD0EQc9ECBDIOunEA9PFDwMCgjHZBZM9GmJKkC0Kq88X_x45Ag:1rwM9t:J8xKDlBLJrs1iq0Iz5ooVyIpvyw0JICgWf-kwl0w-aY','2024-04-29 13:14:05.342658'),('49uhcua1mlakun5u0lrujijutwqjcun6','.eJxVjMsOwiAURP-FtSEg4RZduvcbyH2AVA1NSrtq_Hdp0oXuJnPOzKYirkuJa0tzHEVdlVWn346QX6nuQJ5YH5PmqS7zSHpX9EGbvk-S3rfD_Tso2EpfO-sxubOYgD0EQc9ECBDIOunEA9PFDwMCgjHZBZM9GmJKkC0Kq88X_x45Ag:1rwBAq:aTOzqikhrThaXc-WtB-xnD6F0kGrbQdmHM4Q2JLDSTU','2024-04-29 01:30:20.839785'),('8thnlujbphlhewcvb0bff6xaybubm8kz','.eJxVjMsOwiAURP-FtSEg4RZduvcbyH2AVA1NSrtq_Hdp0oXuJnPOzKYirkuJa0tzHEVdlVWn346QX6nuQJ5YH5PmqS7zSHpX9EGbvk-S3rfD_Tso2EpfO-sxubOYgD0EQc9ECBDIOunEA9PFDwMCgjHZBZM9GmJKkC0Kq88X_x45Ag:1rvVAy:Nx-CxQGXXoTo99rifjF5uF56sf1GRWNr2k75IobviR8','2024-04-27 04:39:40.454718'),('ak625vprg89yoms4tdq2wxv0gjtarsbp','.eJxVjDsOwyAQBe9CHSFg-aZM7zOgxQvBSYQlY1dR7h4huUi6pzejebOIx17j0fMWF2JX5tjl90s4P3MbgB7Y7iuf17ZvS-JD4SftfFopv26n-xeo2OvImuKFKcJLQRrGIFKAwnrQgDmolKVC5YPxjkqwLiQZrHVgZNEagH2-u-o2bQ:1rwM2n:0uipH7SsU7MA4slwatMSbK-jKWU3Ttqk6roVUbo1w0Q','2024-04-29 13:06:45.452386'),('dbio0i63afqpzc87wqyq1mm0vlg6ske3','.eJxVjMsOwiAURP-FtSEg4RZduvcbyH2AVA1NSrtq_Hdp0oXuJnPOzKYirkuJa0tzHEVdlVWn346QX6nuQJ5YH5PmqS7zSHpX9EGbvk-S3rfD_Tso2EpfO-sxubOYgD0EQc9ECBDIOunEA9PFDwMCgjHZBZM9GmJKkC0Kq88X_x45Ag:1rvUAZ:Lm_R6z7PR1gLela2Fl8a3k7EfTvI7V0zop8WlkyJauc','2024-04-27 03:35:11.561423'),('dc8fp48i4j1xkgacg1lir4uai1xjdqkp','.eJxVjMsOwiAURP-FtSEg4RZduvcbyH2AVA1NSrtq_Hdp0oXuJnPOzKYirkuJa0tzHEVdlVWn346QX6nuQJ5YH5PmqS7zSHpX9EGbvk-S3rfD_Tso2EpfO-sxubOYgD0EQc9ECBDIOunEA9PFDwMCgjHZBZM9GmJKkC0Kq88X_x45Ag:1rwMfV:A69arOReA8OUNeQk_5N3uYdCij8LBKxEvAZU0jxStZE','2024-04-29 13:46:45.802012'),('dnxbyvtc8akd7b6eobgowosv9dt86r89','.eJxVjMsOwiAURP-FtSEg4RZduvcbyH2AVA1NSrtq_Hdp0oXuJnPOzKYirkuJa0tzHEVdlVWn346QX6nuQJ5YH5PmqS7zSHpX9EGbvk-S3rfD_Tso2EpfO-sxubOYgD0EQc9ECBDIOunEA9PFDwMCgjHZBZM9GmJKkC0Kq88X_x45Ag:1rvTfL:hGN3ijeAm3YMw8jp2ryZGxDrcIO8JdjhSErYiFMc5cE','2024-04-27 03:02:55.614577'),('q7bm4c8r16emh2tz0aotewmgxihke26a','.eJxVjMsOwiAURP-FtSEg4RZduvcbyH2AVA1NSrtq_Hdp0oXuJnPOzKYirkuJa0tzHEVdlVWn346QX6nuQJ5YH5PmqS7zSHpX9EGbvk-S3rfD_Tso2EpfO-sxubOYgD0EQc9ECBDIOunEA9PFDwMCgjHZBZM9GmJKkC0Kq88X_x45Ag:1rwJSo:ay1G533FYr6vC18TwbM0B2L58ob5eeShdx-9Eu7IRBk','2024-04-29 10:21:26.013400'),('ugjyhnf69eeq1bcwropr3bj7cxyuonaj','.eJxVjMsOwiAURP-FtSEg4RZduvcbyH2AVA1NSrtq_Hdp0oXuJnPOzKYirkuJa0tzHEVdlVWn346QX6nuQJ5YH5PmqS7zSHpX9EGbvk-S3rfD_Tso2EpfO-sxubOYgD0EQc9ECBDIOunEA9PFDwMCgjHZBZM9GmJKkC0Kq88X_x45Ag:1ruDVB:7po0wNpRPwk5RsYABEz38eGkNDMY9muivIFsVszGhJw','2024-04-23 15:35:13.936396'),('y7jlpb004dnwnfy7r0ps2i9q7x0byn3n','.eJxVjMsOwiAURP-FtSEg4RZduvcbyH2AVA1NSrtq_Hdp0oXuJnPOzKYirkuJa0tzHEVdlVWn346QX6nuQJ5YH5PmqS7zSHpX9EGbvk-S3rfD_Tso2EpfO-sxubOYgD0EQc9ECBDIOunEA9PFDwMCgjHZBZM9GmJKkC0Kq88X_x45Ag:1rwDJW:XdD58F-dRKDZWxw9dTzjfUjYb9nCFqEYZxoWoZgKuZc','2024-04-29 03:47:26.733760'),('yfk6bpadhraewaz5cf63xzvlxta4lyu9','.eJxVjDsOwyAQBe9CHSFg-aZM7zOgxQvBSYQlY1dR7h4huUi6pzejebOIx17j0fMWF2JX5tjl90s4P3MbgB7Y7iuf17ZvS-JD4SftfFopv26n-xeo2OvImuKFKcJLQRrGIFKAwnrQgDmolKVC5YPxjkqwLiQZrHVgZNEagH2-u-o2bQ:1rwAzf:I_u34yJhSjyOitG0X0YK6ARET5OviyEIz55Bf1ZAFRY','2024-04-29 01:18:47.196317');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-15 21:35:58
