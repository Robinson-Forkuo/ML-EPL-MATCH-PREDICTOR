-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: epl_predictor
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
-- Table structure for table `alembic_version`
--

DROP TABLE IF EXISTS `alembic_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alembic_version` (
  `version_num` varchar(32) NOT NULL,
  PRIMARY KEY (`version_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alembic_version`
--

LOCK TABLES `alembic_version` WRITE;
/*!40000 ALTER TABLE `alembic_version` DISABLE KEYS */;
INSERT INTO `alembic_version` VALUES ('3d9390644a19');
/*!40000 ALTER TABLE `alembic_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prediction`
--

DROP TABLE IF EXISTS `prediction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prediction` (
  `id` int NOT NULL AUTO_INCREMENT,
  `home_team` int DEFAULT NULL,
  `away_team` int DEFAULT NULL,
  `winner` varchar(32) DEFAULT NULL,
  `insert_date` datetime DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `away_team` (`away_team`),
  KEY `home_team` (`home_team`),
  KEY `user_id` (`user_id`),
  KEY `ix_prediction_insert_date` (`insert_date`),
  CONSTRAINT `prediction_ibfk_1` FOREIGN KEY (`away_team`) REFERENCES `team` (`id`),
  CONSTRAINT `prediction_ibfk_2` FOREIGN KEY (`home_team`) REFERENCES `team` (`id`),
  CONSTRAINT `prediction_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prediction`
--

LOCK TABLES `prediction` WRITE;
/*!40000 ALTER TABLE `prediction` DISABLE KEYS */;
INSERT INTO `prediction` VALUES (1,6,3,'6','2022-04-08 09:19:07',1),(2,5,7,'5','2022-04-08 09:22:03',1),(3,2,2,'2','2022-04-08 11:51:13',2),(4,8,5,'8','2022-04-08 11:51:24',2),(5,4,1,'4','2022-04-08 11:51:35',2),(6,2,3,'2','2022-04-08 15:36:21',2),(7,2,5,'2','2022-04-08 15:45:56',1),(8,8,3,'8','2022-04-08 15:52:08',1),(9,3,4,'3','2022-04-11 06:09:20',2),(10,3,6,'3','2022-04-11 06:13:14',2),(11,6,3,'6','2022-04-11 06:17:45',2),(12,1,3,'1','2022-04-11 23:16:03',1),(13,2,4,'2','2022-04-11 23:17:34',12),(14,1,5,'1','2022-04-11 23:34:14',2),(15,8,4,'8','2022-04-11 23:34:57',2),(16,16,6,'16','2022-04-11 23:36:07',2),(17,17,16,'17','2022-04-11 23:38:08',2),(18,27,23,'27','2022-04-11 23:50:59',2),(19,18,21,'18','2022-04-11 23:51:24',2),(20,23,25,'23','2022-04-12 00:01:08',2),(21,2,20,'2','2022-04-12 00:02:19',15),(22,17,7,'17','2022-04-12 00:02:37',15),(23,2,22,'2','2022-04-12 22:11:40',2),(24,1,24,'1','2022-04-12 22:19:43',22),(25,20,17,'20','2022-04-12 22:27:08',22),(26,4,22,'4','2022-04-14 09:07:33',2),(27,3,23,'3','2022-04-14 09:15:42',17),(28,1,17,'1','2022-04-14 16:33:42',2),(29,17,27,'17','2022-04-16 00:06:12',2);
/*!40000 ALTER TABLE `prediction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prediction_view`
--

DROP TABLE IF EXISTS `prediction_view`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prediction_view` (
  `id` int NOT NULL AUTO_INCREMENT,
  `home_team` varchar(200) DEFAULT NULL,
  `away_team` varchar(200) DEFAULT NULL,
  `winner` varchar(200) DEFAULT NULL,
  `prediction_date` datetime DEFAULT NULL,
  `username` varchar(200) DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_prediction_view_prediction_date` (`prediction_date`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prediction_view`
--

LOCK TABLES `prediction_view` WRITE;
/*!40000 ALTER TABLE `prediction_view` DISABLE KEYS */;
INSERT INTO `prediction_view` VALUES (10,'Everton','Stock City','Everton','2022-04-11 06:13:14','robinson',2),(11,'Stock City','Everton','Stock City','2022-04-11 06:17:45','robinson',2),(12,'Arsenal','Everton','Arsenal','2022-04-11 23:16:03','kaunda',1),(13,'Aston Villa','Manchester United','Aston Villa','2022-04-11 23:17:34','forkuo',12),(14,'Arsenal','Fullham','Arsenal','2022-04-11 23:34:14','robinson',2),(15,'Chelsea','Manchester United','Chelsea','2022-04-11 23:34:57','robinson',2),(16,'Liverpool','Stock City','Liverpool','2022-04-11 23:36:07','robinson',2),(17,'Manchester City','Liverpool','Manchester City','2022-04-11 23:38:08','robinson',2),(18,'Norwich City','Burnley','Norwich City','2022-04-11 23:50:59','robinson',2),(19,'Tottenham Hotspur','Leeds United','Tottenham Hotspur','2022-04-11 23:51:24','robinson',2),(20,'Burnley','Watford','Burnley','2022-04-12 00:01:08','robinson',2),(21,'Aston Villa','West Ham United','Aston Villa','2022-04-12 00:02:19','david',15),(22,'Manchester City','Liverpool','Manchester City','2022-04-12 00:02:37','david',15),(23,'Aston Villa','Leicester City','Aston Villa','2022-04-12 22:11:40','robinson',2),(24,'Arsenal','Crystal Palace','Arsenal','2022-04-12 22:19:43','tiffanny',22),(25,'West Ham United','Manchester City','West Ham United','2022-04-12 22:27:08','tiffanny',22),(26,'Manchester United','Leicester City','Manchester United','2022-04-14 09:07:33','robinson',2),(27,'Everton','Burnley','Everton','2022-04-14 09:15:42','project',17),(28,'Arsenal','Manchester City','Arsenal','2022-04-14 16:33:42','robinson',2),(29,'Manchester City','Norwich City','Manchester City','2022-04-16 00:06:12','robinson',2);
/*!40000 ALTER TABLE `prediction_view` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team`
--

DROP TABLE IF EXISTS `team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `team` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team`
--

LOCK TABLES `team` WRITE;
/*!40000 ALTER TABLE `team` DISABLE KEYS */;
INSERT INTO `team` VALUES (1,'Arsenal'),(2,'Aston Villa'),(3,'Everton'),(4,'Manchester United'),(5,'Fullham'),(6,'Stock City'),(7,'Liverpool'),(8,'Chelsea'),(16,'Liverpool'),(17,'Manchester City'),(18,'Tottenham Hotspur'),(19,'Newcastle'),(20,'West Ham United'),(21,'Leeds United'),(22,'Leicester City'),(23,'Burnley'),(24,'Crystal Palace'),(25,'Watford'),(26,'Southampton'),(27,'Norwich City');
/*!40000 ALTER TABLE `team` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(128) DEFAULT NULL,
  `email` varchar(128) DEFAULT NULL,
  `password_hash` varchar(128) DEFAULT NULL,
  `is_admin` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ix_user_email` (`email`),
  UNIQUE KEY `ix_user_username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'konama','konama@outlook.com','pbkdf2:sha256:260000$IY9SVzMNJFSsIHpC$a249f865c10d05431036a939f4b7bb2db169376d36d25f54b892e2ac524f9b9b',0),(2,'robinson','robinson@gmail.com','pbkdf2:sha256:260000$hDaZ13ZS3Uxw745V$67f1b6f69505385cc9ad5c776ac174b9cb8a5b2e929f16799cf900f7d0ae551e',1),(3,'tiffany','tifanny@gmail.com','pbkdf2:sha256:260000$Jf6g01NsgCZE1gPc$b7d088b36f2430c0ef7142d8aa3745258039cf204e8654ab2ecc3af16a45be5e',0),(12,'forkuo','forkuo@gmail.com','pbkdf2:sha256:260000$dvMQooBLSv14Hvyc$b989dd355192b34f004ea3d6a5c964e3cce67ff77fdd36ca5c9c30d21af87e1e',1),(15,'david','david@gmail.com','pbkdf2:sha256:260000$2sWoBiXVzZXgTX5d$e9393a593609c6197a000ae54965c36c6653c69b96c64962ed647fa520a21cf5',0),(17,'project','project@gmail.com','pbkdf2:sha256:260000$pNmtE67ngv8xAhRz$bc164c56d4d1bca748b31de3710334b0f20f126ea1cbbff720269bf7b99fdb57',0),(22,'tiffanny','tiffanny@gmail.com','pbkdf2:sha256:260000$EoSCHlYit2gPlY0S$f8724ed233e69b9efcf8d15cd865d8da926609225145d9f3312df3cb9230660a',1);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `v_all_predictions`
--

DROP TABLE IF EXISTS `v_all_predictions`;
/*!50001 DROP VIEW IF EXISTS `v_all_predictions`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_all_predictions` AS SELECT 
 1 AS `id`,
 1 AS `home_team`,
 1 AS `away_team`,
 1 AS `winner`,
 1 AS `prediction_date`,
 1 AS `username`,
 1 AS `user_id`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'epl_predictor'
--

--
-- Final view structure for view `v_all_predictions`
--

/*!50001 DROP VIEW IF EXISTS `v_all_predictions`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_all_predictions` AS select `p`.`id` AS `id`,`h`.`name` AS `home_team`,`a`.`name` AS `away_team`,`w`.`name` AS `winner`,`p`.`insert_date` AS `prediction_date`,`u`.`username` AS `username`,`u`.`id` AS `user_id` from ((((`prediction` `p` join `team` `h` on((`p`.`home_team` = `h`.`id`))) join `team` `a` on((`p`.`away_team` = `a`.`id`))) join `user` `u` on((`u`.`id` = `p`.`user_id`))) join `team` `w` on((`w`.`id` = `p`.`winner`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-16 12:25:44
