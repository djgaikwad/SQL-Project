-- MariaDB dump 10.19  Distrib 10.4.25-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: train
-- ------------------------------------------------------
-- Server version	10.4.25-MariaDB

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

create database train;
use train;
--
-- Table structure for table `passenger`
--

DROP TABLE IF EXISTS `passenger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `passenger` (
  `passenger_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `ticket_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`passenger_id`),
  KEY `fk_userid` (`user_id`),
  KEY `fk_ticketid` (`ticket_id`),
  CONSTRAINT `fk_ticketid` FOREIGN KEY (`ticket_id`) REFERENCES `ticket` (`ticket_id`),
  CONSTRAINT `fk_userid` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `passenger`
--

LOCK TABLES `passenger` WRITE;
/*!40000 ALTER TABLE `passenger` DISABLE KEYS */;
INSERT INTO `passenger` VALUES (1,4,24),(2,10,35),(3,3,30),(4,1,16),(5,2,33),(6,5,36),(7,6,37),(8,7,42),(9,8,16),(10,9,31);
/*!40000 ALTER TABLE `passenger` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `schedule`
--

DROP TABLE IF EXISTS `schedule`;
/*!50001 DROP VIEW IF EXISTS `schedule`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `schedule` (
  `location` tinyint NOT NULL,
  `train_name` tinyint NOT NULL,
  `station_name` tinyint NOT NULL,
  `timming` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `station`
--

DROP TABLE IF EXISTS `station`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `station` (
  `station_id` int(11) NOT NULL,
  `station_name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`station_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `station`
--

LOCK TABLES `station` WRITE;
/*!40000 ALTER TABLE `station` DISABLE KEYS */;
INSERT INTO `station` VALUES (1,'Mumbai CSMT'),(2,'Dadar Central'),(3,'Thane'),(4,'Kalyan Junction'),(5,'Neral Junction'),(6,'Karjat Junction'),(7,'Khandala'),(8,'Lonavala'),(9,'Talegaon'),(10,'Khakdi'),(11,'Shivaji Nagar'),(12,'Pune Junction');
/*!40000 ALTER TABLE `station` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket`
--

DROP TABLE IF EXISTS `ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ticket` (
  `ticket_id` int(11) NOT NULL,
  `station_id_in` int(11) DEFAULT NULL,
  `station_id_out` int(11) DEFAULT NULL,
  `train_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`ticket_id`),
  KEY `fk_stationid` (`station_id_in`),
  KEY `fk_stationid2` (`station_id_out`),
  KEY `fk_trainid` (`train_id`),
  CONSTRAINT `fk_stationid` FOREIGN KEY (`station_id_in`) REFERENCES `station` (`station_id`),
  CONSTRAINT `fk_stationid2` FOREIGN KEY (`station_id_out`) REFERENCES `station` (`station_id`),
  CONSTRAINT `fk_trainid` FOREIGN KEY (`train_id`) REFERENCES `train` (`train_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket`
--

LOCK TABLES `ticket` WRITE;
/*!40000 ALTER TABLE `ticket` DISABLE KEYS */;
INSERT INTO `ticket` VALUES (16,1,12,1),(18,1,7,1),(20,3,12,1),(22,7,12,1),(23,5,11,1),(24,2,6,1),(25,10,3,1),(26,11,2,1),(27,9,6,1),(28,7,12,1),(29,11,4,1),(30,6,2,1),(31,1,12,2),(32,1,7,2),(33,3,12,2),(34,7,12,2),(35,5,11,2),(36,2,6,2),(37,10,3,2),(38,11,5,2),(39,9,3,2),(40,7,9,2),(41,11,3,2),(42,6,1,2);
/*!40000 ALTER TABLE `ticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `ticket_info`
--

DROP TABLE IF EXISTS `ticket_info`;
/*!50001 DROP VIEW IF EXISTS `ticket_info`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `ticket_info` (
  `ticket_id` tinyint NOT NULL,
  `boarding` tinyint NOT NULL,
  `deboarding` tinyint NOT NULL,
  `train_name` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `time`
--

DROP TABLE IF EXISTS `time`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `time` (
  `time_id` int(11) NOT NULL,
  `timming` time DEFAULT NULL,
  PRIMARY KEY (`time_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `time`
--

LOCK TABLES `time` WRITE;
/*!40000 ALTER TABLE `time` DISABLE KEYS */;
INSERT INTO `time` VALUES (1,'07:00:00'),(2,'07:15:00'),(3,'07:30:00'),(4,'07:45:00'),(5,'08:00:00'),(6,'08:15:00'),(7,'08:30:00'),(8,'08:45:00'),(9,'09:00:00'),(10,'09:15:00'),(11,'09:30:00'),(12,'09:45:00'),(13,'10:00:00'),(14,'10:15:00'),(15,'10:30:00'),(16,'10:45:00'),(17,'11:00:00'),(18,'11:15:00'),(19,'11:30:00'),(20,'12:00:00'),(21,'12:15:00'),(22,'12:30:00'),(23,'12:45:00'),(24,'13:00:00'),(25,'13:15:00'),(26,'13:30:00'),(27,'13:45:00'),(28,'14:00:00'),(29,'14:15:00'),(30,'14:30:00'),(31,'14:45:00'),(32,'15:00:00'),(33,'15:15:00'),(34,'15:30:00'),(35,'15:45:00'),(36,'16:00:00'),(37,'16:15:00'),(38,'16:30:00'),(39,'16:45:00'),(40,'17:00:00');
/*!40000 ALTER TABLE `time` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `train`
--

DROP TABLE IF EXISTS `train`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `train` (
  `train_id` int(11) NOT NULL,
  `train_name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`train_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `train`
--

LOCK TABLES `train` WRITE;
/*!40000 ALTER TABLE `train` DISABLE KEYS */;
INSERT INTO `train` VALUES (1,'Intercity SF Express'),(2,'Deccan Express');
/*!40000 ALTER TABLE `train` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `train_status`
--

DROP TABLE IF EXISTS `train_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `train_status` (
  `location` int(11) NOT NULL,
  `train_id` int(11) DEFAULT NULL,
  `station_id` int(11) DEFAULT NULL,
  `time_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`location`),
  KEY `fk_timeid` (`time_id`),
  KEY `fk_trainid1` (`train_id`),
  KEY `fk_stationid1` (`station_id`),
  CONSTRAINT `fk_stationid1` FOREIGN KEY (`station_id`) REFERENCES `station` (`station_id`),
  CONSTRAINT `fk_timeid` FOREIGN KEY (`time_id`) REFERENCES `time` (`time_id`),
  CONSTRAINT `fk_trainid1` FOREIGN KEY (`train_id`) REFERENCES `train` (`train_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `train_status`
--

LOCK TABLES `train_status` WRITE;
/*!40000 ALTER TABLE `train_status` DISABLE KEYS */;
INSERT INTO `train_status` VALUES (1,1,1,5),(2,1,2,6),(3,1,3,7),(7,1,4,8),(8,1,5,9),(9,1,6,10),(10,1,7,11),(11,1,8,12),(12,1,9,13),(13,1,10,14),(14,1,11,15),(15,1,12,16),(16,1,1,17),(17,1,1,18),(18,1,2,19),(19,1,3,20),(20,1,4,21),(21,1,5,23),(22,1,6,22),(23,1,7,21),(24,1,8,20),(25,1,9,19),(26,1,10,18),(27,1,11,17),(28,2,2,13),(29,2,3,14),(30,2,4,15),(31,2,5,16),(32,2,6,17),(33,2,7,18),(34,2,8,19),(35,2,9,20),(36,2,10,21),(37,2,11,22),(38,2,12,23),(39,2,11,24),(40,2,10,25),(41,2,9,26),(42,2,8,27),(43,2,7,28),(44,2,6,29),(45,2,5,30),(46,2,4,31),(47,2,3,32),(48,2,2,33),(49,2,1,34);
/*!40000 ALTER TABLE `train_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Ajay','ajay@gmail.com'),(2,'Abhay','abhay@mail.com'),(3,'Brijesh','brijesh@email.com'),(4,'Chetan','chetan@yahoo.in'),(5,'Dhawal','dhawal@hotmail.co'),(6,'Rumit','rumit@mail.com'),(7,'Varsha','varsha@itved.com'),(8,'Neha','neha@kaggel.com'),(9,'Mihir','mihir@mail.com'),(10,'Shree','shree@gmail.com');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `schedule`
--

/*!50001 DROP TABLE IF EXISTS `schedule`*/;
/*!50001 DROP VIEW IF EXISTS `schedule`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp850 */;
/*!50001 SET character_set_results     = cp850 */;
/*!50001 SET collation_connection      = cp850_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `schedule` AS select `train_status`.`location` AS `location`,`train`.`train_name` AS `train_name`,`station`.`station_name` AS `station_name`,`time`.`timming` AS `timming` from (((`train_status` join `train` on(`train_status`.`train_id` = `train`.`train_id`)) join `station` on(`train_status`.`station_id` = `station`.`station_id`)) join `time` on(`train_status`.`time_id` = `time`.`time_id`)) order by `time`.`timming` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `ticket_info`
--

/*!50001 DROP TABLE IF EXISTS `ticket_info`*/;
/*!50001 DROP VIEW IF EXISTS `ticket_info`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp850 */;
/*!50001 SET character_set_results     = cp850 */;
/*!50001 SET collation_connection      = cp850_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `ticket_info` AS select `ticket`.`ticket_id` AS `ticket_id`,`station`.`station_name` AS `boarding`,`station`.`station_name` AS `deboarding`,`train`.`train_name` AS `train_name` from ((`ticket` join `station` on(`ticket`.`station_id_in` = `station`.`station_id` or `ticket`.`station_id_out` = `station`.`station_id`)) join `train` on(`train`.`train_id` = `ticket`.`train_id`)) order by `ticket`.`ticket_id` */;
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

-- Dump completed on 2023-01-14 18:48:34
