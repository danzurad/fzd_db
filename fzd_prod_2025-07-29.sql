-- MySQL dump 10.13  Distrib 8.0.42, for Linux (x86_64)
--
-- Host: localhost    Database: fzd_design
-- ------------------------------------------------------
-- Server version	8.0.42-0ubuntu0.24.04.1

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
-- Table structure for table `event_lineups`
--

DROP TABLE IF EXISTS `event_lineups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `event_lineups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `scheduled_event_id` int NOT NULL,
  `lineup_id` int DEFAULT NULL,
  `order` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `event_lineups_event_id_events_id` (`scheduled_event_id`),
  KEY `event_lineups_lineup_id_lineups_id` (`lineup_id`),
  CONSTRAINT `event_lineups_event_id_events_id` FOREIGN KEY (`scheduled_event_id`) REFERENCES `events_scheduled` (`id`),
  CONSTRAINT `event_lineups_lineup_id_lineups_id` FOREIGN KEY (`lineup_id`) REFERENCES `lineups` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_lineups`
--

LOCK TABLES `event_lineups` WRITE;
/*!40000 ALTER TABLE `event_lineups` DISABLE KEYS */;
/*!40000 ALTER TABLE `event_lineups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_relations`
--

DROP TABLE IF EXISTS `event_relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `event_relations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `event_group_name` varchar(100) NOT NULL,
  `event_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `event_id` (`event_id`),
  CONSTRAINT `event_relations_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_relations`
--

LOCK TABLES `event_relations` WRITE;
/*!40000 ALTER TABLE `event_relations` DISABLE KEYS */;
/*!40000 ALTER TABLE `event_relations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_result_points`
--

DROP TABLE IF EXISTS `event_result_points`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `event_result_points` (
  `id` int NOT NULL AUTO_INCREMENT,
  `scheduled_event_id` int NOT NULL,
  `game_mode_id` int DEFAULT NULL,
  `lineup_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  `team_id` int DEFAULT NULL,
  `score` int NOT NULL DEFAULT '0',
  `machine_id` int DEFAULT NULL,
  `verified` bit(1) NOT NULL DEFAULT b'0',
  `notes` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `created_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `active` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `scheduled_event_id_event_lineup_id_user_id` (`scheduled_event_id`,`lineup_id`,`user_id`),
  KEY `event_scores_event_id_events_id` (`scheduled_event_id`),
  KEY `event_scores_game_mode_id_game_modes_id` (`game_mode_id`),
  KEY `event_scores_event_lineup_id_event_lineups_id` (`lineup_id`),
  KEY `event_scores_team_id_teams_id` (`team_id`),
  KEY `event_scores_machine_id_machines_id` (`machine_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `event_result_points_ibfk_1` FOREIGN KEY (`game_mode_id`) REFERENCES `game_modes` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `event_result_points_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `event_result_points_ibfk_3` FOREIGN KEY (`lineup_id`) REFERENCES `lineups` (`id`),
  CONSTRAINT `event_scores_event_id_events_id` FOREIGN KEY (`scheduled_event_id`) REFERENCES `events_scheduled` (`id`),
  CONSTRAINT `event_scores_machine_id_machines_id` FOREIGN KEY (`machine_id`) REFERENCES `machines` (`id`),
  CONSTRAINT `event_scores_team_id_teams_id` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=207 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_result_points`
--

LOCK TABLES `event_result_points` WRITE;
/*!40000 ALTER TABLE `event_result_points` DISABLE KEYS */;
INSERT INTO `event_result_points` VALUES (118,6,NULL,NULL,153,NULL,1154,NULL,_binary '\0',NULL,'2025-07-29 02:59:48','2025-07-29 02:59:48',_binary ''),(119,6,NULL,NULL,154,NULL,1122,NULL,_binary '\0',NULL,'2025-07-29 02:59:48','2025-07-29 02:59:48',_binary ''),(120,6,NULL,NULL,155,NULL,1122,NULL,_binary '\0',NULL,'2025-07-29 02:59:48','2025-07-29 02:59:48',_binary ''),(121,6,NULL,NULL,156,NULL,1105,NULL,_binary '\0',NULL,'2025-07-29 02:59:48','2025-07-29 02:59:48',_binary ''),(122,6,NULL,NULL,157,NULL,1103,NULL,_binary '\0',NULL,'2025-07-29 02:59:48','2025-07-29 02:59:48',_binary ''),(123,6,NULL,NULL,158,NULL,1103,NULL,_binary '\0',NULL,'2025-07-29 02:59:48','2025-07-29 02:59:48',_binary ''),(124,6,NULL,NULL,159,NULL,1087,NULL,_binary '\0',NULL,'2025-07-29 02:59:48','2025-07-29 02:59:48',_binary ''),(125,6,NULL,NULL,160,NULL,1052,NULL,_binary '\0',NULL,'2025-07-29 02:59:48','2025-07-29 02:59:48',_binary ''),(126,6,NULL,NULL,161,NULL,1025,NULL,_binary '\0',NULL,'2025-07-29 02:59:48','2025-07-29 02:59:48',_binary ''),(127,6,NULL,NULL,162,NULL,1015,NULL,_binary '\0',NULL,'2025-07-29 02:59:48','2025-07-29 02:59:48',_binary ''),(128,6,NULL,NULL,163,NULL,993,NULL,_binary '\0',NULL,'2025-07-29 02:59:48','2025-07-29 02:59:48',_binary ''),(129,6,NULL,NULL,164,NULL,974,NULL,_binary '\0',NULL,'2025-07-29 02:59:48','2025-07-29 02:59:48',_binary ''),(130,6,NULL,NULL,165,NULL,919,NULL,_binary '\0',NULL,'2025-07-29 02:59:48','2025-07-29 02:59:48',_binary ''),(131,6,NULL,NULL,166,NULL,914,NULL,_binary '\0',NULL,'2025-07-29 02:59:48','2025-07-29 02:59:48',_binary ''),(132,6,NULL,NULL,167,NULL,884,NULL,_binary '\0',NULL,'2025-07-29 02:59:48','2025-07-29 02:59:48',_binary ''),(133,6,NULL,NULL,168,NULL,863,NULL,_binary '\0',NULL,'2025-07-29 02:59:48','2025-07-29 02:59:48',_binary ''),(134,6,NULL,NULL,169,NULL,806,NULL,_binary '\0',NULL,'2025-07-29 02:59:48','2025-07-29 02:59:48',_binary ''),(135,6,NULL,NULL,170,NULL,774,NULL,_binary '\0',NULL,'2025-07-29 02:59:48','2025-07-29 02:59:48',_binary ''),(136,6,NULL,NULL,171,NULL,764,NULL,_binary '\0',NULL,'2025-07-29 02:59:48','2025-07-29 02:59:48',_binary ''),(137,6,NULL,NULL,172,NULL,748,NULL,_binary '\0',NULL,'2025-07-29 02:59:48','2025-07-29 02:59:48',_binary ''),(138,6,NULL,NULL,173,NULL,739,NULL,_binary '\0',NULL,'2025-07-29 02:59:48','2025-07-29 02:59:48',_binary ''),(139,6,NULL,NULL,174,NULL,722,NULL,_binary '\0',NULL,'2025-07-29 02:59:48','2025-07-29 02:59:48',_binary ''),(140,6,NULL,NULL,175,NULL,648,NULL,_binary '\0',NULL,'2025-07-29 02:59:48','2025-07-29 02:59:48',_binary ''),(141,6,NULL,NULL,176,NULL,645,NULL,_binary '\0',NULL,'2025-07-29 02:59:48','2025-07-29 02:59:48',_binary ''),(142,6,NULL,NULL,177,NULL,564,NULL,_binary '\0',NULL,'2025-07-29 02:59:48','2025-07-29 02:59:48',_binary ''),(143,6,NULL,NULL,178,NULL,528,NULL,_binary '\0',NULL,'2025-07-29 02:59:48','2025-07-29 02:59:48',_binary ''),(144,6,NULL,NULL,179,NULL,498,NULL,_binary '\0',NULL,'2025-07-29 02:59:48','2025-07-29 02:59:48',_binary ''),(145,6,NULL,NULL,180,NULL,466,NULL,_binary '\0',NULL,'2025-07-29 02:59:48','2025-07-29 02:59:48',_binary ''),(146,6,NULL,NULL,181,NULL,395,NULL,_binary '\0',NULL,'2025-07-29 02:59:48','2025-07-29 02:59:48',_binary ''),(147,6,NULL,NULL,182,NULL,268,NULL,_binary '\0',NULL,'2025-07-29 02:59:48','2025-07-29 02:59:48',_binary ''),(148,6,NULL,NULL,183,NULL,250,NULL,_binary '\0',NULL,'2025-07-29 02:59:48','2025-07-29 02:59:48',_binary ''),(149,7,NULL,NULL,153,NULL,3705,NULL,_binary '\0',NULL,'2025-07-29 02:59:48','2025-07-29 02:59:48',_binary ''),(150,7,NULL,NULL,184,NULL,3472,NULL,_binary '\0',NULL,'2025-07-29 02:59:48','2025-07-29 02:59:48',_binary ''),(151,7,NULL,NULL,185,NULL,3386,NULL,_binary '\0',NULL,'2025-07-29 02:59:48','2025-07-29 02:59:48',_binary ''),(152,7,NULL,NULL,186,NULL,3354,NULL,_binary '\0',NULL,'2025-07-29 02:59:48','2025-07-29 02:59:48',_binary ''),(153,7,NULL,NULL,187,NULL,3229,NULL,_binary '\0',NULL,'2025-07-29 02:59:48','2025-07-29 02:59:48',_binary ''),(154,7,NULL,NULL,188,NULL,3187,NULL,_binary '\0',NULL,'2025-07-29 02:59:48','2025-07-29 02:59:48',_binary ''),(155,7,NULL,NULL,169,NULL,3155,NULL,_binary '\0',NULL,'2025-07-29 02:59:48','2025-07-29 02:59:48',_binary ''),(156,7,NULL,NULL,189,NULL,3039,NULL,_binary '\0',NULL,'2025-07-29 02:59:48','2025-07-29 02:59:48',_binary ''),(157,7,NULL,NULL,190,NULL,2881,NULL,_binary '\0',NULL,'2025-07-29 02:59:48','2025-07-29 02:59:48',_binary ''),(158,7,NULL,NULL,191,NULL,2721,NULL,_binary '\0',NULL,'2025-07-29 02:59:48','2025-07-29 02:59:48',_binary ''),(159,7,NULL,NULL,192,NULL,2533,NULL,_binary '\0',NULL,'2025-07-29 02:59:48','2025-07-29 02:59:48',_binary ''),(160,7,NULL,NULL,193,NULL,2136,NULL,_binary '\0',NULL,'2025-07-29 02:59:48','2025-07-29 02:59:48',_binary ''),(161,7,NULL,NULL,158,NULL,1942,NULL,_binary '\0',NULL,'2025-07-29 02:59:48','2025-07-29 02:59:48',_binary ''),(162,7,NULL,NULL,194,NULL,1848,NULL,_binary '\0',NULL,'2025-07-29 02:59:48','2025-07-29 02:59:48',_binary ''),(163,7,NULL,NULL,195,NULL,1564,NULL,_binary '\0',NULL,'2025-07-29 02:59:48','2025-07-29 02:59:48',_binary ''),(164,7,NULL,NULL,196,NULL,1539,NULL,_binary '\0',NULL,'2025-07-29 02:59:48','2025-07-29 02:59:48',_binary ''),(165,7,NULL,NULL,197,NULL,1317,NULL,_binary '\0',NULL,'2025-07-29 02:59:48','2025-07-29 02:59:48',_binary ''),(166,7,NULL,NULL,168,NULL,776,NULL,_binary '\0',NULL,'2025-07-29 02:59:48','2025-07-29 02:59:48',_binary ''),(167,7,NULL,NULL,198,NULL,0,NULL,_binary '\0',NULL,'2025-07-29 02:59:48','2025-07-29 02:59:48',_binary ''),(168,7,NULL,NULL,199,NULL,0,NULL,_binary '\0',NULL,'2025-07-29 02:59:48','2025-07-29 02:59:48',_binary ''),(169,8,NULL,NULL,200,NULL,1364,NULL,_binary '\0',NULL,'2025-07-29 02:59:48','2025-07-29 02:59:48',_binary ''),(170,8,NULL,NULL,201,NULL,1344,NULL,_binary '\0',NULL,'2025-07-29 02:59:48','2025-07-29 02:59:48',_binary ''),(171,8,NULL,NULL,186,NULL,1309,NULL,_binary '\0',NULL,'2025-07-29 02:59:48','2025-07-29 02:59:48',_binary ''),(172,8,NULL,NULL,188,NULL,1308,NULL,_binary '\0',NULL,'2025-07-29 02:59:48','2025-07-29 02:59:48',_binary ''),(173,8,NULL,NULL,202,NULL,1306,NULL,_binary '\0',NULL,'2025-07-29 02:59:48','2025-07-29 02:59:48',_binary ''),(174,8,NULL,NULL,194,NULL,1290,NULL,_binary '\0',NULL,'2025-07-29 02:59:48','2025-07-29 02:59:48',_binary ''),(175,8,NULL,NULL,203,NULL,1273,NULL,_binary '\0',NULL,'2025-07-29 02:59:48','2025-07-29 02:59:48',_binary ''),(176,8,NULL,NULL,185,NULL,1240,NULL,_binary '\0',NULL,'2025-07-29 02:59:48','2025-07-29 02:59:48',_binary ''),(177,8,NULL,NULL,204,NULL,1232,NULL,_binary '\0',NULL,'2025-07-29 02:59:48','2025-07-29 02:59:48',_binary ''),(178,8,NULL,NULL,205,NULL,1198,NULL,_binary '\0',NULL,'2025-07-29 02:59:48','2025-07-29 02:59:48',_binary ''),(179,8,NULL,NULL,158,NULL,1072,NULL,_binary '\0',NULL,'2025-07-29 02:59:48','2025-07-29 02:59:48',_binary ''),(180,8,NULL,NULL,190,NULL,840,NULL,_binary '\0',NULL,'2025-07-29 02:59:48','2025-07-29 02:59:48',_binary ''),(181,8,NULL,NULL,176,NULL,824,NULL,_binary '\0',NULL,'2025-07-29 02:59:48','2025-07-29 02:59:48',_binary ''),(182,8,NULL,NULL,206,NULL,575,NULL,_binary '\0',NULL,'2025-07-29 02:59:48','2025-07-29 02:59:48',_binary ''),(183,8,NULL,NULL,207,NULL,236,NULL,_binary '\0',NULL,'2025-07-29 02:59:48','2025-07-29 02:59:48',_binary ''),(184,9,NULL,NULL,208,NULL,3320,NULL,_binary '\0',NULL,'2025-07-29 02:59:48','2025-07-29 02:59:48',_binary ''),(185,9,NULL,NULL,209,NULL,3196,NULL,_binary '\0',NULL,'2025-07-29 02:59:48','2025-07-29 02:59:48',_binary ''),(186,9,NULL,NULL,187,NULL,3148,NULL,_binary '\0',NULL,'2025-07-29 02:59:48','2025-07-29 02:59:48',_binary ''),(187,9,NULL,NULL,153,NULL,3146,NULL,_binary '\0',NULL,'2025-07-29 02:59:48','2025-07-29 02:59:48',_binary ''),(188,9,NULL,NULL,186,NULL,2906,NULL,_binary '\0',NULL,'2025-07-29 02:59:48','2025-07-29 02:59:48',_binary ''),(189,9,NULL,NULL,192,NULL,2770,NULL,_binary '\0',NULL,'2025-07-29 02:59:48','2025-07-29 02:59:48',_binary ''),(190,9,NULL,NULL,210,NULL,2732,NULL,_binary '\0',NULL,'2025-07-29 02:59:48','2025-07-29 02:59:48',_binary ''),(191,9,NULL,NULL,156,NULL,2474,NULL,_binary '\0',NULL,'2025-07-29 02:59:48','2025-07-29 02:59:48',_binary ''),(192,9,NULL,NULL,161,NULL,2264,NULL,_binary '\0',NULL,'2025-07-29 02:59:48','2025-07-29 02:59:48',_binary ''),(193,9,NULL,NULL,191,NULL,2024,NULL,_binary '\0',NULL,'2025-07-29 02:59:48','2025-07-29 02:59:48',_binary ''),(194,9,NULL,NULL,211,NULL,2021,NULL,_binary '\0',NULL,'2025-07-29 02:59:48','2025-07-29 02:59:48',_binary ''),(195,9,NULL,NULL,168,NULL,202,NULL,_binary '\0',NULL,'2025-07-29 02:59:48','2025-07-29 02:59:48',_binary ''),(196,9,NULL,NULL,212,NULL,0,NULL,_binary '\0',NULL,'2025-07-29 02:59:48','2025-07-29 02:59:48',_binary ''),(197,10,NULL,NULL,201,NULL,2812,NULL,_binary '\0',NULL,'2025-07-29 02:59:48','2025-07-29 02:59:48',_binary ''),(198,10,NULL,NULL,205,NULL,2748,NULL,_binary '\0',NULL,'2025-07-29 02:59:48','2025-07-29 02:59:48',_binary ''),(199,10,NULL,NULL,213,NULL,2454,NULL,_binary '\0',NULL,'2025-07-29 02:59:48','2025-07-29 02:59:48',_binary ''),(200,11,NULL,NULL,214,NULL,1085,NULL,_binary '\0',NULL,'2025-07-29 02:59:48','2025-07-29 02:59:48',_binary ''),(201,11,NULL,NULL,215,NULL,1040,NULL,_binary '\0',NULL,'2025-07-29 02:59:48','2025-07-29 02:59:48',_binary ''),(202,11,NULL,NULL,216,NULL,1035,NULL,_binary '\0',NULL,'2025-07-29 02:59:48','2025-07-29 02:59:48',_binary ''),(203,11,NULL,NULL,217,NULL,975,NULL,_binary '\0',NULL,'2025-07-29 02:59:48','2025-07-29 02:59:48',_binary ''),(204,11,NULL,NULL,158,NULL,915,NULL,_binary '\0',NULL,'2025-07-29 02:59:48','2025-07-29 02:59:48',_binary ''),(205,11,NULL,NULL,165,NULL,705,NULL,_binary '\0',NULL,'2025-07-29 02:59:48','2025-07-29 02:59:48',_binary ''),(206,11,NULL,NULL,164,NULL,615,NULL,_binary '\0',NULL,'2025-07-29 02:59:48','2025-07-29 02:59:48',_binary '');
/*!40000 ALTER TABLE `event_result_points` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_result_times`
--

DROP TABLE IF EXISTS `event_result_times`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `event_result_times` (
  `id` int NOT NULL AUTO_INCREMENT,
  `scheduled_event_id` int NOT NULL,
  `user_id` int NOT NULL,
  `track_id` int DEFAULT NULL,
  `time` varchar(8) NOT NULL,
  `machine_id` int NOT NULL,
  `verified` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`id`),
  KEY `track_id` (`track_id`),
  KEY `machine_id` (`machine_id`),
  CONSTRAINT `event_result_times_ibfk_1` FOREIGN KEY (`track_id`) REFERENCES `tracks` (`id`),
  CONSTRAINT `event_result_times_ibfk_2` FOREIGN KEY (`machine_id`) REFERENCES `machines` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_result_times`
--

LOCK TABLES `event_result_times` WRITE;
/*!40000 ALTER TABLE `event_result_times` DISABLE KEYS */;
/*!40000 ALTER TABLE `event_result_times` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `events` (
  `id` int NOT NULL AUTO_INCREMENT,
  `game_id` int NOT NULL,
  `name` varchar(120) NOT NULL,
  `description` varchar(240) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `utc_day` enum('MONDAY','TUESDAY','WEDNESDAY','THURSDAY','FRIDAY','SATURDAY','SUNDAY') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `utc_time` time DEFAULT NULL,
  `scoring_metric` enum('points','time') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `additional_details` varchar(200) DEFAULT NULL,
  `recurring` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `game_id` (`game_id`),
  CONSTRAINT `events_ibfk_1` FOREIGN KEY (`game_id`) REFERENCES `games` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events`
--

LOCK TABLES `events` WRITE;
/*!40000 ALTER TABLE `events` DISABLE KEYS */;
INSERT INTO `events` VALUES (6,1,'FZD Frozen Knight League','Let\'s play through the new Frozen Knight League together!',NULL,NULL,'points',NULL,_binary '\0'),(7,1,'Weekly Classic Mini',NULL,NULL,NULL,'points',NULL,_binary ''),(8,1,'Machine Mastery',NULL,NULL,NULL,'points',NULL,_binary ''),(9,1,'Thursday FZD',NULL,NULL,NULL,'points',NULL,_binary ''),(10,1,'Friday FZD GP',NULL,NULL,NULL,'points',NULL,_binary ''),(11,1,'Cracked Cup',NULL,NULL,NULL,'points',NULL,_binary ''),(12,1,'Asia-Pacific Open',NULL,NULL,NULL,'points',NULL,_binary ''),(13,1,'Euro-Asia Drift',NULL,'SATURDAY',NULL,'points',NULL,_binary '\0');
/*!40000 ALTER TABLE `events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `events_scheduled`
--

DROP TABLE IF EXISTS `events_scheduled`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `events_scheduled` (
  `id` int NOT NULL AUTO_INCREMENT,
  `event_id` int NOT NULL,
  `display_name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `utc_start_dt` datetime NOT NULL,
  `utc_end_dt` datetime NOT NULL,
  `additional_rules` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_scheduled_event` (`event_id`,`utc_start_dt`),
  KEY `events_event_type_id_event_types_id` (`event_id`),
  CONSTRAINT `events_scheduled_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events_scheduled`
--

LOCK TABLES `events_scheduled` WRITE;
/*!40000 ALTER TABLE `events_scheduled` DISABLE KEYS */;
INSERT INTO `events_scheduled` VALUES (6,8,'Machine Mastery','2025-07-22 01:00:00','2025-07-22 03:00:00',NULL),(7,9,'Thursday FZD GP','2025-07-24 20:00:00','2025-07-24 22:00:00',NULL),(8,10,'Friday FZD GP','2025-07-26 01:00:00','2025-07-26 03:00:00',NULL),(9,11,'Cracked Cup','2025-07-26 21:00:00','2025-07-26 23:00:00',NULL),(10,12,'Asia-Pacific Open','2025-07-27 01:00:00','2025-07-27 03:00:00',NULL),(11,7,'Weekly Classic Mini','2025-07-26 03:00:00','2025-07-26 05:00:00',NULL);
/*!40000 ALTER TABLE `events_scheduled` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `game_modes`
--

DROP TABLE IF EXISTS `game_modes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `game_modes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL,
  `type` enum('99','Classic') NOT NULL,
  `max_score` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `game_modes`
--

LOCK TABLES `game_modes` WRITE;
/*!40000 ALTER TABLE `game_modes` DISABLE KEYS */;
INSERT INTO `game_modes` VALUES (1,'99','99',200),(2,'Pro Tracks','99',200),(3,'Team Battle','99',NULL),(4,'Classic','Classic',100),(5,'Classic Mini Prix','Classic',300),(6,'Mini Prix','99',300),(7,'Grand Prix','99',1000),(8,'World Tour','99',NULL),(9,'Mini World Tour','99',NULL);
/*!40000 ALTER TABLE `game_modes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `games`
--

DROP TABLE IF EXISTS `games`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `games` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `games`
--

LOCK TABLES `games` WRITE;
/*!40000 ALTER TABLE `games` DISABLE KEYS */;
INSERT INTO `games` VALUES (1,'F-Zero 99'),(2,'F-Zero Climax');
/*!40000 ALTER TABLE `games` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lineups`
--

DROP TABLE IF EXISTS `lineups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lineups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `lineup_table_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `lineup_table_id` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lineups`
--

LOCK TABLES `lineups` WRITE;
/*!40000 ALTER TABLE `lineups` DISABLE KEYS */;
/*!40000 ALTER TABLE `lineups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lineups_gp`
--

DROP TABLE IF EXISTS `lineups_gp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lineups_gp` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `first_track_id` int NOT NULL,
  `second_track_id` int NOT NULL,
  `third_track_id` int NOT NULL,
  `fourth_track_id` int NOT NULL,
  `fifth_track_id` int NOT NULL,
  `notes` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `lineups_gp_first_track_id_tracks_id` (`first_track_id`),
  KEY `lineups_gp_second_track_id_tracks_id` (`second_track_id`),
  KEY `lineups_gp_third_track_id_tracks_id` (`third_track_id`),
  KEY `lineups_gp_fourth_track_id_tracks_id` (`fourth_track_id`),
  KEY `lineups_gp_fifth_track_id_tracks_id` (`fifth_track_id`),
  CONSTRAINT `lineups_gp_fifth_track_id_tracks_id` FOREIGN KEY (`fifth_track_id`) REFERENCES `tracks` (`id`),
  CONSTRAINT `lineups_gp_first_track_id_tracks_id` FOREIGN KEY (`first_track_id`) REFERENCES `tracks` (`id`),
  CONSTRAINT `lineups_gp_fourth_track_id_tracks_id` FOREIGN KEY (`fourth_track_id`) REFERENCES `tracks` (`id`),
  CONSTRAINT `lineups_gp_second_track_id_tracks_id` FOREIGN KEY (`second_track_id`) REFERENCES `tracks` (`id`),
  CONSTRAINT `lineups_gp_third_track_id_tracks_id` FOREIGN KEY (`third_track_id`) REFERENCES `tracks` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lineups_gp`
--

LOCK TABLES `lineups_gp` WRITE;
/*!40000 ALTER TABLE `lineups_gp` DISABLE KEYS */;
/*!40000 ALTER TABLE `lineups_gp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lineups_mp`
--

DROP TABLE IF EXISTS `lineups_mp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lineups_mp` (
  `id` int NOT NULL,
  `track_id_1` int NOT NULL,
  `track_id_2` int NOT NULL,
  `track_id_3` int NOT NULL,
  `name` varchar(20) DEFAULT 'null',
  `notes` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `lineups_mp_track_id_1_tracks_id` (`track_id_1`),
  KEY `lineups_mp_track_id_2_tracks_id` (`track_id_2`),
  KEY `lineups_mp_track_id_3_tracks_id` (`track_id_3`),
  CONSTRAINT `lineups_mp_track_id_1_tracks_id` FOREIGN KEY (`track_id_1`) REFERENCES `tracks` (`id`),
  CONSTRAINT `lineups_mp_track_id_2_tracks_id` FOREIGN KEY (`track_id_2`) REFERENCES `tracks` (`id`),
  CONSTRAINT `lineups_mp_track_id_3_tracks_id` FOREIGN KEY (`track_id_3`) REFERENCES `tracks` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lineups_mp`
--

LOCK TABLES `lineups_mp` WRITE;
/*!40000 ALTER TABLE `lineups_mp` DISABLE KEYS */;
/*!40000 ALTER TABLE `lineups_mp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `machines`
--

DROP TABLE IF EXISTS `machines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `machines` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL,
  `bs_name` varchar(40) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `machines`
--

LOCK TABLES `machines` WRITE;
/*!40000 ALTER TABLE `machines` DISABLE KEYS */;
INSERT INTO `machines` VALUES (1,'Blue Falcon','Blue Thunder'),(2,'Golden Fox','Luna Bomber'),(3,'Wild Goose','Green Amazone'),(4,'Fire Stingray','Fire Scorpion');
/*!40000 ALTER TABLE `machines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teams`
--

DROP TABLE IF EXISTS `teams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teams` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL,
  `event_id` int NOT NULL,
  `details` tinyblob NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `event_id` (`event_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teams`
--

LOCK TABLES `teams` WRITE;
/*!40000 ALTER TABLE `teams` DISABLE KEYS */;
/*!40000 ALTER TABLE `teams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tracks`
--

DROP TABLE IF EXISTS `tracks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tracks` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `type` enum('standard','mirror','classic','glitch') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `short_name` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tracks`
--

LOCK TABLES `tracks` WRITE;
/*!40000 ALTER TABLE `tracks` DISABLE KEYS */;
/*!40000 ALTER TABLE `tracks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `discord_display_name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `tag` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `discord_user_id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `verified` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `temp_unique_for_data_imports` (`discord_display_name`)
) ENGINE=InnoDB AUTO_INCREMENT=221 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (153,'Misa',NULL,NULL,_binary '\0'),(154,'Yoshi&Ike',NULL,NULL,_binary '\0'),(155,'Penpog',NULL,NULL,_binary '\0'),(156,'Nightmare',NULL,NULL,_binary '\0'),(157,'Annacate',NULL,NULL,_binary '\0'),(158,'Lidelle',NULL,NULL,_binary '\0'),(159,'Gammaween',NULL,NULL,_binary '\0'),(160,'SilverM',NULL,NULL,_binary '\0'),(161,'Mgr. Karen',NULL,NULL,_binary '\0'),(162,'Springy',NULL,NULL,_binary '\0'),(163,'SRG Cruzer',NULL,NULL,_binary '\0'),(164,'LucienDark',NULL,NULL,_binary '\0'),(165,'ハルッキーサイモン',NULL,NULL,_binary '\0'),(166,'Laura lulu',NULL,NULL,_binary '\0'),(167,'CoolDudeJB',NULL,NULL,_binary '\0'),(168,'RedstoneRM',NULL,NULL,_binary '\0'),(169,'もがみ',NULL,NULL,_binary '\0'),(170,'OZZY',NULL,NULL,_binary '\0'),(171,'Zentember',NULL,NULL,_binary '\0'),(172,'Ociosidade',NULL,NULL,_binary '\0'),(173,'Pomni',NULL,NULL,_binary '\0'),(174,'Cyto',NULL,NULL,_binary '\0'),(175,'EEVEE',NULL,NULL,_binary '\0'),(176,'Cass Star',NULL,NULL,_binary '\0'),(177,'nuxxire',NULL,NULL,_binary '\0'),(178,'Bonzai',NULL,NULL,_binary '\0'),(179,'RyanIsCool',NULL,NULL,_binary '\0'),(180,'Extus',NULL,NULL,_binary '\0'),(181,'Eggman',NULL,NULL,_binary '\0'),(182,'kibrolol',NULL,NULL,_binary '\0'),(183,'niitris',NULL,NULL,_binary '\0'),(184,'Waldemar',NULL,NULL,_binary '\0'),(185,'aim0437',NULL,NULL,_binary '\0'),(186,'Danny',NULL,NULL,_binary '\0'),(187,'Jorshama',NULL,NULL,_binary '\0'),(188,'Venator',NULL,NULL,_binary '\0'),(189,'skywlkr',NULL,NULL,_binary '\0'),(190,'Cytosine',NULL,NULL,_binary '\0'),(191,'Dillion',NULL,NULL,_binary '\0'),(192,'GhostLJK',NULL,NULL,_binary '\0'),(193,'HerbGuitar',NULL,NULL,_binary '\0'),(194,'gears',NULL,NULL,_binary '\0'),(195,'Elliot',NULL,NULL,_binary '\0'),(196,'Tesmmie',NULL,NULL,_binary '\0'),(197,'terrrrible',NULL,NULL,_binary '\0'),(198,'FSF-Herbi',NULL,NULL,_binary '\0'),(199,'i forgot my score',NULL,NULL,_binary '\0'),(200,'Fnord',NULL,NULL,_binary '\0'),(201,'fruits',NULL,NULL,_binary '\0'),(202,'Tombo',NULL,NULL,_binary '\0'),(203,'リーナ',NULL,NULL,_binary '\0'),(204,'Fahack',NULL,NULL,_binary '\0'),(205,'Kalt',NULL,NULL,_binary '\0'),(206,'Pengui',NULL,NULL,_binary '\0'),(207,'Leni',NULL,NULL,_binary '\0'),(208,'Mr, Angelo',NULL,NULL,_binary '\0'),(209,'WndrSpirit',NULL,NULL,_binary '\0'),(210,'Lilith',NULL,NULL,_binary '\0'),(211,'Marcão',NULL,NULL,_binary '\0'),(212,'Vee lost the challenges',NULL,NULL,_binary '\0'),(213,'Tree_',NULL,NULL,_binary '\0'),(214,'MetalSmasher86',NULL,NULL,_binary '\0'),(215,'pinkpools',NULL,NULL,_binary '\0'),(216,'Taco',NULL,NULL,_binary '\0'),(217,'MoonweeD',NULL,NULL,_binary '\0');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vw_event_results`
--

DROP TABLE IF EXISTS `vw_event_results`;
/*!50001 DROP VIEW IF EXISTS `vw_event_results`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_event_results` AS SELECT 
 1 AS `event`,
 1 AS `date`,
 1 AS `mode`,
 1 AS `player`,
 1 AS `score`,
 1 AS `lineup`,
 1 AS `machine`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_event_results_totals`
--

DROP TABLE IF EXISTS `vw_event_results_totals`;
/*!50001 DROP VIEW IF EXISTS `vw_event_results_totals`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_event_results_totals` AS SELECT 
 1 AS `event`,
 1 AS `date`,
 1 AS `player`,
 1 AS `final_score`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_events_leaderboard`
--

DROP TABLE IF EXISTS `vw_events_leaderboard`;
/*!50001 DROP VIEW IF EXISTS `vw_events_leaderboard`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_events_leaderboard` AS SELECT 
 1 AS `player`,
 1 AS `num_events`,
 1 AS `total_points`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_highest_event_score_WIP`
--

DROP TABLE IF EXISTS `vw_highest_event_score_WIP`;
/*!50001 DROP VIEW IF EXISTS `vw_highest_event_score_WIP`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_highest_event_score_WIP` AS SELECT 
 1 AS `scheduled_event_id`,
 1 AS `winning_score`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `vw_event_results`
--

/*!50001 DROP VIEW IF EXISTS `vw_event_results`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_event_results` AS select `e`.`name` AS `event`,date_format(`es`.`utc_start_dt`,'%m/%d/%Y') AS `date`,coalesce(`gm`.`name`,'Total') AS `mode`,`u`.`discord_display_name` AS `player`,`erp`.`score` AS `score`,coalesce(`erp`.`lineup_id`,'N/A') AS `lineup`,coalesce(`m`.`name`,'N/A') AS `machine` from (((((`event_result_points` `erp` join `events_scheduled` `es` on((`es`.`id` = `erp`.`scheduled_event_id`))) join `events` `e` on((`e`.`id` = `es`.`event_id`))) join `users` `u` on((`u`.`id` = `erp`.`user_id`))) left join `game_modes` `gm` on((`gm`.`id` = `erp`.`game_mode_id`))) left join `machines` `m` on((`m`.`id` = `erp`.`machine_id`))) order by date_format(`es`.`utc_start_dt`,'%m/%d/%Y'),`e`.`name`,`u`.`tag` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_event_results_totals`
--

/*!50001 DROP VIEW IF EXISTS `vw_event_results_totals`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_event_results_totals` AS select `e`.`name` AS `event`,date_format(`es`.`utc_start_dt`,'%m/%d/%Y') AS `date`,`u`.`discord_display_name` AS `player`,`erp`.`final_score` AS `final_score` from (((`events_scheduled` `es` join (select `erp`.`scheduled_event_id` AS `scheduled_event_id`,`erp`.`user_id` AS `user_id`,sum(`erp`.`score`) AS `final_score` from `event_result_points` `erp` group by `erp`.`scheduled_event_id`,`erp`.`user_id`) `erp` on((`erp`.`scheduled_event_id` = `es`.`id`))) join `events` `e` on((`e`.`id` = `es`.`event_id`))) join `users` `u` on((`u`.`id` = `erp`.`user_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_events_leaderboard`
--

/*!50001 DROP VIEW IF EXISTS `vw_events_leaderboard`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_events_leaderboard` AS select `u`.`discord_display_name` AS `player`,count(distinct `erp`.`scheduled_event_id`) AS `num_events`,sum(`erp`.`score`) AS `total_points` from (`event_result_points` `erp` join `users` `u` on((`u`.`id` = `erp`.`user_id`))) group by `player` order by `total_points` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_highest_event_score_WIP`
--

/*!50001 DROP VIEW IF EXISTS `vw_highest_event_score_WIP`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_highest_event_score_WIP` AS select `erp`.`scheduled_event_id` AS `scheduled_event_id`,max(`erp`.`event_score`) AS `winning_score` from (select `event_result_points`.`scheduled_event_id` AS `scheduled_event_id`,`event_result_points`.`user_id` AS `user_id`,sum(`event_result_points`.`score`) AS `event_score` from `event_result_points` group by `event_result_points`.`scheduled_event_id`,`event_result_points`.`user_id`) `erp` group by `erp`.`scheduled_event_id` */;
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

-- Dump completed on 2025-07-30  3:30:20
