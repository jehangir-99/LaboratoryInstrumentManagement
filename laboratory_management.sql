-- MySQL dump 10.13  Distrib 5.7.44, for Win64 (x86_64)
--
-- Host: localhost    Database: laboratory_management
-- ------------------------------------------------------
-- Server version	5.7.44-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `accounts_userprofile`
--

DROP TABLE IF EXISTS `accounts_userprofile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts_userprofile` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `department` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `accounts_userprofile_user_id_92240672_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_userprofile`
--

LOCK TABLES `accounts_userprofile` WRITE;
/*!40000 ALTER TABLE `accounts_userprofile` DISABLE KEYS */;
INSERT INTO `accounts_userprofile` VALUES (5,'administrator','03102722209','Administration',1,'2026-09-17 23:17:29.594629','2026-09-17 23:17:29.594629',7);
/*!40000 ALTER TABLE `accounts_userprofile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
INSERT INTO `auth_group` VALUES (1,'Administrator'),(2,'Laboratory Manager'),(3,'Standard User');
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
INSERT INTO `auth_group_permissions` VALUES (1,1,1),(2,1,2),(3,1,3),(4,1,4),(5,1,5),(6,1,6),(7,1,7),(8,1,8),(9,1,9),(10,1,10),(11,1,11),(12,1,12),(13,1,13),(14,1,14),(15,1,15),(16,1,16),(17,1,17),(18,1,18),(19,1,19),(20,1,20),(21,1,21),(22,1,22),(23,1,23),(24,1,24),(25,1,25),(26,1,26),(27,1,27),(28,1,28),(29,1,29),(30,1,30),(31,1,31),(32,1,32),(33,1,33),(34,1,34),(35,1,35),(36,1,36),(37,1,37),(38,1,38),(39,1,39),(40,1,40),(41,1,41),(42,1,42),(43,1,43),(44,1,44),(45,1,45),(46,1,46),(47,1,47),(48,1,48),(49,2,25),(50,2,26),(51,2,27),(52,2,28),(53,2,29),(54,2,30),(55,2,31),(56,2,32),(57,2,33),(58,2,34),(59,2,35),(60,2,36),(61,2,37),(62,2,38),(63,2,39),(64,2,40),(65,2,41),(66,2,42),(67,2,43),(68,2,44),(73,3,28),(69,3,32),(70,3,36),(71,3,40),(72,3,44);
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add instrument',7,'add_instrument'),(26,'Can change instrument',7,'change_instrument'),(27,'Can delete instrument',7,'delete_instrument'),(28,'Can view instrument',7,'view_instrument'),(29,'Can add localization',8,'add_localization'),(30,'Can change localization',8,'change_localization'),(31,'Can delete localization',8,'delete_localization'),(32,'Can view localization',8,'view_localization'),(33,'Can add supplier',9,'add_supplier'),(34,'Can change supplier',9,'change_supplier'),(35,'Can delete supplier',9,'delete_supplier'),(36,'Can view supplier',9,'view_supplier'),(37,'Can add calibration',10,'add_calibration'),(38,'Can change calibration',10,'change_calibration'),(39,'Can delete calibration',10,'delete_calibration'),(40,'Can view calibration',10,'view_calibration'),(41,'Can add maintenance',11,'add_maintenance'),(42,'Can change maintenance',11,'change_maintenance'),(43,'Can delete maintenance',11,'delete_maintenance'),(44,'Can view maintenance',11,'view_maintenance'),(45,'Can add user profile',12,'add_userprofile'),(46,'Can change user profile',12,'change_userprofile'),(47,'Can delete user profile',12,'delete_userprofile'),(48,'Can view user profile',12,'view_userprofile'),(49,'Can add location',13,'add_location'),(50,'Can change location',13,'change_location'),(51,'Can delete location',13,'delete_location'),(52,'Can view location',13,'view_location'),(53,'Can add location',14,'add_location'),(54,'Can change location',14,'change_location'),(55,'Can delete location',14,'delete_location'),(56,'Can view location',14,'view_location');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(254) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (6,'pbkdf2_sha256$260000$qKEi4BmsfZaE1DolW3JjB1$f0tl9ApbWRk37ElcqfuqZokmgdwljNoaLATXmcKsPKE=','2026-09-17 23:05:27.504595',1,'admin','','','admin@gmail.com',1,1,'2026-09-17 23:03:43.975515'),(7,'pbkdf2_sha256$260000$arQQRX3rgD7ZjxZ49khcF8$knV5Ooe/8Sqak8DAAYkAt+6cLdP+FH709LkGdbbqk6g=','2026-09-18 00:06:23.012266',0,'test','Jehangir','Farhan','admin@gmail.com',0,1,'2026-09-17 23:17:29.292878');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calibrations_calibration`
--

DROP TABLE IF EXISTS `calibrations_calibration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `calibrations_calibration` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `calibration_date` date NOT NULL,
  `remarks` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `instrument_id` bigint(20) NOT NULL,
  `certificate_number` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `next_calibration_date` date DEFAULT NULL,
  `performed_by` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `calibrations_calibra_instrument_id_b1a050ce_fk_instrumen` (`instrument_id`),
  CONSTRAINT `calibrations_calibra_instrument_id_b1a050ce_fk_instrumen` FOREIGN KEY (`instrument_id`) REFERENCES `instruments_instrument` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calibrations_calibration`
--

LOCK TABLES `calibrations_calibration` WRITE;
/*!40000 ALTER TABLE `calibrations_calibration` DISABLE KEYS */;
INSERT INTO `calibrations_calibration` VALUES (2,'2026-09-17','Calibration completed successfully','2026-09-17 16:10:42.922149','2026-09-17 16:10:42.922149',2,'CAL-2026-001','2027-09-17','ABC Calibration Services','completed');
/*!40000 ALTER TABLE `calibrations_calibration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext COLLATE utf8mb4_unicode_ci,
  `object_repr` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (12,'accounts','userprofile'),(1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(10,'calibrations','calibration'),(5,'contenttypes','contenttype'),(7,'instruments','instrument'),(8,'instruments','localization'),(14,'locations','location'),(11,'maintenance','maintenance'),(6,'sessions','session'),(13,'suppliers','location'),(9,'suppliers','supplier');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2026-09-16 21:25:59.474195'),(2,'auth','0001_initial','2026-09-16 21:26:00.802239'),(3,'admin','0001_initial','2026-09-16 21:26:01.105174'),(4,'admin','0002_logentry_remove_auto_add','2026-09-16 21:26:01.118917'),(5,'admin','0003_logentry_add_action_flag_choices','2026-09-16 21:26:01.138736'),(6,'contenttypes','0002_remove_content_type_name','2026-09-16 21:26:01.298932'),(7,'auth','0002_alter_permission_name_max_length','2026-09-16 21:26:01.380880'),(8,'auth','0003_alter_user_email_max_length','2026-09-16 21:26:01.396972'),(9,'auth','0004_alter_user_username_opts','2026-09-16 21:26:01.430150'),(10,'auth','0005_alter_user_last_login_null','2026-09-16 21:26:01.550493'),(11,'auth','0006_require_contenttypes_0002','2026-09-16 21:26:01.556035'),(12,'auth','0007_alter_validators_add_error_messages','2026-09-16 21:26:01.576962'),(13,'auth','0008_alter_user_username_max_length','2026-09-16 21:26:01.698763'),(14,'auth','0009_alter_user_last_name_max_length','2026-09-16 21:26:01.852283'),(15,'auth','0010_alter_group_name_max_length','2026-09-16 21:26:01.897359'),(16,'auth','0011_update_proxy_permissions','2026-09-16 21:26:01.914202'),(17,'auth','0012_alter_user_first_name_max_length','2026-09-16 21:26:02.058642'),(18,'sessions','0001_initial','2026-09-16 21:26:02.129641'),(19,'suppliers','0001_initial','2026-09-16 21:43:13.194555'),(23,'accounts','0001_initial','2026-09-16 22:08:08.793214'),(24,'suppliers','0002_location','2026-09-16 22:49:24.998144'),(25,'instruments','0001_initial','2026-09-16 23:10:19.003870'),(26,'calibrations','0001_initial','2026-09-16 23:10:29.397931'),(27,'maintenance','0001_initial','2026-09-16 23:10:35.104218'),(28,'locations','0001_initial','2026-09-17 15:16:55.124771'),(29,'instruments','0002_alter_instrument_location','2026-09-17 15:29:25.700745'),(30,'calibrations','0002_auto_20260917_2058','2026-09-17 15:58:19.344837');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `session_data` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('egnj6bim1i1y7ad7no8vuynn2jtrsbyt','.eJxVjMEOwiAQRP-FsyEr0KV49O43kIXdStXQpLQn47_bJj3ocea9mbeKtC4lrk3mOLK6KK9Ov12i_JS6A35QvU86T3WZx6R3RR-06dvE8roe7t9BoVa2tZFAhoAyJIe-MwwBc_AiZ8xoiJ31PRgARGetuA6kx2S3RAMP1on6fAHRNjc9:1x7M7T:m69vumY_xqrI28mkg76R7zOD7aqt1zhXK4PncDRxcdM','2026-10-02 00:06:23.026865');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instruments_instrument`
--

DROP TABLE IF EXISTS `instruments_instrument`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `instruments_instrument` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `internal_code` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `designation` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `brand` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `serial_number` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `purchase_date` date DEFAULT NULL,
  `commissioning_date` date DEFAULT NULL,
  `status` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `location_id` bigint(20) DEFAULT NULL,
  `supplier_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `internal_code` (`internal_code`),
  KEY `instruments_instrume_location_id_b0c2e037_fk_instrumen` (`location_id`),
  KEY `instruments_instrume_supplier_id_dcec02a8_fk_suppliers` (`supplier_id`),
  CONSTRAINT `instruments_instrume_supplier_id_dcec02a8_fk_suppliers` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers_supplier` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instruments_instrument`
--

LOCK TABLES `instruments_instrument` WRITE;
/*!40000 ALTER TABLE `instruments_instrument` DISABLE KEYS */;
INSERT INTO `instruments_instrument` VALUES (2,'INST-002','UV-Visible Spectrophotometer','Shimadzu','UV-1900i','UV1900I-2026-002','2026-01-15','2026-02-01','in_service','','2026-09-16 23:30:32.062046','2026-09-16 23:30:32.062046',1,2);
/*!40000 ALTER TABLE `instruments_instrument` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instruments_localization`
--

DROP TABLE IF EXISTS `instruments_localization`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `instruments_localization` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `building` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `room` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instruments_localization`
--

LOCK TABLES `instruments_localization` WRITE;
/*!40000 ALTER TABLE `instruments_localization` DISABLE KEYS */;
INSERT INTO `instruments_localization` VALUES (1,'Chemistry Laboratory','Main Laboratory Building','204','','2026-09-16 22:01:38.511592');
/*!40000 ALTER TABLE `instruments_localization` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locations_location`
--

DROP TABLE IF EXISTS `locations_location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `locations_location` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `building` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `room` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locations_location`
--

LOCK TABLES `locations_location` WRITE;
/*!40000 ALTER TABLE `locations_location` DISABLE KEYS */;
INSERT INTO `locations_location` VALUES (1,'Analytical Laboratory','Main Laboratory Building','A-101','','2026-09-17 15:26:18.426779','2026-09-17 15:30:54.085972'),(3,'Chemical Storage Room','Main Laboratory Building','S-001','','2026-09-17 15:30:27.934945','2026-09-17 15:30:27.934945');
/*!40000 ALTER TABLE `locations_location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maintenance_maintenance`
--

DROP TABLE IF EXISTS `maintenance_maintenance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `maintenance_maintenance` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `maintenance_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `intervention_date` date NOT NULL,
  `responsible_technician` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `report` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `replaced_parts` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `next_maintenance_date` date DEFAULT NULL,
  `notes` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `report_file` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `instrument_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `maintenance_maintena_instrument_id_61a25dc2_fk_instrumen` (`instrument_id`),
  CONSTRAINT `maintenance_maintena_instrument_id_61a25dc2_fk_instrumen` FOREIGN KEY (`instrument_id`) REFERENCES `instruments_instrument` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maintenance_maintenance`
--

LOCK TABLES `maintenance_maintenance` WRITE;
/*!40000 ALTER TABLE `maintenance_maintenance` DISABLE KEYS */;
/*!40000 ALTER TABLE `maintenance_maintenance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suppliers_location`
--

DROP TABLE IF EXISTS `suppliers_location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `suppliers_location` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `building` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `room` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suppliers_location`
--

LOCK TABLES `suppliers_location` WRITE;
/*!40000 ALTER TABLE `suppliers_location` DISABLE KEYS */;
INSERT INTO `suppliers_location` VALUES (1,'Main Laboratory','Laboratory Building','Room 101');
/*!40000 ALTER TABLE `suppliers_location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suppliers_supplier`
--

DROP TABLE IF EXISTS `suppliers_supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `suppliers_supplier` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_person` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(254) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `website` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notes` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suppliers_supplier`
--

LOCK TABLES `suppliers_supplier` WRITE;
/*!40000 ALTER TABLE `suppliers_supplier` DISABLE KEYS */;
INSERT INTO `suppliers_supplier` VALUES (2,'ABC Calibration Services','Ahmed Khan','0300-1234567','info@example.com','','','','2026-09-16 22:00:37.622326','2026-09-16 22:00:37.622326'),(4,'Mettler Toledo Pakistan','Ahmed Khan','+92 21 34567890','sales.pk@mettler-example.com','Plot 12, Korangi Industrial Area, Karachi, Pakistan','https://www.mt.com','Supplier of analytical balances and laboratory weighing equipment','2026-09-16 23:59:46.973486','2026-09-16 23:59:46.973486');
/*!40000 ALTER TABLE `suppliers_supplier` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-09-18 23:37:17
