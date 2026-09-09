-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: localhost    Database: family_db
-- ------------------------------------------------------
-- Server version	8.0.45

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
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add family connection',7,'add_familyconnection'),(26,'Can change family connection',7,'change_familyconnection'),(27,'Can delete family connection',7,'delete_familyconnection'),(28,'Can view family connection',7,'view_familyconnection'),(29,'Can add notification event',8,'add_notificationevent'),(30,'Can change notification event',8,'change_notificationevent'),(31,'Can delete notification event',8,'delete_notificationevent'),(32,'Can view notification event',8,'view_notificationevent');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$1000000$Fo00DhKWdd4OfZtrcKpgrv$MsiPYYS6HFkcGSlbVBwF3vcL2q0EEOXLFgfXAjVZxZo=',NULL,0,'Anil','','','anilkumar.badithala@gmail.com',0,1,'2026-09-09 08:27:40.336003'),(2,'pbkdf2_sha256$1000000$D4iIoJqEaWezYSuZ4PRMgE$ZPgympUDGrnvRA0kws1AG4zEH+Xu1bA9UQsxZRFo7kE=',NULL,1,'admin','','','',1,1,'2026-09-09 08:28:09.946576'),(3,'pbkdf2_sha256$1000000$5D1zRLJ5lQuZMUlJ2Iekpp$DMc0Vmzs2aA0CuEYG6pA00VZ26rF257HqALZvSRv85s=',NULL,0,'Anilkumar','','','anilkumar.badithala22@gmail.com',0,1,'2026-09-09 08:29:39.808943'),(4,'pbkdf2_sha256$1000000$accc9GBriKa3cc2x3lCW8Y$05faiBU6t0Q79GoOphSUVlGDyF5gZQ3ZcrY+wITIRfM=',NULL,0,'Anil kumar','','','anilkumar.badithala2@gmail.com',0,1,'2026-09-09 10:00:38.911088'),(5,'pbkdf2_sha256$1000000$GeZK0iuOXfTqPkWx7CTGTx$HUXhlDASbWlD9fbOrcK/IvB0M5un1/SzXFD9YwprMFo=',NULL,0,'ranjith','','','ranjith12@gmail.com',0,1,'2026-09-09 14:08:15.200052'),(6,'pbkdf2_sha256$1000000$kad9IPERu7LzS94MPHQCqm$89MUjsbUugzdrfngaLbZCj2DBYN609+laOd3gSjbKIo=',NULL,0,'Ranjith1','','','ranjith12@gmail.com',0,1,'2026-09-09 14:16:51.093894');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
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
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(6,'sessions','session'),(7,'userdetails','familyconnection'),(8,'userdetails','notificationevent');
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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2026-09-09 07:42:04.910738'),(2,'auth','0001_initial','2026-09-09 07:42:05.727254'),(3,'admin','0001_initial','2026-09-09 07:42:05.907143'),(4,'admin','0002_logentry_remove_auto_add','2026-09-09 07:42:05.916397'),(5,'admin','0003_logentry_add_action_flag_choices','2026-09-09 07:42:05.933307'),(6,'contenttypes','0002_remove_content_type_name','2026-09-09 07:42:06.096224'),(7,'auth','0002_alter_permission_name_max_length','2026-09-09 07:42:06.169485'),(8,'auth','0003_alter_user_email_max_length','2026-09-09 07:42:06.207073'),(9,'auth','0004_alter_user_username_opts','2026-09-09 07:42:06.216395'),(10,'auth','0005_alter_user_last_login_null','2026-09-09 07:42:06.296396'),(11,'auth','0006_require_contenttypes_0002','2026-09-09 07:42:06.300422'),(12,'auth','0007_alter_validators_add_error_messages','2026-09-09 07:42:06.311063'),(13,'auth','0008_alter_user_username_max_length','2026-09-09 07:42:06.390655'),(14,'auth','0009_alter_user_last_name_max_length','2026-09-09 07:42:06.481259'),(15,'auth','0010_alter_group_name_max_length','2026-09-09 07:42:06.512121'),(16,'auth','0011_update_proxy_permissions','2026-09-09 07:42:06.525222'),(17,'auth','0012_alter_user_first_name_max_length','2026-09-09 07:42:06.614412'),(18,'sessions','0001_initial','2026-09-09 07:42:06.654987'),(19,'userdetails','0001_initial','2026-09-09 08:17:56.695358'),(20,'userdetails','0002_familyconnection_battery_level_and_more','2026-09-09 15:25:49.368961');
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
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userdetails_familyconnection`
--

DROP TABLE IF EXISTS `userdetails_familyconnection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userdetails_familyconnection` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `unique_id` varchar(100) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `admin_id` int NOT NULL,
  `child_id` int DEFAULT NULL,
  `battery_level` int NOT NULL,
  `device_name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_id` (`unique_id`),
  KEY `userdetails_familyconnection_admin_id_2af6e110_fk_auth_user_id` (`admin_id`),
  KEY `userdetails_familyconnection_child_id_be100149_fk_auth_user_id` (`child_id`),
  CONSTRAINT `userdetails_familyconnection_admin_id_2af6e110_fk_auth_user_id` FOREIGN KEY (`admin_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `userdetails_familyconnection_child_id_be100149_fk_auth_user_id` FOREIGN KEY (`child_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userdetails_familyconnection`
--

LOCK TABLES `userdetails_familyconnection` WRITE;
/*!40000 ALTER TABLE `userdetails_familyconnection` DISABLE KEYS */;
INSERT INTO `userdetails_familyconnection` VALUES (9,'41005F3D','2026-09-09 14:27:17.659468',2,5,55,'SM-S721B');
/*!40000 ALTER TABLE `userdetails_familyconnection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userdetails_notificationevent`
--

DROP TABLE IF EXISTS `userdetails_notificationevent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userdetails_notificationevent` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app_source` varchar(50) NOT NULL,
  `sender` varchar(255) NOT NULL,
  `message_content` longtext NOT NULL,
  `timestamp` varchar(100) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `userdetails_notificationevent_user_id_23a5b2f1_fk_auth_user_id` (`user_id`),
  CONSTRAINT `userdetails_notificationevent_user_id_23a5b2f1_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=140 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userdetails_notificationevent`
--

LOCK TABLES `userdetails_notificationevent` WRITE;
/*!40000 ALTER TABLE `userdetails_notificationevent` DISABLE KEYS */;
INSERT INTO `userdetails_notificationevent` VALUES (1,'Call','+919347878181','Outgoing / Active Call','2026-09-09 17:52:46','2026-09-09 12:22:46.152248',3),(2,'Call','Unknown Number','Outgoing / Active Call','2026-09-09 17:52:46','2026-09-09 12:22:46.154244',3),(3,'Call','+919347878181','Outgoing / Active Call','2026-09-09 17:53:05','2026-09-09 12:23:05.170821',3),(4,'Call','Unknown Number','Outgoing / Active Call','2026-09-09 17:53:05','2026-09-09 12:23:05.171899',3),(5,'Call','Unknown Number','Outgoing / Active Call','2026-09-09 17:53:19','2026-09-09 12:23:18.917908',3),(6,'Call','+919849166893','Outgoing / Active Call','2026-09-09 17:53:19','2026-09-09 12:23:18.920427',3),(7,'Call','Unknown Number','Outgoing / Active Call','2026-09-09 17:53:49','2026-09-09 12:23:48.990874',3),(8,'Call','+919347878181','Outgoing / Active Call','2026-09-09 17:53:49','2026-09-09 12:23:48.992874',3),(9,'Call','+919398482535','Outgoing / Active Call','2026-09-09 17:54:08','2026-09-09 12:24:07.987142',3),(10,'Call','Unknown Number','Outgoing / Active Call','2026-09-09 17:54:08','2026-09-09 12:24:07.988270',3),(11,'Call','+919398482535','Incoming Call','2026-09-09 17:54:32','2026-09-09 12:24:31.964145',3),(12,'Call','Unknown Number','Incoming Call','2026-09-09 17:54:32','2026-09-09 12:24:31.965209',3),(13,'Call','Unknown Number','Outgoing / Active Call','2026-09-09 17:54:39','2026-09-09 12:24:39.376012',3),(14,'Call','+919398482535','Outgoing / Active Call','2026-09-09 17:54:39','2026-09-09 12:24:39.378254',3),(15,'Call','+919398482535','Incoming Call','2026-09-09 17:55:23','2026-09-09 12:25:22.957735',3),(16,'Call','Unknown Number','Incoming Call','2026-09-09 17:55:23','2026-09-09 12:25:22.959802',3),(17,'Settings','System','Call Tracking ENABLED','2026-09-09 18:11:52','2026-09-09 12:41:52.323555',3),(18,'Call','Unknown Number','Outgoing Call','2026-09-09 18:12:37','2026-09-09 12:42:37.745656',3),(19,'Call','Unknown Number','Outgoing Call','2026-09-09 18:12:46','2026-09-09 12:42:45.906340',3),(20,'Call','Unknown Number','Answered Call','2026-09-09 18:13:39','2026-09-09 12:43:39.231887',3),(21,'Settings','System','Call Tracking ENABLED','2026-09-09 19:38:21','2026-09-09 14:08:20.153368',2),(22,'Notifications','Charging (3 h 20 m until full)','65% (3 h 20 m until full)','2026-09-09 19:57:44','2026-09-09 14:27:42.944533',5),(23,'Notifications','Anil','Calling…','2026-09-09 19:58:14','2026-09-09 14:28:13.388480',5),(24,'Call','Unknown Number','Outgoing Call','2026-09-09 19:58:21','2026-09-09 14:28:20.649052',5),(25,'Notifications','Anil','Calling…','2026-09-09 19:58:24','2026-09-09 14:28:23.364734',5),(26,'Call','Unknown Number','Outgoing Call','2026-09-09 19:58:28','2026-09-09 14:28:27.326754',5),(27,'Notifications','Anil','Incoming call','2026-09-09 19:59:04','2026-09-09 14:29:03.065930',5),(28,'Notifications','Anil','Incoming call','2026-09-09 19:59:08','2026-09-09 14:29:07.873894',5),(29,'Call','Unknown Number','Answered Call','2026-09-09 19:59:12','2026-09-09 14:29:11.192035',5),(30,'Notifications','Charging (3 h 19 m until full)','65% (3 h 19 m until full)','2026-09-09 20:01:59','2026-09-09 14:31:58.396535',5),(31,'Notifications','Unknown','30°/21° · See full forecast','2026-09-09 20:04:50','2026-09-09 14:34:49.243745',5),(32,'Notifications','Charging started (3 h 22 m until full)','65% (3 h 22 m until full)','2026-09-09 20:08:44','2026-09-09 14:38:43.877611',5),(33,'Notifications','USB for charging phone','Tap for other USB options.','2026-09-09 20:08:44','2026-09-09 14:38:43.881834',5),(34,'Notifications','Charging (3 h 22 m until full)','65% (3 h 22 m until full)','2026-09-09 20:08:49','2026-09-09 14:38:48.762132',5),(35,'WhatsApp','WhatsApp','Checking for new messages','2026-09-09 20:10:41','2026-09-09 14:40:40.124840',5),(36,'WhatsApp','Anil','Hi','2026-09-09 20:10:42','2026-09-09 14:40:41.423456',5),(37,'WhatsApp','Anil','Hi','2026-09-09 20:10:42','2026-09-09 14:40:41.439765',5),(38,'WhatsApp','Anil','Em undhi le kani','2026-09-09 20:11:42','2026-09-09 14:41:41.347041',5),(39,'WhatsApp','Anil','Em undhi le kani','2026-09-09 20:11:42','2026-09-09 14:41:41.348145',5),(40,'Messages','⁨Anil⁩','Yeap','2026-09-09 20:13:16','2026-09-09 14:43:15.357720',5),(41,'Messages','⁨Anil⁩','Oo I seee','2026-09-09 20:13:18','2026-09-09 14:43:17.512998',5),(42,'Notifications','Ramya','Added to their Story.','2026-09-09 20:14:01','2026-09-09 14:44:00.134905',5),(43,'WhatsApp','Sri Mami❤️‍🩹✨️','Mm','2026-09-09 20:15:32','2026-09-09 14:45:31.270357',5),(44,'WhatsApp','Sri Mami❤️‍🩹✨️','Mm','2026-09-09 20:15:32','2026-09-09 14:45:31.277717',5),(45,'Instagram','Nithish 🍂','Dei punda','2026-09-09 20:16:02','2026-09-09 14:46:01.114703',5),(46,'WhatsApp','Sri Mami❤️‍🩹✨️','Mmm','2026-09-09 20:16:57','2026-09-09 14:46:56.132955',5),(47,'WhatsApp','Sri Mami❤️‍🩹✨️','Mmm','2026-09-09 20:16:57','2026-09-09 14:46:56.133951',5),(48,'WhatsApp','Sri Mami❤️‍🩹✨️','Seri','2026-09-09 20:16:57','2026-09-09 14:46:56.707347',5),(49,'WhatsApp','Sri Mami❤️‍🩹✨️','2 new messages','2026-09-09 20:16:57','2026-09-09 14:46:56.713165',5),(50,'WhatsApp','Sri Mami❤️‍🩹✨️','Na panna pora','2026-09-09 20:17:02','2026-09-09 14:47:01.046724',5),(51,'WhatsApp','Sri Mami❤️‍🩹✨️','3 new messages','2026-09-09 20:17:02','2026-09-09 14:47:01.049484',5),(52,'WhatsApp','Sri Mami❤️‍🩹✨️','9 clock vaikum','2026-09-09 20:17:08','2026-09-09 14:47:07.346178',5),(53,'WhatsApp','Sri Mami❤️‍🩹✨️','4 new messages','2026-09-09 20:17:08','2026-09-09 14:47:07.359033',5),(54,'WhatsApp','Sri Mami❤️‍🩹✨️','Epo tha padikalamu','2026-09-09 20:21:25','2026-09-09 14:51:25.035063',5),(55,'WhatsApp','Sri Mami❤️‍🩹✨️','4 new messages','2026-09-09 20:21:25','2026-09-09 14:51:25.037234',5),(56,'WhatsApp','Sri Mami❤️‍🩹✨️','4 new messages','2026-09-09 20:21:25','2026-09-09 14:51:25.039326',5),(57,'WhatsApp','Sri Mami❤️‍🩹✨️','Bro','2026-09-09 20:21:25','2026-09-09 14:51:25.040376',5),(58,'WhatsApp','Sri Mami❤️‍🩹✨️','4 new messages','2026-09-09 20:21:25','2026-09-09 14:51:25.047757',5),(59,'WhatsApp','Sri Mami❤️‍🩹✨️','Current off','2026-09-09 20:21:25','2026-09-09 14:51:25.250209',5),(60,'WhatsApp','Sri Mami❤️‍🩹✨️','4 new messages','2026-09-09 20:21:25','2026-09-09 14:51:25.251669',5),(61,'WhatsApp','Sri Mami❤️‍🩹✨️','Yaduthan','2026-09-09 20:21:25','2026-09-09 14:51:25.252722',5),(62,'WhatsApp','OnlineStudy4U- G25- Offcampushiring Batch 2026 Group 2 (4 messages): ~ onlinestudy4u','🔗 Accenture , Deloitte , HCl tech, Hexware Hiring | Batch 2027-2024 | offcampus Hiring (youtu.be)','2026-09-09 20:23:51','2026-09-09 14:53:49.941306',5),(63,'WhatsApp','WhatsApp','8 messages from 2 chats','2026-09-09 20:23:51','2026-09-09 14:53:49.945116',5),(64,'Instagram','suryaaa🤎','Sent a profile: balaji.send2wipro','2026-09-09 20:25:12','2026-09-09 14:55:11.112341',5),(65,'Notifications','USB for charging phone','Tap for other USB options.','2026-09-09 20:30:25','2026-09-09 15:00:24.257696',5),(66,'Notifications','Charging started (3 h 37 m until full)','62% (3 h 37 m until full)','2026-09-09 20:30:25','2026-09-09 15:00:24.575647',5),(67,'WhatsApp','OnlineStudy4U- G25- Offcampushiring Batch 2026 Group 2','4 new messages','2026-09-09 20:30:26','2026-09-09 15:00:25.133283',5),(68,'Notifications','Charging (3 h 37 m until full)','62% (3 h 37 m until full)','2026-09-09 20:30:30','2026-09-09 15:00:29.780319',5),(69,'Notifications','Charging (3 h 37 m until full)','62% (3 h 37 m until full)','2026-09-09 20:30:45','2026-09-09 15:00:44.284046',5),(70,'Notifications','Charging (3 h 37 m until full)','62% (3 h 37 m until full)','2026-09-09 20:31:55','2026-09-09 15:01:54.918310',5),(71,'Notifications','Charging (3 h 36 m until full)','62% (3 h 36 m until full)','2026-09-09 20:32:57','2026-09-09 15:02:56.173256',5),(72,'Notifications','NPTEL','NPTEL Newsletter: NPTEL: India Was Teaching the World Before \"MOOC\" Was Even a Word','2026-09-09 20:38:58','2026-09-09 15:08:57.716550',5),(73,'Notifications','NPTEL','NPTEL Newsletter: NPTEL: India Was Teaching the World Before \"MOOC\" Was Even a Word','2026-09-09 20:38:58','2026-09-09 15:08:57.720080',5),(74,'Notifications','Mayil Veera - Lyric Video | Sardar 2 | Karthi | Malavika Mohanan | PS Mithran | Sam CS','Sony Music South','2026-09-09 20:40:29','2026-09-09 15:10:28.175438',5),(75,'Notifications','Mayil Veera - Lyric Video | Sardar 2 | Karthi | Malavika Mohanan | PS Mithran | Sam CS','Sony Music South','2026-09-09 20:40:37','2026-09-09 15:10:36.568994',5),(76,'Notifications','Mayil Veera - Lyric Video | Sardar 2 | Karthi | Malavika Mohanan | PS Mithran | Sam CS','Sony Music South','2026-09-09 20:40:37','2026-09-09 15:10:36.748177',5),(77,'Notifications','Your profile’s getting attention','3 new views. Show details.','2026-09-09 20:40:39','2026-09-09 15:10:38.158215',5),(78,'Notifications','Mayil Veera - Lyric Video | Sardar 2 | Karthi | Malavika Mohanan | PS Mithran | Sam CS','Sony Music South','2026-09-09 20:40:39','2026-09-09 15:10:38.548925',5),(79,'Notifications','Mayil Veera - Lyric Video | Sardar 2 | Karthi | Malavika Mohanan | PS Mithran | Sam CS','Sony Music South','2026-09-09 20:40:39','2026-09-09 15:10:38.569915',5),(80,'Notifications','Mayil Veera - Lyric Video | Sardar 2 | Karthi | Malavika Mohanan | PS Mithran | Sam CS','Sony Music South','2026-09-09 20:40:39','2026-09-09 15:10:38.680832',5),(81,'Instagram','DRAGON SLAYERS🐉: ARUN𓆩🦅𓆪','Sent a reel','2026-09-09 20:40:41','2026-09-09 15:10:40.340158',5),(82,'Notifications','Mayil Veera - Lyric Video | Sardar 2 | Karthi | Malavika Mohanan | PS Mithran | Sam CS','Sony Music South','2026-09-09 20:40:46','2026-09-09 15:10:44.974836',5),(83,'Notifications','Mayil Veera - Lyric Video | Sardar 2 | Karthi | Malavika Mohanan | PS Mithran | Sam CS','Sony Music South','2026-09-09 20:40:46','2026-09-09 15:10:45.185804',5),(84,'Notifications','Mayil Veera - Lyric Video | Sardar 2 | Karthi | Malavika Mohanan | PS Mithran | Sam CS','Sony Music South','2026-09-09 20:40:47','2026-09-09 15:10:46.720809',5),(85,'Notifications','Mayil Veera - Lyric Video | Sardar 2 | Karthi | Malavika Mohanan | PS Mithran | Sam CS','Sony Music South','2026-09-09 20:41:06','2026-09-09 15:11:05.455885',5),(86,'Call','Unknown Number','Answered Call','2026-09-09 20:47:40','2026-09-09 15:17:39.630090',5),(87,'Notifications','Mayil Veera - Lyric Video | Sardar 2 | Karthi | Malavika Mohanan | PS Mithran | Sam CS','Sony Music South','2026-09-09 20:52:45','2026-09-09 15:22:44.164714',5),(88,'Notifications','Mayil Veera - Lyric Video | Sardar 2 | Karthi | Malavika Mohanan | PS Mithran | Sam CS','Sony Music South','2026-09-09 20:52:45','2026-09-09 15:22:44.264588',5),(89,'Notifications','Mayil Veera - Lyric Video | Sardar 2 | Karthi | Malavika Mohanan | PS Mithran | Sam CS','Sony Music South','2026-09-09 20:52:46','2026-09-09 15:22:44.966888',5),(90,'Notifications','Mayil Veera - Lyric Video | Sardar 2 | Karthi | Malavika Mohanan | PS Mithran | Sam CS','Sony Music South','2026-09-09 20:52:48','2026-09-09 15:22:47.746545',5),(91,'Notifications','🎊 Min. 50% Off just dropped!','🎉 Don\'t miss! Grab this epic deal now >>','2026-09-09 20:53:06','2026-09-09 15:23:05.065052',5),(92,'Notifications','🎊 Min. 50% Off just dropped!','🎉 Don\'t miss! Grab this epic deal now >>','2026-09-09 20:53:06','2026-09-09 15:23:05.719596',5),(93,'Notifications','USB for charging phone','Tap for other USB options.','2026-09-09 20:53:54','2026-09-09 15:23:53.154758',5),(94,'Notifications','Charging started (3 h 58 m until full)','59% (3 h 58 m until full)','2026-09-09 20:53:54','2026-09-09 15:23:53.259129',5),(95,'Notifications','Charging (3 h 58 m until full)','59% (3 h 58 m until full)','2026-09-09 20:53:59','2026-09-09 15:23:58.259637',5),(96,'Notifications','Charging (3 h 58 m until full)','59% (3 h 58 m until full)','2026-09-09 20:54:14','2026-09-09 15:24:13.059115',5),(97,'Notifications','LinkedIn','Shimona M. posted: Dear LinkedIn,\n\nYou belong to me! Should I buy you flowers because our reach… 💡','2026-09-09 20:54:20','2026-09-09 15:24:19.867925',5),(98,'Notifications','Mayil Veera - Lyric Video | Sardar 2 | Karthi | Malavika Mohanan | PS Mithran | Sam CS','Sony Music South','2026-09-09 20:55:57','2026-09-09 15:25:56.616771',5),(99,'Notifications','Vettri Thamizh Murugan (From \"Thamizh Murugan\")','Sai Abhyankkar','2026-09-09 20:55:59','2026-09-09 15:25:58.381138',5),(100,'WhatsApp','Sri Mami❤️‍🩹✨️','Mm','2026-09-09 20:57:17','2026-09-09 15:27:16.750750',5),(101,'WhatsApp','Sri Mami❤️‍🩹✨️','Mm','2026-09-09 20:57:17','2026-09-09 15:27:16.751947',5),(102,'Notifications','Vettri Thamizh Murugan (From \"Thamizh Murugan\")','Sai Abhyankkar','2026-09-09 20:57:56','2026-09-09 15:27:55.518355',5),(103,'Notifications','Vettri Thamizh Murugan (From \"Thamizh Murugan\")','Sai Abhyankkar','2026-09-09 20:57:56','2026-09-09 15:27:55.519438',5),(104,'Notifications','Yeshanagula | The Paradise | Nani | Keerthy Suresh | Anirudh Ravichander | Srikanth Odela','Saregama Telugu','2026-09-09 20:57:58','2026-09-09 15:27:56.943648',5),(105,'Notifications','Yeshanagula | The Paradise | Nani | Keerthy Suresh | Anirudh Ravichander | Srikanth Odela','Saregama Telugu','2026-09-09 21:01:08','2026-09-09 15:31:07.423952',5),(106,'Notifications','Yeshanagula | The Paradise | Nani | Keerthy Suresh | Anirudh Ravichander | Srikanth Odela','Saregama Telugu','2026-09-09 21:01:08','2026-09-09 15:31:07.424990',5),(107,'Notifications','Keralanaadu | I-POPSTAR | EP 11 | Priya Jerson | Vijay Narain','Saregama Tamil','2026-09-09 21:01:10','2026-09-09 15:31:09.239138',5),(108,'Notifications','Keralanaadu | I-POPSTAR | EP 11 | Priya Jerson | Vijay Narain','Saregama Tamil','2026-09-09 21:04:16','2026-09-09 15:34:15.988242',5),(109,'Notifications','Keralanaadu | I-POPSTAR | EP 11 | Priya Jerson | Vijay Narain','Saregama Tamil','2026-09-09 21:04:16','2026-09-09 15:34:16.010742',5),(110,'Notifications','Karuppane Vaarumayya','Sai Abhyankkar','2026-09-09 21:04:17','2026-09-09 15:34:17.068448',5),(111,'Notifications','USB for charging phone','Tap for other USB options.','2026-09-09 21:05:16','2026-09-09 15:35:14.977422',5),(112,'Notifications','Charging started (4 h 18 m until full)','55% (4 h 18 m until full)','2026-09-09 21:05:16','2026-09-09 15:35:15.125497',5),(113,'Notifications','Charging (4 h 18 m until full)','55% (4 h 18 m until full)','2026-09-09 21:05:21','2026-09-09 15:35:20.137374',5),(114,'Notifications','Charging (4 h 19 m until full)','55% (4 h 19 m until full)','2026-09-09 21:05:36','2026-09-09 15:35:34.995614',5),(115,'Notifications','Karuppane Vaarumayya','Sai Abhyankkar','2026-09-09 21:05:50','2026-09-09 15:35:49.779501',5),(116,'Notifications','Ala Bolelo - Lyric Video | Jailer 2 | Superstar Rajinikanth | Sun Pictures | Nelson | Anirudh','Sun TV','2026-09-09 21:05:52','2026-09-09 15:35:51.643519',5),(117,'WhatsApp','9🐶','Ok ok','2026-09-09 21:06:07','2026-09-09 15:36:06.575166',5),(118,'WhatsApp','9🐶','Ok ok','2026-09-09 21:06:07','2026-09-09 15:36:06.590175',5),(119,'WhatsApp','9🐶','2 new messages','2026-09-09 21:06:25','2026-09-09 15:36:24.658921',5),(120,'WhatsApp','9🐶','Hi','2026-09-09 21:06:25','2026-09-09 15:36:24.660000',5),(121,'Notifications','Charging (4 h 18 m until full)','55% (4 h 18 m until full)','2026-09-09 21:06:37','2026-09-09 15:36:35.954587',5),(122,'Instagram','Nithish 🍂','Hi','2026-09-09 21:07:22','2026-09-09 15:37:20.874691',5),(123,'Notifications','Charging (4 h 18 m until full)','55% (4 h 18 m until full)','2026-09-09 21:07:48','2026-09-09 15:37:47.414732',5),(124,'Notifications','Ala Bolelo - Lyric Video | Jailer 2 | Superstar Rajinikanth | Sun Pictures | Nelson | Anirudh','Sun TV','2026-09-09 21:08:58','2026-09-09 15:38:57.777372',5),(125,'Notifications','Charging (4 h 18 m until full)','55% (4 h 18 m until full)','2026-09-09 21:08:59','2026-09-09 15:38:58.477810',5),(126,'Notifications','Anil','Calling…','2026-09-09 21:12:14','2026-09-09 15:42:13.578758',5),(127,'Call','Unknown Number','Outgoing Call','2026-09-09 21:12:18','2026-09-09 15:42:17.122452',5),(128,'Notifications','Sri Mami❤️‍🩹✨️','Calling…','2026-09-09 21:13:07','2026-09-09 15:43:05.878164',5),(129,'Notifications','Update your phone','A software update is available.','2026-09-09 21:13:12','2026-09-09 15:43:11.387623',5),(130,'Call','Unknown Number','Outgoing Call','2026-09-09 21:13:18','2026-09-09 15:43:17.246004',5),(131,'WhatsApp','9🐶','Hi','2026-09-09 21:13:30','2026-09-09 15:43:29.349512',5),(132,'WhatsApp','Sri Mami❤️‍🩹✨️','Slu','2026-09-09 21:13:30','2026-09-09 15:43:29.352173',5),(133,'WhatsApp','WhatsApp','4 messages from 2 chats','2026-09-09 21:13:30','2026-09-09 15:43:29.360058',5),(134,'Notifications','🤑Unlimited up to 5% Cashback!🤑','Get up to 5% Cashback each time you pay! Send money to your friends, family, or crush now! ❤️🚀','2026-09-09 21:13:30','2026-09-09 15:43:29.583909',5),(135,'WhatsApp','You','Saptiya nu keka','2026-09-09 21:13:39','2026-09-09 15:43:38.796171',5),(136,'WhatsApp','Sri Mami❤️‍🩹✨️','Iru iru','2026-09-09 21:13:49','2026-09-09 15:43:48.089938',5),(137,'WhatsApp','WhatsApp','3 messages from 2 chats','2026-09-09 21:13:49','2026-09-09 15:43:48.090934',5),(138,'WhatsApp','Sri Mami❤️‍🩹✨️','Pandra','2026-09-09 21:13:50','2026-09-09 15:43:49.694144',5),(139,'WhatsApp','WhatsApp','4 messages from 2 chats','2026-09-09 21:13:50','2026-09-09 15:43:49.694144',5);
/*!40000 ALTER TABLE `userdetails_notificationevent` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-09-09 22:58:55
