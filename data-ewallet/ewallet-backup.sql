-- MySQL dump 10.13  Distrib 8.3.0, for Win64 (x86_64)
--
-- Host: localhost    Database: ewallet
-- ------------------------------------------------------
-- Server version	8.3.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `tbl_card`
--

DROP TABLE IF EXISTS `tbl_card`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_card` (
  `card_id` int NOT NULL AUTO_INCREMENT,
  `card_number` varchar(13) DEFAULT NULL,
  `member_id` int DEFAULT NULL,
  `pin` varchar(6) DEFAULT NULL,
  `balance` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`card_id`),
  UNIQUE KEY `card_number` (`card_number`),
  KEY `member_id` (`member_id`),
  CONSTRAINT `tbl_card_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `tbl_member` (`member_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_card`
--

LOCK TABLES `tbl_card` WRITE;
/*!40000 ALTER TABLE `tbl_card` DISABLE KEYS */;
INSERT INTO `tbl_card` VALUES (1,'9250812788212',9,'112233',10000.00),(2,'5920812788213',10,'111111',55000.00);
/*!40000 ALTER TABLE `tbl_card` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_currency_supported`
--

DROP TABLE IF EXISTS `tbl_currency_supported`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_currency_supported` (
  `currency_id` int NOT NULL AUTO_INCREMENT,
  `currency_name` varchar(10) DEFAULT NULL,
  `usd_equivalent` decimal(10,2) DEFAULT NULL,
  `status` int DEFAULT NULL,
  PRIMARY KEY (`currency_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_currency_supported`
--

LOCK TABLES `tbl_currency_supported` WRITE;
/*!40000 ALTER TABLE `tbl_currency_supported` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_currency_supported` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_deposit`
--

DROP TABLE IF EXISTS `tbl_deposit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_deposit` (
  `deposit_id` int NOT NULL AUTO_INCREMENT,
  `transaction_code` varchar(50) DEFAULT NULL,
  `member_id` int DEFAULT NULL,
  `deposit_amount` decimal(10,2) DEFAULT NULL,
  `date_time` datetime DEFAULT NULL,
  `status` int DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`deposit_id`),
  UNIQUE KEY `transaction_code` (`transaction_code`),
  KEY `member_id` (`member_id`),
  CONSTRAINT `tbl_deposit_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `tbl_member` (`member_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_deposit`
--

LOCK TABLES `tbl_deposit` WRITE;
/*!40000 ALTER TABLE `tbl_deposit` DISABLE KEYS */;
INSERT INTO `tbl_deposit` VALUES (1,'K5yHXDlfpW',9,20000.00,'2024-04-02 14:28:03',0,'');
/*!40000 ALTER TABLE `tbl_deposit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_etherwallet`
--

DROP TABLE IF EXISTS `tbl_etherwallet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_etherwallet` (
  `id` int NOT NULL AUTO_INCREMENT,
  `member_id` int DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `pri_key` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `member_id` (`member_id`),
  CONSTRAINT `tbl_etherwallet_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `tbl_member` (`member_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_etherwallet`
--

LOCK TABLES `tbl_etherwallet` WRITE;
/*!40000 ALTER TABLE `tbl_etherwallet` DISABLE KEYS */;
INSERT INTO `tbl_etherwallet` VALUES (2,9,'0x09283041db45446836D18180a61943fBeA403C72','kJ6zd2HljPOPmiulUzELIlP3R2uh+U2hO9S/GXO+T3A8HIpwEHDe+ohHqM/YLxBD8YtWYTd4wCxtq6lhRSoCEsH6gUgW0pPAP9tIeHhcO2A=');
/*!40000 ALTER TABLE `tbl_etherwallet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_member`
--

DROP TABLE IF EXISTS `tbl_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_member` (
  `member_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(10) DEFAULT NULL,
  `email_address` varchar(50) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `contact_number` varchar(20) DEFAULT NULL,
  `username` varchar(20) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `account_status` int DEFAULT NULL,
  `avatar` varchar(10000) DEFAULT NULL,
  PRIMARY KEY (`member_id`),
  UNIQUE KEY `unique_email_address` (`email_address`),
  CONSTRAINT `check_account_status` CHECK ((`account_status` in (0,1,2)))
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_member`
--

LOCK TABLES `tbl_member` WRITE;
/*!40000 ALTER TABLE `tbl_member` DISABLE KEYS */;
INSERT INTO `tbl_member` VALUES (9,'Chau Duong Phat','Tien','tien3@gmail.com','VIETNAM','0812788212','tien2201','$2a$10$iWeAlFgm8vPI7wGrNYCODOh.JW29.1lLjqWjnOs2dqE.TMSInW9zm',0,NULL),(10,'Chau Duong Tuyet','Nhi','nhi1@gmail.com','VIETNAM','0812788213','nhi123456','$2a$10$SVdmWk4OkZaXfGojhTuiWe39DizEgWHcPB3iVmAzVZHMn/71ebLWS',0,NULL),(11,'chau','tien','tien1@gmail.com','Vietnam','0812788222','tien123','$2a$10$14bB5QtVsrIHfZVAIt.y9uz9bDW976Aah9HUhbYMksgS054.8/G4q',0,NULL),(12,'Trß║ºn Quang','Duy','duy@gmail.com','Vietnam','1263567890','duy123','$2a$10$7d6IDweBsj7mApEVuX8qy.PrVs9EKmKnLMKb//aC74zR6YBEjqxo6',0,NULL);
/*!40000 ALTER TABLE `tbl_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_recharge`
--

DROP TABLE IF EXISTS `tbl_recharge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_recharge` (
  `recharge_id` int NOT NULL AUTO_INCREMENT,
  `transaction_code` varchar(50) DEFAULT NULL,
  `member_id` int DEFAULT NULL,
  `phone` varchar(12) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `date_time` datetime DEFAULT NULL,
  `status` int DEFAULT NULL,
  `comments` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`recharge_id`),
  UNIQUE KEY `transaction_code` (`transaction_code`),
  KEY `member_id` (`member_id`),
  CONSTRAINT `tbl_recharge_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `tbl_member` (`member_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_recharge`
--

LOCK TABLES `tbl_recharge` WRITE;
/*!40000 ALTER TABLE `tbl_recharge` DISABLE KEYS */;
INSERT INTO `tbl_recharge` VALUES (1,'hSEr6zhZpxEG3PfC7PXL',9,'0812788212',20000.00,'2024-04-10 20:18:01',0,'recharge to 0812788212'),(2,'5A2zfozHRBgEhrjTmajm',9,'0812788212',10000.00,'2024-04-10 20:23:23',0,'recharge to 0812788212');
/*!40000 ALTER TABLE `tbl_recharge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_role`
--

DROP TABLE IF EXISTS `tbl_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_role` (
  `id` int NOT NULL AUTO_INCREMENT,
  `role` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_role`
--

LOCK TABLES `tbl_role` WRITE;
/*!40000 ALTER TABLE `tbl_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_transaction_block`
--

DROP TABLE IF EXISTS `tbl_transaction_block`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_transaction_block` (
  `block_id` int NOT NULL,
  `hash_block` varchar(255) DEFAULT NULL,
  `pre_hash_block` varchar(255) DEFAULT NULL,
  `transaction_data` varchar(255) DEFAULT NULL,
  `member_id` int DEFAULT NULL,
  `transaction_type` int DEFAULT NULL,
  `transaction_code` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`block_id`),
  UNIQUE KEY `transaction_code` (`transaction_code`),
  KEY `member_id` (`member_id`),
  CONSTRAINT `tbl_transaction_block_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `tbl_member` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_transaction_block`
--

LOCK TABLES `tbl_transaction_block` WRITE;
/*!40000 ALTER TABLE `tbl_transaction_block` DISABLE KEYS */;
INSERT INTO `tbl_transaction_block` VALUES (1,'0a8920bee6e89f3c2fbaf2c9a9900a2b305c678b890a703e1d41ddbab4322c4d',NULL,'{\"deposit_id\":0,\"transaction_code\":\"d9G0IKGCqa\",\"member_id\":9,\"deposit_amount\":250000,\"date_time\":\"Mar 29, 2024, 6:18:12 PM\",\"status\":0,\"note\":\"\"}',9,1,'d9G0IKGCqa'),(2,'bfd67db499fbe57b737f1c6f6e7ae969672332be0a700ec26c7c525ec15e83bd','0a8920bee6e89f3c2fbaf2c9a9900a2b305c678b890a703e1d41ddbab4322c4d','{\"withdrawal_id\":0,\"transaction_code\":\"fYCvYqwmxM\",\"member_id\":9,\"amount\":250000,\"date_time\":\"Mar 29, 2024, 6:53:02 PM\",\"status\":2,\"comments\":\"\"}',9,1,'fYCvYqwmxM'),(3,'e8833080ee3eb9543d0f663a80c59d33574982a62d7b7b45a262b8f363b22aba','bfd67db499fbe57b737f1c6f6e7ae969672332be0a700ec26c7c525ec15e83bd','{\"withdrawal_id\":0,\"transaction_code\":\"NFC9fMd74z\",\"member_id\":9,\"amount\":50000,\"date_time\":\"Mar 29, 2024, 7:04:54 PM\",\"status\":2,\"comments\":\"\"}',9,2,'NFC9fMd74z'),(4,'2d5b0afc601cefb39327d2feda2328c9a6a07977959d996e57e1bd32916e2c68','e8833080ee3eb9543d0f663a80c59d33574982a62d7b7b45a262b8f363b22aba','{\"transfer_id\":0,\"transaction_code\":\"KOVTRoDvjR\",\"member_id\":9,\"receive_id\":10,\"transfer_amount\":5000,\"date_time\":\"Mar 30, 2024, 12:07:55 AM\",\"status\":0,\"note\":\"tien chuyen cho nhi 5000\"}',9,3,'KOVTRoDvjR'),(5,'0536a051234a1bb1cdc2e77aa11600eb9b4086cd4ab15eb4594be7ab46d46bcb','2d5b0afc601cefb39327d2feda2328c9a6a07977959d996e57e1bd32916e2c68','{\"deposit_id\":0,\"transactioncode\":\"K5yHXDlfpW\",\"member_id\":9,\"deposit_amount\":20000,\"date_time\":\"Apr 2, 2024, 2:28:03 PM\",\"status\":0,\"note\":\"\"}',9,1,'K5yHXDlfpW'),(6,'4d7ee5a4ac7235858449e6de49490acb530540dc5fe0ac95ebb61ea59b0044d0','0536a051234a1bb1cdc2e77aa11600eb9b4086cd4ab15eb4594be7ab46d46bcb','{\"rechargeid\":0,\"transactioncode\":\"hSEr6zhZpxEG3PfC7PXL\",\"memberid\":9,\"phone\":\"0812788212\",\"amount\":20000,\"time\":\"Apr 10, 2024, 8:18:00 PM\",\"status\":0,\"note\":\"recharge to 0812788212\"}',9,4,'hSEr6zhZpxEG3PfC7PXL'),(7,'db701272843797d7d0183b5b3f925d54c43cb8f0dcfeff2558406331fa91ca23','4d7ee5a4ac7235858449e6de49490acb530540dc5fe0ac95ebb61ea59b0044d0','{\"rechargeid\":0,\"transactioncode\":\"5A2zfozHRBgEhrjTmajm\",\"memberid\":9,\"phone\":\"0812788212\",\"amount\":10000,\"time\":\"Apr 10, 2024, 8:23:22 PM\",\"status\":0,\"note\":\"recharge to 0812788212\"}',9,4,'5A2zfozHRBgEhrjTmajm');
/*!40000 ALTER TABLE `tbl_transaction_block` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_transfer`
--

DROP TABLE IF EXISTS `tbl_transfer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_transfer` (
  `transfer_id` int NOT NULL AUTO_INCREMENT,
  `transaction_code` varchar(50) DEFAULT NULL,
  `member_id` int DEFAULT NULL,
  `receive_id` int DEFAULT NULL,
  `transfer_amount` decimal(10,2) DEFAULT NULL,
  `date_time` datetime DEFAULT NULL,
  `status` int DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`transfer_id`),
  UNIQUE KEY `transaction_code` (`transaction_code`),
  KEY `member_id` (`member_id`),
  KEY `receive_id` (`receive_id`),
  CONSTRAINT `tbl_transfer_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `tbl_member` (`member_id`),
  CONSTRAINT `tbl_transfer_ibfk_2` FOREIGN KEY (`receive_id`) REFERENCES `tbl_member` (`member_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_transfer`
--

LOCK TABLES `tbl_transfer` WRITE;
/*!40000 ALTER TABLE `tbl_transfer` DISABLE KEYS */;
INSERT INTO `tbl_transfer` VALUES (1,'KOVTRoDvjR',9,10,5000.00,'2024-03-30 00:07:56',0,'tien chuyen cho nhi 5000');
/*!40000 ALTER TABLE `tbl_transfer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_user`
--

DROP TABLE IF EXISTS `tbl_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_user` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(20) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `complete_name` varchar(50) DEFAULT NULL,
  `email_address` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_user`
--

LOCK TABLES `tbl_user` WRITE;
/*!40000 ALTER TABLE `tbl_user` DISABLE KEYS */;
INSERT INTO `tbl_user` VALUES (6,'tien2201','$2a$10$iWeAlFgm8vPI7wGrNYCODOh.JW29.1lLjqWjnOs2dqE.TMSInW9zm','Chau Duong PhatTien','tien3@gmail.com'),(7,'nhi123456','$2a$10$SVdmWk4OkZaXfGojhTuiWe39DizEgWHcPB3iVmAzVZHMn/71ebLWS','Chau Duong TuyetNhi','nhi1@gmail.com'),(8,'tien123','$2a$10$14bB5QtVsrIHfZVAIt.y9uz9bDW976Aah9HUhbYMksgS054.8/G4q','chautien','tien1@gmail.com'),(9,'duy123','$2a$10$7d6IDweBsj7mApEVuX8qy.PrVs9EKmKnLMKb//aC74zR6YBEjqxo6','Trß║ºn QuangDuy','duy@gmail.com');
/*!40000 ALTER TABLE `tbl_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_withdrawal`
--

DROP TABLE IF EXISTS `tbl_withdrawal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_withdrawal` (
  `withdrawal_id` int NOT NULL AUTO_INCREMENT,
  `transaction_code` varchar(50) DEFAULT NULL,
  `member_id` int DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `date_time` datetime DEFAULT NULL,
  `status` int DEFAULT NULL,
  `comments` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`withdrawal_id`),
  UNIQUE KEY `transaction_code` (`transaction_code`),
  KEY `member_id` (`member_id`),
  CONSTRAINT `tbl_withdrawal_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `tbl_member` (`member_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_withdrawal`
--

LOCK TABLES `tbl_withdrawal` WRITE;
/*!40000 ALTER TABLE `tbl_withdrawal` DISABLE KEYS */;
INSERT INTO `tbl_withdrawal` VALUES (1,'fYCvYqwmxM',9,250000.00,'2024-03-29 18:53:02',2,''),(2,'NFC9fMd74z',9,50000.00,'2024-03-29 19:04:54',2,'');
/*!40000 ALTER TABLE `tbl_withdrawal` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-23 10:47:27
