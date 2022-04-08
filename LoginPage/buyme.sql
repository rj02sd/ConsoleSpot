CREATE DATABASE  IF NOT EXISTS `buyme` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `buyme`;
-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: buyme
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `accounts`
--

DROP TABLE IF EXISTS `accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts` (
  `username` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts`
--

LOCK TABLES `accounts` WRITE;
/*!40000 ALTER TABLE `accounts` DISABLE KEYS */;
INSERT INTO `accounts` VALUES ('admin','adminpw'),('random','12345'),('user1','pass1');
/*!40000 ALTER TABLE `accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bidders`
--

DROP TABLE IF EXISTS `bidders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bidders` (
  `listing_id` int DEFAULT NULL,
  `bidder_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `current_bid` double DEFAULT NULL,
  `upper_bid_limit` double DEFAULT NULL,
  KEY `bidder_id_idx` (`bidder_id`),
  CONSTRAINT `bidder_id` FOREIGN KEY (`bidder_id`) REFERENCES `end_users` (`end_username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bidders`
--

LOCK TABLES `bidders` WRITE;
/*!40000 ALTER TABLE `bidders` DISABLE KEYS */;
/*!40000 ALTER TABLE `bidders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `end_users`
--

DROP TABLE IF EXISTS `end_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `end_users` (
  `end_username` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `anon` tinyint DEFAULT NULL,
  PRIMARY KEY (`end_username`),
  CONSTRAINT `end_username` FOREIGN KEY (`end_username`) REFERENCES `accounts` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `end_users`
--

LOCK TABLES `end_users` WRITE;
/*!40000 ALTER TABLE `end_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `end_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `listings`
--

DROP TABLE IF EXISTS `listings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `listings` (
  `listing_id` int NOT NULL,
  `start_price` double DEFAULT NULL,
  `highest_bid` double DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `minimum_price` double DEFAULT NULL,
  `increment_price` double DEFAULT NULL,
  `seller_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`listing_id`),
  KEY `seller_id_idx` (`seller_id`),
  CONSTRAINT `seller_id` FOREIGN KEY (`seller_id`) REFERENCES `end_users` (`end_username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `listings`
--

LOCK TABLES `listings` WRITE;
/*!40000 ALTER TABLE `listings` DISABLE KEYS */;
/*!40000 ALTER TABLE `listings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `message` (
  `sender` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `date_time` datetime DEFAULT NULL,
  `ticket` int DEFAULT NULL,
  `message` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  KEY `ticket_idx` (`ticket`),
  KEY `user_name_idx` (`sender`),
  CONSTRAINT `sender` FOREIGN KEY (`sender`) REFERENCES `accounts` (`username`),
  CONSTRAINT `ticket` FOREIGN KEY (`ticket`) REFERENCES `support_record` (`support_ticket`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
/*!40000 ALTER TABLE `message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nintendo_switch`
--

DROP TABLE IF EXISTS `nintendo_switch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nintendo_switch` (
  `id` int DEFAULT NULL,
  `screensize` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `multiple_playmodes` tinyint DEFAULT NULL,
  `d_or_d` varchar(7) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `oled_or_lcd` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  KEY `id_idx` (`id`),
  CONSTRAINT `id` FOREIGN KEY (`id`) REFERENCES `video_game_consoles` (`console_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nintendo_switch`
--

LOCK TABLES `nintendo_switch` WRITE;
/*!40000 ALTER TABLE `nintendo_switch` DISABLE KEYS */;
/*!40000 ALTER TABLE `nintendo_switch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff` (
  `staffid` int NOT NULL,
  `username` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `position` tinyint DEFAULT NULL,
  PRIMARY KEY (`staffid`),
  KEY `username_idx` (`username`),
  CONSTRAINT `username` FOREIGN KEY (`username`) REFERENCES `accounts` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `support_record`
--

DROP TABLE IF EXISTS `support_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `support_record` (
  `support_ticket` int NOT NULL,
  `staff_id` int DEFAULT NULL,
  `user_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`support_ticket`),
  KEY `staff_id_idx` (`staff_id`),
  KEY `user_name_idx` (`user_name`),
  CONSTRAINT `staff_id` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`staffid`),
  CONSTRAINT `user_name` FOREIGN KEY (`user_name`) REFERENCES `accounts` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `support_record`
--

LOCK TABLES `support_record` WRITE;
/*!40000 ALTER TABLE `support_record` DISABLE KEYS */;
/*!40000 ALTER TABLE `support_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `video_game_consoles`
--

DROP TABLE IF EXISTS `video_game_consoles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `video_game_consoles` (
  `console_id` int NOT NULL,
  `manufacturer` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `model` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `color` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `new_or_used` tinyint DEFAULT NULL,
  `storage_space` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `warranty` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `resolution` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`console_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `video_game_consoles`
--

LOCK TABLES `video_game_consoles` WRITE;
/*!40000 ALTER TABLE `video_game_consoles` DISABLE KEYS */;
/*!40000 ALTER TABLE `video_game_consoles` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-08 14:00:50
