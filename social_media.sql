-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: social_media
-- ------------------------------------------------------
-- Server version	8.4.4

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
-- Table structure for table `follows`
--

DROP TABLE IF EXISTS `follows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `follows` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `follower_id` bigint DEFAULT NULL,
  `following_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKqnkw0cwwh6572nyhvdjqlr163` (`follower_id`),
  KEY `FKonkdkae2ngtx70jqhsh7ol6uq` (`following_id`),
  CONSTRAINT `FKonkdkae2ngtx70jqhsh7ol6uq` FOREIGN KEY (`following_id`) REFERENCES `users` (`id`),
  CONSTRAINT `FKqnkw0cwwh6572nyhvdjqlr163` FOREIGN KEY (`follower_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `follows`
--

LOCK TABLES `follows` WRITE;
/*!40000 ALTER TABLE `follows` DISABLE KEYS */;
INSERT INTO `follows` VALUES (36,6,4),(55,8,4),(68,9,7),(70,9,3),(76,4,3),(78,4,7),(85,3,7),(96,19,14),(97,19,7),(98,23,14),(101,5,7),(102,5,3);
/*!40000 ALTER TABLE `follows` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `body` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `deleted_at` datetime(6) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK5lidm6cqbc7u4xhqpxm898qme` (`user_id`),
  CONSTRAINT `FK5lidm6cqbc7u4xhqpxm898qme` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (1,'hhhhhhhhhhhhhhhhhhhh','2025-02-26 22:25:25.205013','2025-02-27 09:30:40.157793','DELETED','hhhhhhhhhhhhhhhhh','2025-02-26 22:25:25.205013',1),(2,'da fix','2025-02-26 22:35:23.121498','2025-02-27 09:30:36.962457','DELETED','da fix','2025-02-26 22:35:23.121498',4),(3,'sua lai loi thanh cong','2025-02-27 10:05:04.958183','2025-02-27 10:33:59.964648','DELETED','da fix','2025-02-27 10:33:59.964648',3),(4,'fix dc chuc nang dang nhap','2025-02-27 10:05:39.168257','2025-02-27 22:13:09.760769','DELETED','can fix','2025-02-27 10:05:39.168348',4),(5,'da xong','2025-02-27 10:06:55.736285','2025-02-27 10:08:02.794805','DELETED','da xong ','2025-02-27 10:08:02.794805',6),(6,'dáº¥dasdas','2025-02-27 10:33:42.159741','2025-02-27 10:34:01.770829','DELETED','da xong ','2025-02-27 10:34:01.770829',3),(7,'dÃ¡da','2025-02-27 10:34:12.710531','2025-02-27 22:13:06.655070','DELETED','da fix','2025-02-27 10:34:12.710531',3),(8,'dáº¥d','2025-02-27 10:34:38.448945','2025-02-27 10:35:22.355868','DELETED','ÄÃ¡','2025-02-27 10:35:22.355868',7),(9,'dasdas','2025-02-27 11:18:25.262401','2025-02-27 22:13:04.265086','DELETED','hhhhhhhhhhhhhhhhh','2025-02-27 11:18:25.262401',8),(10,'sdads','2025-02-27 22:12:39.867258','2025-02-27 22:13:00.932564','DELETED','hhhhhhhhhhhhhhhhh','2025-02-27 22:12:39.867258',7),(11,'xin chao day la tesst','2025-02-28 20:41:17.166991',NULL,'ACTIVE','iu riot','2025-03-09 22:29:38.275403',3),(12,'ddd','2025-02-28 20:42:53.373566',NULL,'ACTIVE','da xong ','2025-02-28 20:42:53.373566',7),(13,'gckcyvyvuvugbibbiuyuiuvuviuvub','2025-03-11 14:32:04.911135',NULL,'ACTIVE','hhhhhhhhhhhhhhhhh','2025-03-11 14:32:12.998142',7),(14,'hhhhhhhhhhhhhhhhh','2025-03-11 14:34:33.587073',NULL,'ACTIVE','hhhhhhhhhhhhhhhhh','2025-03-11 14:34:33.587073',4),(15,'cdcddxcx','2025-03-11 14:35:06.879623',NULL,'ACTIVE','da fix','2025-03-11 14:35:06.879623',3),(16,'dfdvfdcscscscscfsc','2025-03-11 14:35:18.667987',NULL,'ACTIVE','hhhhhhhhhhhhhhhhh','2025-03-11 14:35:18.667987',3),(17,'dáº¥daddas','2025-03-19 22:54:10.401403',NULL,'ACTIVE','da xong ','2025-03-19 22:54:10.401403',7),(19,'ÄÃ¡','2025-03-30 11:18:51.957026',NULL,'ACTIVE','xin  chao ngay moi','2025-03-30 11:18:51.957026',3),(20,'ÄÃ¡','2025-03-30 17:05:45.891928',NULL,'ACTIVE','dÃ¡','2025-03-30 17:05:45.891928',7),(21,'123','2025-04-14 23:36:54.003967',NULL,'ACTIVE','de','2025-04-14 23:36:54.003967',14),(22,'da','2025-04-15 20:28:55.201662',NULL,'ACTIVE','de','2025-04-15 20:28:55.201662',23),(23,'met lam roi','2025-04-15 14:40:00.270362',NULL,'ACTIVE','qua met moi','2025-04-15 14:40:00.270362',5);
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `provinces`
--

DROP TABLE IF EXISTS `provinces`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `provinces` (
  `idProvince` int NOT NULL AUTO_INCREMENT,
  `nameProvince` varchar(100) NOT NULL,
  `note` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idProvince`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provinces`
--

LOCK TABLES `provinces` WRITE;
/*!40000 ALTER TABLE `provinces` DISABLE KEYS */;
INSERT INTO `provinces` VALUES (1,'An Giang','Tỉnh'),(2,'Bà Rịa - Vũng Tàu','Tỉnh'),(3,'Bắc Giang','Tỉnh'),(4,'Bắc Kạn','Tỉnh'),(5,'Bạc Liêu','Tỉnh'),(6,'Bắc Ninh','Tỉnh'),(7,'Bến Tre','Tỉnh'),(8,'Bình Định','Tỉnh'),(9,'Bình Dương','Tỉnh'),(10,'Bình Phước','Tỉnh'),(11,'Bình Thuận','Tỉnh'),(12,'Cà Mau','Tỉnh'),(13,'Cần Thơ','Thành phố trực thuộc trung ương'),(14,'Cao Bằng','Tỉnh'),(15,'Đà Nẵng','Thành phố trực thuộc trung ương'),(16,'Đắk Lắk','Tỉnh'),(17,'Đắk Nông','Tỉnh'),(18,'Điện Biên','Tỉnh'),(19,'Đồng Nai','Tỉnh'),(20,'Đồng Tháp','Tỉnh'),(21,'Gia Lai','Tỉnh'),(22,'Hà Giang','Tỉnh'),(23,'Hà Nam','Tỉnh'),(24,'Hà Nội','Thành phố trực thuộc trung ương'),(25,'Hà Tĩnh','Tỉnh'),(26,'Hải Dương','Tỉnh'),(27,'Hải Phòng','Thành phố trực thuộc trung ương'),(28,'Hậu Giang','Tỉnh'),(29,'Hòa Bình','Tỉnh'),(30,'Hưng Yên','Tỉnh'),(31,'Khánh Hòa','Tỉnh'),(32,'Kiên Giang','Tỉnh'),(33,'Kon Tum','Tỉnh'),(34,'Lai Châu','Tỉnh'),(35,'Lâm Đồng','Tỉnh'),(36,'Lạng Sơn','Tỉnh'),(37,'Lào Cai','Tỉnh'),(38,'Long An','Tỉnh'),(39,'Nam Định','Tỉnh'),(40,'Nghệ An','Tỉnh'),(41,'Ninh Bình','Tỉnh'),(42,'Ninh Thuận','Tỉnh'),(43,'Phú Thọ','Tỉnh'),(44,'Phú Yên','Tỉnh'),(45,'Quảng Bình','Tỉnh'),(46,'Quảng Nam','Tỉnh'),(47,'Quảng Ngãi','Tỉnh'),(48,'Quảng Ninh','Tỉnh'),(49,'Quảng Trị','Tỉnh'),(50,'Sóc Trăng','Tỉnh'),(51,'Sơn La','Tỉnh'),(52,'Tây Ninh','Tỉnh'),(53,'Thái Bình','Tỉnh'),(54,'Thái Nguyên','Tỉnh'),(55,'Thanh Hóa','Tỉnh'),(56,'Thừa Thiên Huế','Tỉnh'),(57,'Tiền Giang','Tỉnh'),(58,'TP Hồ Chí Minh','Thành phố trực thuộc trung ương'),(59,'Trà Vinh','Tỉnh'),(60,'Tuyên Quang','Tỉnh'),(61,'Vĩnh Long','Tỉnh'),(62,'Vĩnh Phúc','Tỉnh'),(63,'Yên Bái','Tỉnh');
/*!40000 ALTER TABLE `provinces` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `province_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `fk_users_province` (`province_id`),
  CONSTRAINT `fk_users_province` FOREIGN KEY (`province_id`) REFERENCES `provinces` (`idProvince`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'2025-02-26 22:25:14.984645','11111111','ADMIN','daiblack1852',NULL,NULL,NULL),(2,'2025-02-26 22:27:43.220522','11111111','USER','daiblack2004',NULL,NULL,NULL),(3,'2025-02-26 22:28:32.055229','1852','ADMIN','quockhanh2014',NULL,NULL,NULL),(4,'2025-02-26 22:34:58.454716','1234','ADMIN','dai1234',NULL,NULL,NULL),(5,'2025-02-27 09:25:47.604226','12345','USER','khanh123',NULL,NULL,NULL),(6,'2025-02-27 10:06:31.852329','12345','USER','dao12345',NULL,NULL,NULL),(7,'2025-02-27 10:21:54.879183','1852','USER','quocdai1234',NULL,NULL,NULL),(8,'2025-02-27 11:17:50.704873','321','USER','dao123',NULL,NULL,NULL),(9,'2025-02-28 20:43:15.836092','123','USER','quocdai123',NULL,NULL,NULL),(10,'2025-03-11 14:40:03.848031','133','USER','123',NULL,NULL,NULL),(11,'2025-03-19 22:53:12.868878','koi123','USER','koi123',NULL,NULL,NULL),(12,'2025-03-20 09:53:49.526331','123456','USER','oic',NULL,NULL,NULL),(13,'2025-03-30 11:19:46.316427','123','USER','ocd',NULL,NULL,NULL),(14,'2025-03-30 16:54:51.118820','123','USER','de',NULL,NULL,NULL),(15,'2025-04-01 13:08:02.015195','123','USER','dao',NULL,NULL,NULL),(16,'2025-04-09 18:38:30.053685','123','USER','da',NULL,NULL,NULL),(17,'2025-04-13 23:23:01.125399','123','USER','dr',NULL,NULL,NULL),(18,'2025-04-15 19:55:15.643249','123','USER','qr',NULL,NULL,NULL),(19,'2025-04-15 20:06:55.934111','123','USER','ki',NULL,NULL,NULL),(20,'2025-04-15 20:12:50.964155','123','USER','dac',NULL,NULL,NULL),(21,'2025-04-15 20:18:12.229758','123','USER','vui',NULL,NULL,NULL),(22,'2025-04-15 20:22:35.181228','123','USER','ve',NULL,NULL,NULL),(23,'2025-04-15 20:28:28.583146','123','USER','v',NULL,NULL,NULL),(24,'2025-04-15 20:34:05.793294','123','USER','123',NULL,NULL,NULL),(25,'2025-04-15 14:44:19.657310','k','USER','khanh',NULL,NULL,NULL);
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

-- Dump completed on 2025-04-17 22:27:47
