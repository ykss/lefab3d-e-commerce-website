-- MySQL dump 10.16  Distrib 10.1.38-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: zencart
-- ------------------------------------------------------
-- Server version	10.1.38-MariaDB-0ubuntu0.18.04.1

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
-- Table structure for table `address_book`
--

DROP TABLE IF EXISTS `address_book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `address_book` (
  `address_book_id` int(11) NOT NULL AUTO_INCREMENT,
  `customers_id` int(11) NOT NULL DEFAULT '0',
  `entry_gender` char(1) NOT NULL DEFAULT '',
  `entry_company` varchar(64) DEFAULT NULL,
  `entry_firstname` varchar(32) NOT NULL DEFAULT '',
  `entry_lastname` varchar(32) NOT NULL DEFAULT '',
  `entry_street_address` varchar(64) NOT NULL DEFAULT '',
  `entry_suburb` varchar(32) DEFAULT NULL,
  `entry_postcode` varchar(10) NOT NULL DEFAULT '',
  `entry_city` varchar(32) NOT NULL DEFAULT '',
  `entry_state` varchar(32) DEFAULT NULL,
  `entry_country_id` int(11) NOT NULL DEFAULT '0',
  `entry_zone_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`address_book_id`),
  KEY `idx_address_book_customers_id_zen` (`customers_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address_book`
--

LOCK TABLES `address_book` WRITE;
/*!40000 ALTER TABLE `address_book` DISABLE KEYS */;
INSERT INTO `address_book` VALUES (1,1,'','peoplespace','kyeongsang','yu','1691 kettering street','','92620','Irvine','',223,12),(2,2,'','','Joanne','Jo','16899 JamboreeRoad','Irvine','92614','Irvine','',223,12);
/*!40000 ALTER TABLE `address_book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `address_format`
--

DROP TABLE IF EXISTS `address_format`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `address_format` (
  `address_format_id` int(11) NOT NULL AUTO_INCREMENT,
  `address_format` varchar(128) NOT NULL DEFAULT '',
  `address_summary` varchar(48) NOT NULL DEFAULT '',
  PRIMARY KEY (`address_format_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address_format`
--

LOCK TABLES `address_format` WRITE;
/*!40000 ALTER TABLE `address_format` DISABLE KEYS */;
INSERT INTO `address_format` VALUES (1,'$firstname $lastname$cr$streets$cr$city, $postcode$cr$statecomma$country','$city / $country'),(2,'$firstname $lastname$cr$streets$cr$city, $state    $postcode$cr$country','$city, $state / $country'),(3,'$firstname $lastname$cr$streets$cr$city$cr$postcode - $statecomma$country','$state / $country'),(4,'$firstname $lastname$cr$streets$cr$city ($postcode)$cr$country','$postcode / $country'),(5,'$firstname $lastname$cr$streets$cr$postcode $city$cr$country','$city / $country'),(6,'$firstname $lastname$cr$streets$cr$city$cr$state$cr$postcode$cr$country','$postcode / $country'),(7,'$firstname $lastname$cr$streets$cr$city $state $postcode$cr$country','$city $state / $country');
/*!40000 ALTER TABLE `address_format` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_name` varchar(32) NOT NULL DEFAULT '',
  `admin_email` varchar(96) NOT NULL DEFAULT '',
  `admin_profile` int(11) NOT NULL DEFAULT '0',
  `admin_pass` varchar(255) NOT NULL DEFAULT '',
  `prev_pass1` varchar(255) NOT NULL DEFAULT '',
  `prev_pass2` varchar(255) NOT NULL DEFAULT '',
  `prev_pass3` varchar(255) NOT NULL DEFAULT '',
  `pwd_last_change_date` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `reset_token` varchar(255) NOT NULL DEFAULT '',
  `last_modified` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `last_login_date` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `last_login_ip` varchar(45) NOT NULL DEFAULT '',
  `failed_logins` smallint(4) unsigned NOT NULL DEFAULT '0',
  `lockout_expires` int(11) NOT NULL DEFAULT '0',
  `last_failed_attempt` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `last_failed_ip` varchar(45) NOT NULL DEFAULT '',
  PRIMARY KEY (`admin_id`),
  KEY `idx_admin_name_zen` (`admin_name`),
  KEY `idx_admin_email_zen` (`admin_email`),
  KEY `idx_admin_profile_zen` (`admin_profile`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'keongsang','yukyeongsang@gmail.com',1,'$2y$10$caoAP7k9yVC.ZJZ9887U..uZXQeFQUWYAx/BuM3ZqyDY51vFZg6C.','$2y$10$A/MYXdLS9pIBpfvQ0PYzquGB74N7yL3AbUA.ZR7HbBlgvlkSoty4S','','','2019-02-19 14:20:51','','2019-02-19 14:19:12','2019-02-20 10:51:00','::1',0,0,'2019-02-19 15:08:13','::1');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_activity_log`
--

DROP TABLE IF EXISTS `admin_activity_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_activity_log` (
  `log_id` bigint(15) NOT NULL AUTO_INCREMENT,
  `access_date` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `admin_id` int(11) NOT NULL DEFAULT '0',
  `page_accessed` varchar(80) NOT NULL DEFAULT '',
  `page_parameters` text,
  `ip_address` varchar(45) NOT NULL DEFAULT '',
  `flagged` tinyint(4) NOT NULL DEFAULT '0',
  `attention` varchar(255) NOT NULL DEFAULT '',
  `gzpost` mediumblob,
  `logmessage` mediumtext NOT NULL,
  `severity` varchar(9) NOT NULL DEFAULT 'info',
  PRIMARY KEY (`log_id`),
  KEY `idx_page_accessed_zen` (`page_accessed`),
  KEY `idx_access_date_zen` (`access_date`),
  KEY `idx_flagged_zen` (`flagged`),
  KEY `idx_ip_zen` (`ip_address`)
) ENGINE=MyISAM AUTO_INCREMENT=1067 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_activity_log`
--

LOCK TABLES `admin_activity_log` WRITE;
/*!40000 ALTER TABLE `admin_activity_log` DISABLE KEYS */;
INSERT INTO `admin_activity_log` VALUES (1,'2019-02-19 14:20:29',0,'Log found to be empty. Logging started.','','::1',0,'','','Log found to be empty. Logging started.','notice'),(2,'2019-02-19 14:20:29',0,'login.php ','camefrom=index.php','::1',0,'','��\0','Accessed page [login.php]','info'),(3,'2019-02-19 14:20:43',0,'login.php keongsang','camefrom=index.php','::1',0,'','�VJL.���S�RJ�707�04J412�LM57I436M�H4LN5K235N6W�QJL��̋�K�M��N��K/N�KJ�&�f�\0�!�Z\0','Accessed page [login.php] with action=do072812a4259ee74a635d8a1ce6b653c7. Review page_parameters and postdata for details.','info'),(4,'2019-02-19 14:20:50',0,'login.php ','','::1',0,'','�VJL.���S�R**607�04J412�LM57I436M�H4LN5K235N6W�QJL��̋�K�M�%��J);5?/�81/���4)7�(a�\0','Accessed page [login.php] with action=rs072812a4259ee74a635d8a1ce6b653c7. Review page_parameters and postdata for details.','info'),(5,'2019-02-19 14:20:51',0,'login.php ','','::1',1,'','�VJL.���S�R**607�04J412�LM57I436M�H4LN5K235N6W�QJL��̋�K�M�%��J);5?/�81/���4)7�(a�\0','Account password change saved.','warning'),(6,'2019-02-19 14:20:51',1,'index.php','','::1',0,'','��\0','Accessed page [index.php]','info'),(7,'2019-02-19 14:21:13',1,'index.php','action=update','::1',0,'','U��\n�0��s\Zo�<�?�Akv!Q$���*m��y3�y�D�140Q�]��ǇeeJ�#:���R�aҮ,�B�!#�6\\X9�:ބ�:YxN�^���_����>��D9+�q','Accessed page [index.php] with action=update. Review page_parameters and postdata for details.','info'),(8,'2019-02-19 14:21:13',1,'index.php','','::1',0,'','��\0','Accessed page [index.php]','info'),(9,'2019-02-19 14:23:28',1,'keepalive.php','','::1',0,'','��\0','Accessed page [keepalive.php]','info'),(10,'2019-02-19 14:23:31',1,'template_select.php','','::1',0,'','��\0','Accessed page [template_select.php]','info'),(11,'2019-02-19 14:25:23',1,'template_select.php','','::1',0,'','��\0','Accessed page [template_select.php]','info'),(12,'2019-02-19 14:25:23',1,'template_select.php','','::1',1,'','��\0','Deleted admin pages for page keys: configImageHandler4','warning'),(13,'2019-02-19 14:25:23',1,'template_select.php','','::1',1,'','��\0','Registered new admin menu page \\\"configImageHandler4\\\"','warning'),(14,'2019-02-19 14:25:23',1,'template_select.php','','::1',1,'','��\0','Registered new admin menu page \\\"configFacebookLikeButton\\\"','warning'),(15,'2019-02-19 14:25:23',1,'template_select.php','','::1',1,'','��\0','Registered new admin menu page \\\"configCSSJSLoader\\\"','warning'),(16,'2019-02-19 14:25:23',1,'template_select.php','','::1',1,'','��\0','Registered new admin menu page \\\"configPinitbutton\\\"','warning'),(17,'2019-02-19 14:25:23',1,'template_select.php','','::1',1,'','��\0','Registered new admin menu page \\\"configGooglePlusOne\\\"','warning'),(18,'2019-02-19 14:25:23',1,'template_select.php','','::1',1,'','��\0','Registered new admin menu page \\\"configNMXDiskCache\\\"','warning'),(19,'2019-02-19 14:25:43',1,'template_select.php','action=save','::1',0,'','�V*I�-�I,I�O�L�IQ�R*IL�IM,U�\0','Accessed page [template_select.php] with action=save. Review page_parameters and postdata for details.','info'),(20,'2019-02-19 14:27:44',1,'keepalive.php','','::1',0,'','��\0','Accessed page [keepalive.php]','info'),(21,'2019-02-19 14:27:45',1,'template_update.php','','::1',0,'','m��j�0�_E��\rD�I���`cO!�h���.���(}���\"�	��}�7���<*�?�c��ޘ�e�C��e�&%��H���2)��d��@�Xe8p�^�s�b�:2�&.Eq�\"���ܠ~�*�1�.��᲻/�9��H5ɨ���{©h���LF�W\r@�/��׶˻|��̨A��~g�=u��������t��9}٘0%^���k\'7�z��ɡ�!�W����ׅ��ڮY�\n��>��','Accessed page [template_update.php]','info'),(22,'2019-02-19 14:28:09',1,'template_update.php','','::1',0,'','m��j�0�_E��\rD�I��m˞B�&]�]J�Q����Ep	~���?���uTN�ۜO�}0)X�n�^��*MJ�_�&��o,eRz�ń,�\\.��p\"���|�:R�.�udM\\��REܗǹA}T\n(b����F{�eO_\Zst�j�QՋC©h���LF�w\r@�O���˻|��̨A��~e��t��|�����t��9}ۘ0%^���c\'7�z��ɡ�!�W����ׅ��ڮY�\n���/','Accessed page [template_update.php]','info'),(23,'2019-02-19 14:28:20',1,'template_update.php','','::1',0,'','m��j�0�_E��\rD�I��m˞B�&]�]J�Q����Ep	~���?���uTN�ۜO�}0)X�n�^��*MJ�_�&��o,eRz�ń,�\\.��p\"���|�:R�.�udM\\��REܗǹA}T\n(b����F{�eO_\Zst�j�QՋC©h���LF�w\r@�O���˻|��̨A��~e��t��|�����t��9}ۘ0%^���c\'7�z��ɡ�!�W����ׅ��ڮY�\n���/','Accessed page [template_update.php]','info'),(24,'2019-02-19 14:29:11',1,'template_update.php','','::1',0,'','m��j�0�_E��\rD�I��m˞B�&]�]J�Q����Ep	~���?���uTN�ۜO�}0)X�n�^��*MJ�_�&��o,eRz�ń,�\\.��p\"���|�:R�.�udM\\��REܗǹA}T\n(b����F{�eO_\Zst�j�QՋC©h���LF�w\r@�O���˻|��̨A��~e��t��|�����t��9}ۘ0%^���c\'7�z��ɡ�!�W����ׅ��ڮY�\n���/','Accessed page [template_update.php]','info'),(25,'2019-02-19 14:31:37',1,'keepalive.php','','::1',0,'','��\0','Accessed page [keepalive.php]','info'),(26,'2019-02-19 14:35:46',1,'template_select.php','action=save','::1',0,'','�V*I�-�I,I�O�L�IQ�R*IL�IM,U�\0','Accessed page [template_select.php] with action=save. Review page_parameters and postdata for details.','info'),(27,'2019-02-19 14:36:00',1,'template_update.php','','::1',0,'','m��j�0�_E��\rD�I��m˞B�&]�]J�Q����Ep	~���?���uTN�ۜO�}0)X�n�^��*MJ�_�&��o,eRz�ń,�\\.��p\"���|�:R�.�udM\\��REܗǹA}T\n(b����F{�eO_\Zst�j�QՋC©h���LF�w\r@�O���˻|��̨A��~e��t��|�����t��9}ۘ0%^���c\'7�z��ɡ�!�W����ׅ��ڮY�\n���/','Accessed page [template_update.php]','info'),(28,'2019-02-19 14:37:48',1,'keepalive.php','','::1',0,'','��\0','Accessed page [keepalive.php]','info'),(29,'2019-02-19 14:39:25',1,'template_update.php','','::1',0,'','m��j�0�_E��\rD�I��m˞B�&]�]J�Q����Ep	~���?���uTN�ۜO�}0)X�n�^��*MJ�_�&��o,eRz�ń,�\\.��p\"���|�:R�.�udM\\��REܗǹA}T\n(b����F{�eO_\Zst�j�QՋC©h���LF�w\r@�O���˻|��̨A��~e��t��|�����t��9}ۘ0%^���c\'7�z��ɡ�!�W����ׅ��ڮY�\n���/','Accessed page [template_update.php]','info'),(30,'2019-02-19 14:39:39',1,'template_select.php','','::1',0,'','��\0','Accessed page [template_select.php]','info'),(31,'2019-02-19 14:39:59',0,'login.php ','camefrom=keepalive.php','::1',0,'','��\0','Accessed page [login.php]','info'),(32,'2019-02-19 14:41:42',1,'keepalive.php','','::1',0,'','��\0','Accessed page [keepalive.php]','info'),(33,'2019-02-19 14:41:52',1,'template_update.php','','::1',0,'','m��j�0�_E��\rD�I��m˞B�&]�]J�Q����Ep	~���?���uTN�ۜO�}0)X�n�^��*MJ�_�&��o,eRz�ń,�\\.��p\"���|�:R�.�udM\\��REܗǹA}T\n(b����F{�eO_\Zst�j�QՋC©h���LF�w\r@�O���˻|��̨A��~e��t��|�����t��9}ۘ0%^���c\'7�z��ɡ�!�W����ׅ��ڮY�\n���/','Accessed page [template_update.php]','info'),(34,'2019-02-19 14:42:42',0,'login.php ','camefrom=keepalive.php','::1',0,'','��\0','Accessed page [login.php]','info'),(35,'2019-02-19 14:43:10',1,'template_update.php','','::1',0,'','m��j�0�_E��\rD�I��m˞B�&]�]J�Q����Ep	~���?���uTN�ۜO�}0)X�n�^��*MJ�_�&��o,eRz�ń,�\\.��p\"���|�:R�.�udM\\��REܗǹA}T\n(b����F{�eO_\Zst�j�QՋC©h���LF�w\r@�O���˻|��̨A��~e��t��|�����t��9}ۘ0%^���c\'7�z��ɡ�!�W����ׅ��ڮY�\n���/','Accessed page [template_update.php]','info'),(36,'2019-02-19 14:45:18',1,'keepalive.php','','::1',0,'','��\0','Accessed page [keepalive.php]','info'),(37,'2019-02-19 14:45:22',1,'template_update.php','','::1',0,'','m��j�0�_E��\rD�I��m˞B�&]�]J�Q����Ep	~���?���uTN�ۜO�}0)X�n�^��*MJ�_�&��o,eRz�ń,�\\.��p\"���|�:R�.�udM\\��REܗǹA}T\n(b����F{�eO_\Zst�j�QՋC©h���LF�w\r@�O���˻|��̨A��~e��t��|�����t��9}ۘ0%^���c\'7�z��ɡ�!�W����ׅ��ڮY�\n���/','Accessed page [template_update.php]','info'),(38,'2019-02-19 14:45:35',1,'template_update.php','','::1',0,'','m��j�0�_E��\rD�I��m˞B�&]�]J�Q����Ep	~���?���uTN�ۜO�}0)X�n�^��*MJ�_�&��o,eRz�ń,�\\.��p\"���|�:R�.�udM\\��REܗǹA}T\n(b����F{�eO_\Zst�j�QՋC©h���LF�w\r@�O���˻|��̨A��~e��t��|�����t��9}ۘ0%^���c\'7�z��ɡ�!�W����ׅ��ڮY�\n���/','Accessed page [template_update.php]','info'),(39,'2019-02-19 14:48:41',1,'keepalive.php','','::1',0,'','��\0','Accessed page [keepalive.php]','info'),(40,'2019-02-19 14:51:34',1,'keepalive.php','','::1',0,'','��\0','Accessed page [keepalive.php]','info'),(41,'2019-02-19 14:52:20',1,'template_update.php','','::1',0,'','m��j�0�_E��\rD�I��m˞B�&]�]J�Q����Ep	~���?���uTN�ۜO�}0)X�n�^��*MJ�_�&��o,eRz�ń,�\\.��p\"���|�:R�.�udM\\��REܗǹA}T\n(b����F{�eO_\Zst�j�QՋC©h���LF�w\r@�O���˻|��̨A��~e��t��|�����t��9}ۘ0%^���c\'7�z��ɡ�!�W����ׅ��ڮY�\n���/','Accessed page [template_update.php]','info'),(42,'2019-02-19 14:52:41',1,'banner_manager.php','','::1',0,'','��\0','Accessed page [banner_manager.php]','info'),(43,'2019-02-19 14:52:48',1,'banner_manager.php','page=1&bID=12','::1',0,'','��\0','Accessed page [banner_manager.php]','info'),(44,'2019-02-19 14:52:49',1,'banner_manager.php','page=1&bID=12&action=new','::1',0,'','��\0','Accessed page [banner_manager.php] with action=new. Review page_parameters and postdata for details.','info'),(45,'2019-02-19 14:52:53',1,'banner_manager.php','page=1&action=upd','::1',0,'','��OO�0ſJTq��\r��ƍ\\�8 U���m\"R;�]:	��I׍��G����_���-�D��]��d��\"c1�r���� S\0�������|,�f�\'P�xH�ڨ�v�ic�\Z�:R�`J�Mr}Z2r��Ԡ=��$��5�W�J�����l�j�g�v��6�6ơɽd�BpX;�(�VU�\rs2�M�M*Yv	��]P�{�O�X*㽢�nȊ^ӻ�]�T��:TbA=����G\ZCAX~k�}��G���G�6\"����;��L6�aJ�Q=P�OS>5��k3Eѻ��`�F@sa�l=����mpX���[⚐v��d�\0','Accessed page [banner_manager.php] with action=upd. Review page_parameters and postdata for details.','info'),(46,'2019-02-19 14:52:53',1,'banner_manager.php','page=1&bID=12','::1',0,'','��\0','Accessed page [banner_manager.php]','info'),(47,'2019-02-19 14:53:18',1,'category_product_listing.php','','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(48,'2019-02-19 14:53:19',1,'categories.php','action=new_category','::1',0,'','��\0','Accessed page [categories.php] with action=new_category. Review page_parameters and postdata for details.','info'),(49,'2019-02-19 14:53:22',1,'categories.php','action=new_category','::1',0,'','��\0','Accessed page [categories.php] with action=new_category. Review page_parameters and postdata for details.','info'),(50,'2019-02-19 14:53:23',1,'category_product_listing.php','','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(51,'2019-02-19 14:53:26',1,'categories.php','action=new_category','::1',0,'','��\0','Accessed page [categories.php] with action=new_category. Review page_parameters and postdata for details.','info'),(52,'2019-02-19 14:54:13',1,'categories.php','action=new_category','::1',0,'','��\0','Accessed page [categories.php] with action=new_category. Review page_parameters and postdata for details.','info'),(53,'2019-02-19 14:54:14',1,'category_product_listing.php','','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(54,'2019-02-19 14:54:15',1,'configuration.php','gID=1','::1',0,'','��\0','Accessed page [configuration.php]','info'),(55,'2019-02-19 14:54:28',1,'configuration.php','gID=1&cID=13&action=edit','::1',0,'','��\0','Accessed page [configuration.php] with action=edit. Review page_parameters and postdata for details.','info'),(56,'2019-02-19 14:54:56',1,'configuration.php','gID=1&cID=13&action=save','::1',0,'','�VJ��K�L/-J,��ϋ/K�)MU�R�IuKLR0v�)���N-)I-��KW.)JM-��;�(mCMKK]33]CCS%��Ҥ�̒�� �x?G_�xG� ��`��J�\0','Accessed page [configuration.php] with action=save. Review page_parameters and postdata for details.','info'),(57,'2019-02-19 14:54:56',1,'configuration.php','gID=1&cID=13&action=save','::1',1,'','�VJ��K�L/-J,��ϋ/K�)MU�R�IuKLR0v�)���N-)I-��KW.)JM-��;�(mCMKK]33]CCS%��Ҥ�̒�� �x?G_�xG� ��`��J�\0','Configuration setting changed for STORE_NAME_ADDRESS: leFab 3D\\r\nKettering Street\\r\nUSA\\r\n+1) 949-664-1015','warning'),(58,'2019-02-19 14:54:56',1,'configuration.php','gID=1&cID=13','::1',0,'','��\0','Accessed page [configuration.php]','info'),(59,'2019-02-19 14:55:12',1,'configuration.php','gID=1&cID=13&action=edit','::1',0,'','��\0','Accessed page [configuration.php] with action=edit. Review page_parameters and postdata for details.','info'),(60,'2019-02-19 14:55:28',1,'configuration.php','gID=1&cID=13&action=save','::1',0,'','�VJ��K�L/-J,��ϋ/K�)MU�R�IuKLR0v�)��34�4T�N-)I-��KW.)JM-�Q�,*��K�Qpv)\n\rSچ�\n�&��ff&����J:JťI��%�!�A��~����..A���@[�j','Accessed page [configuration.php] with action=save. Review page_parameters and postdata for details.','info'),(61,'2019-02-19 14:55:28',1,'configuration.php','gID=1&cID=13&action=save','::1',1,'','�VJ��K�L/-J,��ϋ/K�)MU�R�IuKLR0v�)��34�4T�N-)I-��KW.)JM-�Q�,*��K�Qpv)\n\rSچ�\n�&��ff&����J:JťI��%�!�A��~����..A���@[�j','Configuration setting changed for STORE_NAME_ADDRESS: leFab 3D\\r\n1691 Kettering Street, Irvine, CA\\r\nUSA\\r\n+1) 949-664-1015','warning'),(62,'2019-02-19 14:55:28',1,'configuration.php','gID=1&cID=13','::1',0,'','��\0','Accessed page [configuration.php]','info'),(63,'2019-02-19 14:55:30',1,'configuration.php','gID=1&cID=5&action=edit','::1',0,'','��\0','Accessed page [configuration.php] with action=edit. Review page_parameters and postdata for details.','info'),(64,'2019-02-19 14:55:31',1,'configuration.php','gID=1&cID=3&action=edit','::1',0,'','��\0','Accessed page [configuration.php] with action=edit. Review page_parameters and postdata for details.','info'),(65,'2019-02-19 14:55:42',1,'configuration.php','gID=1&cID=3&action=save','::1',0,'','�VJ��K�L/-J,��ϋ/K�)MU�R�6�T�4��533�5404U�Q*.M��,	�r�q�q\r���s�w\r	v\r\n�tvjS�\0','Accessed page [configuration.php] with action=save. Review page_parameters and postdata for details.','info'),(66,'2019-02-19 14:55:42',1,'configuration.php','gID=1&cID=3&action=save','::1',1,'','�VJ��K�L/-J,��ϋ/K�)MU�R�6�T�4��533�5404U�Q*.M��,	�r�q�q\r���s�w\r	v\r\n�tvjS�\0','Configuration setting changed for STORE_TELEPHONE_CUSTSERVICE: +1) 949-664-1015','warning'),(67,'2019-02-19 14:55:42',1,'configuration.php','gID=1&cID=3','::1',0,'','��\0','Accessed page [configuration.php]','info'),(68,'2019-02-19 14:55:49',1,'configuration.php','gID=2','::1',0,'','��\0','Accessed page [configuration.php]','info'),(69,'2019-02-19 14:55:52',1,'configuration.php','gID=4','::1',0,'','��\0','Accessed page [configuration.php]','info'),(70,'2019-02-19 14:55:54',1,'configuration.php','gID=8','::1',0,'','��\0','Accessed page [configuration.php]','info'),(71,'2019-02-19 14:56:03',1,'configuration.php','gID=31','::1',0,'','��\0','Accessed page [configuration.php]','info'),(72,'2019-02-19 14:56:05',1,'category_product_listing.php','','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(73,'2019-02-19 14:56:06',1,'categories.php','action=new_category','::1',0,'','��\0','Accessed page [categories.php] with action=new_category. Review page_parameters and postdata for details.','info'),(74,'2019-02-19 14:56:13',0,'login.php ','camefrom=keepalive.php','::1',0,'','��\0','Accessed page [login.php]','info'),(75,'2019-02-19 14:56:15',0,'login.php ','camefrom=category_product_listing.php','::1',0,'','��\0','Accessed page [login.php]','info'),(76,'2019-02-19 14:56:20',0,'login.php keongsang','camefrom=category_product_listing.php','::1',0,'','�VJL.���S�RJ�O���446NJ4�4K54M5JM253II2N1�0701T�QJL��̋�K�M��N��K/N�KJ�&�f�\0�!�Z\0','Accessed page [login.php] with action=doa989133ba196e15e2eb564db3d587041. Review page_parameters and postdata for details.','info'),(77,'2019-02-19 14:56:20',1,'category_product_listing.php','','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(78,'2019-02-19 14:56:24',1,'template_select.php','','::1',0,'','��\0','Accessed page [template_select.php]','info'),(79,'2019-02-19 14:58:40',1,'index.php','','::1',0,'','��\0','Accessed page [index.php]','info'),(80,'2019-02-19 14:58:45',1,'product_types.php','','::1',0,'','��\0','Accessed page [product_types.php]','info'),(81,'2019-02-19 14:58:46',1,'category_product_listing.php','','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(82,'2019-02-19 14:58:58',1,'categories.php','action=new_category','::1',0,'','��\0','Accessed page [categories.php] with action=new_category. Review page_parameters and postdata for details.','info'),(83,'2019-02-19 14:59:03',1,'category_product_listing.php','','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(84,'2019-02-19 14:59:19',1,'layout_controller.php','','::1',0,'','��\0','Accessed page [layout_controller.php]','info'),(85,'2019-02-19 14:59:23',1,'template_select.php','','::1',0,'','��\0','Accessed page [template_select.php]','info'),(86,'2019-02-19 14:59:24',1,'banner_manager.php','','::1',0,'','��\0','Accessed page [banner_manager.php]','info'),(87,'2019-02-19 14:59:27',1,'category_product_listing.php','','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(88,'2019-02-19 14:59:28',1,'product.php','action=new_product','::1',0,'','�V*(�O)M.�/�,HU�R2T�QJH,�\0�������< ;/�<�T�\0','Accessed page [product.php] with action=new_product. Review page_parameters and postdata for details.','info'),(89,'2019-02-19 15:01:03',1,'product.php','cPath=0&action=new_product_preview','::1',0,'','�S�n�0��s$��v+���]�-�!��KQN� �^�y�\Z�b�;މ���hs+F��zU?�� ��ȄɐՒV.�d,�6�pk[>,�\rG?G�L-�Yy�$ 9]��ީb@\Zwb\\/W���z�~����V2#��6�ז���V�W��iCJ}��%U��YN�-8��~k�рS��0A`oZ�\"gU�O3��tS*j�dp�:p;��M�R�S��R�e4M�?p�;CRHd��{\n�!`_0�#r y��i��%S���pM�kK��o�.<X�N�������J�r�/�\\����}�ŬQy��\\$��C�돞�F���〼c�Orƞ^$�y2��pwZwH�V�E��8Z,ش�N6^a�Z\0','Accessed page [product.php] with action=new_product_preview. Review page_parameters and postdata for details.','info'),(90,'2019-02-19 15:01:12',1,'product.php','cPath=0&action=insert_product','::1',0,'','�R�N�@��(g*��ܐ�\0�WN�M-�#x�m#Ŀ�`�\n)�xƞ�w>ڑ�ͽ�Fl��U{�zH�lz\"&CV!E��d,�>�pm[�͆�/#S�&EV�K�����L5c`�sG��r��X���q��%3r��PRX�<V{p�Ok�t��.K������YiU����}�)U؎X2���=L\'�&mi)��w�L7���!)%����c��R��ȁ䶎��[h9�G����ȸ����<���_~�n���w�{&�R��=fJ�=Ұ�*z\Z�ӞU���Y;ow����\'%�Wj�}&n^3ӆt���9�z�Q(��mK��o�.<Xl��㹻�+��ܿ4�� ����2�W�z��/','Accessed page [product.php] with action=insert_product. Review page_parameters and postdata for details.','info'),(91,'2019-02-19 15:01:12',1,'product.php','cPath=0&action=insert_product','::1',0,'','�R�N�@��(g*��ܐ�\0�WN�M-�#x�m#Ŀ�`�\n)�xƞ�w>ڑ�ͽ�Fl��U{�zH�lz\"&CV!E��d,�>�pm[�͆�/#S�&EV�K�����L5c`�sG��r��X���q��%3r��PRX�<V{p�Ok�t��.K������YiU����}�)U؎X2���=L\'�&mi)��w�L7���!)%����c��R��ȁ䶎��[h9�G����ȸ����<���_~�n���w�{&�R��=fJ�=Ұ�*z\Z�ӞU���Y;ow����\'%�Wj�}&n^3ӆt���9�z�Q(��mK��o�.<Xl��㹻�+��ܿ4�� ����2�W�z��/','New product 1 added via admin console.','info'),(92,'2019-02-19 15:01:12',1,'category_product_listing.php','cPath=0&pID=1','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(93,'2019-02-19 15:01:19',1,'category_product_listing.php','','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(94,'2019-02-19 15:01:25',1,'category_product_listing.php','reset_categories_products_sort_order=1&action=set_categories_products_sort_order','::1',0,'','��\0','Accessed page [category_product_listing.php] with action=set_categories_products_sort_order. Review page_parameters and postdata for details.','info'),(95,'2019-02-19 15:01:25',1,'category_product_listing.php','','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(96,'2019-02-19 15:01:26',1,'category_product_listing.php','reset_categories_products_sort_order=0&action=set_categories_products_sort_order','::1',0,'','��\0','Accessed page [category_product_listing.php] with action=set_categories_products_sort_order. Review page_parameters and postdata for details.','info'),(97,'2019-02-19 15:01:26',1,'category_product_listing.php','','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(98,'2019-02-19 15:01:35',1,'category_product_listing.php','','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(99,'2019-02-19 15:02:32',1,'index.php','','::1',0,'','��\0','Accessed page [index.php]','info'),(100,'2019-02-19 15:02:35',1,'product_types.php','','::1',0,'','��\0','Accessed page [product_types.php]','info'),(101,'2019-02-19 15:02:37',1,'product_types.php','page=1&ptID=2','::1',0,'','��\0','Accessed page [product_types.php]','info'),(102,'2019-02-19 15:02:41',1,'category_product_listing.php','','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(103,'2019-02-19 15:02:46',1,'category_product_listing.php','product_type=1&pID=1&action=move_product&page=1','::1',0,'','��\0','Accessed page [category_product_listing.php] with action=move_product. Review page_parameters and postdata for details.','info'),(104,'2019-02-19 15:02:47',1,'category_product_listing.php','action=move_product_confirm&page=1','::1',0,'','�V*(�O)M.)��LQ�R2T�Q��/K�/ɏON,IM�/���(�\0','Accessed page [category_product_listing.php] with action=move_product_confirm. Review page_parameters and postdata for details.','info'),(105,'2019-02-19 15:02:47',1,'category_product_listing.php','cPath=0&pID=1&page=1','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(106,'2019-02-19 15:02:50',1,'category_product_listing.php','cPath=0&product_type=1&pID=1&action=delete_product&page=1','::1',0,'','��\0','Accessed page [category_product_listing.php] with action=delete_product. Review page_parameters and postdata for details.','info'),(107,'2019-02-19 15:02:52',1,'category_product_listing.php','action=delete_product_confirm&product_type=1&cPath=0&page=1','::1',0,'','�V*(�O)M.)��LQ�R2Tҁ��\'\'����e�+YE+(��\0','Accessed page [category_product_listing.php] with action=delete_product_confirm. Review page_parameters and postdata for details.','info'),(108,'2019-02-19 15:02:52',1,'category_product_listing.php','action=delete_product_confirm&product_type=1&cPath=0&page=1','::1',1,'','�V*(�O)M.)��LQ�R2Tҁ��\'\'����e�+YE+(��\0','Deleted product 1 from database via admin console.','warning'),(109,'2019-02-19 15:02:52',1,'category_product_listing.php','cPath=0','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(110,'2019-02-19 15:02:53',1,'categories.php','cPath=0&action=new_category','::1',0,'','��\0','Accessed page [categories.php] with action=new_category. Review page_parameters and postdata for details.','info'),(111,'2019-02-19 15:02:58',1,'categories.php','','::1',0,'','��\0','Accessed page [categories.php]','info'),(112,'2019-02-19 15:03:05',1,'index.php','','::1',0,'','��\0','Accessed page [index.php]','info'),(113,'2019-02-19 15:05:31',1,'keepalive.php','','::1',0,'','��\0','Accessed page [keepalive.php]','info'),(114,'2019-02-19 15:05:33',1,'modules.php','set=payment','::1',0,'','��\0','Accessed page [modules.php]','info'),(115,'2019-02-19 15:05:41',1,'image_handler.php','','::1',0,'','��\0','Accessed page [image_handler.php]','info'),(116,'2019-02-19 15:05:43',1,'image_handler.php','page=manager','::1',0,'','��\0','Accessed page [image_handler.php]','info'),(117,'2019-02-19 15:05:48',1,'sqlpatch.php','','::1',0,'','��\0','Accessed page [sqlpatch.php]','info'),(118,'2019-02-19 15:05:50',1,'define_pages_editor.php','','::1',0,'','��\0','Accessed page [define_pages_editor.php]','info'),(119,'2019-02-19 15:05:51',1,'developers_tool_kit.php','','::1',0,'','��\0','Accessed page [developers_tool_kit.php]','info'),(120,'2019-02-19 15:05:53',1,'whos_online.php','','::1',0,'','��\0','Accessed page [whos_online.php]','info'),(121,'2019-02-19 15:05:55',1,'layout_controller.php','','::1',0,'','��\0','Accessed page [layout_controller.php]','info'),(122,'2019-02-19 15:05:57',1,'layout_controller.php','action=reset_defaults','::1',0,'','�VJL.���S�R*J-N-�OIMK,�))V�\0','Accessed page [layout_controller.php] with action=reset_defaults. Review page_parameters and postdata for details.','info'),(123,'2019-02-19 15:05:57',1,'layout_controller.php','','::1',0,'','��\0','Accessed page [layout_controller.php]','info'),(124,'2019-02-19 15:05:59',1,'category_product_listing.php','','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(125,'2019-02-19 15:06:01',1,'categories.php','action=new_category','::1',0,'','��\0','Accessed page [categories.php] with action=new_category. Review page_parameters and postdata for details.','info'),(126,'2019-02-19 15:06:03',1,'category_product_listing.php','','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(127,'2019-02-19 15:07:27',1,'template_select.php','','::1',0,'','��\0','Accessed page [template_select.php]','info'),(128,'2019-02-19 15:07:49',1,'template_update.php','','::1',0,'','m��j�0�_E��\rD�I��m˞B�&]�]J�Q����Ep	~���?���uTN�ۜO�}0)X�n�^��*MJ�_�&��o,eRz�ń,�\\.��p\"���|�:R�.�udM\\��REܗǹA}T\n(b����F{�eO_\Zst�j�QՋC©h���LF�w\r@�O���˻|��̨A��~e��t��|�����t��9}ۘ0%^���c\'7�z��ɡ�!�W����ׅ��ڮY�\n���/','Accessed page [template_update.php]','info'),(129,'2019-02-19 15:08:00',1,'index.php','','::1',0,'','��\0','Accessed page [index.php]','info'),(130,'2019-02-19 15:08:09',1,'logoff.php','','::1',0,'','��\0','Accessed page [logoff.php]','info'),(131,'2019-02-19 15:08:09',0,'login.php ','','::1',0,'','��\0','Accessed page [login.php]','info'),(132,'2019-02-19 15:08:13',0,'login.php keongsang','','::1',0,'','�VJL.���S�RJ�OL13J5764JL6ILM62��041N3740HNM6LR�QJL��̋�K�M��N��K/N�KJ�&�f�\0�!�Z\0','Accessed page [login.php] with action=doad62e7312ac4aec2088143f7100cec1b. Review page_parameters and postdata for details.','info'),(133,'2019-02-19 15:08:13',0,'login.php keongsang','','::1',1,'','�VJL.���S�RJ�OL13J5764JL6ILM62��041N3740HNM6LR�QJL��̋�K�M��N��K/N�KJ�&�f�\0�!�Z\0','Failed admin login attempt:  keongsang','warning'),(134,'2019-02-19 15:08:23',0,'login.php keongsang','','::1',0,'','�VJL.���S�RJ�OL13J5764JL6ILM62��041N3740HNM6LR�QJL��̋�K�M��N��K/N�KJ�&�f�\0�!�Z\0','Accessed page [login.php] with action=doad62e7312ac4aec2088143f7100cec1b. Review page_parameters and postdata for details.','info'),(135,'2019-02-19 15:08:23',1,'index.php','','::1',0,'','��\0','Accessed page [index.php]','info'),(136,'2019-02-19 15:08:27',1,'product_types.php','','::1',0,'','��\0','Accessed page [product_types.php]','info'),(137,'2019-02-19 15:08:30',1,'category_product_listing.php','','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(138,'2019-02-19 15:08:32',1,'categories.php','action=new_category','::1',0,'','��\0','Accessed page [categories.php] with action=new_category. Review page_parameters and postdata for details.','info'),(139,'2019-02-19 15:08:44',1,'categories.php','action=new_category','::1',0,'','��\0','Accessed page [categories.php] with action=new_category. Review page_parameters and postdata for details.','info'),(140,'2019-02-19 15:10:33',1,'category_product_listing.php','','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(141,'2019-02-19 15:12:38',1,'keepalive.php','','::1',0,'','��\0','Accessed page [keepalive.php]','info'),(142,'2019-02-19 15:15:11',1,'keepalive.php','','::1',0,'','��\0','Accessed page [keepalive.php]','info'),(143,'2019-02-19 15:15:12',1,'categories.php','action=new_category','::1',0,'','��\0','Accessed page [categories.php] with action=new_category. Review page_parameters and postdata for details.','info'),(144,'2019-02-19 15:15:30',1,'index.php','','::1',0,'','��\0','Accessed page [index.php]','info'),(145,'2019-02-19 15:15:37',1,'server_info.php','','::1',0,'','��\0','Accessed page [server_info.php]','info'),(146,'2019-02-19 15:15:42',1,'admin_account.php','','::1',0,'','��\0','Accessed page [admin_account.php]','info'),(147,'2019-02-19 15:15:47',1,'stats_customers.php','','::1',0,'','��\0','Accessed page [stats_customers.php]','info'),(148,'2019-02-19 15:15:49',1,'countries.php','','::1',0,'','��\0','Accessed page [countries.php]','info'),(149,'2019-02-19 15:15:50',1,'customers.php','','::1',0,'','��\0','Accessed page [customers.php]','info'),(150,'2019-02-19 15:15:51',1,'modules.php','set=payment','::1',0,'','��\0','Accessed page [modules.php]','info'),(151,'2019-02-19 15:15:52',1,'category_product_listing.php','','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(152,'2019-02-19 15:15:54',1,'categories.php','action=new_category','::1',0,'','��\0','Accessed page [categories.php] with action=new_category. Review page_parameters and postdata for details.','info'),(153,'2019-02-19 15:15:57',1,'category_product_listing.php','','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(154,'2019-02-19 15:15:59',1,'product.php','action=new_product','::1',0,'','�V*(�O)M.�/�,HU�R2T�QJH,�\0�������< ;/�<�T�\0','Accessed page [product.php] with action=new_product. Review page_parameters and postdata for details.','info'),(155,'2019-02-19 15:16:00',1,'index.php','','::1',0,'','��\0','Accessed page [index.php]','info'),(156,'2019-02-19 15:17:36',1,'banner_manager.php','','::1',0,'','��\0','Accessed page [banner_manager.php]','info'),(157,'2019-02-19 15:17:39',1,'banner_manager.php','page=1&bID=8','::1',0,'','��\0','Accessed page [banner_manager.php]','info'),(158,'2019-02-19 15:17:43',1,'banner_manager.php','page=1&bID=8&action=new','::1',0,'','��\0','Accessed page [banner_manager.php] with action=new. Review page_parameters and postdata for details.','info'),(159,'2019-02-19 15:17:47',1,'banner_manager.php','page=1&action=upd','::1',0,'','m��N� EY�՝1�_�Ƅ�`���3������k��s� �_]JPɢ׏�A_kb���N5H6�jWL>�M�����d��^�R���~=Km��j^���g(n��[��}��b8���<�����N���s���{�\'Eu|2�\'@�;�LGo�p[�d�r��$�����F\Z=���XM7�ex���BR,e���7]d�ܰ{��6W�<�,���MJ	�S�\nd����Bp.��\r��','Accessed page [banner_manager.php] with action=upd. Review page_parameters and postdata for details.','info'),(160,'2019-02-19 15:17:47',1,'banner_manager.php','page=1&bID=8','::1',0,'','��\0','Accessed page [banner_manager.php]','info'),(161,'2019-02-19 15:17:50',1,'banner_manager.php','page=1&bID=9','::1',0,'','��\0','Accessed page [banner_manager.php]','info'),(162,'2019-02-19 15:17:51',1,'banner_manager.php','page=1&bID=9&action=new','::1',0,'','��\0','Accessed page [banner_manager.php] with action=new. Review page_parameters and postdata for details.','info'),(163,'2019-02-19 15:17:56',1,'banner_manager.php','page=1&action=upd','::1',0,'','m��N!EY��KM�{��Ƅ� TzHh TaOb�w�a&�7<ν�xԗ�01BA�|�O�V\"�ț�\\Ք!��^}tim��V�\Z1� y\n��=�\":��zji�\r�K���1-���k�v�޳����:$k��2�U��Mpjx��,��%�T�Ŧ���}����b/l0���;.��4:��Sت�i��[-Q���Ձ>R�^�fTC�x����\"�B:��g4�#�\Z�5L0�S�P7�?�J��yB�b���','Accessed page [banner_manager.php] with action=upd. Review page_parameters and postdata for details.','info'),(164,'2019-02-19 15:17:56',1,'banner_manager.php','page=1&bID=9','::1',0,'','��\0','Accessed page [banner_manager.php]','info'),(165,'2019-02-19 15:17:59',1,'banner_manager.php','page=1&bID=10','::1',0,'','��\0','Accessed page [banner_manager.php]','info'),(166,'2019-02-19 15:18:01',1,'banner_manager.php','page=1&bID=10&action=new','::1',0,'','��\0','Accessed page [banner_manager.php] with action=new. Review page_parameters and postdata for details.','info'),(167,'2019-02-19 15:18:11',1,'banner_manager.php','page=1&action=upd','::1',0,'','m��N� �_Y��nM��GpaBB�L�$��&�ww��7��\r�|�~2_�Ä\0�4Z�,OO�^R1�w���1A��`�qi�i/M��`���=�,6(6�멹�v��X�)ΐ��h[��}��b8�W�8\Z��PLvP�*S��.�6�����E�K�Tw���<WxL�))�/��b�����y%����Aa��>\ro�c�	V��#�W]\Zx�ذ{�\\t��u\n��4N`��6(�քH7q�ٍ��x#�a��','Accessed page [banner_manager.php] with action=upd. Review page_parameters and postdata for details.','info'),(168,'2019-02-19 15:18:11',1,'banner_manager.php','page=1&bID=10','::1',0,'','��\0','Accessed page [banner_manager.php]','info'),(169,'2019-02-19 15:18:29',1,'banner_manager.php','page=1&bID=11','::1',0,'','��\0','Accessed page [banner_manager.php]','info'),(170,'2019-02-19 15:18:32',1,'banner_manager.php','page=1&bID=11&action=new','::1',0,'','��\0','Accessed page [banner_manager.php] with action=new. Review page_parameters and postdata for details.','info'),(171,'2019-02-19 15:18:41',1,'banner_manager.php','page=1&action=upd','::1',0,'','m�MN�0��Re\r�٢�{ E�Bc���ء#��}�)#Ja�{�َ��m�PȠS/�tR��r�v��]N�����K�9\Z\"���A�[���`��O--�sI5ZR�lg ����g� ^��d��2�V�0�0���U�[�t�m��T�S�Op��[��g�:�YRL�I�e��V���㠈U��{���*�\n�T��Y\'CM���L\'��i���;��� L�n\r.W','Accessed page [banner_manager.php] with action=upd. Review page_parameters and postdata for details.','info'),(172,'2019-02-19 15:18:41',1,'banner_manager.php','page=1&bID=11','::1',0,'','��\0','Accessed page [banner_manager.php]','info'),(173,'2019-02-19 15:18:55',1,'banner_manager.php','page=1&bID=1','::1',0,'','��\0','Accessed page [banner_manager.php]','info'),(174,'2019-02-19 15:18:57',1,'banner_manager.php','page=1&bID=1&action=new','::1',0,'','��\0','Accessed page [banner_manager.php] with action=new. Review page_parameters and postdata for details.','info'),(175,'2019-02-19 15:19:05',1,'banner_manager.php','page=1&action=upd','::1',0,'','e��j�0E��yM�1�����^�%�6��KK��2IK�=�{�k�E�j�1X���U�(b����pWCD3d�Mȴx�\"��l١���/�x%M���HǶn�suF���Vua\\Y��(�okp�9C��_��Ֆu��B�K�B�Z2J�>��@�V����\Z��#?xt�x�`\nr-$�i)�hF�n@39,���)ڄE���ĎQ��ύ_o','Accessed page [banner_manager.php] with action=upd. Review page_parameters and postdata for details.','info'),(176,'2019-02-19 15:19:05',1,'banner_manager.php','page=1&bID=1','::1',0,'','��\0','Accessed page [banner_manager.php]','info'),(177,'2019-02-19 15:19:07',1,'banner_manager.php','page=1&bID=6','::1',0,'','��\0','Accessed page [banner_manager.php]','info'),(178,'2019-02-19 15:19:08',1,'banner_manager.php','page=1&bID=6&action=new','::1',0,'','��\0','Accessed page [banner_manager.php] with action=new. Review page_parameters and postdata for details.','info'),(179,'2019-02-19 15:19:11',1,'banner_manager.php','page=1&action=upd','::1',1,'ALERT: Please review for possible XSS activity: [&lt;script]','}RMO�0�+��n��pAblEc\\�!!A�(4f��&���⿓���&�����y���Hc\0��*�F��Y�HR�|q�=k0�@\':m��}1��p�:IS{Öi@��%Q�<�Y�u���𲴰�@�F�6^��$�=���X2p�Z�AT���oI\\2%Օ �x�\n�\r峓$	��w���3Gnco����,\\#�Av�)�J��l�g<��fT�{/�L_+kq��E�[�ƧW?�x�R�hk0�v�	؈o�h�#�9,汯|�?-�\r�y�&������g��9�zux�j�\'�N���E�nq�$�(A���b�M��d?�=���N[�o��7','Accessed page [banner_manager.php] with action=upd. Review page_parameters and postdata for details.','notice'),(180,'2019-02-19 15:19:11',1,'banner_manager.php','page=1&bID=6','::1',0,'','��\0','Accessed page [banner_manager.php]','info'),(181,'2019-02-19 15:19:20',1,'banner_manager.php','page=1&bID=14','::1',0,'','��\0','Accessed page [banner_manager.php]','info'),(182,'2019-02-19 15:19:22',1,'banner_manager.php','page=1&bID=14&action=new','::1',0,'','��\0','Accessed page [banner_manager.php] with action=new. Review page_parameters and postdata for details.','info'),(183,'2019-02-19 15:19:46',1,'banner_manager.php','page=1&action=upd','::1',0,'','m��J�0F_%���V��7�^	B���\r������ݝX��U�s��#������w��m��4��B���1A4���p���!\n7�=��%������\\�6`�X��7D��R���m�f��v�l��m����`.�l<��x|��T#�\n1�����������E�͡;4�}״�����a��d�`v���;�2:O�J���J \\��@��5ޕ�9�C#}-��','Accessed page [banner_manager.php] with action=upd. Review page_parameters and postdata for details.','info'),(184,'2019-02-19 15:19:46',1,'banner_manager.php','page=1&bID=14','::1',0,'','��\0','Accessed page [banner_manager.php]','info'),(185,'2019-02-19 15:19:52',1,'banner_manager.php','page=1&bID=5','::1',0,'','��\0','Accessed page [banner_manager.php]','info'),(186,'2019-02-19 15:19:54',1,'banner_manager.php','page=1&bID=5&action=new','::1',0,'','��\0','Accessed page [banner_manager.php] with action=new. Review page_parameters and postdata for details.','info'),(187,'2019-02-19 15:19:59',1,'banner_manager.php','page=1&bID=5','::1',0,'','��\0','Accessed page [banner_manager.php]','info'),(188,'2019-02-19 15:20:01',1,'banner_manager.php','page=1&bID=2','::1',0,'','��\0','Accessed page [banner_manager.php]','info'),(189,'2019-02-19 15:20:02',1,'banner_manager.php','page=1&bID=2&action=new','::1',0,'','��\0','Accessed page [banner_manager.php] with action=new. Review page_parameters and postdata for details.','info'),(190,'2019-02-19 15:20:06',1,'banner_manager.php','page=1&bID=2','::1',0,'','��\0','Accessed page [banner_manager.php]','info'),(191,'2019-02-19 15:20:07',1,'banner_manager.php','page=1&bID=3','::1',0,'','��\0','Accessed page [banner_manager.php]','info'),(192,'2019-02-19 15:20:10',1,'banner_manager.php','page=1&bID=3&action=new','::1',0,'','��\0','Accessed page [banner_manager.php] with action=new. Review page_parameters and postdata for details.','info'),(193,'2019-02-19 15:20:15',1,'banner_manager.php','page=1&action=upd','::1',0,'','e��j� �_%xn�nK/{�>BoK@��\ZA�	���{G�iz������ŧ�r�Έ�xO������/D�������^������+��]e�h��U�u�k��]`ɭ�L��y\Z���:|A�5���6����\\p�/gG{�ѵ��,H�Z�Yw:�������q,Z���K���o������$1��E\ZE ���,ڪ;��&���&n�q!q)��?�','Accessed page [banner_manager.php] with action=upd. Review page_parameters and postdata for details.','info'),(194,'2019-02-19 15:20:15',1,'banner_manager.php','page=1&bID=3','::1',0,'','��\0','Accessed page [banner_manager.php]','info'),(195,'2019-02-19 15:20:19',1,'banner_manager.php','page=1&bID=14','::1',0,'','��\0','Accessed page [banner_manager.php]','info'),(196,'2019-02-19 15:20:21',1,'banner_manager.php','page=1&bID=14&action=new','::1',0,'','��\0','Accessed page [banner_manager.php] with action=new. Review page_parameters and postdata for details.','info'),(197,'2019-02-19 15:20:25',1,'banner_manager.php','page=1&action=upd','::1',0,'','m��j�0�_����fd����a�A�x���H2)���l�������$�GW�ncb��u���b%s�JqӘ ��Y|t����0�;(^����\n��~z2թ\r	s*�Q�VZt���e3�g;�	x��?!�F��f�9�K�\'�a�O��j�̂s	��SB�~8=~���9t�f��v�>WQ7l�s0H�����g�\'p9@=�*.���r�w#~N�a���Z~','Accessed page [banner_manager.php] with action=upd. Review page_parameters and postdata for details.','info'),(198,'2019-02-19 15:20:25',1,'banner_manager.php','page=1&bID=14','::1',0,'','��\0','Accessed page [banner_manager.php]','info'),(199,'2019-02-19 15:20:26',1,'banner_manager.php','page=1&bID=13','::1',0,'','��\0','Accessed page [banner_manager.php]','info'),(200,'2019-02-19 15:20:27',1,'banner_manager.php','page=1&bID=13&action=new','::1',0,'','��\0','Accessed page [banner_manager.php] with action=new. Review page_parameters and postdata for details.','info'),(201,'2019-02-19 15:21:01',1,'banner_manager.php','page=1&action=upd','::1',0,'','m�;k1����!%[�ҩC!S\'�;���gI�RJ�{����$�}z�?`�$\n1�W�r�;��V�g-�j.�!�Ḱ��A5�A����/��V�V�_S�wm�$\\KC8p�g�|�zo7\rqƉ ��0���֜lN`t����qp�77|�O��Xpܞ�,,����h:�(�D�m�A:�(����J�\\Z��Y/~�\0','Accessed page [banner_manager.php] with action=upd. Review page_parameters and postdata for details.','info'),(202,'2019-02-19 15:21:01',1,'banner_manager.php','page=1&bID=13','::1',0,'','��\0','Accessed page [banner_manager.php]','info'),(203,'2019-02-19 15:21:04',1,'banner_manager.php','page=1&bID=4','::1',0,'','��\0','Accessed page [banner_manager.php]','info'),(204,'2019-02-19 15:21:06',1,'banner_manager.php','page=1&bID=4&action=new','::1',0,'','��\0','Accessed page [banner_manager.php] with action=new. Review page_parameters and postdata for details.','info'),(205,'2019-02-19 15:21:14',1,'banner_manager.php','page=1&action=upd','::1',0,'','e��N�0D��: qꑟ@B�Vn�MV$k�^�Ҋ�&-\n�d훙�j.��0c�@��7��C�H�ex*�Mu3db�r��2C��&#$FG��\Z�*qJF�w����|/���\rK�ޭv�P��\">ks�����Mݻye�K��_���e�E�Go-��f@�\\o�GWڵ?G�a��@�~1a@��i�y��G\\���Y#�Ѧ	k�@<y\n��K�Fh���x)��','Accessed page [banner_manager.php] with action=upd. Review page_parameters and postdata for details.','info'),(206,'2019-02-19 15:21:14',1,'banner_manager.php','page=1&bID=4','::1',0,'','��\0','Accessed page [banner_manager.php]','info'),(207,'2019-02-19 15:21:15',1,'banner_manager.php','page=1&bID=4&action=new','::1',0,'','��\0','Accessed page [banner_manager.php] with action=new. Review page_parameters and postdata for details.','info'),(208,'2019-02-19 15:21:21',1,'banner_manager.php','page=1&action=upd','::1',0,'','e�AO!��\nr�bYM<��01��L���@`(U�lk��D�{�\r��%w�R�h�V>���p�mxl�E\rHT]�l�72�}�O+��\Zý�E8s\0�A�CzJ�?J�,v\0$ޠ%��jGI}�c�y;�PkU�@��$VSXV�9���-l^N����k�*���A�0��љ����.j����M���or�x�p��9$�!YH�άa�yr`��^�h�d��S�Bp�����.�\0','Accessed page [banner_manager.php] with action=upd. Review page_parameters and postdata for details.','info'),(209,'2019-02-19 15:21:21',1,'banner_manager.php','page=1&bID=4','::1',0,'','��\0','Accessed page [banner_manager.php]','info'),(210,'2019-02-19 15:32:04',1,'keepalive.php','','::1',0,'','��\0','Accessed page [keepalive.php]','info'),(211,'2019-02-19 15:32:05',1,'keepalive.php','','::1',0,'','��\0','Accessed page [keepalive.php]','info'),(212,'2019-02-19 15:32:06',1,'index.php','','::1',0,'','��\0','Accessed page [index.php]','info'),(213,'2019-02-19 15:32:13',1,'category_product_listing.php','','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(214,'2019-02-19 15:32:15',1,'categories.php','action=new_category','::1',0,'','��\0','Accessed page [categories.php] with action=new_category. Review page_parameters and postdata for details.','info'),(215,'2019-02-19 15:32:17',1,'category_product_listing.php','','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(216,'2019-02-19 15:33:06',1,'product.php','action=new_product','::1',0,'','�V*(�O)M.�/�,HU�R2T�QJH,�\0�������< ;/�<�T�\0','Accessed page [product.php] with action=new_product. Review page_parameters and postdata for details.','info'),(217,'2019-02-19 15:33:10',1,'category_product_listing.php','cPath=0','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(218,'2019-02-19 15:34:09',1,'categories.php','cPath=0&action=new_category','::1',0,'','��\0','Accessed page [categories.php] with action=new_category. Review page_parameters and postdata for details.','info'),(219,'2019-02-19 15:34:11',1,'categories.php','cPath=0&action=new_category','::1',0,'','��\0','Accessed page [categories.php] with action=new_category. Review page_parameters and postdata for details.','info'),(220,'2019-02-19 15:34:11',1,'categories.php','cPath=0&action=new_category','::1',0,'','��\0','Accessed page [categories.php] with action=new_category. Review page_parameters and postdata for details.','info'),(221,'2019-02-19 15:34:12',1,'categories.php','cPath=0&action=new_category','::1',0,'','��\0','Accessed page [categories.php] with action=new_category. Review page_parameters and postdata for details.','info'),(222,'2019-02-19 15:34:12',1,'categories.php','cPath=0&action=new_category','::1',0,'','��\0','Accessed page [categories.php] with action=new_category. Review page_parameters and postdata for details.','info'),(223,'2019-02-19 15:34:13',1,'category_product_listing.php','cPath=0','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(224,'2019-02-19 15:35:23',0,'login.php ','camefrom=category_product_listing.php&cPath=0','::1',0,'','��\0','Accessed page [login.php]','info'),(225,'2019-02-19 15:35:28',0,'login.php keongsang','camefrom=category_product_listing.php&cPath=0','::1',0,'','%�1� \0���EHA��0�!�2���]�rP�	����	���m��p\n�����D�	 �EN�\Z�q�&�����kS?�','Accessed page [login.php] with action=do66bdf5395198d576dfc5232b373fad5f. Review page_parameters and postdata for details.','info'),(226,'2019-02-19 15:35:28',1,'category_product_listing.php','cPath=0','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(227,'2019-02-19 15:35:31',1,'product_types.php','','::1',0,'','��\0','Accessed page [product_types.php]','info'),(228,'2019-02-19 15:35:32',1,'category_product_listing.php','','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(229,'2019-02-19 15:35:34',1,'modules.php','set=payment','::1',0,'','��\0','Accessed page [modules.php]','info'),(230,'2019-02-19 15:35:35',1,'category_product_listing.php','','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(231,'2019-02-19 15:36:05',0,'login.php ','camefrom=category_product_listing.php','::1',0,'','��\0','Accessed page [login.php]','info'),(232,'2019-02-19 15:36:05',0,'login.php ','camefrom=category_product_listing.php','::1',1,'','��\0','Deleted admin pages for page keys: configImageHandler4','warning'),(233,'2019-02-19 15:36:05',0,'login.php ','camefrom=category_product_listing.php','::1',1,'','��\0','Registered new admin menu page \\\"configImageHandler4\\\"','warning'),(234,'2019-02-19 15:36:12',0,'login.php keongsang','camefrom=category_product_listing.php','::1',0,'','�VJL.���S�RJ�732H3MI21H4H�0N6�HM6553L�0347HILV�QJL��̋�K�M��N��K/N�KJ�&�f�\0�!�Z\0','Accessed page [login.php] with action=do620f5db40a0f83c68ec5561a86170dac. Review page_parameters and postdata for details.','info'),(235,'2019-02-19 15:36:12',1,'category_product_listing.php','','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(236,'2019-02-19 15:36:15',1,'category_product_listing.php','','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(237,'2019-02-19 15:36:16',1,'categories.php','action=new_category','::1',0,'','��\0','Accessed page [categories.php] with action=new_category. Review page_parameters and postdata for details.','info'),(238,'2019-02-19 15:36:54',1,'index.php','','::1',0,'','��\0','Accessed page [index.php]','info'),(239,'2019-02-19 15:37:01',1,'category_product_listing.php','','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(240,'2019-02-19 15:37:04',1,'categories.php','action=new_category','::1',0,'','��\0','Accessed page [categories.php] with action=new_category. Review page_parameters and postdata for details.','info'),(241,'2019-02-19 15:37:10',1,'categories.php','','::1',0,'','��\0','Accessed page [categories.php]','info'),(242,'2019-02-19 15:37:12',1,'categories.php','','::1',0,'','��\0','Accessed page [categories.php]','info'),(243,'2019-02-19 15:39:47',1,'index.php','','::1',0,'','��\0','Accessed page [index.php]','info'),(244,'2019-02-19 15:39:51',1,'category_product_listing.php','','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(245,'2019-02-19 15:39:57',1,'categories.php','action=new_category','::1',0,'','��\0','Accessed page [categories.php] with action=new_category. Review page_parameters and postdata for details.','info'),(246,'2019-02-19 15:42:31',0,'login.php ','camefrom=index.php','::1',0,'','��\0','Accessed page [login.php]','info'),(247,'2019-02-19 15:42:36',0,'login.php keongsangyu159753','camefrom=index.php','::1',0,'','%�1� ��r����\r`1�0��Ÿ5i{�3��C��I7�A?*����$�L���R�1�v>�~\"�W�z6��jS,M�?</','Accessed page [login.php] with action=doff10c1c6a7ae4da373152b04c8009d83. Review page_parameters and postdata for details.','info'),(248,'2019-02-19 15:42:36',0,'login.php keongsangyu159753','camefrom=index.php','::1',1,'','%�1� ��r����\r`1�0��Ÿ5i{�3��C��I7�A?*����$�L���R�1�v>�~\"�W�z6��jS,M�?</','Failed admin login attempt:  keongsangyu159753','warning'),(249,'2019-02-19 15:42:41',0,'login.php 159753keongsangyu159753','camefrom=index.php','::1',0,'','%�K\n� \0���-43�kt�x~	�u���\r���Z*�r��9�VT�B	.g��3^�\0}Nt�0.���\n�bE�w���j�9���?�','Accessed page [login.php] with action=doff10c1c6a7ae4da373152b04c8009d83. Review page_parameters and postdata for details.','info'),(250,'2019-02-19 15:42:41',0,'login.php 159753keongsangyu159753','camefrom=index.php','::1',1,'','%�K\n� \0���-43�kt�x~	�u���\r���Z*�r��9�VT�B	.g��3^�\0}Nt�0.���\n�bE�w���j�9���?�','Failed admin login attempt:  159753keongsangyu159753','warning'),(251,'2019-02-19 15:42:51',0,'login.php keongsang','camefrom=index.php','::1',0,'','�VJL.���S�RJ�OK34H6L6K4OL5II467645J20I�00�L�0V�QJL��̋�K�M��N��K/N�KJ�&�f�\0�!�Z\0','Accessed page [login.php] with action=doff10c1c6a7ae4da373152b04c8009d83. Review page_parameters and postdata for details.','info'),(252,'2019-02-19 15:42:51',1,'index.php','','::1',0,'','��\0','Accessed page [index.php]','info'),(253,'2019-02-19 15:42:55',1,'category_product_listing.php','','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(254,'2019-02-19 15:42:56',1,'product.php','action=new_product','::1',0,'','�V*(�O)M.�/�,HU�R2T�QJH,�\0�������< ;/�<�T�\0','Accessed page [product.php] with action=new_product. Review page_parameters and postdata for details.','info'),(255,'2019-02-19 15:43:20',1,'index.php','','::1',0,'','��\0','Accessed page [index.php]','info'),(256,'2019-02-19 15:43:29',1,'category_product_listing.php','','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(257,'2019-02-19 15:43:31',1,'categories.php','action=new_category','::1',0,'','��\0','Accessed page [categories.php] with action=new_category. Review page_parameters and postdata for details.','info'),(258,'2019-02-19 15:43:33',1,'category_product_listing.php','','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(259,'2019-02-19 15:45:43',1,'keepalive.php','','::1',0,'','��\0','Accessed page [keepalive.php]','info'),(260,'2019-02-19 15:45:44',1,'category_product_listing.php','','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(261,'2019-02-19 15:45:45',1,'categories.php','action=new_category','::1',0,'','��\0','Accessed page [categories.php] with action=new_category. Review page_parameters and postdata for details.','info'),(262,'2019-02-19 15:45:55',1,'index.php','','::1',0,'','��\0','Accessed page [index.php]','info'),(263,'2019-02-19 15:51:23',1,'keepalive.php','','::1',0,'','��\0','Accessed page [keepalive.php]','info'),(264,'2019-02-19 15:54:00',1,'keepalive.php','','::1',0,'','��\0','Accessed page [keepalive.php]','info'),(265,'2019-02-19 15:55:42',0,'login.php ','camefrom=index.php','::1',0,'','��\0','Accessed page [login.php]','info'),(266,'2019-02-19 15:55:47',0,'login.php keongsang','camefrom=index.php','::1',0,'','�VJL.���S�RJɷ02JM527MI�00J5563L43KI�LN620�0NR�QJL��̋�K�M��N��K/N�KJ�&�f�\0�!�Z\0','Accessed page [login.php] with action=do822ee275db802e5361a66de9cc20783b. Review page_parameters and postdata for details.','info'),(267,'2019-02-19 15:55:48',1,'index.php','','::1',0,'','��\0','Accessed page [index.php]','info'),(268,'2019-02-19 15:55:51',1,'category_product_listing.php','','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(269,'2019-02-19 15:55:53',1,'categories.php','action=new_category','::1',0,'','��\0','Accessed page [categories.php] with action=new_category. Review page_parameters and postdata for details.','info'),(270,'2019-02-19 15:57:02',1,'index.php','','::1',0,'','��\0','Accessed page [index.php]','info'),(271,'2019-02-19 15:57:02',1,'keepalive.php','','::1',0,'','��\0','Accessed page [keepalive.php]','info'),(272,'2019-02-19 15:57:04',1,'category_product_listing.php','','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(273,'2019-02-19 15:57:05',1,'categories.php','action=new_category','::1',0,'','��\0','Accessed page [categories.php] with action=new_category. Review page_parameters and postdata for details.','info'),(274,'2019-02-19 15:57:38',1,'categories.php','action=insert_category','::1',0,'','U�K\n�0D�b��\"�;�\n=@o`�H5����,J��k�.��7�l0�q,*܂��r$���\n�*oa����Y���|���%$v���=\\U�6$�@�]�Ӛ$���B���;0uԊZ(J���_','Accessed page [categories.php] with action=insert_category. Review page_parameters and postdata for details.','info'),(275,'2019-02-19 15:57:38',1,'category_product_listing.php','cID=1','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(276,'2019-02-19 15:57:40',1,'categories.php','action=new_category','::1',0,'','��\0','Accessed page [categories.php] with action=new_category. Review page_parameters and postdata for details.','info'),(277,'2019-02-19 15:58:07',1,'categories.php','action=insert_category','::1',0,'','e�1�0E�yf(b�\n�Q��`)�+�Pջ�B���_���(S�0O�_RC!�78�קD�=sw\\��~�\"���K�W�������.���\Z�g�K���\r8Lr	�|	u\ry�� e�~����yQ����','Accessed page [categories.php] with action=insert_category. Review page_parameters and postdata for details.','info'),(278,'2019-02-19 15:58:07',1,'category_product_listing.php','cID=2','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(279,'2019-02-19 15:58:09',1,'categories.php','action=new_category','::1',0,'','��\0','Accessed page [categories.php] with action=new_category. Review page_parameters and postdata for details.','info'),(280,'2019-02-19 15:58:33',1,'categories.php','action=insert_category','::1',0,'',']�1\n�0�\"�N�Nu�7�ŷ�K2\'���7����e7��!SԠB~����	�7���Q�j���A�L��%_D�X�^o�x��47Xu߶�D��t���!q^y>f�~���j��	~��','Accessed page [categories.php] with action=insert_category. Review page_parameters and postdata for details.','info'),(281,'2019-02-19 15:58:33',1,'category_product_listing.php','cID=3','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(282,'2019-02-19 15:58:35',1,'categories.php','action=new_category','::1',0,'','��\0','Accessed page [categories.php] with action=new_category. Review page_parameters and postdata for details.','info'),(283,'2019-02-19 15:59:15',1,'categories.php','action=insert_category','::1',0,'','U�1\n�0E�\"4����[��0�%� ���%��UJ�M<���u���4��n���LI�-xC������z�XZ�:u-�+�O�D,�z��	S�ܥe���Ma��[���Y���T����Dy��X�e�n��`�nu_*˞_?','Accessed page [categories.php] with action=insert_category. Review page_parameters and postdata for details.','info'),(284,'2019-02-19 15:59:15',1,'category_product_listing.php','cID=4','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(285,'2019-02-19 15:59:34',1,'category_product_listing.php','cPath=1','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(286,'2019-02-19 15:59:35',1,'product.php','action=new_product','::1',0,'','�V*(�O)M.�/�,HU�R2T�QJH,ɀ��K2�󀜼��x�Z�Z\0','Accessed page [product.php] with action=new_product. Review page_parameters and postdata for details.','info'),(287,'2019-02-19 15:59:56',1,'manufacturers.php','','::1',0,'','��\0','Accessed page [manufacturers.php]','info'),(288,'2019-02-19 15:59:59',1,'manufacturers.php','page=0&action=new','::1',0,'','��\0','Accessed page [manufacturers.php] with action=new. Review page_parameters and postdata for details.','info'),(289,'2019-02-19 16:00:16',1,'manufacturers.php','action=insert','::1',0,'','�V�M�+MKL.)-J-*��K�MU�RrL,��S�Q��M�O�,��(��ʡj��MLO��%�\0�cȗ���Ar��\0','Accessed page [manufacturers.php] with action=insert. Review page_parameters and postdata for details.','info'),(290,'2019-02-19 16:00:16',1,'manufacturers.php','mID=1','::1',0,'','��\0','Accessed page [manufacturers.php]','info'),(291,'2019-02-19 16:00:17',1,'manufacturers.php','page=1&mID=1&action=edit','::1',0,'','��\0','Accessed page [manufacturers.php] with action=edit. Review page_parameters and postdata for details.','info'),(292,'2019-02-19 16:00:20',1,'manufacturers.php','page=1&mID=1','::1',0,'','��\0','Accessed page [manufacturers.php]','info'),(293,'2019-02-19 16:00:20',1,'manufacturers.php','page=1&mID=1&action=new','::1',0,'','��\0','Accessed page [manufacturers.php] with action=new. Review page_parameters and postdata for details.','info'),(294,'2019-02-19 16:00:25',1,'manufacturers.php','action=insert','::1',0,'','�V�M�+MKL.)-J-*��K�MU�R�JL�OR�Q��M�O�,��(��ʡj��MLO��%�\0�cȗ���Ar��\0','Accessed page [manufacturers.php] with action=insert. Review page_parameters and postdata for details.','info'),(295,'2019-02-19 16:00:25',1,'manufacturers.php','mID=2','::1',0,'','��\0','Accessed page [manufacturers.php]','info'),(296,'2019-02-19 16:00:26',1,'manufacturers.php','page=1&mID=2&action=new','::1',0,'','��\0','Accessed page [manufacturers.php] with action=new. Review page_parameters and postdata for details.','info'),(297,'2019-02-19 16:00:30',1,'manufacturers.php','action=insert','::1',0,'','�V�M�+MKL.)-J-*��K�MU�R�H,*�T�Q��M�O�,��(��ʡj��MLO��%�\0�cȗ���Ar��\0','Accessed page [manufacturers.php] with action=insert. Review page_parameters and postdata for details.','info'),(298,'2019-02-19 16:00:30',1,'manufacturers.php','mID=3','::1',0,'','��\0','Accessed page [manufacturers.php]','info'),(299,'2019-02-19 16:00:32',1,'manufacturers.php','page=1&mID=3&action=new','::1',0,'','��\0','Accessed page [manufacturers.php] with action=new. Review page_parameters and postdata for details.','info'),(300,'2019-02-19 16:00:40',1,'manufacturers.php','action=insert','::1',0,'','�V�M�+MKL.)-J-*��K�MU�RrI��L�Q�Q��M�O�,\n����ʡ���MLO��%�\0�cȗ���Ar��\0','Accessed page [manufacturers.php] with action=insert. Review page_parameters and postdata for details.','info'),(301,'2019-02-19 16:00:40',1,'manufacturers.php','mID=4','::1',0,'','��\0','Accessed page [manufacturers.php]','info'),(302,'2019-02-19 16:00:41',1,'manufacturers.php','page=1&mID=4&action=new','::1',0,'','��\0','Accessed page [manufacturers.php] with action=new. Review page_parameters and postdata for details.','info'),(303,'2019-02-19 16:00:45',1,'manufacturers.php','action=insert','::1',0,'','�V�M�+MKL.)-J-*��K�MU�R�(�T�Q��M�O�,�Q���P�e�&��ƃ�s��1�K����J� ��Z\0','Accessed page [manufacturers.php] with action=insert. Review page_parameters and postdata for details.','info'),(304,'2019-02-19 16:00:45',1,'manufacturers.php','mID=5','::1',0,'','��\0','Accessed page [manufacturers.php]','info'),(305,'2019-02-19 16:00:48',1,'manufacturers.php','page=1&mID=5&action=new','::1',0,'','��\0','Accessed page [manufacturers.php] with action=new. Review page_parameters and postdata for details.','info'),(306,'2019-02-19 16:00:54',1,'manufacturers.php','action=insert','::1',0,'','�V�M�+MKL.)-J-*��K�MU�Rr���KU�Q��M�O�,��(��ʡj��MLO��%�\0�cȗ���Ar��\0','Accessed page [manufacturers.php] with action=insert. Review page_parameters and postdata for details.','info'),(307,'2019-02-19 16:00:54',1,'manufacturers.php','mID=6','::1',0,'','��\0','Accessed page [manufacturers.php]','info'),(308,'2019-02-19 16:00:59',1,'category_product_listing.php','','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(309,'2019-02-19 16:01:59',0,'login.php ','camefrom=index.php','::1',0,'','��\0','Accessed page [login.php]','info'),(310,'2019-02-19 16:03:17',1,'keepalive.php','','::1',0,'','��\0','Accessed page [keepalive.php]','info'),(311,'2019-02-19 16:03:20',1,'category_product_listing.php','cPath=3','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(312,'2019-02-19 16:04:38',1,'product.php','action=new_product','::1',0,'','�V*(�O)M.�/�,HU�R2T�QJH,�\0��������< \'/�<�V�\0','Accessed page [product.php] with action=new_product. Review page_parameters and postdata for details.','info'),(313,'2019-02-19 16:05:28',1,'product.php','cPath=3&action=new_product_preview','::1',0,'','���n�0Ey]*��l��[ۄ���qH������ST)���xN�ޜDKA\'Œ�ֈ��ćpِT��	�&J�Y�ʵ8J�Q���m����QpeEK�����R����qg���Z��e�zUm�U�\\oFb�v�8��+��s��{N�ʭ�	��H��Ę)M��S��ɮe=H`&����Ke!^Q��%ߴ��B���!q;g{�a�q�m��)�x�u������3�@:����W�l�kE����8썞9k�\"l��Y�{���p�J}>y���\\���\"�-�C�>8h�$�krB����3�5wCg�HȦ�j/Q�rN\"{ca=\Zl�<Kx����ٟ3�\\�qKc�W�e��_','Accessed page [product.php] with action=new_product_preview. Review page_parameters and postdata for details.','info'),(314,'2019-02-19 16:05:28',1,'product.php','cPath=3&action=new_product_preview','::1',1,'','���n�0Ey]*��l��[ۄ���qH������ST)���xN�ޜDKA\'Œ�ֈ��ćpِT��	�&J�Y�ʵ8J�Q���m����QpeEK�����R����qg���Z��e�zUm�U�\\oFb�v�8��+��s��{N�ʭ�	��H��Ę)M��S��ɮe=H`&����Ke!^Q��%ߴ��B���!q;g{�a�q�m��)�x�u������3�@:����W�l�kE����8썞9k�\"l��Y�{���p�J}>y���\\���\"�-�C�>8h�$�krB����3�5wCg�HȦ�j/Q�rN\"{ca=\Zl�<Kx����ٟ3�\\�qKc�W�e��_','Success: File upload saved successfully car.png','notice'),(315,'2019-02-19 16:05:31',1,'product.php','cPath=3&action=insert_product','::1',0,'','�Rˎ�0���H{�����#7	�R��)T�_�R颕r�g�;s.Z\n&iVܷ��e�Q4ْ����6*4	r#Ge0���m�T;\nM�h	�U1���Xd�oVo����]׫r�,��z38�i�Y���zt+���f>�U\r���ͨ�W�LX%�\r�pR�A�I��_��yk\n1�P��	���#��q�ض��\\��������	<�P���8�^�#��i�d�;4�	ƺ,V-�C��6P�Ħ�D�t���F{���Y:�ͅG�5\Z��-�{�%O�8�9K��>c�����r�L�Ј��X�?�_|��\'lԄ-c���rX�\Z���M�����kC+���','Accessed page [product.php] with action=insert_product. Review page_parameters and postdata for details.','info'),(316,'2019-02-19 16:05:31',1,'product.php','cPath=3&action=insert_product','::1',0,'','�Rˎ�0���H{�����#7	�R��)T�_�R颕r�g�;s.Z\n&iVܷ��e�Q4ْ����6*4	r#Ge0���m�T;\nM�h	�U1���Xd�oVo����]׫r�,��z38�i�Y���zt+���f>�U\r���ͨ�W�LX%�\r�pR�A�I��_��yk\n1�P��	���#��q�ض��\\��������	<�P���8�^�#��i�d�;4�	ƺ,V-�C��6P�Ħ�D�t���F{���Y:�ͅG�5\Z��-�{�%O�8�9K��>c�����r�L�Ј��X�?�_|��\'lԄ-c���rX�\Z���M�����kC+���','New product 2 added via admin console.','info'),(317,'2019-02-19 16:05:31',1,'category_product_listing.php','cPath=3&pID=2','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(318,'2019-02-19 16:05:51',1,'product.php','action=new_product','::1',0,'','�V*(�O)M.�/�,HU�R2T�QJH,�\0��������< \'/�<�V�\0','Accessed page [product.php] with action=new_product. Review page_parameters and postdata for details.','info'),(319,'2019-02-19 16:06:40',1,'product.php','cPath=3&action=new_product_preview','::1',0,'','�SIn�0���sS�)zHϽ�\rm1-.E%1���t�VnP��C͈3:�G�;12X��M�T{H�l:�#&CV[ڹ�������ml��i6}��:4)��$ 9]���T1v@Z71���z�4����8�\rt������t\0�3G=���@�G����\rb(�P,�2U;p�O�ִ��6�l�9H5�q-��W�sL�l�%��k���,ܤ-\r��$��Ѵ��`����B\"[��S���oD$�y<�����1\rB1\\]�-�J??��\'�*�v�^�+]V��<�p��Q��EW�w`�Q�ꎇ�M�F��?ZWao���I���N��\'�����=R��Y��A��8{R��[{��)��բY�_�','Accessed page [product.php] with action=new_product_preview. Review page_parameters and postdata for details.','info'),(320,'2019-02-19 16:06:40',1,'product.php','cPath=3&action=new_product_preview','::1',1,'','�SIn�0���sS�)zHϽ�\rm1-.E%1���t�VnP��C͈3:�G�;12X��M�T{H�l:�#&CV[ڹ�������ml��i6}��:4)��$ 9]���T1v@Z71���z�4����8�\rt������t\0�3G=���@�G����\rb(�P,�2U;p�O�ִ��6�l�9H5�q-��W�sL�l�%��k���,ܤ-\r��$��Ѵ��`����B\"[��S���oD$�y<�����1\rB1\\]�-�J??��\'�*�v�^�+]V��<�p��Q��EW�w`�Q�ꎇ�M�F��?ZWao���I���N��\'�����=R��Y��A��8{R��[{��)��բY�_�','Success: File upload saved successfully motor.png','notice'),(321,'2019-02-19 16:06:41',1,'product.php','cPath=3&action=insert_product','::1',0,'','�S�n�@��(�RP��+߰r�n��������hKRT)���=��ɹ�8�܈����ʗ�CdӀ`�0�\n)r#\'c)51���S�|r�SF�ԠI�Ug�%��f�g��1p\0rP�Aq��6��Z�6��?����7�o?݆����ϡڀsz���\r�0�Yf\n�L� ݤ��Z\\��m9�4�Ē�ͽ�;B5nҎ��B;�Ko�xzrg�AH)������N3�GF$�u<��>C�$-�I�:�Ŭ���+H��D���u����*�|d�\n_�C4`�sDjw2K����,�c�����\\-��oJ\0��j��R�b%ry�=S��	�pgʎR��:��Qx�X�}��(46A��ׇ)�ݽ��~��q�k�a�|','Accessed page [product.php] with action=insert_product. Review page_parameters and postdata for details.','info'),(322,'2019-02-19 16:06:41',1,'product.php','cPath=3&action=insert_product','::1',0,'','�S�n�@��(�RP��+߰r�n��������hKRT)���=��ɹ�8�܈����ʗ�CdӀ`�0�\n)r#\'c)51���S�|r�SF�ԠI�Ug�%��f�g��1p\0rP�Aq��6��Z�6��?����7�o?݆����ϡڀsz���\r�0�Yf\n�L� ݤ��Z\\��m9�4�Ē�ͽ�;B5nҎ��B;�Ko�xzrg�AH)������N3�GF$�u<��>C�$-�I�:�Ŭ���+H��D���u����*�|d�\n_�C4`�sDjw2K����,�c�����\\-��oJ\0��j��R�b%ry�=S��	�pgʎR��:��Qx�X�}��(46A��ׇ)�ݽ��~��q�k�a�|','New product 3 added via admin console.','info'),(323,'2019-02-19 16:06:41',1,'category_product_listing.php','cPath=3&pID=3','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(324,'2019-02-19 16:07:07',1,'product.php','action=new_product','::1',0,'','�V*(�O)M.�/�,HU�R2T�QJH,�\0��������< \'/�<�V�\0','Accessed page [product.php] with action=new_product. Review page_parameters and postdata for details.','info'),(325,'2019-02-19 16:08:11',1,'product.php','cPath=3&action=new_product_preview','::1',0,'','��ˎ�0Ee��tT�f��Ld�K-B������G_��Hl�����Zv&��ehQ�U��U\r^�u	��cB��D)*K�׆|�Bso�~��]��h�J��q��ּ���<Ό0\Z: �\'��l�ɲM�O�M8@)��������s�G��\n���UM>2�����}Knt1ha*�$��ui�/ i�x�7��y�h��)�33��Gj[j�����p����4B�ı�~���W}2�\"4$���ԣI�E_2�B��Y$G�_��y��qV�������������Y�����K�	,�mt�Ip�9׎I�������{F���<�~^W��L!7fZ��m��v��','Accessed page [product.php] with action=new_product_preview. Review page_parameters and postdata for details.','info'),(326,'2019-02-19 16:08:11',1,'product.php','cPath=3&action=new_product_preview','::1',1,'','��ˎ�0Ee��tT�f��Ld�K-B������G_��Hl�����Zv&��ehQ�U��U\r^�u	��cB��D)*K�׆|�Bso�~��]��h�J��q��ּ���<Ό0\Z: �\'��l�ɲM�O�M8@)��������s�G��\n���UM>2�����}Knt1ha*�$��ui�/ i�x�7��y�h��)�33��Gj[j�����p����4B�ı�~���W}2�\"4$���ԣI�E_2�B��Y$G�_��y��qV�������������Y�����K�	,�mt�Ip�9׎I�������{F���<�~^W��L!7fZ��m��v��','Success: File upload saved successfully orgol.png','notice'),(327,'2019-02-19 16:08:12',1,'product.php','cPath=3&action=insert_product','::1',0,'','�Rˎ�0���mU����LdHJ-��u\n���k^}@�J\\Ȍ33�ܒ���+�j���4�N*lH���&(�	2���\n�c�	�3�jɨ	��\'�Yb��c��<�3\n\Z@���Czܥ�.��.���H�&�?�i�A\\�����\0k?z�*�0�WZUX��z�w�!pI>�� q�v�\n�h]��5�r)�˝�}�����Q(���h��?�+�wFt��:�Fo�����.�U�i�GYm�A�J)�?r�d�<�7���l��#�o,u����\'���J=P�!�P�C�K���8���S⩔h��L(kF�f_0|�7��o�Hvf���[�o����','Accessed page [product.php] with action=insert_product. Review page_parameters and postdata for details.','info'),(328,'2019-02-19 16:08:12',1,'product.php','cPath=3&action=insert_product','::1',0,'','�Rˎ�0���mU����LdHJ-��u\n���k^}@�J\\Ȍ33�ܒ���+�j���4�N*lH���&(�	2���\n�c�	�3�jɨ	��\'�Yb��c��<�3\n\Z@���Czܥ�.��.���H�&�?�i�A\\�����\0k?z�*�0�WZUX��z�w�!pI>�� q�v�\n�h]��5�r)�˝�}�����Q(���h��?�+�wFt��:�Fo�����.�U�i�GYm�A�J)�?r�d�<�7���l��#�o,u����\'���J=P�!�P�C�K���8���S⩔h��L(kF�f_0|�7��o�Hvf���[�o����','New product 4 added via admin console.','info'),(329,'2019-02-19 16:08:12',1,'category_product_listing.php','cPath=3&pID=4','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(330,'2019-02-19 16:08:14',1,'category_product_listing.php','','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(331,'2019-02-19 16:08:45',1,'category_product_listing.php','cPath=3','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(332,'2019-02-19 16:08:46',1,'product.php','action=new_product','::1',0,'','�V*(�O)M.�/�,HU�R2T�QJH,�\0��������< \'/�<�V�\0','Accessed page [product.php] with action=new_product. Review page_parameters and postdata for details.','info'),(333,'2019-02-19 16:09:25',1,'product.php','cPath=3&action=new_product_preview','::1',0,'','�Sˎ�0��UϋD��\0��=r�P,%Mq�>���u�ҀV�%��3�L�YC^ǒ��Y�}gR%��<�	\n�������J�G��cQ�Ȼ5�!,�\n��g]�\"�9S�(h-vd�m��&�7�����\'(9��E����\Z��\\e�!;����;!�=\n��4����%X�V�VŠ��������W����I����YIE>���\"q����0KW�M�u����\n���%B�(OZ<wX���>axE�\Z�3�����]J��w����K>�xe�s\\�*統��6dZ�Q�pP�������� �\"���5��YK��c�`���տ��VgNr.�7��?Sֵ��4�|������','Accessed page [product.php] with action=new_product_preview. Review page_parameters and postdata for details.','info'),(334,'2019-02-19 16:09:25',1,'product.php','cPath=3&action=new_product_preview','::1',1,'','�Sˎ�0��UϋD��\0��=r�P,%Mq�>���u�ҀV�%��3�L�YC^ǒ��Y�}gR%��<�	\n�������J�G��cQ�Ȼ5�!,�\n��g]�\"�9S�(h-vd�m��&�7�����\'(9��E����\Z��\\e�!;����;!�=\n��4����%X�V�VŠ��������W����I����YIE>���\"q����0KW�M�u����\n���%B�(OZ<wX���>axE�\Z�3�����]J��w����K>�xe�s\\�*統��6dZ�Q�pP�������� �\"���5��YK��c�`���տ��VgNr.�7��?Sֵ��4�|������','Success: File upload saved successfully toy.png','notice'),(335,'2019-02-19 16:09:27',1,'product.php','cPath=3&action=insert_product','::1',0,'','�Rˎ�0���H{����&Ki�u�>���u_<\Z��zif&3v�T�t�XqW�䘤�WR�gC*6�#4^�H���F��P>d�UP]�KFE�������y��QPZ8��q�K�4��C�2\\ �@���?O�B/)�\"g����iu�0�G2�*��\'�Xާ�0pN����8��Ӂm��+Ū�2_��r�ή]��o��Q(���h��h#�wF(��}\nl�^C����]4�\"S���r3�X�R*��\\��<�Ն\ZB6K�۷�>����Q����Q��j=�7�o�ߦ�WJ	�$�I�crr���\Z���z��a��ʙ�W��X	ٙ�v>/GTߕ���','Accessed page [product.php] with action=insert_product. Review page_parameters and postdata for details.','info'),(336,'2019-02-19 16:09:27',1,'product.php','cPath=3&action=insert_product','::1',0,'','�Rˎ�0���H{����&Ki�u�>���u_<\Z��zif&3v�T�t�XqW�䘤�WR�gC*6�#4^�H���F��P>d�UP]�KFE�������y��QPZ8��q�K�4��C�2\\ �@���?O�B/)�\"g����iu�0�G2�*��\'�Xާ�0pN����8��Ӂm��+Ū�2_��r�ή]��o��Q(���h��h#�wF(��}\nl�^C����]4�\"S���r3�X�R*��\\��<�Ն\ZB6K�۷�>����Q����Q��j=�7�o�ߦ�WJ	�$�I�crr���\Z���z��a��ʙ�W��X	ٙ�v>/GTߕ���','New product 5 added via admin console.','info'),(337,'2019-02-19 16:09:27',1,'category_product_listing.php','cPath=3&pID=5','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(338,'2019-02-19 16:09:28',1,'index.php','','::1',0,'','��\0','Accessed page [index.php]','info'),(339,'2019-02-19 16:11:33',1,'keepalive.php','','::1',0,'','��\0','Accessed page [keepalive.php]','info'),(340,'2019-02-19 16:11:35',1,'category_product_listing.php','','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(341,'2019-02-19 16:11:36',1,'category_product_listing.php','cPath=3','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(342,'2019-02-19 16:11:52',1,'product.php','cPath=3&product_type=1&pID=3&action=new_product','::1',0,'','��\0','Accessed page [product.php] with action=new_product. Review page_parameters and postdata for details.','info'),(343,'2019-02-19 16:12:31',1,'index.php','','::1',0,'','��\0','Accessed page [index.php]','info'),(344,'2019-02-19 16:12:34',1,'products_price_manager.php','','::1',0,'','��\0','Accessed page [products_price_manager.php]','info'),(345,'2019-02-19 16:12:36',1,'products_price_manager.php','current_category_id=1&action=new_cat','::1',0,'','��\0','Accessed page [products_price_manager.php] with action=new_cat. Review page_parameters and postdata for details.','info'),(346,'2019-02-19 16:12:36',1,'products_price_manager.php','current_category_id=1','::1',0,'','��\0','Accessed page [products_price_manager.php]','info'),(347,'2019-02-19 16:12:37',1,'products_price_manager.php','current_category_id=2&action=new_cat','::1',0,'','��\0','Accessed page [products_price_manager.php] with action=new_cat. Review page_parameters and postdata for details.','info'),(348,'2019-02-19 16:12:37',1,'products_price_manager.php','current_category_id=2','::1',0,'','��\0','Accessed page [products_price_manager.php]','info'),(349,'2019-02-19 16:12:40',1,'products_price_manager.php','current_category_id=3&action=new_cat','::1',0,'','��\0','Accessed page [products_price_manager.php] with action=new_cat. Review page_parameters and postdata for details.','info'),(350,'2019-02-19 16:12:40',1,'products_price_manager.php','products_filter=3&current_category_id=3','::1',0,'','��\0','Accessed page [products_price_manager.php]','info'),(351,'2019-02-19 16:12:44',1,'products_price_manager.php','action=set_products_filter','::1',0,'','�V*(�O)M.)�O��)I-R�R2V�QJ.-*J�+�ON,IM�/���L��\0','Accessed page [products_price_manager.php] with action=set_products_filter. Review page_parameters and postdata for details.','info'),(352,'2019-02-19 16:12:44',1,'products_price_manager.php','products_filter=3&current_category_id=3','::1',0,'','��\0','Accessed page [products_price_manager.php]','info'),(353,'2019-02-19 16:12:49',1,'options_name_manager.php','','::1',0,'','��\0','Accessed page [options_name_manager.php]','info'),(354,'2019-02-19 16:12:52',1,'options_values_manager.php','','::1',0,'','��\0','Accessed page [options_values_manager.php]','info'),(355,'2019-02-19 16:12:52',1,'options_name_manager.php','','::1',0,'','��\0','Accessed page [options_name_manager.php]','info'),(356,'2019-02-19 16:12:53',1,'options_values_manager.php','','::1',0,'','��\0','Accessed page [options_values_manager.php]','info'),(357,'2019-02-19 16:12:53',1,'options_name_manager.php','','::1',0,'','��\0','Accessed page [options_name_manager.php]','info'),(358,'2019-02-19 16:12:55',1,'options_name_manager.php','','::1',0,'','��\0','Accessed page [options_name_manager.php]','info'),(359,'2019-02-19 16:12:57',1,'options_values_manager.php','','::1',0,'','��\0','Accessed page [options_values_manager.php]','info'),(360,'2019-02-19 16:12:57',1,'options_name_manager.php','','::1',0,'','��\0','Accessed page [options_name_manager.php]','info'),(361,'2019-02-19 16:12:59',1,'options_name_manager.php','','::1',0,'','��\0','Accessed page [options_name_manager.php]','info'),(362,'2019-02-19 16:13:01',1,'downloads_manager.php','','::1',0,'','��\0','Accessed page [downloads_manager.php]','info'),(363,'2019-02-19 16:13:03',1,'manufacturers.php','','::1',0,'','��\0','Accessed page [manufacturers.php]','info'),(364,'2019-02-19 16:13:06',1,'reviews.php','','::1',0,'','��\0','Accessed page [reviews.php]','info'),(365,'2019-02-19 16:13:07',1,'specials.php','','::1',0,'','��\0','Accessed page [specials.php]','info'),(366,'2019-02-19 16:13:09',1,'featured.php','','::1',0,'','��\0','Accessed page [featured.php]','info'),(367,'2019-02-19 16:13:10',1,'salemaker.php','','::1',0,'','��\0','Accessed page [salemaker.php]','info'),(368,'2019-02-19 16:13:12',1,'products_expected.php','','::1',0,'','��\0','Accessed page [products_expected.php]','info'),(369,'2019-02-19 16:13:14',1,'product.php','action=new_product&cPath=3&pID=3&product_type=1','::1',0,'','��\0','Accessed page [product.php] with action=new_product. Review page_parameters and postdata for details.','info'),(370,'2019-02-19 16:13:15',1,'product_types.php','','::1',0,'','��\0','Accessed page [product_types.php]','info'),(371,'2019-02-19 16:13:16',1,'category_product_listing.php','','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(372,'2019-02-19 16:13:18',1,'category_product_listing.php','','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(373,'2019-02-19 16:13:27',1,'category_product_listing.php','cPath=4','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(374,'2019-02-19 16:13:27',1,'categories.php','cID=4&action=edit_category_meta_tags','::1',0,'','��\0','Accessed page [categories.php] with action=edit_category_meta_tags. Review page_parameters and postdata for details.','info'),(375,'2019-02-19 16:13:30',1,'category_product_listing.php','','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(376,'2019-02-19 16:13:32',1,'category_product_listing.php','cPath=4','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(377,'2019-02-19 16:13:32',1,'category_product_listing.php','cID=4&action=move_category','::1',0,'','��\0','Accessed page [category_product_listing.php] with action=move_category. Review page_parameters and postdata for details.','info'),(378,'2019-02-19 16:13:38',1,'category_product_listing.php','cID=4','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(379,'2019-02-19 16:13:51',1,'category_product_listing.php','cPath=3','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(380,'2019-02-19 16:14:46',1,'category_product_listing.php','','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(381,'2019-02-19 16:14:49',1,'categories.php','action=new_category','::1',0,'','��\0','Accessed page [categories.php] with action=new_category. Review page_parameters and postdata for details.','info'),(382,'2019-02-19 16:14:57',1,'categories.php','action=insert_category','::1',0,'','U�K\n�0D���3��m%��һ�C��y�4Z�\"dS�Bn�$q�F9��V��zAYL��9��eh^Ԯ��5r���v^��!��<��D%[����','Accessed page [categories.php] with action=insert_category. Review page_parameters and postdata for details.','info'),(383,'2019-02-19 16:14:57',1,'category_product_listing.php','cID=5','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(384,'2019-02-19 16:14:59',1,'category_product_listing.php','cPath=5','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(385,'2019-02-19 16:16:06',1,'categories.php','cPath=5&action=new_category','::1',0,'','��\0','Accessed page [categories.php] with action=new_category. Review page_parameters and postdata for details.','info'),(386,'2019-02-19 16:16:08',1,'category_product_listing.php','cPath=5','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(387,'2019-02-19 16:16:23',1,'product.php','action=new_product','::1',0,'','�V*(�O)M.�/�,HU�R2T�QJH,�\0�M������< \'/�<�V�\0','Accessed page [product.php] with action=new_product. Review page_parameters and postdata for details.','info'),(388,'2019-02-19 16:18:04',1,'product.php','cPath=5&action=new_product_preview','::1',0,'','�S�n�0��4�\"�VU���{�{	+���\0B�{\r	�&�^\"ų��ʆ�IZ��,eU��� +\r�u`¨�d(#}qT���_iӧ�ZqpÊ�I�������bo�vg6�����\'�ٴ�O�jR����-��{��l.s��E��V����b�b��/�g����&�_���Vs8��t��ڇ���+aZ&�G`�������ۃq�ba-�$�cw`��שׂ���!_�6�W˰{2�M/�K��G��\n؍�V$O�\\���h�5S#�e�w۹��<�AlƖBʓwPc��sb��ϳ����B��e\nt����P\'�}�u�T�e������^�9�Ɯ�rN�t6����','Accessed page [product.php] with action=new_product_preview. Review page_parameters and postdata for details.','info'),(389,'2019-02-19 16:18:04',1,'product.php','cPath=5&action=new_product_preview','::1',1,'','�S�n�0��4�\"�VU���{�{	+���\0B�{\r	�&�^\"ų��ʆ�IZ��,eU��� +\r�u`¨�d(#}qT���_iӧ�ZqpÊ�I�������bo�vg6�����\'�ٴ�O�jR����-��{��l.s��E��V����b�b��/�g����&�_���Vs8��t��ڇ���+aZ&�G`�������ۃq�ba-�$�cw`��שׂ���!_�6�W˰{2�M/�K��G��\n؍�V$O�\\���h�5S#�e�w۹��<�AlƖBʓwPc��sb��ϳ����B��e\nt����P\'�}�u�T�e������^�9�Ɯ�rN�t6����','Success: File upload saved successfully 3.jpeg','notice'),(390,'2019-02-19 16:18:06',1,'product.php','cPath=5&action=insert_product','::1',0,'','�R]O�0�+���L \r!~�<F^b2�|��6M�w����n�%R|��ٹ}�r4Y��]��S�Է��$�J���L��d \'e(��O��*��9�1�eҨR�3ƒ��4X�}��Q�9X�����YΚf�<�C~-�����݊Rq�#����.z3j�S ´�2P`���4HM�Kqqa`�1�	�K7un��u��Զ�X�Svj�W���!JdS~�S��ۉ�_F$�u<m�\\C�u\r�Q�ZƎb.��`���%S|���*���/�C�0	���C8`��A�k�d�$�8�$�}����7��5�sJ\0_싅��\r��+��+��C[Λ��\"p�A�)�K�u.�I3�B1���gv�=-�>Z���7','Accessed page [product.php] with action=insert_product. Review page_parameters and postdata for details.','info'),(391,'2019-02-19 16:18:06',1,'product.php','cPath=5&action=insert_product','::1',0,'','�R]O�0�+���L \r!~�<F^b2�|��6M�w����n�%R|��ٹ}�r4Y��]��S�Է��$�J���L��d \'e(��O��*��9�1�eҨR�3ƒ��4X�}��Q�9X�����YΚf�<�C~-�����݊Rq�#����.z3j�S ´�2P`���4HM�Kqqa`�1�	�K7un��u��Զ�X�Svj�W���!JdS~�S��ۉ�_F$�u<m�\\C�u\r�Q�ZƎb.��`���%S|���*���/�C�0	���C8`��A�k�d�$�8�$�}����7��5�sJ\0_싅��\r��+��+��C[Λ��\"p�A�)�K�u.�I3�B1���gv�=-�>Z���7','New product 6 added via admin console.','info'),(392,'2019-02-19 16:18:06',1,'category_product_listing.php','cPath=5&pID=6','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(393,'2019-02-19 16:18:09',1,'product.php','cPath=5&product_type=1&pID=6&action=new_product','::1',0,'','��\0','Accessed page [product.php] with action=new_product. Review page_parameters and postdata for details.','info'),(394,'2019-02-19 16:18:19',1,'product.php','cPath=5&pID=6&action=new_product_preview','::1',0,'','�S�n�0��ϛ���6(�{ߣ�H��B���E�}e;��v����9�����h�%��M��?kI��A�0)2��PJ\'tR���9�y�͢z��爎I�J��P��j��]\"���tr�ys�r�u��}�>��v�>��C~-��O�ח�\0�p�˕��/:=V�?��m9TO�+zG��3[Q*������g���@�i�e��Ai�dtI��˔������Ē�--���q�Ҏ����k��Qm��F�o�P�D6e7<��pX(|E�@r[���b��4S\'��9^��=��hp��k��S�%~v��C[ �mYa��c�;<�0��{&��̄��j��U�{$��yR�ØRZ<��3f3.s�j�v�io�u��','Accessed page [product.php] with action=new_product_preview. Review page_parameters and postdata for details.','info'),(395,'2019-02-19 16:18:19',1,'product.php','cPath=5&pID=6&action=new_product_preview','::1',1,'','�S�n�0��ϛ���6(�{ߣ�H��B���E�}e;��v����9�����h�%��M��?kI��A�0)2��PJ\'tR���9�y�͢z��爎I�J��P��j��]\"���tr�ys�r�u��}�>��v�>��C~-��O�ח�\0�p�˕��/:=V�?��m9TO�+zG��3[Q*������g���@�i�e��Ai�dtI��˔������Ē�--���q�Ҏ����k��Qm��F�o�P�D6e7<��pX(|E�@r[���b��4S\'��9^��=��hp��k��S�%~v��C[ �mYa��c�;<�0��{&��̄��j��U�{$��yR�ØRZ<��3f3.s�j�v�io�u��','Success: File upload saved successfully 1.jpeg','notice'),(396,'2019-02-19 16:18:21',1,'product.php','cPath=5&pID=6&action=update_product','::1',0,'','�R�n�0�U�8S�h��_�{�Ě��[�,��� �^Jr[�Qt��r�����f#Z�֛Z�w��$�ڀ��L�4�z,Љ�tK���暛�~��猎ɠN��P�~6�M��I@r:9���x��9غA��QO+�V�q4�+Ɍ|2���֔���N\r8w�a��G\r\"L�,��m���r�z�)���H8�zb������8��iG]G��5�䨷�p���A�P\"��u=��1�P�d�@r[���[�����ؗEaO1�z=ر����B!o˒��Q]���b��g��L�aO`��G�;�\'VtJ�X�q�v�8�a�RO�ZoԯM�>����{�_Й豒X��T�h��G�l��`v�w�q���0uB1|^r�gvW�?kSSm�\0','Accessed page [product.php] with action=update_product. Review page_parameters and postdata for details.','info'),(397,'2019-02-19 16:18:21',1,'product.php','cPath=5&pID=6&action=update_product','::1',0,'','�R�n�0�U�8S�h��_�{�Ě��[�,��� �^Jr[�Qt��r�����f#Z�֛Z�w��$�ڀ��L�4�z,Љ�tK���暛�~��猎ɠN��P�~6�M��I@r:9���x��9غA��QO+�V�q4�+Ɍ|2���֔���N\r8w�a��G\r\"L�,��m���r�z�)���H8�zb������8��iG]G��5�䨷�p���A�P\"��u=��1�P�d�@r[���[�����ؗEaO1�z=ر����B!o˒��Q]���b��g��L�aO`��G�;�\'VtJ�X�q�v�8�a�RO�ZoԯM�>����{�_Й豒X��T�h��G�l��`v�w�q���0uB1|^r�gvW�?kSSm�\0','Updated product 6 via admin console.','info'),(398,'2019-02-19 16:18:21',1,'category_product_listing.php','cPath=5&pID=6','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(399,'2019-02-19 16:18:29',1,'product.php','cPath=5&product_type=1&pID=6&action=new_product','::1',0,'','��\0','Accessed page [product.php] with action=new_product. Review page_parameters and postdata for details.','info'),(400,'2019-02-19 16:18:34',1,'product.php','cPath=5&pID=6&action=new_product_preview','::1',0,'','�S�n�0��ϛ���6(�{ߣ�H��B���E�}e;��v����9�����h�%��M��?kI��A�0)2��PJ\'tR���9�y�͢z��爎I�J��P��j��]\"���tr�ys�r�u��}�>��v�>��C~-��O�ח�\0�p�˕��/:=V�?��m9TO�+zG��3[Q*������g���@�i�e��Ai�dtI��˔������Ē�--���q�Ҏ����k��Qm��F�o�P�D6e7<��pX(|E�@r[���b��4S\'��9^��=��hp��k��S�%~v\\���m���e�y�\"��<��#��2v�B��evW��N�I\rcJi��`̘͸����}������i���?','Accessed page [product.php] with action=new_product_preview. Review page_parameters and postdata for details.','info'),(401,'2019-02-19 16:18:34',1,'product.php','cPath=5&pID=6&action=new_product_preview','::1',1,'','�S�n�0��ϛ���6(�{ߣ�H��B���E�}e;��v����9�����h�%��M��?kI��A�0)2��PJ\'tR���9�y�͢z��爎I�J��P��j��]\"���tr�ys�r�u��}�>��v�>��C~-��O�ח�\0�p�˕��/:=V�?��m9TO�+zG��3[Q*������g���@�i�e��Ai�dtI��˔������Ē�--���q�Ҏ����k��Qm��F�o�P�D6e7<��pX(|E�@r[���b��4S\'��9^��=��hp��k��S�%~v\\���m���e�y�\"��<��#��2v�B��evW��N�I\rcJi��`̘͸����}������i���?','Success: File upload saved successfully 3.jpeg','notice'),(402,'2019-02-19 16:18:35',1,'product.php','cPath=5&pID=6&action=update_product','::1',0,'','�R�n�0�U�8��h��_�{�Ě��[�,��� �Jr[�Qt��rf��VwM֢��a�������Yi��	�\"S����IJ:��5���G?gtL\ZU�\\�\n���7�;g$�������IA�`�݇�}^��}\Z���Z2#�L�����gn�S\r�]uh���@�i�eS࠴�t�Z�_O6e�S\Z	�XO,��\"�=\'�*��(ع��6n��5C*�Ȧ����?\n��Hn�x:�����}48ľ\\�sY�;���_��P��R2��#��8~=Q��L�s��;��j{$��y⡢S�E��*\Z3fk�<���]oڟ�f}�\r�����eS�E���Jb�Rգ-��/���������s%L�����<��z����im�','Accessed page [product.php] with action=update_product. Review page_parameters and postdata for details.','info'),(403,'2019-02-19 16:18:35',1,'product.php','cPath=5&pID=6&action=update_product','::1',0,'','�R�n�0�U�8��h��_�{�Ě��[�,��� �Jr[�Qt��rf��VwM֢��a�������Yi��	�\"S����IJ:��5���G?gtL\ZU�\\�\n���7�;g$�������IA�`�݇�}^��}\Z���Z2#�L�����gn�S\r�]uh���@�i�eS࠴�t�Z�_O6e�S\Z	�XO,��\"�=\'�*��(ع��6n��5C*�Ȧ����?\n��Hn�x:�����}48ľ\\�sY�;���_��P��R2��#��8~=Q��L�s��;��j{$��y⡢S�E��*\Z3fk�<���]oڟ�f}�\r�����eS�E���Jb�Rգ-��/���������s%L�����<��z����im�','Updated product 6 via admin console.','info'),(404,'2019-02-19 16:18:35',1,'category_product_listing.php','cPath=5&pID=6','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(405,'2019-02-19 16:21:04',1,'keepalive.php','','::1',0,'','��\0','Accessed page [keepalive.php]','info'),(406,'2019-02-19 16:21:05',1,'product_types.php','','::1',0,'','��\0','Accessed page [product_types.php]','info'),(407,'2019-02-19 16:21:09',1,'category_product_listing.php','','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(408,'2019-02-19 16:21:10',1,'category_product_listing.php','cPath=2','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(409,'2019-02-19 16:21:12',1,'product.php','action=new_product','::1',0,'','�V*(�O)M.�/�,HU�R2T�QJH,�\0��������< \'/�<�V�\0','Accessed page [product.php] with action=new_product. Review page_parameters and postdata for details.','info'),(410,'2019-02-19 16:21:36',1,'product.php','cPath=2&action=new_product_preview','::1',0,'','�S�r�0���f�S�=�<+DSY&0��{�#I���i�]I�sֲӡ%C��.+��̂dU�`��+ұ;�+M�r����M�gg׈��B�G�u�H����?���Ҍ�y����3�7a�F^�>���s��]�Z�Hx���.7�\"��j��Z�1O\'Ъ�0�A�5��2�C)}�\"�J���u�#�\0&���l\\��-5�Z�(�*]�b��\0�P�8��ꖚ��\'\n��А�ֱ�cr!��bj�\\s=ԟ���#�A�:�f�Ζ�#��-�87��1�|����i�v6�!����f�0X�6O͞��$��q��<�)�ZOk���l�mv�','Accessed page [product.php] with action=new_product_preview. Review page_parameters and postdata for details.','info'),(411,'2019-02-19 16:21:36',1,'product.php','cPath=2&action=new_product_preview','::1',1,'','�S�r�0���f�S�=�<+DSY&0��{�#I���i�]I�sֲӡ%C��.+��̂dU�`��+ұ;�+M�r����M�gg׈��B�G�u�H����?���Ҍ�y����3�7a�F^�>���s��]�Z�Hx���.7�\"��j��Z�1O\'Ъ�0�A�5��2�C)}�\"�J���u�#�\0&���l\\��-5�Z�(�*]�b��\0�P�8��ꖚ��\'\n��А�ֱ�cr!��bj�\\s=ԟ���#�A�:�f�Ζ�#��-�87��1�|����i�v6�!����f�0X�6O͞��$��q��<�)�ZOk���l�mv�','Success: File upload saved successfully superman.jpeg','notice'),(412,'2019-02-19 16:21:37',1,'product.php','cPath=2&action=insert_product','::1',0,'','�R�r�0����)�������`W�	L&�^�H�@��]iW��V�B�t�}�%�I^�U��eB�HG(\"�+M��������:����T�����d�of4��2��^q�f�M�m���qPH`���]�\"]��g_-���޴�;\"Ly�ł�*�Ij���[�[��~5��,��9A7\ZW�H�Q]��~�S�mWn����:�gE�h\n��P���TԢ^C�����j4�\\9Ɔl�����������#�Ul�۷���$8W�}6`�sB*���^��\"�C�����n7��RC���}�r~�\0�N.���LN��W��<�_���o_���','Accessed page [product.php] with action=insert_product. Review page_parameters and postdata for details.','info'),(413,'2019-02-19 16:21:37',1,'product.php','cPath=2&action=insert_product','::1',0,'','�R�r�0����)�������`W�	L&�^�H�@��]iW��V�B�t�}�%�I^�U��eB�HG(\"�+M��������:����T�����d�of4��2��^q�f�M�m���qPH`���]�\"]��g_-���޴�;\"Ly�ł�*�Ij���[�[��~5��,��9A7\ZW�H�Q]��~�S�mWn����:�gE�h\n��P���TԢ^C�����j4�\\9Ɔl�����������#�Ul�۷���$8W�}6`�sB*���^��\"�C�����n7��RC���}�r~�\0�N.���LN��W��<�_���o_���','New product 7 added via admin console.','info'),(414,'2019-02-19 16:21:37',1,'category_product_listing.php','cPath=2&pID=7','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(415,'2019-02-19 16:21:39',1,'product.php','action=new_product','::1',0,'','�V*(�O)M.�/�,HU�R2T�QJH,�\0��������< \'/�<�V�\0','Accessed page [product.php] with action=new_product. Review page_parameters and postdata for details.','info'),(416,'2019-02-19 16:22:07',1,'product.php','cPath=2&action=new_product_preview','::1',0,'','�Sˎ�0����rZ8�Dnc��4	�SZ!�}����=6��LƓk���X���cq(��h!��A�qL�4J���P�h��ǡ:�ks�g�Q�I\'��a���g2��2P�Qq�-�����\'�6���ȋ���6q���P��1�p���=0�Br��]��\Z�y�_�jP �TEY� Ы�@X���֙4�B�G�D0ko`.0��U8��d�\\�,��\\�!�s+� �u�yK�?�+�WD�$�uZ�q���f�B����g7O��{�n�F�u�3v�b\n���!�M�%�?�y�4�X��/L���;�r����Rs�U�S��V�e���S,S���M�/n�','Accessed page [product.php] with action=new_product_preview. Review page_parameters and postdata for details.','info'),(417,'2019-02-19 16:22:10',1,'product.php','cPath=2&action=insert_product','::1',0,'','�Rˎ�0�΋T�{���?�ĥ���CAU�}ã]\nE{�g��sKjv&hQ�՘�,�HJ���4�	�\"��Ld�y�B�l�m��Į\\2j&��;�:K�H𓕿?�\r������]vH�,���p-��\'��nE>���Ͼ��ڷތ�;\"Ly�Հ���$�n����-�y��\Zb	`���^��+����X�]�S�k7vv	P	E�c�YR�ڕ�+#T$�:%�h�о��u��E�jƆ\\��-��������#�Ul��Y\\�|e\\*��>�Թ\"gYE/rt�!~��\r�����0�TPF�h�����?C���7�5S-��l��g�@C��3}}>^�j���','Accessed page [product.php] with action=insert_product. Review page_parameters and postdata for details.','info'),(418,'2019-02-19 16:22:51',1,'product.php','cPath=2&action=new_product_preview','::1',0,'','�Sˎ�0����rZ8�Dnc��4	�SZ!�}����=6��LƓk���X���cq(��h!��A�qL�4J���P�h��ǡ:�ks�g�Q�I\'��a���g2��2P�Qq�-�����\'�6���ȋ���6q���P��1�p���=0�Br��]��\Z�y�_�jP �TEY� Ы�@X���֙4�B�G�D0ko`.0��U8��d�\\�,��\\�!�s+� �u�yK�?�+�WD�$�uZ�q���f�B����g7O��{�n�F�u�3v�b\n���!�M�%�?�y�4�X��/L���;�r����Rs�U�S��V�e���S,S���M�/n�','Accessed page [product.php] with action=new_product_preview. Review page_parameters and postdata for details.','info'),(419,'2019-02-19 16:22:52',1,'product.php','cPath=2&action=insert_product','::1',0,'','�Rˎ�0�����p����KI��B���Xh����3v�yv:V�����\"��,AV֎	�\"�����4����ٶ�Չ�]2<S�*8N:K,H����Ɍ��@i���8�E��G�M<A%��g�/݊Br��C�c>zӪ��0�QV\nt�2f�u��o�o�.�%�K���\n�d\\�3yOM��H�J�m���J�:����?t+�wFlH�u,u��С�6�:�f�+�ؒ��j�@�u�?��R#>�ŵ�W&�����K�+R}�U�R �EW�������>/��lrpK��\Z��3�Ŀ���P1y!�<�oxd�����','Accessed page [product.php] with action=insert_product. Review page_parameters and postdata for details.','info'),(420,'2019-02-19 16:22:52',1,'product.php','cPath=2&action=insert_product','::1',0,'','�Rˎ�0�����p����KI��B���Xh����3v�yv:V�����\"��,AV֎	�\"�����4����ٶ�Չ�]2<S�*8N:K,H����Ɍ��@i���8�E��G�M<A%��g�/݊Br��C�c>zӪ��0�QV\nt�2f�u��o�o�.�%�K���\n�d\\�3yOM��H�J�m���J�:����?t+�wFlH�u,u��С�6�:�f�+�ؒ��j�@�u�?��R#>�ŵ�W&�����K�+R}�U�R �EW�������>/��lrpK��\Z��3�Ŀ���P1y!�<�oxd�����','New product 8 added via admin console.','info'),(421,'2019-02-19 16:22:52',1,'category_product_listing.php','cPath=2&pID=8','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(422,'2019-02-19 16:22:54',1,'product.php','action=new_product','::1',0,'','�V*(�O)M.�/�,HU�R2T�QJH,�\0��������< \'/�<�V�\0','Accessed page [product.php] with action=new_product. Review page_parameters and postdata for details.','info'),(423,'2019-02-19 16:23:23',1,'product.php','cPath=2&action=new_product_preview','::1',0,'','�S[��0��*���מa��$���CAU���i���3c{�����5KZ-v���B`M�֍\'�A�JPBr�\nC��Ay o׌���2xJ:k,0p���7�	������n�rSm\'�.��H��/�l깤�N��N\r>�� 1$�z5�X�������	���\r0��6/y�8�O��|+\r�0�_=CG0�A0gf�2�m�5k�r���=Ep���I��[t�1��^�!ֱ���BJ���e��v��=�Ǿi�6�t��;�1m�B�gm��I��TO�F�o�RAgB�kg3wL�u\"��f�\Z�#g�Nq���0S����2��6�V\\�\0','Accessed page [product.php] with action=new_product_preview. Review page_parameters and postdata for details.','info'),(424,'2019-02-19 16:23:24',1,'product.php','cPath=2&action=insert_product','::1',0,'','�R[��0�ʊ��\n�kϰw�L�RKy��CAU���.�����3v�5�U�,�otvʊ�3�X������:T	J�LBa�>�g[��3y�f4�R��)鬱��1�V�f&3Z@�˼8��PG�.�Ar$M��E���\\�ϡ*���ޔ�z̄U�͂���,�m�}���.]��v�j�8��\Zs�~r/��]�V��^T��9�Oǘ(�TzT��?t�WFt��:;��С�2�z��*\\\r�}L׵P�	D[�\\��\'�Ej�Ϸ�+!���k������TN�nr=fP�q�1yy(�K��ܒ�S��<}�>f��$a��݃��G2o��S�','Accessed page [product.php] with action=insert_product. Review page_parameters and postdata for details.','info'),(425,'2019-02-19 16:23:24',1,'product.php','cPath=2&action=insert_product','::1',0,'','�R[��0�ʊ��\n�kϰw�L�RKy��CAU���.�����3v�5�U�,�otvʊ�3�X������:T	J�LBa�>�g[��3y�f4�R��)鬱��1�V�f&3Z@�˼8��PG�.�Ar$M��E���\\�ϡ*���ޔ�z̄U�͂���,�m�}���.]��v�j�8��\Zs�~r/��]�V��^T��9�Oǘ(�TzT��?t�WFt��:;��С�2�z��*\\\r�}L׵P�	D[�\\��\'�Ej�Ϸ�+!���k������TN�nr=fP�q�1yy(�K��ܒ�S��<}�>f��$a��݃��G2o��S�','New product 9 added via admin console.','info'),(426,'2019-02-19 16:23:24',1,'category_product_listing.php','cPath=2&pID=9','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(427,'2019-02-19 16:23:28',1,'index.php','','::1',0,'','��\0','Accessed page [index.php]','info'),(428,'2019-02-19 16:24:19',1,'category_product_listing.php','','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(429,'2019-02-19 16:24:21',1,'category_product_listing.php','cPath=2','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(430,'2019-02-19 16:24:23',1,'product.php','cPath=2&product_type=1&pID=9&action=new_product','::1',0,'','��\0','Accessed page [product.php] with action=new_product. Review page_parameters and postdata for details.','info'),(431,'2019-02-19 16:24:41',1,'product.php','cPath=2&pID=9&action=new_product_preview','::1',0,'','�S[n�0�J�wSZU\ng���v�J6&�5E�{�# Q��w�3;�\\���\n�w�N�$M>�5		�KG��@KY,Mh/z�Bu���Ł�]\"jB��w���?w�{x~2�x8Z�\0\Z(L/����6M��~�]�H�i�<cW`#�/���5zӹ�\\�\0�>zՋn�[	Ƽ�@���LX^���\ni�O^�����є�_�� q\0�6���^�#�5V�R�ĝ(\\�&�S��1B�8{��hW\nsD����Xl�jBJ{IX3��6��=�=o&m��}.� u�.��-�z,�-�v�����ŭ�3!륳�o,u��f�\Z�#/C�w~h��˭�˰ػl��7�O�}��wr�','Accessed page [product.php] with action=new_product_preview. Review page_parameters and postdata for details.','info'),(432,'2019-02-19 16:24:43',1,'product.php','cPath=2&pID=9&action=update_product','::1',0,'','�R�n�0|����l�T�a��RK@��PP�w_�hG�h��컳}\rj6�e���1H�(xJ���2�\rZEڧb���Vi��qգ.�L��r���2Tְ\'�[����V@���5��4@�EO��qE��8��	2q�<i�U+�^\n.�����@��N�S�d�R�UYv�Z��46:��X��iC,��@(.Ѝ�=S]S�/�S�i7����گ���?�+�g��H�yJjQoe��S��h�}?\n2�O���$��?.�|\\�B|��4�&�%���<��,K��i�FW�=ܠփ����xw�!�?��s����R�^K|{q�θ�6o�6c��Lu�=�/㳙�&Q������0�Cp�','Accessed page [product.php] with action=update_product. Review page_parameters and postdata for details.','info'),(433,'2019-02-19 16:24:45',1,'index.php','','::1',0,'','��\0','Accessed page [index.php]','info'),(434,'2019-02-19 16:26:26',1,'category_product_listing.php','','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(435,'2019-02-19 16:26:34',1,'category_product_listing.php','cPath=2','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(436,'2019-02-19 16:26:36',1,'product.php','cPath=2&product_type=1&pID=9&action=new_product','::1',0,'','��\0','Accessed page [product.php] with action=new_product. Review page_parameters and postdata for details.','info'),(437,'2019-02-19 16:26:45',1,'product.php','cPath=2&pID=9&action=new_product_preview','::1',0,'','�S[n�0�J�wSZU\ng���v�J6&�5E�{�# Q��w�3;�\\���\n�w�N�$M>�5		�KG��@KY,Mh/z�Bu���Ł�]\"jB��w���?w�{x~2�x8Z�\0\Z(L/����6M��~�]�H�i�<cW`#�/���5zӹ�\\�\0�>zՋn�[	Ƽ�@���LX^���\ni�O^�����є�_�� q\0�6���^�#�5V�R�ĝ(\\�&�S��1B�8{��hW\nsD����Xl�jBJ{IX3��6��=�=o&m��}.� u�.��-�z,�-�v�����ŭ�3!륳�o,u��f�\Z�#/C�w~h��˭�˰ػl��7�O�}��wr�','Accessed page [product.php] with action=new_product_preview. Review page_parameters and postdata for details.','info'),(438,'2019-02-19 16:26:45',1,'product.php','cPath=2&pID=9&action=new_product_preview','::1',1,'','�S[n�0�J�wSZU\ng���v�J6&�5E�{�# Q��w�3;�\\���\n�w�N�$M>�5		�KG��@KY,Mh/z�Bu���Ł�]\"jB��w���?w�{x~2�x8Z�\0\Z(L/����6M��~�]�H�i�<cW`#�/���5zӹ�\\�\0�>zՋn�[	Ƽ�@���LX^���\ni�O^�����є�_�� q\0�6���^�#�5V�R�ĝ(\\�&�S��1B�8{��hW\nsD����Xl�jBJ{IX3��6��=�=o&m��}.� u�.��-�z,�-�v�����ŭ�3!륳�o,u��f�\Z�#/C�w~h��˭�˰ػl��7�O�}��wr�','Success: File upload saved successfully love you.jpeg','notice'),(439,'2019-02-19 16:26:46',1,'product.php','cPath=2&pID=9&action=update_product','::1',0,'','�R�n�0|���kU�4�<��!2ĥ�a�CAU�}�Ў�V������%��j�����(���-*�	��A��L��\0%\Z�Nir��գo�TG��Q3娜� ԏ���7%8�n4�78XR�\0�L/����6������G��3��yҭ�+�0�Ws0�A��N�S�e�R�U�7J�۟�l�[�!fm����r\'�k����t*����x��ŲO[R�ڕ�+��:%��_�}}6��\Z���EaCև�P�\0RY����O��Ј���\r�Ip�<p�����8�2l�C��q�nP�[����m|�ği�&Sne�r	^��+��t�G��0t9S-d�;o�{6O����q���\"��','Accessed page [product.php] with action=update_product. Review page_parameters and postdata for details.','info'),(440,'2019-02-19 16:26:46',1,'product.php','cPath=2&pID=9&action=update_product','::1',0,'','�R�n�0|���kU�4�<��!2ĥ�a�CAU�}�Ў�V������%��j�����(���-*�	��A��L��\0%\Z�Nir��գo�TG��Q3娜� ԏ���7%8�n4�78XR�\0�L/����6������G��3��yҭ�+�0�Ws0�A��N�S�e�R�U�7J�۟�l�[�!fm����r\'�k����t*����x��ŲO[R�ڕ�+��:%��_�}}6��\Z���EaCև�P�\0RY����O��Ј���\r�Ip�<p�����8�2l�C��q�nP�[����m|�ği�&Sne�r	^��+��t�G��0t9S-d�;o�{6O����q���\"��','Updated product 9 via admin console.','info'),(441,'2019-02-19 16:26:46',1,'category_product_listing.php','cPath=2&pID=9','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(442,'2019-02-19 16:26:49',1,'product.php','cPath=2&product_type=1&pID=8&action=new_product','::1',0,'','��\0','Accessed page [product.php] with action=new_product. Review page_parameters and postdata for details.','info'),(443,'2019-02-19 16:26:57',1,'product.php','cPath=2&pID=8&action=new_product_preview','::1',0,'','�S�n�0����1Ҧ���Hd�K-������¥7h5���s|lNQ�V�R�-Fy�F�Q\rN�U	��eB�H�RJ�)M�����E�g[�-S��YB��I��N@�[��t@\n3�fI���4ξ\'ߍ�C)������9��<�Acbw�ut�b�`W\r��%�	��A�S�e��@�Jn���?m~N�b��:��X<��A0Gf���m��֊�2���/�����e�_S����#�7$�uj�q3$��dj�ls��݀n�� ][�c.�AbGև�k�p.R]���!�M������$�v6c�%���g����:�:�q��6?δ�ZO�L��dq�{K��,�?���','Accessed page [product.php] with action=new_product_preview. Review page_parameters and postdata for details.','info'),(444,'2019-02-19 16:26:57',1,'product.php','cPath=2&pID=8&action=new_product_preview','::1',1,'','�S�n�0����1Ҧ���Hd�K-������¥7h5���s|lNQ�V�R�-Fy�F�Q\rN�U	��eB�H�RJ�)M�����E�g[�-S��YB��I��N@�[��t@\n3�fI���4ξ\'ߍ�C)������9��<�Acbw�ut�b�`W\r��%�	��A�S�e��@�Jn���?m~N�b��:��X<��A0Gf���m��֊�2���/�����e�_S����#�7$�uj�q3$��dj�ls��݀n�� ][�c.�AbGև�k�p.R]���!�M������$�v6c�%���g����:�:�q��6?δ�ZO�L��dq�{K��,�?���','Success: File upload saved successfully bell shape.jpeg','notice'),(445,'2019-02-19 16:26:59',1,'product.php','cPath=2&pID=8&action=update_product','::1',0,'','�R�n�0����Q�Mk�#�!.���8���/@�h5��}w��I�N�R��\ZLvI��%� �+Ǆ^��P�+�+M�t���m^�j���\rS��;�B���&~�/ �_\r�\r���@\n���l�fY��밇R#_=?t+��\n�����yjP��@���H)ЩҀ�J-۟�W켟�%�\0fi�N�{��4TWs�9��u/����:>���?t�)#�$�u,u�_�}}2�:�}�颰%�v-T8�d�x\\|��u��6�E>2	ΕGn 0�9\"U���Os�8����\r����l��>vy�{��h\r6Z9G/���I���xy���dj�\\}�N���i���\"�]\rs��\rV��','Accessed page [product.php] with action=update_product. Review page_parameters and postdata for details.','info'),(446,'2019-02-19 16:26:59',1,'product.php','cPath=2&pID=8&action=update_product','::1',0,'','�R�n�0����Q�Mk�#�!.���8���/@�h5��}w��I�N�R��\ZLvI��%� �+Ǆ^��P�+�+M�t���m^�j���\rS��;�B���&~�/ �_\r�\r���@\n���l�fY��밇R#_=?t+��\n�����yjP��@���H)ЩҀ�J-۟�W켟�%�\0fi�N�{��4TWs�9��u/����:>���?t�)#�$�u,u�_�}}2�:�}�颰%�v-T8�d�x\\|��u��6�E>2	ΕGn 0�9\"U���Os�8����\r����l��>vy�{��h\r6Z9G/���I���xy���dj�\\}�N���i���\"�]\rs��\rV��','Updated product 8 via admin console.','info'),(447,'2019-02-19 16:26:59',1,'category_product_listing.php','cPath=2&pID=8','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(448,'2019-02-19 16:27:00',1,'index.php','','::1',0,'','��\0','Accessed page [index.php]','info'),(449,'2019-02-19 16:30:02',1,'keepalive.php','','::1',0,'','��\0','Accessed page [keepalive.php]','info'),(450,'2019-02-19 16:45:03',0,'login.php ','camefrom=logoff.php','::1',0,'','��\0','Accessed page [login.php]','info'),(451,'2019-02-19 19:45:31',0,'login.php ','camefrom=index.php','::1',0,'','��\0','Accessed page [login.php]','info'),(452,'2019-02-19 19:45:35',0,'login.php keongsang','camefrom=index.php','::1',0,'','�VJL.���S�RJ�7JN52J36J6��453�40M�H5I�0NI63LJ4T�QJL��̋�K�M��N��K/N�KJ�&�f�\0�!�Z\0','Accessed page [login.php] with action=do2ce22f32c489566905c8e4f83dc61ba1. Review page_parameters and postdata for details.','info'),(453,'2019-02-19 19:45:35',1,'index.php','','::1',0,'','��\0','Accessed page [index.php]','info'),(454,'2019-02-19 19:54:08',1,'keepalive.php','','::1',0,'','��\0','Accessed page [keepalive.php]','info'),(455,'2019-02-19 19:54:10',1,'category_product_listing.php','','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(456,'2019-02-19 19:54:12',1,'category_product_listing.php','cPath=3','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(457,'2019-02-19 19:54:15',1,'product.php','cPath=3&product_type=1&pID=4&action=new_product','::1',0,'','��\0','Accessed page [product.php] with action=new_product. Review page_parameters and postdata for details.','info'),(458,'2019-02-19 19:54:20',1,'product.php','cPath=3&pID=4&action=new_product_preview','::1',0,'','�S[��0�\n�7���]-\\&2�)�Ҥ8N!�i˳m��z��8gհ7�-��Z�j�j��K�<M&��R��P(}t���cQo��cD�T��Qǚ-��=#���pU��9i��Y�؎����\"�E�wq�DF���~�vP��s�r�<W���^��R���-�ڷ��ޜ4�0m�LL8��B�\n����{p�b��_j-�D�S�`p\Z�밣�!W�9�r��`�>�J�&e_���	�+\":��<5�L��P25B��r��Y:]^v��㮉O�7ع��+��cJ��\n��v�$���*---= I�xշ�&������	#��/�H�N��uOa�m���7�w�_��X�Y���~�y�.','Accessed page [product.php] with action=new_product_preview. Review page_parameters and postdata for details.','info'),(459,'2019-02-19 19:54:21',1,'product.php','cPath=3&pID=4&action=update_product','::1',0,'','��[��0E�R��V�hF�n&2$��BB����}£�h_�qoQEV������Qm�+9�*,�re(}��H;!��֛g_�Z\'�在s%�� ԩ��8|�c`�FG���\'5��Lw�i�vI�K�޸�\'�ٓ�����[�^��mw���J���	3ϋ���5�Qj��9ِ� ��x�Z����\"�+����XUh���[��fet�1 �dx��4�)�\r�N���k�E��J��NJ�h}�o	E7MK���*D�FXa�hh�nP�g���+!�����v�W�ř穻5/�_G)���*��.9l��c�{L�w�@�܂�>�2���&�rњ�gt��w��OhO�AMΗs��','Accessed page [product.php] with action=update_product. Review page_parameters and postdata for details.','info'),(460,'2019-02-19 19:54:21',1,'product.php','cPath=3&pID=4&action=update_product','::1',0,'','��[��0E�R��V�hF�n&2$��BB����}£�h_�qoQEV������Qm�+9�*,�re(}��H;!��֛g_�Z\'�在s%�� ԩ��8|�c`�FG���\'5��Lw�i�vI�K�޸�\'�ٓ�����[�^��mw���J���	3ϋ���5�Qj��9ِ� ��x�Z����\"�+����XUh���[��fet�1 �dx��4�)�\r�N���k�E��J��NJ�h}�o	E7MK���*D�FXa�hh�nP�g���+!�����v�W�ř穻5/�_G)���*��.9l��c�{L�w�@�܂�>�2���&�rњ�gt��w��OhO�AMΗs��','Updated product 4 via admin console.','info'),(461,'2019-02-19 19:54:21',1,'category_product_listing.php','cPath=3&pID=4','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(462,'2019-02-19 19:54:23',1,'index.php','','::1',0,'','��\0','Accessed page [index.php]','info'),(463,'2019-02-19 20:02:27',1,'keepalive.php','','::1',0,'','��\0','Accessed page [keepalive.php]','info'),(464,'2019-02-19 20:02:30',1,'category_product_listing.php','','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(465,'2019-02-19 20:02:34',1,'category_product_listing.php','cPath=4','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(466,'2019-02-19 20:02:34',1,'category_product_listing.php','cID=4&action=move_category','::1',0,'','��\0','Accessed page [category_product_listing.php] with action=move_category. Review page_parameters and postdata for details.','info'),(467,'2019-02-19 20:02:37',1,'product_types.php','','::1',0,'','��\0','Accessed page [product_types.php]','info'),(468,'2019-02-19 20:02:41',1,'modules.php','set=payment','::1',0,'','��\0','Accessed page [modules.php]','info'),(469,'2019-02-19 20:02:43',1,'category_product_listing.php','','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(470,'2019-02-19 20:03:34',1,'orders.php','','::1',0,'','��\0','Accessed page [orders.php]','info'),(471,'2019-02-19 20:03:36',1,'customers.php','','::1',0,'','��\0','Accessed page [customers.php]','info'),(472,'2019-02-19 20:03:44',1,'stats_customers.php','','::1',0,'','��\0','Accessed page [stats_customers.php]','info'),(473,'2019-02-19 20:03:46',1,'customers.php','cID=1','::1',0,'','��\0','Accessed page [customers.php]','info'),(474,'2019-02-19 20:03:46',1,'customers.php','cID=1','::1',0,'','��\0','Accessed page [customers.php]','info'),(475,'2019-02-19 20:03:49',1,'customers.php','page=1&cID=1&action=edit','::1',0,'','��\0','Accessed page [customers.php] with action=edit. Review page_parameters and postdata for details.','info'),(476,'2019-02-19 20:03:51',1,'customers.php','cID=1','::1',0,'','��\0','Accessed page [customers.php]','info'),(477,'2019-02-19 20:03:52',1,'index.php','','::1',0,'','��\0','Accessed page [index.php]','info'),(478,'2019-02-19 20:14:50',1,'keepalive.php','','::1',0,'','��\0','Accessed page [keepalive.php]','info'),(479,'2019-02-19 20:14:51',1,'keepalive.php','','::1',0,'','��\0','Accessed page [keepalive.php]','info'),(480,'2019-02-19 20:14:54',1,'customers.php','','::1',0,'','��\0','Accessed page [customers.php]','info'),(481,'2019-02-19 20:14:55',1,'index.php','','::1',0,'','��\0','Accessed page [index.php]','info'),(482,'2019-02-19 20:15:02',1,'customers.php','','::1',0,'','��\0','Accessed page [customers.php]','info'),(483,'2019-02-19 20:15:07',1,'stats_customers.php','','::1',0,'','��\0','Accessed page [stats_customers.php]','info'),(484,'2019-02-19 20:15:08',1,'customers.php','cID=1','::1',0,'','��\0','Accessed page [customers.php]','info'),(485,'2019-02-19 20:15:08',1,'customers.php','cID=1','::1',0,'','��\0','Accessed page [customers.php]','info'),(486,'2019-02-19 20:15:09',1,'customers.php','page=1&cID=1&action=edit','::1',0,'','��\0','Accessed page [customers.php] with action=edit. Review page_parameters and postdata for details.','info'),(487,'2019-02-19 20:15:11',1,'template_select.php','','::1',0,'','��\0','Accessed page [template_select.php]','info'),(488,'2019-02-19 20:15:12',1,'index.php','','::1',0,'','��\0','Accessed page [index.php]','info'),(489,'2019-02-19 20:15:19',1,'modules.php','set=payment','::1',0,'','��\0','Accessed page [modules.php]','info'),(490,'2019-02-19 20:15:29',1,'countries.php','','::1',0,'','��\0','Accessed page [countries.php]','info'),(491,'2019-02-19 20:15:32',1,'currencies.php','','::1',0,'','��\0','Accessed page [currencies.php]','info'),(492,'2019-02-19 20:15:33',1,'stats_customers_referrals.php','','::1',0,'','��\0','Accessed page [stats_customers_referrals.php]','info'),(493,'2019-02-19 20:15:34',1,'template_select.php','','::1',0,'','��\0','Accessed page [template_select.php]','info'),(494,'2019-02-19 20:15:35',1,'coupon_admin.php','','::1',0,'','��\0','Accessed page [coupon_admin.php]','info'),(495,'2019-02-19 20:15:40',1,'coupon_admin.php','page=0&action=new','::1',0,'','��\0','Accessed page [coupon_admin.php] with action=new. Review page_parameters and postdata for details.','info'),(496,'2019-02-19 20:15:46',1,'index.php','','::1',0,'','��\0','Accessed page [index.php]','info'),(497,'2019-02-19 20:18:09',1,'keepalive.php','','::1',0,'','��\0','Accessed page [keepalive.php]','info'),(498,'2019-02-19 20:19:10',1,'customers.php','','::1',0,'','��\0','Accessed page [customers.php]','info'),(499,'2019-02-19 20:19:12',1,'modules.php','set=ordertotal','::1',0,'','��\0','Accessed page [modules.php]','info'),(500,'2019-02-19 20:19:14',1,'modules.php','set=shipping','::1',0,'','��\0','Accessed page [modules.php]','info'),(501,'2019-02-19 20:19:16',1,'index.php','','::1',0,'','��\0','Accessed page [index.php]','info'),(502,'2019-02-19 20:19:19',1,'modules.php','set=ordertotal','::1',0,'','��\0','Accessed page [modules.php]','info'),(503,'2019-02-19 20:19:20',1,'modules.php','set=shipping','::1',0,'','��\0','Accessed page [modules.php]','info'),(504,'2019-02-19 20:19:31',1,'configuration.php','gID=7','::1',0,'','��\0','Accessed page [configuration.php]','info'),(505,'2019-02-19 20:20:08',1,'configuration.php','gID=5','::1',0,'','��\0','Accessed page [configuration.php]','info'),(506,'2019-02-19 20:20:10',1,'configuration.php','gID=7','::1',0,'','��\0','Accessed page [configuration.php]','info'),(507,'2019-02-19 20:20:25',1,'configuration.php','gID=24','::1',0,'','��\0','Accessed page [configuration.php]','info'),(508,'2019-02-19 20:20:36',1,'index.php','','::1',0,'','��\0','Accessed page [index.php]','info'),(509,'2019-02-19 20:31:30',1,'keepalive.php','','::1',0,'','��\0','Accessed page [keepalive.php]','info'),(510,'2019-02-19 20:31:31',1,'keepalive.php','','::1',0,'','��\0','Accessed page [keepalive.php]','info'),(511,'2019-02-19 20:31:35',1,'customers.php','','::1',0,'','��\0','Accessed page [customers.php]','info'),(512,'2019-02-19 20:31:37',1,'modules.php','set=payment','::1',0,'','��\0','Accessed page [modules.php]','info'),(513,'2019-02-19 20:32:09',1,'coupon_admin.php','','::1',0,'','��\0','Accessed page [coupon_admin.php]','info'),(514,'2019-02-19 20:32:10',1,'layout_controller.php','','::1',0,'','��\0','Accessed page [layout_controller.php]','info'),(515,'2019-02-19 20:32:12',1,'template_select.php','','::1',0,'','��\0','Accessed page [template_select.php]','info'),(516,'2019-02-19 20:32:13',1,'stats_customers.php','','::1',0,'','��\0','Accessed page [stats_customers.php]','info'),(517,'2019-02-19 20:32:14',1,'currencies.php','','::1',0,'','��\0','Accessed page [currencies.php]','info'),(518,'2019-02-19 20:32:17',1,'countries.php','','::1',0,'','��\0','Accessed page [countries.php]','info'),(519,'2019-02-19 20:32:19',1,'languages.php','','::1',0,'','��\0','Accessed page [languages.php]','info'),(520,'2019-02-19 20:32:21',1,'languages.php','page=1&lID=1&action=edit','::1',0,'','��\0','Accessed page [languages.php] with action=edit. Review page_parameters and postdata for details.','info'),(521,'2019-02-19 20:32:24',1,'languages.php','page=1&lID=1','::1',0,'','��\0','Accessed page [languages.php]','info'),(522,'2019-02-19 20:32:25',1,'languages.php','page=1&lID=1&action=new','::1',0,'','��\0','Accessed page [languages.php] with action=new. Review page_parameters and postdata for details.','info'),(523,'2019-02-19 20:32:38',1,'languages.php','page=1&lID=1','::1',0,'','��\0','Accessed page [languages.php]','info'),(524,'2019-02-19 20:32:40',1,'languages.php','page=1&lID=1&action=edit','::1',0,'','��\0','Accessed page [languages.php] with action=edit. Review page_parameters and postdata for details.','info'),(525,'2019-02-19 20:32:44',1,'languages.php','page=1&lID=1','::1',0,'','��\0','Accessed page [languages.php]','info'),(526,'2019-02-19 20:32:49',1,'index.php','','::1',0,'','��\0','Accessed page [index.php]','info'),(527,'2019-02-19 20:47:04',1,'keepalive.php','','::1',0,'','��\0','Accessed page [keepalive.php]','info'),(528,'2019-02-19 20:47:05',1,'keepalive.php','','::1',0,'','��\0','Accessed page [keepalive.php]','info'),(529,'2019-02-19 20:47:11',1,'index.php','','::1',0,'','��\0','Accessed page [index.php]','info'),(530,'2019-02-19 20:47:55',1,'index.php','','::1',0,'','��\0','Accessed page [index.php]','info'),(531,'2019-02-19 20:51:27',1,'keepalive.php','','::1',0,'','��\0','Accessed page [keepalive.php]','info'),(532,'2019-02-19 20:51:40',1,'stats_products_purchased.php','','::1',0,'','��\0','Accessed page [stats_products_purchased.php]','info'),(533,'2019-02-19 20:51:42',1,'stats_products_viewed.php','','::1',0,'','��\0','Accessed page [stats_products_viewed.php]','info'),(534,'2019-02-19 20:51:56',1,'orders.php','','::1',0,'','��\0','Accessed page [orders.php]','info'),(535,'2019-02-19 20:51:57',1,'group_pricing.php','','::1',0,'','��\0','Accessed page [group_pricing.php]','info'),(536,'2019-02-19 20:52:00',1,'index.php','','::1',0,'','��\0','Accessed page [index.php]','info'),(537,'2019-02-19 20:52:01',1,'index.php','','::1',0,'','��\0','Accessed page [index.php]','info'),(538,'2019-02-19 20:52:01',1,'index.php','','::1',0,'','��\0','Accessed page [index.php]','info'),(539,'2019-02-19 21:02:42',1,'keepalive.php','','::1',0,'','��\0','Accessed page [keepalive.php]','info'),(540,'2019-02-19 21:02:43',1,'keepalive.php','','::1',0,'','��\0','Accessed page [keepalive.php]','info'),(541,'2019-02-19 21:09:20',1,'keepalive.php','','::1',0,'','��\0','Accessed page [keepalive.php]','info'),(542,'2019-02-19 21:10:50',1,'category_product_listing.php','','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(543,'2019-02-19 21:10:53',1,'category_product_listing.php','cPath=1','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(544,'2019-02-19 21:10:55',1,'categories.php','cPath=1&action=new_category','::1',0,'','��\0','Accessed page [categories.php] with action=new_category. Review page_parameters and postdata for details.','info'),(545,'2019-02-19 21:10:56',1,'category_product_listing.php','cPath=1','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(546,'2019-02-19 21:10:57',1,'product.php','action=new_product','::1',0,'','�V*(�O)M.�/�,HU�R2T�QJH,ɀ��K2�󀜼��x�Z�Z\0','Accessed page [product.php] with action=new_product. Review page_parameters and postdata for details.','info'),(547,'2019-02-19 21:12:01',1,'product.php','cPath=1&action=new_product_preview','::1',0,'','�S�n�0���u��=�oA���KiR��>sg\rhR_�c��\'���`S#F���*>�� ����ѐUH�kr4�b���M߂fšg�L\r�Xy�X��R=U��-��ڝg�jQVU9�����F#_�Ξ�=tZsЖ:���*G��\r8�R�5�`@��N�M.�7��xՐ�kp��o��c�m�%��Ձ��p�n���|;���`���M/�)����#�_�3��ɓ���h�6;*Ɔ�\n�vYS��WS[F�A;�I��V��9Y��?]��0���n�ڞqK!�u:h�Rתa���q���~۰E�1	�	.�\'���\'�{�hvH�Z2��3��0{Hg�[{�����YY-��/','Accessed page [product.php] with action=new_product_preview. Review page_parameters and postdata for details.','info'),(548,'2019-02-19 21:12:03',1,'product.php','cPath=1&action=insert_product','::1',0,'','�R�n�0|�����V�{���Z\n�9�U}����&�O|��ٹcҰ��#}��w�%IA�M��g�`�*�ȕ��P�X���Y���WcF�T�	�Ug���j��1�9��Yq�f�e�-��ฎ;($2�����m(��<Wp�7k�ހSe2�@g\n�*5m���k:p�>�	�K7u�\0�ź	{j\Z�˱܏�&����~\"�BJ�l�G+��c@7QxeĚd^���:�Wޢ�al�G�l%^@�J��.Z7ڈ��-�Ip,p��c�R��I�4��9\'��g�0ݐ�t�̶ϔ\Z*upT*uz��P05B��Ყ�ГS��vċ&2���=�{��ӆВ��ϭ7�۰�Mr�','Accessed page [product.php] with action=insert_product. Review page_parameters and postdata for details.','info'),(549,'2019-02-19 21:14:55',1,'keepalive.php','','::1',0,'','��\0','Accessed page [keepalive.php]','info'),(550,'2019-02-19 21:15:01',1,'product.php','cPath=1&action=new_product_preview','::1',0,'','�S�n�0���1Q���Dnc���)�S�!�}���\ZФ����9�ONY���R�-f�Y�}d5A6%V�	�!��\"Sr0�B�cs/[�͎}=�h�J4���̱  1LR=U���A�.��U�]��r��*n�J��<�]?W7Pk�I[��;`(�<�\rp����K����\"J2�@oJaҐ�kp�n�bB�u�����a���������d0��߬����VO]S�_�	�ߌؐ�穩G�C��\n��v�SX�WP��vċ62����x��󶵷�f�m;�QSC�#Hu�^�ۏ�U���Y}�|d������\'�{a�`�H�^��ח���߭�.����z�o��/','Accessed page [product.php] with action=new_product_preview. Review page_parameters and postdata for details.','info'),(551,'2019-02-19 21:15:01',1,'product.php','cPath=1&action=new_product_preview','::1',1,'','�S�n�0���1Q���Dnc���)�S�!�}���\ZФ����9�ONY���R�-f�Y�}d5A6%V�	�!��\"Sr0�B�cs/[�͎}=�h�J4���̱  1LR=U���A�.��U�]��r��*n�J��<�]?W7Pk�I[��;`(�<�\rp����K����\"J2�@oJaҐ�kp�n�bB�u�����a���������d0��߬����VO]S�_�	�ߌؐ�穩G�C��\n��v�SX�WP��vċ62����x��󶵷�f�m;�QSC�#Hu�^�ۏ�U���Y}�|d������\'�{a�`�H�^��ח���߭�.����z�o��/','Success: File upload saved successfully 스크린샷 2019-02-19 오후 9.08.54.png','notice'),(552,'2019-02-19 21:15:03',1,'product.php','cPath=1&action=insert_product','::1',0,'','�R�n�0|�(�J��}�J�&^�JN��|���b�Ф�Rd9;��Y{>��ަV��/e]>�=DA6-v�	�!��\"r4�b����V=͆}?f�M��:c,\nH�+�3Ռ���ƝU����lYe�C�@+��/n�nCQ]���ڂs?z��9\Zaj�L8��A�HM۵�\\M���8�vĒ�M݁���l��-�@C7�{��i�����%������4�ƀ�D�;#\r$�uz:�}��뽷�F�\n�;�Io��� ��f��?Z7ڈ_��w�{&����{\n�u�H�V&��D��d:���<]�^����{�\0�:�P*�yߋ�e\nB~�ⲥX��P7��\0�\"$�\r!Ͽ�\'v?{���T�����]���n����Bsc>g���6J���yΜz��X��տ���<h�>�','Accessed page [product.php] with action=insert_product. Review page_parameters and postdata for details.','info'),(553,'2019-02-19 21:15:03',1,'product.php','cPath=1&action=insert_product','::1',0,'','�R�n�0|�(�J��}�J�&^�JN��|���b�Ф�Rd9;��Y{>��ަV��/e]>�=DA6-v�	�!��\"r4�b����V=͆}?f�M��:c,\nH�+�3Ռ���ƝU����lYe�C�@+��/n�nCQ]���ڂs?z��9\Zaj�L8��A�HM۵�\\M���8�vĒ�M݁���l��-�@C7�{��i�����%������4�ƀ�D�;#\r$�uz:�}��뽷�F�\n�;�Io��� ��f��?Z7ڈ_��w�{&����{\n�u�H�V&��D��d:���<]�^����{�\0�:�P*�yߋ�e\nB~�ⲥX��P7��\0�\"$�\r!Ͽ�\'v?{���T�����]���n����Bsc>g���6J���yΜz��X��տ���<h�>�','New product 10 added via admin console.','info'),(554,'2019-02-19 21:15:03',1,'category_product_listing.php','cPath=1&pID=10','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(555,'2019-02-19 21:15:14',1,'product.php','cPath=1&product_type=1&pID=10&action=new_product','::1',0,'','��\0','Accessed page [product.php] with action=new_product. Review page_parameters and postdata for details.','info'),(556,'2019-02-19 21:15:31',1,'product.php','cPath=1&pID=10&action=new_product_preview','::1',0,'','�S펂@|��������l\n�b���n���~ˇ�������t��DCV��%_-2������&Y\0��j\'Q���BWX_?�Ay [�\ra����Bl����M���[�MZ@��x7I�_��z���k��=i\ZEo��5T!�Jf\"�r��G����0h�?�]��g�u0�mCJ�W	̄��+Yp��e�{#�J����i�Ebf)���~��4X�s�_en/�>y�Ē\n�Pa�.�W���?�Tx��5Ӯ lm��E�`<��_�y��*ݹ��n��0�\n�nQ�[�f��h\'���+n��+�U���\n=>(5�9s�j:���nOa���<Z|�ᬱ<����t[�ן�R���6i��d+�','Accessed page [product.php] with action=new_product_preview. Review page_parameters and postdata for details.','info'),(557,'2019-02-19 21:15:33',1,'product.php','cPath=1&pID=10&action=update_product','::1',0,'','�Rю�0�³�39��fi+n��nQ���W@=��������^Æ�r�w��0\r7a�5		�C��@u/��V(�Ҹ��KV��H��#\ZB��5�|m���M���]�zOZ����&�!J�h��kwɎ4�Mo�����gn�W	e�֡y\'��0w���\"d	�.����l�� c�\0��Z$vP.-By�n�/�	��b��Ý��e%�5��R~�֟pY(�\"\\���S�E�����2J�c��[4��[A�\\v���C��;�ō�abU�����\0��~�̴�΄��#�?�˟5\'�G���8����Tjzbu�f�>KvSl\r��r�^�0�\"���U\0HA���ߦ����\r��,>�\r����������\\o','Accessed page [product.php] with action=update_product. Review page_parameters and postdata for details.','info'),(558,'2019-02-19 21:15:33',1,'product.php','cPath=1&pID=10&action=update_product','::1',0,'','�Rю�0�³�39��fi+n��nQ���W@=��������^Æ�r�w��0\r7a�5		�C��@u/��V(�Ҹ��KV��H��#\ZB��5�|m���M���]�zOZ����&�!J�h��kwɎ4�Mo�����gn�W	e�֡y\'��0w���\"d	�.����l�� c�\0��Z$vP.-By�n�/�	��b��Ý��e%�5��R~�֟pY(�\"\\���S�E�����2J�c��[4��[A�\\v���C��;�ō�abU�����\0��~�̴�΄��#�?�˟5\'�G���8����Tjzbu�f�>KvSl\r��r�^�0�\"���U\0HA���ߦ����\r��,>�\r����������\\o','Updated product 10 via admin console.','info'),(559,'2019-02-19 21:15:33',1,'category_product_listing.php','cPath=1&pID=10','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(560,'2019-02-19 21:15:40',1,'product.php','cPath=1&product_type=1&pID=10&action=new_product','::1',0,'','��\0','Accessed page [product.php] with action=new_product. Review page_parameters and postdata for details.','info'),(561,'2019-02-19 21:15:45',1,'product.php','cPath=1&pID=10&action=new_product_preview','::1',0,'','�S펂@|�o%�gr�2���b���n���~ˇ�������t��㚬��j�,^�%8�$$�.,�v�\Z�N(t��j�K?ől9GԄRg)��v���\"{��\r�4�r��n�l�β�6�W��=i\ZDo���!�J�����\"@�jOxĠ�1�� ]Ϛk�J0�mCJ�7̄��+W!\r�A�2���UY�:�4� �����^�p\'�k��9�o\"��N�=T�bI�e(����+�WȟyJ���i\'	kF[=�\'tQx��L&�W|^��J������>L��b\\�t���Q�O��d�����U�ev��<5z�m4]Y�y{l��0��d���p�X�x�l{9�����.D���I����6~�','Accessed page [product.php] with action=new_product_preview. Review page_parameters and postdata for details.','info'),(562,'2019-02-19 21:15:45',1,'product.php','cPath=1&pID=10&action=new_product_preview','::1',1,'','�S펂@|�o%�gr�2���b���n���~ˇ�������t��㚬��j�,^�%8�$$�.,�v�\Z�N(t��j�K?ől9GԄRg)��v���\"{��\r�4�r��n�l�β�6�W��=i\ZDo���!�J�����\"@�jOxĠ�1�� ]Ϛk�J0�mCJ�7̄��+W!\r�A�2���UY�:�4� �����^�p\'�k��9�o\"��N�=T�bI�e(����+�WȟyJ���i\'	kF[=�\'tQx��L&�W|^��J������>L��b\\�t���Q�O��d�����U�ev��<5z�m4]Y�y{l��0��d���p�X�x�l{9�����.D���I����6~�','Success: File upload saved successfully 스크린샷 2019-02-19 오후 9.08.54.png','notice'),(563,'2019-02-19 21:15:46',1,'product.php','cPath=1&pID=10&action=update_product','::1',0,'','�R�n�0���]���2)2$���P��eU�}!��VC(��c���%n�(W��s��M,ⷸ˚d�KC��Du��V*��q�#/}�[2��ZZC��ǖ�$��a����$�\0XA^u�Y*�!�4o�\nv��&:�˖h�=Q�y���\n����	sǳ6N���ި���;�{/�X\0���Ts�P���v�m�M9���Y���bt{\r��R~�56�!�4c#\\����ƓV��Sm���J�8?�\Z�ǲ�l!�Q�Nүd���~o1֥�:�����cg��H�z��c�Á)�Qc������۟]}�M�B���؈�&]�\r�^��k��9��?ZE���p���uXZۂ�e4�=�wh#�?�NF鎪{����\"]w��2�ہ�\nvx!�C~�hѠ�\r���Y��hY�_','Accessed page [product.php] with action=update_product. Review page_parameters and postdata for details.','info'),(564,'2019-02-19 21:15:46',1,'product.php','cPath=1&pID=10&action=update_product','::1',0,'','�R�n�0���]���2)2$���P��eU�}!��VC(��c���%n�(W��s��M,ⷸ˚d�KC��Du��V*��q�#/}�[2��ZZC��ǖ�$��a����$�\0XA^u�Y*�!�4o�\nv��&:�˖h�=Q�y���\n����	sǳ6N���ި���;�{/�X\0���Ts�P���v�m�M9���Y���bt{\r��R~�56�!�4c#\\����ƓV��Sm���J�8?�\Z�ǲ�l!�Q�Nүd���~o1֥�:�����cg��H�z��c�Á)�Qc������۟]}�M�B���؈�&]�\r�^��k��9��?ZE���p���uXZۂ�e4�=�wh#�?�NF鎪{����\"]w��2�ہ�\nvx!�C~�hѠ�\r���Y��hY�_','Updated product 10 via admin console.','info'),(565,'2019-02-19 21:15:46',1,'category_product_listing.php','cPath=1&pID=10','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(566,'2019-02-19 21:16:04',1,'category_product_listing.php','','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(567,'2019-02-19 21:16:10',1,'category_product_listing.php','cPath=3','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(568,'2019-02-19 21:16:26',1,'category_product_listing.php','cID=3','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(569,'2019-02-19 21:16:27',1,'categories.php','action=new_category','::1',0,'','��\0','Accessed page [categories.php] with action=new_category. Review page_parameters and postdata for details.','info'),(570,'2019-02-19 21:16:43',1,'categories.php','action=insert_category','::1',0,'','U�A\n�0�Rt�!�7�����H���\n�z\n�{�Bs��Yv����p�B��?)��#xM����p�⺘l.Z~f7$�Hb=�tɘ8f,\\��\"�+{������Q���_','Accessed page [categories.php] with action=insert_category. Review page_parameters and postdata for details.','info'),(571,'2019-02-19 21:16:43',1,'category_product_listing.php','cID=6','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(572,'2019-02-19 21:16:46',1,'category_product_listing.php','cPath=6','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(573,'2019-02-19 21:16:47',1,'product.php','action=new_product','::1',0,'','�V*(�O)M.�/�,HU�R2T�QJH,�\0�̀�����< \'/�<�V�\0','Accessed page [product.php] with action=new_product. Review page_parameters and postdata for details.','info'),(574,'2019-02-19 21:18:22',1,'product.php','cPath=6&action=new_product_preview','::1',0,'','�S�n�0���$pR졽v?���X�MT����E�}�G��n�����8�_E���J�t-/ŶX� �\n���Q��PF&rԆb����A}��挖�B�:s,\nH����;�\rG {�Wܕ���v�~*�>���ȓ��m��s��/�k�}�QOU�	����)f�8{S���_�a��� ´O�h��YW�$k��k��)�_\ZTs�q�o�#�$�K�`OЍ�ul�m�����}8?h�G/�)�MG�8/*�3�\'y\\����l�S+��5i(��UK�6��|�����ތqu �*�!��Y���x�b�\ZEj\\)�i}��;^�V���̈́���e���A;[���H!e��B#H��[��o�x��pD>1	�;3r�q�y���Ҭ;�\'���Ŗ��\rZl�i��[V������','Accessed page [product.php] with action=new_product_preview. Review page_parameters and postdata for details.','info'),(575,'2019-02-19 21:18:24',1,'product.php','cPath=6&action=insert_product','::1',0,'','�R�j�0|��I�Sz���{���X{9}��U���O��4�F;����|�j��wX�U�*DA�56�	�&�����Q�uH��V>����3:�\Zu�u�X��V���f4�,�져-��uU���ѱO{�%1�����[S�.p�s��`�ތ��\ZD�vI\n�tm!������,���߂bI`�������Rבo����]8=X�{/�)�M~VG�8-�ɓ<�qtB���{q����c<PHy�\Z�@rM�_��s#^�\'��L�s�;d�:G���Es0�I�ch�8��r��^n)\\v�-��S����z���6H(�n��X3uB�_Z����W/[7��|������Lu�\'�*�Cb��W�#/Ō� j\\�JAn����ju������^l��o\r��R����\'~.��','Accessed page [product.php] with action=insert_product. Review page_parameters and postdata for details.','info'),(576,'2019-02-19 21:18:29',1,'product.php','cPath=6&action=new_product_preview','::1',0,'','�S�n�0���$pR졽v?���X�MT����E�}�G��n�����8�_E���J�t-/ŶX� �\n���Q��PF&rԆb����A}��挖�B�:s,\nH����;�\rG {�Wܕ���v�~*�>���ȓ��m��s��/�k�}�QOU�	����)f�8{S���_�a��� ´O�h��YW�$k��k��)�_\ZTs�q�o�#�$�K�`OЍ�ul�m�����}8?h�G/�)�MG�8/*�3�\'y\\����l�S+��5i(��UK�6��|�����ތqu �*�!��Y���x�b�\ZEj\\)�i}��;^�V���̈́���e���A;[���H!e��B#H��[��o�x��pD>1	�;3r�q�y���Ҭ;�\'���Ŗ��\rZl�i��[V������','Accessed page [product.php] with action=new_product_preview. Review page_parameters and postdata for details.','info'),(577,'2019-02-19 21:18:29',1,'product.php','cPath=6&action=new_product_preview','::1',1,'','�S�n�0���$pR졽v?���X�MT����E�}�G��n�����8�_E���J�t-/ŶX� �\n���Q��PF&rԆb����A}��挖�B�:s,\nH����;�\rG {�Wܕ���v�~*�>���ȓ��m��s��/�k�}�QOU�	����)f�8{S���_�a��� ´O�h��YW�$k��k��)�_\ZTs�q�o�#�$�K�`OЍ�ul�m�����}8?h�G/�)�MG�8/*�3�\'y\\����l�S+��5i(��UK�6��|�����ތqu �*�!��Y���x�b�\ZEj\\)�i}��;^�V���̈́���e���A;[���H!e��B#H��[��o�x��pD>1	�;3r�q�y���Ҭ;�\'���Ŗ��\rZl�i��[V������','Success: File upload saved successfully photo(1).jpeg','notice'),(578,'2019-02-19 21:18:30',1,'product.php','cPath=6&action=insert_product','::1',0,'','�Rю�0�+O�(�ԇ���3N�{I�u��z\r����:	p����3㙵��8�dDK�a�RTŪh!\n�6 X&��l�2r&Gm)���UV>��C;gtLu�}�X��Q>��a4����-��uU���1�O{0���v���s\n�����2�ջ^��.�bA��6��j)�7?��k1N�-x �n��)��\ru�z��&�ޅӃ�{K��2%���ڒ�N�{F�$�}Z:�}���{i�E7�W�x����P�R[�j��O��,����Ipn=q�����T7��`.���c\r��+Xn���-�C���/��%���z���&H(>n��h�:��/i(��3K�F���CR����4W{r��7$VYŸ\Z�Gy)f�Q�5�d�0o�^�V�H��x��%����(��[�}�ú��','Accessed page [product.php] with action=insert_product. Review page_parameters and postdata for details.','info'),(579,'2019-02-19 21:18:30',1,'product.php','cPath=6&action=insert_product','::1',0,'','�Rю�0�+O�(�ԇ���3N�{I�u��z\r����:	p����3㙵��8�dDK�a�RTŪh!\n�6 X&��l�2r&Gm)���UV>��C;gtLu�}�X��Q>��a4����-��uU���1�O{0���v���s\n�����2�ջ^��.�bA��6��j)�7?��k1N�-x �n��)��\ru�z��&�ޅӃ�{K��2%���ڒ�N�{F�$�}Z:�}���{i�E7�W�x����P�R[�j��O��,����Ipn=q�����T7��`.���c\r��+Xn���-�C���/��%���z���&H(>n��h�:��/i(��3K�F���CR����4W{r��7$VYŸ\Z�Gy)f�Q�5�d�0o�^�V�H��x��%����(��[�}�ú��','New product 11 added via admin console.','info'),(580,'2019-02-19 21:18:30',1,'category_product_listing.php','cPath=6&pID=11','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(581,'2019-02-19 21:19:12',1,'category_product_listing.php','cID=6','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(582,'2019-02-19 21:19:17',1,'category_product_listing.php','cPath=3','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(583,'2019-02-19 21:19:24',1,'category_product_listing.php','cID=3','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(584,'2019-02-19 21:19:26',1,'category_product_listing.php','cPath=3','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(585,'2019-02-19 21:19:26',1,'categories.php','cID=3&action=edit_category','::1',0,'','��\0','Accessed page [categories.php] with action=edit_category. Review page_parameters and postdata for details.','info'),(586,'2019-02-19 21:19:33',1,'categories.php','action=update_category','::1',0,'','U��\n�0�_�h�А�s��Q-a��:��woB:$�w�ݭ�8U�A��������0��w��R�U�I-�����3��rM�k?��S �݂یdL2�/.gx�m���zUU�����D6�!M��\0','Accessed page [categories.php] with action=update_category. Review page_parameters and postdata for details.','info'),(587,'2019-02-19 21:19:33',1,'category_product_listing.php','cID=3','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(588,'2019-02-19 21:19:35',1,'categories.php','action=new_category','::1',0,'','��\0','Accessed page [categories.php] with action=new_category. Review page_parameters and postdata for details.','info'),(589,'2019-02-19 21:19:41',1,'categories.php','action=insert_category','::1',0,'','U�K\n�0D��\0^�3�@?�֕xw�\"�r޼avZ�!ST�Bn�$s��&r4k����!���ڴ�W솦�E�����|�q|ʇ\"�uE�j��	��q','Accessed page [categories.php] with action=insert_category. Review page_parameters and postdata for details.','info'),(590,'2019-02-19 21:19:41',1,'category_product_listing.php','cID=7','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(591,'2019-02-19 21:19:43',1,'category_product_listing.php','cPath=7','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(592,'2019-02-19 21:19:45',1,'product.php','action=new_product','::1',0,'','�V*(�O)M.�/�,HU�R2T�QJH,�\0�́�����< \'/�<�V�\0','Accessed page [product.php] with action=new_product. Review page_parameters and postdata for details.','info'),(593,'2019-02-19 21:20:09',1,'product.php','cPath=7&action=new_product_preview','::1',0,'','�S�n�0����\"%��~���&��W����5$<�z�g�3���D���b�c4b+Z�)$6$���Iu�\n2��ԘT��>ּ垂��P��\ZK��l�qg1#�����u�nVm�����ř�n���\\�9�+��\"��rT\\�8�ySqk��\\NX��\rZ�F	̄�̋ �,���r��9��QH��z$�`���a���t��w���r�7��d���H��;��1`X(�ed��^��`�b�&)���mUO�yL��.hc�zF2=�\\rwЙ	Dוf��Ik�[��#!���ĽTj�L��ף����f��O�,��k����rmv�^�q�','Accessed page [product.php] with action=new_product_preview. Review page_parameters and postdata for details.','info'),(594,'2019-02-19 21:20:09',1,'product.php','cPath=7&action=new_product_preview','::1',1,'','�S�n�0����\"%��~���&��W����5$<�z�g�3���D���b�c4b+Z�)$6$���Iu�\n2��ԘT��>ּ垂��P��\ZK��l�qg1#�����u�nVm�����ř�n���\\�9�+��\"��rT\\�8�ySqk��\\NX��\rZ�F	̄�̋ �,���r��9��QH��z$�`���a���t��w���r�7��d���H��;��1`X(�ed��^��`�b�&)���mUO�yL��.hc�zF2=�\\rwЙ	Dוf��Ik�[��#!���ĽTj�L��ף����f��O�,��k����rmv�^�q�','Success: File upload saved successfully captainamerica.jpeg','notice'),(595,'2019-02-19 21:20:11',1,'product.php','cPath=7&action=insert_product','::1',0,'','�R�r�0��NΥ�	����EPǱ�,��!	�GkWڕ��*�7I��c�jUͫϪ�(�J�`�0*2��@��P�>�[[�T�m�L\ZU��uJ,\nH�����lFAdam/��z�����w�إ\rhI�<�]ܻ�����k_z3j}T ´N2YP࠴�8HM۟��}�1�PG,	���={�*n)rM)���Z�Û��8�L�l����c�a���H��NK4��rr�\r�\"V��#��][h��mr�x|�ʍx��!�K�{��:{�f+���<�{N}M�1��ɫ�����N�ª�� @�#���Cu~�Q3!�F��ؾ�����a��o��:�','Accessed page [product.php] with action=insert_product. Review page_parameters and postdata for details.','info'),(596,'2019-02-19 21:20:11',1,'product.php','cPath=7&action=insert_product','::1',0,'','�R�r�0��NΥ�	����EPǱ�,��!	�GkWڕ��*�7I��c�jUͫϪ�(�J�`�0*2��@��P�>�[[�T�m�L\ZU��uJ,\nH�����lFAdam/��z�����w�إ\rhI�<�]ܻ�����k_z3j}T ´N2YP࠴�8HM۟��}�1�PG,	���={�*n)rM)���Z�Û��8�L�l����c�a���H��NK4��rr�\r�\"V��#��][h��mr�x|�ʍx��!�K�{��:{�f+���<�{N}M�1��ɫ�����N�ª�� @�#���Cu~�Q3!�F��ؾ�����a��o��:�','New product 12 added via admin console.','info'),(597,'2019-02-19 21:20:11',1,'category_product_listing.php','cPath=7&pID=12','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(598,'2019-02-19 21:20:13',1,'product.php','action=new_product','::1',0,'','�V*(�O)M.�/�,HU�R2T�QJH,�\0�́�����< \'/�<�V�\0','Accessed page [product.php] with action=new_product. Review page_parameters and postdata for details.','info'),(599,'2019-02-19 21:20:43',1,'product.php','cPath=7&action=new_product_preview','::1',0,'','�Sˎ�0��[	���?\rIJG�;�PP��P�+i�Gb;vf̹�ɫ(Y���j_5�We!�&!�u�	u������ }twY��6g�R��)��X`��(�;S���̎ۺ�m�fS/�]<��H�ִ�g��4�t�:F�S]���\"���c�W��0����3�B\Zk�R���at�Cȡ�#�2�LKp������\'����@#8�D�Ҳ-��0���?�X�*֪�$�����i7��{��^i���\'=��i�:��h��G�}���i�}m~�t\"d�\'[�s� ��dކ=i�\\�9�|P�\\;��u,�>��M��.','Accessed page [product.php] with action=new_product_preview. Review page_parameters and postdata for details.','info'),(600,'2019-02-19 21:20:43',1,'product.php','cPath=7&action=new_product_preview','::1',1,'','�Sˎ�0��[	���?\rIJG�;�PP��P�+i�Gb;vf̹�ɫ(Y���j_5�We!�&!�u�	u������ }twY��6g�R��)��X`��(�;S���̎ۺ�m�fS/�]<��H�ִ�g��4�t�:F�S]���\"���c�W��0����3�B\Zk�R���at�Cȡ�#�2�LKp������\'����@#8�D�Ҳ-��0���?�X�*֪�$�����i7��{��^i���\'=��i�:��h��G�}���i�}m~�t\"d�\'[�s� ��dކ=i�\\�9�|P�\\;��u,�>��M��.','Success: File upload saved successfully hulk.jpeg','notice'),(601,'2019-02-19 21:20:45',1,'product.php','cPath=7&action=insert_product','::1',0,'','�R�r�0���dzI~�#�B�\ZLe��d��5��L��]iW�U�΄R�-���Շ���.A�rL�5�Ed&{mȗ.4��l�vu�h�J��q�I1/ ��V3�\r����,�m�|�M��p�R#�n��nM>����X-�ڷތ.\r\"LE�ł�.-�Yj��_�}+vާPG,����q�Զ�T�د�p���~4B����������B�\Z�u��z4k�X];�6�U�ؑ�5T8�TW1R|{ĺ��x��!��S�;fR�Ru�E�b �E���Ϙ�z��e�M�{�4PG�ha������s?���r͍��o�3�?�[���','Accessed page [product.php] with action=insert_product. Review page_parameters and postdata for details.','info'),(602,'2019-02-19 21:20:45',1,'product.php','cPath=7&action=insert_product','::1',0,'','�R�r�0���dzI~�#�B�\ZLe��d��5��L��]iW�U�΄R�-���Շ���.A�rL�5�Ed&{mȗ.4��l�vu�h�J��q�I1/ ��V3�\r����,�m�|�M��p�R#�n��nM>����X-�ڷތ.\r\"LE�ł�.-�Yj��_�}+vާPG,����q�Զ�T�د�p���~4B����������B�\Z�u��z4k�X];�6�U�ؑ�5T8�TW1R|{ĺ��x��!��S�;fR�Ru�E�b �E���Ϙ�z��e�M�{�4PG�ha������s?���r͍��o�3�?�[���','New product 13 added via admin console.','info'),(603,'2019-02-19 21:20:45',1,'category_product_listing.php','cPath=7&pID=13','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(604,'2019-02-19 21:20:47',1,'product.php','cPath=7&product_type=1&pID=12&action=new_product','::1',0,'','��\0','Accessed page [product.php] with action=new_product. Review page_parameters and postdata for details.','info'),(605,'2019-02-19 21:21:01',1,'product.php','cPath=7&pID=12&action=new_product_preview','::1',0,'','�SIn�0�J�s��}��H��B��ʂ /�4���:�3�ᐺd-�4+>�6��\"��\Z�lIi`[B\Z)}IiDGe0�����-�-�f�h	�U1�I�\\�r��S\r�K\n�6��-�b�,����ۧ-hNdi�\\>�=4¹ȓU�\r-��\\�Ȯ7��(���V�s/1jsV�L�I<K�ᤴ�8Z��_0$TS�q�����ApG8�U�aۢ���{>�M8�	x��3\n$��h�����L��<�{�O���l�&l����À���$�c�\\���I�o������ɯ~Z[�Z��r������l�fl�{0�N�^�?Z�w<ͭ�\rCf��ԯ�1}R����X/ʢ*�(��/','Accessed page [product.php] with action=new_product_preview. Review page_parameters and postdata for details.','info'),(606,'2019-02-19 21:21:01',1,'product.php','cPath=7&pID=12&action=new_product_preview','::1',1,'','�SIn�0�J�s��}��H��B��ʂ /�4���:�3�ᐺd-�4+>�6��\"��\Z�lIi`[B\Z)}IiDGe0�����-�-�f�h	�U1�I�\\�r��S\r�K\n�6��-�b�,����ۧ-hNdi�\\>�=4¹ȓU�\r-��\\�Ȯ7��(���V�s/1jsV�L�I<K�ᤴ�8Z��_0$TS�q�����ApG8�U�aۢ���{>�M8�	x��3\n$��h�����L��<�{�O���l�&l����À���$�c�\\���I�o������ɯ~Z[�Z��r������l�fl�{0�N�^�?Z�w<ͭ�\rCf��ԯ�1}R����X/ʢ*�(��/','Success: File upload saved successfully captainamerica.jpeg','notice'),(607,'2019-02-19 21:21:02',1,'product.php','cPath=7&pID=12&action=update_product','::1',0,'','��Mr�0���a�d�.:aۃx[!�\0����dr���&B��z����5��\Z�EI[c�EI���Yi�-:E&�>BiT;e�i�{_�ZTG��\\Q3iT�r0\n�t��Y�Ļ�18 )8p(:�4N��$޾ܕ?���#s��V�\n�`�W\rE�ШC�@���e�R�Q�\07Z-�_��l���9u&����r\'�k��㷴�`���}{���Ĳ	����?4���W$�>%5h֪��dti\rv����3Y�[B��RC-@�V��\Z�2��Cs/Ua��=#_��0����[_����w�:d_�{�������m�ߤI��Y2�����\ZX��sH�#E���4S-d�_���x��׶n?','Accessed page [product.php] with action=update_product. Review page_parameters and postdata for details.','info'),(608,'2019-02-19 21:21:02',1,'product.php','cPath=7&pID=12&action=update_product','::1',0,'','��Mr�0���a�d�.:aۃx[!�\0����dr���&B��z����5��\Z�EI[c�EI���Yi�-:E&�>BiT;e�i�{_�ZTG��\\Q3iT�r0\n�t��Y�Ļ�18 )8p(:�4N��$޾ܕ?���#s��V�\n�`�W\rE�ШC�@���e�R�Q�\07Z-�_��l���9u&����r\'�k��㷴�`���}{���Ĳ	����?4���W$�>%5h֪��dti\rv����3Y�[B��RC-@�V��\Z�2��Cs/Ua��=#_��0����[_����w�:d_�{�������m�ߤI��Y2�����\ZX��sH�#E���4S-d�_���x��׶n?','Updated product 12 via admin console.','info'),(609,'2019-02-19 21:21:02',1,'category_product_listing.php','cPath=7&pID=12','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(610,'2019-02-19 21:21:05',1,'product.php','action=new_product','::1',0,'','�V*(�O)M.�/�,HU�R2T�QJH,�\0�́�����< \'/�<�V�\0','Accessed page [product.php] with action=new_product. Review page_parameters and postdata for details.','info'),(611,'2019-02-19 21:21:39',1,'product.php','cPath=7&action=new_product_preview','::1',0,'','�SI��0����A\"�8�g�NlBK^B�!�>����w��\\]�����5KZ-���B`M�֍\'�A�J�4Y�A*���A�~�#y�#Z�Z��)����1,V�w&3:@��m����M�]<B͑4-n�W��8�t�A y����\0Hɦ�2��`�G�JV�f�*�*�^���eMO��u \r��Q������qNض�\\�̃�|�%�sǘ �TZ�E����;\":��:{�V�ա&l����e7O��{��^i��%ݡ�)x���h��I���i�cm��t!d�;��c� ׉d>��hlN��tj���_�z�����m�)���','Accessed page [product.php] with action=new_product_preview. Review page_parameters and postdata for details.','info'),(612,'2019-02-19 21:21:39',1,'product.php','cPath=7&action=new_product_preview','::1',1,'','�SI��0����A\"�8�g�NlBK^B�!�>����w��\\]�����5KZ-���B`M�֍\'�A�J�4Y�A*���A�~�#y�#Z�Z��)����1,V�w&3:@��m����M�]<B͑4-n�W��8�t�A y����\0Hɦ�2��`�G�JV�f�*�*�^���eMO��u \r��Q������qNض�\\�̃�|�%�sǘ �TZ�E����;\":��:{�V�ա&l����e7O��{��^i��%ݡ�)x���h��I���i�cm��t!d�;��c� ׉d>��hlN��tj���_�z�����m�)���','Success: File upload saved successfully ironman.jpeg','notice'),(613,'2019-02-19 21:21:40',1,'product.php','cPath=7&action=insert_product','::1',0,'','�Rˎ�0��U�ˊV�\0?��)^�Iq�B���P^-��{�Μ���M�9��m�<��\Z��l*�FCV!Er4�b��-gA��Ќ-S�&V�1$���s��1�9(]�X,��\"/���ا-T�yp[<�\rEu�#�}��>z��<a*�L8��A���Z\\M��9�8�:bI����t3n�ږ|=��ɔ�8s�}/���V��!���wF�$�:\r�Ρ}�mt,�Q�ZƎB��6P�\r���H���u������!���7n�\r���L����-:��5~�^׻FoY,��+�C��ja������uƊ�\n��{�����)��:���:��','Accessed page [product.php] with action=insert_product. Review page_parameters and postdata for details.','info'),(614,'2019-02-19 21:21:40',1,'product.php','cPath=7&action=insert_product','::1',0,'','�Rˎ�0��U�ˊV�\0?��)^�Iq�B���P^-��{�Μ���M�9��m�<��\Z��l*�FCV!Er4�b��-gA��Ќ-S�&V�1$���s��1�9(]�X,��\"/���ا-T�yp[<�\rEu�#�}��>z��<a*�L8��A���Z\\M��9�8�:bI����t3n�ږ|=��ɔ�8s�}/���V��!���wF�$�:\r�Ρ}�mt,�Q�ZƎB��6P�\r���H���u������!���7n�\r���L����-:��5~�^׻FoY,��+�C��ja������uƊ�\n��{�����)��:���:��','New product 14 added via admin console.','info'),(615,'2019-02-19 21:21:40',1,'category_product_listing.php','cPath=7&pID=14','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(616,'2019-02-19 21:21:42',1,'product.php','action=new_product','::1',0,'','�V*(�O)M.�/�,HU�R2T�QJH,�\0�́�����< \'/�<�V�\0','Accessed page [product.php] with action=new_product. Review page_parameters and postdata for details.','info'),(617,'2019-02-19 21:22:07',1,'product.php','cPath=7&action=new_product_preview','::1',0,'','�Sˎ�0��U΋D��~&�&���G�LJ+Ŀo��l@{l��{-�KZ#v���AdCR�&�(Qg(#Wr�\Z�\n����A������Pe�%8ū�ǝٌ��BmG�ͺڮ�jU�L�}ڃ�D��n7��\\�9�+w��z�j(�;Eb�F��)�k��ײ$0։�z�,ī�r||�o�I6c�uH������`���x��E�,�<�:��=&���H�;��1�/^�#�q�]��DE�2���v���%���n�d:)\'�13��ɵ��G>ϒ���:C\'B6Kc3w�,uٷ^O���e��)~���ZO�L�^oV�V\\�\0','Accessed page [product.php] with action=new_product_preview. Review page_parameters and postdata for details.','info'),(618,'2019-02-19 21:22:07',1,'product.php','cPath=7&action=new_product_preview','::1',1,'','�Sˎ�0��U΋D��~&�&���G�LJ+Ŀo��l@{l��{-�KZ#v���AdCR�&�(Qg(#Wr�\Z�\n����A������Pe�%8ū�ǝٌ��BmG�ͺڮ�jU�L�}ڃ�D��n7��\\�9�+w��z�j(�;Eb�F��)�k��ײ$0։�z�,ī�r||�o�I6c�uH������`���x��E�,�<�:��=&���H�;��1�/^�#�q�]��DE�2���v���%���n�d:)\'�13��ɵ��G>ϒ���:C\'B6Kc3w�,uٷ^O���e��)~���ZO�L�^oV�V\\�\0','Success: File upload saved successfully groot.jpeg','notice'),(619,'2019-02-19 21:22:08',1,'product.php','cPath=7&action=insert_product','::1',0,'','�Rˎ�0��U�ˊ���L�6�x�4�qJ+Ŀo��Հ��83��5�t(EI�`����3��Y� X9&�t�\"2����K�[��-�����0���㨳ļ�?[���(h�fPܬ��*�W���{(%0��vs�V�\\��%�қVE�@���(ЩҀ������O:p���k�%�I݁9A?YW�@MCu��;J�\n׽��1@-)�u����?t��3#�$�u,u�ߡ��4�u\Z�\"X\rcK.��Z�p�V1S|}ĺ��x��k�OL�K�;��:\'�� I�b\"�9�L���z�n��z�ʷ��\Zltp�vYE���$�<���dj�\\}e>����u�_�\rV��','Accessed page [product.php] with action=insert_product. Review page_parameters and postdata for details.','info'),(620,'2019-02-19 21:22:08',1,'product.php','cPath=7&action=insert_product','::1',0,'','�Rˎ�0��U�ˊ���L�6�x�4�qJ+Ŀo��Հ��83��5�t(EI�`����3��Y� X9&�t�\"2����K�[��-�����0���㨳ļ�?[���(h�fPܬ��*�W���{(%0��vs�V�\\��%�қVE�@���(ЩҀ������O:p���k�%�I݁9A?YW�@MCu��;J�\n׽��1@-)�u����?t��3#�$�u,u�ߡ��4�u\Z�\"X\rcK.��Z�p�V1S|}ĺ��x��k�OL�K�;��:\'�� I�b\"�9�L���z�n��z�ʷ��\Zltp�vYE���$�<���dj�\\}e>����u�_�\rV��','New product 15 added via admin console.','info'),(621,'2019-02-19 21:22:08',1,'category_product_listing.php','cPath=7&pID=15','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(622,'2019-02-19 21:27:04',1,'keepalive.php','','::1',0,'','��\0','Accessed page [keepalive.php]','info'),(623,'2019-02-19 21:27:05',1,'banner_manager.php','','::1',0,'','��\0','Accessed page [banner_manager.php]','info'),(624,'2019-02-19 21:27:16',1,'banner_manager.php','page=1&bID=11','::1',0,'','��\0','Accessed page [banner_manager.php]','info'),(625,'2019-02-19 21:27:23',1,'banner_manager.php','page=1&bID=11&action=new','::1',0,'','��\0','Accessed page [banner_manager.php] with action=new. Review page_parameters and postdata for details.','info'),(626,'2019-02-19 21:27:31',1,'banner_manager.php','page=1&bID=11','::1',0,'','��\0','Accessed page [banner_manager.php]','info'),(627,'2019-02-19 21:29:04',1,'banner_manager.php','page=1&bID=11&action=new','::1',0,'','��\0','Accessed page [banner_manager.php] with action=new. Review page_parameters and postdata for details.','info'),(628,'2019-02-19 21:30:56',1,'banner_manager.php','page=1&action=upd','::1',0,'','m�1\n�0E�<wh�ޤ�pc��H2	�޽2!4M;	��?=���,����w\'�J�l�5̐q�%�@ˏ� �NP�&4v�����}2�[�\0F�ZM4c�#J����s�P��e!���?��G�o3�@q=a!V �Ư&�W&5a�Rg����;�s�!�r{�{�','Accessed page [banner_manager.php] with action=upd. Review page_parameters and postdata for details.','info'),(629,'2019-02-19 21:30:56',1,'banner_manager.php','page=1&action=upd','::1',1,'','m�1\n�0E�<wh�ޤ�pc��H2	�޽2!4M;	��?=���,����w\'�J�l�5̐q�%�@ˏ� �NP�&4v�����}2�[�\0F�ZM4c�#J����s�P��e!���?��G�o3�@q=a!V �Ư&�W&5a�Rg����;�s�!�r{�{�','Success: File upload saved successfully main.png','notice'),(630,'2019-02-19 21:30:56',1,'banner_manager.php','page=1&bID=11','::1',0,'','��\0','Accessed page [banner_manager.php]','info'),(631,'2019-02-19 21:33:30',1,'keepalive.php','','::1',0,'','��\0','Accessed page [keepalive.php]','info'),(632,'2019-02-19 21:33:33',1,'banner_manager.php','page=1&bID=11&action=new','::1',0,'','��\0','Accessed page [banner_manager.php] with action=new. Review page_parameters and postdata for details.','info'),(633,'2019-02-19 21:33:40',1,'banner_manager.php','page=1&action=upd','::1',0,'','e�A��0E��J���t%�X$[2�L\ne�>6�L\']���z�{dF5���<��`�٘����\"�;q��#f0�\'��;�I�����:M��V�V;ڤ`�+Z�4����yӨ�.dY���D�K����QW����%���M�A4�v~�A��`ˆ�eך:�G%E���P��1�\n?�','Accessed page [banner_manager.php] with action=upd. Review page_parameters and postdata for details.','info'),(634,'2019-02-19 21:33:40',1,'banner_manager.php','page=1&bID=11','::1',0,'','��\0','Accessed page [banner_manager.php]','info'),(635,'2019-02-19 21:34:44',1,'banner_manager.php','page=1&bID=11&action=new','::1',0,'','��\0','Accessed page [banner_manager.php] with action=new. Review page_parameters and postdata for details.','info'),(636,'2019-02-19 21:34:53',1,'banner_manager.php','page=1&action=upd','::1',0,'','e�A��0E��J���t%�X$[2�L\ne�>6�L\']���z�{dF5���<��`�٘����\"�;q��#f0�\'��;�I�����:M��V�V;ڤ`�+Z�4����yӨ�.dY���D�K����QW����%���M�A4�v~�A��`ˆ�eך:�G%E���P��1�\n?�','Accessed page [banner_manager.php] with action=upd. Review page_parameters and postdata for details.','info'),(637,'2019-02-19 21:34:53',1,'banner_manager.php','page=1&bID=11','::1',0,'','��\0','Accessed page [banner_manager.php]','info'),(638,'2019-02-19 21:35:17',1,'banner_manager.php','page=1&bID=11&action=new','::1',0,'','��\0','Accessed page [banner_manager.php] with action=new. Review page_parameters and postdata for details.','info'),(639,'2019-02-19 21:35:26',1,'banner_manager.php','page=1&action=upd','::1',0,'','m�MN�0��Re\r�٢�{ E�Bc���ؙ���q(#Ja�{�Ŏ|U�6F(dЩu:�El�R���.��DX͊ѥ��\r�?@F� �-��m��؏���ځ���-)@�3�G���ѳ�a��i��?�m��+o.\r�����W�t�m��T�S�p��[��g�:�YRL�I�e�1�������U��{���(�\n�T��Y\'MM��m����4q�ʝ`�r���n�','Accessed page [banner_manager.php] with action=upd. Review page_parameters and postdata for details.','info'),(640,'2019-02-19 21:35:26',1,'banner_manager.php','page=1&bID=11','::1',0,'','��\0','Accessed page [banner_manager.php]','info'),(641,'2019-02-19 21:39:03',1,'keepalive.php','','::1',0,'','��\0','Accessed page [keepalive.php]','info'),(642,'2019-02-19 21:54:04',0,'login.php ','camefrom=logoff.php','::1',0,'','��\0','Accessed page [login.php]','info'),(643,'2019-02-19 21:58:29',0,'login.php ','camefrom=index.php','::1',0,'','��\0','Accessed page [login.php]','info'),(644,'2019-02-19 21:58:35',0,'login.php keongsang','camefrom=index.php','::1',0,'','�VJL.���S�RJ�OMLM3L�0753H4HK1J14ML�L30��LJ�L6W�QJL��̋�K�M��N��K/N�KJ�&�f�\0�!�Z\0','Accessed page [login.php] with action=doeaef1c87560a0fd2d15af9f0389ba9c7. Review page_parameters and postdata for details.','info'),(645,'2019-02-19 21:58:35',1,'index.php','','::1',0,'','��\0','Accessed page [index.php]','info'),(646,'2019-02-19 21:58:45',1,'profiles.php','','::1',0,'','��\0','Accessed page [profiles.php]','info'),(647,'2019-02-19 21:58:49',1,'admin_activity.php','','::1',0,'','��\0','Accessed page [admin_activity.php]','info'),(648,'2019-02-19 21:58:53',1,'users.php','','::1',0,'','��\0','Accessed page [users.php]','info'),(649,'2019-02-19 22:00:31',1,'banner_manager.php','','::1',0,'','��\0','Accessed page [banner_manager.php]','info'),(650,'2019-02-19 22:00:33',1,'banner_manager.php','page=1&bID=11','::1',0,'','��\0','Accessed page [banner_manager.php]','info'),(651,'2019-02-19 22:00:35',1,'banner_manager.php','page=1&bID=11&action=new','::1',0,'','��\0','Accessed page [banner_manager.php] with action=new. Review page_parameters and postdata for details.','info'),(652,'2019-02-19 22:00:41',1,'banner_manager.php','page=1&action=upd','::1',0,'','m�MN�0��Re\r�٢�{ E�Bc���ؙ���q(#Ja�{�Ŏ|U�6F(dЩu:�El�R���.��DX͊ѥ��\r�?@F� �-��m��؏���ځ���-)@�3�G���ѳ�a��i��?�m��+o.\r�����W�t�m��T�S�p��[��g�:�YRL�I�e�1�������U��{���(�\n�T��Y\'MM��m����4q�ʝ`�r���n�','Accessed page [banner_manager.php] with action=upd. Review page_parameters and postdata for details.','info'),(653,'2019-02-19 22:00:41',1,'banner_manager.php','page=1&bID=11','::1',0,'','��\0','Accessed page [banner_manager.php]','info'),(654,'2019-02-19 22:00:47',1,'banner_manager.php','page=1&bID=11&action=new','::1',0,'','��\0','Accessed page [banner_manager.php] with action=new. Review page_parameters and postdata for details.','info'),(655,'2019-02-19 22:01:01',1,'banner_manager.php','page=1&action=upd','::1',0,'','m�1\n�0E�<wh�ޤ�pc��H2	�޽2!4M;	��?=���,����w\'�J�l�5̐q�%�@ˏ� �NP�&4v�����}2�[�\0F�ZM4c�#J����s�P��e!���?��G�o3�@q=a!V �Ư&�W&5a�Rg����;�s�!�r{�{�','Accessed page [banner_manager.php] with action=upd. Review page_parameters and postdata for details.','info'),(656,'2019-02-19 22:01:01',1,'banner_manager.php','page=1&action=upd','::1',1,'','m�1\n�0E�<wh�ޤ�pc��H2	�޽2!4M;	��?=���,����w\'�J�l�5̐q�%�@ˏ� �NP�&4v�����}2�[�\0F�ZM4c�#J����s�P��e!���?��G�o3�@q=a!V �Ư&�W&5a�Rg����;�s�!�r{�{�','Success: File upload saved successfully banner.png','notice'),(657,'2019-02-19 22:01:01',1,'banner_manager.php','page=1&bID=11','::1',0,'','��\0','Accessed page [banner_manager.php]','info'),(658,'2019-02-19 22:04:20',1,'keepalive.php','','::1',0,'','��\0','Accessed page [keepalive.php]','info'),(659,'2019-02-19 22:12:50',1,'keepalive.php','','::1',0,'','��\0','Accessed page [keepalive.php]','info'),(660,'2019-02-19 22:12:53',1,'category_product_listing.php','','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(661,'2019-02-19 22:12:54',1,'category_product_listing.php','cPath=1','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(662,'2019-02-19 22:12:56',1,'product.php','action=new_product','::1',0,'','�V*(�O)M.�/�,HU�R2T�QJH,ɀ��K2�󀜼��x�Z�Z\0','Accessed page [product.php] with action=new_product. Review page_parameters and postdata for details.','info'),(663,'2019-02-19 22:13:39',1,'product.php','cPath=1&action=new_product_preview','::1',0,'','�S�n�0|��C�N�����\0�iL��4��v�w��f\rh?k����uW�l����b�,��K�!\n��@�L\rYmi���R�Bj���ӦYs�cD�T���Ug܋�����M5c�r�r�r6_L��|?:n�\Z*I�|v�z�n�+g�O.�/�M#���|O>Ӛ���J0�6�;T+�>ƚ�`@�i�$ۈ@o*��-��-�\r�b�z�$p�;p[N�M�P�RS��e0��?Y�w�FH!��F�S��L�/\"5$�u<�h�cc��Z��\\�vw�[�o�<,�QR[ƎB��{���$_kH��u�tx�[萷L�cc\'�!m0�I�z�\"��B��?�\'�y�A����c�g�t�(��','Accessed page [product.php] with action=new_product_preview. Review page_parameters and postdata for details.','info'),(664,'2019-02-19 22:13:39',1,'product.php','cPath=1&action=new_product_preview','::1',1,'','�S�n�0|��C�N�����\0�iL��4��v�w��f\rh?k����uW�l����b�,��K�!\n��@�L\rYmi���R�Bj���ӦYs�cD�T���Ug܋�����M5c�r�r�r6_L��|?:n�\Z*I�|v�z�n�+g�O.�/�M#���|O>Ӛ���J0�6�;T+�>ƚ�`@�i�$ۈ@o*��-��-�\r�b�z�$p�;p[N�M�P�RS��e0��?Y�w�FH!��F�S��L�/\"5$�u<�h�cc��Z��\\�vw�[�o�<,�QR[ƎB��{���$_kH��u�tx�[萷L�cc\'�!m0�I�z�\"��B��?�\'�y�A����c�g�t�(��','Success: File upload saved successfully airpurifier1.jpeg','notice'),(665,'2019-02-19 22:13:40',1,'product.php','cPath=1&action=insert_product','::1',0,'','�R�N�0|���Z�b�x$ �\Z�%M�8���������ξ�s?E�`s-F��yQ��$Ȧ�&0a2dR�\'\'c)�!����]�,9�!#2�hR`�bI@rꭜg�����)V��uZV��e��K�%3r����m(���Ukp�7k[\"L�,�6�v�z�q��}5^����%�������I�#��Pn%[��;W[eh����zj�c�f�p��-�}O��P�?_�}�����������$�h���к�F<�K��L�C�wꬑ�OeOy�s��}���o��ެ������:�Q���k�����Nވ\'�iI:��r&��)\n���w�gv7���\0q�疏_���','Accessed page [product.php] with action=insert_product. Review page_parameters and postdata for details.','info'),(666,'2019-02-19 22:13:40',1,'product.php','cPath=1&action=insert_product','::1',0,'','�R�N�0|���Z�b�x$ �\Z�%M�8���������ξ�s?E�`s-F��yQ��$Ȧ�&0a2dR�\'\'c)�!����]�,9�!#2�hR`�bI@rꭜg�����)V��uZV��e��K�%3r����m(���Ukp�7k[\"L�,�6�v�z�q��}5^����%�������I�#��Pn%[��;W[eh����zj�c�f�p��-�}O��P�?_�}�����������$�h���к�F<�K��L�C�wꬑ�OeOy�s��}���o��ެ������:�Q���k�����Nވ\'�iI:��r&��)\n���w�gv7���\0q�疏_���','New product 16 added via admin console.','info'),(667,'2019-02-19 22:13:41',1,'category_product_listing.php','cPath=1&pID=16','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(668,'2019-02-19 22:13:49',1,'product.php','action=new_product','::1',0,'','�V*(�O)M.�/�,HU�R2T�QJH,ɀ��K2�󀜼��x�Z�Z\0','Accessed page [product.php] with action=new_product. Review page_parameters and postdata for details.','info'),(669,'2019-02-19 22:14:25',1,'product.php','cPath=1&action=new_product_preview','::1',0,'','�S�n�0����!�N{h�����I\\j)�8V��J�����s����eg�%C��&+���/�J�`��+2�;g�W��v���-_6Ֆ]=G�L\Z�wy�=/ ����ތbt@J;2���:/�|5)n��F>�}��n��3���&�\"�{�E��$^|�-E�+\\���q��X�`��U�*\"Le���^i��,��H���y��:b	`Su`�0Lҕ�Q�RS��~dP��_�����&���?�	�#\"4$�yj��$�F��Z!�\\nvw��t�?S;�v�Ӗ�#��5T85��bD������n�C�3	΅M�1k0�	l�j�#U;I\"�?���:��sr���*/���','Accessed page [product.php] with action=new_product_preview. Review page_parameters and postdata for details.','info'),(670,'2019-02-19 22:14:25',1,'product.php','cPath=1&action=new_product_preview','::1',1,'','�S�n�0����!�N{h�����I\\j)�8V��J�����s����eg�%C��&+���/�J�`��+2�;g�W��v���-_6Ֆ]=G�L\Z�wy�=/ ����ތbt@J;2���:/�|5)n��F>�}��n��3���&�\"�{�E��$^|�-E�+\\���q��X�`��U�*\"Le���^i��,��H���y��:b	`Su`�0Lҕ�Q�RS��~dP��_�����&���?�	�#\"4$�yj��$�F��Z!�\\nvw��t�?S;�v�Ӗ�#��5T85��bD������n�C�3	΅M�1k0�	l�j�#U;I\"�?���:��sr���*/���','Success: File upload saved successfully airpurifier2.jpeg','notice'),(671,'2019-02-19 22:14:26',1,'product.php','cPath=1&action=insert_product','::1',0,'','�R�r�0����	tzHn����<\nV�:;�LB3���@^�GkWڕ��ıա%��d�d�kR�dU�`i��+���@�J�/l��m�YPm�Vc�c*Py�Qg�y	~�r��(h��M��/�e�ei�;��\n	�<�}�u+���|v��y�M�u�@�id���A� 5m��}L.�z?�\Zb	`�����+�%�.�r;i��f��PE�e���?&\n��P���Tt@=������hF�r�\r�/[A�=HU3ŗG��؈��\r�Ip,�s�p�Xg�Tne����~�I�������9{�<͖��\Z���-��/ҩ�_�/��/߁iCq��~\"���	�����6O��\0���o?���','Accessed page [product.php] with action=insert_product. Review page_parameters and postdata for details.','info'),(672,'2019-02-19 22:14:26',1,'product.php','cPath=1&action=insert_product','::1',0,'','�R�r�0����	tzHn����<\nV�:;�LB3���@^�GkWڕ��ıա%��d�d�kR�dU�`i��+���@�J�/l��m�YPm�Vc�c*Py�Qg�y	~�r��(h��M��/�e�ei�;��\n	�<�}�u+���|v��y�M�u�@�id���A� 5m��}L.�z?�\Zb	`�����+�%�.�r;i��f��PE�e���?&\n��P���Tt@=������hF�r�\r�/[A�=HU3ŗG��؈��\r�Ip,�s�p�Xg�Tne����~�I�������9{�<͖��\Z���-��/ҩ�_�/��/߁iCq��~\"���	�����6O��\0���o?���','New product 17 added via admin console.','info'),(673,'2019-02-19 22:14:26',1,'category_product_listing.php','cPath=1&pID=17','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(674,'2019-02-19 22:14:35',1,'category_product_listing.php','cID=1','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(675,'2019-02-19 22:14:39',1,'category_product_listing.php','cPath=4','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(676,'2019-02-19 22:14:41',1,'product.php','action=new_product','::1',0,'','�V*(�O)M.�/�,HU�R2T�QJH,�\0�M������< \'/�<�V�\0','Accessed page [product.php] with action=new_product. Review page_parameters and postdata for details.','info'),(677,'2019-02-19 22:15:10',1,'product.php','cPath=4&action=new_product_preview','::1',0,'','�S�n�0��*�\"z�c�Gkc/aU\'�uH���:^��xg<���9kؙ�EI�`����3���� X:&�L���ʐ�.�7���P��U)�aҨ�㨓μ�?[���(h�,vPܬ��*�W���{�yv��Ȯ���s�r��8g>����d�F��N1y�p��ڗ��*z\"LE�E���lgIO=N���OG-��Ko`O�Oƕ?P�P]�bG�U�7��B��ĝWT���n���5�{��:4���L����kz�͝=�+g�&�l[r!_A�Ӑ�2֒��<jZ��͵�\'&��ل��N`���	�<Ȣֱ�S@��e��1c,c�כU��.','Accessed page [product.php] with action=new_product_preview. Review page_parameters and postdata for details.','info'),(678,'2019-02-19 22:15:10',1,'product.php','cPath=4&action=new_product_preview','::1',1,'','�S�n�0��*�\"z�c�Gkc/aU\'�uH���:^��xg<���9kؙ�EI�`����3���� X:&�L���ʐ�.�7���P��U)�aҨ�㨓μ�?[���(h�,vPܬ��*�W���{�yv��Ȯ���s�r��8g>����d�F��N1y�p��ڗ��*z\"LE�E���lgIO=N���OG-��Ko`O�Oƕ?P�P]�bG�U�7��B��ĝWT���n���5�{��:4���L����kz�͝=�+g�&�l[r!_A�Ӑ�2֒��<jZ��͵�\'&��ل��N`���	�<Ȣֱ�S@��e��1c,c�כU��.','Success: File upload saved successfully woodbasket.jpeg','notice'),(679,'2019-02-19 22:15:11',1,'product.php','cPath=4&action=insert_product','::1',0,'','�R�r�0��NΥC�	���=J,�Z\'���0�{���GkWڕ���d�}*J��CG�QN�U\n��eB�H( #�)M.����m_���6_2J���t���F+�����\n�@b:��6�o�x�����T<#�n?�݊\\p��]5c�z�*i�0%^V\n4*5�F�u�\\�7c����ŃY{SC;W�DeIE�;K�ۼ���C!(�u�Ϝ��Ь�_���ɩA�\n��ѹ�h�*+�>6���,D��G��Ј�o�r�$�T�]6`�S#e\'YE/rXt�>~Z������6���R@\\��C�m�~���]ǠK�J![L���<�Oר�ܤ��Sb]�\0','Accessed page [product.php] with action=insert_product. Review page_parameters and postdata for details.','info'),(680,'2019-02-19 22:15:11',1,'product.php','cPath=4&action=insert_product','::1',0,'','�R�r�0��NΥC�	���=J,�Z\'���0�{���GkWڕ���d�}*J��CG�QN�U\n��eB�H( #�)M.����m_���6_2J���t���F+�����\n�@b:��6�o�x�����T<#�n?�݊\\p��]5c�z�*i�0%^V\n4*5�F�u�\\�7c����ŃY{SC;W�DeIE�;K�ۼ���C!(�u�Ϝ��Ь�_���ɩA�\n��ѹ�h�*+�>6���,D��G��Ј�o�r�$�T�]6`�S#e\'YE/rXt�>~Z������6���R@\\��C�m�~���]ǠK�J![L���<�Oר�ܤ��Sb]�\0','New product 18 added via admin console.','info'),(681,'2019-02-19 22:15:11',1,'category_product_listing.php','cPath=4&pID=18','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(682,'2019-02-19 22:15:14',1,'product.php','action=new_product','::1',0,'','�V*(�O)M.�/�,HU�R2T�QJH,�\0�M������< \'/�<�V�\0','Accessed page [product.php] with action=new_product. Review page_parameters and postdata for details.','info'),(683,'2019-02-19 22:15:43',1,'product.php','cPath=4&action=new_product_preview','::1',0,'','�SIn�0�J�s��ɭ�ZR��P�c#��+/٤=�����hɩ Y���bW��gрgMB��j/P�V�,`/z邽��o�bO�I-���;�:i�3p�����ь��@eF�ͺܮ�r���۰Ɂ4-n����9�\'wŏ��|��\nC]\\n(�>z��4cU�1/\'P�\Z0V��50�B\Z����>N�o�&�}��8�ɽ�9�0��m��NŎ<���o6{`#đ�Wo����>SxF��^��^���K���nsg��\'��)m�t��;t!.��Z�Ml�L�~�z�4�v6�i:�N���1a��2/͞4�΂�>/(�a�p+5�e\n�z�*���','Accessed page [product.php] with action=new_product_preview. Review page_parameters and postdata for details.','info'),(684,'2019-02-19 22:15:43',1,'product.php','cPath=4&action=new_product_preview','::1',1,'','�SIn�0�J�s��ɭ�ZR��P�c#��+/٤=�����hɩ Y���bW��gрgMB��j/P�V�,`/z邽��o�bO�I-���;�:i�3p�����ь��@eF�ͺܮ�r���۰Ɂ4-n����9�\'wŏ��|��\nC]\\n(�>z��4cU�1/\'P�\Z0V��50�B\Z����>N�o�&�}��8�ɽ�9�0��m��NŎ<���o6{`#đ�Wo����>SxF��^��^���K���nsg��\'��)m�t��;t!.��Z�Ml�L�~�z�4�v6�i:�N���1a��2/͞4�΂�>/(�a�p+5�e\n�z�*���','Success: File upload saved successfully acryl nametag.jpeg','notice'),(685,'2019-02-19 22:15:44',1,'product.php','cPath=4&action=insert_product','::1',0,'','�RIn�0�J�sS��ɭ�Zb��R�c#��+/��=�3��9e5{�(�j�vY��fAV\ZKτA�IPB&rP����]��OA�g_�5�F<\'�9$���uf2���P�^q�η�<_m>�.�AKd�����[QH.p泯j���7��N�Se��@���0I-�{�}K�!̡�X\"إ7�G�F�*��ɕs��T��\'7����ųI�Y����B��s��Z4�о~7���,W5cC>��VP�RU�H����*5��[|�|d�+��>0�9\"�YD/r\\t�!~��\r�[oV����JN��.���ٗ�T(���A4S-�ݙ|�G���{�0ٍ�߾kL��\0','Accessed page [product.php] with action=insert_product. Review page_parameters and postdata for details.','info'),(686,'2019-02-19 22:15:44',1,'product.php','cPath=4&action=insert_product','::1',0,'','�RIn�0�J�sS��ɭ�Zb��R�c#��+/��=�3��9e5{�(�j�vY��fAV\ZKτA�IPB&rP����]��OA�g_�5�F<\'�9$���uf2���P�^q�η�<_m>�.�AKd�����[QH.p泯j���7��N�Se��@���0I-�{�}K�!̡�X\"إ7�G�F�*��ɕs��T��\'7����ųI�Y����B��s��Z4�о~7���,W5cC>��VP�RU�H����*5��[|�|d�+��>0�9\"�YD/r\\t�!~��\r�[oV����JN��.���ٗ�T(���A4S-�ݙ|�G���{�0ٍ�߾kL��\0','New product 19 added via admin console.','info'),(687,'2019-02-19 22:15:44',1,'category_product_listing.php','cPath=4&pID=19','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(688,'2019-02-19 22:15:47',1,'product.php','action=new_product','::1',0,'','�V*(�O)M.�/�,HU�R2T�QJH,�\0�M������< \'/�<�V�\0','Accessed page [product.php] with action=new_product. Review page_parameters and postdata for details.','info'),(689,'2019-02-19 22:16:08',1,'product.php','cPath=4&action=new_product_preview','::1',0,'','�S�n�0����F\n�zH�������Y��^P�������g�3�N����b�Ck�VT�]8�lH*`�B%�e�B�RcT!����%(wܒ�*#c����\"�x�r�3���Z�����6��ZU_�c�v�8������i.Ϝ�[����C�Y�o�15����\n�}j_�z��LX\'.2`襲/n���O2i(�X`\'��;�Gf�2�m�7K����`	<c��y�������_�8�.�k�\"l����a;��\"���r�d:)G�13��ɽ��G>Ϛ��:CGB6Kg3w,,u٧f��=��m�*����ZO�L�^���8�','Accessed page [product.php] with action=new_product_preview. Review page_parameters and postdata for details.','info'),(690,'2019-02-19 22:16:08',1,'product.php','cPath=4&action=new_product_preview','::1',1,'','�S�n�0����F\n�zH�������Y��^P�������g�3�N����b�Ck�VT�]8�lH*`�B%�e�B�RcT!����%(wܒ�*#c����\"�x�r�3���Z�����6��ZU_�c�v�8������i.Ϝ�[����C�Y�o�15����\n�}j_�z��LX\'.2`襲/n���O2i(�X`\'��;�Gf�2�m�7K����`	<c��y�������_�8�.�k�\"l����a;��\"���r�d:)G�13��ɽ��G>Ϛ��:CGB6Kg3w,,u٧f��=��m�*����ZO�L�^���8�','Success: File upload saved successfully logprint.jpeg','notice'),(691,'2019-02-19 22:16:09',1,'product.php','cPath=4&action=insert_product','::1',0,'','�R�r�0��NΥC��\0��C����¨��F�ÿׁ�J��h�J���X�:բ��Xe�^4Y� h<FE:C��Qi��O��6�՚}3d�\ZU��u�X�{+��ٌ��Be;�ż\\��rV~����Z#�n?�݊bv��]�k_zӪ:(a���ث�B�����1���Xر;�;8\\����ș��V�����m8�L��6��c�~���H�dZ��=�)t�y�5�A�cK>��6`�Rcr����u���1�E�1	�/�.0��!���#yYt�s\0�>�w�|1+��Mvp�Vŷ7���Iqz���f\nB�]�Oxb��~=��&tC?~���','Accessed page [product.php] with action=insert_product. Review page_parameters and postdata for details.','info'),(692,'2019-02-19 22:16:09',1,'product.php','cPath=4&action=insert_product','::1',0,'','�R�r�0��NΥC��\0��C����¨��F�ÿׁ�J��h�J���X�:բ��Xe�^4Y� h<FE:C��Qi��O��6�՚}3d�\ZU��u�X�{+��ٌ��Be;�ż\\��rV~����Z#�n?�݊bv��]�k_zӪ:(a���ث�B�����1���Xر;�;8\\����ș��V�����m8�L��6��c�~���H�dZ��=�)t�y�5�A�cK>��6`�Rcr����u���1�E�1	�/�.0��!���#yYt�s\0�>�w�|1+��Mvp�Vŷ7���Iqz���f\nB�]�Oxb��~=��&tC?~���','New product 20 added via admin console.','info'),(693,'2019-02-19 22:16:09',1,'category_product_listing.php','cPath=4&pID=20','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(694,'2019-02-19 22:16:11',1,'index.php','','::1',0,'','��\0','Accessed page [index.php]','info'),(695,'2019-02-19 22:20:11',1,'keepalive.php','','::1',0,'','��\0','Accessed page [keepalive.php]','info'),(696,'2019-02-19 22:20:12',1,'category_product_listing.php','','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(697,'2019-02-19 22:20:15',1,'category_product_listing.php','cPath=4','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(698,'2019-02-19 22:20:26',1,'product.php','page=1&product_type=1&cPath=4&pID=19&action=new_product_meta_tags','::1',0,'','��\0','Accessed page [product.php] with action=new_product_meta_tags. Review page_parameters and postdata for details.','info'),(699,'2019-02-19 22:20:35',1,'category_product_listing.php','cPath=4','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(700,'2019-02-19 22:20:37',1,'category_product_listing.php','cID=4','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(701,'2019-02-19 22:20:39',1,'categories.php','action=new_category','::1',0,'','��\0','Accessed page [categories.php] with action=new_category. Review page_parameters and postdata for details.','info'),(702,'2019-02-19 22:20:45',1,'categories.php','action=insert_category','::1',0,'','U��\n� D�e���/��d!5�NῧEP�y�9�q�OYQ�\n�y���dNZ���J�9��%(.�^5�W�oE�H?]{�����)\"�P����jS��v','Accessed page [categories.php] with action=insert_category. Review page_parameters and postdata for details.','info'),(703,'2019-02-19 22:20:46',1,'category_product_listing.php','cID=8','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(704,'2019-02-19 22:20:50',1,'category_product_listing.php','cPath=8','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(705,'2019-02-19 22:20:52',1,'categories.php','cPath=8&action=new_category','::1',0,'','��\0','Accessed page [categories.php] with action=new_category. Review page_parameters and postdata for details.','info'),(706,'2019-02-19 22:21:06',1,'categories.php','action=insert_category&cPath=8','::1',0,'','U�1\n�0E�\"�t�!��KhB	�V�:�nU���>�రO*���i�����T�����aEg�g��I�3oC��$z�N���m�x���/!޸�_05�����ٟ','Accessed page [categories.php] with action=insert_category. Review page_parameters and postdata for details.','info'),(707,'2019-02-19 22:21:06',1,'category_product_listing.php','cPath=8&cID=9','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(708,'2019-02-19 22:21:10',1,'categories.php','cPath=8&action=new_category','::1',0,'','��\0','Accessed page [categories.php] with action=new_category. Review page_parameters and postdata for details.','info'),(709,'2019-02-19 22:21:14',1,'categories.php','action=insert_category&cPath=8','::1',0,'','U��\n�0D�Es�d��1�:�hlY�L�=IC���;nPbGn��Q��<���-���\r��!z2�����.CK��v����3b��z�7�����f�	���\0','Accessed page [categories.php] with action=insert_category. Review page_parameters and postdata for details.','info'),(710,'2019-02-19 22:21:14',1,'category_product_listing.php','cPath=8&cID=10','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(711,'2019-02-19 22:21:16',1,'categories.php','cPath=8&action=new_category','::1',0,'','��\0','Accessed page [categories.php] with action=new_category. Review page_parameters and postdata for details.','info'),(712,'2019-02-19 22:21:35',1,'categories.php','action=insert_category&cPath=8','::1',0,'','U�;\n�0D�T�ȶ>C����0��Zd�\n���C .��f���YM�E!��&C��f�:|MiM{��d�s��ا!%G;S�K�̱`]q�˛/��LjjՈ���','Accessed page [categories.php] with action=insert_category. Review page_parameters and postdata for details.','info'),(713,'2019-02-19 22:21:35',1,'category_product_listing.php','cPath=8&cID=11','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(714,'2019-02-19 22:21:37',1,'category_product_listing.php','cID=8','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(715,'2019-02-19 22:21:38',1,'category_product_listing.php','cPath=6','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(716,'2019-02-19 22:21:40',1,'category_product_listing.php','cID=6','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(717,'2019-02-19 22:21:42',1,'category_product_listing.php','cPath=4','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(718,'2019-02-19 22:21:44',1,'category_product_listing.php','cPath=4&product_type=1&pID=19&action=move_product&page=1','::1',0,'','��\0','Accessed page [category_product_listing.php] with action=move_product. Review page_parameters and postdata for details.','info'),(719,'2019-02-19 22:21:50',1,'category_product_listing.php','action=move_product_confirm&cPath=4&page=1','::1',0,'','�V*(�O)M.)��LQ�R2�T�Q��/K�/ɏON,IM�/��HY*�\0','Accessed page [category_product_listing.php] with action=move_product_confirm. Review page_parameters and postdata for details.','info'),(720,'2019-02-19 22:21:50',1,'category_product_listing.php','action=move_product_confirm&cPath=4&page=1','::1',1,'','�V*(�O)M.)��LQ�R2�T�Q��/K�/ɏON,IM�/��HY*�\0','Moved product 19 from category 4 to category 9','notice'),(721,'2019-02-19 22:21:50',1,'category_product_listing.php','cPath=9&pID=19&page=1','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(722,'2019-02-19 22:21:53',1,'category_product_listing.php','cID=9','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(723,'2019-02-19 22:21:56',1,'category_product_listing.php','cPath=4','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(724,'2019-02-19 22:21:59',1,'category_product_listing.php','cPath=4&product_type=1&pID=20&action=move_product&page=1','::1',0,'','��\0','Accessed page [category_product_listing.php] with action=move_product. Review page_parameters and postdata for details.','info'),(725,'2019-02-19 22:22:02',1,'category_product_listing.php','action=move_product_confirm&cPath=4&page=1','::1',0,'','�V*(�O)M.)��LQ�R22P�Q��/K�/ɏON,IM�/��H\Z*�\0','Accessed page [category_product_listing.php] with action=move_product_confirm. Review page_parameters and postdata for details.','info'),(726,'2019-02-19 22:22:02',1,'category_product_listing.php','action=move_product_confirm&cPath=4&page=1','::1',1,'','�V*(�O)M.)��LQ�R22P�Q��/K�/ɏON,IM�/��H\Z*�\0','Moved product 20 from category 4 to category 11','notice'),(727,'2019-02-19 22:22:02',1,'category_product_listing.php','cPath=11&pID=20&page=1','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(728,'2019-02-19 22:22:04',1,'category_product_listing.php','cPath=11&product_type=1&pID=20&action=move_product&page=1','::1',0,'','��\0','Accessed page [category_product_listing.php] with action=move_product. Review page_parameters and postdata for details.','info'),(729,'2019-02-19 22:22:06',1,'category_product_listing.php','action=move_product_confirm&cPath=11&page=1','::1',0,'','�V*(�O)M.)��LQ�R22P�Q��/K�/ɏON,IM�/��H\Z*�\0','Accessed page [category_product_listing.php] with action=move_product_confirm. Review page_parameters and postdata for details.','info'),(730,'2019-02-19 22:22:06',1,'category_product_listing.php','cPath=11&pID=20&page=1','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(731,'2019-02-19 22:22:08',1,'category_product_listing.php','cID=11','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(732,'2019-02-19 22:22:09',1,'category_product_listing.php','cPath=4','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(733,'2019-02-19 22:22:11',1,'category_product_listing.php','cPath=4&product_type=1&pID=18&action=move_product&page=1','::1',0,'','��\0','Accessed page [category_product_listing.php] with action=move_product. Review page_parameters and postdata for details.','info'),(734,'2019-02-19 22:22:14',1,'category_product_listing.php','action=move_product_confirm&cPath=4&page=1','::1',0,'','�V*(�O)M.)��LQ�R2�P�Q��/K�/ɏON,IM�/��J(�\0','Accessed page [category_product_listing.php] with action=move_product_confirm. Review page_parameters and postdata for details.','info'),(735,'2019-02-19 22:22:14',1,'category_product_listing.php','action=move_product_confirm&cPath=4&page=1','::1',1,'','�V*(�O)M.)��LQ�R2�P�Q��/K�/ɏON,IM�/��J(�\0','Moved product 18 from category 4 to category 10','notice'),(736,'2019-02-19 22:22:14',1,'category_product_listing.php','cPath=10&pID=18&page=1','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(737,'2019-02-19 22:22:17',1,'category_product_listing.php','cID=10','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(738,'2019-02-19 22:22:20',1,'category_product_listing.php','cPath=4','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(739,'2019-02-19 22:22:20',1,'category_product_listing.php','cID=4&action=delete_category','::1',0,'','��\0','Accessed page [category_product_listing.php] with action=delete_category. Review page_parameters and postdata for details.','info'),(740,'2019-02-19 22:22:21',1,'category_product_listing.php','cPath=4','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(741,'2019-02-19 22:22:21',1,'category_product_listing.php','action=setflag_categories&flag=0&cID=4&page=0','::1',0,'','��\0','Accessed page [category_product_listing.php] with action=setflag_categories. Review page_parameters and postdata for details.','info'),(742,'2019-02-19 22:22:23',1,'category_product_listing.php','cPath=4','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(743,'2019-02-19 22:22:25',1,'category_product_listing.php','cID=4','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(744,'2019-02-19 22:22:29',1,'category_product_listing.php','cPath=4','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(745,'2019-02-19 22:22:29',1,'category_product_listing.php','cID=4&action=delete_category','::1',0,'','��\0','Accessed page [category_product_listing.php] with action=delete_category. Review page_parameters and postdata for details.','info'),(746,'2019-02-19 22:22:30',1,'category_product_listing.php','action=delete_category_confirm','::1',0,'','�VJN,IM�/�L-��LQ�2�\0','Accessed page [category_product_listing.php] with action=delete_category_confirm. Review page_parameters and postdata for details.','info'),(747,'2019-02-19 22:22:30',1,'category_product_listing.php','action=delete_category_confirm','::1',1,'','�VJN,IM�/�L-��LQ�2�\0','Deleted category 4 from database via admin console.','warning'),(748,'2019-02-19 22:22:30',1,'category_product_listing.php','','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(749,'2019-02-19 22:22:58',1,'category_product_listing.php','cPath=1','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(750,'2019-02-19 22:23:01',1,'category_product_listing.php','cID=1','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(751,'2019-02-19 22:23:03',1,'categories.php','action=new_category','::1',0,'','��\0','Accessed page [categories.php] with action=new_category. Review page_parameters and postdata for details.','info'),(752,'2019-02-19 22:23:07',1,'categories.php','action=insert_category','::1',0,'','U��\n�0C���!]��K̑S� ��ٙB��IC���V�#U\'Z�I���h��U^�M̋�C�l7��F��Y�es�F?�Mgք��,:��I��\'ÎZ��~��','Accessed page [categories.php] with action=insert_category. Review page_parameters and postdata for details.','info'),(753,'2019-02-19 22:23:07',1,'category_product_listing.php','cID=12','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(754,'2019-02-19 22:23:09',1,'category_product_listing.php','cPath=12','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(755,'2019-02-19 22:23:11',1,'categories.php','cPath=12&action=new_category','::1',0,'','��\0','Accessed page [categories.php] with action=new_category. Review page_parameters and postdata for details.','info'),(756,'2019-02-19 22:23:20',1,'categories.php','action=insert_category&cPath=12','::1',0,'','U�1\n�0��Na�*�<@�E,XR8�M��;&�;;ˮ2iG�N�H�0��I�	����t{�\r�.��M�Wg-?�0�S4��.:�&Ĭe��,Ob���/vԪ�X���o','Accessed page [categories.php] with action=insert_category. Review page_parameters and postdata for details.','info'),(757,'2019-02-19 22:23:20',1,'category_product_listing.php','cPath=12&cID=13','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(758,'2019-02-19 22:23:21',1,'categories.php','cPath=12&action=new_category','::1',0,'','��\0','Accessed page [categories.php] with action=new_category. Review page_parameters and postdata for details.','info'),(759,'2019-02-19 22:23:26',1,'categories.php','action=insert_category&cPath=12','::1',0,'','U�;\n�0D��NᴺC�@,�A�VJ�ǎ	��y�,2�@jN�H�0]�I�	��$ȝf�ߐ�d��|���w�%E��餳hB,Z_��� ����ɴ��|���~�\0','Accessed page [categories.php] with action=insert_category. Review page_parameters and postdata for details.','info'),(760,'2019-02-19 22:23:26',1,'category_product_listing.php','cPath=12&cID=14','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(761,'2019-02-19 22:23:28',1,'categories.php','cPath=12&action=new_category','::1',0,'','��\0','Accessed page [categories.php] with action=new_category. Review page_parameters and postdata for details.','info'),(762,'2019-02-19 22:23:32',1,'categories.php','action=insert_category&cPath=12','::1',0,'','U�A\n�0�\"s��^�\r�	�d�d/+�}uE�cWW�+-ܑ�+ZT�0�wR�@a���sf����$h��k-�{j)����\Z\'D���|�\'d������=V���','Accessed page [categories.php] with action=insert_category. Review page_parameters and postdata for details.','info'),(763,'2019-02-19 22:23:32',1,'category_product_listing.php','cPath=12&cID=15','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(764,'2019-02-19 22:23:34',1,'category_product_listing.php','cID=12','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(765,'2019-02-19 22:23:36',1,'category_product_listing.php','cPath=1','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(766,'2019-02-19 22:23:38',1,'category_product_listing.php','cPath=1&product_type=1&pID=10&action=move_product&page=1','::1',0,'','��\0','Accessed page [category_product_listing.php] with action=move_product. Review page_parameters and postdata for details.','info'),(767,'2019-02-19 22:23:42',1,'category_product_listing.php','action=move_product_confirm&cPath=1&page=1','::1',0,'','�V*(�O)M.)��LQ�R24P�Q��/K�/ɏON,IM�/��J+�\0','Accessed page [category_product_listing.php] with action=move_product_confirm. Review page_parameters and postdata for details.','info'),(768,'2019-02-19 22:23:42',1,'category_product_listing.php','action=move_product_confirm&cPath=1&page=1','::1',1,'','�V*(�O)M.)��LQ�R24P�Q��/K�/ɏON,IM�/��J+�\0','Moved product 10 from category 1 to category 13','notice'),(769,'2019-02-19 22:23:42',1,'category_product_listing.php','cPath=13&pID=10&page=1','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(770,'2019-02-19 22:23:44',1,'product.php','cPath=13&product_type=1&pID=10&action=new_product','::1',0,'','��\0','Accessed page [product.php] with action=new_product. Review page_parameters and postdata for details.','info'),(771,'2019-02-19 22:23:50',1,'category_product_listing.php','cPath=13&pID=10','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(772,'2019-02-19 22:23:51',1,'category_product_listing.php','cID=13','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(773,'2019-02-19 22:23:53',1,'category_product_listing.php','cPath=1','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(774,'2019-02-19 22:23:55',1,'category_product_listing.php','cPath=1&product_type=1&pID=17&action=move_product&page=1','::1',0,'','��\0','Accessed page [category_product_listing.php] with action=move_product. Review page_parameters and postdata for details.','info'),(775,'2019-02-19 22:23:58',1,'category_product_listing.php','action=move_product_confirm&cPath=1&page=1','::1',0,'','�V*(�O)M.)��LQ�R24W�Q��/K�/ɏON,IM�/��J�(�\0','Accessed page [category_product_listing.php] with action=move_product_confirm. Review page_parameters and postdata for details.','info'),(776,'2019-02-19 22:23:58',1,'category_product_listing.php','action=move_product_confirm&cPath=1&page=1','::1',1,'','�V*(�O)M.)��LQ�R24W�Q��/K�/ɏON,IM�/��J�(�\0','Moved product 17 from category 1 to category 14','notice'),(777,'2019-02-19 22:23:58',1,'category_product_listing.php','cPath=14&pID=17&page=1','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(778,'2019-02-19 22:23:59',1,'category_product_listing.php','cID=14','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(779,'2019-02-19 22:24:01',1,'category_product_listing.php','cPath=1','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(780,'2019-02-19 22:24:03',1,'category_product_listing.php','cPath=1&product_type=1&pID=16&action=move_product&page=1','::1',0,'','��\0','Accessed page [category_product_listing.php] with action=move_product. Review page_parameters and postdata for details.','info'),(781,'2019-02-19 22:24:06',1,'category_product_listing.php','action=move_product_confirm&cPath=1&page=1','::1',0,'','�V*(�O)M.)��LQ�R24S�Q��/K�/ɏON,IM�/��J�*�\0','Accessed page [category_product_listing.php] with action=move_product_confirm. Review page_parameters and postdata for details.','info'),(782,'2019-02-19 22:24:06',1,'category_product_listing.php','action=move_product_confirm&cPath=1&page=1','::1',1,'','�V*(�O)M.)��LQ�R24S�Q��/K�/ɏON,IM�/��J�*�\0','Moved product 16 from category 1 to category 15','notice'),(783,'2019-02-19 22:24:06',1,'category_product_listing.php','cPath=15&pID=16&page=1','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(784,'2019-02-19 22:24:09',1,'category_product_listing.php','cID=15','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(785,'2019-02-19 22:24:11',1,'category_product_listing.php','cPath=1','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(786,'2019-02-19 22:24:11',1,'category_product_listing.php','cID=1&action=delete_category','::1',0,'','��\0','Accessed page [category_product_listing.php] with action=delete_category. Review page_parameters and postdata for details.','info'),(787,'2019-02-19 22:24:12',1,'category_product_listing.php','action=delete_category_confirm','::1',0,'','�VJN,IM�/�L-��LQ�2�\0','Accessed page [category_product_listing.php] with action=delete_category_confirm. Review page_parameters and postdata for details.','info'),(788,'2019-02-19 22:24:12',1,'category_product_listing.php','action=delete_category_confirm','::1',1,'','�VJN,IM�/�L-��LQ�2�\0','Deleted category 1 from database via admin console.','warning'),(789,'2019-02-19 22:24:12',1,'category_product_listing.php','','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(790,'2019-02-19 22:24:21',1,'category_product_listing.php','cPath=2','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(791,'2019-02-19 22:24:23',1,'category_product_listing.php','cID=2','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(792,'2019-02-19 22:24:25',1,'categories.php','action=new_category','::1',0,'','��\0','Accessed page [categories.php] with action=new_category. Review page_parameters and postdata for details.','info'),(793,'2019-02-19 22:24:31',1,'categories.php','action=insert_category','::1',0,'','U��\n�0D�%���]���Pm#i���*�������qT�^�8|I���v����h��;8~q\r&k-�z��\'�+�t��g,��|q���`쨪5�F|�','Accessed page [categories.php] with action=insert_category. Review page_parameters and postdata for details.','info'),(794,'2019-02-19 22:24:31',1,'category_product_listing.php','cID=16','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(795,'2019-02-19 22:24:33',1,'category_product_listing.php','cPath=16','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(796,'2019-02-19 22:24:35',1,'categories.php','cPath=16&action=new_category','::1',0,'','��\0','Accessed page [categories.php] with action=new_category. Review page_parameters and postdata for details.','info'),(797,'2019-02-19 22:24:43',1,'categories.php','action=insert_category&cPath=16','::1',0,'','U�K\n�0D�u\n���^�kp��Y��=IC�YΛ7̠����yr��O\ng����7Rz�����ӵk-?�24G/jWz�9�g.���� ��w4��U뾚��','Accessed page [categories.php] with action=insert_category. Review page_parameters and postdata for details.','info'),(798,'2019-02-19 22:24:43',1,'category_product_listing.php','cPath=16&cID=17','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(799,'2019-02-19 22:24:46',1,'categories.php','cPath=16&action=new_category','::1',0,'','��\0','Accessed page [categories.php] with action=new_category. Review page_parameters and postdata for details.','info'),(800,'2019-02-19 22:24:52',1,'categories.php','action=insert_category&cPath=16','::1',0,'','U�;\n�0D����\"���@*#��bk��mB��H�y�Yh�d��Q�B�����P��~x\r6��Put�6�r���9EQ��C��	1s�y:˓&�틺\rU���~�','Accessed page [categories.php] with action=insert_category. Review page_parameters and postdata for details.','info'),(801,'2019-02-19 22:24:52',1,'category_product_listing.php','cPath=16&cID=18','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(802,'2019-02-19 22:24:54',1,'category_product_listing.php','cID=16','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(803,'2019-02-19 22:24:56',1,'category_product_listing.php','cPath=2','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(804,'2019-02-19 22:24:58',1,'category_product_listing.php','cPath=2&product_type=1&pID=9&action=move_product&page=1','::1',0,'','��\0','Accessed page [category_product_listing.php] with action=move_product. Review page_parameters and postdata for details.','info'),(805,'2019-02-19 22:25:01',1,'category_product_listing.php','action=move_product_confirm&cPath=2&page=1','::1',0,'','�V*(�O)M.)��LQ�R�T�Q��/K�/ɏON,IM�/���Z(�\0','Accessed page [category_product_listing.php] with action=move_product_confirm. Review page_parameters and postdata for details.','info'),(806,'2019-02-19 22:25:01',1,'category_product_listing.php','action=move_product_confirm&cPath=2&page=1','::1',1,'','�V*(�O)M.)��LQ�R�T�Q��/K�/ɏON,IM�/���Z(�\0','Moved product 9 from category 2 to category 18','notice'),(807,'2019-02-19 22:25:01',1,'category_product_listing.php','cPath=18&pID=9&page=1','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(808,'2019-02-19 22:25:03',1,'category_product_listing.php','cID=18','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(809,'2019-02-19 22:25:04',1,'category_product_listing.php','cPath=2','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(810,'2019-02-19 22:25:07',1,'category_product_listing.php','cPath=2&product_type=1&pID=8&action=move_product&page=1','::1',0,'','��\0','Accessed page [category_product_listing.php] with action=move_product. Review page_parameters and postdata for details.','info'),(811,'2019-02-19 22:25:10',1,'category_product_listing.php','action=move_product_confirm&cPath=2&page=1','::1',0,'','�V*(�O)M.)��LQ�R�P�Q��/K�/ɏON,IM�/����+�\0','Accessed page [category_product_listing.php] with action=move_product_confirm. Review page_parameters and postdata for details.','info'),(812,'2019-02-19 22:25:10',1,'category_product_listing.php','action=move_product_confirm&cPath=2&page=1','::1',1,'','�V*(�O)M.)��LQ�R�P�Q��/K�/ɏON,IM�/����+�\0','Moved product 8 from category 2 to category 17','notice'),(813,'2019-02-19 22:25:10',1,'category_product_listing.php','cPath=17&pID=8&page=1','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(814,'2019-02-19 22:25:11',1,'category_product_listing.php','cID=17','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(815,'2019-02-19 22:25:13',1,'category_product_listing.php','cPath=16','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(816,'2019-02-19 22:25:14',1,'categories.php','cPath=16&action=new_category','::1',0,'','��\0','Accessed page [categories.php] with action=new_category. Review page_parameters and postdata for details.','info'),(817,'2019-02-19 22:25:22',1,'categories.php','action=insert_category&cPath=16','::1',0,'','U�1�0��\\S@�?\\�\"�\"�H��P!�N8�t���]�4sEȦ(^�������v\Z�Ѵ��ȩ��}�xy�2��Usz�����]�K���mm���Mj{HCC%[����q','Accessed page [categories.php] with action=insert_category. Review page_parameters and postdata for details.','info'),(818,'2019-02-19 22:25:22',1,'category_product_listing.php','cPath=16&cID=19','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(819,'2019-02-19 22:25:41',1,'category_product_listing.php','cID=16','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(820,'2019-02-19 22:25:44',1,'category_product_listing.php','cPath=2','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(821,'2019-02-19 22:25:46',1,'category_product_listing.php','cPath=2&product_type=1&pID=7&action=move_product&page=1','::1',0,'','��\0','Accessed page [category_product_listing.php] with action=move_product. Review page_parameters and postdata for details.','info'),(822,'2019-02-19 22:27:07',1,'banner_manager.php','','::1',0,'','��\0','Accessed page [banner_manager.php]','info'),(823,'2019-02-19 22:27:09',1,'banner_manager.php','page=1&bID=11','::1',0,'','��\0','Accessed page [banner_manager.php]','info'),(824,'2019-02-19 22:27:12',1,'banner_manager.php','page=1&bID=11&action=new','::1',0,'','��\0','Accessed page [banner_manager.php] with action=new. Review page_parameters and postdata for details.','info'),(825,'2019-02-19 22:27:20',1,'banner_manager.php','page=1&action=upd','::1',0,'','e��\n� E��<���?�Sp5��\ZI\"���)��\'ɹ���<mJ�ޙ�Gs1�V���[L$\\a���z���T�+{P�á�_�p�v`f*���\"f;���v;;��څ@�m�uz�i>U���//\Z(�X��r�\Z8�2-�J�v��B|e�(���o��\\�ڹ��','Accessed page [banner_manager.php] with action=upd. Review page_parameters and postdata for details.','info'),(826,'2019-02-19 22:27:20',1,'banner_manager.php','page=1&bID=11','::1',0,'','��\0','Accessed page [banner_manager.php]','info'),(827,'2019-02-19 22:27:40',1,'category_product_listing.php','','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(828,'2019-02-19 22:27:42',1,'category_product_listing.php','cPath=2','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(829,'2019-02-19 22:27:44',1,'category_product_listing.php','cPath=2&product_type=1&pID=7&action=move_product&page=1','::1',0,'','��\0','Accessed page [category_product_listing.php] with action=move_product. Review page_parameters and postdata for details.','info'),(830,'2019-02-19 22:27:48',1,'category_product_listing.php','action=move_product_confirm&cPath=2&page=1','::1',0,'','�V*(�O)M.)��LQ�R2W�Q��/K�/ɏON,IM�/���Z*�\0','Accessed page [category_product_listing.php] with action=move_product_confirm. Review page_parameters and postdata for details.','info'),(831,'2019-02-19 22:27:48',1,'category_product_listing.php','action=move_product_confirm&cPath=2&page=1','::1',1,'','�V*(�O)M.)��LQ�R2W�Q��/K�/ɏON,IM�/���Z*�\0','Moved product 7 from category 2 to category 19','notice'),(832,'2019-02-19 22:27:48',1,'category_product_listing.php','cPath=19&pID=7&page=1','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(833,'2019-02-19 22:27:51',1,'category_product_listing.php','cID=19','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(834,'2019-02-19 22:27:54',1,'category_product_listing.php','cPath=2','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(835,'2019-02-19 22:27:54',1,'category_product_listing.php','cID=2&action=delete_category','::1',0,'','��\0','Accessed page [category_product_listing.php] with action=delete_category. Review page_parameters and postdata for details.','info'),(836,'2019-02-19 22:27:55',1,'category_product_listing.php','action=delete_category_confirm','::1',0,'','�VJN,IM�/�L-��LQ�2�\0','Accessed page [category_product_listing.php] with action=delete_category_confirm. Review page_parameters and postdata for details.','info'),(837,'2019-02-19 22:27:55',1,'category_product_listing.php','action=delete_category_confirm','::1',1,'','�VJN,IM�/�L-��LQ�2�\0','Deleted category 2 from database via admin console.','warning'),(838,'2019-02-19 22:27:55',1,'category_product_listing.php','','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(839,'2019-02-19 22:28:03',1,'category_product_listing.php','cPath=5','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(840,'2019-02-19 22:28:05',1,'category_product_listing.php','cID=5','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(841,'2019-02-19 22:28:10',1,'category_product_listing.php','cPath=3','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(842,'2019-02-19 22:28:13',1,'category_product_listing.php','cID=3','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(843,'2019-02-19 22:28:18',1,'categories.php','action=new_category','::1',0,'','��\0','Accessed page [categories.php] with action=new_category. Review page_parameters and postdata for details.','info'),(844,'2019-02-19 22:28:27',1,'categories.php','action=insert_category','::1',0,'','U��\n�@DE��Ja����X��X�n�ޥ⿫�@,��f�����F\n��Π�ғM���n;m7IPg�WS+?�44�(�g��9!f.o^��\"��x��@ռEs�w��','Accessed page [categories.php] with action=insert_category. Review page_parameters and postdata for details.','info'),(845,'2019-02-19 22:28:27',1,'category_product_listing.php','cID=20','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(846,'2019-02-19 22:28:29',1,'category_product_listing.php','cPath=20','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(847,'2019-02-19 22:28:31',1,'categories.php','cPath=20&action=new_category','::1',0,'','��\0','Accessed page [categories.php] with action=new_category. Review page_parameters and postdata for details.','info'),(848,'2019-02-19 22:28:40',1,'categories.php','action=insert_category&cPath=20','::1',0,'','U�1\n�0��\\��i���q)�\"$]�����cq����J��5E*���T. �ҝ<-��\n�0���H�o�]|A�M_C��f��%�v����B���|�\'d����uk#X|��','Accessed page [categories.php] with action=insert_category. Review page_parameters and postdata for details.','info'),(849,'2019-02-19 22:28:40',1,'category_product_listing.php','cPath=20&cID=21','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(850,'2019-02-19 22:28:41',1,'category_product_listing.php','cID=20','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(851,'2019-02-19 22:28:43',1,'category_product_listing.php','cPath=3','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(852,'2019-02-19 22:28:44',1,'category_product_listing.php','cID=3','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(853,'2019-02-19 22:28:45',1,'category_product_listing.php','cPath=5','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(854,'2019-02-19 22:28:47',1,'category_product_listing.php','cPath=5&product_type=1&pID=6&action=move_product&page=1','::1',0,'','��\0','Accessed page [category_product_listing.php] with action=move_product. Review page_parameters and postdata for details.','info'),(855,'2019-02-19 22:28:51',1,'category_product_listing.php','action=move_product_confirm&cPath=5&page=1','::1',0,'','�V*(�O)M.)��LQ�R2S�Q��/K�/ɏON,IM�/���*�\0','Accessed page [category_product_listing.php] with action=move_product_confirm. Review page_parameters and postdata for details.','info'),(856,'2019-02-19 22:28:51',1,'category_product_listing.php','action=move_product_confirm&cPath=5&page=1','::1',1,'','�V*(�O)M.)��LQ�R2S�Q��/K�/ɏON,IM�/���*�\0','Moved product 6 from category 5 to category 21','notice'),(857,'2019-02-19 22:28:51',1,'category_product_listing.php','cPath=21&pID=6&page=1','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(858,'2019-02-19 22:28:52',1,'category_product_listing.php','cID=21','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(859,'2019-02-19 22:28:55',1,'category_product_listing.php','cPath=5','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(860,'2019-02-19 22:28:55',1,'category_product_listing.php','cID=5&action=delete_category','::1',0,'','��\0','Accessed page [category_product_listing.php] with action=delete_category. Review page_parameters and postdata for details.','info'),(861,'2019-02-19 22:28:56',1,'category_product_listing.php','action=delete_category_confirm','::1',0,'','�VJN,IM�/�L-��LQ�2�\0','Accessed page [category_product_listing.php] with action=delete_category_confirm. Review page_parameters and postdata for details.','info'),(862,'2019-02-19 22:28:56',1,'category_product_listing.php','action=delete_category_confirm','::1',1,'','�VJN,IM�/�L-��LQ�2�\0','Deleted category 5 from database via admin console.','warning'),(863,'2019-02-19 22:28:56',1,'category_product_listing.php','','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(864,'2019-02-19 22:28:58',1,'category_product_listing.php','cPath=3','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(865,'2019-02-19 22:29:00',1,'category_product_listing.php','cID=3','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(866,'2019-02-19 22:29:01',1,'category_product_listing.php','cPath=20','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(867,'2019-02-19 22:29:02',1,'categories.php','cPath=20&action=new_category','::1',0,'','��\0','Accessed page [categories.php] with action=new_category. Review page_parameters and postdata for details.','info'),(868,'2019-02-19 22:29:08',1,'categories.php','action=insert_category&cPath=20','::1',0,'','U�A\n�@�����|�L\Z�ɒɞĿ�+z��jz��C�9�g��}\'��RZi�D\Z^��9mI�ώO���=\rԒ~����Es����*/\"�ho4��G6��','Accessed page [categories.php] with action=insert_category. Review page_parameters and postdata for details.','info'),(869,'2019-02-19 22:29:08',1,'category_product_listing.php','cPath=20&cID=22','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(870,'2019-02-19 22:29:10',1,'category_product_listing.php','cID=20','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(871,'2019-02-19 22:29:11',1,'category_product_listing.php','cPath=20','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(872,'2019-02-19 22:29:13',1,'category_product_listing.php','cID=20','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(873,'2019-02-19 22:29:14',1,'category_product_listing.php','cPath=3','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(874,'2019-02-19 22:29:17',1,'category_product_listing.php','cID=3','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(875,'2019-02-19 22:29:18',1,'category_product_listing.php','cPath=20','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(876,'2019-02-19 22:29:20',1,'categories.php','cPath=20&action=new_category','::1',0,'','��\0','Accessed page [categories.php] with action=new_category. Review page_parameters and postdata for details.','info'),(877,'2019-02-19 22:29:30',1,'categories.php','action=insert_category&cPath=20','::1',0,'','U�K\n�0D���3�@?�֕xwv9o�0;-��)�W!7�9��N9�- �������MK������ݩ�5q�O�7�o�AD��h�P-�|1��?N','Accessed page [categories.php] with action=insert_category. Review page_parameters and postdata for details.','info'),(878,'2019-02-19 22:29:30',1,'category_product_listing.php','cPath=20&cID=23','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(879,'2019-02-19 22:29:32',1,'categories.php','cPath=20&action=new_category','::1',0,'','��\0','Accessed page [categories.php] with action=new_category. Review page_parameters and postdata for details.','info'),(880,'2019-02-19 22:29:39',1,'categories.php','action=insert_category&cPath=20','::1',0,'','U��\n�0De�y���3��m$�\"\"��ꊠ�y�Yi��d��Q�B����V�P�ޖWo3���#�����ʥ��E�H]3\'�����Y�D0��g���h.��','Accessed page [categories.php] with action=insert_category. Review page_parameters and postdata for details.','info'),(881,'2019-02-19 22:29:39',1,'category_product_listing.php','cPath=20&cID=24','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(882,'2019-02-19 22:29:41',1,'category_product_listing.php','cID=20','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(883,'2019-02-19 22:29:43',1,'category_product_listing.php','cPath=3','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(884,'2019-02-19 22:29:46',1,'category_product_listing.php','cPath=3&product_type=1&pID=3&action=move_product&page=1','::1',0,'','��\0','Accessed page [category_product_listing.php] with action=move_product. Review page_parameters and postdata for details.','info'),(885,'2019-02-19 22:29:51',1,'category_product_listing.php','action=move_product_confirm&cPath=3&page=1','::1',0,'','�V*(�O)M.)��LQ�R2V�Q��/K�/ɏON,IM�/���)�\0','Accessed page [category_product_listing.php] with action=move_product_confirm. Review page_parameters and postdata for details.','info'),(886,'2019-02-19 22:29:51',1,'category_product_listing.php','action=move_product_confirm&cPath=3&page=1','::1',1,'','�V*(�O)M.)��LQ�R2V�Q��/K�/ɏON,IM�/���)�\0','Moved product 3 from category 3 to category 22','notice'),(887,'2019-02-19 22:29:51',1,'category_product_listing.php','cPath=22&pID=3&page=1','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(888,'2019-02-19 22:29:52',1,'category_product_listing.php','cID=22','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(889,'2019-02-19 22:29:54',1,'category_product_listing.php','cPath=3','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(890,'2019-02-19 22:29:55',1,'category_product_listing.php','cPath=3&product_type=1&pID=4&action=move_product&page=1','::1',0,'','��\0','Accessed page [category_product_listing.php] with action=move_product. Review page_parameters and postdata for details.','info'),(891,'2019-02-19 22:29:59',1,'category_product_listing.php','action=move_product_confirm&cPath=3&page=1','::1',0,'','�V*(�O)M.)��LQ�R2Q�Q��/K�/ɏON,IM�/���+�\0','Accessed page [category_product_listing.php] with action=move_product_confirm. Review page_parameters and postdata for details.','info'),(892,'2019-02-19 22:29:59',1,'category_product_listing.php','action=move_product_confirm&cPath=3&page=1','::1',1,'','�V*(�O)M.)��LQ�R2Q�Q��/K�/ɏON,IM�/���+�\0','Moved product 4 from category 3 to category 23','notice'),(893,'2019-02-19 22:29:59',1,'category_product_listing.php','cPath=23&pID=4&page=1','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(894,'2019-02-19 22:30:00',1,'product.php','cPath=23&product_type=1&pID=4&action=new_product','::1',0,'','��\0','Accessed page [product.php] with action=new_product. Review page_parameters and postdata for details.','info'),(895,'2019-02-19 22:30:05',1,'product.php','cPath=23&pID=4&action=new_product_preview','::1',0,'','�S펂@|���\0����̦��,,v�(1��-�����3�)U�3!-m�j�R�T%xA�9�	�&K�W���^�գ1�X�{v�Q3娽����&�$>c���o����(\r\r����x�$ݬ�t�e��*�!���7����\n��s�#��q�V]UM>*��.���}���]�A�idf��Y��Mȼ��ރ3;�/�Rk�%��K{�vЯ��ꚪb�y�V������\0�P�861����p�1�\"BE򙧤3�Y��s�Z�U���@~�>��(�笈ڌ���`gҫ�ؐ1�\n�wv]G����\"�,-= *����5�\'&���۝L	��\n/�OH�A��u�`��_�/ޘެ�ړl�n��6�ݦ���','Accessed page [product.php] with action=new_product_preview. Review page_parameters and postdata for details.','info'),(896,'2019-02-19 22:30:06',1,'product.php','cPath=23&pID=4&action=update_product','::1',0,'','�R펂@|�o5��.�/���M�]���ʇ����ig�;��\"�CƊ��D�(��Q�\r����x�ZZ���W\Z}�B����H��\"*��(�H�Z�x����� �YD)�\0Z8ؖ7���&I6i�)/�2dhP���V�E���m�X�Q�V�F3�!��&C�2~���v�{����ިwA�\0v.��^��\'�*,�)�up����JF�8����!��1��D^�)�6z�+��{�pڴ�Ǉ2tA�[@��Q�����\\rF�HP��<_�]]	�L��6*0%�\Z�O<5ݦ�7<�y�F�;�]�t��V��>��\'�;��B��DK�C���7�V��|���~%ގЁ�5���t�','Accessed page [product.php] with action=update_product. Review page_parameters and postdata for details.','info'),(897,'2019-02-19 22:30:06',1,'product.php','cPath=23&pID=4&action=update_product','::1',0,'','�R펂@|�o5��.�/���M�]���ʇ����ig�;��\"�CƊ��D�(��Q�\r����x�ZZ���W\Z}�B����H��\"*��(�H�Z�x����� �YD)�\0Z8ؖ7���&I6i�)/�2dhP���V�E���m�X�Q�V�F3�!��&C�2~���v�{����ިwA�\0v.��^��\'�*,�)�up����JF�8����!��1��D^�)�6z�+��{�pڴ�Ǉ2tA�[@��Q�����\\rF�HP��<_�]]	�L��6*0%�\Z�O<5ݦ�7<�y�F�;�]�t��V��>��\'�;��B��DK�C���7�V��|���~%ގЁ�5���t�','Updated product 4 via admin console.','info'),(898,'2019-02-19 22:30:06',1,'category_product_listing.php','cPath=23&pID=4','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(899,'2019-02-19 22:30:08',1,'category_product_listing.php','cID=23','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(900,'2019-02-19 22:30:12',1,'category_product_listing.php','cPath=20','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(901,'2019-02-19 22:30:14',1,'categories.php','cPath=20&action=new_category','::1',0,'','��\0','Accessed page [categories.php] with action=new_category. Review page_parameters and postdata for details.','info'),(902,'2019-02-19 22:30:18',1,'categories.php','action=insert_category&cPath=20','::1',0,'','U��\n�0�_E2;Ե���^�	%`I� �����}�������p	B�]�%�ߠ��M��� .��\\E�+^��H�J?]F	��S>�x�z^�;QQ�A����','Accessed page [categories.php] with action=insert_category. Review page_parameters and postdata for details.','info'),(903,'2019-02-19 22:30:18',1,'category_product_listing.php','cPath=20&cID=25','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(904,'2019-02-19 22:33:45',1,'keepalive.php','','::1',0,'','��\0','Accessed page [keepalive.php]','info'),(905,'2019-02-19 22:33:47',1,'category_product_listing.php','cID=20','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(906,'2019-02-19 22:33:49',1,'category_product_listing.php','cPath=3','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(907,'2019-02-19 22:33:51',1,'category_product_listing.php','cPath=3&product_type=1&pID=2&action=move_product&page=1','::1',0,'','��\0','Accessed page [category_product_listing.php] with action=move_product. Review page_parameters and postdata for details.','info'),(908,'2019-02-19 22:33:55',1,'category_product_listing.php','action=move_product_confirm&cPath=3&page=1','::1',0,'','�V*(�O)M.)��LQ�R2R�Q��/K�/ɏON,IM�/��ʘ*�\0','Accessed page [category_product_listing.php] with action=move_product_confirm. Review page_parameters and postdata for details.','info'),(909,'2019-02-19 22:33:55',1,'category_product_listing.php','action=move_product_confirm&cPath=3&page=1','::1',1,'','�V*(�O)M.)��LQ�R2R�Q��/K�/ɏON,IM�/��ʘ*�\0','Moved product 2 from category 3 to category 25','notice'),(910,'2019-02-19 22:33:55',1,'category_product_listing.php','cPath=25&pID=2&page=1','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(911,'2019-02-19 22:33:56',1,'category_product_listing.php','cID=25','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(912,'2019-02-19 22:33:58',1,'category_product_listing.php','cPath=3','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(913,'2019-02-19 22:34:00',1,'category_product_listing.php','cPath=3&product_type=1&pID=5&action=move_product&page=1','::1',0,'','��\0','Accessed page [category_product_listing.php] with action=move_product. Review page_parameters and postdata for details.','info'),(914,'2019-02-19 22:34:03',1,'category_product_listing.php','action=move_product_confirm&cPath=3&page=1','::1',0,'','�V*(�O)M.)��LQ�R2U�Q��/K�/ɏON,IM�/����(�\0','Accessed page [category_product_listing.php] with action=move_product_confirm. Review page_parameters and postdata for details.','info'),(915,'2019-02-19 22:34:03',1,'category_product_listing.php','action=move_product_confirm&cPath=3&page=1','::1',1,'','�V*(�O)M.)��LQ�R2U�Q��/K�/ɏON,IM�/����(�\0','Moved product 5 from category 3 to category 24','notice'),(916,'2019-02-19 22:34:03',1,'category_product_listing.php','cPath=24&pID=5&page=1','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(917,'2019-02-19 22:34:05',1,'category_product_listing.php','cID=24','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(918,'2019-02-19 22:34:07',1,'category_product_listing.php','cPath=3','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(919,'2019-02-19 22:34:07',1,'category_product_listing.php','cID=3&action=delete_category','::1',0,'','��\0','Accessed page [category_product_listing.php] with action=delete_category. Review page_parameters and postdata for details.','info'),(920,'2019-02-19 22:34:08',1,'category_product_listing.php','action=delete_category_confirm','::1',0,'','�VJN,IM�/�L-��LQ�2�\0','Accessed page [category_product_listing.php] with action=delete_category_confirm. Review page_parameters and postdata for details.','info'),(921,'2019-02-19 22:34:08',1,'category_product_listing.php','action=delete_category_confirm','::1',1,'','�VJN,IM�/�L-��LQ�2�\0','Deleted category 3 from database via admin console.','warning'),(922,'2019-02-19 22:34:08',1,'category_product_listing.php','','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(923,'2019-02-19 22:34:11',1,'category_product_listing.php','cPath=7','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(924,'2019-02-19 22:34:13',1,'category_product_listing.php','cID=7','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(925,'2019-02-19 22:34:14',1,'categories.php','action=new_category','::1',0,'','��\0','Accessed page [categories.php] with action=new_category. Review page_parameters and postdata for details.','info'),(926,'2019-02-19 22:34:17',1,'categories.php','action=insert_category','::1',0,'','U�K\n�0D��\0^�3�@?�֕xw�\"�r޼avZ�!ST�Bn�$s��&r4k����!���ڴ�W솦�E�����|�q|ʇ\"�uE�j��	��q','Accessed page [categories.php] with action=insert_category. Review page_parameters and postdata for details.','info'),(927,'2019-02-19 22:34:17',1,'category_product_listing.php','cID=26','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(928,'2019-02-19 22:34:20',1,'category_product_listing.php','cPath=26','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(929,'2019-02-19 22:34:22',1,'categories.php','cPath=26&action=new_category','::1',0,'','��\0','Accessed page [categories.php] with action=new_category. Review page_parameters and postdata for details.','info'),(930,'2019-02-19 22:34:26',1,'categories.php','action=insert_category&cPath=26','::1',0,'','U�K\n�0D���	�E	&�`?�֕���y�9a��>�pqB`��%	#�=a�6h����*{��^k�#ё~�D��\"��S>�8p�?`:*Y��J|��','Accessed page [categories.php] with action=insert_category. Review page_parameters and postdata for details.','info'),(931,'2019-02-19 22:34:26',1,'category_product_listing.php','cPath=26&cID=27','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(932,'2019-02-19 22:34:28',1,'categories.php','cPath=26&action=new_category','::1',0,'','��\0','Accessed page [categories.php] with action=new_category. Review page_parameters and postdata for details.','info'),(933,'2019-02-19 22:34:32',1,'categories.php','action=insert_category&cPath=26','::1',0,'','U�;\n�@D�\"�-��Xx�%���D�k%������\r������p�B��K3Cؠ�\0��6#*�?��L.K�׼�)���~�dL3��S>�x�z~Aw�b^�9��','Accessed page [categories.php] with action=insert_category. Review page_parameters and postdata for details.','info'),(934,'2019-02-19 22:34:32',1,'category_product_listing.php','cPath=26&cID=28','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(935,'2019-02-19 22:34:34',1,'categories.php','cPath=26&action=new_category','::1',0,'','��\0','Accessed page [categories.php] with action=new_category. Review page_parameters and postdata for details.','info'),(936,'2019-02-19 22:34:37',1,'categories.php','action=insert_category&cPath=26','::1',0,'','U�K\n�0D���J�6��U���!�r޼a\Z,�Ԅk�0_R03��Mա�z⺘l.Z^�2$�HbW��1q�Xv\\��!�+�y㉪�G5�{�','Accessed page [categories.php] with action=insert_category. Review page_parameters and postdata for details.','info'),(937,'2019-02-19 22:34:37',1,'category_product_listing.php','cPath=26&cID=29','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(938,'2019-02-19 22:34:38',1,'categories.php','cPath=26&action=new_category','::1',0,'','��\0','Accessed page [categories.php] with action=new_category. Review page_parameters and postdata for details.','info'),(939,'2019-02-19 22:34:43',1,'categories.php','action=insert_category&cPath=26','::1',0,'','U��\n�0D�h�J?�K����:��{��B3޻w�J�Ckw��J���46��҃�x	F�=M�i����8�@o��a�j��.:��f����,O\":k�4�ht��]���>','Accessed page [categories.php] with action=insert_category. Review page_parameters and postdata for details.','info'),(940,'2019-02-19 22:34:43',1,'category_product_listing.php','cPath=26&cID=30','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(941,'2019-02-19 22:34:45',1,'category_product_listing.php','cID=26','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(942,'2019-02-19 22:34:47',1,'category_product_listing.php','cPath=7','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(943,'2019-02-19 22:34:48',1,'category_product_listing.php','cPath=7&product_type=1&pID=15&action=move_product&page=1','::1',0,'','��\0','Accessed page [category_product_listing.php] with action=move_product. Review page_parameters and postdata for details.','info'),(944,'2019-02-19 22:34:55',1,'category_product_listing.php','action=move_product_confirm&cPath=7&page=1','::1',0,'','�V*(�O)M.)��LQ�R24U�Q��/K�/ɏON,IM�/��HY*�\0','Accessed page [category_product_listing.php] with action=move_product_confirm. Review page_parameters and postdata for details.','info'),(945,'2019-02-19 22:34:55',1,'category_product_listing.php','action=move_product_confirm&cPath=7&page=1','::1',1,'','�V*(�O)M.)��LQ�R24U�Q��/K�/ɏON,IM�/��HY*�\0','Moved product 15 from category 7 to category 29','notice'),(946,'2019-02-19 22:34:55',1,'category_product_listing.php','cPath=29&pID=15&page=1','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(947,'2019-02-19 22:34:56',1,'product.php','cPath=29&product_type=1&pID=15&action=new_product','::1',0,'','��\0','Accessed page [product.php] with action=new_product. Review page_parameters and postdata for details.','info'),(948,'2019-02-19 22:35:02',1,'product.php','cPath=29&pID=15&action=new_product_preview','::1',0,'','�S�n�0���sj��c/�k����d�&�(�^yHT�3����9��*/YpW�(���#*��&!�ua	��B)݅��B\'�����mQ�ɖsDM(�p��R/����L����Zz�L	h\0\r��M�d�N�u�98��${�ts=eWP�9<�Eߐw�����\"��z�P+���M(�w�	sϋ$Z!\r���%�u�c<Y7$���\Z$�`�����w��ƪ�k��mߤ{�P1�%6���?��g������j���v��f��mX�=���)��*����n��	Ev�O|�[�\"��,®��A���m��D�znq���sEO�������0&��Cæ+5�3ly����*M�4����','Accessed page [product.php] with action=new_product_preview. Review page_parameters and postdata for details.','info'),(949,'2019-02-19 22:35:03',1,'product.php','cPath=29&pID=15&action=update_product','::1',0,'','�Rˎ�0�����������R���CAU�}�����gƙkP��.c�m��$���@�eE\"V�!TV�����{w�mf\\��6ő��#*�L	k�3u��]��a�ٻ��f/J@\rX@Zt�q�Q��>{�;BƎ=T��Z�E��v��bU�i+��0u���Ј�\0{�Z��;��dloo?��H�XJ���_�V����̭HM��tg%����{5��!�Y0L�D~ϣ�Q�]��\'Ƶ���==���8^\rywL3û�J��:�A�a�G�B=��Ԋ.���l��3^�\'���b:8^������>�a���8J�8	�����r�Z���v�ӹ	n�u�f��)�I�Q�Z_���','Accessed page [product.php] with action=update_product. Review page_parameters and postdata for details.','info'),(950,'2019-02-19 22:35:03',1,'product.php','cPath=29&pID=15&action=update_product','::1',0,'','�Rˎ�0�����������R���CAU�}�����gƙkP��.c�m��$���@�eE\"V�!TV�����{w�mf\\��6ő��#*�L	k�3u��]��a�ٻ��f/J@\rX@Zt�q�Q��>{�;BƎ=T��Z�E��v��bU�i+��0u���Ј�\0{�Z��;��dloo?��H�XJ���_�V����̭HM��tg%����{5��!�Y0L�D~ϣ�Q�]��\'Ƶ���==���8^\rywL3û�J��:�A�a�G�B=��Ԋ.���l��3^�\'���b:8^������>�a���8J�8	�����r�Z���v�ӹ	n�u�f��)�I�Q�Z_���','Updated product 15 via admin console.','info'),(951,'2019-02-19 22:35:03',1,'category_product_listing.php','cPath=29&pID=15','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(952,'2019-02-19 22:35:04',1,'category_product_listing.php','cID=29','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(953,'2019-02-19 22:35:07',1,'category_product_listing.php','cPath=7','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(954,'2019-02-19 22:35:09',1,'category_product_listing.php','cPath=7&product_type=1&pID=12&action=move_product&page=1','::1',0,'','��\0','Accessed page [category_product_listing.php] with action=move_product. Review page_parameters and postdata for details.','info'),(955,'2019-02-19 22:35:13',1,'category_product_listing.php','action=move_product_confirm&cPath=7&page=1','::1',0,'','�V*(�O)M.)��LQ�R24R�Q��/K�/ɏON,IM�/��H(�\0','Accessed page [category_product_listing.php] with action=move_product_confirm. Review page_parameters and postdata for details.','info'),(956,'2019-02-19 22:35:13',1,'category_product_listing.php','action=move_product_confirm&cPath=7&page=1','::1',1,'','�V*(�O)M.)��LQ�R24R�Q��/K�/ɏON,IM�/��H(�\0','Moved product 12 from category 7 to category 30','notice'),(957,'2019-02-19 22:35:13',1,'category_product_listing.php','cPath=30&pID=12&page=1','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(958,'2019-02-19 22:35:15',1,'product.php','cPath=30&product_type=1&pID=12&action=new_product','::1',0,'','��\0','Accessed page [product.php] with action=new_product. Review page_parameters and postdata for details.','info'),(959,'2019-02-19 22:35:19',1,'product.php','cPath=30&pID=12&action=new_product_preview','::1',0,'','�S�n�0��*炒p�[��6���#��<���:��H@�1;�ϬOE��$-J���*>Q���60aTd�hQ�����C�7���ZspcDǤQ��Y)��y��G@����gO\nv@\Z���e��U�l1�i\rZ#_M׏l.sN��U�\r�\0��/��\n�NQ̖qt���k_^Ĩ�@��I2IC࠴�x�4��`H����;bI`����8�WqC]G�+n娚px�6�ʐ�&�#��gD�$�u�Ljƨ�:����z(���yO�.�sywRN�A�g���ah~��a���ڼ�<�/�l��ΰC�3	���~�`,�ؾ��Gj72έ\rCf��tY{c.I]V��g��Vu�����','Accessed page [product.php] with action=new_product_preview. Review page_parameters and postdata for details.','info'),(960,'2019-02-19 22:35:20',1,'product.php','cPath=30&pID=12&action=update_product','::1',0,'','��ђ�0E��yu\0��mg?�ڈ��i�:�����*��<67�熜����Z��:L�$K>�� +\r��eB�Ȅ�:\r���)CN[���Ֆm3UtL\Z���B-_��{8��F���@5�u���l����z\0o��xF�A�nE.��6�j�뗀F�\'\"L��YJ���5��ռ�e�!y�ֹ1�S=�x��P�4�+������:��J{|����V(H,��oj�S�q�0V���OCG4��}4��c��\'��v��.5t�B�a����\nzj�po<4_�*����=�Ip\n3h������T�d�?^�}v�׳4��z�i��6�<+��F��?)΁�H��D��!Rry��N3uB�������m��','Accessed page [product.php] with action=update_product. Review page_parameters and postdata for details.','info'),(961,'2019-02-19 22:35:20',1,'product.php','cPath=30&pID=12&action=update_product','::1',0,'','��ђ�0E��yu\0��mg?�ڈ��i�:�����*��<67�熜����Z��:L�$K>�� +\r��eB�Ȅ�:\r���)CN[���Ֆm3UtL\Z���B-_��{8��F���@5�u���l����z\0o��xF�A�nE.��6�j�뗀F�\'\"L��YJ���5��ռ�e�!y�ֹ1�S=�x��P�4�+������:��J{|����V(H,��oj�S�q�0V���OCG4��}4��c��\'��v��.5t�B�a����\nzj�po<4_�*����=�Ip\n3h������T�d�?^�}v�׳4��z�i��6�<+��F��?)΁�H��D��!Rry��N3uB�������m��','Updated product 12 via admin console.','info'),(962,'2019-02-19 22:35:20',1,'category_product_listing.php','cPath=30&pID=12','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(963,'2019-02-19 22:35:21',1,'category_product_listing.php','cID=30','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(964,'2019-02-19 22:35:23',1,'category_product_listing.php','cPath=7','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(965,'2019-02-19 22:35:25',1,'category_product_listing.php','cPath=7&product_type=1&pID=13&action=move_product&page=1','::1',0,'','��\0','Accessed page [category_product_listing.php] with action=move_product. Review page_parameters and postdata for details.','info'),(966,'2019-02-19 22:35:29',1,'category_product_listing.php','action=move_product_confirm&cPath=7&page=1','::1',0,'','�V*(�O)M.)��LQ�R24V�Q��/K�/ɏON,IM�/��H�+�\0','Accessed page [category_product_listing.php] with action=move_product_confirm. Review page_parameters and postdata for details.','info'),(967,'2019-02-19 22:35:29',1,'category_product_listing.php','action=move_product_confirm&cPath=7&page=1','::1',1,'','�V*(�O)M.)��LQ�R24V�Q��/K�/ɏON,IM�/��H�+�\0','Moved product 13 from category 7 to category 27','notice'),(968,'2019-02-19 22:35:29',1,'category_product_listing.php','cPath=27&pID=13&page=1','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(969,'2019-02-19 22:35:32',1,'product.php','cPath=27&product_type=1&pID=13&action=new_product','::1',0,'','��\0','Accessed page [product.php] with action=new_product. Review page_parameters and postdata for details.','info'),(970,'2019-02-19 22:35:36',1,'product.php','cPath=27&pID=13&action=new_product_preview','::1',0,'','�S[n�0�J��&��jN�[Xvȶ6&�5E�{\r�A Q���x�3�I��T(XrWk��x<k��.��Ue�qv�{��.T7b�r(w��QZzGQ)�6�$~S�g��/��GO\Z@��e�$�Z��*�Wa�t5=eW`#��܊�`~��6��O={IZ�1O�+�w�	���ZY�K��W����|���t� q\0�4���^�=�5V�\\����]�\"�C��1B�X���?��GD��_�Xl�Zt�}AX3��ZҤ�;��=H[�t��c��Ab��>�}�{�S�2�ЖqEi��(n��D�h:��[����\\0�y������<�~�Ǥ�ΰ�J\r�۝d���-K�Y��|��','Accessed page [product.php] with action=new_product_preview. Review page_parameters and postdata for details.','info'),(971,'2019-02-19 22:35:37',1,'product.php','cPath=27&pID=13&action=update_product','::1',0,'','�R�n�0|���k��4�`o�$����CAU�}��G����s|�j��K��:ʢ$z�Jp�IH`]XB��\0���ҝP��ս1~	�=�rɨ	��RP\n�n�7%8����18x�\0\Z�M/����&I6�h��{��I����[�V��l_�`�S�J�\0f���*%C+�w�Z�?\r6&/Ⱥ>�n\n5H���\r�9A7��u�U�T<r\'r۾X��C�(�T����Ю�_!��)�����g�K�t�{�(ݠ�a�%�.��nj]�E�2\Z[����l��D�zia���K�����������WW>�RC���t�|��I����cʭ�V��K}��e:H;IX3��ƙ����z1�?','Accessed page [product.php] with action=update_product. Review page_parameters and postdata for details.','info'),(972,'2019-02-19 22:35:37',1,'product.php','cPath=27&pID=13&action=update_product','::1',0,'','�R�n�0|���k��4�`o�$����CAU�}��G����s|�j��K��:ʢ$z�Jp�IH`]XB��\0���ҝP��ս1~	�=�rɨ	��RP\n�n�7%8����18x�\0\Z�M/����&I6�h��{��I����[�V��l_�`�S�J�\0f���*%C+�w�Z�?\r6&/Ⱥ>�n\n5H���\r�9A7��u�U�T<r\'r۾X��C�(�T����Ю�_!��)�����g�K�t�{�(ݠ�a�%�.��nj]�E�2\Z[����l��D�zia���K�����������WW>�RC���t�|��I����cʭ�V��K}��e:H;IX3��ƙ����z1�?','Updated product 13 via admin console.','info'),(973,'2019-02-19 22:35:37',1,'category_product_listing.php','cPath=27&pID=13','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(974,'2019-02-19 22:35:42',1,'category_product_listing.php','cID=27','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(975,'2019-02-19 22:35:44',1,'category_product_listing.php','cPath=7','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(976,'2019-02-19 22:35:46',1,'category_product_listing.php','cPath=7&product_type=1&pID=14&action=move_product&page=1','::1',0,'','��\0','Accessed page [category_product_listing.php] with action=move_product. Review page_parameters and postdata for details.','info'),(977,'2019-02-19 22:35:49',1,'category_product_listing.php','action=move_product_confirm&cPath=7&page=1','::1',0,'','�V*(�O)M.)��LQ�R24Q�Q��/K�/ɏON,IM�/��HY(�\0','Accessed page [category_product_listing.php] with action=move_product_confirm. Review page_parameters and postdata for details.','info'),(978,'2019-02-19 22:35:49',1,'category_product_listing.php','action=move_product_confirm&cPath=7&page=1','::1',1,'','�V*(�O)M.)��LQ�R24Q�Q��/K�/ɏON,IM�/��HY(�\0','Moved product 14 from category 7 to category 28','notice'),(979,'2019-02-19 22:35:49',1,'category_product_listing.php','cPath=28&pID=14&page=1','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(980,'2019-02-19 22:35:50',1,'product.php','cPath=28&product_type=1&pID=14&action=new_product','::1',0,'','��\0','Accessed page [product.php] with action=new_product. Review page_parameters and postdata for details.','info'),(981,'2019-02-19 22:35:56',1,'product.php','cPath=28&pID=14&action=new_product_preview','::1',0,'','�S[��0�J��������~�\"��ԫ�P�iAU���V��d�csJj�:���M�N��#� �!U\0����PK)�����P��n��mQm�WcDMX<��Ԗ�T�# 0pG��œ�����d�4[ͳ|�/{�.n��H����*���u�M��~�%�@a�f�Mw[��/;�j�*`&�D���Ш�B�x��_v>DS�]�����#ةA�Gh�*찮ѕc�=�j�7��#8F�x�2�\n�h&\nψ���T�=��	a���uP��;ޓt��ry��GI����\Ze�#��ڔĪ�M���cDߚ���Б�����\rƚ��K�G��ǁu�?�5���E׺��_�4�g�Y����L��','Accessed page [product.php] with action=new_product_preview. Review page_parameters and postdata for details.','info'),(982,'2019-02-19 22:35:57',1,'product.php','cPath=28&pID=14&action=update_product','::1',0,'','�R[��0�J���*h+m{���3D���+H��PPջ����V��ʌ=3��QEN�����vQ}D%x6�2`�;B�j��/��t�4��{/\\�՞\\9eT��Qޑ(	�Y��{&x����X<)�H�N6Y��e�,�Mo܆=d�����Z�+fb�{͠(^\Z�*m0��g)\Z��R�����99ߥ�<C5(��8A;�W��U�6�*�U�k���2\nő�ݖh�c@3S3�E~�Sbc�;�{�.�6]��L�.�tKȻY\"9++^�V&\"��\Z\rU=GIsߓ�\r��L]��X`�y2�x\Z�;�!����{Ժ����:Y��E���q-�b�,^vѷDY���.�͌�+Fgo��x��r>�?','Accessed page [product.php] with action=update_product. Review page_parameters and postdata for details.','info'),(983,'2019-02-19 22:35:57',1,'product.php','cPath=28&pID=14&action=update_product','::1',0,'','�R[��0�J���*h+m{���3D���+H��PPջ����V��ʌ=3��QEN�����vQ}D%x6�2`�;B�j��/��t�4��{/\\�՞\\9eT��Qޑ(	�Y��{&x����X<)�H�N6Y��e�,�Mo܆=d�����Z�+fb�{͠(^\Z�*m0��g)\Z��R�����99ߥ�<C5(��8A;�W��U�6�*�U�k���2\nő�ݖh�c@3S3�E~�Sbc�;�{�.�6]��L�.�tKȻY\"9++^�V&\"��\Z\rU=GIsߓ�\r��L]��X`�y2�x\Z�;�!����{Ժ����:Y��E���q-�b�,^vѷDY���.�͌�+Fgo��x��r>�?','Updated product 14 via admin console.','info'),(984,'2019-02-19 22:35:57',1,'category_product_listing.php','cPath=28&pID=14','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(985,'2019-02-19 22:35:59',1,'category_product_listing.php','cID=28','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(986,'2019-02-19 22:36:01',1,'category_product_listing.php','cPath=7','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(987,'2019-02-19 22:36:01',1,'category_product_listing.php','cID=7&action=delete_category','::1',0,'','��\0','Accessed page [category_product_listing.php] with action=delete_category. Review page_parameters and postdata for details.','info'),(988,'2019-02-19 22:36:02',1,'category_product_listing.php','action=delete_category_confirm','::1',0,'','�VJN,IM�/�L-��LQ�2�\0','Accessed page [category_product_listing.php] with action=delete_category_confirm. Review page_parameters and postdata for details.','info'),(989,'2019-02-19 22:36:02',1,'category_product_listing.php','action=delete_category_confirm','::1',1,'','�VJN,IM�/�L-��LQ�2�\0','Deleted category 7 from database via admin console.','warning'),(990,'2019-02-19 22:36:02',1,'category_product_listing.php','','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(991,'2019-02-19 22:36:04',1,'index.php','','::1',0,'','��\0','Accessed page [index.php]','info'),(992,'2019-02-19 22:50:19',1,'keepalive.php','','::1',0,'','��\0','Accessed page [keepalive.php]','info'),(993,'2019-02-19 22:50:21',1,'keepalive.php','','::1',0,'','��\0','Accessed page [keepalive.php]','info'),(994,'2019-02-19 22:54:17',1,'keepalive.php','','::1',0,'','��\0','Accessed page [keepalive.php]','info'),(995,'2019-02-19 22:55:51',1,'index.php','','::1',0,'','��\0','Accessed page [index.php]','info'),(996,'2019-02-19 22:55:56',1,'orders.php','oID=2&origin=index','::1',0,'','��\0','Accessed page [orders.php]','info'),(997,'2019-02-19 22:56:06',1,'orders.php','origin=index&page=1&oID=2&action=edit','::1',0,'','��\0','Accessed page [orders.php] with action=edit. Review page_parameters and postdata for details.','info'),(998,'2019-02-19 22:56:20',1,'index.php','','::1',0,'','��\0','Accessed page [index.php]','info'),(999,'2019-02-19 22:57:27',1,'index.php','','::1',0,'','��\0','Accessed page [index.php]','info'),(1000,'2019-02-19 22:57:54',1,'index.php','','::1',0,'','��\0','Accessed page [index.php]','info'),(1001,'2019-02-19 22:57:57',1,'orders.php','oID=3&origin=index','::1',0,'','��\0','Accessed page [orders.php]','info'),(1002,'2019-02-19 22:57:59',1,'orders.php','origin=index&page=1&oID=3&action=edit','::1',0,'','��\0','Accessed page [orders.php] with action=edit. Review page_parameters and postdata for details.','info'),(1003,'2019-02-19 22:58:03',1,'index.php','','::1',0,'','��\0','Accessed page [index.php]','info'),(1004,'2019-02-19 22:58:36',1,'modules.php','set=payment','::1',0,'','��\0','Accessed page [modules.php]','info'),(1005,'2019-02-19 22:58:46',1,'index.php','','::1',0,'','��\0','Accessed page [index.php]','info'),(1006,'2019-02-19 22:59:04',1,'modules.php','set=shipping','::1',0,'','��\0','Accessed page [modules.php]','info'),(1007,'2019-02-19 22:59:33',1,'index.php','','::1',0,'','��\0','Accessed page [index.php]','info'),(1008,'2019-02-19 23:03:05',1,'keepalive.php','','::1',0,'','��\0','Accessed page [keepalive.php]','info'),(1009,'2019-02-19 23:03:06',1,'product_types.php','','::1',0,'','��\0','Accessed page [product_types.php]','info'),(1010,'2019-02-19 23:03:09',1,'category_product_listing.php','','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(1011,'2019-02-19 23:03:10',1,'categories.php','action=new_category','::1',0,'','��\0','Accessed page [categories.php] with action=new_category. Review page_parameters and postdata for details.','info'),(1012,'2019-02-19 23:03:23',1,'categories.php','action=insert_category','::1',0,'','U�K\n�0D�\"Y�P�u�\r<@	M(�JZW���!�r޼a6X9f.^\\�~�bbp��`�)��h��g�`�T��ʗ!)z��O���}B]q~ʇ�\\�;�NT�U�����','Accessed page [categories.php] with action=insert_category. Review page_parameters and postdata for details.','info'),(1013,'2019-02-19 23:03:23',1,'category_product_listing.php','cID=31','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(1014,'2019-02-19 23:03:25',1,'category_product_listing.php','cPath=31','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(1015,'2019-02-19 23:03:26',1,'product.php','action=new_product','::1',0,'','�V*(�O)M.�/�,HU�R2T�QJH,�\0��A�����< //�<�X�\0','Accessed page [product.php] with action=new_product. Review page_parameters and postdata for details.','info'),(1016,'2019-02-19 23:03:37',1,'manufacturers.php','','::1',0,'','��\0','Accessed page [manufacturers.php]','info'),(1017,'2019-02-19 23:03:39',1,'manufacturers.php','page=1&mID=1&action=new','::1',0,'','��\0','Accessed page [manufacturers.php] with action=new. Review page_parameters and postdata for details.','info'),(1018,'2019-02-19 23:03:58',1,'manufacturers.php','action=insert','::1',0,'','�V�M�+MKL.)-J-*��K�MU�R��O��KU�Q��M�O�,\n����ʡ���MLO��%�\0�cȗ���Ar��\0','Accessed page [manufacturers.php] with action=insert. Review page_parameters and postdata for details.','info'),(1019,'2019-02-19 23:03:58',1,'manufacturers.php','mID=7','::1',0,'','��\0','Accessed page [manufacturers.php]','info'),(1020,'2019-02-19 23:04:00',1,'category_product_listing.php','','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(1021,'2019-02-19 23:04:04',1,'category_product_listing.php','cPath=31','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(1022,'2019-02-19 23:04:06',1,'product.php','action=new_product','::1',0,'','�V*(�O)M.�/�,HU�R2T�QJH,�\0��A�����< //�<�X�\0','Accessed page [product.php] with action=new_product. Review page_parameters and postdata for details.','info'),(1023,'2019-02-19 23:08:00',1,'keepalive.php','','::1',0,'','��\0','Accessed page [keepalive.php]','info'),(1024,'2019-02-19 23:09:07',1,'product.php','cPath=31&action=new_product_preview','::1',0,'','�RIn�0�J�sS��M��A В��%��A�^y�&\'�og��pNYCNɂ�Fg۬�޳\Z<kXW�P{�*�be{��K앖�,��:E4�R�(�Ik������zF1Z@�&��b�*֫�{Tl�$�4���g[�#�[n�ϟ�_	֢���#�G�:�ex�`�S�J��\0f�2�N3tB\Z�%}x���4�\"�}Jj�8�y�3s�~R/��f�,Qs�^��������2F�#_�]�t��ٿ�Rc��(�%a����Vw��S^�6I>�-�ͯ��S�*F�.?�=�4�/7w��#��v��s��Z�\Z�=/�?���}��R�+c���Mv�','Accessed page [product.php] with action=new_product_preview. Review page_parameters and postdata for details.','info'),(1025,'2019-02-19 23:09:07',1,'product.php','cPath=31&action=new_product_preview','::1',1,'','�RIn�0�J�sS��M��A В��%��A�^y�&\'�og��pNYCNɂ�Fg۬�޳\Z<kXW�P{�*�be{��K앖�,��:E4�R�(�Ik������zF1Z@�&��b�*֫�{Tl�$�4���g[�#�[n�ϟ�_	֢���#�G�:�ex�`�S�J��\0f�2�N3tB\Z�%}x���4�\"�}Jj�8�y�3s�~R/��f�,Qs�^��������2F�#_�]�t��ٿ�Rc��(�%a����Vw��S^�6I>�-�ͯ��S�*F�.?�=�4�/7w��#��v��s��Z�\Z�=/�?���}��R�+c���Mv�','Success: File upload saved successfully 1.jpeg','notice'),(1026,'2019-02-19 23:09:13',1,'product.php','cPath=31&action=insert_product','::1',0,'','�R�r�0��N΅!��¹��[u;�2�a��Uxp`�[�����C�qtي�}�ռ��ת�$�Ƃ`�0r\n)r&\'�(٘�_��)h�ے�1Y4)��)�$ 9��\\5Ռ�\r����\'N\'�lTOG���q�K�������m(�,|�U�?���bo@�i�K3;c=��a{_O�.�pL�l�K?�7~��{�V�u���Z�fwׇ��^gBJ����-�A���?\Z9���*-��=S(�mt�lu��Y��O ��Ɗ/?Z7ڈr�i� o���:q�|@9g�Ԭd?\r�i�A��t��1~����U�0��>_�,��_��V�e�b�P����a��\Z���C��','Accessed page [product.php] with action=insert_product. Review page_parameters and postdata for details.','info'),(1027,'2019-02-19 23:09:13',1,'product.php','cPath=31&action=insert_product','::1',0,'','�R�r�0��N΅!��¹��[u;�2�a��Uxp`�[�����C�qtي�}�ռ��ת�$�Ƃ`�0r\n)r&\'�(٘�_��)h�ے�1Y4)��)�$ 9��\\5Ռ�\r����\'N\'�lTOG���q�K�������m(�,|�U�?���bo@�i�K3;c=��a{_O�.�pL�l�K?�7~��{�V�u���Z�fwׇ��^gBJ����-�A���?\Z9���*-��=S(�mt�lu��Y��O ��Ɗ/?Z7ڈr�i� o���:q�|@9g�Ԭd?\r�i�A��t��1~����U�0��>_�,��_��V�e�b�P����a��\Z���C��','New product 21 added via admin console.','info'),(1028,'2019-02-19 23:09:13',1,'category_product_listing.php','cPath=31&pID=21','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(1029,'2019-02-19 23:09:21',1,'product.php','cPath=31&product_type=1&pID=21&action=new_product','::1',0,'','��\0','Accessed page [product.php] with action=new_product. Review page_parameters and postdata for details.','info'),(1030,'2019-02-19 23:11:40',1,'keepalive.php','','::1',0,'','��\0','Accessed page [keepalive.php]','info'),(1031,'2019-02-19 23:14:22',1,'keepalive.php','','::1',0,'','��\0','Accessed page [keepalive.php]','info'),(1032,'2019-02-19 23:19:26',1,'keepalive.php','','::1',0,'','��\0','Accessed page [keepalive.php]','info'),(1033,'2019-02-19 23:21:51',1,'keepalive.php','','::1',0,'','��\0','Accessed page [keepalive.php]','info'),(1034,'2019-02-19 23:23:51',1,'keepalive.php','','::1',0,'','��\0','Accessed page [keepalive.php]','info'),(1035,'2019-02-19 23:23:52',1,'product.php','cPath=31&pID=21&action=new_product_preview','::1',0,'','�SM�\Z1�+aN��\">T�p�ꡪ�Z	.�V�<3d�If0Z�����]́��������ީ� Im��\"�dì�@�e���\Z�Ԋ]��;��T:��o���r�]�G�^(��\\)�Fc�]5��蒘9I؃6��Xv:��&ӇɷD�6[(���O��^G[�8�Sr7?ĺ\0k�-��7�ԁ�b��h-��w�P2o%y�7�}�GY\':���6�M��.�~�^{j��։����˰�u;�y�V��x�M��,i�8�x���w�=�����Y*}Ļ�(��5igϻ��t�-7��Z��B�zA; ����_(<�.���.��px2�4]�\Z&s�\Z��j���z�\Z�?��C���/1\Z�>ǈ�\\�]�~B|�U|��ZAN�	�-�\Z���{��V׃��Ps\nư���y*VW�tU�3�0�+q^&�3�r=��o5�{�\Z^e���ƒ!�*�B}�O^�A:��1���b��ʠ_��漭����;�w�)�n����J�H�=�㞋�l1�/&���','Accessed page [product.php] with action=new_product_preview. Review page_parameters and postdata for details.','info'),(1036,'2019-02-19 23:23:55',1,'product.php','cPath=31&pID=21&action=update_product','::1',0,'','�SM��0�+�S+Ać�nT=TR+���J��+��� Z��؁¢F9�3�y3���+�T�������?��%B/s ,���V����	��!w�}\'�&�ֻ�����Q�R�e#~����prtfO��\rlL,;�g��d8����z9�����[��V�c6Fs0�C�Jn\Z	D^oj®���\r�S�{�����ޅ�%�\Z�m�h��ֽ;]U�]7/�ȍ;^w#�R�%���m������4j�)<T)��#����Nal�vN�׮��P��g��e��[|�J�#�o������������u���l����J���x	gb2��f���\Zk�d+���b����߮�0�^W��=C�;���r�L��^�H�w\n�	�G0�m�1�ޓ��-%��Q�e�A\n�����ŧ�z9����_\"˲ϑњ���\Z�1����S]�rb�� ��%T���ȗk�=8k\ZK0�G\'�΋P����.+s6z����ޜGr����?','Accessed page [product.php] with action=update_product. Review page_parameters and postdata for details.','info'),(1037,'2019-02-19 23:23:55',1,'product.php','cPath=31&pID=21&action=update_product','::1',0,'','�SM��0�+�S+Ać�nT=TR+���J��+��� Z��؁¢F9�3�y3���+�T�������?��%B/s ,���V����	��!w�}\'�&�ֻ�����Q�R�e#~����prtfO��\rlL,;�g��d8����z9�����[��V�c6Fs0�C�Jn\Z	D^oj®���\r�S�{�����ޅ�%�\Z�m�h��ֽ;]U�]7/�ȍ;^w#�R�%���m������4j�)<T)��#����Nal�vN�׮��P��g��e��[|�J�#�o������������u���l����J���x	gb2��f���\Zk�d+���b����߮�0�^W��=C�;���r�L��^�H�w\n�	�G0�m�1�ޓ��-%��Q�e�A\n�����ŧ�z9����_\"˲ϑњ���\Z�1����S]�rb�� ��%T���ȗk�=8k\ZK0�G\'�΋P����.+s6z����ޜGr����?','Updated product 21 via admin console.','info'),(1038,'2019-02-19 23:23:55',1,'category_product_listing.php','cPath=31&pID=21','::1',0,'','��\0','Accessed page [category_product_listing.php]','info'),(1039,'2019-02-19 23:24:32',1,'template_select.php','','::1',0,'','��\0','Accessed page [template_select.php]','info'),(1040,'2019-02-19 23:24:34',1,'stats_customers.php','','::1',0,'','��\0','Accessed page [stats_customers.php]','info'),(1041,'2019-02-19 23:24:35',1,'index.php','','::1',0,'','��\0','Accessed page [index.php]','info'),(1042,'2019-02-19 23:27:32',1,'keepalive.php','','::1',0,'','��\0','Accessed page [keepalive.php]','info'),(1043,'2019-02-19 23:31:47',1,'keepalive.php','','::1',0,'','��\0','Accessed page [keepalive.php]','info'),(1044,'2019-02-19 23:31:50',1,'template_select.php','','::1',0,'','��\0','Accessed page [template_select.php]','info'),(1045,'2019-02-19 23:32:04',1,'index.php','','::1',0,'','��\0','Accessed page [index.php]','info'),(1046,'2019-02-19 23:47:06',0,'login.php ','camefrom=logoff.php','::1',0,'','��\0','Accessed page [login.php]','info'),(1047,'2019-02-20 10:13:02',0,'login.php ','camefrom=index.php','::1',0,'','��\0','Accessed page [login.php]','info'),(1048,'2019-02-20 10:13:48',0,'login.php keongsang','camefrom=index.php','::1',0,'','�VJL.���S�RJ�7ONNKJ3I122O2�4MN�L5LI52�0J2L26NR�QJL��̋�K�M��N��K/N�KJ�&�f�\0�!�Z\0','Accessed page [login.php] with action=do7ccfbf4d227b795cc9e1de2482b1b33b. Review page_parameters and postdata for details.','info'),(1049,'2019-02-20 10:13:48',1,'index.php','','::1',0,'','��\0','Accessed page [index.php]','info'),(1050,'2019-02-20 10:17:05',1,'keepalive.php','','::1',0,'','��\0','Accessed page [keepalive.php]','info'),(1051,'2019-02-20 10:28:50',1,'keepalive.php','','::1',0,'','��\0','Accessed page [keepalive.php]','info'),(1052,'2019-02-20 10:32:58',1,'keepalive.php','','::1',0,'','��\0','Accessed page [keepalive.php]','info'),(1053,'2019-02-20 10:48:00',0,'login.php ','camefrom=logoff.php','::1',0,'','��\0','Accessed page [login.php]','info'),(1054,'2019-02-20 10:50:55',0,'login.php ','camefrom=index.php','::1',0,'','��\0','Accessed page [login.php]','info'),(1055,'2019-02-20 10:51:00',0,'login.php keongsang','camefrom=index.php','::1',0,'','�VJL.���S�RJ�O1�L645J2O350�4K�0OIIN42161OK226T�QJL��̋�K�M��N��K/N�KJ�&�f�\0�!�Z\0','Accessed page [login.php] with action=dod59c152b7f50296f87ddca24347fb231. Review page_parameters and postdata for details.','info'),(1056,'2019-02-20 10:51:00',1,'index.php','','::1',0,'','��\0','Accessed page [index.php]','info'),(1057,'2019-02-20 10:51:17',1,'sqlpatch.php','','::1',0,'','��\0','Accessed page [sqlpatch.php]','info'),(1058,'2019-02-20 10:52:16',1,'admin_activity.php','','::1',0,'','��\0','Accessed page [admin_activity.php]','info'),(1059,'2019-02-20 10:52:27',1,'users.php','','::1',0,'','��\0','Accessed page [users.php]','info'),(1060,'2019-02-20 10:52:30',1,'admin_page_registration.php','','::1',0,'','��\0','Accessed page [admin_page_registration.php]','info'),(1061,'2019-02-20 10:52:35',1,'profiles.php','','::1',0,'','��\0','Accessed page [profiles.php]','info'),(1062,'2019-02-20 10:53:03',1,'configuration.php','gID=30','::1',0,'','��\0','Accessed page [configuration.php]','info'),(1063,'2019-02-20 10:54:56',1,'configuration.php','gID=30&vcheck=yes','::1',0,'','��\0','Accessed page [configuration.php]','info'),(1064,'2019-02-20 10:55:01',1,'server_info.php','','::1',0,'','��\0','Accessed page [server_info.php]','info'),(1065,'2019-02-20 10:55:11',1,'languages.php','','::1',0,'','��\0','Accessed page [languages.php]','info'),(1066,'2019-02-20 10:55:13',1,'server_info.php','','::1',0,'','��\0','Accessed page [server_info.php]','info');
/*!40000 ALTER TABLE `admin_activity_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_menus`
--

DROP TABLE IF EXISTS `admin_menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_menus` (
  `menu_key` varchar(191) NOT NULL DEFAULT '',
  `language_key` varchar(255) NOT NULL DEFAULT '',
  `sort_order` int(11) NOT NULL DEFAULT '0',
  UNIQUE KEY `menu_key` (`menu_key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_menus`
--

LOCK TABLES `admin_menus` WRITE;
/*!40000 ALTER TABLE `admin_menus` DISABLE KEYS */;
INSERT INTO `admin_menus` VALUES ('configuration','BOX_HEADING_CONFIGURATION',1),('catalog','BOX_HEADING_CATALOG',2),('modules','BOX_HEADING_MODULES',3),('customers','BOX_HEADING_CUSTOMERS',4),('taxes','BOX_HEADING_LOCATION_AND_TAXES',5),('localization','BOX_HEADING_LOCALIZATION',6),('reports','BOX_HEADING_REPORTS',7),('tools','BOX_HEADING_TOOLS',8),('gv','BOX_HEADING_GV_ADMIN',9),('access','BOX_HEADING_ADMIN_ACCESS',10),('extras','BOX_HEADING_EXTRAS',11);
/*!40000 ALTER TABLE `admin_menus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_notifications`
--

DROP TABLE IF EXISTS `admin_notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_notifications` (
  `notification_key` varchar(40) NOT NULL,
  `admin_id` int(11) DEFAULT NULL,
  `dismissed` char(1) DEFAULT NULL,
  UNIQUE KEY `notification_key` (`notification_key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_notifications`
--

LOCK TABLES `admin_notifications` WRITE;
/*!40000 ALTER TABLE `admin_notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin_notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_pages`
--

DROP TABLE IF EXISTS `admin_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_pages` (
  `page_key` varchar(191) NOT NULL DEFAULT '',
  `language_key` varchar(255) NOT NULL DEFAULT '',
  `main_page` varchar(255) NOT NULL DEFAULT '',
  `page_params` varchar(255) NOT NULL DEFAULT '',
  `menu_key` varchar(191) NOT NULL DEFAULT '',
  `display_on_menu` char(1) NOT NULL DEFAULT 'N',
  `sort_order` int(11) NOT NULL DEFAULT '0',
  UNIQUE KEY `page_key` (`page_key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_pages`
--

LOCK TABLES `admin_pages` WRITE;
/*!40000 ALTER TABLE `admin_pages` DISABLE KEYS */;
INSERT INTO `admin_pages` VALUES ('configMyStore','BOX_CONFIGURATION_MY_STORE','FILENAME_CONFIGURATION','gID=1','configuration','Y',1),('configMinimumValues','BOX_CONFIGURATION_MINIMUM_VALUES','FILENAME_CONFIGURATION','gID=2','configuration','Y',2),('configMaximumValues','BOX_CONFIGURATION_MAXIMUM_VALUES','FILENAME_CONFIGURATION','gID=3','configuration','Y',3),('configImages','BOX_CONFIGURATION_IMAGES','FILENAME_CONFIGURATION','gID=4','configuration','Y',4),('configCustomerDetails','BOX_CONFIGURATION_CUSTOMER_DETAILS','FILENAME_CONFIGURATION','gID=5','configuration','Y',5),('configShipping','BOX_CONFIGURATION_SHIPPING_PACKAGING','FILENAME_CONFIGURATION','gID=7','configuration','Y',6),('configProductListing','BOX_CONFIGURATION_PRODUCT_LISTING','FILENAME_CONFIGURATION','gID=8','configuration','Y',7),('configStock','BOX_CONFIGURATION_STOCK','FILENAME_CONFIGURATION','gID=9','configuration','Y',8),('configLogging','BOX_CONFIGURATION_LOGGING','FILENAME_CONFIGURATION','gID=10','configuration','Y',9),('configEmail','BOX_CONFIGURATION_EMAIL_OPTIONS','FILENAME_CONFIGURATION','gID=12','configuration','Y',10),('configAttributes','BOX_CONFIGURATION_ATTRIBUTE_OPTIONS','FILENAME_CONFIGURATION','gID=13','configuration','Y',11),('configGzipCompression','BOX_CONFIGURATION_GZIP_COMPRESSION','FILENAME_CONFIGURATION','gID=14','configuration','Y',12),('configSessions','BOX_CONFIGURATION_SESSIONS','FILENAME_CONFIGURATION','gID=15','configuration','Y',13),('configRegulations','BOX_CONFIGURATION_REGULATIONS','FILENAME_CONFIGURATION','gID=11','configuration','Y',14),('configGvCoupons','BOX_CONFIGURATION_GV_COUPONS','FILENAME_CONFIGURATION','gID=16','configuration','Y',15),('configCreditCards','BOX_CONFIGURATION_CREDIT_CARDS','FILENAME_CONFIGURATION','gID=17','configuration','Y',16),('configProductInfo','BOX_CONFIGURATION_PRODUCT_INFO','FILENAME_CONFIGURATION','gID=18','configuration','Y',17),('configLayoutSettings','BOX_CONFIGURATION_LAYOUT_SETTINGS','FILENAME_CONFIGURATION','gID=19','configuration','Y',18),('configWebsiteMaintenance','BOX_CONFIGURATION_WEBSITE_MAINTENANCE','FILENAME_CONFIGURATION','gID=20','configuration','Y',19),('configNewListing','BOX_CONFIGURATION_NEW_LISTING','FILENAME_CONFIGURATION','gID=21','configuration','Y',20),('configFeaturedListing','BOX_CONFIGURATION_FEATURED_LISTING','FILENAME_CONFIGURATION','gID=22','configuration','Y',21),('configAllListing','BOX_CONFIGURATION_ALL_LISTING','FILENAME_CONFIGURATION','gID=23','configuration','Y',22),('configIndexListing','BOX_CONFIGURATION_INDEX_LISTING','FILENAME_CONFIGURATION','gID=24','configuration','Y',23),('configDefinePageStatus','BOX_CONFIGURATION_DEFINE_PAGE_STATUS','FILENAME_CONFIGURATION','gID=25','configuration','Y',24),('configEzPagesSettings','BOX_CONFIGURATION_EZPAGES_SETTINGS','FILENAME_CONFIGURATION','gID=30','configuration','Y',25),('categories','BOX_CATALOG_CATEGORY','FILENAME_CATEGORIES','','catalog','N',18),('categoriesProductListing','BOX_CATALOG_CATEGORIES_PRODUCTS','FILENAME_CATEGORY_PRODUCT_LISTING','','catalog','Y',1),('productTypes','BOX_CATALOG_PRODUCT_TYPES','FILENAME_PRODUCT_TYPES','','catalog','Y',2),('priceManager','BOX_CATALOG_PRODUCTS_PRICE_MANAGER','FILENAME_PRODUCTS_PRICE_MANAGER','','catalog','Y',3),('optionNames','BOX_CATALOG_CATEGORIES_OPTIONS_NAME_MANAGER','FILENAME_OPTIONS_NAME_MANAGER','','catalog','Y',4),('optionValues','BOX_CATALOG_CATEGORIES_OPTIONS_VALUES_MANAGER','FILENAME_OPTIONS_VALUES_MANAGER','','catalog','Y',5),('attributes','BOX_CATALOG_CATEGORIES_ATTRIBUTES_CONTROLLER','FILENAME_ATTRIBUTES_CONTROLLER','','catalog','Y',6),('downloads','BOX_CATALOG_CATEGORIES_ATTRIBUTES_DOWNLOADS_MANAGER','FILENAME_DOWNLOADS_MANAGER','','catalog','Y',7),('optionNameSorter','BOX_CATALOG_PRODUCT_OPTIONS_NAME','FILENAME_PRODUCTS_OPTIONS_NAME','','catalog','Y',8),('optionValueSorter','BOX_CATALOG_PRODUCT_OPTIONS_VALUES','FILENAME_PRODUCTS_OPTIONS_VALUES','','catalog','Y',9),('manufacturers','BOX_CATALOG_MANUFACTURERS','FILENAME_MANUFACTURERS','','catalog','Y',10),('reviews','BOX_CATALOG_REVIEWS','FILENAME_REVIEWS','','catalog','Y',11),('specials','BOX_CATALOG_SPECIALS','FILENAME_SPECIALS','','catalog','Y',12),('featured','BOX_CATALOG_FEATURED','FILENAME_FEATURED','','catalog','Y',13),('salemaker','BOX_CATALOG_SALEMAKER','FILENAME_SALEMAKER','','catalog','Y',14),('productsExpected','BOX_CATALOG_PRODUCTS_EXPECTED','FILENAME_PRODUCTS_EXPECTED','','catalog','Y',15),('product','BOX_CATALOG_PRODUCT','FILENAME_PRODUCT','','catalog','N',16),('productsToCategories','BOX_CATALOG_PRODUCTS_TO_CATEGORIES','FILENAME_PRODUCTS_TO_CATEGORIES','','catalog','N',17),('payment','BOX_MODULES_PAYMENT','FILENAME_MODULES','set=payment','modules','Y',1),('shipping','BOX_MODULES_SHIPPING','FILENAME_MODULES','set=shipping','modules','Y',2),('orderTotal','BOX_MODULES_ORDER_TOTAL','FILENAME_MODULES','set=ordertotal','modules','Y',3),('customers','BOX_CUSTOMERS_CUSTOMERS','FILENAME_CUSTOMERS','','customers','Y',1),('orders','BOX_CUSTOMERS_ORDERS','FILENAME_ORDERS','','customers','Y',2),('groupPricing','BOX_CUSTOMERS_GROUP_PRICING','FILENAME_GROUP_PRICING','','customers','Y',3),('paypal','BOX_CUSTOMERS_PAYPAL','FILENAME_PAYPAL','','customers','Y',4),('invoice','BOX_CUSTOMERS_INVOICE','FILENAME_ORDERS_INVOICE','','customers','N',5),('packingslip','BOX_CUSTOMERS_PACKING_SLIP','FILENAME_ORDERS_PACKINGSLIP','','customers','N',6),('countries','BOX_TAXES_COUNTRIES','FILENAME_COUNTRIES','','taxes','Y',1),('zones','BOX_TAXES_ZONES','FILENAME_ZONES','','taxes','Y',2),('geoZones','BOX_TAXES_GEO_ZONES','FILENAME_GEO_ZONES','','taxes','Y',3),('taxClasses','BOX_TAXES_TAX_CLASSES','FILENAME_TAX_CLASSES','','taxes','Y',4),('taxRates','BOX_TAXES_TAX_RATES','FILENAME_TAX_RATES','','taxes','Y',5),('currencies','BOX_LOCALIZATION_CURRENCIES','FILENAME_CURRENCIES','','localization','Y',1),('languages','BOX_LOCALIZATION_LANGUAGES','FILENAME_LANGUAGES','','localization','Y',2),('ordersStatus','BOX_LOCALIZATION_ORDERS_STATUS','FILENAME_ORDERS_STATUS','','localization','Y',3),('reportCustomers','BOX_REPORTS_ORDERS_TOTAL','FILENAME_STATS_CUSTOMERS','','reports','Y',1),('reportReferrals','BOX_REPORTS_CUSTOMERS_REFERRALS','FILENAME_STATS_CUSTOMERS_REFERRALS','','reports','Y',2),('reportLowStock','BOX_REPORTS_PRODUCTS_LOWSTOCK','FILENAME_STATS_PRODUCTS_LOWSTOCK','','reports','Y',3),('reportProductsSold','BOX_REPORTS_PRODUCTS_PURCHASED','FILENAME_STATS_PRODUCTS_PURCHASED','','reports','Y',4),('reportProductsViewed','BOX_REPORTS_PRODUCTS_VIEWED','FILENAME_STATS_PRODUCTS_VIEWED','','reports','Y',5),('templateSelect','BOX_TOOLS_TEMPLATE_SELECT','FILENAME_TEMPLATE_SELECT','','tools','Y',1),('layoutController','BOX_TOOLS_LAYOUT_CONTROLLER','FILENAME_LAYOUT_CONTROLLER','','tools','Y',2),('banners','BOX_TOOLS_BANNER_MANAGER','FILENAME_BANNER_MANAGER','','tools','Y',3),('mail','BOX_TOOLS_MAIL','FILENAME_MAIL','','tools','Y',4),('newsletters','BOX_TOOLS_NEWSLETTER_MANAGER','FILENAME_NEWSLETTERS','','tools','Y',5),('server','BOX_TOOLS_SERVER_INFO','FILENAME_SERVER_INFO','','tools','Y',6),('whosOnline','BOX_TOOLS_WHOS_ONLINE','FILENAME_WHOS_ONLINE','','tools','Y',7),('storeManager','BOX_TOOLS_STORE_MANAGER','FILENAME_STORE_MANAGER','','tools','Y',9),('developersToolKit','BOX_TOOLS_DEVELOPERS_TOOL_KIT','FILENAME_DEVELOPERS_TOOL_KIT','','tools','Y',10),('ezpages','BOX_TOOLS_EZPAGES','FILENAME_EZPAGES_ADMIN','','tools','Y',11),('definePagesEditor','BOX_TOOLS_DEFINE_PAGES_EDITOR','FILENAME_DEFINE_PAGES_EDITOR','','tools','Y',12),('sqlPatch','BOX_TOOLS_SQLPATCH','FILENAME_SQLPATCH','','tools','Y',13),('couponAdmin','BOX_COUPON_ADMIN','FILENAME_COUPON_ADMIN','','gv','Y',1),('couponRestrict','BOX_COUPON_RESTRICT','FILENAME_COUPON_RESTRICT','','gv','N',1),('gvQueue','BOX_GV_ADMIN_QUEUE','FILENAME_GV_QUEUE','','gv','Y',2),('gvMail','BOX_GV_ADMIN_MAIL','FILENAME_GV_MAIL','','gv','Y',3),('gvSent','BOX_GV_ADMIN_SENT','FILENAME_GV_SENT','','gv','Y',4),('profiles','BOX_ADMIN_ACCESS_PROFILES','FILENAME_PROFILES','','access','Y',1),('users','BOX_ADMIN_ACCESS_USERS','FILENAME_USERS','','access','Y',2),('pageRegistration','BOX_ADMIN_ACCESS_PAGE_REGISTRATION','FILENAME_ADMIN_PAGE_REGISTRATION','','access','Y',3),('adminlogs','BOX_ADMIN_ACCESS_LOGS','FILENAME_ADMIN_ACTIVITY','','access','Y',4),('recordArtists','BOX_CATALOG_RECORD_ARTISTS','FILENAME_RECORD_ARTISTS','','extras','Y',1),('recordCompanies','BOX_CATALOG_RECORD_COMPANY','FILENAME_RECORD_COMPANY','','extras','Y',2),('musicGenre','BOX_CATALOG_MUSIC_GENRE','FILENAME_MUSIC_GENRE','','extras','Y',3),('mediaManager','BOX_CATALOG_MEDIA_MANAGER','FILENAME_MEDIA_MANAGER','','extras','Y',4),('mediaTypes','BOX_CATALOG_MEDIA_TYPES','FILENAME_MEDIA_TYPES','','extras','Y',5),('reportSalesWithGraphs','BOX_REPORTS_SALES_REPORT_GRAPHS','FILENAME_STATS_SALES_REPORT_GRAPHS','','reports','Y',15),('configImageHandler4','BOX_TOOLS_IMAGE_HANDLER','FILENAME_IMAGE_HANDLER','','tools','Y',14),('configFacebookLikeButton','BOX_CONFIGURATION_FACEBOOKLIKEBUTTON','FILENAME_CONFIGURATION','gID=31','configuration','Y',31),('configCSSJSLoader','BOX_CONFIGURATION_CSS_JS_LOADER','FILENAME_CONFIGURATION','gID=32','configuration','Y',32),('configPinitbutton','BOX_CONFIGURATION_PINITBUTTON','FILENAME_CONFIGURATION','gID=33','configuration','Y',33),('configGooglePlusOne','BOX_CONFIGURATION_GOOGLE_PLUS','FILENAME_CONFIGURATION','gID=36','configuration','Y',36),('configNMXDiskCache','BOX_CONFIGURATION_NMX_DISK_CACHE','FILENAME_CONFIGURATION','gID=37','configuration','Y',37);
/*!40000 ALTER TABLE `admin_pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_pages_to_profiles`
--

DROP TABLE IF EXISTS `admin_pages_to_profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_pages_to_profiles` (
  `profile_id` int(11) NOT NULL DEFAULT '0',
  `page_key` varchar(191) NOT NULL DEFAULT '',
  UNIQUE KEY `profile_page` (`profile_id`,`page_key`),
  UNIQUE KEY `page_profile` (`page_key`,`profile_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_pages_to_profiles`
--

LOCK TABLES `admin_pages_to_profiles` WRITE;
/*!40000 ALTER TABLE `admin_pages_to_profiles` DISABLE KEYS */;
INSERT INTO `admin_pages_to_profiles` VALUES (2,'currencies'),(2,'customers'),(2,'gvMail'),(2,'gvQueue'),(2,'gvSent'),(2,'invoice'),(2,'orders'),(2,'packingslip'),(2,'paypal'),(2,'reportCustomers'),(2,'reportLowStock'),(2,'reportProductsSold'),(2,'reportProductsViewed'),(2,'reportReferrals'),(2,'whosOnline');
/*!40000 ALTER TABLE `admin_pages_to_profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_profiles`
--

DROP TABLE IF EXISTS `admin_profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_profiles` (
  `profile_id` int(11) NOT NULL AUTO_INCREMENT,
  `profile_name` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`profile_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_profiles`
--

LOCK TABLES `admin_profiles` WRITE;
/*!40000 ALTER TABLE `admin_profiles` DISABLE KEYS */;
INSERT INTO `admin_profiles` VALUES (1,'Superuser'),(2,'Order Processing');
/*!40000 ALTER TABLE `admin_profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authorizenet`
--

DROP TABLE IF EXISTS `authorizenet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authorizenet` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL DEFAULT '0',
  `order_id` int(11) NOT NULL DEFAULT '0',
  `response_code` int(1) NOT NULL DEFAULT '0',
  `response_text` varchar(255) NOT NULL DEFAULT '',
  `authorization_type` varchar(50) NOT NULL DEFAULT '',
  `transaction_id` varchar(32) DEFAULT NULL,
  `sent` longtext NOT NULL,
  `received` longtext NOT NULL,
  `time` varchar(50) NOT NULL DEFAULT '',
  `session_id` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authorizenet`
--

LOCK TABLES `authorizenet` WRITE;
/*!40000 ALTER TABLE `authorizenet` DISABLE KEYS */;
/*!40000 ALTER TABLE `authorizenet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `banners`
--

DROP TABLE IF EXISTS `banners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `banners` (
  `banners_id` int(11) NOT NULL AUTO_INCREMENT,
  `banners_title` varchar(64) NOT NULL DEFAULT '',
  `banners_url` varchar(255) NOT NULL DEFAULT '',
  `banners_image` varchar(255) NOT NULL DEFAULT '',
  `banners_group` varchar(15) NOT NULL DEFAULT '',
  `banners_html_text` text,
  `expires_impressions` int(7) DEFAULT '0',
  `expires_date` datetime DEFAULT NULL,
  `date_scheduled` datetime DEFAULT NULL,
  `date_added` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `date_status_change` datetime DEFAULT NULL,
  `status` int(1) NOT NULL DEFAULT '1',
  `banners_open_new_windows` int(1) NOT NULL DEFAULT '1',
  `banners_on_ssl` int(1) NOT NULL DEFAULT '1',
  `banners_sort_order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`banners_id`),
  KEY `idx_status_group_zen` (`status`,`banners_group`),
  KEY `idx_expires_date_zen` (`expires_date`),
  KEY `idx_date_scheduled_zen` (`date_scheduled`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `banners`
--

LOCK TABLES `banners` WRITE;
/*!40000 ALTER TABLE `banners` DISABLE KEYS */;
INSERT INTO `banners` VALUES (1,'Zen Cart','https://www.zen-cart.com','banners/zencart_468_60_02.gif','Wide-Banners','',NULL,NULL,NULL,'2004-01-11 20:59:12',NULL,0,1,1,0),(2,'Zen Cart the art of e-commerce','https://www.zen-cart.com','banners/125zen_logo.gif','SideBox-Banners','',0,NULL,NULL,'2004-01-11 20:59:12',NULL,1,1,1,0),(3,'Zen Cart the art of e-commerce','https://www.zen-cart.com','banners/125x125_zen_logo.gif','SideBox-Banners','',NULL,NULL,NULL,'2004-01-11 20:59:12',NULL,0,1,1,0),(4,'if you have to think ... you haven\'t been Zenned!','https://www.zen-cart.com','banners/think_anim.gif','Wide-Banners','',NULL,NULL,NULL,'2004-01-12 20:53:18',NULL,0,0,1,0),(5,'Zen Cart the art of e-commerce','https://www.zen-cart.com','banners/bw_zen_88wide.gif','BannersAll','',0,NULL,NULL,'2005-05-13 10:54:38',NULL,1,1,1,10),(6,'Zen Cart','https://www.zen-cart.com','','Wide-Banners','<script><!--//CDATA[\r\n   var loc = \'//pan.zen-cart.com/display/group/1/\';\r\n   var rd = Math.floor(Math.random()*99999999999);\r\n   document.write (\"<scr\"+\"ipt src=\'\"+loc);\r\n   document.write (\'?rd=\' + rd);\r\n   document.write (\"\'></scr\"+\"ipt>\");\r\n//]]>--></script>',NULL,NULL,NULL,'2004-01-11 20:59:12',NULL,0,1,1,0),(7,'Credit Card Processing','https://www.zen-cart.com/partners/square_promo','banners/cardsvcs_468x60.gif','Wide-Banners','',0,NULL,NULL,'2005-05-13 10:54:38',NULL,1,1,1,0),(8,'Your banner title','','','homepageslide','<img src=\"images/banners/skyhigh.png\" alt=\"\" class=\"banner-img\"><div class=\"banner\" /><p>The sky is the limit!</p></div>',NULL,NULL,NULL,'0001-01-01 00:00:00',NULL,0,1,1,0),(9,'Your banner title','','','homepageslide','<img src=\"images/banners/success.png\" alt=\"\" class=\"banner-img\"><div class=\"banner\" /><p>Turn Your Idea into Success!</p></div>',NULL,NULL,NULL,'0001-01-01 00:00:00',NULL,0,1,1,0),(10,'Your banner title','','','homepageslide','<img src=\"images/banners/unique.png\" alt=\"\" class=\"banner-img\"><div class=\"banner\" /><p>Unique and Exciting!</p></div>',NULL,NULL,NULL,'0001-01-01 00:00:00',NULL,0,1,1,0),(11,'Your banner title','','banner.png','homepageslide','',NULL,NULL,NULL,'0001-01-01 00:00:00',NULL,1,1,1,0),(12,'Your banner title','','','headerbanner','<a href=\"index.php?main_page=shippinginfo\"><span class=\"banner-topo-first\"><strong>Free Shipping</strong> on all orders over $50 within the US</span><span class=\"banner-topo-second\"><span class=\"ico\">+</span><strong>Free Returns</strong> on all orders within the US</span><span class=\"banner-fake-button\">Learn More</span></a>',NULL,NULL,NULL,'0001-01-01 00:00:00',NULL,0,1,1,0),(13,'Your banner title','','','aboutus','LeFab 3D by PeopleSpace',NULL,NULL,NULL,'0001-01-01 00:00:00',NULL,1,1,1,0),(14,'Your banner title','','','footerbanner','<span><strong>24 hour Customer Support:</strong> 1-949-664-1015</span>',NULL,NULL,NULL,'0001-01-01 00:00:00',NULL,1,1,1,0);
/*!40000 ALTER TABLE `banners` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `banners_history`
--

DROP TABLE IF EXISTS `banners_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `banners_history` (
  `banners_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `banners_id` int(11) NOT NULL DEFAULT '0',
  `banners_shown` int(5) NOT NULL DEFAULT '0',
  `banners_clicked` int(5) NOT NULL DEFAULT '0',
  `banners_history_date` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  PRIMARY KEY (`banners_history_id`),
  KEY `idx_banners_id_zen` (`banners_id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `banners_history`
--

LOCK TABLES `banners_history` WRITE;
/*!40000 ALTER TABLE `banners_history` DISABLE KEYS */;
INSERT INTO `banners_history` VALUES (1,12,15,0,'2019-02-19 14:27:50'),(2,8,20,0,'2019-02-19 14:27:50'),(3,0,139,0,'2019-02-19 14:27:50'),(4,14,277,0,'2019-02-19 14:27:50'),(5,6,8,0,'2019-02-19 14:27:50'),(6,7,253,0,'2019-02-19 14:36:05'),(7,4,9,0,'2019-02-19 14:39:43'),(8,1,7,0,'2019-02-19 14:41:57'),(9,11,119,0,'2019-02-19 15:18:15'),(10,11,15,0,'2019-02-20 10:12:58'),(11,0,15,0,'2019-02-20 10:12:58'),(12,14,46,0,'2019-02-20 10:12:58'),(13,7,46,0,'2019-02-20 10:12:58');
/*!40000 ALTER TABLE `banners_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `categories_id` int(11) NOT NULL AUTO_INCREMENT,
  `categories_image` varchar(255) DEFAULT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `sort_order` int(3) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  `categories_status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`categories_id`),
  KEY `idx_parent_id_cat_id_zen` (`parent_id`,`categories_id`),
  KEY `idx_status_zen` (`categories_status`),
  KEY `idx_sort_order_zen` (`sort_order`)
) ENGINE=MyISAM AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (16,NULL,0,0,'2019-02-19 22:24:31',NULL,1),(20,NULL,0,0,'2019-02-19 22:28:27',NULL,1),(26,NULL,0,0,'2019-02-19 22:34:17',NULL,1),(12,NULL,0,0,'2019-02-19 22:23:07',NULL,1),(22,NULL,20,0,'2019-02-19 22:29:08',NULL,1),(6,NULL,0,0,'2019-02-19 21:16:43',NULL,1),(31,NULL,0,0,'2019-02-19 23:03:23',NULL,1),(8,NULL,0,0,'2019-02-19 22:20:45',NULL,1),(9,NULL,8,0,'2019-02-19 22:21:06',NULL,1),(10,NULL,8,0,'2019-02-19 22:21:14',NULL,1),(11,NULL,8,0,'2019-02-19 22:21:35',NULL,1),(13,NULL,12,0,'2019-02-19 22:23:20',NULL,1),(14,NULL,12,0,'2019-02-19 22:23:26',NULL,1),(15,NULL,12,0,'2019-02-19 22:23:32',NULL,1),(17,NULL,16,0,'2019-02-19 22:24:43',NULL,1),(18,NULL,16,0,'2019-02-19 22:24:52',NULL,1),(19,NULL,16,0,'2019-02-19 22:25:22',NULL,1),(21,NULL,20,0,'2019-02-19 22:28:40',NULL,1),(23,NULL,20,0,'2019-02-19 22:29:30',NULL,1),(24,NULL,20,0,'2019-02-19 22:29:39',NULL,1),(25,NULL,20,0,'2019-02-19 22:30:18',NULL,1),(27,NULL,26,0,'2019-02-19 22:34:26',NULL,1),(28,NULL,26,0,'2019-02-19 22:34:32',NULL,1),(29,NULL,26,0,'2019-02-19 22:34:37',NULL,1),(30,NULL,26,0,'2019-02-19 22:34:43',NULL,1);
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories_description`
--

DROP TABLE IF EXISTS `categories_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories_description` (
  `categories_id` int(11) NOT NULL DEFAULT '0',
  `language_id` int(11) NOT NULL DEFAULT '1',
  `categories_name` varchar(32) NOT NULL DEFAULT '',
  `categories_description` text NOT NULL,
  PRIMARY KEY (`categories_id`,`language_id`),
  KEY `idx_categories_name_zen` (`categories_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories_description`
--

LOCK TABLES `categories_description` WRITE;
/*!40000 ALTER TABLE `categories_description` DISABLE KEYS */;
INSERT INTO `categories_description` VALUES (16,1,'Chocolate',''),(20,1,'Toy & Gear',''),(26,1,'Figures',''),(12,1,'Air purifier',''),(13,1,'Big Size',''),(22,1,'Mini Motor',''),(6,1,'3D Photo',''),(31,1,'3D Scanning',''),(8,1,'Accessories',''),(9,1,'Name Tag',''),(10,1,'Basket',''),(11,1,'Logo Product',''),(14,1,'Middle Size',''),(15,1,'Small Size',''),(17,1,'Bell-shaped',''),(18,1,'Love You',''),(19,1,'Superman Mark',''),(21,1,'Welcome to Las Vegas!',''),(23,1,'Orgel',''),(24,1,'Toy Tower',''),(25,1,'Toy Car',''),(27,1,'Hulk',''),(28,1,'Iron Man',''),(29,1,'Groot',''),(30,1,'Captain America','');
/*!40000 ALTER TABLE `categories_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `configuration`
--

DROP TABLE IF EXISTS `configuration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `configuration` (
  `configuration_id` int(11) NOT NULL AUTO_INCREMENT,
  `configuration_title` text NOT NULL,
  `configuration_key` varchar(180) NOT NULL DEFAULT '',
  `configuration_value` text NOT NULL,
  `configuration_description` text NOT NULL,
  `configuration_group_id` int(11) NOT NULL DEFAULT '0',
  `sort_order` int(5) DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  `date_added` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `use_function` text,
  `set_function` text,
  `val_function` text,
  PRIMARY KEY (`configuration_id`),
  UNIQUE KEY `unq_config_key_zen` (`configuration_key`),
  KEY `idx_key_value_zen` (`configuration_key`,`configuration_value`(10)),
  KEY `idx_cfg_grp_id_zen` (`configuration_group_id`)
) ENGINE=MyISAM AUTO_INCREMENT=629 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `configuration`
--

LOCK TABLES `configuration` WRITE;
/*!40000 ALTER TABLE `configuration` DISABLE KEYS */;
INSERT INTO `configuration` VALUES (1,'Store Name','STORE_NAME','lefab3D','The name of my store',1,1,NULL,'2019-02-19 14:19:12',NULL,NULL,NULL),(2,'Store Owner','STORE_OWNER','jacob','The name of my store owner',1,2,NULL,'2019-02-19 14:19:12',NULL,NULL,NULL),(3,'Telephone - Customer Service','STORE_TELEPHONE_CUSTSERVICE','+1) 949-664-1015','Enter a telephone number for customers to reach your Customer Service department. This number may be sent as part of payment transaction details.',1,3,'2019-02-19 14:55:42','2019-02-19 14:19:12',NULL,NULL,NULL),(4,'Country','STORE_COUNTRY','223','The country my store is located in <br /><br /><strong>Note: Please remember to update the store zone.</strong>',1,6,NULL,'2019-02-19 14:19:12','zen_get_country_name','zen_cfg_pull_down_country_list(',NULL),(5,'Zone','STORE_ZONE','12','The zone my store is located in',1,7,NULL,'2019-02-19 14:19:12','zen_cfg_get_zone_name','zen_cfg_pull_down_zone_list(',NULL),(6,'Expected Sort Order','EXPECTED_PRODUCTS_SORT','desc','This is the sort order used in the expected products box.',1,8,NULL,'2019-02-19 14:19:12',NULL,'zen_cfg_select_option(array(\'asc\', \'desc\'), ',NULL),(7,'Expected Sort Field','EXPECTED_PRODUCTS_FIELD','date_expected','The column to sort by in the expected products box.',1,9,NULL,'2019-02-19 14:19:12',NULL,'zen_cfg_select_option(array(\'products_name\', \'date_expected\'), ',NULL),(8,'Switch To Default Language Currency','USE_DEFAULT_LANGUAGE_CURRENCY','false','Automatically switch to the language\'s currency when it is changed',1,10,NULL,'2019-02-19 14:19:12',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), ',NULL),(9,'Language Selector','LANGUAGE_DEFAULT_SELECTOR','Default','Should the default language be based on the Store preferences, or the customer\'s browser settings?<br /><br />Default: Store\'s default settings',1,11,NULL,'2019-02-19 14:19:12',NULL,'zen_cfg_select_option(array(\'Default\', \'Browser\'), ',NULL),(10,'Use Search-Engine Safe URLs (still in development)','SEARCH_ENGINE_FRIENDLY_URLS','false','Use search-engine safe urls for all site links',6,12,NULL,'2019-02-19 14:19:12',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), ',NULL),(11,'Display Cart After Adding Product','DISPLAY_CART','true','Display the shopping cart after adding a product (or return back to their origin)',1,14,NULL,'2019-02-19 14:19:12',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), ',NULL),(12,'Default Search Operator','ADVANCED_SEARCH_DEFAULT_OPERATOR','and','Default search operators',1,17,NULL,'2019-02-19 14:19:12',NULL,'zen_cfg_select_option(array(\'and\', \'or\'), ',NULL),(13,'Store Address and Phone','STORE_NAME_ADDRESS','leFab 3D\r\n1691 Kettering Street, Irvine, CA\r\nUSA\r\n+1) 949-664-1015','This is the Store Name, Address and Phone used on printable documents and displayed online',1,7,'2019-02-19 14:55:28','2019-02-19 14:19:12',NULL,'zen_cfg_textarea(',NULL),(14,'Show Category Counts','SHOW_COUNTS','true','Count recursively how many products are in each category',1,19,NULL,'2019-02-19 14:19:12',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), ',NULL),(15,'Tax Decimal Places','TAX_DECIMAL_PLACES','0','Pad the tax value this amount of decimal places',1,20,NULL,'2019-02-19 14:19:12',NULL,NULL,NULL),(16,'Display Prices with Tax','DISPLAY_PRICE_WITH_TAX','false','Display prices with tax included (true) or add the tax at the end (false)',1,21,NULL,'2019-02-19 14:19:12',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), ',NULL),(17,'Display Prices with Tax in Admin','DISPLAY_PRICE_WITH_TAX_ADMIN','false','Display prices with tax included (true) or add the tax at the end (false) in Admin(Invoices)',1,21,NULL,'2019-02-19 14:19:12',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), ',NULL),(18,'Basis of Product Tax','STORE_PRODUCT_TAX_BASIS','Shipping','On what basis is Product Tax calculated. Options are<br />Shipping - Based on customers Shipping Address<br />Billing Based on customers Billing address<br />Store - Based on Store address if Billing/Shipping Zone equals Store zone',1,21,NULL,'2019-02-19 14:19:12',NULL,'zen_cfg_select_option(array(\'Shipping\', \'Billing\', \'Store\'), ',NULL),(19,'Basis of Shipping Tax','STORE_SHIPPING_TAX_BASIS','Shipping','On what basis is Shipping Tax calculated. Options are<br />Shipping - Based on customers Shipping Address<br />Billing Based on customers Billing address<br />Store - Based on Store address if Billing/Shipping Zone equals Store zone - Can be overriden by correctly written Shipping Module',1,21,NULL,'2019-02-19 14:19:12',NULL,'zen_cfg_select_option(array(\'Shipping\', \'Billing\', \'Store\'), ',NULL),(20,'Sales Tax Display Status','STORE_TAX_DISPLAY_STATUS','0','Always show Sales Tax even when amount is $0.00?<br />0= Off<br />1= On',1,21,NULL,'2019-02-19 14:19:12',NULL,'zen_cfg_select_option(array(\'0\', \'1\'), ',NULL),(21,'Show Split Tax Lines','SHOW_SPLIT_TAX_CHECKOUT','false','If multiple tax rates apply, show each rate as a separate line at checkout',1,22,NULL,'2019-02-19 14:19:12',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), ',NULL),(22,'PA-DSS Admin Session Timeout Enforced?','PADSS_ADMIN_SESSION_TIMEOUT_ENFORCED','1','PA-DSS Compliance requires that any Admin login sessions expire after 15 minutes of inactivity. <strong>Disabling this makes your site NON-COMPLIANT with PA-DSS rules, thus invalidating any certification.</strong>',1,30,'2019-02-19 14:19:12','2019-02-19 14:19:12',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'0\', \'text\'=>\'Non-Compliant\'), array(\'id\'=>\'1\', \'text\'=>\'On\')),',NULL),(23,'PA-DSS Strong Password Rules Enforced?','PADSS_PWD_EXPIRY_ENFORCED','1','PA-DSS Compliance requires that admin passwords must be changed after 90 days and cannot re-use the last 4 passwords. <strong>Disabling this makes your site NON-COMPLIANT with PA-DSS rules, thus invalidating any certification.</strong>',1,30,'2019-02-19 14:19:12','2019-02-19 14:19:12',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'0\', \'text\'=>\'Non-Compliant\'), array(\'id\'=>\'1\', \'text\'=>\'On\')),',NULL),(24,'PA-DSS Ajax Checkout?','PADSS_AJAX_CHECKOUT','1','PA-DSS Compliance requires that for some inbuilt payment methods, that we use ajax to draw the checkout confirmation screen. While this will only happen if one of those payment methods is actually present, some people may want the traditional checkout flow <strong>Disabling this makes your site NON-COMPLIANT with PA-DSS rules, thus invalidating any certification.</strong>',1,30,'2019-02-19 14:19:12','2019-02-19 14:19:12',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'0\', \'text\'=>\'Non-Compliant\'), array(\'id\'=>\'1\', \'text\'=>\'On\')),',NULL),(25,'Admin Session Time Out in Seconds','SESSION_TIMEOUT_ADMIN','900','Enter the time in seconds.<br />Max allowed is 900 for PCI Compliance Reasons.<br /> Default=900<br />Example: 900= 15 min <br /><br />Note: Too few seconds can result in timeout issues when adding/editing products',1,40,NULL,'2019-02-19 14:19:12',NULL,NULL,NULL),(26,'Admin Set max_execution_time for processes','GLOBAL_SET_TIME_LIMIT','60','Enter the time in seconds for how long the max_execution_time of processes should be. Default=60<br />Example: 60= 1 minute<br /><br />Note: Changing the time limit is only needed if you are having problems with the execution time of a process',1,42,NULL,'2019-02-19 14:19:12',NULL,NULL,NULL),(27,'Show if version update available','SHOW_VERSION_UPDATE_IN_HEADER','true','Automatically check to see if a new version of Zen Cart is available. Enabling this can sometimes slow down the loading of Admin pages. (Displayed on main Index page after login, and Server Info page.)',1,44,NULL,'2019-02-19 14:19:12',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), ',NULL),(28,'Store Status','STORE_STATUS','0','What is your Store Status<br />0= Normal Store<br />1= Showcase no prices<br />2= Showcase with prices',1,25,NULL,'2019-02-19 14:19:12',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\'), ',NULL),(29,'Server Uptime','DISPLAY_SERVER_UPTIME','true','Displaying Server uptime can cause entries in error logs on some servers. (true = Display, false = don\'t display)',1,46,'2003-11-08 20:24:47','0001-01-01 00:00:00','','zen_cfg_select_option(array(\'true\', \'false\'),',NULL),(30,'Missing Page Check','MISSING_PAGE_CHECK','Page Not Found','Zen Cart can check for missing pages in the URL and redirect to Index page. For debugging you may want to turn this off. <br /><br /><strong>Default=On</strong><br />On = Send missing pages to \'index\'<br />Off = Don\'t check for missing pages<br />Page Not Found = display the Page-Not-Found page',1,48,'2003-11-08 20:24:47','0001-01-01 00:00:00','','zen_cfg_select_option(array(\'On\', \'Off\', \'Page Not Found\'),',NULL),(31,'cURL Proxy Status','CURL_PROXY_REQUIRED','False','Does your host require that you use a proxy for cURL communication?',6,50,NULL,'2019-02-19 14:19:12',NULL,'zen_cfg_select_option(array(\'True\', \'False\'), ',NULL),(32,'cURL Proxy Address','CURL_PROXY_SERVER_DETAILS','','If you have a hosting service that requires use of a proxy to talk to external sites via cURL, enter their proxy address here.<br />format: address:port<br />ie: 127.0.0.1:3128',6,51,NULL,'2019-02-19 14:19:12',NULL,NULL,NULL),(33,'HTML Editor','HTML_EDITOR_PREFERENCE','NONE','Please select the HTML/Rich-Text editor you wish to use for composing Admin-related emails, newsletters, and product descriptions',1,110,NULL,'2019-02-19 14:19:12',NULL,'zen_cfg_pull_down_htmleditors(',NULL),(34,'Show Category Counts - Admin','SHOW_COUNTS_ADMIN','true','Show Category Counts in Admin?',1,19,NULL,'2019-02-19 14:19:12',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), ',NULL),(35,'Show linked status for categories','SHOW_CATEGORY_PRODUCTS_LINKED_STATUS','true','Show Category products linked status?',1,19,NULL,'2019-02-19 14:19:12',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), ',NULL),(36,'Currency Conversion Ratio','CURRENCY_UPLIFT_RATIO','1.05','When auto-updating currencies, what \"uplift\" ratio should be used to calculate the exchange rate used by your store?<br />ie: the bank rate is obtained from the currency-exchange servers; how much extra do you want to charge in order to make up the difference between the bank rate and the consumer rate?<br /><br /><strong>Default: 1.05 </strong><br />This will cause the published bank rate to be multiplied by 1.05 to set the currency rates in your store.',1,55,NULL,'2019-02-19 14:19:12',NULL,NULL,NULL),(37,'Currency Exchange Rate: Primary Source','CURRENCY_SERVER_PRIMARY','ecb','Where to request external currency updates from (Primary source)<br><br>Additional sources can be installed via plugins.',1,55,NULL,'2019-02-19 14:19:12',NULL,'zen_cfg_pull_down_exchange_rate_sources(',NULL),(38,'Currency Exchange Rate: Secondary Source','CURRENCY_SERVER_BACKUP','boc','Where to request external currency updates from (Secondary source)<br><br>Additional sources can be installed via plugins.',1,55,NULL,'2019-02-19 14:19:12',NULL,'zen_cfg_pull_down_exchange_rate_sources(',NULL),(39,'First Name','ENTRY_FIRST_NAME_MIN_LENGTH','2','Minimum length of first name',2,1,NULL,'2019-02-19 14:19:12',NULL,NULL,NULL),(40,'Last Name','ENTRY_LAST_NAME_MIN_LENGTH','2','Minimum length of last name',2,2,NULL,'2019-02-19 14:19:12',NULL,NULL,NULL),(41,'Date of Birth','ENTRY_DOB_MIN_LENGTH','10','Minimum length of date of birth',2,3,NULL,'2019-02-19 14:19:12',NULL,NULL,NULL),(42,'E-Mail Address','ENTRY_EMAIL_ADDRESS_MIN_LENGTH','6','Minimum length of e-mail address',2,4,NULL,'2019-02-19 14:19:12',NULL,NULL,NULL),(43,'Street Address','ENTRY_STREET_ADDRESS_MIN_LENGTH','5','Minimum length of street address',2,5,NULL,'2019-02-19 14:19:12',NULL,NULL,NULL),(44,'Company','ENTRY_COMPANY_MIN_LENGTH','0','Minimum length of company name',2,6,NULL,'2019-02-19 14:19:12',NULL,NULL,NULL),(45,'Post Code','ENTRY_POSTCODE_MIN_LENGTH','4','Minimum length of post code',2,7,NULL,'2019-02-19 14:19:12',NULL,NULL,NULL),(46,'City','ENTRY_CITY_MIN_LENGTH','2','Minimum length of city',2,8,NULL,'2019-02-19 14:19:12',NULL,NULL,NULL),(47,'State','ENTRY_STATE_MIN_LENGTH','2','Minimum length of state',2,9,NULL,'2019-02-19 14:19:12',NULL,NULL,NULL),(48,'Telephone Number','ENTRY_TELEPHONE_MIN_LENGTH','3','Minimum length of telephone number',2,10,NULL,'2019-02-19 14:19:12',NULL,NULL,NULL),(49,'Password','ENTRY_PASSWORD_MIN_LENGTH','7','Minimum length of password',2,11,NULL,'2019-02-19 14:19:12',NULL,NULL,NULL),(50,'Credit Card Owner Name','CC_OWNER_MIN_LENGTH','3','Minimum length of credit card owner name',2,12,NULL,'2019-02-19 14:19:12',NULL,NULL,NULL),(51,'Credit Card Number','CC_NUMBER_MIN_LENGTH','10','Minimum length of credit card number',2,13,NULL,'2019-02-19 14:19:12',NULL,NULL,NULL),(52,'Credit Card CVV Number','CC_CVV_MIN_LENGTH','3','Minimum length of credit card CVV number',2,13,NULL,'2019-02-19 14:19:12',NULL,NULL,NULL),(53,'Product Review Text','REVIEW_TEXT_MIN_LENGTH','50','Minimum length of product review text',2,14,NULL,'2019-02-19 14:19:12',NULL,NULL,NULL),(54,'Best Sellers','MIN_DISPLAY_BESTSELLERS','1','Minimum number of best sellers to display',2,15,NULL,'2019-02-19 14:19:12',NULL,NULL,NULL),(55,'Also Purchased Products','MIN_DISPLAY_ALSO_PURCHASED','1','Minimum number of products to display in the \'This Customer Also Purchased\' box',2,16,NULL,'2019-02-19 14:19:12',NULL,NULL,NULL),(56,'Nick Name','ENTRY_NICK_MIN_LENGTH','3','Minimum length of Nick Name',2,1,NULL,'2019-02-19 14:19:12',NULL,NULL,NULL),(57,'Admin Usernames','ADMIN_NAME_MINIMUM_LENGTH','4','Minimum length of admin usernames (must be 4 or more)',2,18,NULL,'2019-02-19 14:19:12',NULL,NULL,'{\"error\":\"TEXT_MIN_ADMIN_USER_LENGTH\",\"id\":\"FILTER_VALIDATE_INT\",\"options\":{\"options\":{\"min_range\":4}}}'),(58,'Address Book Entries','MAX_ADDRESS_BOOK_ENTRIES','5','Maximum address book entries a customer is allowed to have',3,1,NULL,'2019-02-19 14:19:12',NULL,NULL,NULL),(59,'Admin Search Results Per Page','MAX_DISPLAY_SEARCH_RESULTS','20','Number of products to list on an Admin search result page',3,2,NULL,'2019-02-19 14:19:12',NULL,NULL,NULL),(60,'Prev/Next Navigation Page Links (Desktop)','MAX_DISPLAY_PAGE_LINKS','5','Number of numbered pagination links to display.',3,3,NULL,'2019-02-19 14:19:12',NULL,NULL,NULL),(61,'Prev/Next Navigation Page Links (Mobile)','MAX_DISPLAY_PAGE_LINKS_MOBILE','3','Number of numbered pagination links to display on Mobile devices (assuming your template supports mobile-specific settings)',3,3,NULL,'2019-02-19 14:19:12',NULL,NULL,NULL),(62,'Products on Special ','MAX_DISPLAY_SPECIAL_PRODUCTS','9','Number of products on special to display',3,4,NULL,'2019-02-19 14:19:12',NULL,NULL,NULL),(63,'New Products Module','MAX_DISPLAY_NEW_PRODUCTS','9','Number of new products to display in a category',3,5,NULL,'2019-02-19 14:19:12',NULL,NULL,NULL),(64,'Upcoming Products ','MAX_DISPLAY_UPCOMING_PRODUCTS','10','Number of \'upcoming\' products to display',3,6,NULL,'2019-02-19 14:19:12',NULL,NULL,NULL),(65,'Manufacturers List - Scroll Box Size/Style','MAX_MANUFACTURERS_LIST','3','Number of manufacturers names to be displayed in the scroll box window. Setting this to 1 or 0 will display a dropdown list.',3,7,NULL,'2019-02-19 14:19:12',NULL,NULL,NULL),(66,'Manufacturers List - Verify Product Exist','PRODUCTS_MANUFACTURERS_STATUS','1','Verify that at least 1 product exists and is active for the manufacturer name to show<br /><br />Note: When this feature is ON it can produce slower results on sites with a large number of products and/or manufacturers<br />0= off 1= on',3,7,NULL,'2019-02-19 14:19:12',NULL,'zen_cfg_select_option(array(\'0\', \'1\'), ',NULL),(67,'Music Genre List - Scroll Box Size/Style','MAX_MUSIC_GENRES_LIST','3','Number of music genre names to be displayed in the scroll box window. Setting this to 1 or 0 will display a dropdown list.',3,7,NULL,'2019-02-19 14:19:12',NULL,NULL,NULL),(68,'Record Company List - Scroll Box Size/Style','MAX_RECORD_COMPANY_LIST','3','Number of record company names to be displayed in the scroll box window. Setting this to 1 or 0 will display a dropdown list.',3,7,NULL,'2019-02-19 14:19:12',NULL,NULL,NULL),(69,'Length of Record Company Name','MAX_DISPLAY_RECORD_COMPANY_NAME_LEN','15','Used in record companies box; maximum length of record company name to display. Longer names will be truncated.',3,8,NULL,'2019-02-19 14:19:12',NULL,NULL,NULL),(70,'Length of Music Genre Name','MAX_DISPLAY_MUSIC_GENRES_NAME_LEN','15','Used in music genres box; maximum length of music genre name to display. Longer names will be truncated.',3,8,NULL,'2019-02-19 14:19:12',NULL,NULL,NULL),(71,'Length of Manufacturers Name','MAX_DISPLAY_MANUFACTURER_NAME_LEN','15','Used in manufacturers box; maximum length of manufacturers name to display. Longer names will be truncated.',3,8,NULL,'2019-02-19 14:19:12',NULL,NULL,NULL),(72,'New Product Reviews Per Page','MAX_DISPLAY_NEW_REVIEWS','6','Number of new reviews to display on each page',3,9,NULL,'2019-02-19 14:19:12',NULL,NULL,NULL),(73,'Random Product Reviews for SideBox','MAX_RANDOM_SELECT_REVIEWS','1','Number of random product REVIEWS to rotate in the sidebox<br />Enter the number of products to display in this sidebox at one time.<br /><br />How many products do you want to display in this sidebox?',3,10,NULL,'2019-02-19 14:19:12',NULL,NULL,NULL),(74,'Random New Products for SideBox','MAX_RANDOM_SELECT_NEW','3','Number of random NEW products to rotate in the sidebox<br />Enter the number of products to display in this sidebox at one time.<br /><br />How many products do you want to display in this sidebox?',3,11,NULL,'2019-02-19 14:19:12',NULL,NULL,NULL),(75,'Random Products On Special for SideBox','MAX_RANDOM_SELECT_SPECIALS','2','Number of random products on SPECIAL to rotate in the sidebox<br />Enter the number of products to display in this sidebox at one time.<br /><br />How many products do you want to display in this sidebox?',3,12,NULL,'2019-02-19 14:19:12',NULL,NULL,NULL),(76,'Categories To List Per Row','MAX_DISPLAY_CATEGORIES_PER_ROW','3','How many categories to list per row',3,13,NULL,'2019-02-19 14:19:12',NULL,NULL,NULL),(77,'New Products Listing- Number Per Page','MAX_DISPLAY_PRODUCTS_NEW','10','Number of new products listed per page',3,14,NULL,'2019-02-19 14:19:12',NULL,NULL,NULL),(78,'Best Sellers For Box','MAX_DISPLAY_BESTSELLERS','10','Number of best sellers to display in box',3,15,NULL,'2019-02-19 14:19:12',NULL,NULL,NULL),(79,'Also Purchased Products','MAX_DISPLAY_ALSO_PURCHASED','6','Number of products to display in the \'This Customer Also Purchased\' box',3,16,NULL,'2019-02-19 14:19:12',NULL,NULL,NULL),(80,'Recent Purchases Box- NOTE: box is disabled ','MAX_DISPLAY_PRODUCTS_IN_ORDER_HISTORY_BOX','6','Number of products to display in the recent purchases box',3,17,NULL,'2019-02-19 14:19:12',NULL,NULL,NULL),(81,'Customer Order History List Per Page','MAX_DISPLAY_ORDER_HISTORY','10','Number of orders to display in the order history list in \'My Account\'',3,18,NULL,'2019-02-19 14:19:12',NULL,NULL,NULL),(82,'Maximum Display of Customers on Customers Page','MAX_DISPLAY_SEARCH_RESULTS_CUSTOMER','20','',3,19,NULL,'2019-02-19 14:19:12',NULL,NULL,NULL),(83,'Maximum Display of Orders on Orders Page','MAX_DISPLAY_SEARCH_RESULTS_ORDERS','20','',3,20,NULL,'2019-02-19 14:19:12',NULL,NULL,NULL),(84,'Maximum Display of Products on Reports','MAX_DISPLAY_SEARCH_RESULTS_REPORTS','20','',3,21,NULL,'2019-02-19 14:19:12',NULL,NULL,NULL),(85,'Maximum Categories Products Display List','MAX_DISPLAY_RESULTS_CATEGORIES','10','Number of products to list per screen',3,22,NULL,'2019-02-19 14:19:12',NULL,NULL,NULL),(86,'Products Listing- Number Per Page','MAX_DISPLAY_PRODUCTS_LISTING','10','Maximum Number of Products to list per page on main page',3,30,NULL,'2019-02-19 14:19:12',NULL,NULL,NULL),(87,'Products Attributes - Option Names and Values Display','MAX_ROW_LISTS_OPTIONS','10','Maximum number of option names and values to display in the products attributes page',3,24,NULL,'2019-02-19 14:19:12',NULL,NULL,NULL),(88,'Products Attributes - Attributes Controller Display','MAX_ROW_LISTS_ATTRIBUTES_CONTROLLER','30','Maximum number of attributes to display in the Attributes Controller page',3,25,NULL,'2019-02-19 14:19:12',NULL,NULL,NULL),(89,'Products Attributes - Downloads Manager Display','MAX_DISPLAY_SEARCH_RESULTS_DOWNLOADS_MANAGER','30','Maximum number of attributes downloads to display in the Downloads Manager page',3,26,NULL,'2019-02-19 14:19:12',NULL,NULL,NULL),(90,'Featured Products - Number to Display Admin','MAX_DISPLAY_SEARCH_RESULTS_FEATURED_ADMIN','10','Number of featured products to list per screen - Admin',3,27,NULL,'2019-02-19 14:19:12',NULL,NULL,NULL),(91,'Maximum Display of Featured Products - Main Page','MAX_DISPLAY_SEARCH_RESULTS_FEATURED','9','Number of featured products to list on main page',3,28,NULL,'2019-02-19 14:19:12',NULL,NULL,NULL),(92,'Maximum Display of Featured Products Page','MAX_DISPLAY_PRODUCTS_FEATURED_PRODUCTS','10','Number of featured products to list per screen',3,29,NULL,'2019-02-19 14:19:12',NULL,NULL,NULL),(93,'Random Featured Products for SideBox','MAX_RANDOM_SELECT_FEATURED_PRODUCTS','2','Number of random FEATURED products to rotate in the sidebox<br />Enter the number of products to display in this sidebox at one time.<br /><br />How many products do you want to display in this sidebox?',3,30,NULL,'2019-02-19 14:19:12',NULL,NULL,NULL),(94,'Maximum Display of Specials Products - Main Page','MAX_DISPLAY_SPECIAL_PRODUCTS_INDEX','9','Number of special products to list on main page',3,31,NULL,'2019-02-19 14:19:12',NULL,NULL,NULL),(95,'New Product Listing - Limited to ...','SHOW_NEW_PRODUCTS_LIMIT','0','Limit the New Product Listing to<br />0= All Products<br />1= Current Month<br />7= 7 Days<br />14= 14 Days<br />30= 30 Days<br />60= 60 Days<br />90= 90 Days<br />120= 120 Days',3,40,NULL,'2019-02-19 14:19:12',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'7\', \'14\', \'30\', \'60\', \'90\', \'120\'), ',NULL),(96,'Maximum Display of Products All Page','MAX_DISPLAY_PRODUCTS_ALL','10','Number of products to list per screen',3,45,NULL,'2019-02-19 14:19:12',NULL,NULL,NULL),(97,'Maximum Display of Language Flags in Language Side Box','MAX_LANGUAGE_FLAGS_COLUMNS','3','Number of Language Flags per Row',3,50,NULL,'2019-02-19 14:19:12',NULL,NULL,NULL),(98,'Maximum File Upload Size','MAX_FILE_UPLOAD_SIZE','2048000','What is the Maximum file size for uploads?<br />Default= 2048000',3,60,NULL,'2019-02-19 14:19:12',NULL,NULL,NULL),(99,'Allowed Filename Extensions for uploading','UPLOAD_FILENAME_EXTENSIONS','jpg,jpeg,gif,png,eps,cdr,ai,pdf,tif,tiff,bmp,zip','List the permissible filetypes (filename extensions) to be allowed when files are uploaded to your site by customers. Separate multiple values with commas(,). Do not include the dot(.).<br /><br />Suggested setting: \"jpg,jpeg,gif,png,eps,cdr,ai,pdf,tif,tiff,bmp,zip\"',3,61,NULL,'2019-02-19 14:19:12',NULL,'zen_cfg_textarea(',NULL),(100,'Maximum Orders Detail Display on Admin Orders Listing','MAX_DISPLAY_RESULTS_ORDERS_DETAILS_LISTING','0','Maximum number of Order Details<br />0 = Unlimited',3,65,NULL,'2019-02-19 14:19:12',NULL,NULL,NULL),(101,'Maximum PayPal IPN Display on Admin Listing','MAX_DISPLAY_SEARCH_RESULTS_PAYPAL_IPN','20','Maximum number of PayPal IPN Lisings in Admin<br />Default is 20',3,66,NULL,'2019-02-19 14:19:12',NULL,NULL,NULL),(102,'Maximum Display Columns Products to Multiple Categories Manager','MAX_DISPLAY_PRODUCTS_TO_CATEGORIES_COLUMNS','3','Maximum Display Columns Products to Multiple Categories Manager<br />3 = Default',3,70,NULL,'2019-02-19 14:19:12',NULL,NULL,NULL),(103,'Maximum Display EZ-Pages','MAX_DISPLAY_SEARCH_RESULTS_EZPAGE','20','Maximum Display EZ-Pages<br />20 = Default',3,71,NULL,'2019-02-19 14:19:12',NULL,NULL,NULL),(104,'Small Image Width','SMALL_IMAGE_WIDTH','100','The pixel width of small images',4,1,NULL,'2019-02-19 14:19:12',NULL,NULL,NULL),(105,'Small Image Height','SMALL_IMAGE_HEIGHT','80','The pixel height of small images',4,2,NULL,'2019-02-19 14:19:12',NULL,NULL,NULL),(106,'Heading Image Width - Admin','HEADING_IMAGE_WIDTH','57','The pixel width of heading images in the Admin<br />NOTE: Presently, this adjusts the spacing on the pages in the Admin Pages or could be used to add images to the heading in the Admin',4,3,NULL,'2019-02-19 14:19:12',NULL,NULL,NULL),(107,'Heading Image Height - Admin','HEADING_IMAGE_HEIGHT','40','The pixel height of heading images in the Admin<br />NOTE: Presently, this adjusts the spacing on the pages in the Admin Pages or could be used to add images to the heading in the Admin',4,4,NULL,'2019-02-19 14:19:12',NULL,NULL,NULL),(108,'Subcategory Image Width','SUBCATEGORY_IMAGE_WIDTH','100','The pixel width of subcategory images',4,5,NULL,'2019-02-19 14:19:12',NULL,NULL,NULL),(109,'Subcategory Image Height','SUBCATEGORY_IMAGE_HEIGHT','57','The pixel height of subcategory images',4,6,NULL,'2019-02-19 14:19:12',NULL,NULL,NULL),(110,'Calculate Image Size','CONFIG_CALCULATE_IMAGE_SIZE','true','Calculate the size of images?',4,7,NULL,'2019-02-19 14:19:12',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), ',NULL),(111,'Image Required','IMAGE_REQUIRED','true','Enable to display broken images. Good for development.',4,8,NULL,'2019-02-19 14:19:12',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), ',NULL),(112,'Image - Shopping Cart Status','IMAGE_SHOPPING_CART_STATUS','1','Show product image in the shopping cart?<br />0= off 1= on',4,9,NULL,'2019-02-19 14:19:12',NULL,'zen_cfg_select_option(array(\'0\', \'1\'), ',NULL),(113,'Image - Shopping Cart Width','IMAGE_SHOPPING_CART_WIDTH','50','Default = 50',4,10,NULL,'2019-02-19 14:19:12',NULL,NULL,NULL),(114,'Image - Shopping Cart Height','IMAGE_SHOPPING_CART_HEIGHT','40','Default = 40',4,11,NULL,'2019-02-19 14:19:12',NULL,NULL,NULL),(115,'Category Icon Image Width - Product Info Pages','CATEGORY_ICON_IMAGE_WIDTH','57','The pixel width of Category Icon heading images for Product Info Pages',4,13,NULL,'2019-02-19 14:19:12',NULL,NULL,NULL),(116,'Category Icon Image Height - Product Info Pages','CATEGORY_ICON_IMAGE_HEIGHT','40','The pixel height of Category Icon heading images for Product Info Pages',4,14,NULL,'2019-02-19 14:19:12',NULL,NULL,NULL),(117,'Top Subcategory Image Width','SUBCATEGORY_IMAGE_TOP_WIDTH','150','The pixel width of Top subcategory images<br />Top subcategory is when the Category contains subcategories',4,15,NULL,'2019-02-19 14:19:12',NULL,NULL,NULL),(118,'Top Subcategory Image Height','SUBCATEGORY_IMAGE_TOP_HEIGHT','85','The pixel height of Top subcategory images<br />Top subcategory is when the Category contains subcategories',4,16,NULL,'2019-02-19 14:19:12',NULL,NULL,NULL),(119,'Product Info - Image Width','MEDIUM_IMAGE_WIDTH','150','The pixel width of Product Info images',4,20,NULL,'2019-02-19 14:19:12',NULL,NULL,NULL),(120,'Product Info - Image Height','MEDIUM_IMAGE_HEIGHT','120','The pixel height of Product Info images',4,21,NULL,'2019-02-19 14:19:12',NULL,NULL,NULL),(121,'Product Info - Image Medium Suffix','IMAGE_SUFFIX_MEDIUM','_MED','Product Info Medium Image Suffix<br />Default = _MED',4,22,NULL,'2019-02-19 14:19:12',NULL,NULL,NULL),(122,'Product Info - Image Large Suffix','IMAGE_SUFFIX_LARGE','_LRG','Product Info Large Image Suffix<br />Default = _LRG',4,23,NULL,'2019-02-19 14:19:12',NULL,NULL,NULL),(123,'Product Info - Number of Additional Images per Row','IMAGES_AUTO_ADDED','3','Product Info - Enter the number of additional images to display per row<br />Default = 3',4,30,NULL,'2019-02-19 14:19:12',NULL,NULL,NULL),(124,'Image - Product Listing Width','IMAGE_PRODUCT_LISTING_WIDTH','100','Default = 100',4,40,NULL,'2019-02-19 14:19:12',NULL,NULL,NULL),(125,'Image - Product Listing Height','IMAGE_PRODUCT_LISTING_HEIGHT','80','Default = 80',4,41,NULL,'2019-02-19 14:19:12',NULL,NULL,NULL),(126,'Image - Product New Listing Width','IMAGE_PRODUCT_NEW_LISTING_WIDTH','100','Default = 100',4,42,NULL,'2019-02-19 14:19:12',NULL,NULL,NULL),(127,'Image - Product New Listing Height','IMAGE_PRODUCT_NEW_LISTING_HEIGHT','80','Default = 80',4,43,NULL,'2019-02-19 14:19:12',NULL,NULL,NULL),(128,'Image - New Products Width','IMAGE_PRODUCT_NEW_WIDTH','100','Default = 100',4,44,NULL,'2019-02-19 14:19:12',NULL,NULL,NULL),(129,'Image - New Products Height','IMAGE_PRODUCT_NEW_HEIGHT','80','Default = 80',4,45,NULL,'2019-02-19 14:19:12',NULL,NULL,NULL),(130,'Image - Featured Products Width','IMAGE_FEATURED_PRODUCTS_LISTING_WIDTH','100','Default = 100',4,46,NULL,'2019-02-19 14:19:12',NULL,NULL,NULL),(131,'Image - Featured Products Height','IMAGE_FEATURED_PRODUCTS_LISTING_HEIGHT','80','Default = 80',4,47,NULL,'2019-02-19 14:19:12',NULL,NULL,NULL),(132,'Image - Product All Listing Width','IMAGE_PRODUCT_ALL_LISTING_WIDTH','100','Default = 100',4,48,NULL,'2019-02-19 14:19:12',NULL,NULL,NULL),(133,'Image - Product All Listing Height','IMAGE_PRODUCT_ALL_LISTING_HEIGHT','80','Default = 80',4,49,NULL,'2019-02-19 14:19:12',NULL,NULL,NULL),(134,'Product Image - No Image Status','PRODUCTS_IMAGE_NO_IMAGE_STATUS','1','Use automatic No Image when none is added to product<br />0= off<br />1= On',4,60,NULL,'2019-02-19 14:19:12',NULL,'zen_cfg_select_option(array(\'0\', \'1\'), ',NULL),(135,'Product Image - No Image picture','PRODUCTS_IMAGE_NO_IMAGE','no_picture.gif','Use automatic No Image when none is added to product<br />Default = no_picture.gif',4,61,NULL,'2019-02-19 14:19:12',NULL,NULL,NULL),(136,'Image - Use Proportional Images on Products and Categories','PROPORTIONAL_IMAGES_STATUS','1','Use Proportional Images on Products and Categories?<br /><br />NOTE: Do not use 0 height or width settings for Proportion Images<br />0= off 1= on',4,75,NULL,'2019-02-19 14:19:12',NULL,'zen_cfg_select_option(array(\'0\', \'1\'), ',NULL),(137,'Email Salutation','ACCOUNT_GENDER','false','Display salutation choice during account creation and with account information',5,1,NULL,'2019-02-19 14:19:12',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), ',NULL),(138,'Date of Birth','ACCOUNT_DOB','false','Display date of birth field during account creation and with account information<br />NOTE: Set Minimum Value Date of Birth to blank for not required<br />Set Minimum Value Date of Birth > 0 to require',5,2,NULL,'2019-02-19 14:19:12',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), ',NULL),(139,'Company','ACCOUNT_COMPANY','true','Display company field during account creation and with account information',5,3,NULL,'2019-02-19 14:19:12',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), ',NULL),(140,'Address Line 2','ACCOUNT_SUBURB','true','Display address line 2 field during account creation and with account information',5,4,NULL,'2019-02-19 14:19:12',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), ',NULL),(141,'State','ACCOUNT_STATE','true','Display state field during account creation and with account information',5,5,NULL,'2019-02-19 14:19:12',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), ',NULL),(142,'State - Always display as pulldown?','ACCOUNT_STATE_DRAW_INITIAL_DROPDOWN','false','When state field is displayed, should it always be a pulldown menu?',5,5,NULL,'2019-02-19 14:19:12',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), ',NULL),(143,'Create Account Default Country ID','SHOW_CREATE_ACCOUNT_DEFAULT_COUNTRY','223','Set Create Account Default Country ID to:<br />Default is 223',5,6,NULL,'2019-02-19 14:19:12','zen_get_country_name','zen_cfg_pull_down_country_list_none(',NULL),(144,'Fax Number','ACCOUNT_FAX_NUMBER','true','Display fax number field during account creation and with account information',5,10,NULL,'2019-02-19 14:19:12',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), ',NULL),(145,'Show Newsletter Checkbox','ACCOUNT_NEWSLETTER_STATUS','1','Show Newsletter Checkbox<br />0= off<br />1= Display Unchecked<br />2= Display Checked<br /><strong>Note: Defaulting this to accepted may be in violation of certain regulations for your state or country</strong>',5,45,NULL,'2019-02-19 14:19:12',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\'), ',NULL),(146,'Customer Default Email Preference','ACCOUNT_EMAIL_PREFERENCE','0','Set the Default Customer Default Email Preference<br />0= Text<br />1= HTML<br />',5,46,NULL,'2019-02-19 14:19:12',NULL,'zen_cfg_select_option(array(\'0\', \'1\'), ',NULL),(147,'Customer Product Notification Status','CUSTOMERS_PRODUCTS_NOTIFICATION_STATUS','1','Customer should be asked about product notifications after checkout success and in account preferences<br />0= Never ask<br />1= Ask (ignored on checkout if has already selected global notifications)<br /><br />Note: Sidebox must be turned off separately',5,50,NULL,'2019-02-19 14:19:12',NULL,'zen_cfg_select_option(array(\'0\', \'1\'), ',NULL),(148,'Customer Shop Status - View Shop and Prices','CUSTOMERS_APPROVAL','0','Customer must be approved to shop<br />0= Not required<br />1= Must login to browse<br />2= May browse but no prices unless logged in<br />3= Showroom Only<br /><br />It is recommended that Option 2 be used for the purposes of Spiders if you wish customers to login to see prices.',5,55,NULL,'2019-02-19 14:19:12',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\'), ',NULL),(149,'Customer Approval Status - Authorization Pending','CUSTOMERS_APPROVAL_AUTHORIZATION','0','Customer must be Authorized to shop<br />0= Not required<br />1= Must be Authorized to Browse<br />2= May browse but no prices unless Authorized<br />3= Customer May Browse and May see Prices but Must be Authorized to Buy<br /><br />It is recommended that Option 2 or 3 be used for the purposes of Spiders',5,65,NULL,'2019-02-19 14:19:12',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\'), ',NULL),(150,'Customer Authorization: filename','CUSTOMERS_AUTHORIZATION_FILENAME','customers_authorization','Customer Authorization filename<br />Note: Do not include the extension<br />Default=customers_authorization',5,66,NULL,'2019-02-19 14:19:12',NULL,'',NULL),(151,'Customer Authorization: Hide Header','CUSTOMERS_AUTHORIZATION_HEADER_OFF','false','Customer Authorization: Hide Header <br />(true=hide false=show)',5,67,NULL,'2019-02-19 14:19:12',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), ',NULL),(152,'Customer Authorization: Hide Column Left','CUSTOMERS_AUTHORIZATION_COLUMN_LEFT_OFF','false','Customer Authorization: Hide Column Left <br />(true=hide false=show)',5,68,NULL,'2019-02-19 14:19:12',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), ',NULL),(153,'Customer Authorization: Hide Column Right','CUSTOMERS_AUTHORIZATION_COLUMN_RIGHT_OFF','false','Customer Authorization: Hide Column Right <br />(true=hide false=show)',5,69,NULL,'2019-02-19 14:19:12',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), ',NULL),(154,'Customer Authorization: Hide Footer','CUSTOMERS_AUTHORIZATION_FOOTER_OFF','false','Customer Authorization: Hide Footer <br />(true=hide false=show)',5,70,NULL,'2019-02-19 14:19:12',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), ',NULL),(155,'Customer Authorization: Hide Prices','CUSTOMERS_AUTHORIZATION_PRICES_OFF','false','Customer Authorization: Hide Prices <br />(true=hide false=show)',5,71,NULL,'2019-02-19 14:19:12',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), ',NULL),(156,'Customers Referral Status','CUSTOMERS_REFERRAL_STATUS','0','Customers Referral Code is created from<br />0= Off<br />1= 1st Discount Coupon Code used<br />2= Customer can add during create account or edit if blank<br /><br />NOTE: Once the Customers Referral Code has been set it can only be changed in the Admin Customer',5,80,NULL,'2019-02-19 14:19:12',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\'), ',NULL),(157,'Installed Modules','MODULE_PAYMENT_INSTALLED','freecharger.php;moneyorder.php','List of payment module filenames separated by a semi-colon. This is automatically updated. No need to edit. (Example: freecharger.php;cod.php;paypal.php)',6,0,NULL,'2019-02-19 14:19:12',NULL,NULL,NULL),(158,'Installed Modules','MODULE_ORDER_TOTAL_INSTALLED','ot_subtotal.php;ot_shipping.php;ot_coupon.php;ot_group_pricing.php;ot_tax.php;ot_loworderfee.php;ot_gv.php;ot_total.php','List of order_total module filenames separated by a semi-colon. This is automatically updated. No need to edit. (Example: ot_subtotal.php;ot_tax.php;ot_shipping.php;ot_total.php)',6,0,NULL,'2019-02-19 14:19:12',NULL,NULL,NULL),(159,'Installed Modules','MODULE_SHIPPING_INSTALLED','flat.php;freeshipper.php;item.php;storepickup.php','List of shipping module filenames separated by a semi-colon. This is automatically updated. No need to edit. (Example: ups.php;flat.php;item.php)',6,0,NULL,'2019-02-19 14:19:12',NULL,NULL,NULL),(160,'Enable Free Shipping','MODULE_SHIPPING_FREESHIPPER_STATUS','True','Do you want to offer Free shipping?',6,0,NULL,'2019-02-19 14:19:12',NULL,'zen_cfg_select_option(array(\'True\', \'False\'), ',NULL),(161,'Pickup Locations','MODULE_SHIPPING_STOREPICKUP_LOCATIONS_LIST','Walk In','Enter a list of locations, separated by semicolons (;).<br>Optionally you may specify a fee/surcharge for each location by adding a comma and an amount. If no amount is specified, then the generic Shipping Cost amount from the next setting will be applied.<br><br>Examples:<br>121 Main Street;20 Church Street<br>Sunnyside,4.00;Lee Park,5.00;High Street,0.00<br>Dallas;Tulsa,5.00;Phoenix,0.00<br>For multilanguage use, see the define-statement in the language file for this module.',6,0,NULL,'2019-02-19 14:19:12',NULL,NULL,NULL),(162,'Free Shipping Cost','MODULE_SHIPPING_FREESHIPPER_COST','0.00','What is the Shipping cost?',6,6,NULL,'2019-02-19 14:19:12',NULL,NULL,NULL),(163,'Handling Fee','MODULE_SHIPPING_FREESHIPPER_HANDLING','0','Handling fee for this shipping method.',6,0,NULL,'2019-02-19 14:19:12',NULL,NULL,NULL),(164,'Tax Class','MODULE_SHIPPING_FREESHIPPER_TAX_CLASS','0','Use the following tax class on the shipping fee.',6,0,NULL,'2019-02-19 14:19:12','zen_get_tax_class_title','zen_cfg_pull_down_tax_classes(',NULL),(165,'Shipping Zone','MODULE_SHIPPING_FREESHIPPER_ZONE','0','If a zone is selected, only enable this shipping method for that zone.',6,0,NULL,'2019-02-19 14:19:12','zen_get_zone_class_title','zen_cfg_pull_down_zone_classes(',NULL),(166,'Sort Order','MODULE_SHIPPING_FREESHIPPER_SORT_ORDER','0','Sort order of display.',6,0,NULL,'2019-02-19 14:19:12',NULL,NULL,NULL),(167,'Enable Store Pickup Shipping','MODULE_SHIPPING_STOREPICKUP_STATUS','True','Do you want to offer In Store rate shipping?',6,0,NULL,'2019-02-19 14:19:12',NULL,'zen_cfg_select_option(array(\'True\', \'False\'), ',NULL),(168,'Shipping Cost','MODULE_SHIPPING_STOREPICKUP_COST','0.00','The shipping cost for all orders using this shipping method.',6,0,NULL,'2019-02-19 14:19:12',NULL,NULL,NULL),(169,'Tax Class','MODULE_SHIPPING_STOREPICKUP_TAX_CLASS','0','Use the following tax class on the shipping fee.',6,0,NULL,'2019-02-19 14:19:12','zen_get_tax_class_title','zen_cfg_pull_down_tax_classes(',NULL),(170,'Tax Basis','MODULE_SHIPPING_STOREPICKUP_TAX_BASIS','Shipping','On what basis is Shipping Tax calculated. Options are<br />Shipping - Based on customers Shipping Address<br />Billing Based on customers Billing address<br />Store - Based on Store address if Billing/Shipping Zone equals Store zone',6,0,NULL,'2019-02-19 14:19:12',NULL,'zen_cfg_select_option(array(\'Shipping\', \'Billing\'), ',NULL),(171,'Shipping Zone','MODULE_SHIPPING_STOREPICKUP_ZONE','0','If a zone is selected, only enable this shipping method for that zone.',6,0,NULL,'2019-02-19 14:19:12','zen_get_zone_class_title','zen_cfg_pull_down_zone_classes(',NULL),(172,'Sort Order','MODULE_SHIPPING_STOREPICKUP_SORT_ORDER','0','Sort order of display.',6,0,NULL,'2019-02-19 14:19:12',NULL,NULL,NULL),(173,'Enable Item Shipping','MODULE_SHIPPING_ITEM_STATUS','True','Do you want to offer per item rate shipping?',6,0,NULL,'2019-02-19 14:19:12',NULL,'zen_cfg_select_option(array(\'True\', \'False\'), ',NULL),(174,'Shipping Cost','MODULE_SHIPPING_ITEM_COST','2.50','The shipping cost will be multiplied by the number of items in an order that uses this shipping method.',6,0,NULL,'2019-02-19 14:19:12',NULL,NULL,NULL),(175,'Handling Fee','MODULE_SHIPPING_ITEM_HANDLING','0','Handling fee for this shipping method.',6,0,NULL,'2019-02-19 14:19:12',NULL,NULL,NULL),(176,'Tax Class','MODULE_SHIPPING_ITEM_TAX_CLASS','0','Use the following tax class on the shipping fee.',6,0,NULL,'2019-02-19 14:19:12','zen_get_tax_class_title','zen_cfg_pull_down_tax_classes(',NULL),(177,'Tax Basis','MODULE_SHIPPING_ITEM_TAX_BASIS','Shipping','On what basis is Shipping Tax calculated. Options are<br />Shipping - Based on customers Shipping Address<br />Billing Based on customers Billing address<br />Store - Based on Store address if Billing/Shipping Zone equals Store zone',6,0,NULL,'2019-02-19 14:19:12',NULL,'zen_cfg_select_option(array(\'Shipping\', \'Billing\', \'Store\'), ',NULL),(178,'Shipping Zone','MODULE_SHIPPING_ITEM_ZONE','0','If a zone is selected, only enable this shipping method for that zone.',6,0,NULL,'2019-02-19 14:19:12','zen_get_zone_class_title','zen_cfg_pull_down_zone_classes(',NULL),(179,'Sort Order','MODULE_SHIPPING_ITEM_SORT_ORDER','0','Sort order of display.',6,0,NULL,'2019-02-19 14:19:12',NULL,NULL,NULL),(180,'Enable Free Charge Module','MODULE_PAYMENT_FREECHARGER_STATUS','True','Do you want to accept Free Charge payments?',6,1,NULL,'2019-02-19 14:19:12',NULL,'zen_cfg_select_option(array(\'True\', \'False\'), ',NULL),(181,'Sort order of display.','MODULE_PAYMENT_FREECHARGER_SORT_ORDER','0','Sort order of display. Lowest is displayed first.',6,0,NULL,'2019-02-19 14:19:12',NULL,NULL,NULL),(182,'Payment Zone','MODULE_PAYMENT_FREECHARGER_ZONE','0','If a zone is selected, only enable this payment method for that zone.',6,2,NULL,'2019-02-19 14:19:12','zen_get_zone_class_title','zen_cfg_pull_down_zone_classes(',NULL),(183,'Set Order Status','MODULE_PAYMENT_FREECHARGER_ORDER_STATUS_ID','2','Set the status of orders made with this payment module to this value',6,0,NULL,'2019-02-19 14:19:12','zen_get_order_status_name','zen_cfg_pull_down_order_statuses(',NULL),(184,'Enable Check/Money Order Module','MODULE_PAYMENT_MONEYORDER_STATUS','True','Do you want to accept Check/Money Order payments?',6,1,NULL,'2019-02-19 14:19:12',NULL,'zen_cfg_select_option(array(\'True\', \'False\'), ',NULL),(185,'Make Payable to:','MODULE_PAYMENT_MONEYORDER_PAYTO','the Store Owner/Website Name','Who should payments be made payable to?',6,1,NULL,'2019-02-19 14:19:12',NULL,NULL,NULL),(186,'Sort order of display.','MODULE_PAYMENT_MONEYORDER_SORT_ORDER','0','Sort order of display. Lowest is displayed first.',6,0,NULL,'2019-02-19 14:19:12',NULL,NULL,NULL),(187,'Payment Zone','MODULE_PAYMENT_MONEYORDER_ZONE','0','If a zone is selected, only enable this payment method for that zone.',6,2,NULL,'2019-02-19 14:19:12','zen_get_zone_class_title','zen_cfg_pull_down_zone_classes(',NULL),(188,'Set Order Status','MODULE_PAYMENT_MONEYORDER_ORDER_STATUS_ID','0','Set the status of orders made with this payment module to this value',6,0,NULL,'2019-02-19 14:19:12','zen_get_order_status_name','zen_cfg_pull_down_order_statuses(',NULL),(189,'Include Tax','MODULE_ORDER_TOTAL_GROUP_PRICING_INC_TAX','false','Include Tax value in amount before discount calculation?',6,6,NULL,'2019-02-19 14:19:12',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), ',NULL),(190,'This module is installed','MODULE_ORDER_TOTAL_GROUP_PRICING_STATUS','true','',6,1,NULL,'2019-02-19 14:19:12',NULL,'zen_cfg_select_option(array(\'true\'), ',NULL),(191,'Sort Order','MODULE_ORDER_TOTAL_GROUP_PRICING_SORT_ORDER','290','Sort order of display.',6,2,NULL,'2019-02-19 14:19:12',NULL,NULL,NULL),(192,'Include Shipping','MODULE_ORDER_TOTAL_GROUP_PRICING_INC_SHIPPING','false','Include Shipping value in amount before discount calculation?',6,5,NULL,'2019-02-19 14:19:12',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), ',NULL),(193,'Re-calculate Tax','MODULE_ORDER_TOTAL_GROUP_PRICING_CALC_TAX','Standard','Re-Calculate Tax',6,7,NULL,'2019-02-19 14:19:12',NULL,'zen_cfg_select_option(array(\'None\', \'Standard\', \'Credit Note\'), ',NULL),(194,'Tax Class','MODULE_ORDER_TOTAL_GROUP_PRICING_TAX_CLASS','0','Use the following tax class when treating Group Discount as Credit Note.',6,0,NULL,'2019-02-19 14:19:12','zen_get_tax_class_title','zen_cfg_pull_down_tax_classes(',NULL),(195,'Enable Flat Shipping','MODULE_SHIPPING_FLAT_STATUS','True','Do you want to offer flat rate shipping?',6,0,NULL,'2019-02-19 14:19:12',NULL,'zen_cfg_select_option(array(\'True\', \'False\'), ',NULL),(196,'Shipping Cost','MODULE_SHIPPING_FLAT_COST','5.00','The shipping cost for all orders using this shipping method.',6,0,NULL,'2019-02-19 14:19:12',NULL,NULL,NULL),(197,'Tax Class','MODULE_SHIPPING_FLAT_TAX_CLASS','0','Use the following tax class on the shipping fee.',6,0,NULL,'2019-02-19 14:19:12','zen_get_tax_class_title','zen_cfg_pull_down_tax_classes(',NULL),(198,'Tax Basis','MODULE_SHIPPING_FLAT_TAX_BASIS','Shipping','On what basis is Shipping Tax calculated. Options are<br />Shipping - Based on customers Shipping Address<br />Billing Based on customers Billing address<br />Store - Based on Store address if Billing/Shipping Zone equals Store zone',6,0,NULL,'2019-02-19 14:19:12',NULL,'zen_cfg_select_option(array(\'Shipping\', \'Billing\', \'Store\'), ',NULL),(199,'Shipping Zone','MODULE_SHIPPING_FLAT_ZONE','0','If a zone is selected, only enable this shipping method for that zone.',6,0,NULL,'2019-02-19 14:19:12','zen_get_zone_class_title','zen_cfg_pull_down_zone_classes(',NULL),(200,'Sort Order','MODULE_SHIPPING_FLAT_SORT_ORDER','0','Sort order of display.',6,0,NULL,'2019-02-19 14:19:12',NULL,NULL,NULL),(201,'Default Currency','DEFAULT_CURRENCY','USD','Default Currency',6,0,NULL,'2019-02-19 14:19:12',NULL,NULL,NULL),(202,'Default Language','DEFAULT_LANGUAGE','en','Default Language',6,0,NULL,'2019-02-19 14:19:12',NULL,NULL,NULL),(203,'Default Order Status For New Orders','DEFAULT_ORDERS_STATUS_ID','1','When a new order is created, this order status will be assigned to it.',6,0,NULL,'2019-02-19 14:19:12',NULL,NULL,NULL),(204,'Admin configuration_key shows','ADMIN_CONFIGURATION_KEY_ON','0','Manually switch to value of 1 to see the configuration_key name in configuration displays',6,0,NULL,'2019-02-19 14:19:12',NULL,NULL,NULL),(205,'Country of Origin','SHIPPING_ORIGIN_COUNTRY','223','Select the country of origin to be used in shipping quotes.',7,1,NULL,'2019-02-19 14:19:12','zen_get_country_name','zen_cfg_pull_down_country_list(',NULL),(206,'Postal Code','SHIPPING_ORIGIN_ZIP','NONE','Enter the Postal Code (ZIP) of the Store to be used in shipping quotes. NOTE: For USA zip codes, only use your 5 digit zip code.',7,2,NULL,'2019-02-19 14:19:12',NULL,NULL,NULL),(207,'Enter the Maximum Package Weight you will ship','SHIPPING_MAX_WEIGHT','50','Carriers have a max weight limit for a single package. This is a common one for all.',7,3,NULL,'2019-02-19 14:19:12',NULL,NULL,NULL),(208,'Package Tare Small to Medium - added percentage:weight','SHIPPING_BOX_WEIGHT','0:3','What is the weight of typical packaging of small to medium packages?<br />Example: 10% + 1lb 10:1<br />10% + 0lbs 10:0<br />0% + 5lbs 0:5<br />0% + 0lbs 0:0',7,4,NULL,'2019-02-19 14:19:12',NULL,NULL,NULL),(209,'Larger packages - added packaging percentage:weight','SHIPPING_BOX_PADDING','10:0','What is the weight of typical packaging for Large packages?<br />Example: 10% + 1lb 10:1<br />10% + 0lbs 10:0<br />0% + 5lbs 0:5<br />0% + 0lbs 0:0',7,5,NULL,'2019-02-19 14:19:12',NULL,NULL,NULL),(210,'Display Number of Boxes and Weight Status','SHIPPING_BOX_WEIGHT_DISPLAY','3','Display Shipping Weight and Number of Boxes?<br /><br />0= off<br />1= Boxes Only<br />2= Weight Only<br />3= Both Boxes and Weight',7,15,NULL,'2019-02-19 14:19:12',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\'), ',NULL),(211,'Shipping Estimator Display Settings for Shopping Cart','SHOW_SHIPPING_ESTIMATOR_BUTTON','1','<br />0= Off<br />1= Display as Button on Shopping Cart<br />2= Display as Listing on Shopping Cart Page',7,20,NULL,'2019-02-19 14:19:12',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\'), ',NULL),(212,'Display Order Comments on Admin Invoice','ORDER_COMMENTS_INVOICE','1','Do you want to display the Order Comments on the Admin Invoice?<br />0= OFF<br />1= First Comment by Customer only<br />2= All Comments for the Order',7,25,NULL,'2019-02-19 14:19:12',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\'), ',NULL),(213,'Display Order Comments on Admin Packing Slip','ORDER_COMMENTS_PACKING_SLIP','1','Do you want to display the Order Comments on the Admin Packing Slip?<br />0= OFF<br />1= First Comment by Customer only<br />2= All Comments for the Order',7,26,NULL,'2019-02-19 14:19:12',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\'), ',NULL),(214,'Order Free Shipping 0 Weight Status','ORDER_WEIGHT_ZERO_STATUS','0','If there is no weight to the order, does the order have Free Shipping?<br />0= no<br />1= yes<br /><br />Note: When using Free Shipping, Enable the Free Shipping Module this will only show when shipping is free.',7,15,NULL,'2019-02-19 14:19:12',NULL,'zen_cfg_select_option(array(\'0\', \'1\'), ',NULL),(215,'Display Product Image','PRODUCT_LIST_IMAGE','1','Do you want to display the Product Image?',8,1,NULL,'2019-02-19 14:19:12',NULL,NULL,NULL),(216,'Display Product Manufacturer Name','PRODUCT_LIST_MANUFACTURER','0','Do you want to display the Product Manufacturer Name?',8,2,NULL,'2019-02-19 14:19:12',NULL,NULL,NULL),(217,'Display Product Model','PRODUCT_LIST_MODEL','0','Do you want to display the Product Model?',8,3,NULL,'2019-02-19 14:19:12',NULL,NULL,NULL),(218,'Display Product Name','PRODUCT_LIST_NAME','2','Do you want to display the Product Name?',8,4,NULL,'2019-02-19 14:19:12',NULL,NULL,NULL),(219,'Display Product Price/Add to Cart','PRODUCT_LIST_PRICE','3','Do you want to display the Product Price/Add to Cart',8,5,NULL,'2019-02-19 14:19:12',NULL,NULL,NULL),(220,'Display Product Quantity','PRODUCT_LIST_QUANTITY','0','Do you want to display the Product Quantity?',8,6,NULL,'2019-02-19 14:19:12',NULL,NULL,NULL),(221,'Display Product Weight','PRODUCT_LIST_WEIGHT','0','Do you want to display the Product Weight?',8,7,NULL,'2019-02-19 14:19:12',NULL,NULL,NULL),(222,'Display Product Price/Add to Cart Column Width','PRODUCTS_LIST_PRICE_WIDTH','125','Define the width of the Price/Add to Cart column<br />Default= 125',8,8,NULL,'2019-02-19 14:19:12',NULL,NULL,NULL),(223,'Display Category/Manufacturer Filter (0=off; 1=on)','PRODUCT_LIST_FILTER','0','Do you want to display the Category/Manufacturer Filter?',8,9,NULL,'2019-02-19 14:19:12',NULL,'zen_cfg_select_option(array(\'0\', \'1\'), ',NULL),(224,'Prev/Next Split Page Navigation (1-top, 2-bottom, 3-both)','PREV_NEXT_BAR_LOCATION','3','Sets the location of the Prev/Next Split Page Navigation',8,10,NULL,'2019-02-19 14:19:12',NULL,'zen_cfg_select_option(array(\'1\', \'2\', \'3\'), ',NULL),(225,'Display Product Listing Default Sort Order','PRODUCT_LISTING_DEFAULT_SORT_ORDER','','Product Listing Default sort order?<br />NOTE: Leave Blank for Product Sort Order. Sort the Product Listing in the order you wish for the default display to start in to get the sort order setting. Example: 2a',8,15,NULL,'2019-02-19 14:19:12',NULL,NULL,NULL),(226,'Display Product Add to Cart Button (0=off; 1=on; 2=on with Qty Box per Product)','PRODUCT_LIST_PRICE_BUY_NOW','0','Do you want to display the Add to Cart Button?<br /><br /><strong>NOTE:</strong> Turn OFF Display Multiple Products Qty Box Status to use Option 2 on with Qty Box per Product',8,20,NULL,'2019-02-19 14:19:12',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\'), ',NULL),(227,'Display Multiple Products Qty Box Status and Set Button Location','PRODUCT_LISTING_MULTIPLE_ADD_TO_CART','3','Do you want to display Add Multiple Products Qty Box and Set Button Location?<br />0= off<br />1= Top<br />2= Bottom<br />3= Both',8,25,NULL,'2019-02-19 14:19:12',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\'), ',NULL),(228,'Display Product Description','PRODUCT_LIST_DESCRIPTION','150','Do you want to display the Product Description?<br /><br />0= OFF<br />150= Suggested Length, or enter the maximum number of characters to display',8,30,NULL,'2019-02-19 14:19:12',NULL,NULL,NULL),(229,'Product Listing Ascending Sort Order','PRODUCT_LIST_SORT_ORDER_ASCENDING','+','What do you want to use to indicate Sort Order Ascending?<br />Default = +',8,40,NULL,'2019-02-19 14:19:12',NULL,'zen_cfg_textarea_small(',NULL),(230,'Product Listing Descending Sort Order','PRODUCT_LIST_SORT_ORDER_DESCENDING','-','What do you want to use to indicate Sort Order Descending?<br />Default = -',8,41,NULL,'2019-02-19 14:19:12',NULL,'zen_cfg_textarea_small(',NULL),(231,'Include Product Listing Alpha Sorter Dropdown','PRODUCT_LIST_ALPHA_SORTER','false','Do you want to include an Alpha Filter dropdown on the Product Listing?',8,50,NULL,'2019-02-19 14:19:12',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), ',NULL),(232,'Include Product Listing Sub Categories Image','PRODUCT_LIST_CATEGORIES_IMAGE_STATUS','true','Do you want to include the Sub Categories Image on the Product Listing?',8,52,NULL,'2019-02-19 14:19:12',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), ',NULL),(233,'Include Product Listing Top Categories Image','PRODUCT_LIST_CATEGORIES_IMAGE_STATUS_TOP','true','Do you want to include the Top Categories Image on the Product Listing?',8,53,NULL,'2019-02-19 14:19:12',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), ',NULL),(234,'Show SubCategories on Main Page while navigating','PRODUCT_LIST_CATEGORY_ROW_STATUS','1','Show Sub-Categories on Main Page while navigating through Categories<br /><br />0= off<br />1= on',8,60,NULL,'2019-02-19 14:19:12',NULL,'zen_cfg_select_option(array(\'0\', \'1\'), ',NULL),(235,'Check stock level','STOCK_CHECK','true','Check to see if sufficent stock is available',9,1,NULL,'2019-02-19 14:19:12',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), ',NULL),(236,'Subtract stock','STOCK_LIMITED','true','Subtract product in stock by product orders',9,2,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), ',NULL),(237,'Allow Checkout','STOCK_ALLOW_CHECKOUT','true','Allow customer to checkout even if there is insufficient stock',9,3,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), ',NULL),(238,'Mark product out of stock','STOCK_MARK_PRODUCT_OUT_OF_STOCK','***','Display something on screen so customer can see which product has insufficient stock',9,4,NULL,'2019-02-19 14:19:13',NULL,NULL,NULL),(239,'Stock Re-order level','STOCK_REORDER_LEVEL','5','Define when stock needs to be re-ordered',9,5,NULL,'2019-02-19 14:19:13',NULL,NULL,NULL),(240,'Products status in Catalog when out of stock should be set to','SHOW_PRODUCTS_SOLD_OUT','0','Show Products when out of stock<br /><br />0= set product status to OFF<br />1= leave product status ON',9,10,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_option(array(\'0\', \'1\'), ',NULL),(241,'Show Sold Out Image in place of Add to Cart','SHOW_PRODUCTS_SOLD_OUT_IMAGE','1','Show Sold Out Image instead of Add to Cart Button<br /><br />0= off<br />1= on',9,11,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_option(array(\'0\', \'1\'), ',NULL),(242,'Product Quantity Decimals','QUANTITY_DECIMALS','0','Allow how many decimals on Quantity<br /><br />0= off',9,15,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\'), ',NULL),(243,'Show Shopping Cart - Delete Checkboxes or Delete Button','SHOW_SHOPPING_CART_DELETE','3','Show on Shopping Cart Delete Button and/or Checkboxes<br /><br />1= Delete Button Only<br />2= Checkbox Only<br />3= Both Delete Button and Checkbox',9,20,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_option(array(\'1\', \'2\', \'3\'), ',NULL),(244,'Show Shopping Cart - Update Cart Button Location','SHOW_SHOPPING_CART_UPDATE','3','Show on Shopping Cart Update Cart Button Location as:<br /><br />1= Next to each Qty Box<br />2= Below all Products<br />3= Both Next to each Qty Box and Below all Products',9,22,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_option(array(\'1\', \'2\', \'3\'), ',NULL),(245,'Show New Products on empty Shopping Cart Page','SHOW_SHOPPING_CART_EMPTY_NEW_PRODUCTS','1','Show New Products on empty Shopping Cart Page<br />0= off or set the sort order',9,30,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\', \'4\'), ',NULL),(246,'Show Featured Products on empty Shopping Cart Page','SHOW_SHOPPING_CART_EMPTY_FEATURED_PRODUCTS','2','Show Featured Products on empty Shopping Cart Page<br />0= off or set the sort order',9,31,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\', \'4\'), ',NULL),(247,'Show Special Products on empty Shopping Cart Page','SHOW_SHOPPING_CART_EMPTY_SPECIALS_PRODUCTS','3','Show Special Products on empty Shopping Cart Page<br />0= off or set the sort order',9,32,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\', \'4\'), ',NULL),(248,'Show Upcoming Products on empty Shopping Cart Page','SHOW_SHOPPING_CART_EMPTY_UPCOMING','4','Show Upcoming Products on empty Shopping Cart Page<br />0= off or set the sort order',9,33,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\', \'4\'), ',NULL),(249,'Show Notice of Combining Shopping Cart on Login','SHOW_SHOPPING_CART_COMBINED','1','When a customer logs in and has a previously stored shopping cart, the products are combined with the existing shopping cart.<br /><br />Do you wish to display a Notice to the customer?<br /><br />0= OFF, do not display a notice<br />1= Yes show notice and go to shopping cart<br />2= Yes show notice, but do not go to shopping cart',9,35,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\'), ',NULL),(250,'Log Page Parse Time','STORE_PAGE_PARSE_TIME','false','Record (to a log file) the time it takes to parse a page',10,1,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), ',NULL),(251,'Log Destination','STORE_PAGE_PARSE_TIME_LOG','/var/www/html/zen-cart/logs/page_parse_time.log','Directory and filename of the page parse time log',10,2,NULL,'2019-02-19 14:19:13',NULL,NULL,NULL),(252,'Log Date Format','STORE_PARSE_DATE_TIME_FORMAT','%d/%m/%Y %H:%M:%S','The date format',10,3,NULL,'2019-02-19 14:19:13',NULL,NULL,NULL),(253,'Display The Page Parse Time','DISPLAY_PAGE_PARSE_TIME','false','Display the page parse time on the bottom of each page<br />(Note: This DISPLAYS them. You do NOT need to LOG them to merely display them on your site.)',10,4,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), ',NULL),(254,'Log Database Queries','STORE_DB_TRANSACTIONS','false','Record the database queries to files in the system /logs/ folder. USE WITH CAUTION. This can seriously degrade your site performance and blow out your disk space storage quotas.<br><strong>Enabling this makes your site NON-COMPLIANT with PCI DSS rules, thus invalidating any certification.</strong>',10,5,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), ',NULL),(255,'E-Mail Transport Method','EMAIL_TRANSPORT','PHP','Defines the method for sending mail.<br /><strong>PHP</strong> is the default, and uses built-in PHP wrappers for processing.<br />Servers running on Windows and MacOS should change this setting to <strong>SMTP</strong>.<br /><br /><strong>SMTPAUTH</strong> should only be used if your server requires SMTP authorization to send messages. You must also configure your SMTPAUTH settings in the appropriate fields in this admin section.<br /><br /><strong>sendmail</strong> is for linux/unix hosts using the sendmail program on the server<br /><strong>\"sendmail-f\"</strong> is only for servers which require the use of the -f parameter to send mail. This is a security setting often used to prevent spoofing. Will cause errors if your host mailserver is not configured to use it.<br /><br /><strong>Qmail</strong> is used for linux/unix hosts running Qmail as sendmail wrapper at /var/qmail/bin/sendmail.',12,1,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_option(array(\'PHP\', \'sendmail\', \'sendmail-f\', \'smtp\', \'smtpauth\', \'Qmail\'),',NULL),(256,'SMTP Email Account Mailbox','EMAIL_SMTPAUTH_MAILBOX','YourEmailAccountNameHere','Enter the mailbox account name (me@mydomain.com) supplied by your host. This is the account name that your host requires for SMTP authentication.<br />Only required if using SMTP Authentication for email.',12,101,NULL,'2019-02-19 14:19:13',NULL,NULL,NULL),(257,'SMTP Email Account Password','EMAIL_SMTPAUTH_PASSWORD','YourPasswordHere','Enter the password for your SMTP mailbox. <br />Only required if using SMTP Authentication for email.',12,101,NULL,'2019-02-19 14:19:13','zen_cfg_password_display',NULL,NULL),(258,'SMTP Email Mail Host','EMAIL_SMTPAUTH_MAIL_SERVER','mail.EnterYourDomain.com','Enter the DNS name of your SMTP mail server.<br />ie: mail.mydomain.com<br />or 55.66.77.88<br />Only required if using SMTP Authentication for email.',12,101,NULL,'2019-02-19 14:19:13',NULL,NULL,NULL),(259,'SMTP Email Mail Server Port','EMAIL_SMTPAUTH_MAIL_SERVER_PORT','25','Enter the IP port number that your SMTP mailserver operates on.<br />Only required if using SMTP Authentication for email.<br><br>Default: 25<br>Typical values are:<br>25 - normal unencrypted SMTP<br>587 - encrypted SMTP<br>465 - older MS SMTP port',12,101,NULL,'2019-02-19 14:19:13',NULL,NULL,NULL),(260,'Send E-Mails','SEND_EMAILS','true','Send out e-mails?<br>Normally this is set to true.<br>Set to false to suppress ALL outgoing email messages from this store, such as when working with a test copy of your store offline.',12,1,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), ',NULL),(261,'E-Mail Linefeeds','EMAIL_LINEFEED','LF','Defines the character sequence used to separate mail headers.',12,2,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_option(array(\'LF\', \'CRLF\'),',NULL),(262,'Enable HTML Emails?','EMAIL_USE_HTML','false','Send emails in HTML format if recipient has enabled it in their preferences.',12,3,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_option(array(\'true\', \'false\'),',NULL),(263,'Verify E-Mail Addresses Through DNS','ENTRY_EMAIL_ADDRESS_CHECK','false','Verify e-mail address through a DNS server',6,6,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), ',NULL),(264,'Email Archiving Active?','EMAIL_ARCHIVE','false','If you wish to have email messages archived/stored when sent, set this to \"true\".',12,6,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_option(array(\'true\', \'false\'),',NULL),(265,'E-Mail Friendly-Errors','EMAIL_FRIENDLY_ERRORS','true','Do you want to display friendly errors if emails fail?  Setting this to false will display PHP errors and likely cause the script to fail. Only set to false while troubleshooting, and true for a live shop.',12,7,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_option(array(\'true\', \'false\'),',NULL),(266,'Email Address (Displayed to Contact you)','STORE_OWNER_EMAIL_ADDRESS','yukyeongsang@gmail.com','Email address of Store Owner.  Used as \"display only\" when informing customers of how to contact you.',12,10,NULL,'2019-02-19 14:19:13',NULL,NULL,NULL),(267,'Email Address (sent FROM)','EMAIL_FROM','yukyeongsang@gmail.com','Address from which email messages will be \"sent\" by default. Can be over-ridden at compose-time in admin modules.',12,11,NULL,'2019-02-19 14:19:13',NULL,NULL,NULL),(268,'Emails must send from known domain?','EMAIL_SEND_MUST_BE_STORE','Yes','Does your mailserver require that all outgoing emails have their \"from\" address match a known domain that exists on your webserver?<br /><br />This is often required in order to prevent spoofing and spam broadcasts.  If set to Yes, this will cause the email address (sent FROM) to be used as the \"from\" address on all outgoing mail.',12,11,NULL,'0001-01-01 00:00:00',NULL,'zen_cfg_select_option(array(\'No\', \'Yes\'), ',NULL),(269,'Email Admin Format?','ADMIN_EXTRA_EMAIL_FORMAT','TEXT','Please select the Admin extra email format (Note: Enable HTML Emails must be on for HTML option to work)',12,12,NULL,'0001-01-01 00:00:00',NULL,'zen_cfg_select_option(array(\'TEXT\', \'HTML\'), ',NULL),(270,'Send Copy of Order Confirmation Emails To','SEND_EXTRA_ORDER_EMAILS_TO','yukyeongsang@gmail.com','Send COPIES of order confirmation emails to the following email addresses, in this format: Name 1 &lt;email@address1&gt;, Name 2 &lt;email@address2&gt;',12,12,NULL,'2019-02-19 14:19:13',NULL,NULL,NULL),(271,'Send Copy of Create Account Emails To - Status','SEND_EXTRA_CREATE_ACCOUNT_EMAILS_TO_STATUS','0','Send copy of Create Account Status<br />0= off 1= on',12,13,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_option(array(\'0\', \'1\'),',NULL),(272,'Send Copy of Create Account Emails To','SEND_EXTRA_CREATE_ACCOUNT_EMAILS_TO','yukyeongsang@gmail.com','Send copy of Create Account emails to the following email addresses, in this format: Name 1 &lt;email@address1&gt;, Name 2 &lt;email@address2&gt;',12,14,NULL,'2019-02-19 14:19:13',NULL,NULL,NULL),(273,'Send Copy of Customer GV Send Emails To - Status','SEND_EXTRA_GV_CUSTOMER_EMAILS_TO_STATUS','0','Send copy of Customer GV Send Status<br />0= off 1= on',12,17,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_option(array(\'0\', \'1\'),',NULL),(274,'Send Copy of Customer GV Send Emails To','SEND_EXTRA_GV_CUSTOMER_EMAILS_TO','yukyeongsang@gmail.com','Send copy of Customer GV Send emails to the following email addresses, in this format: Name 1 &lt;email@address1&gt;, Name 2 &lt;email@address2&gt;',12,18,NULL,'2019-02-19 14:19:13',NULL,NULL,NULL),(275,'Send Copy of Admin GV Mail Emails To - Status','SEND_EXTRA_GV_ADMIN_EMAILS_TO_STATUS','0','Send copy of Admin GV Mail Status<br />0= off 1= on',12,19,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_option(array(\'0\', \'1\'),',NULL),(276,'Send Copy of Customer Admin GV Mail Emails To','SEND_EXTRA_GV_ADMIN_EMAILS_TO','yukyeongsang@gmail.com','Send copy of Admin GV Mail emails to the following email addresses, in this format: Name 1 &lt;email@address1&gt;, Name 2 &lt;email@address2&gt;',12,20,NULL,'2019-02-19 14:19:13',NULL,NULL,NULL),(277,'Send Copy of Admin Discount Coupon Mail Emails To - Status','SEND_EXTRA_DISCOUNT_COUPON_ADMIN_EMAILS_TO_STATUS','0','Send copy of Admin Discount Coupon Mail Status<br />0= off 1= on',12,21,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_option(array(\'0\', \'1\'),',NULL),(278,'Send Copy of Customer Admin Discount Coupon Mail Emails To','SEND_EXTRA_DISCOUNT_COUPON_ADMIN_EMAILS_TO','yukyeongsang@gmail.com','Send copy of Admin Discount Coupon Mail emails to the following email addresses, in this format: Name 1 &lt;email@address1&gt;, Name 2 &lt;email@address2&gt;',12,22,NULL,'2019-02-19 14:19:13',NULL,NULL,NULL),(279,'Send Copy of Admin Orders Status Emails To - Status','SEND_EXTRA_ORDERS_STATUS_ADMIN_EMAILS_TO_STATUS','0','Send copy of Admin Orders Status Status<br />0= off 1= on',12,23,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_option(array(\'0\', \'1\'),',NULL),(280,'Send Copy of Admin Orders Status Emails To','SEND_EXTRA_ORDERS_STATUS_ADMIN_EMAILS_TO','yukyeongsang@gmail.com','Send copy of Admin Orders Status emails to the following email addresses, in this format: Name 1 &lt;email@address1&gt;, Name 2 &lt;email@address2&gt;',12,24,NULL,'2019-02-19 14:19:13',NULL,NULL,NULL),(281,'Send Notice of Pending Reviews Emails To - Status','SEND_EXTRA_REVIEW_NOTIFICATION_EMAILS_TO_STATUS','0','Send copy of Pending Reviews Status<br />0= off 1= on',12,25,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_option(array(\'0\', \'1\'),',NULL),(282,'Send Notice of Pending Reviews Emails To','SEND_EXTRA_REVIEW_NOTIFICATION_EMAILS_TO','yukyeongsang@gmail.com','Send copy of Pending Reviews emails to the following email addresses, in this format: Name 1 &lt;email@address1&gt;, Name 2 &lt;email@address2&gt;',12,26,NULL,'2019-02-19 14:19:13',NULL,NULL,NULL),(283,'Set \"Contact Us\" Email Dropdown List','CONTACT_US_LIST','','On the \"Contact Us\" Page, set the list of email addresses , in this format: Name 1 &lt;email@address1&gt;, Name 2 &lt;email@address2&gt;',12,40,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_textarea(',NULL),(284,'Contact Us - Show Store Name and Address','CONTACT_US_STORE_NAME_ADDRESS','1','Include Store Name and Address<br />0= off 1= on',12,50,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_option(array(\'0\', \'1\'), ',NULL),(285,'Send Low Stock Emails','SEND_LOWSTOCK_EMAIL','0','When stock level is at or below low stock level send an email<br />0= off<br />1= on',12,60,'2019-02-19 14:19:13','2019-02-19 14:19:13',NULL,'zen_cfg_select_option(array(\'0\', \'1\'),',NULL),(286,'Send Low Stock Emails To','SEND_EXTRA_LOW_STOCK_EMAILS_TO','yukyeongsang@gmail.com','When stock level is at or below low stock level send an email to this address, in this format: Name 1 &lt;email@address1&gt;, Name 2 &lt;email@address2&gt;',12,61,NULL,'2019-02-19 14:19:13',NULL,NULL,NULL),(287,'Display \"Newsletter Unsubscribe\" Link?','SHOW_NEWSLETTER_UNSUBSCRIBE_LINK','true','Show \"Newsletter Unsubscribe\" link in the \"Information\" side-box?',12,70,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_option(array(\'true\', \'false\'),',NULL),(288,'Audience-Select Count Display','AUDIENCE_SELECT_DISPLAY_COUNTS','true','When displaying lists of available audiences/recipients, should the recipients-count be included? <br /><em>(This may make things slower if you have a lot of customers or complex audience queries)</em>',12,90,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_option(array(\'true\', \'false\'),',NULL),(289,'Enable Downloads','DOWNLOAD_ENABLED','true','Enable the products download functions.',13,1,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), ',NULL),(290,'Download by Redirect','DOWNLOAD_BY_REDIRECT','true','Use browser redirection for download. Disable on non-Unix systems.<br /><br />Note: Set /pub to 777 when redirect is true',13,2,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), ',NULL),(291,'Download by streaming','DOWNLOAD_IN_CHUNKS','false','If download-by-redirect is disabled, and your PHP memory_limit setting is under 8 MB, you might need to enable this setting so that files are streamed in smaller segments to the browser.<br /><br />Has no effect if Download By Redirect is enabled.',13,2,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), ',NULL),(292,'Download Expiration (Number of Days)','DOWNLOAD_MAX_DAYS','7','Set number of days before the download link expires. 0 means no limit.',13,3,NULL,'2019-02-19 14:19:13',NULL,'',NULL),(293,'Number of Downloads Allowed - Per Product','DOWNLOAD_MAX_COUNT','5','Set the maximum number of downloads. 0 means no download authorized.',13,4,NULL,'2019-02-19 14:19:13',NULL,'',NULL),(294,'Downloads Controller Update Status Value','DOWNLOADS_ORDERS_STATUS_UPDATED_VALUE','4','What orders_status resets the Download days and Max Downloads - Default is 4',13,10,'2019-02-19 14:19:13','2019-02-19 14:19:13',NULL,NULL,NULL),(295,'Downloads Controller Order Status Value >= lower value','DOWNLOADS_CONTROLLER_ORDERS_STATUS','2','Downloads Controller Order Status Value - Default >= 2<br /><br />Downloads are available for checkout based on the orders status. Orders with orders status greater than this value will be available for download. The orders status is set for an order by the Payment Modules. Set the lower range for this range.',13,12,'2019-02-19 14:19:13','2019-02-19 14:19:13',NULL,NULL,NULL),(296,'Downloads Controller Order Status Value <= upper value','DOWNLOADS_CONTROLLER_ORDERS_STATUS_END','4','Downloads Controller Order Status Value - Default <= 4<br /><br />Downloads are available for checkout based on the orders status. Orders with orders status less than this value will be available for download. The orders status is set for an order by the Payment Modules.  Set the upper range for this range.',13,13,'2019-02-19 14:19:13','2019-02-19 14:19:13',NULL,NULL,NULL),(297,'Enable Price Factor','ATTRIBUTES_ENABLED_PRICE_FACTOR','true','Enable the Attributes Price Factor.',13,25,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), ',NULL),(298,'Enable Qty Price Discount','ATTRIBUTES_ENABLED_QTY_PRICES','true','Enable the Attributes Quantity Price Discounts.',13,26,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), ',NULL),(299,'Enable Attribute Images','ATTRIBUTES_ENABLED_IMAGES','true','Enable the Attributes Images.',13,28,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), ',NULL),(300,'Enable Text Pricing by word or letter','ATTRIBUTES_ENABLED_TEXT_PRICES','true','Enable the Attributes Text Pricing by word or letter.',13,35,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), ',NULL),(301,'Text Pricing - Spaces are Free','TEXT_SPACES_FREE','1','On Text pricing Spaces are Free<br /><br />0= off 1= on',13,36,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_option(array(\'0\', \'1\'), ',NULL),(302,'Read Only option type - Ignore for Add to Cart','PRODUCTS_OPTIONS_TYPE_READONLY_IGNORED','1','When a Product only uses READONLY attributes, should the Add to Cart button be On or Off?<br />0= OFF<br />1= ON',13,37,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_option(array(\'0\', \'1\'), ',NULL),(303,'Enable GZip Compression','GZIP_LEVEL','0','0= off 1= on',14,1,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_option(array(\'0\', \'1\'),',NULL),(304,'Session Directory','SESSION_WRITE_DIRECTORY','/tmp','This should point to the folder specified in your DIR_FS_SQL_CACHE setting in your configure.php files.',15,1,NULL,'2019-02-19 14:19:13',NULL,NULL,NULL),(305,'Cookie Domain','SESSION_USE_FQDN','True','If True the full domain name will be used to store the cookie, e.g. www.mydomain.com. If False only a partial domain name will be used, e.g. mydomain.com. If you are unsure about this, always leave set to true.',15,2,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_option(array(\'True\', \'False\'), ',NULL),(306,'Force Cookie Use','SESSION_FORCE_COOKIE_USE','False','Force the use of sessions when cookies are only enabled.',15,2,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_option(array(\'True\', \'False\'), ',NULL),(307,'Check SSL Session ID','SESSION_CHECK_SSL_SESSION_ID','False','Validate the SSL_SESSION_ID on every secure HTTPS page request.',15,3,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_option(array(\'True\', \'False\'), ',NULL),(308,'Check User Agent','SESSION_CHECK_USER_AGENT','False','Validate the clients browser user agent on every page request.',15,4,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_option(array(\'True\', \'False\'), ',NULL),(309,'Check IP Address','SESSION_CHECK_IP_ADDRESS','False','Validate the clients IP address on every page request.',15,5,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_option(array(\'True\', \'False\'), ',NULL),(310,'Prevent Spider Sessions','SESSION_BLOCK_SPIDERS','True','Prevent known spiders from starting a session.',15,6,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_option(array(\'True\', \'False\'), ',NULL),(311,'Recreate Session','SESSION_RECREATE','True','Recreate the session to generate a new session ID when the customer logs on or creates an account (PHP >=4.1 needed).',15,7,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_option(array(\'True\', \'False\'), ',NULL),(312,'IP to Host Conversion Status','SESSION_IP_TO_HOST_ADDRESS','true','Convert IP Address to Host Address<br /><br />Note: on some servers this can slow down the initial start of a session or execution of Emails',15,10,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), ',NULL),(313,'Length of the redeem code','SECURITY_CODE_LENGTH','10','Enter the length of the redeem code<br />The longer the more secure',16,1,NULL,'2019-02-19 14:19:13',NULL,NULL,NULL),(314,'Default Order Status For Zero Balance Orders','DEFAULT_ZERO_BALANCE_ORDERS_STATUS_ID','2','When an order\'s balance is zero, this order status will be assigned to it.',16,0,NULL,'2019-02-19 14:19:13','zen_get_order_status_name','zen_cfg_pull_down_order_statuses(',NULL),(315,'New Signup Discount Coupon ID#','NEW_SIGNUP_DISCOUNT_COUPON','','Select the coupon<br />',16,75,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_coupon_id(',NULL),(316,'New Signup Gift Voucher Amount','NEW_SIGNUP_GIFT_VOUCHER_AMOUNT','','Leave blank for none<br />Or enter an amount ie. 10 for $10.00',16,76,NULL,'2019-02-19 14:19:13',NULL,NULL,NULL),(317,'Maximum Discount Coupons Per Page','MAX_DISPLAY_SEARCH_RESULTS_DISCOUNT_COUPONS','20','Number of Discount Coupons to list per Page',16,81,NULL,'2019-02-19 14:19:13',NULL,NULL,NULL),(318,'Maximum Discount Coupon Report Results Per Page','MAX_DISPLAY_SEARCH_RESULTS_DISCOUNT_COUPONS_REPORTS','20','Number of Discount Coupons to list on Reports Page',16,81,NULL,'2019-02-19 14:19:13',NULL,NULL,NULL),(319,'Credit Card Enable Status - VISA','CC_ENABLED_VISA','1','Accept VISA 0= off 1= on',17,1,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_option(array(\'0\', \'1\'), ',NULL),(320,'Credit Card Enable Status - MasterCard','CC_ENABLED_MC','1','Accept MasterCard 0= off 1= on',17,2,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_option(array(\'0\', \'1\'), ',NULL),(321,'Credit Card Enable Status - AmericanExpress','CC_ENABLED_AMEX','0','Accept AmericanExpress 0= off 1= on',17,3,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_option(array(\'0\', \'1\'), ',NULL),(322,'Credit Card Enable Status - Diners Club','CC_ENABLED_DINERS_CLUB','0','Accept Diners Club 0= off 1= on',17,4,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_option(array(\'0\', \'1\'), ',NULL),(323,'Credit Card Enable Status - Discover Card','CC_ENABLED_DISCOVER','0','Accept Discover Card 0= off 1= on',17,5,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_option(array(\'0\', \'1\'), ',NULL),(324,'Credit Card Enable Status - JCB','CC_ENABLED_JCB','0','Accept JCB 0= off 1= on',17,6,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_option(array(\'0\', \'1\'), ',NULL),(325,'Credit Card Enable Status - AUSTRALIAN BANKCARD','CC_ENABLED_AUSTRALIAN_BANKCARD','0','Accept AUSTRALIAN BANKCARD 0= off 1= on',17,7,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_option(array(\'0\', \'1\'), ',NULL),(326,'Credit Card Enable Status - SOLO','CC_ENABLED_SOLO','0','Accept SOLO Card 0= off 1= on',17,8,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_option(array(\'0\', \'1\'), ',NULL),(327,'Credit Card Enable Status - Debit','CC_ENABLED_DEBIT','0','Accept Debit Cards 0= off 1= on<br>NOTE: This is not deeply integrated at this time, and this setting may be redundant if your payment modules do not yet specifically have code to honour this switch.',17,9,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_option(array(\'0\', \'1\'), ',NULL),(328,'Credit Card Enable Status - Maestro','CC_ENABLED_MAESTRO','0','Accept MAESTRO Card 0= off 1= on',17,10,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_option(array(\'0\', \'1\'), ',NULL),(329,'Credit Card Enabled - Show on Payment','SHOW_ACCEPTED_CREDIT_CARDS','0','Show accepted credit cards on Payment page?<br />0= off<br />1= As Text<br />2= As Images<br /><br />Note: images and text must be defined in both the database and language file for specific credit card types.',17,50,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\'), ',NULL),(330,'This module is installed','MODULE_ORDER_TOTAL_GV_STATUS','true','',6,1,NULL,'2003-10-30 22:16:40',NULL,'zen_cfg_select_option(array(\'true\'),',NULL),(331,'Sort Order','MODULE_ORDER_TOTAL_GV_SORT_ORDER','840','Sort order of display.',6,2,NULL,'2003-10-30 22:16:40',NULL,NULL,NULL),(332,'Queue Purchases','MODULE_ORDER_TOTAL_GV_QUEUE','true','Do you want to queue purchases of the Gift Voucher?',6,3,NULL,'2003-10-30 22:16:40',NULL,'zen_cfg_select_option(array(\'true\', \'false\'),',NULL),(333,'Include Shipping','MODULE_ORDER_TOTAL_GV_INC_SHIPPING','true','Include Shipping in calculation',6,5,NULL,'2003-10-30 22:16:40',NULL,'zen_cfg_select_option(array(\'true\', \'false\'),',NULL),(334,'Include Tax','MODULE_ORDER_TOTAL_GV_INC_TAX','true','Include Tax in calculation.',6,6,NULL,'2003-10-30 22:16:40',NULL,'zen_cfg_select_option(array(\'true\', \'false\'),',NULL),(335,'Re-calculate Tax','MODULE_ORDER_TOTAL_GV_CALC_TAX','None','Re-Calculate Tax',6,7,NULL,'2003-10-30 22:16:40',NULL,'zen_cfg_select_option(array(\'None\', \'Standard\', \'Credit Note\'),',NULL),(336,'Tax Class','MODULE_ORDER_TOTAL_GV_TAX_CLASS','0','Use the following tax class when treating Gift Voucher as Credit Note.',6,0,NULL,'2003-10-30 22:16:40','zen_get_tax_class_title','zen_cfg_pull_down_tax_classes(',NULL),(337,'Credit including Tax','MODULE_ORDER_TOTAL_GV_CREDIT_TAX','false','Add tax to purchased Gift Voucher when crediting to Account',6,8,NULL,'2003-10-30 22:16:40',NULL,'zen_cfg_select_option(array(\'true\', \'false\'),',NULL),(338,'Set Order Status','MODULE_ORDER_TOTAL_GV_ORDER_STATUS_ID','0','Set the status of orders made where GV covers full payment',6,0,NULL,'2019-02-19 14:19:13','zen_get_order_status_name','zen_cfg_pull_down_order_statuses(',NULL),(339,'This module is installed','MODULE_ORDER_TOTAL_LOWORDERFEE_STATUS','true','',6,1,NULL,'2003-10-30 22:16:43',NULL,'zen_cfg_select_option(array(\'true\'),',NULL),(340,'Sort Order','MODULE_ORDER_TOTAL_LOWORDERFEE_SORT_ORDER','400','Sort order of display.',6,2,NULL,'2003-10-30 22:16:43',NULL,NULL,NULL),(341,'Allow Low Order Fee','MODULE_ORDER_TOTAL_LOWORDERFEE_LOW_ORDER_FEE','false','Do you want to allow low order fees?',6,3,NULL,'2003-10-30 22:16:43',NULL,'zen_cfg_select_option(array(\'true\', \'false\'),',NULL),(342,'Order Fee For Orders Under','MODULE_ORDER_TOTAL_LOWORDERFEE_ORDER_UNDER','50','Add the low order fee to orders under this amount.',6,4,NULL,'2003-10-30 22:16:43','currencies->format',NULL,NULL),(343,'Order Fee','MODULE_ORDER_TOTAL_LOWORDERFEE_FEE','5','For Percentage Calculation - include a % Example: 10%<br />For a flat amount just enter the amount - Example: 5 for $5.00',6,5,NULL,'2003-10-30 22:16:43','',NULL,NULL),(344,'Attach Low Order Fee On Orders Made','MODULE_ORDER_TOTAL_LOWORDERFEE_DESTINATION','both','Attach low order fee for orders sent to the set destination.',6,6,NULL,'2003-10-30 22:16:43',NULL,'zen_cfg_select_option(array(\'national\', \'international\', \'both\'),',NULL),(345,'Tax Class','MODULE_ORDER_TOTAL_LOWORDERFEE_TAX_CLASS','0','Use the following tax class on the low order fee.',6,7,NULL,'2003-10-30 22:16:43','zen_get_tax_class_title','zen_cfg_pull_down_tax_classes(',NULL),(346,'No Low Order Fee on Virtual Products','MODULE_ORDER_TOTAL_LOWORDERFEE_VIRTUAL','false','Do not charge Low Order Fee when cart is Virtual Products Only',6,8,NULL,'2004-04-20 22:16:43',NULL,'zen_cfg_select_option(array(\'true\', \'false\'),',NULL),(347,'No Low Order Fee on Gift Vouchers','MODULE_ORDER_TOTAL_LOWORDERFEE_GV','false','Do not charge Low Order Fee when cart is Gift Vouchers Only',6,9,NULL,'2004-04-20 22:16:43',NULL,'zen_cfg_select_option(array(\'true\', \'false\'),',NULL),(348,'This module is installed','MODULE_ORDER_TOTAL_SHIPPING_STATUS','true','',6,1,NULL,'2003-10-30 22:16:46',NULL,'zen_cfg_select_option(array(\'true\'),',NULL),(349,'Sort Order','MODULE_ORDER_TOTAL_SHIPPING_SORT_ORDER','200','Sort order of display.',6,2,NULL,'2003-10-30 22:16:46',NULL,NULL,NULL),(350,'Allow Free Shipping','MODULE_ORDER_TOTAL_SHIPPING_FREE_SHIPPING','false','Do you want to allow free shipping?',6,3,NULL,'2003-10-30 22:16:46',NULL,'zen_cfg_select_option(array(\'true\', \'false\'),',NULL),(351,'Free Shipping For Orders Over','MODULE_ORDER_TOTAL_SHIPPING_FREE_SHIPPING_OVER','50','Provide free shipping for orders over the set amount.',6,4,NULL,'2003-10-30 22:16:46','currencies->format',NULL,NULL),(352,'Provide Free Shipping For Orders Made','MODULE_ORDER_TOTAL_SHIPPING_DESTINATION','national','Provide free shipping for orders sent to the set destination.',6,5,NULL,'2003-10-30 22:16:46',NULL,'zen_cfg_select_option(array(\'national\', \'international\', \'both\'),',NULL),(353,'This module is installed','MODULE_ORDER_TOTAL_SUBTOTAL_STATUS','true','',6,1,NULL,'2003-10-30 22:16:49',NULL,'zen_cfg_select_option(array(\'true\'),',NULL),(354,'Sort Order','MODULE_ORDER_TOTAL_SUBTOTAL_SORT_ORDER','100','Sort order of display.',6,2,NULL,'2003-10-30 22:16:49',NULL,NULL,NULL),(355,'This module is installed','MODULE_ORDER_TOTAL_TAX_STATUS','true','',6,1,NULL,'2003-10-30 22:16:52',NULL,'zen_cfg_select_option(array(\'true\'),',NULL),(356,'Sort Order','MODULE_ORDER_TOTAL_TAX_SORT_ORDER','300','Sort order of display.',6,2,NULL,'2003-10-30 22:16:52',NULL,NULL,NULL),(357,'This module is installed','MODULE_ORDER_TOTAL_TOTAL_STATUS','true','',6,1,NULL,'2003-10-30 22:16:55',NULL,'zen_cfg_select_option(array(\'true\'),',NULL),(358,'Sort Order','MODULE_ORDER_TOTAL_TOTAL_SORT_ORDER','999','Sort order of display.',6,2,NULL,'2003-10-30 22:16:55',NULL,NULL,NULL),(359,'Tax Class','MODULE_ORDER_TOTAL_COUPON_TAX_CLASS','0','Use the following tax class when treating Discount Coupon as Credit Note.',6,0,NULL,'2003-10-30 22:16:36','zen_get_tax_class_title','zen_cfg_pull_down_tax_classes(',NULL),(360,'Include Tax','MODULE_ORDER_TOTAL_COUPON_INC_TAX','false','Include Tax in calculation.',6,6,NULL,'2003-10-30 22:16:36',NULL,'zen_cfg_select_option(array(\'true\', \'false\'),',NULL),(361,'Sort Order','MODULE_ORDER_TOTAL_COUPON_SORT_ORDER','280','Sort order of display.',6,2,NULL,'2003-10-30 22:16:36',NULL,NULL,NULL),(362,'Include Shipping','MODULE_ORDER_TOTAL_COUPON_INC_SHIPPING','false','Include Shipping in calculation',6,5,NULL,'2003-10-30 22:16:36',NULL,'zen_cfg_select_option(array(\'true\', \'false\'),',NULL),(363,'This module is installed','MODULE_ORDER_TOTAL_COUPON_STATUS','true','',6,1,NULL,'2003-10-30 22:16:36',NULL,'zen_cfg_select_option(array(\'true\'),',NULL),(364,'Re-calculate Tax','MODULE_ORDER_TOTAL_COUPON_CALC_TAX','Standard','Re-Calculate Tax',6,7,NULL,'2003-10-30 22:16:36',NULL,'zen_cfg_select_option(array(\'None\', \'Standard\', \'Credit Note\'),',NULL),(365,'Admin Demo Status','ADMIN_DEMO','0','Admin Demo should be on?<br />0= off 1= on',6,0,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_option(array(\'0\', \'1\'), ',NULL),(366,'Product option type Select','PRODUCTS_OPTIONS_TYPE_SELECT','0','The number representing the Select type of product option.',6,NULL,'2019-02-19 14:19:13','2019-02-19 14:19:13',NULL,NULL,NULL),(367,'Text product option type','PRODUCTS_OPTIONS_TYPE_TEXT','1','Numeric value of the text product option type',6,NULL,'2019-02-19 14:19:13','2019-02-19 14:19:13',NULL,NULL,NULL),(368,'Radio button product option type','PRODUCTS_OPTIONS_TYPE_RADIO','2','Numeric value of the radio button product option type',6,NULL,'2019-02-19 14:19:13','2019-02-19 14:19:13',NULL,NULL,NULL),(369,'Check box product option type','PRODUCTS_OPTIONS_TYPE_CHECKBOX','3','Numeric value of the check box product option type',6,NULL,'2019-02-19 14:19:13','2019-02-19 14:19:13',NULL,NULL,NULL),(370,'File product option type','PRODUCTS_OPTIONS_TYPE_FILE','4','Numeric value of the file product option type',6,NULL,'2019-02-19 14:19:13','2019-02-19 14:19:13',NULL,NULL,NULL),(371,'ID for text and file products options values','PRODUCTS_OPTIONS_VALUES_TEXT_ID','0','Numeric value of the products_options_values_id used by the text and file attributes.',6,NULL,'2019-02-19 14:19:13','2019-02-19 14:19:13',NULL,NULL,NULL),(372,'Upload prefix','UPLOAD_PREFIX','upload_','Prefix used to differentiate between upload options and other options',6,NULL,'2019-02-19 14:19:13','2019-02-19 14:19:13',NULL,NULL,NULL),(373,'Text prefix','TEXT_PREFIX','txt_','Prefix used to differentiate between text option values and other option values',6,NULL,'2019-02-19 14:19:13','2019-02-19 14:19:13',NULL,NULL,NULL),(374,'Read Only option type','PRODUCTS_OPTIONS_TYPE_READONLY','5','Numeric value of the file product option type',6,NULL,'2019-02-19 14:19:13','2019-02-19 14:19:13',NULL,NULL,NULL),(375,'login mode https','SSLPWSTATUSCHECK','0:0','System setting. Do not edit.',6,99,'2019-02-19 14:19:35','2019-02-19 14:19:13',NULL,NULL,NULL),(376,'Products Info - Products Option Name Sort Order','PRODUCTS_OPTIONS_SORT_ORDER','0','Sort order of Option Names for Products Info<br />0= Sort Order, Option Name<br />1= Option Name',18,35,'2019-02-19 14:19:13','2019-02-19 14:19:13',NULL,'zen_cfg_select_option(array(\'0\', \'1\'),',NULL),(377,'Products Info - Product Option Value of Attributes Sort Order','PRODUCTS_OPTIONS_SORT_BY_PRICE','1','Sort order of Product Option Values of Attributes for Products Info<br />0= Sort Order, Price<br />1= Sort Order, Option Value Name',18,36,'2019-02-19 14:19:13','2019-02-19 14:19:13',NULL,'zen_cfg_select_option(array(\'0\', \'1\'),',NULL),(378,'Product Info - Show Option Values Name Below Attributes Image','PRODUCT_IMAGES_ATTRIBUTES_NAMES','1','Product Info - Show the name of the Option Value beneath the Attribute Image?<br />0= off 1= on',18,41,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_option(array(\'0\', \'1\'), ',NULL),(379,'Product Info - Show Sales Discount Savings Status','SHOW_SALE_DISCOUNT_STATUS','1','Product Info - Show the amount of discount savings?<br />0= off 1= on',18,45,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_option(array(\'0\', \'1\'), ',NULL),(380,'Product Info - Show Sales Discount Savings Dollars or Percentage','SHOW_SALE_DISCOUNT','1','Product Info - Show the amount of discount savings display as:<br />1= % off 2= $amount off',18,46,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_option(array(\'1\', \'2\'), ',NULL),(381,'Product Info - Show Sales Discount Savings Percentage Decimals','SHOW_SALE_DISCOUNT_DECIMALS','0','Product Info - Show discount savings display as a Percentage with how many decimals?:<br />Default= 0',18,47,NULL,'2019-02-19 14:19:13',NULL,NULL,NULL),(382,'Product Info - Price is Free Image or Text Status','OTHER_IMAGE_PRICE_IS_FREE_ON','1','Product Info - Show the Price is Free Image or Text on Displayed Price<br />0= Text<br />1= Image',18,50,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_option(array(\'0\', \'1\'), ',NULL),(383,'Product Info - Price is Call for Price Image or Text Status','PRODUCTS_PRICE_IS_CALL_IMAGE_ON','1','Product Info - Show the Price is Call for Price Image or Text on Displayed Price<br />0= Text<br />1= Image',18,51,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_option(array(\'0\', \'1\'), ',NULL),(384,'Product Quantity Box Status - Adding New Products','PRODUCTS_QTY_BOX_STATUS','1','What should the Default Quantity Box Status be set to when adding New Products?<br /><br />0= off<br />1= on<br />NOTE: This will show a Qty Box when ON and default the Add to Cart to 1',18,55,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_option(array(\'0\', \'1\'), ',NULL),(385,'Product Reviews Require Approval','REVIEWS_APPROVAL','1','Do product reviews require approval?<br /><br />Note: When Review Status is off, it will also not show<br /><br />0= off 1= on',18,62,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_option(array(\'0\', \'1\'), ',NULL),(386,'Meta Tags - Include Product Model in Title','META_TAG_INCLUDE_MODEL','1','Do you want to include the Product Model in the Meta Tag Title?<br /><br />0= off 1= on',18,69,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_option(array(\'0\', \'1\'), ',NULL),(387,'Meta Tags - Include Product Price in Title','META_TAG_INCLUDE_PRICE','1','Do you want to include the Product Price in the Meta Tag Title?<br /><br />0= off 1= on',18,70,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_option(array(\'0\', \'1\'), ',NULL),(388,'Meta Tags Generated Description Maximum Length?','MAX_META_TAG_DESCRIPTION_LENGTH','50','Set Generated Meta Tag Description Maximum Length to (words) Default 50:',18,71,NULL,'2019-02-19 14:19:13','','',NULL),(389,'Also Purchased Products Columns per Row','SHOW_PRODUCT_INFO_COLUMNS_ALSO_PURCHASED_PRODUCTS','3','Also Purchased Products Columns per Row<br />0= off or set the sort order',18,72,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\', \'4\', \'5\', \'6\', \'7\', \'8\', \'9\', \'10\', \'11\', \'12\'), ',NULL),(390,'Previous Next - Navigation Bar Position','PRODUCT_INFO_PREVIOUS_NEXT','1','Location of Previous/Next Navigation Bar<br />0= off<br />1= Top of Page<br />2= Bottom of Page<br />3= Both Top and Bottom of Page',18,21,'2019-02-19 14:19:13','2019-02-19 14:19:13',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'0\', \'text\'=>\'Off\'), array(\'id\'=>\'1\', \'text\'=>\'Top of Page\'), array(\'id\'=>\'2\', \'text\'=>\'Bottom of Page\'), array(\'id\'=>\'3\', \'text\'=>\'Both Top & Bottom of Page\')),',NULL),(391,'Previous Next - Sort Order','PRODUCT_INFO_PREVIOUS_NEXT_SORT','1','Products Display Order by<br />0= Product ID<br />1= Product Name<br />2= Model<br />3= Price, Product Name<br />4= Price, Model<br />5= Product Name, Model<br />6= Product Sort Order',18,22,'2019-02-19 14:19:13','2019-02-19 14:19:13',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'0\', \'text\'=>\'Product ID\'), array(\'id\'=>\'1\', \'text\'=>\'Name\'), array(\'id\'=>\'2\', \'text\'=>\'Product Model\'), array(\'id\'=>\'3\', \'text\'=>\'Product Price - Name\'), array(\'id\'=>\'4\', \'text\'=>\'Product Price - Model\'), array(\'id\'=>\'5\', \'text\'=>\'Product Name - Model\'), array(\'id\'=>\'6\', \'text\'=>\'Product Sort Order\')),',NULL),(392,'Previous Next - Button and Image Status','SHOW_PREVIOUS_NEXT_STATUS','0','Button and Product Image status settings are:<br />0= Off<br />1= On',18,20,'2019-02-19 14:19:13','2019-02-19 14:19:13',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'0\', \'text\'=>\'Off\'), array(\'id\'=>\'1\', \'text\'=>\'On\')),',NULL),(393,'Previous Next - Button and Image Settings','SHOW_PREVIOUS_NEXT_IMAGES','0','Show Previous/Next Button and Product Image Settings<br />0= Button Only<br />1= Button and Product Image<br />2= Product Image Only',18,21,'2019-02-19 14:19:13','2019-02-19 14:19:13',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'0\', \'text\'=>\'Button Only\'), array(\'id\'=>\'1\', \'text\'=>\'Button and Product Image\'), array(\'id\'=>\'2\', \'text\'=>\'Product Image Only\')),',NULL),(394,'Previous Next - Image Width?','PREVIOUS_NEXT_IMAGE_WIDTH','50','Previous/Next Image Width?',18,22,NULL,'2019-02-19 14:19:13','','',NULL),(395,'Previous Next - Image Height?','PREVIOUS_NEXT_IMAGE_HEIGHT','40','Previous/Next Image Height?',18,23,NULL,'2019-02-19 14:19:13','','',NULL),(396,'Previous Next - Navigation Includes Category Position','PRODUCT_INFO_CATEGORIES','1','Product\'s Category Image and Name Alignment Above Previous/Next Navigation Bar<br />0= off<br />1= Align Left<br />2= Align Center<br />3= Align Right',18,20,'2019-02-19 14:19:13','2019-02-19 14:19:13',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'0\', \'text\'=>\'Off\'), array(\'id\'=>\'1\', \'text\'=>\'Align Left\'), array(\'id\'=>\'2\', \'text\'=>\'Align Center\'), array(\'id\'=>\'3\', \'text\'=>\'Align Right\')),',NULL),(397,'Previous Next - Navigation Includes Category Name and Image Status','PRODUCT_INFO_CATEGORIES_IMAGE_STATUS','2','Product\'s Category Image and Name Status<br />0= Category Name and Image always shows<br />1= Category Name only<br />2= Category Name and Image when not blank',18,20,'2019-02-19 14:19:13','2019-02-19 14:19:13',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'0\', \'text\'=>\'Category Name and Image Always\'), array(\'id\'=>\'1\', \'text\'=>\'Category Name only\'), array(\'id\'=>\'2\', \'text\'=>\'Category Name and Image when not blank\')),',NULL),(398,'Column Width - Left Boxes','BOX_WIDTH_LEFT','150px','Width of the Left Column Boxes<br />px may be included<br />Default = 150px',19,1,NULL,'2003-11-21 22:16:36',NULL,NULL,NULL),(399,'Column Width - Right Boxes','BOX_WIDTH_RIGHT','150px','Width of the Right Column Boxes<br />px may be included<br />Default = 150px',19,2,NULL,'2003-11-21 22:16:36',NULL,NULL,NULL),(400,'Bread Crumbs Navigation Separator','BREAD_CRUMBS_SEPARATOR','&nbsp;<span class=\"separator\">//</span>&nbsp;','Enter the separator symbol to appear between the Navigation Bread Crumb trail<br />Note: Include spaces with the &amp;nbsp; symbol if you want them part of the separator.<br />Default = &amp;nbsp;::&amp;nbsp;',19,3,NULL,'2003-11-21 22:16:36',NULL,'zen_cfg_textarea_small(',NULL),(401,'Define Breadcrumb Status','DEFINE_BREADCRUMB_STATUS','2','Enable the Breadcrumb Trail Links?<br />0= OFF<br />1= ON<br />2= Off for Home Page Only',19,4,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\'), ',NULL),(402,'Bestsellers - Number Padding','BEST_SELLERS_FILLER','&nbsp;','What do you want to Pad the numbers with?<br />Default = &amp;nbsp;',19,5,NULL,'2003-11-21 22:16:36',NULL,'zen_cfg_textarea_small(',NULL),(403,'Bestsellers - Truncate Product Names','BEST_SELLERS_TRUNCATE','35','What size do you want to truncate the Product Names?<br />Default = 35',19,6,NULL,'2003-11-21 22:16:36',NULL,NULL,NULL),(404,'Bestsellers - Truncate Product Names followed by ...','BEST_SELLERS_TRUNCATE_MORE','true','When truncated Product Names follow with ...<br />Default = true',19,7,'2003-03-21 13:08:25','2003-03-21 11:42:47',NULL,'zen_cfg_select_option(array(\'true\', \'false\'),',NULL),(405,'Categories Box - Show Specials Link','SHOW_CATEGORIES_BOX_SPECIALS','true','Show Specials Link in the Categories Box',19,8,'2003-03-21 13:08:25','2003-03-21 11:42:47',NULL,'zen_cfg_select_option(array(\'true\', \'false\'),',NULL),(406,'Categories Box - Show Products New Link','SHOW_CATEGORIES_BOX_PRODUCTS_NEW','true','Show Products New Link in the Categories Box',19,9,'2003-03-21 13:08:25','2003-03-21 11:42:47',NULL,'zen_cfg_select_option(array(\'true\', \'false\'),',NULL),(407,'Shopping Cart Box Status','SHOW_SHOPPING_CART_BOX_STATUS','1','Shopping Cart Shows<br />0= Always<br />1= Only when full<br />2= Only when full but not when viewing the Shopping Cart',19,10,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\'), ',NULL),(408,'Categories Box - Show Featured Products Link','SHOW_CATEGORIES_BOX_FEATURED_PRODUCTS','true','Show Featured Products Link in the Categories Box',19,11,'2003-03-21 13:08:25','2003-03-21 11:42:47',NULL,'zen_cfg_select_option(array(\'true\', \'false\'),',NULL),(409,'Categories Box - Show Products All Link','SHOW_CATEGORIES_BOX_PRODUCTS_ALL','true','Show Products All Link in the Categories Box',19,12,'2003-03-21 13:08:25','2003-03-21 11:42:47',NULL,'zen_cfg_select_option(array(\'true\', \'false\'),',NULL),(410,'Column Left Status - Global','COLUMN_LEFT_STATUS','1','Show Column Left, unless page override exists?<br />0= Column Left is always off<br />1= Column Left is on, unless page override',19,15,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_option(array(\'0\', \'1\'), ',NULL),(411,'Column Right Status - Global','COLUMN_RIGHT_STATUS','1','Show Column Right, unless page override exists?<br />0= Column Right is always off<br />1= Column Right is on, unless page override',19,16,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_option(array(\'0\', \'1\'), ',NULL),(412,'Column Width - Left','COLUMN_WIDTH_LEFT','150px','Width of the Left Column<br />px may be included<br />Default = 150px',19,20,NULL,'2003-11-21 22:16:36',NULL,NULL,NULL),(413,'Column Width - Right','COLUMN_WIDTH_RIGHT','150px','Width of the Right Column<br />px may be included<br />Default = 150px',19,21,NULL,'2003-11-21 22:16:36',NULL,NULL,NULL),(414,'Categories Separator between links Status','SHOW_CATEGORIES_SEPARATOR_LINK','1','Show Category Separator between Category Names and Links?<br />0= off<br />1= on',19,24,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_option(array(\'0\', \'1\'), ',NULL),(415,'Categories Separator between the Category Name and Count','CATEGORIES_SEPARATOR','-&gt;','What separator do you want between the Category name and the count?<br />Default = -&amp;gt;',19,25,NULL,'2003-11-21 22:16:36',NULL,'zen_cfg_textarea_small(',NULL),(416,'Categories Separator between the Category Name and Sub Categories','CATEGORIES_SEPARATOR_SUBS','|_&nbsp;','What separator do you want between the Category name and Sub Category Name?<br />Default = |_&amp;nbsp;',19,26,NULL,'2004-03-25 22:16:36',NULL,'zen_cfg_textarea_small(',NULL),(417,'Categories Count Prefix','CATEGORIES_COUNT_PREFIX','&nbsp;(','What do you want to Prefix the count with?<br />Default= (',19,27,NULL,'2003-01-21 22:16:36',NULL,'zen_cfg_textarea_small(',NULL),(418,'Categories Count Suffix','CATEGORIES_COUNT_SUFFIX',')','What do you want as a Suffix to the count?<br />Default= )',19,28,NULL,'2003-01-21 22:16:36',NULL,'zen_cfg_textarea_small(',NULL),(419,'Categories SubCategories Indent','CATEGORIES_SUBCATEGORIES_INDENT','&nbsp;&nbsp;','What do you want to use as the subcategories indent?<br />Default= &nbsp;&nbsp;',19,29,NULL,'2004-06-24 22:16:36',NULL,'zen_cfg_textarea_small(',NULL),(420,'Categories with 0 Products Status','CATEGORIES_COUNT_ZERO','0','Show Category Count for 0 Products?<br />0= off<br />1= on',19,30,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_option(array(\'0\', \'1\'), ',NULL),(421,'Split Categories Box','CATEGORIES_SPLIT_DISPLAY','True','Split the categories box display by product type',19,31,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_option(array(\'True\', \'False\'), ',NULL),(422,'Shopping Cart - Show Totals','SHOW_TOTALS_IN_CART','1','Show Totals Above Shopping Cart?<br />0= off<br />1= on: Items Weight Amount<br />2= on: Items Weight Amount, but no weight when 0<br />3= on: Items Amount',19,31,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\'), ',NULL),(423,'Customer Greeting - Show on Index Page','SHOW_CUSTOMER_GREETING','1','Always Show Customer Greeting on Index?<br />0= off<br />1= on',19,40,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_option(array(\'0\', \'1\'), ',NULL),(424,'Categories - Always Show on Main Page','SHOW_CATEGORIES_ALWAYS','0','Always Show Categories on Main Page<br />0= off<br />1= on<br />Default category can be set to Top Level or a Specific Top Level',19,45,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_option(array(\'0\', \'1\'), ',NULL),(425,'Main Page - Opens with Category','CATEGORIES_START_MAIN','0','0= Top Level Categories<br />Or enter the Category ID#<br />Note: Sub Categories can also be used Example: 3_10',19,46,NULL,'2019-02-19 14:19:13','','',NULL),(426,'Categories - Always Open to Show SubCategories','SHOW_CATEGORIES_SUBCATEGORIES_ALWAYS','1','Always Show Categories and SubCategories<br />0= off, just show Top Categories<br />1= on, Always show Categories and SubCategories when selected',19,47,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_option(array(\'0\', \'1\'), ',NULL),(427,'Banner Display Groups - Header Position 1','SHOW_BANNERS_GROUP_SET1','','The Banner Display Groups can be from 1 Banner Group or Multiple Banner Groups<br /><br />For Multiple Banner Groups enter the Banner Group Name separated by a colon <strong>:</strong><br /><br />Example: Wide-Banners:SideBox-Banners<br /><br />What Banner Group(s) do you want to use in the Header Position 1?<br />Leave blank for none',19,55,NULL,'2019-02-19 14:19:13','','',NULL),(428,'Banner Display Groups - Header Position 2','SHOW_BANNERS_GROUP_SET2','','The Banner Display Groups can be from 1 Banner Group or Multiple Banner Groups<br /><br />For Multiple Banner Groups enter the Banner Group Name separated by a colon <strong>:</strong><br /><br />Example: Wide-Banners:SideBox-Banners<br /><br />What Banner Group(s) do you want to use in the Header Position 2?<br />Leave blank for none',19,56,NULL,'2019-02-19 14:19:13','','',NULL),(429,'Banner Display Groups - Header Position 3','SHOW_BANNERS_GROUP_SET3','','The Banner Display Groups can be from 1 Banner Group or Multiple Banner Groups<br /><br />For Multiple Banner Groups enter the Banner Group Name separated by a colon <strong>:</strong><br /><br />Example: Wide-Banners:SideBox-Banners<br /><br />What Banner Group(s) do you want to use in the Header Position 3?<br />Leave blank for none',19,57,NULL,'2019-02-19 14:19:13','','',NULL),(430,'Banner Display Groups - Footer Position 1','SHOW_BANNERS_GROUP_SET4','','The Banner Display Groups can be from 1 Banner Group or Multiple Banner Groups<br /><br />For Multiple Banner Groups enter the Banner Group Name separated by a colon <strong>:</strong><br /><br />Example: Wide-Banners:SideBox-Banners<br /><br />What Banner Group(s) do you want to use in the Footer Position 1?<br />Leave blank for none',19,65,NULL,'2019-02-19 14:19:13','','',NULL),(431,'Banner Display Groups - Footer Position 2','SHOW_BANNERS_GROUP_SET5','','The Banner Display Groups can be from 1 Banner Group or Multiple Banner Groups<br /><br />For Multiple Banner Groups enter the Banner Group Name separated by a colon <strong>:</strong><br /><br />Example: Wide-Banners:SideBox-Banners<br /><br />What Banner Group(s) do you want to use in the Footer Position 2?<br />Leave blank for none',19,66,NULL,'2019-02-19 14:19:13','','',NULL),(432,'Banner Display Groups - Footer Position 3','SHOW_BANNERS_GROUP_SET6','Wide-Banners','The Banner Display Groups can be from 1 Banner Group or Multiple Banner Groups<br /><br />For Multiple Banner Groups enter the Banner Group Name separated by a colon <strong>:</strong><br /><br />Example: Wide-Banners:SideBox-Banners<br /><br />Default Group is Wide-Banners<br /><br />What Banner Group(s) do you want to use in the Footer Position 3?<br />Leave blank for none',19,67,NULL,'2019-02-19 14:19:13','','',NULL),(433,'Banner Display Groups - Side Box banner_box','SHOW_BANNERS_GROUP_SET7','SideBox-Banners','The Banner Display Groups can be from 1 Banner Group or Multiple Banner Groups<br /><br />For Multiple Banner Groups enter the Banner Group Name separated by a colon <strong>:</strong><br /><br />Example: Wide-Banners:SideBox-Banners<br />Default Group is SideBox-Banners<br /><br />What Banner Group(s) do you want to use in the Side Box - banner_box?<br />Leave blank for none',19,70,NULL,'2019-02-19 14:19:13','','',NULL),(434,'Banner Display Groups - Side Box banner_box2','SHOW_BANNERS_GROUP_SET8','SideBox-Banners','The Banner Display Groups can be from 1 Banner Group or Multiple Banner Groups<br /><br />For Multiple Banner Groups enter the Banner Group Name separated by a colon <strong>:</strong><br /><br />Example: Wide-Banners:SideBox-Banners<br />Default Group is SideBox-Banners<br /><br />What Banner Group(s) do you want to use in the Side Box - banner_box2?<br />Leave blank for none',19,71,NULL,'2019-02-19 14:19:13','','',NULL),(435,'Banner Display Group - Side Box banner_box_all','SHOW_BANNERS_GROUP_SET_ALL','BannersAll','The Banner Display Group may only be from one (1) Banner Group for the Banner All sidebox<br /><br />Default Group is BannersAll<br /><br />What Banner Group do you want to use in the Side Box - banner_box_all?<br />Leave blank for none',19,72,NULL,'2019-02-19 14:19:13','','',NULL),(436,'Footer - Show IP Address status','SHOW_FOOTER_IP','1','Show Customer IP Address in the Footer<br />0= off<br />1= on<br />Should the Customer IP Address show in the footer?',19,80,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_option(array(\'0\', \'1\'), ',NULL),(437,'Product Discount Quantities - Add how many blank discounts?','DISCOUNT_QTY_ADD','5','How many blank discount quantities should be added for Product Pricing?',19,90,NULL,'2019-02-19 14:19:13','','',NULL),(438,'Product Discount Quantities - Display how many per row?','DISCOUNT_QUANTITY_PRICES_COLUMN','5','How many discount quantities should show per row on Product Info Pages?',19,95,NULL,'2019-02-19 14:19:13','','',NULL),(439,'Categories/Products Display Sort Order','CATEGORIES_PRODUCTS_SORT_ORDER','0','Categories/Products Display Sort Order<br />0= Categories/Products Sort Order/Name<br />1= Categories/Products Name<br />2= Products Model<br />3= Products Qty+, Products Name<br />4= Products Qty-, Products Name<br />5= Products Price+, Products Name<br />6= Products Price-, Products Name',19,100,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\', \'4\', \'5\', \'6\'), ',NULL),(440,'Option Names and Values Global Add, Copy and Delete Features Status','OPTION_NAMES_VALUES_GLOBAL_STATUS','1','Option Names and Values Global Add, Copy and Delete Features Status<br />0= Hide Features<br />1= Show Features<br />(Default=1)',19,110,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_option(array(\'0\', \'1\'), ',NULL),(441,'Categories-Tabs Menu ON/OFF','CATEGORIES_TABS_STATUS','1','Categories-Tabs<br />This enables the display of your store\'s categories as a menu across the top of your header. There are many potential creative uses for this.<br />0= Hide Categories Tabs<br />1= Show Categories Tabs',19,112,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_option(array(\'0\', \'1\'), ',NULL),(442,'Site Map - include My Account Links?','SHOW_ACCOUNT_LINKS_ON_SITE_MAP','No','Should the links to My Account show up on the site-map?<br />Note: Spiders will try to index this page, and likely should not be sent to secure pages, since there is no benefit in indexing a login page.<br /><br />Default: false',19,115,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_option(array(\'Yes\', \'No\'), ',NULL),(443,'Skip 1-prod Categories','SKIP_SINGLE_PRODUCT_CATEGORIES','True','Skip single-product categories<br />If this option is set to True, then if the customer clicks on a link to a category which only contains a single item, then Zen Cart will take them directly to that product-page, rather than present them with another link to click in order to see the product.<br />Default: True',19,120,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_option(array(\'True\', \'False\'), ',NULL),(444,'Use split-login page','USE_SPLIT_LOGIN_MODE','False','The login page can be displayed in two modes: Split or Vertical.<br />In Split mode, the create-account options are accessed by clicking a button to get to the create-account page.  In Vertical mode, the create-account input fields are all displayed inline, below the login field, making one less click for the customer to create their account.<br />Default: False',19,121,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_option(array(\'True\', \'False\'), ',NULL),(445,'CSS Buttons','IMAGE_USE_CSS_BUTTONS','Yes','CSS Buttons<br />Use CSS buttons instead of images (GIF/JPG)?<br />Button styles must be configured in the stylesheet if you enable this option.',19,147,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_option(array(\'No\', \'Yes\'), ',NULL),(446,'<strong>Down for Maintenance: ON/OFF</strong>','DOWN_FOR_MAINTENANCE','false','Down for Maintenance <br />(true=on false=off)',20,1,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), ',NULL),(447,'Down for Maintenance: filename','DOWN_FOR_MAINTENANCE_FILENAME','down_for_maintenance','Down for Maintenance filename<br />Note: Do not include the extension<br />Default=down_for_maintenance',20,2,NULL,'2019-02-19 14:19:13',NULL,'',NULL),(448,'Down for Maintenance: Hide Header','DOWN_FOR_MAINTENANCE_HEADER_OFF','false','Down for Maintenance: Hide Header <br />(true=hide false=show)',20,3,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), ',NULL),(449,'Down for Maintenance: Hide Column Left','DOWN_FOR_MAINTENANCE_COLUMN_LEFT_OFF','false','Down for Maintenance: Hide Column Left <br />(true=hide false=show)',20,4,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), ',NULL),(450,'Down for Maintenance: Hide Column Right','DOWN_FOR_MAINTENANCE_COLUMN_RIGHT_OFF','false','Down for Maintenance: Hide Column Right <br />(true=hide false=show)',20,5,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), ',NULL),(451,'Down for Maintenance: Hide Footer','DOWN_FOR_MAINTENANCE_FOOTER_OFF','false','Down for Maintenance: Hide Footer <br />(true=hide false=show)',20,6,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), ',NULL),(452,'Down for Maintenance: Hide Prices','DOWN_FOR_MAINTENANCE_PRICES_OFF','false','Down for Maintenance: Hide Prices <br />(true=hide false=show)',20,7,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), ',NULL),(453,'Down For Maintenance (exclude this IP-Address)','EXCLUDE_ADMIN_IP_FOR_MAINTENANCE','your IP (ADMIN)','This IP Address is able to access the website while it is Down For Maintenance (like webmaster)<br />To enter multiple IP Addresses, separate with a comma. If you do not know your IP Address, check in the Footer of your Shop.',20,8,'2003-03-21 13:43:22','2003-03-21 21:20:07',NULL,NULL,NULL),(454,'NOTICE PUBLIC Before going Down for Maintenance: ON/OFF','WARN_BEFORE_DOWN_FOR_MAINTENANCE','false','Give a WARNING some time before you put your website Down for Maintenance<br />(true=on false=off)<br />If you set the \'Down For Maintenance: ON/OFF\' to true this will automaticly be updated to false',20,9,'2003-03-21 13:08:25','2003-03-21 11:42:47',NULL,'zen_cfg_select_option(array(\'true\', \'false\'),',NULL),(455,'Date and hours for notice before maintenance','PERIOD_BEFORE_DOWN_FOR_MAINTENANCE','15/05/2003  2-3 PM','Date and hours for notice before maintenance website, enter date and hours for maintenance website',20,10,'2003-03-21 13:08:25','2003-03-21 11:42:47',NULL,NULL,NULL),(456,'Display when webmaster has enabled maintenance','DISPLAY_MAINTENANCE_TIME','false','Display when Webmaster has enabled maintenance <br />(true=on false=off)<br />',20,11,'2003-03-21 13:08:25','2003-03-21 11:42:47',NULL,'zen_cfg_select_option(array(\'true\', \'false\'),',NULL),(457,'Display website maintenance period','DISPLAY_MAINTENANCE_PERIOD','false','Display Website maintenance period <br />(true=on false=off)<br />',20,12,'2003-03-21 13:08:25','2003-03-21 11:42:47',NULL,'zen_cfg_select_option(array(\'true\', \'false\'),',NULL),(458,'Website maintenance period','TEXT_MAINTENANCE_PERIOD_TIME','2h00','Enter Website Maintenance period (hh:mm)',20,13,'2003-03-21 13:08:25','2003-03-21 11:42:47',NULL,NULL,NULL),(459,'Confirm Terms and Conditions During Checkout Procedure','DISPLAY_CONDITIONS_ON_CHECKOUT','false','Show the Terms and Conditions during the checkout procedure which the customer must agree to.',11,1,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), ',NULL),(460,'Confirm Privacy Notice During Account Creation Procedure','DISPLAY_PRIVACY_CONDITIONS','false','Show the Privacy Notice during the account creation procedure which the customer must agree to.',11,2,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), ',NULL),(461,'Display Product Image','PRODUCT_NEW_LIST_IMAGE','1102','Do you want to display the Product Image?<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />',21,1,NULL,'2019-02-19 14:19:13',NULL,NULL,NULL),(462,'Display Product Quantity','PRODUCT_NEW_LIST_QUANTITY','1202','Do you want to display the Product Quantity?<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />',21,2,NULL,'2019-02-19 14:19:13',NULL,NULL,NULL),(463,'Display Product Buy Now Button','PRODUCT_NEW_BUY_NOW','1300','Do you want to display the Product Buy Now Button<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />',21,3,NULL,'2019-02-19 14:19:13',NULL,NULL,NULL),(464,'Display Product Name','PRODUCT_NEW_LIST_NAME','2101','Do you want to display the Product Name?<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />',21,4,NULL,'2019-02-19 14:19:13',NULL,NULL,NULL),(465,'Display Product Model','PRODUCT_NEW_LIST_MODEL','2201','Do you want to display the Product Model?<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />',21,5,NULL,'2019-02-19 14:19:13',NULL,NULL,NULL),(466,'Display Product Manufacturer Name','PRODUCT_NEW_LIST_MANUFACTURER','2302','Do you want to display the Product Manufacturer Name?<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />',21,6,NULL,'2019-02-19 14:19:13',NULL,NULL,NULL),(467,'Display Product Price','PRODUCT_NEW_LIST_PRICE','2402','Do you want to display the Product Price<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />',21,7,NULL,'2019-02-19 14:19:13',NULL,NULL,NULL),(468,'Display Product Weight','PRODUCT_NEW_LIST_WEIGHT','2502','Do you want to display the Product Weight?<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />',21,8,NULL,'2019-02-19 14:19:13',NULL,NULL,NULL),(469,'Display Product Date Added','PRODUCT_NEW_LIST_DATE_ADDED','2601','Do you want to display the Product Date Added?<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />',21,9,NULL,'2019-02-19 14:19:13',NULL,NULL,NULL),(470,'Display Product Description','PRODUCT_NEW_LIST_DESCRIPTION','150','How many characters do you want to display of the Product Description?<br /><br />0= OFF<br />150= Suggested Length, or enter the maximum number of characters to display',21,10,NULL,'2019-02-19 14:19:13',NULL,NULL,NULL),(471,'Display Product Display - Default Sort Order','PRODUCT_NEW_LIST_SORT_DEFAULT','6','What Sort Order Default should be used for New Products Display?<br />Default= 6 for Date New to Old<br /><br />1= Products Name<br />2= Products Name Desc<br />3= Price low to high, Products Name<br />4= Price high to low, Products Name<br />5= Model<br />6= Date Added desc<br />7= Date Added<br />8= Product Sort Order',21,11,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_option(array(\'1\', \'2\', \'3\', \'4\', \'5\', \'6\', \'7\', \'8\'), ',NULL),(472,'Default Products New Group ID','PRODUCT_NEW_LIST_GROUP_ID','21','Warning: Only change this if your Products New Group ID has changed from the default of 21<br />What is the configuration_group_id for New Products Listings?',21,12,NULL,'2019-02-19 14:19:13',NULL,NULL,NULL),(473,'Display Multiple Products Qty Box Status and Set Button Location','PRODUCT_NEW_LISTING_MULTIPLE_ADD_TO_CART','3','Do you want to display Add Multiple Products Qty Box and Set Button Location?<br />0= off<br />1= Top<br />2= Bottom<br />3= Both',21,25,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\'), ',NULL),(474,'Mask Upcoming Products from being include as New Products','SHOW_NEW_PRODUCTS_UPCOMING_MASKED','0','Do you want to mask Upcoming Products from being included as New Products in Listing, Sideboxes and Centerbox?<br />0= off<br />1= on',21,30,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_option(array(\'0\', \'1\'), ',NULL),(475,'Display Product Image','PRODUCT_FEATURED_LIST_IMAGE','1102','Do you want to display the Product Image?<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />',22,1,NULL,'2019-02-19 14:19:13',NULL,NULL,NULL),(476,'Display Product Quantity','PRODUCT_FEATURED_LIST_QUANTITY','1202','Do you want to display the Product Quantity?<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />',22,2,NULL,'2019-02-19 14:19:13',NULL,NULL,NULL),(477,'Display Product Buy Now Button','PRODUCT_FEATURED_BUY_NOW','1300','Do you want to display the Product Buy Now Button<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />',22,3,NULL,'2019-02-19 14:19:13',NULL,NULL,NULL),(478,'Display Product Name','PRODUCT_FEATURED_LIST_NAME','2101','Do you want to display the Product Name?<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />',22,4,NULL,'2019-02-19 14:19:13',NULL,NULL,NULL),(479,'Display Product Model','PRODUCT_FEATURED_LIST_MODEL','2201','Do you want to display the Product Model?<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />',22,5,NULL,'2019-02-19 14:19:13',NULL,NULL,NULL),(480,'Display Product Manufacturer Name','PRODUCT_FEATURED_LIST_MANUFACTURER','2302','Do you want to display the Product Manufacturer Name?<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />',22,6,NULL,'2019-02-19 14:19:13',NULL,NULL,NULL),(481,'Display Product Price','PRODUCT_FEATURED_LIST_PRICE','2402','Do you want to display the Product Price<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />',22,7,NULL,'2019-02-19 14:19:13',NULL,NULL,NULL),(482,'Display Product Weight','PRODUCT_FEATURED_LIST_WEIGHT','2502','Do you want to display the Product Weight?<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />',22,8,NULL,'2019-02-19 14:19:13',NULL,NULL,NULL),(483,'Display Product Date Added','PRODUCT_FEATURED_LIST_DATE_ADDED','2601','Do you want to display the Product Date Added?<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />',22,9,NULL,'2019-02-19 14:19:13',NULL,NULL,NULL),(484,'Display Product Description','PRODUCT_FEATURED_LIST_DESCRIPTION','150','How many characters do you want to display of the Product Description?<br /><br />0= OFF<br />150= Suggested Length, or enter the maximum number of characters to display',22,10,NULL,'2019-02-19 14:19:13',NULL,NULL,NULL),(485,'Display Product Display - Default Sort Order','PRODUCT_FEATURED_LIST_SORT_DEFAULT','1','What Sort Order Default should be used for Featured Product Display?<br />Default= 1 for Product Name<br /><br />1= Products Name<br />2= Products Name Desc<br />3= Price low to high, Products Name<br />4= Price high to low, Products Name<br />5= Model<br />6= Date Added desc<br />7= Date Added<br />8= Product Sort Order',22,11,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_option(array(\'1\', \'2\', \'3\', \'4\', \'5\', \'6\', \'7\', \'8\'), ',NULL),(486,'Default Featured Products Group ID','PRODUCT_FEATURED_LIST_GROUP_ID','22','Warning: Only change this if your Featured Products Group ID has changed from the default of 22<br />What is the configuration_group_id for Featured Products Listings?',22,12,NULL,'2019-02-19 14:19:13',NULL,NULL,NULL),(487,'Display Multiple Products Qty Box Status and Set Button Location','PRODUCT_FEATURED_LISTING_MULTIPLE_ADD_TO_CART','3','Do you want to display Add Multiple Products Qty Box and Set Button Location?<br />0= off<br />1= Top<br />2= Bottom<br />3= Both',22,25,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\'), ',NULL),(488,'Display Product Image','PRODUCT_ALL_LIST_IMAGE','1102','Do you want to display the Product Image?<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />',23,1,NULL,'2019-02-19 14:19:13',NULL,NULL,NULL),(489,'Display Product Quantity','PRODUCT_ALL_LIST_QUANTITY','1202','Do you want to display the Product Quantity?<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />',23,2,NULL,'2019-02-19 14:19:13',NULL,NULL,NULL),(490,'Display Product Buy Now Button','PRODUCT_ALL_BUY_NOW','1300','Do you want to display the Product Buy Now Button<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />',23,3,NULL,'2019-02-19 14:19:13',NULL,NULL,NULL),(491,'Display Product Name','PRODUCT_ALL_LIST_NAME','2101','Do you want to display the Product Name?<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />',23,4,NULL,'2019-02-19 14:19:13',NULL,NULL,NULL),(492,'Display Product Model','PRODUCT_ALL_LIST_MODEL','2201','Do you want to display the Product Model?<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />',23,5,NULL,'2019-02-19 14:19:13',NULL,NULL,NULL),(493,'Display Product Manufacturer Name','PRODUCT_ALL_LIST_MANUFACTURER','2302','Do you want to display the Product Manufacturer Name?<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />',23,6,NULL,'2019-02-19 14:19:13',NULL,NULL,NULL),(494,'Display Product Price','PRODUCT_ALL_LIST_PRICE','2402','Do you want to display the Product Price<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />',23,7,NULL,'2019-02-19 14:19:13',NULL,NULL,NULL),(495,'Display Product Weight','PRODUCT_ALL_LIST_WEIGHT','2502','Do you want to display the Product Weight?<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />',23,8,NULL,'2019-02-19 14:19:13',NULL,NULL,NULL),(496,'Display Product Date Added','PRODUCT_ALL_LIST_DATE_ADDED','2601','Do you want to display the Product Date Added?<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />',23,9,NULL,'2019-02-19 14:19:13',NULL,NULL,NULL),(497,'Display Product Description','PRODUCT_ALL_LIST_DESCRIPTION','150','How many characters do you want to display of the Product Description?<br /><br />0= OFF<br />150= Suggested Length, or enter the maximum number of characters to display',23,10,NULL,'2019-02-19 14:19:13',NULL,NULL,NULL),(498,'Display Product Display - Default Sort Order','PRODUCT_ALL_LIST_SORT_DEFAULT','1','What Sort Order Default should be used for All Products Display?<br />Default= 1 for Product Name<br /><br />1= Products Name<br />2= Products Name Desc<br />3= Price low to high, Products Name<br />4= Price high to low, Products Name<br />5= Model<br />6= Date Added desc<br />7= Date Added<br />8= Product Sort Order',23,11,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_option(array(\'1\', \'2\', \'3\', \'4\', \'5\', \'6\', \'7\', \'8\'), ',NULL),(499,'Default Products All Group ID','PRODUCT_ALL_LIST_GROUP_ID','23','Warning: Only change this if your Products All Group ID has changed from the default of 23<br />What is the configuration_group_id for Products All Listings?',23,12,NULL,'2019-02-19 14:19:13',NULL,NULL,NULL),(500,'Display Multiple Products Qty Box Status and Set Button Location','PRODUCT_ALL_LISTING_MULTIPLE_ADD_TO_CART','3','Do you want to display Add Multiple Products Qty Box and Set Button Location?<br />0= off<br />1= Top<br />2= Bottom<br />3= Both',23,25,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\'), ',NULL),(501,'Show New Products on Main Page','SHOW_PRODUCT_INFO_MAIN_NEW_PRODUCTS','1','Show New Products on Main Page<br />0= off or set the sort order',24,65,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\', \'4\'), ',NULL),(502,'Show Featured Products on Main Page','SHOW_PRODUCT_INFO_MAIN_FEATURED_PRODUCTS','2','Show Featured Products on Main Page<br />0= off or set the sort order',24,66,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\', \'4\'), ',NULL),(503,'Show Special Products on Main Page','SHOW_PRODUCT_INFO_MAIN_SPECIALS_PRODUCTS','3','Show Special Products on Main Page<br />0= off or set the sort order',24,67,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\', \'4\'), ',NULL),(504,'Show Upcoming Products on Main Page','SHOW_PRODUCT_INFO_MAIN_UPCOMING','4','Show Upcoming Products on Main Page<br />0= off or set the sort order',24,68,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\', \'4\'), ',NULL),(505,'Show New Products on Main Page - Category with SubCategories','SHOW_PRODUCT_INFO_CATEGORY_NEW_PRODUCTS','1','Show New Products on Main Page - Category with SubCategories<br />0= off or set the sort order',24,70,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\', \'4\'), ',NULL),(506,'Show Featured Products on Main Page - Category with SubCategories','SHOW_PRODUCT_INFO_CATEGORY_FEATURED_PRODUCTS','2','Show Featured Products on Main Page - Category with SubCategories<br />0= off or set the sort order',24,71,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\', \'4\'), ',NULL),(507,'Show Special Products on Main Page - Category with SubCategories','SHOW_PRODUCT_INFO_CATEGORY_SPECIALS_PRODUCTS','3','Show Special Products on Main Page - Category with SubCategories<br />0= off or set the sort order',24,72,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\', \'4\'), ',NULL),(508,'Show Upcoming Products on Main Page - Category with SubCategories','SHOW_PRODUCT_INFO_CATEGORY_UPCOMING','4','Show Upcoming Products on Main Page - Category with SubCategories<br />0= off or set the sort order',24,73,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\', \'4\'), ',NULL),(509,'Show New Products on Main Page - Errors and Missing Products Page','SHOW_PRODUCT_INFO_MISSING_NEW_PRODUCTS','1','Show New Products on Main Page - Errors and Missing Product<br />0= off or set the sort order',24,75,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\', \'4\'), ',NULL),(510,'Show Featured Products on Main Page - Errors and Missing Products Page','SHOW_PRODUCT_INFO_MISSING_FEATURED_PRODUCTS','2','Show Featured Products on Main Page - Errors and Missing Product<br />0= off or set the sort order',24,76,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\', \'4\'), ',NULL),(511,'Show Special Products on Main Page - Errors and Missing Products Page','SHOW_PRODUCT_INFO_MISSING_SPECIALS_PRODUCTS','3','Show Special Products on Main Page - Errors and Missing Product<br />0= off or set the sort order',24,77,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\', \'4\'), ',NULL),(512,'Show Upcoming Products on Main Page - Errors and Missing Products Page','SHOW_PRODUCT_INFO_MISSING_UPCOMING','4','Show Upcoming Products on Main Page - Errors and Missing Product<br />0= off or set the sort order',24,78,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\', \'4\'), ',NULL),(513,'Show New Products - below Product Listing','SHOW_PRODUCT_INFO_LISTING_BELOW_NEW_PRODUCTS','1','Show New Products below Product Listing<br />0= off or set the sort order',24,85,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\', \'4\'), ',NULL),(514,'Show Featured Products - below Product Listing','SHOW_PRODUCT_INFO_LISTING_BELOW_FEATURED_PRODUCTS','2','Show Featured Products below Product Listing<br />0= off or set the sort order',24,86,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\', \'4\'), ',NULL),(515,'Show Special Products - below Product Listing','SHOW_PRODUCT_INFO_LISTING_BELOW_SPECIALS_PRODUCTS','3','Show Special Products below Product Listing<br />0= off or set the sort order',24,87,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\', \'4\'), ',NULL),(516,'Show Upcoming Products - below Product Listing','SHOW_PRODUCT_INFO_LISTING_BELOW_UPCOMING','4','Show Upcoming Products below Product Listing<br />0= off or set the sort order',24,88,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\', \'4\'), ',NULL),(517,'New Products Columns per Row','SHOW_PRODUCT_INFO_COLUMNS_NEW_PRODUCTS','3','New Products Columns per Row',24,95,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_option(array(\'1\', \'2\', \'3\', \'4\', \'5\', \'6\', \'7\', \'8\', \'9\', \'10\', \'11\', \'12\'), ',NULL),(518,'Featured Products Columns per Row','SHOW_PRODUCT_INFO_COLUMNS_FEATURED_PRODUCTS','3','Featured Products Columns per Row',24,96,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_option(array(\'1\', \'2\', \'3\', \'4\', \'5\', \'6\', \'7\', \'8\', \'9\', \'10\', \'11\', \'12\'), ',NULL),(519,'Special Products Columns per Row','SHOW_PRODUCT_INFO_COLUMNS_SPECIALS_PRODUCTS','3','Special Products Columns per Row',24,97,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_option(array(\'1\', \'2\', \'3\', \'4\', \'5\', \'6\', \'7\', \'8\', \'9\', \'10\', \'11\', \'12\'), ',NULL),(520,'Filter Product Listing for Current Top Level Category When Enabled','SHOW_PRODUCT_INFO_ALL_PRODUCTS','1','Filter the products when Product Listing is enabled for current Main Category or show products from all categories?<br />0= Filter Off 1=Filter On ',24,100,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_option(array(\'0\', \'1\'), ',NULL),(521,'Define Main Page Status','DEFINE_MAIN_PAGE_STATUS','1','Enable the Defined Main Page Link/Text?<br />0= Link ON, Define Text OFF<br />1= Link ON, Define Text ON<br />2= Link OFF, Define Text ON<br />3= Link OFF, Define Text OFF',25,60,'2019-02-19 14:19:13','2019-02-19 14:19:13',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\'),',NULL),(522,'Define Contact Us Status','DEFINE_CONTACT_US_STATUS','1','Enable the Defined Contact Us Link/Text?<br />0= Link ON, Define Text OFF<br />1= Link ON, Define Text ON<br />2= Link OFF, Define Text ON<br />3= Link OFF, Define Text OFF',25,61,'2019-02-19 14:19:13','2019-02-19 14:19:13',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\'),',NULL),(523,'Define Privacy Status','DEFINE_PRIVACY_STATUS','1','Enable the Defined Privacy Link/Text?<br />0= Link ON, Define Text OFF<br />1= Link ON, Define Text ON<br />2= Link OFF, Define Text ON<br />3= Link OFF, Define Text OFF',25,62,'2019-02-19 14:19:13','2019-02-19 14:19:13',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\'),',NULL),(524,'Define Shipping & Returns','DEFINE_SHIPPINGINFO_STATUS','1','Enable the Defined Shipping & Returns Link/Text?<br />0= Link ON, Define Text OFF<br />1= Link ON, Define Text ON<br />2= Link OFF, Define Text ON<br />3= Link OFF, Define Text OFF',25,63,'2019-02-19 14:19:13','2019-02-19 14:19:13',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\'),',NULL),(525,'Define Conditions of Use','DEFINE_CONDITIONS_STATUS','1','Enable the Defined Conditions of Use Link/Text?<br />0= Link ON, Define Text OFF<br />1= Link ON, Define Text ON<br />2= Link OFF, Define Text ON<br />3= Link OFF, Define Text OFF',25,64,'2019-02-19 14:19:13','2019-02-19 14:19:13',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\'),',NULL),(526,'Define Checkout Success','DEFINE_CHECKOUT_SUCCESS_STATUS','1','Enable the Defined Checkout Success Link/Text?<br />0= Link ON, Define Text OFF<br />1= Link ON, Define Text ON<br />2= Link OFF, Define Text ON<br />3= Link OFF, Define Text OFF',25,65,'2019-02-19 14:19:13','2019-02-19 14:19:13',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\'),',NULL),(527,'Define Discount Coupon','DEFINE_DISCOUNT_COUPON_STATUS','1','Enable the Defined Discount Coupon Link/Text?<br />0= Link ON, Define Text OFF<br />1= Link ON, Define Text ON<br />2= Link OFF, Define Text ON<br />3= Link OFF, Define Text OFF',25,66,'2019-02-19 14:19:13','2019-02-19 14:19:13',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\'),',NULL),(528,'Define Site Map Status','DEFINE_SITE_MAP_STATUS','1','Enable the Defined Site Map Link/Text?<br />0= Link ON, Define Text OFF<br />1= Link ON, Define Text ON<br />2= Link OFF, Define Text ON<br />3= Link OFF, Define Text OFF',25,67,'2019-02-19 14:19:13','2019-02-19 14:19:13',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\'),',NULL),(529,'Define Page-Not-Found Status','DEFINE_PAGE_NOT_FOUND_STATUS','1','Enable the Defined Page-Not-Found Text from define-pages?<br />0= Define Text OFF<br />1= Define Text ON',25,67,'2019-02-19 14:19:13','2019-02-19 14:19:13',NULL,'zen_cfg_select_option(array(\'0\', \'1\'),',NULL),(530,'Define Page 2','DEFINE_PAGE_2_STATUS','1','Enable the Defined Page 2 Link/Text?<br />0= Link ON, Define Text OFF<br />1= Link ON, Define Text ON<br />2= Link OFF, Define Text ON<br />3= Link OFF, Define Text OFF',25,82,'2019-02-19 14:19:13','2019-02-19 14:19:13',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\'),',NULL),(531,'Define Page 3','DEFINE_PAGE_3_STATUS','1','Enable the Defined Page 3 Link/Text?<br />0= Link ON, Define Text OFF<br />1= Link ON, Define Text ON<br />2= Link OFF, Define Text ON<br />3= Link OFF, Define Text OFF',25,83,'2019-02-19 14:19:13','2019-02-19 14:19:13',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\'),',NULL),(532,'Define Page 4','DEFINE_PAGE_4_STATUS','1','Enable the Defined Page 4 Link/Text?<br />0= Link ON, Define Text OFF<br />1= Link ON, Define Text ON<br />2= Link OFF, Define Text ON<br />3= Link OFF, Define Text OFF',25,84,'2019-02-19 14:19:13','2019-02-19 14:19:13',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\', \'3\'),',NULL),(533,'EZ-Pages Display Status - HeaderBar','EZPAGES_STATUS_HEADER','1','Display of EZ-Pages content can be Globally enabled/disabled for the Header Bar<br />0 = Off<br />1 = On<br />2= On ADMIN IP ONLY located in Website Maintenance<br />NOTE: Warning only shows to the Admin and not to the public',30,10,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\'), ',NULL),(534,'EZ-Pages Display Status - FooterBar','EZPAGES_STATUS_FOOTER','1','Display of EZ-Pages content can be Globally enabled/disabled for the Footer Bar<br />0 = Off<br />1 = On<br />2= On ADMIN IP ONLY located in Website Maintenance<br />NOTE: Warning only shows to the Admin and not to the public',30,11,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\'), ',NULL),(535,'EZ-Pages Display Status - Sidebox','EZPAGES_STATUS_SIDEBOX','1','Display of EZ-Pages content can be Globally enabled/disabled for the Sidebox<br />0 = Off<br />1 = On<br />2= On ADMIN IP ONLY located in Website Maintenance<br />NOTE: Warning only shows to the Admin and not to the public',30,12,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\'), ',NULL),(536,'EZ-Pages Header Link Separator','EZPAGES_SEPARATOR_HEADER','&nbsp;::&nbsp;','EZ-Pages Header Link Separator<br />Default = &amp;nbsp;::&amp;nbsp;',30,20,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_textarea_small(',NULL),(537,'EZ-Pages Footer Link Separator','EZPAGES_SEPARATOR_FOOTER','&nbsp;::&nbsp;','EZ-Pages Footer Link Separator<br />Default = &amp;nbsp;::&amp;nbsp;',30,21,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_textarea_small(',NULL),(538,'EZ-Pages Prev/Next Buttons','EZPAGES_SHOW_PREV_NEXT_BUTTONS','2','Display Prev/Continue/Next buttons on EZ-Pages pages?<br />0=OFF (no buttons)<br />1=\"Continue\"<br />2=\"Prev/Continue/Next\"<br /><br />Default setting: 2.',30,30,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_option(array(\'0\', \'1\', \'2\'), ',NULL),(539,'EZ-Pages Table of Contents for Chapters Status','EZPAGES_SHOW_TABLE_CONTENTS','1','Enable EZ-Pages Table of Contents for Chapters?<br />0= OFF<br />1= ON',30,35,'2019-02-19 14:19:13','2019-02-19 14:19:13',NULL,'zen_cfg_select_option(array(\'0\', \'1\'),',NULL),(540,'EZ-Pages Pages to disable headers','EZPAGES_DISABLE_HEADER_DISPLAY_LIST','','EZ-Pages \"pages\" on which to NOT display the normal \"header\" for your site.<br />Simply list page ID numbers separated by commas with no spaces.<br />Page ID numbers can be obtained from the EZ-Pages screen under Admin->Tools.<br />ie: 1,5,2<br />or leave blank.',30,40,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_textarea_small(',NULL),(541,'EZ-Pages Pages to disable footers','EZPAGES_DISABLE_FOOTER_DISPLAY_LIST','','EZ-Pages \"pages\" on which to NOT display the normal \"footer\" for your site.<br />Simply list page ID numbers separated by commas with no spaces.<br />Page ID numbers can be obtained from the EZ-Pages screen under Admin->Tools.<br />ie: 3,7<br />or leave blank.',30,41,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_textarea_small(',NULL),(542,'EZ-Pages Pages to disable left-column','EZPAGES_DISABLE_LEFTCOLUMN_DISPLAY_LIST','','EZ-Pages \"pages\" on which to NOT display the normal \"left\" column (of sideboxes) for your site.<br />Simply list page ID numbers separated by commas with no spaces.<br />Page ID numbers can be obtained from the EZ-Pages screen under Admin->Tools.<br />ie: 21<br />or leave blank.',30,42,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_textarea_small(',NULL),(543,'EZ-Pages Pages to disable right-column','EZPAGES_DISABLE_RIGHTCOLUMN_DISPLAY_LIST','','EZ-Pages \"pages\" on which to NOT display the normal \"right\" column (of sideboxes) for your site.<br />Simply list page ID numbers separated by commas with no spaces.<br />Page ID numbers can be obtained from the EZ-Pages screen under Admin->Tools.<br />ie: 3,82,13<br />or leave blank.',30,43,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_textarea_small(',NULL),(544,'Convert currencies for Text emails','CURRENCIES_TRANSLATIONS','&pound;,£:&euro;,€:&reg;,®:&trade;,™','What currency conversions do you need for Text emails?<br />Example = &amp;pound;,&pound;:&amp;euro;,&euro;',12,120,NULL,'2003-11-21 00:00:00',NULL,'zen_cfg_textarea_small(',NULL),(545,'Use root path for cookie path','SESSION_USE_ROOT_COOKIE_PATH','False','Normally Zen Cart will use the directory that a store resides in as the cookie path. This can cause problems with some servers. This setting allows you to set the cookie path to the root of the server, rather than the store directory. It should only be used if you have problems with sessions. <strong>Default Value = False</strong><br /><br /><strong>Changing this setting may mean you have problems logging into your admin, you should clear your browser cookies to overcome this.</strong>',15,999,NULL,'0001-01-01 00:00:00',NULL,'zen_cfg_select_option(array(\'True\', \'False\'), ',NULL),(546,'Add period prefix to cookie domain','SESSION_ADD_PERIOD_PREFIX','True','Normally Zen Cart will add a period prefix to the cookie domain, e.g.  .www.mydomain.com. This can sometimes cause problems with some server configurations. If you are having session problems you may want to try setting this to False. <strong>Default Value = True</strong>',15,999,NULL,'0001-01-01 00:00:00',NULL,'zen_cfg_select_option(array(\'True\', \'False\'), ',NULL),(608,'IH resize images','IH_RESIZE','no','Select either -no- which is old Zen-Cart behaviour or -yes- to activate automatic resizing and caching of images. --Note: If you select -no-, all of the Image Handler specific image settings will be unavailable including: image filetype selection, background colors, compression, image hover, and watermarking-- If you want to use ImageMagick you have to specify the location of the <strong>convert</strong> binary in <em>includes/extra_configures/bmz_image_handler_conf.php</em>.',4,1001,'2019-02-19 15:36:05','2019-02-19 15:36:05',NULL,'zen_cfg_select_option(array(\'yes\',\'no\'),',NULL),(609,'IH small images filetype','SMALL_IMAGE_FILETYPE','no_change','Select one of -jpg-, -gif- or -png-. Older versions of Internet Explorer -v6.0 and older- will have issues displaying -png- images with transparent areas. You better stick to -gif- for transparency if you MUST support older versions of Internet Explorer. However -png- is a MUCH BETTER format for transparency. Use -jpg- or -png- for larger images. -no_change- is old zen-cart behavior, use the same file extension for small images as uploaded image',4,1011,'2019-02-19 15:36:05','2019-02-19 15:36:05',NULL,'zen_cfg_select_option(array(\'gif\',\'jpg\',\'png\',\'no_change\'),',NULL),(610,'IH small images background','SMALL_IMAGE_BACKGROUND','255:255:255','If converted from an uploaded image with transparent areas, these areas become the specified color. Set to -transparent- to keep transparency.',4,1021,'2019-02-19 15:36:05','2019-02-19 15:36:05',NULL,NULL,NULL),(611,'IH small images compression quality','SMALL_IMAGE_QUALITY','85','Specify the desired image quality for small jpg images, decimal values ranging from 0 to 100. Higher is better quality and takes more space. Default is 85 which is ok unless you have very specific needs.',4,1031,'2019-02-19 15:36:05','2019-02-19 15:36:05',NULL,NULL,NULL),(612,'IH small images watermark','WATERMARK_SMALL_IMAGES','no','Set to -yes-, if you want to show watermarked small images instead of unmarked small images.',4,1041,'2019-02-19 15:36:05','2019-02-19 15:36:05',NULL,'zen_cfg_select_option(array(\'no\',\'yes\'),',NULL),(613,'IH small images zoom on hover','ZOOM_SMALL_IMAGES','yes','Set to -yes-, if you want to enable a nice zoom overlay while hovering the mouse pointer over small images.',4,1051,'2019-02-19 15:36:05','2019-02-19 15:36:05',NULL,'zen_cfg_select_option(array(\'no\',\'yes\'),',NULL),(614,'IH small images zoom on hover size','ZOOM_IMAGE_SIZE','Medium','Set to -Medium-, if you want to the zoom on hover display to use the medium sized image. Otherwise, to use the large sized image on hover, set to -Large-',4,1061,'2019-02-19 15:36:05','2019-02-19 15:36:05',NULL,'zen_cfg_select_option(array(\'Medium\',\'Large\'),',NULL),(615,'IH medium images filetype','MEDIUM_IMAGE_FILETYPE','no_change','Select one of -jpg-, -gif- or -png-. Older versions of Internet Explorer -v6.0 and older- will have issues displaying -png- images with transparent areas. You better stick to -gif- for transparency if you MUST support older versions of Internet Explorer. However -png- is a MUCH BETTER format for transparency. Use -jpg- or -png- for larger images. -no_change- is old zen-cart behavior, use the same file extension for medium images as uploaded image-s.',4,1071,'2019-02-19 15:36:05','2019-02-19 15:36:05',NULL,'zen_cfg_select_option(array(\'gif\',\'jpg\',\'png\',\'no_change\'),',NULL),(616,'IH medium images background','MEDIUM_IMAGE_BACKGROUND','255:255:255','If converted from an uploaded image with transparent areas, these areas become the specified color. Set to -transparent- to keep transparency.',4,1081,'2019-02-19 15:36:05','2019-02-19 15:36:05',NULL,NULL,NULL),(617,'IH medium images compression quality','MEDIUM_IMAGE_QUALITY','85','Specify the desired image quality for medium jpg images, decimal values ranging from 0 to 100. Higher is better quality and takes more space. Default is 85 which is ok unless you have very specific needs.',4,1091,'2019-02-19 15:36:05','2019-02-19 15:36:05',NULL,NULL,NULL),(618,'IH medium images watermark','WATERMARK_MEDIUM_IMAGES','no','Set to -yes-, if you want to show watermarked medium images instead of unmarked medium images.',4,1101,'2019-02-19 15:36:05','2019-02-19 15:36:05',NULL,'zen_cfg_select_option(array(\'no\',\'yes\'),',NULL),(619,'IH large images filetype','LARGE_IMAGE_FILETYPE','no_change','Select one of -jpg-, -gif- or -png-. Older versions of Internet Explorer -v6.0 and older- will have issues displaying -png- images with transparent areas. You better stick to -gif- for transparency if you MUST support older versions of Internet Explorer. However -png- is a MUCH BETTER format for transparency. Use -jpg- or -png- for larger images. -no_change- is old zen-cart behavior, use the same file extension for large images as uploaded image-s.',4,1111,'2019-02-19 15:36:05','2019-02-19 15:36:05',NULL,'zen_cfg_select_option(array(\'gif\',\'jpg\',\'png\',\'no_change\'),',NULL),(620,'IH large images background','LARGE_IMAGE_BACKGROUND','255:255:255','If converted from an uploaded image with transparent areas, these areas become the specified color. Set to -transparent- to keep transparency.',4,1121,'2019-02-19 15:36:05','2019-02-19 15:36:05',NULL,NULL,NULL),(621,'IH large images compression quality','LARGE_IMAGE_QUALITY','85','Specify the desired image quality for large jpg images, decimal values ranging from 0 to 100. Higher is better quality and takes more space. Default is 85 which is ok unless you have very specific needs.',4,1131,'2019-02-19 15:36:05','2019-02-19 15:36:05',NULL,NULL,NULL),(622,'IH large images watermark','WATERMARK_LARGE_IMAGES','no','Set to -yes-, if you want to show watermarked large images instead of unmarked large images.',4,1141,'2019-02-19 15:36:05','2019-02-19 15:36:05',NULL,'zen_cfg_select_option(array(\'no\',\'yes\'),',NULL),(623,'IH large images maximum width','LARGE_IMAGE_MAX_WIDTH','750','Specify a maximum width for your large images. If width and height are empty or set to 0, no resizing of large images is done.',4,1151,'2019-02-19 15:36:05','2019-02-19 15:36:05',NULL,NULL,NULL),(624,'IH large images maximum height','LARGE_IMAGE_MAX_HEIGHT','550','Specify a maximum height for your large images. If width and height are empty or set to 0, no resizing of large images is done.',4,1161,'2019-02-19 15:36:05','2019-02-19 15:36:05',NULL,NULL,NULL),(625,'IH watermark gravity','WATERMARK_GRAVITY','Center','Select the position for the watermark relative to the image-s canvas. Default is <strong>Center</Strong>.',4,1171,'2019-02-19 15:36:05','2019-02-19 15:36:05',NULL,'zen_cfg_select_option(array(\'Center\',\'NorthWest\',\'North\',\'NorthEast\',\'East\',\'SouthEast\',\'South\',\'SouthWest\',\'West\'),',NULL),(577,'Version','CSS_JS_LOADER_VERSION','3.0.1','Installed Version',32,0,'2019-02-19 14:25:23','2019-02-19 14:25:23',NULL,'trim(',NULL),(566,'Version','FACEBOOK_LIKE_BUTTON_VERSION','1.3.2','Version Installed:',31,0,'2019-02-19 14:25:23','2019-02-19 14:25:23',NULL,NULL,NULL),(567,'Enable Facebook Like Button','FACEBOOK_LIKE_BUTTON_STATUS','true','Enable the Facebook Like Button?',31,10,'2019-02-19 14:25:23','2019-02-19 14:25:23',NULL,'zen_cfg_select_option(array(\'true\', \'false\'),',NULL),(568,'Method','FACEBOOK_LIKE_BUTTON_METHOD','iframe','Use the iframe, HTML5, or XBFML method?',31,20,'2019-02-19 14:25:23','2019-02-19 14:25:23',NULL,'zen_cfg_select_option(array(\'iframe\', \'XBFML\', \'HTML5\'),',NULL),(569,'Alignment','FACEBOOK_LIKE_BUTTON_ALIGNMENT','none','Float the widget to the left, right, or none',31,40,'2019-02-19 14:25:23','2019-02-19 14:25:23',NULL,'zen_cfg_select_option(array(\'none\', \'left\', \'right\'),',NULL),(570,'Layout Style','FACEBOOK_LIKE_BUTTON_LAYOUT_STYLE','standard','Select a layout style',31,50,'2019-02-19 14:25:23','2019-02-19 14:25:23',NULL,'zen_cfg_select_option(array(\'standard\', \'button_count\', \'box_count\'),',NULL),(571,'Show Faces','FACEBOOK_LIKE_BUTTON_SHOW_FACES','false','Specifies whether to display profile photos below the button (if true, set height to 80 or more; standard layout only)',31,60,'2019-02-19 14:25:23','2019-02-19 14:25:23',NULL,'zen_cfg_select_option(array(\'true\', \'false\'),',NULL),(572,'Action','FACEBOOK_LIKE_BUTTON_ACTION','like','The verb to display on the button',31,70,'2019-02-19 14:25:23','2019-02-19 14:25:23',NULL,'zen_cfg_select_option(array(\'like\', \'recommend\'),',NULL),(573,'Font','FACEBOOK_LIKE_BUTTON_FONT','arial','Select a font:',31,80,'2019-02-19 14:25:23','2019-02-19 14:25:23',NULL,'zen_cfg_select_option(array(\'arial\', \'lucida grande\', \'segoe ui\', \'tahoma\', \'trebuchet ms\', \'verdana\'),',NULL),(574,'Color Scheme','FACEBOOK_LIKE_BUTTON_COLOR_SCHEME','light','The color scheme for the like button',31,90,'2019-02-19 14:25:23','2019-02-19 14:25:23',NULL,'zen_cfg_select_option(array(\'light\', \'dark\'),',NULL),(575,'Width','FACEBOOK_LIKE_BUTTON_WIDTH','450','The width of the like button (standard => 450; button_count => 90; box_count => 55)',31,100,'2019-02-19 14:25:23','2019-02-19 14:25:23',NULL,NULL,NULL),(576,'Combined Send Button','FACEBOOK_LIKE_BUTTON_SEND','false','Create a combined Like and Send button?',31,110,'2019-02-19 14:25:23','2019-02-19 14:25:23',NULL,'zen_cfg_select_option(array(\'true\', \'false\'),',NULL),(606,'Minify CSS','MINIFY_STATUS_CSS','false','Minifying will speed up your site\'s loading speed by combining and compressing CSS files (valid CSS is required).',32,10,'2019-02-19 14:25:43','2019-02-19 14:25:43',NULL,'zen_cfg_select_option(array(\'true\', \'false\'),',NULL),(579,'Max URL Length','MINIFY_MAX_URL_LENGHT','500','On some servers the maximum length of any POST/GET request URL is limited. If this is the case for your server, you can change the setting here',32,20,'2019-02-19 14:25:23','2019-02-19 14:25:23',NULL,NULL,NULL),(580,'Minify Cache Time','MINIFY_CACHE_TIME_LENGHT','31536000','Set minify cache time (in second). Default is 1 year (31536000)',32,30,'2019-02-19 14:25:23','2019-02-19 14:25:23',NULL,NULL,NULL),(581,'Latest Cache Time','MINIFY_CACHE_TIME_LATEST','0','Normally you don\'t have to set this, but if you have just made changes to your js/css files and want to make sure they are reloaded right away, you can reset this to 0.',32,40,'2019-02-19 14:25:23','2019-02-19 14:25:23',NULL,NULL,NULL),(582,'Version','PIN_IT_BUTTON_VERSION','1.2.3','Version Installed:',33,0,'2019-02-19 14:25:23','2019-02-19 14:25:23',NULL,NULL,NULL),(583,'Enable Pinterest Button','PINTEREST_BUTTON_STATUS','false','Enable the Pinterest.com Pin It Button?',33,0,'2019-02-19 14:25:23','2019-02-19 14:25:23',NULL,'zen_cfg_select_option(array(\'true\', \'false\'),',NULL),(584,'Pinterest Button Count','PINTEREST_BUTTON_COUNT','none','Display the count horizontally, vertically, or disable (none)',33,10,'2019-02-19 14:25:23','2019-02-19 14:25:23',NULL,'zen_cfg_select_option(array(\'none\', \'vertical\', \'horizontal\'),',NULL),(585,'Pinterest Method','PINTEREST_BUTTON_METHOD','basic','Use the basic method (for single pin-it buttons per page) or the advanced method (for multiple buttons - asynchronous):',33,20,'2019-02-19 14:25:23','2019-02-19 14:25:23',NULL,'zen_cfg_select_option(array(\'basic\', \'advanced\'),',NULL),(586,'Version','TABLEAU_VERSION','1.6.9','Version installed:',34,0,'2019-02-19 14:25:23','2019-02-19 14:25:23',NULL,NULL,NULL),(587,'Product Listing - Layout Style','PRODUCT_LISTING_LAYOUT_STYLE','columns','Select the layout style:<br />Each product can be listed in its own row (rows option)\n                or products can be listed in multiple columns per row (columns option)<br />\n				If customer control is enabled this sets the default style.',8,41,NULL,'2019-02-19 14:25:23',NULL,'zen_cfg_select_option(array(\'rows\', \'columns\'),',NULL),(588,'Product Listing - Columns Per Row','PRODUCT_LISTING_COLUMNS_PER_ROW','4','Select the number of columns of products to show in each row in the product listing.  \n               The default setting is 3.',8,42,NULL,'2019-02-19 14:25:23',NULL,NULL,NULL),(589,'Product Listing - Layout Style - Customer Control','PRODUCT_LISTING_LAYOUT_STYLE_CUSTOMER','0','Allow the customer to select the layout style (0=no, 1=yes):',8,43,NULL,'2019-02-19 14:25:23',NULL,'zen_cfg_select_option(array(\'0\', \'1\'),',NULL),(590,'Product Listing - Show Sorter for Columns Layout','PRODUCT_LISTING_GRID_SORT','0','Allow the customer to select the item sort order (0=no, 1=yes):',8,44,NULL,'2019-02-19 14:25:23',NULL,'zen_cfg_select_option(array(\'0\', \'1\'),',NULL),(591,'Show Best Sellers on Main Page','SHOW_PRODUCT_INFO_MAIN_BEST_SELLERS','1','Show Best Sellers Products on Main Page<br />0= off or set ...',24,0,'2019-02-19 14:25:23','2019-02-19 14:25:23',NULL,'zen_cfg_select_option(array(\"0\", \"1\", \"2\", \"3\", \"4\"),',NULL),(592,'Version','GOOGLE_PLUS_ONE_VERSION','1.1.2','Version Installed:',36,0,'2019-02-19 14:25:23','2019-02-19 14:25:23',NULL,NULL,NULL),(593,'Enable Google Plus One Button','GOOGLE_PLUS_ONE_ENABLED','true','Enable the Google Plus One Button?',36,1,'2019-02-19 14:25:23','2019-02-19 14:25:23',NULL,'zen_cfg_select_option(array(\'true\', \'false\'),',NULL),(594,'Enabled Pages','GOOGLE_PLUS_ONE_PAGES','product_info, document_product_info, document_general_info','Specify the page names to enable or use * to enable for all pages:',36,2,'2019-02-19 14:25:23','2019-02-19 14:25:23',NULL,NULL,NULL),(595,'Parse','GOOGLE_PLUS_ONE_PARSE','Default (On Load)','Select the parse method:',36,10,'2019-02-19 14:25:23','2019-02-19 14:25:23',NULL,'zen_cfg_select_option(array(\'Default (On Load)\', \'Explicit\'),',NULL),(596,'Size','GOOGLE_PLUS_ONE_SIZE','Standard (24px)','Select the button size:',36,20,'2019-02-19 14:25:23','2019-02-19 14:25:23',NULL,'zen_cfg_select_option(array(\'Small (15px)\', \'Medium (20px)\', \'Standard (24px)\', \'Tall (60px)\'),',NULL),(597,'Language','GOOGLE_PLUS_ONE_LANGUAGE','English (US)','Select a language:',36,30,'2019-02-19 14:25:23','2019-02-19 14:25:23',NULL,'zen_cfg_select_option(array(\'Arabic\', \'Bulgarian\', \'Catalan\', \'Chinese (Simplified)\', \'Chinese (Traditional)\', \'Croatian\', \'Czech\', \'Danish\', \'Dutch\', \'English (US)\', \'English (UK)\', \'Estonian\', \'Filipino\', \'Finnish\', \'French\', \'German\', \'Greek\', \'Hebrew\', \'Hindi\', \'Hungarian\', \'Indonesian\', \'Italian\', \'Japanese\', \'Korean\', \'Latvian\', \'Malay\', \'Norwegian\', \'Persian\', \'Polish\', \'Portuguese (Brazil)\', \'Portuguese (Portugal)\', \'Romanian\', \'Russian\', \'Serbian\', \'Swedish\', \'Slovak\', \'Slovenian\', \'Spanish\', \'Spanish (Latin America)\', \'Thai\', \'Turkish\', \'Ukranian\', \'Vietnamese\'),',NULL),(598,'Callback','GOOGLE_PLUS_ONE_CALLBACK','','Optionally specify a callback function:',36,40,'2019-02-19 14:25:23','2019-02-19 14:25:23',NULL,NULL,NULL),(599,'Count','GOOGLE_PLUS_ONE_COUNT','true','Display the count?',36,50,'2019-02-19 14:25:23','2019-02-19 14:25:23',NULL,'zen_cfg_select_option(array(\'true\', \'false\'),',NULL),(600,'Version','NMX_DISK_CACHE_VERSION','1.2.0','Version installed:',37,0,'2019-02-19 14:25:23','2019-02-19 14:25:23',NULL,NULL,NULL),(601,'Status','NMX_DISK_CACHE_STATUS','false','Enable Numinix Disk Cache?',37,1,'2019-02-19 14:25:23','2019-02-19 14:25:23',NULL,'zen_cfg_select_option(array(\"true\", \"false\"),',NULL),(602,'Default Cache Time','NMX_DISK_CACHE_DEFAULT_TIME','3600','Set a default time limit in seconds for caching content.  Note: setting this option to 0 and not specifying an override in the code will disable the caching function.',37,2,'2019-02-19 14:25:23','2019-02-19 14:25:23',NULL,NULL,NULL),(603,'Default GZip Level','NMX_DISK_CACHE_DEFAULT_GZIP','0','Set to a value from 1 to 9 to enable gzip compression.  Leave as 0 or blank to disable.',37,3,'2019-02-19 14:25:23','2019-02-19 14:25:23',NULL,NULL,NULL),(604,'Cron Key','NMX_DISK_CACHE_KEY','numinix','Set a unique key to be used for executing the cron file.',37,4,'2019-02-19 14:25:23','2019-02-19 14:25:23',NULL,NULL,NULL),(605,'Reset Cache','NMX_DISK_CACHE_RESET','false','Manually force the cache to be reset?',37,99,'2019-02-19 14:25:23','2019-02-19 14:25:23',NULL,'zen_cfg_select_option(array(\"true\", \"false\"),',NULL),(607,'Minify JavaScript','MINIFY_STATUS_JS','false','Minifying will speed up your site\'s loading speed by combining and compressing JavaScript files (valid JavaScript is required).',32,10,'2019-02-19 14:25:43','2019-02-19 14:25:43',NULL,'zen_cfg_select_option(array(\'true\', \'false\'),',NULL),(626,'IH version','IH_VERSION','4.3.2','IH Version is stored but not shown on configuration menus',0,10000,'2019-02-19 15:36:05','2019-02-19 15:36:05',NULL,NULL,NULL),(627,'Show Queue in Admin header?','MODULE_ORDER_TOTAL_GV_SHOW_QUEUE_IN_ADMIN','true','Show Queue button on all pages of Admin?<br>(Will auto-hide if nothing in queue, and will auto-display on \'Orders\' screen, regardless of this setting)',6,3,NULL,'2019-02-19 20:19:12',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), ',NULL),(628,'Allow Gift Voucher Specials','MODULE_ORDER_TOTAL_GV_SPECIAL','false','Do you want to allow Gift Voucher to be placed on Special?',6,3,NULL,'2019-02-19 20:19:12',NULL,'zen_cfg_select_option(array(\'true\', \'false\'), ',NULL);
/*!40000 ALTER TABLE `configuration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `configuration_group`
--

DROP TABLE IF EXISTS `configuration_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `configuration_group` (
  `configuration_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `configuration_group_title` varchar(64) NOT NULL DEFAULT '',
  `configuration_group_description` varchar(255) NOT NULL DEFAULT '',
  `sort_order` int(5) DEFAULT NULL,
  `visible` int(1) DEFAULT '1',
  PRIMARY KEY (`configuration_group_id`),
  KEY `idx_visible_zen` (`visible`)
) ENGINE=MyISAM AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `configuration_group`
--

LOCK TABLES `configuration_group` WRITE;
/*!40000 ALTER TABLE `configuration_group` DISABLE KEYS */;
INSERT INTO `configuration_group` VALUES (1,'My Store','General information about my store',1,1),(2,'Minimum Values','The minimum values for functions / data',2,1),(3,'Maximum Values','The maximum values for functions / data',3,1),(4,'Images','Image parameters',4,1),(5,'Customer Details','Customer account configuration',5,1),(6,'Module Options','Hidden from configuration',6,0),(7,'Shipping/Packaging','Shipping options available at my store',7,1),(8,'Product Listing','Product Listing configuration options',8,1),(9,'Stock','Stock configuration options',9,1),(10,'Logging','Logging configuration options',10,1),(11,'Regulations','Regulation options',16,1),(12,'E-Mail Options','General settings for E-Mail transport and HTML E-Mails',12,1),(13,'Attribute Settings','Configure products attributes settings',13,1),(14,'GZip Compression','GZip compression options',14,1),(15,'Sessions','Session options',15,1),(16,'GV Coupons','Gift Vouchers and Coupons',16,1),(17,'Credit Cards','Credit Cards Accepted',17,1),(18,'Product Info','Product Info Display Options',18,1),(19,'Layout Settings','Layout Options',19,1),(20,'Website Maintenance','Website Maintenance Options',20,1),(21,'New Listing','New Products Listing',21,1),(22,'Featured Listing','Featured Products Listing',22,1),(23,'All Listing','All Products Listing',23,1),(24,'Index Listing','Index Products Listing',24,1),(25,'Define Page Status','Define Pages Options Settings',25,1),(30,'EZ-Pages Settings','EZ-Pages Settings',30,1),(31,'Facebook Like Button Configuration','Set Facebook Like Button Options',31,1),(32,'CSS/JS Loader Configuration','Set CSS/JS Loader Options',32,1),(33,'Pinterest Pin It Button Configuration','Set Pin It Button Options',33,1),(34,'Tableau','Set Tableau Options',34,1),(36,'Google Plus One Configuration','Set Google Plus One Button Options',36,1),(37,'Numinix Disk Cache Configuration','Set Numinix Disk Cache Options',37,1);
/*!40000 ALTER TABLE `configuration_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `counter`
--

DROP TABLE IF EXISTS `counter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `counter` (
  `startdate` char(8) DEFAULT NULL,
  `counter` int(12) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `counter`
--

LOCK TABLES `counter` WRITE;
/*!40000 ALTER TABLE `counter` DISABLE KEYS */;
INSERT INTO `counter` VALUES ('20190219',443);
/*!40000 ALTER TABLE `counter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `counter_history`
--

DROP TABLE IF EXISTS `counter_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `counter_history` (
  `startdate` char(8) NOT NULL DEFAULT '',
  `counter` int(12) DEFAULT NULL,
  `session_counter` int(12) DEFAULT NULL,
  PRIMARY KEY (`startdate`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `counter_history`
--

LOCK TABLES `counter_history` WRITE;
/*!40000 ALTER TABLE `counter_history` DISABLE KEYS */;
INSERT INTO `counter_history` VALUES ('20190219',370,14),('20190220',73,7);
/*!40000 ALTER TABLE `counter_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `countries` (
  `countries_id` int(11) NOT NULL AUTO_INCREMENT,
  `countries_name` varchar(64) NOT NULL DEFAULT '',
  `countries_iso_code_2` char(2) NOT NULL DEFAULT '',
  `countries_iso_code_3` char(3) NOT NULL DEFAULT '',
  `address_format_id` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`countries_id`),
  KEY `idx_countries_name_zen` (`countries_name`),
  KEY `idx_address_format_id_zen` (`address_format_id`),
  KEY `idx_iso_2_zen` (`countries_iso_code_2`),
  KEY `idx_iso_3_zen` (`countries_iso_code_3`)
) ENGINE=MyISAM AUTO_INCREMENT=249 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries`
--

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
INSERT INTO `countries` VALUES (240,'Åland Islands','AX','ALA',1,1),(1,'Afghanistan','AF','AFG',1,1),(2,'Albania','AL','ALB',1,1),(3,'Algeria','DZ','DZA',1,1),(4,'American Samoa','AS','ASM',1,1),(5,'Andorra','AD','AND',1,1),(6,'Angola','AO','AGO',1,1),(7,'Anguilla','AI','AIA',1,1),(8,'Antarctica','AQ','ATA',1,1),(9,'Antigua and Barbuda','AG','ATG',1,1),(10,'Argentina','AR','ARG',1,1),(11,'Armenia','AM','ARM',1,1),(12,'Aruba','AW','ABW',1,1),(13,'Australia','AU','AUS',7,1),(14,'Austria','AT','AUT',5,1),(15,'Azerbaijan','AZ','AZE',1,1),(16,'Bahamas','BS','BHS',1,1),(17,'Bahrain','BH','BHR',1,1),(18,'Bangladesh','BD','BGD',1,1),(19,'Barbados','BB','BRB',1,1),(20,'Belarus','BY','BLR',1,1),(21,'Belgium','BE','BEL',5,1),(22,'Belize','BZ','BLZ',1,1),(23,'Benin','BJ','BEN',1,1),(24,'Bermuda','BM','BMU',1,1),(25,'Bhutan','BT','BTN',1,1),(26,'Bolivia','BO','BOL',1,1),(27,'Bosnia and Herzegowina','BA','BIH',1,1),(28,'Botswana','BW','BWA',1,1),(29,'Bouvet Island','BV','BVT',1,1),(30,'Brazil','BR','BRA',1,1),(31,'British Indian Ocean Territory','IO','IOT',1,1),(32,'Brunei Darussalam','BN','BRN',1,1),(33,'Bulgaria','BG','BGR',1,1),(34,'Burkina Faso','BF','BFA',1,1),(35,'Burundi','BI','BDI',1,1),(36,'Cambodia','KH','KHM',1,1),(37,'Cameroon','CM','CMR',1,1),(38,'Canada','CA','CAN',2,1),(39,'Cape Verde','CV','CPV',1,1),(40,'Cayman Islands','KY','CYM',1,1),(41,'Central African Republic','CF','CAF',1,1),(42,'Chad','TD','TCD',1,1),(43,'Chile','CL','CHL',1,1),(44,'China','CN','CHN',1,1),(45,'Christmas Island','CX','CXR',1,1),(46,'Cocos (Keeling) Islands','CC','CCK',1,1),(47,'Colombia','CO','COL',1,1),(48,'Comoros','KM','COM',1,1),(49,'Congo','CG','COG',1,1),(50,'Cook Islands','CK','COK',1,1),(51,'Costa Rica','CR','CRI',1,1),(52,'Côte d\'Ivoire','CI','CIV',1,1),(53,'Croatia','HR','HRV',1,1),(54,'Cuba','CU','CUB',1,1),(55,'Cyprus','CY','CYP',1,1),(56,'Czech Republic','CZ','CZE',1,1),(57,'Denmark','DK','DNK',1,1),(58,'Djibouti','DJ','DJI',1,1),(59,'Dominica','DM','DMA',1,1),(60,'Dominican Republic','DO','DOM',1,1),(61,'Timor-Leste','TL','TLS',1,1),(62,'Ecuador','EC','ECU',1,1),(63,'Egypt','EG','EGY',1,1),(64,'El Salvador','SV','SLV',1,1),(65,'Equatorial Guinea','GQ','GNQ',1,1),(66,'Eritrea','ER','ERI',1,1),(67,'Estonia','EE','EST',1,1),(68,'Ethiopia','ET','ETH',1,1),(69,'Falkland Islands (Malvinas)','FK','FLK',1,1),(70,'Faroe Islands','FO','FRO',1,1),(71,'Fiji','FJ','FJI',1,1),(72,'Finland','FI','FIN',1,1),(73,'France','FR','FRA',1,1),(75,'French Guiana','GF','GUF',1,1),(76,'French Polynesia','PF','PYF',1,1),(77,'French Southern Territories','TF','ATF',1,1),(78,'Gabon','GA','GAB',1,1),(79,'Gambia','GM','GMB',1,1),(80,'Georgia','GE','GEO',1,1),(81,'Germany','DE','DEU',5,1),(82,'Ghana','GH','GHA',1,1),(83,'Gibraltar','GI','GIB',1,1),(84,'Greece','GR','GRC',1,1),(85,'Greenland','GL','GRL',1,1),(86,'Grenada','GD','GRD',1,1),(87,'Guadeloupe','GP','GLP',1,1),(88,'Guam','GU','GUM',1,1),(89,'Guatemala','GT','GTM',1,1),(90,'Guinea','GN','GIN',1,1),(91,'Guinea-bissau','GW','GNB',1,1),(92,'Guyana','GY','GUY',1,1),(93,'Haiti','HT','HTI',1,1),(94,'Heard and Mc Donald Islands','HM','HMD',1,1),(95,'Honduras','HN','HND',1,1),(96,'Hong Kong','HK','HKG',1,1),(97,'Hungary','HU','HUN',1,1),(98,'Iceland','IS','ISL',1,1),(99,'India','IN','IND',1,1),(100,'Indonesia','ID','IDN',1,1),(101,'Iran (Islamic Republic of)','IR','IRN',1,1),(102,'Iraq','IQ','IRQ',1,1),(103,'Ireland','IE','IRL',1,1),(104,'Israel','IL','ISR',1,1),(105,'Italy','IT','ITA',1,1),(106,'Jamaica','JM','JAM',1,1),(107,'Japan','JP','JPN',1,1),(108,'Jordan','JO','JOR',1,1),(109,'Kazakhstan','KZ','KAZ',1,1),(110,'Kenya','KE','KEN',1,1),(111,'Kiribati','KI','KIR',1,1),(112,'Korea, Democratic People\'s Republic of','KP','PRK',1,1),(113,'Korea, Republic of','KR','KOR',1,1),(114,'Kuwait','KW','KWT',1,1),(115,'Kyrgyzstan','KG','KGZ',1,1),(116,'Lao People\'s Democratic Republic','LA','LAO',1,1),(117,'Latvia','LV','LVA',1,1),(118,'Lebanon','LB','LBN',1,1),(119,'Lesotho','LS','LSO',1,1),(120,'Liberia','LR','LBR',1,1),(121,'Libya','LY','LBY',1,1),(122,'Liechtenstein','LI','LIE',1,1),(123,'Lithuania','LT','LTU',1,1),(124,'Luxembourg','LU','LUX',1,1),(125,'Macao','MO','MAC',1,1),(126,'Macedonia, The Former Yugoslav Republic of','MK','MKD',1,1),(127,'Madagascar','MG','MDG',1,1),(128,'Malawi','MW','MWI',1,1),(129,'Malaysia','MY','MYS',1,1),(130,'Maldives','MV','MDV',1,1),(131,'Mali','ML','MLI',1,1),(132,'Malta','MT','MLT',1,1),(133,'Marshall Islands','MH','MHL',1,1),(134,'Martinique','MQ','MTQ',1,1),(135,'Mauritania','MR','MRT',1,1),(136,'Mauritius','MU','MUS',1,1),(137,'Mayotte','YT','MYT',1,1),(138,'Mexico','MX','MEX',1,1),(139,'Micronesia, Federated States of','FM','FSM',1,1),(140,'Moldova','MD','MDA',1,1),(141,'Monaco','MC','MCO',1,1),(142,'Mongolia','MN','MNG',1,1),(143,'Montserrat','MS','MSR',1,1),(144,'Morocco','MA','MAR',1,1),(145,'Mozambique','MZ','MOZ',1,1),(146,'Myanmar','MM','MMR',1,1),(147,'Namibia','NA','NAM',1,1),(148,'Nauru','NR','NRU',1,1),(149,'Nepal','NP','NPL',1,1),(150,'Netherlands','NL','NLD',5,1),(151,'Bonaire, Sint Eustatius and Saba','BQ','BES',1,1),(152,'New Caledonia','NC','NCL',1,1),(153,'New Zealand','NZ','NZL',1,1),(154,'Nicaragua','NI','NIC',1,1),(155,'Niger','NE','NER',1,1),(156,'Nigeria','NG','NGA',1,1),(157,'Niue','NU','NIU',1,1),(158,'Norfolk Island','NF','NFK',1,1),(159,'Northern Mariana Islands','MP','MNP',1,1),(160,'Norway','NO','NOR',1,1),(161,'Oman','OM','OMN',1,1),(162,'Pakistan','PK','PAK',1,1),(163,'Palau','PW','PLW',1,1),(164,'Panama','PA','PAN',1,1),(165,'Papua New Guinea','PG','PNG',1,1),(166,'Paraguay','PY','PRY',1,1),(167,'Peru','PE','PER',1,1),(168,'Philippines','PH','PHL',1,1),(169,'Pitcairn','PN','PCN',1,1),(170,'Poland','PL','POL',1,1),(171,'Portugal','PT','PRT',1,1),(172,'Puerto Rico','PR','PRI',1,1),(173,'Qatar','QA','QAT',1,1),(174,'Réunion','RE','REU',1,1),(175,'Romania','RO','ROU',1,1),(176,'Russian Federation','RU','RUS',1,1),(177,'Rwanda','RW','RWA',1,1),(178,'Saint Kitts and Nevis','KN','KNA',1,1),(179,'Saint Lucia','LC','LCA',1,1),(180,'Saint Vincent and the Grenadines','VC','VCT',1,1),(181,'Samoa','WS','WSM',1,1),(182,'San Marino','SM','SMR',1,1),(183,'Sao Tome and Principe','ST','STP',1,1),(184,'Saudi Arabia','SA','SAU',1,1),(185,'Senegal','SN','SEN',1,1),(186,'Seychelles','SC','SYC',1,1),(187,'Sierra Leone','SL','SLE',1,1),(188,'Singapore','SG','SGP',4,1),(189,'Slovakia (Slovak Republic)','SK','SVK',1,1),(190,'Slovenia','SI','SVN',1,1),(191,'Solomon Islands','SB','SLB',1,1),(192,'Somalia','SO','SOM',1,1),(193,'South Africa','ZA','ZAF',1,1),(194,'South Georgia and the South Sandwich Islands','GS','SGS',1,1),(195,'Spain','ES','ESP',3,1),(196,'Sri Lanka','LK','LKA',1,1),(197,'St. Helena','SH','SHN',1,1),(198,'St. Pierre and Miquelon','PM','SPM',1,1),(199,'Sudan','SD','SDN',1,1),(200,'Suriname','SR','SUR',1,1),(201,'Svalbard and Jan Mayen Islands','SJ','SJM',1,1),(202,'Swaziland','SZ','SWZ',1,1),(203,'Sweden','SE','SWE',5,1),(204,'Switzerland','CH','CHE',1,1),(205,'Syrian Arab Republic','SY','SYR',1,1),(206,'Taiwan','TW','TWN',1,1),(207,'Tajikistan','TJ','TJK',1,1),(208,'Tanzania, United Republic of','TZ','TZA',1,1),(209,'Thailand','TH','THA',1,1),(210,'Togo','TG','TGO',1,1),(211,'Tokelau','TK','TKL',1,1),(212,'Tonga','TO','TON',1,1),(213,'Trinidad and Tobago','TT','TTO',1,1),(214,'Tunisia','TN','TUN',1,1),(215,'Turkey','TR','TUR',1,1),(216,'Turkmenistan','TM','TKM',1,1),(217,'Turks and Caicos Islands','TC','TCA',1,1),(218,'Tuvalu','TV','TUV',1,1),(219,'Uganda','UG','UGA',1,1),(220,'Ukraine','UA','UKR',1,1),(221,'United Arab Emirates','AE','ARE',1,1),(222,'United Kingdom','GB','GBR',6,1),(223,'United States','US','USA',2,1),(224,'United States Minor Outlying Islands','UM','UMI',1,1),(225,'Uruguay','UY','URY',1,1),(226,'Uzbekistan','UZ','UZB',1,1),(227,'Vanuatu','VU','VUT',1,1),(228,'Vatican City State (Holy See)','VA','VAT',1,1),(229,'Venezuela','VE','VEN',1,1),(230,'Viet Nam','VN','VNM',1,1),(231,'Virgin Islands (British)','VG','VGB',1,1),(232,'Virgin Islands (U.S.)','VI','VIR',1,1),(233,'Wallis and Futuna Islands','WF','WLF',1,1),(234,'Western Sahara','EH','ESH',1,1),(235,'Yemen','YE','YEM',1,1),(236,'Serbia','RS','SRB',1,1),(238,'Zambia','ZM','ZMB',1,1),(239,'Zimbabwe','ZW','ZWE',1,1),(241,'Palestine, State of','PS','PSE',1,1),(242,'Montenegro','ME','MNE',1,1),(243,'Guernsey','GG','GGY',1,1),(244,'Isle of Man','IM','IMN',1,1),(245,'Jersey','JE','JEY',1,1),(246,'South Sudan','SS','SSD',1,1),(247,'Curaçao','CW','CUW',1,1),(248,'Sint Maarten (Dutch part)','SX','SXM',1,1);
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coupon_email_track`
--

DROP TABLE IF EXISTS `coupon_email_track`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coupon_email_track` (
  `unique_id` int(11) NOT NULL AUTO_INCREMENT,
  `coupon_id` int(11) NOT NULL DEFAULT '0',
  `customer_id_sent` int(11) NOT NULL DEFAULT '0',
  `sent_firstname` varchar(32) DEFAULT NULL,
  `sent_lastname` varchar(32) DEFAULT NULL,
  `emailed_to` varchar(32) DEFAULT NULL,
  `date_sent` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  PRIMARY KEY (`unique_id`),
  KEY `idx_coupon_id_zen` (`coupon_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coupon_email_track`
--

LOCK TABLES `coupon_email_track` WRITE;
/*!40000 ALTER TABLE `coupon_email_track` DISABLE KEYS */;
/*!40000 ALTER TABLE `coupon_email_track` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coupon_gv_customer`
--

DROP TABLE IF EXISTS `coupon_gv_customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coupon_gv_customer` (
  `customer_id` int(5) NOT NULL DEFAULT '0',
  `amount` decimal(15,4) NOT NULL DEFAULT '0.0000',
  PRIMARY KEY (`customer_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coupon_gv_customer`
--

LOCK TABLES `coupon_gv_customer` WRITE;
/*!40000 ALTER TABLE `coupon_gv_customer` DISABLE KEYS */;
/*!40000 ALTER TABLE `coupon_gv_customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coupon_gv_queue`
--

DROP TABLE IF EXISTS `coupon_gv_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coupon_gv_queue` (
  `unique_id` int(5) NOT NULL AUTO_INCREMENT,
  `customer_id` int(5) NOT NULL DEFAULT '0',
  `order_id` int(5) NOT NULL DEFAULT '0',
  `amount` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `date_created` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `ipaddr` varchar(45) NOT NULL DEFAULT '',
  `release_flag` char(1) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`unique_id`),
  KEY `idx_cust_id_order_id_zen` (`customer_id`,`order_id`),
  KEY `idx_release_flag_zen` (`release_flag`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coupon_gv_queue`
--

LOCK TABLES `coupon_gv_queue` WRITE;
/*!40000 ALTER TABLE `coupon_gv_queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `coupon_gv_queue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coupon_redeem_track`
--

DROP TABLE IF EXISTS `coupon_redeem_track`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coupon_redeem_track` (
  `unique_id` int(11) NOT NULL AUTO_INCREMENT,
  `coupon_id` int(11) NOT NULL DEFAULT '0',
  `customer_id` int(11) NOT NULL DEFAULT '0',
  `redeem_date` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `redeem_ip` varchar(45) NOT NULL DEFAULT '',
  `order_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`unique_id`),
  KEY `idx_coupon_id_zen` (`coupon_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coupon_redeem_track`
--

LOCK TABLES `coupon_redeem_track` WRITE;
/*!40000 ALTER TABLE `coupon_redeem_track` DISABLE KEYS */;
/*!40000 ALTER TABLE `coupon_redeem_track` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coupon_restrict`
--

DROP TABLE IF EXISTS `coupon_restrict`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coupon_restrict` (
  `restrict_id` int(11) NOT NULL AUTO_INCREMENT,
  `coupon_id` int(11) NOT NULL DEFAULT '0',
  `product_id` int(11) NOT NULL DEFAULT '0',
  `category_id` int(11) NOT NULL DEFAULT '0',
  `coupon_restrict` char(1) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`restrict_id`),
  KEY `idx_coup_id_prod_id_zen` (`coupon_id`,`product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coupon_restrict`
--

LOCK TABLES `coupon_restrict` WRITE;
/*!40000 ALTER TABLE `coupon_restrict` DISABLE KEYS */;
/*!40000 ALTER TABLE `coupon_restrict` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coupons`
--

DROP TABLE IF EXISTS `coupons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coupons` (
  `coupon_id` int(11) NOT NULL AUTO_INCREMENT,
  `coupon_type` char(1) NOT NULL DEFAULT 'F',
  `coupon_code` varchar(32) NOT NULL DEFAULT '',
  `coupon_amount` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `coupon_minimum_order` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `coupon_start_date` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `coupon_expire_date` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `uses_per_coupon` int(5) NOT NULL DEFAULT '1',
  `uses_per_user` int(5) NOT NULL DEFAULT '0',
  `restrict_to_products` varchar(255) DEFAULT NULL,
  `restrict_to_categories` varchar(255) DEFAULT NULL,
  `restrict_to_customers` text,
  `coupon_active` char(1) NOT NULL DEFAULT 'Y',
  `date_created` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `date_modified` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `coupon_zone_restriction` int(11) NOT NULL DEFAULT '0',
  `coupon_calc_base` tinyint(1) NOT NULL DEFAULT '0',
  `coupon_order_limit` int(4) NOT NULL DEFAULT '0',
  `coupon_is_valid_for_sales` tinyint(1) NOT NULL DEFAULT '1',
  `coupon_product_count` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`coupon_id`),
  KEY `idx_active_type_zen` (`coupon_active`,`coupon_type`),
  KEY `idx_coupon_code_zen` (`coupon_code`),
  KEY `idx_coupon_type_zen` (`coupon_type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coupons`
--

LOCK TABLES `coupons` WRITE;
/*!40000 ALTER TABLE `coupons` DISABLE KEYS */;
/*!40000 ALTER TABLE `coupons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coupons_description`
--

DROP TABLE IF EXISTS `coupons_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coupons_description` (
  `coupon_id` int(11) NOT NULL DEFAULT '0',
  `language_id` int(11) NOT NULL DEFAULT '0',
  `coupon_name` varchar(64) NOT NULL DEFAULT '',
  `coupon_description` text,
  PRIMARY KEY (`coupon_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coupons_description`
--

LOCK TABLES `coupons_description` WRITE;
/*!40000 ALTER TABLE `coupons_description` DISABLE KEYS */;
/*!40000 ALTER TABLE `coupons_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `currencies`
--

DROP TABLE IF EXISTS `currencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `currencies` (
  `currencies_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(32) NOT NULL DEFAULT '',
  `code` char(3) NOT NULL DEFAULT '',
  `symbol_left` varchar(32) DEFAULT NULL,
  `symbol_right` varchar(32) DEFAULT NULL,
  `decimal_point` char(1) DEFAULT NULL,
  `thousands_point` char(1) DEFAULT NULL,
  `decimal_places` char(1) DEFAULT NULL,
  `value` float(13,8) DEFAULT NULL,
  `last_updated` datetime DEFAULT NULL,
  PRIMARY KEY (`currencies_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currencies`
--

LOCK TABLES `currencies` WRITE;
/*!40000 ALTER TABLE `currencies` DISABLE KEYS */;
INSERT INTO `currencies` VALUES (1,'US Dollar','USD','$','','.',',','2',1.00000000,'2019-02-19 14:19:13'),(2,'Euro','EUR','&euro;','','.',',','2',0.77300000,'2019-02-19 14:19:13'),(3,'GB Pound','GBP','&pound;','','.',',','2',0.67259997,'2019-02-19 14:19:13'),(4,'Canadian Dollar','CAD','$','','.',',','2',1.10420001,'2019-02-19 14:19:13'),(5,'Australian Dollar','AUD','$','','.',',','2',1.17890000,'2019-02-19 14:19:13');
/*!40000 ALTER TABLE `currencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customers` (
  `customers_id` int(11) NOT NULL AUTO_INCREMENT,
  `customers_gender` char(1) NOT NULL DEFAULT '',
  `customers_firstname` varchar(32) NOT NULL DEFAULT '',
  `customers_lastname` varchar(32) NOT NULL DEFAULT '',
  `customers_dob` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `customers_email_address` varchar(96) NOT NULL DEFAULT '',
  `customers_nick` varchar(96) NOT NULL DEFAULT '',
  `customers_default_address_id` int(11) NOT NULL DEFAULT '0',
  `customers_telephone` varchar(32) NOT NULL DEFAULT '',
  `customers_fax` varchar(32) DEFAULT NULL,
  `customers_password` varchar(255) NOT NULL DEFAULT '',
  `customers_newsletter` char(1) DEFAULT NULL,
  `customers_group_pricing` int(11) NOT NULL DEFAULT '0',
  `customers_email_format` varchar(4) NOT NULL DEFAULT 'TEXT',
  `customers_authorization` int(1) NOT NULL DEFAULT '0',
  `customers_referral` varchar(32) NOT NULL DEFAULT '',
  `customers_paypal_payerid` varchar(20) NOT NULL DEFAULT '',
  `customers_paypal_ec` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`customers_id`),
  KEY `idx_email_address_zen` (`customers_email_address`),
  KEY `idx_referral_zen` (`customers_referral`(10)),
  KEY `idx_grp_pricing_zen` (`customers_group_pricing`),
  KEY `idx_nick_zen` (`customers_nick`),
  KEY `idx_newsletter_zen` (`customers_newsletter`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'','kyeongsang','yu','0001-01-01 00:00:00','21300875@handong.edu','',1,'9498291691','','$2y$10$/TE7/Fx/YsFuxmX.Qfs8POORR71gd5V2RaOLpD8AQyCm9DN15Jdly','0',0,'TEXT',0,'','',0),(2,'','Joanne','Jo','0001-01-01 00:00:00','21700696@handong.edu','',2,'9493729720','','$2y$10$eW/GiWl0TgVCRAg.4hhareOdKgXdfozF6FCRUv9jNfV6sdsSOv6we','0',0,'TEXT',0,'','',0);
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers_basket`
--

DROP TABLE IF EXISTS `customers_basket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customers_basket` (
  `customers_basket_id` int(11) NOT NULL AUTO_INCREMENT,
  `customers_id` int(11) NOT NULL DEFAULT '0',
  `products_id` tinytext NOT NULL,
  `customers_basket_quantity` float NOT NULL DEFAULT '0',
  `customers_basket_date_added` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`customers_basket_id`),
  KEY `idx_customers_id_zen` (`customers_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers_basket`
--

LOCK TABLES `customers_basket` WRITE;
/*!40000 ALTER TABLE `customers_basket` DISABLE KEYS */;
/*!40000 ALTER TABLE `customers_basket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers_basket_attributes`
--

DROP TABLE IF EXISTS `customers_basket_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customers_basket_attributes` (
  `customers_basket_attributes_id` int(11) NOT NULL AUTO_INCREMENT,
  `customers_id` int(11) NOT NULL DEFAULT '0',
  `products_id` tinytext NOT NULL,
  `products_options_id` varchar(64) NOT NULL DEFAULT '0',
  `products_options_value_id` int(11) NOT NULL DEFAULT '0',
  `products_options_value_text` blob,
  `products_options_sort_order` text NOT NULL,
  PRIMARY KEY (`customers_basket_attributes_id`),
  KEY `idx_cust_id_prod_id_zen` (`customers_id`,`products_id`(36))
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers_basket_attributes`
--

LOCK TABLES `customers_basket_attributes` WRITE;
/*!40000 ALTER TABLE `customers_basket_attributes` DISABLE KEYS */;
/*!40000 ALTER TABLE `customers_basket_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers_info`
--

DROP TABLE IF EXISTS `customers_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customers_info` (
  `customers_info_id` int(11) NOT NULL DEFAULT '0',
  `customers_info_date_of_last_logon` datetime DEFAULT NULL,
  `customers_info_number_of_logons` int(5) DEFAULT NULL,
  `customers_info_date_account_created` datetime DEFAULT NULL,
  `customers_info_date_account_last_modified` datetime DEFAULT NULL,
  `global_product_notifications` int(1) DEFAULT '0',
  PRIMARY KEY (`customers_info_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers_info`
--

LOCK TABLES `customers_info` WRITE;
/*!40000 ALTER TABLE `customers_info` DISABLE KEYS */;
INSERT INTO `customers_info` VALUES (1,'2019-02-19 22:48:31',2,'2019-02-19 19:48:21',NULL,0),(2,'2019-02-20 10:32:47',1,'2019-02-20 10:32:47',NULL,0);
/*!40000 ALTER TABLE `customers_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `db_cache`
--

DROP TABLE IF EXISTS `db_cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `db_cache` (
  `cache_entry_name` varchar(64) NOT NULL DEFAULT '',
  `cache_data` mediumblob,
  `cache_entry_created` int(15) DEFAULT NULL,
  PRIMARY KEY (`cache_entry_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `db_cache`
--

LOCK TABLES `db_cache` WRITE;
/*!40000 ALTER TABLE `db_cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `db_cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_archive`
--

DROP TABLE IF EXISTS `email_archive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email_archive` (
  `archive_id` int(11) NOT NULL AUTO_INCREMENT,
  `email_to_name` varchar(96) NOT NULL DEFAULT '',
  `email_to_address` varchar(96) NOT NULL DEFAULT '',
  `email_from_name` varchar(96) NOT NULL DEFAULT '',
  `email_from_address` varchar(96) NOT NULL DEFAULT '',
  `email_subject` varchar(255) NOT NULL DEFAULT '',
  `email_html` text NOT NULL,
  `email_text` text NOT NULL,
  `date_sent` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `module` varchar(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`archive_id`),
  KEY `idx_email_to_address_zen` (`email_to_address`),
  KEY `idx_module_zen` (`module`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_archive`
--

LOCK TABLES `email_archive` WRITE;
/*!40000 ALTER TABLE `email_archive` DISABLE KEYS */;
/*!40000 ALTER TABLE `email_archive` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezpages`
--

DROP TABLE IF EXISTS `ezpages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezpages` (
  `pages_id` int(11) NOT NULL AUTO_INCREMENT,
  `alt_url` varchar(255) NOT NULL DEFAULT '',
  `alt_url_external` varchar(255) NOT NULL DEFAULT '',
  `status_header` int(1) NOT NULL DEFAULT '1',
  `status_sidebox` int(1) NOT NULL DEFAULT '1',
  `status_footer` int(1) NOT NULL DEFAULT '1',
  `status_visible` int(1) NOT NULL DEFAULT '0',
  `status_toc` int(1) NOT NULL DEFAULT '1',
  `header_sort_order` int(3) NOT NULL DEFAULT '0',
  `sidebox_sort_order` int(3) NOT NULL DEFAULT '0',
  `footer_sort_order` int(3) NOT NULL DEFAULT '0',
  `toc_sort_order` int(3) NOT NULL DEFAULT '0',
  `page_open_new_window` int(1) NOT NULL DEFAULT '0',
  `page_is_ssl` int(1) NOT NULL DEFAULT '0',
  `toc_chapter` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`pages_id`),
  KEY `idx_ezp_status_header_zen` (`status_header`),
  KEY `idx_ezp_status_sidebox_zen` (`status_sidebox`),
  KEY `idx_ezp_status_footer_zen` (`status_footer`),
  KEY `idx_ezp_status_toc_zen` (`status_toc`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezpages`
--

LOCK TABLES `ezpages` WRITE;
/*!40000 ALTER TABLE `ezpages` DISABLE KEYS */;
/*!40000 ALTER TABLE `ezpages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezpages_content`
--

DROP TABLE IF EXISTS `ezpages_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezpages_content` (
  `pages_id` int(11) NOT NULL DEFAULT '0',
  `languages_id` int(11) NOT NULL DEFAULT '1',
  `pages_title` varchar(64) NOT NULL DEFAULT '',
  `pages_html_text` text,
  UNIQUE KEY `idx_ezpages_content` (`pages_id`,`languages_id`),
  KEY `idx_lang_id_zen` (`languages_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezpages_content`
--

LOCK TABLES `ezpages_content` WRITE;
/*!40000 ALTER TABLE `ezpages_content` DISABLE KEYS */;
/*!40000 ALTER TABLE `ezpages_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `featured`
--

DROP TABLE IF EXISTS `featured`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `featured` (
  `featured_id` int(11) NOT NULL AUTO_INCREMENT,
  `products_id` int(11) NOT NULL DEFAULT '0',
  `featured_date_added` datetime DEFAULT NULL,
  `featured_last_modified` datetime DEFAULT NULL,
  `expires_date` date NOT NULL DEFAULT '0001-01-01',
  `date_status_change` datetime DEFAULT NULL,
  `status` int(1) NOT NULL DEFAULT '1',
  `featured_date_available` date NOT NULL DEFAULT '0001-01-01',
  PRIMARY KEY (`featured_id`),
  KEY `idx_status_zen` (`status`),
  KEY `idx_products_id_zen` (`products_id`),
  KEY `idx_date_avail_zen` (`featured_date_available`),
  KEY `idx_expires_date_zen` (`expires_date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `featured`
--

LOCK TABLES `featured` WRITE;
/*!40000 ALTER TABLE `featured` DISABLE KEYS */;
/*!40000 ALTER TABLE `featured` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `files_uploaded`
--

DROP TABLE IF EXISTS `files_uploaded`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `files_uploaded` (
  `files_uploaded_id` int(11) NOT NULL AUTO_INCREMENT,
  `sesskey` varchar(32) DEFAULT NULL,
  `customers_id` int(11) DEFAULT NULL,
  `files_uploaded_name` varchar(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`files_uploaded_id`),
  KEY `idx_customers_id_zen` (`customers_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COMMENT='Must always have either a sesskey or customers_id';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `files_uploaded`
--

LOCK TABLES `files_uploaded` WRITE;
/*!40000 ALTER TABLE `files_uploaded` DISABLE KEYS */;
/*!40000 ALTER TABLE `files_uploaded` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `geo_zones`
--

DROP TABLE IF EXISTS `geo_zones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `geo_zones` (
  `geo_zone_id` int(11) NOT NULL AUTO_INCREMENT,
  `geo_zone_name` varchar(32) NOT NULL DEFAULT '',
  `geo_zone_description` varchar(255) NOT NULL DEFAULT '',
  `last_modified` datetime DEFAULT NULL,
  `date_added` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  PRIMARY KEY (`geo_zone_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `geo_zones`
--

LOCK TABLES `geo_zones` WRITE;
/*!40000 ALTER TABLE `geo_zones` DISABLE KEYS */;
INSERT INTO `geo_zones` VALUES (1,'Florida','Florida local sales tax zone',NULL,'2019-02-19 14:19:13');
/*!40000 ALTER TABLE `geo_zones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `get_terms_to_filter`
--

DROP TABLE IF EXISTS `get_terms_to_filter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `get_terms_to_filter` (
  `get_term_name` varchar(191) NOT NULL DEFAULT '',
  `get_term_table` varchar(64) NOT NULL,
  `get_term_name_field` varchar(64) NOT NULL,
  PRIMARY KEY (`get_term_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `get_terms_to_filter`
--

LOCK TABLES `get_terms_to_filter` WRITE;
/*!40000 ALTER TABLE `get_terms_to_filter` DISABLE KEYS */;
INSERT INTO `get_terms_to_filter` VALUES ('manufacturers_id','TABLE_MANUFACTURERS','manufacturers_name'),('music_genre_id','TABLE_MUSIC_GENRE','music_genre_name'),('record_company_id','TABLE_RECORD_COMPANY','record_company_name');
/*!40000 ALTER TABLE `get_terms_to_filter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_pricing`
--

DROP TABLE IF EXISTS `group_pricing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_pricing` (
  `group_id` int(11) NOT NULL AUTO_INCREMENT,
  `group_name` varchar(32) NOT NULL DEFAULT '',
  `group_percentage` decimal(5,2) NOT NULL DEFAULT '0.00',
  `last_modified` datetime DEFAULT NULL,
  `date_added` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  PRIMARY KEY (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_pricing`
--

LOCK TABLES `group_pricing` WRITE;
/*!40000 ALTER TABLE `group_pricing` DISABLE KEYS */;
/*!40000 ALTER TABLE `group_pricing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `languages`
--

DROP TABLE IF EXISTS `languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `languages` (
  `languages_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL DEFAULT '',
  `code` char(2) NOT NULL DEFAULT '',
  `image` varchar(64) DEFAULT NULL,
  `directory` varchar(32) DEFAULT NULL,
  `sort_order` int(3) DEFAULT NULL,
  PRIMARY KEY (`languages_id`),
  KEY `idx_languages_name_zen` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `languages`
--

LOCK TABLES `languages` WRITE;
/*!40000 ALTER TABLE `languages` DISABLE KEYS */;
INSERT INTO `languages` VALUES (1,'English','en','icon.gif','english',1);
/*!40000 ALTER TABLE `languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `layout_boxes`
--

DROP TABLE IF EXISTS `layout_boxes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `layout_boxes` (
  `layout_id` int(11) NOT NULL AUTO_INCREMENT,
  `layout_template` varchar(64) NOT NULL DEFAULT '',
  `layout_box_name` varchar(64) NOT NULL DEFAULT '',
  `layout_box_status` tinyint(1) NOT NULL DEFAULT '0',
  `layout_box_location` tinyint(1) NOT NULL DEFAULT '0',
  `layout_box_sort_order` int(11) NOT NULL DEFAULT '0',
  `layout_box_sort_order_single` int(11) NOT NULL DEFAULT '0',
  `layout_box_status_single` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`layout_id`),
  KEY `idx_name_template_zen` (`layout_template`,`layout_box_name`),
  KEY `idx_layout_box_status_zen` (`layout_box_status`),
  KEY `idx_layout_box_sort_order_zen` (`layout_box_sort_order`)
) ENGINE=MyISAM AUTO_INCREMENT=125 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `layout_boxes`
--

LOCK TABLES `layout_boxes` WRITE;
/*!40000 ALTER TABLE `layout_boxes` DISABLE KEYS */;
INSERT INTO `layout_boxes` VALUES (1,'default_template_settings','banner_box_all.php',1,1,5,0,0),(2,'default_template_settings','banner_box.php',1,0,300,1,127),(3,'default_template_settings','banner_box2.php',1,1,15,1,15),(4,'default_template_settings','best_sellers.php',1,1,30,70,1),(5,'default_template_settings','categories.php',1,0,10,10,1),(6,'default_template_settings','currencies.php',0,1,80,60,0),(7,'default_template_settings','document_categories.php',1,0,0,0,0),(8,'default_template_settings','ezpages.php',1,1,-1,2,1),(9,'default_template_settings','featured.php',1,0,45,0,0),(10,'default_template_settings','information.php',1,0,50,40,1),(11,'default_template_settings','languages.php',0,1,70,50,0),(12,'default_template_settings','manufacturers.php',1,0,30,20,1),(13,'default_template_settings','manufacturer_info.php',1,1,35,95,1),(14,'default_template_settings','more_information.php',1,0,200,200,1),(15,'default_template_settings','music_genres.php',1,1,0,0,0),(16,'default_template_settings','order_history.php',1,1,0,0,0),(17,'default_template_settings','product_notifications.php',1,1,55,85,1),(18,'default_template_settings','record_companies.php',1,1,0,0,0),(19,'default_template_settings','reviews.php',1,0,40,0,0),(20,'default_template_settings','search.php',1,1,10,0,0),(21,'default_template_settings','search_header.php',0,0,0,0,1),(22,'default_template_settings','shopping_cart.php',1,1,20,30,1),(23,'default_template_settings','specials.php',1,1,45,0,0),(24,'default_template_settings','whats_new.php',1,0,20,0,0),(25,'default_template_settings','whos_online.php',1,1,200,200,1),(26,'template_default','banner_box_all.php',1,1,5,0,0),(27,'template_default','banner_box.php',1,0,300,1,127),(28,'template_default','banner_box2.php',1,1,15,1,15),(29,'template_default','best_sellers.php',1,1,30,70,1),(30,'template_default','categories.php',1,0,10,10,1),(31,'template_default','currencies.php',0,1,80,60,0),(32,'template_default','ezpages.php',1,1,-1,2,1),(33,'template_default','featured.php',1,0,45,0,0),(34,'template_default','information.php',1,0,50,40,1),(35,'template_default','languages.php',0,1,70,50,0),(36,'template_default','manufacturers.php',1,0,30,20,1),(37,'template_default','manufacturer_info.php',1,1,35,95,1),(38,'template_default','more_information.php',1,0,200,200,1),(39,'template_default','my_broken_box.php',1,0,0,0,0),(40,'template_default','order_history.php',1,1,0,0,0),(41,'template_default','product_notifications.php',1,1,55,85,1),(42,'template_default','reviews.php',1,0,40,0,0),(43,'template_default','search.php',1,1,10,0,0),(44,'template_default','search_header.php',0,0,0,0,1),(45,'template_default','shopping_cart.php',1,1,20,30,1),(46,'template_default','specials.php',1,1,45,0,0),(47,'template_default','whats_new.php',1,0,20,0,0),(48,'template_default','whos_online.php',1,1,200,200,1),(49,'classic','banner_box.php',1,0,300,1,127),(50,'classic','banner_box2.php',1,1,15,1,15),(51,'classic','banner_box_all.php',1,1,5,0,0),(52,'classic','best_sellers.php',1,1,30,70,1),(53,'classic','categories.php',1,0,10,10,1),(54,'classic','currencies.php',0,1,80,60,0),(55,'classic','document_categories.php',1,0,0,0,0),(56,'classic','ezpages.php',1,1,-1,2,1),(57,'classic','featured.php',1,0,45,0,0),(58,'classic','information.php',1,0,50,40,1),(59,'classic','languages.php',0,1,70,50,0),(60,'classic','manufacturers.php',1,0,30,20,1),(61,'classic','manufacturer_info.php',1,1,35,95,1),(62,'classic','more_information.php',1,0,200,200,1),(63,'classic','music_genres.php',1,1,0,0,0),(64,'classic','order_history.php',1,1,0,0,0),(65,'classic','product_notifications.php',1,1,55,85,1),(66,'classic','record_companies.php',1,1,0,0,0),(67,'classic','reviews.php',1,0,40,0,0),(68,'classic','search.php',1,1,10,0,0),(69,'classic','search_header.php',0,0,0,0,1),(70,'classic','shopping_cart.php',1,1,20,30,1),(71,'classic','specials.php',1,1,45,0,0),(72,'classic','whats_new.php',1,0,20,0,0),(73,'classic','whos_online.php',1,1,200,200,1),(74,'responsive_classic','banner_box.php',1,0,300,1,127),(75,'responsive_classic','banner_box2.php',1,1,15,1,15),(76,'responsive_classic','banner_box_all.php',1,1,5,0,0),(77,'responsive_classic','best_sellers.php',1,1,30,70,1),(78,'responsive_classic','categories.php',1,0,10,10,1),(79,'responsive_classic','currencies.php',0,1,80,60,0),(80,'responsive_classic','document_categories.php',1,0,0,0,0),(81,'responsive_classic','ezpages.php',1,1,-1,2,1),(82,'responsive_classic','featured.php',1,0,45,0,0),(83,'responsive_classic','information.php',1,0,50,40,1),(84,'responsive_classic','languages.php',0,1,70,50,0),(85,'responsive_classic','manufacturers.php',1,0,30,20,1),(86,'responsive_classic','manufacturer_info.php',1,1,35,95,1),(87,'responsive_classic','more_information.php',1,0,200,200,1),(88,'responsive_classic','music_genres.php',1,1,0,0,0),(89,'responsive_classic','order_history.php',1,1,0,0,0),(90,'responsive_classic','product_notifications.php',1,1,55,85,1),(91,'responsive_classic','record_companies.php',1,1,0,0,0),(92,'responsive_classic','reviews.php',1,0,40,0,0),(93,'responsive_classic','search.php',1,1,10,0,0),(94,'responsive_classic','search_header.php',0,0,0,0,1),(95,'responsive_classic','shopping_cart.php',1,1,20,30,1),(96,'responsive_classic','specials.php',1,1,45,0,0),(97,'responsive_classic','whats_new.php',1,0,20,0,0),(98,'responsive_classic','whos_online.php',1,1,200,200,1),(99,'tableau','banner_box.php',1,0,300,1,127),(100,'tableau','banner_box2.php',1,1,15,1,15),(101,'tableau','banner_box_all.php',1,1,5,0,0),(102,'tableau','best_sellers.php',1,1,30,70,1),(103,'tableau','categories.php',1,0,10,10,1),(104,'tableau','currencies.php',0,1,80,60,0),(105,'tableau','document_categories.php',1,0,0,0,0),(106,'tableau','ezpages.php',1,1,-1,2,1),(107,'tableau','featured.php',1,0,45,0,0),(108,'tableau','information.php',1,0,50,40,1),(109,'tableau','languages.php',0,1,70,50,0),(110,'tableau','manufacturer_info.php',1,1,35,95,1),(111,'tableau','manufacturers.php',1,0,30,20,1),(112,'tableau','more_information.php',1,0,200,200,1),(113,'tableau','music_genres.php',1,1,0,0,0),(114,'tableau','my_categories.php',0,0,0,0,0),(115,'tableau','order_history.php',1,1,0,0,0),(116,'tableau','product_notifications.php',1,1,55,85,1),(117,'tableau','record_companies.php',1,1,0,0,0),(118,'tableau','reviews.php',1,0,40,0,0),(119,'tableau','search.php',1,1,10,0,0),(120,'tableau','search_header.php',0,0,0,0,1),(121,'tableau','shopping_cart.php',1,1,20,30,1),(122,'tableau','specials.php',1,1,45,0,0),(123,'tableau','whats_new.php',1,0,20,0,0),(124,'tableau','whos_online.php',1,1,200,200,1);
/*!40000 ALTER TABLE `layout_boxes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manufacturers`
--

DROP TABLE IF EXISTS `manufacturers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `manufacturers` (
  `manufacturers_id` int(11) NOT NULL AUTO_INCREMENT,
  `manufacturers_name` varchar(32) NOT NULL DEFAULT '',
  `manufacturers_image` varchar(255) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`manufacturers_id`),
  KEY `idx_mfg_name_zen` (`manufacturers_name`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manufacturers`
--

LOCK TABLES `manufacturers` WRITE;
/*!40000 ALTER TABLE `manufacturers` DISABLE KEYS */;
INSERT INTO `manufacturers` VALUES (1,'Aaron',NULL,'2019-02-19 16:00:16',NULL),(2,'Jacob',NULL,'2019-02-19 16:00:25',NULL),(3,'Harry',NULL,'2019-02-19 16:00:30',NULL),(4,'Daniel',NULL,'2019-02-19 16:00:40',NULL),(5,'Hwi',NULL,'2019-02-19 16:00:45',NULL),(6,'Dione',NULL,'2019-02-19 16:00:54',NULL),(7,'Joanne',NULL,'2019-02-19 23:03:58',NULL);
/*!40000 ALTER TABLE `manufacturers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manufacturers_info`
--

DROP TABLE IF EXISTS `manufacturers_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `manufacturers_info` (
  `manufacturers_id` int(11) NOT NULL DEFAULT '0',
  `languages_id` int(11) NOT NULL DEFAULT '0',
  `manufacturers_url` varchar(255) NOT NULL DEFAULT '',
  `url_clicked` int(5) NOT NULL DEFAULT '0',
  `date_last_click` datetime DEFAULT NULL,
  PRIMARY KEY (`manufacturers_id`,`languages_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manufacturers_info`
--

LOCK TABLES `manufacturers_info` WRITE;
/*!40000 ALTER TABLE `manufacturers_info` DISABLE KEYS */;
INSERT INTO `manufacturers_info` VALUES (1,1,'',0,NULL),(2,1,'',0,NULL),(3,1,'',0,NULL),(4,1,'',0,NULL),(5,1,'',0,NULL),(6,1,'',0,NULL),(7,1,'',0,NULL);
/*!40000 ALTER TABLE `manufacturers_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_clips`
--

DROP TABLE IF EXISTS `media_clips`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media_clips` (
  `clip_id` int(11) NOT NULL AUTO_INCREMENT,
  `media_id` int(11) NOT NULL DEFAULT '0',
  `clip_type` smallint(6) NOT NULL DEFAULT '0',
  `clip_filename` text NOT NULL,
  `date_added` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `last_modified` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  PRIMARY KEY (`clip_id`),
  KEY `idx_media_id_zen` (`media_id`),
  KEY `idx_clip_type_zen` (`clip_type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_clips`
--

LOCK TABLES `media_clips` WRITE;
/*!40000 ALTER TABLE `media_clips` DISABLE KEYS */;
/*!40000 ALTER TABLE `media_clips` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_manager`
--

DROP TABLE IF EXISTS `media_manager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media_manager` (
  `media_id` int(11) NOT NULL AUTO_INCREMENT,
  `media_name` varchar(255) NOT NULL DEFAULT '',
  `last_modified` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `date_added` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  PRIMARY KEY (`media_id`),
  KEY `idx_media_name_zen` (`media_name`(191))
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_manager`
--

LOCK TABLES `media_manager` WRITE;
/*!40000 ALTER TABLE `media_manager` DISABLE KEYS */;
/*!40000 ALTER TABLE `media_manager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_to_products`
--

DROP TABLE IF EXISTS `media_to_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media_to_products` (
  `media_id` int(11) NOT NULL DEFAULT '0',
  `product_id` int(11) NOT NULL DEFAULT '0',
  KEY `idx_media_product_zen` (`media_id`,`product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_to_products`
--

LOCK TABLES `media_to_products` WRITE;
/*!40000 ALTER TABLE `media_to_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `media_to_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_types`
--

DROP TABLE IF EXISTS `media_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media_types` (
  `type_id` int(11) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(64) NOT NULL DEFAULT '',
  `type_ext` varchar(8) NOT NULL DEFAULT '',
  PRIMARY KEY (`type_id`),
  KEY `idx_type_name_zen` (`type_name`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_types`
--

LOCK TABLES `media_types` WRITE;
/*!40000 ALTER TABLE `media_types` DISABLE KEYS */;
INSERT INTO `media_types` VALUES (1,'MP3','.mp3');
/*!40000 ALTER TABLE `media_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meta_tags_categories_description`
--

DROP TABLE IF EXISTS `meta_tags_categories_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meta_tags_categories_description` (
  `categories_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL DEFAULT '1',
  `metatags_title` varchar(255) NOT NULL DEFAULT '',
  `metatags_keywords` text,
  `metatags_description` text,
  PRIMARY KEY (`categories_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meta_tags_categories_description`
--

LOCK TABLES `meta_tags_categories_description` WRITE;
/*!40000 ALTER TABLE `meta_tags_categories_description` DISABLE KEYS */;
/*!40000 ALTER TABLE `meta_tags_categories_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meta_tags_products_description`
--

DROP TABLE IF EXISTS `meta_tags_products_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meta_tags_products_description` (
  `products_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL DEFAULT '1',
  `metatags_title` varchar(255) NOT NULL DEFAULT '',
  `metatags_keywords` text,
  `metatags_description` text,
  PRIMARY KEY (`products_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meta_tags_products_description`
--

LOCK TABLES `meta_tags_products_description` WRITE;
/*!40000 ALTER TABLE `meta_tags_products_description` DISABLE KEYS */;
/*!40000 ALTER TABLE `meta_tags_products_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `music_genre`
--

DROP TABLE IF EXISTS `music_genre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `music_genre` (
  `music_genre_id` int(11) NOT NULL AUTO_INCREMENT,
  `music_genre_name` varchar(32) NOT NULL DEFAULT '',
  `date_added` datetime DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`music_genre_id`),
  KEY `idx_music_genre_name_zen` (`music_genre_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `music_genre`
--

LOCK TABLES `music_genre` WRITE;
/*!40000 ALTER TABLE `music_genre` DISABLE KEYS */;
/*!40000 ALTER TABLE `music_genre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `newsletters`
--

DROP TABLE IF EXISTS `newsletters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `newsletters` (
  `newsletters_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '',
  `content` text NOT NULL,
  `content_html` text NOT NULL,
  `module` varchar(255) NOT NULL DEFAULT '',
  `date_added` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `date_sent` datetime DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `locked` int(1) DEFAULT '0',
  PRIMARY KEY (`newsletters_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `newsletters`
--

LOCK TABLES `newsletters` WRITE;
/*!40000 ALTER TABLE `newsletters` DISABLE KEYS */;
/*!40000 ALTER TABLE `newsletters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `orders_id` int(11) NOT NULL AUTO_INCREMENT,
  `customers_id` int(11) NOT NULL DEFAULT '0',
  `customers_name` varchar(64) NOT NULL DEFAULT '',
  `customers_company` varchar(64) DEFAULT NULL,
  `customers_street_address` varchar(64) NOT NULL DEFAULT '',
  `customers_suburb` varchar(32) DEFAULT NULL,
  `customers_city` varchar(32) NOT NULL DEFAULT '',
  `customers_postcode` varchar(10) NOT NULL DEFAULT '',
  `customers_state` varchar(32) DEFAULT NULL,
  `customers_country` varchar(32) NOT NULL DEFAULT '',
  `customers_telephone` varchar(32) NOT NULL DEFAULT '',
  `customers_email_address` varchar(96) NOT NULL DEFAULT '',
  `customers_address_format_id` int(5) NOT NULL DEFAULT '0',
  `delivery_name` varchar(64) NOT NULL DEFAULT '',
  `delivery_company` varchar(64) DEFAULT NULL,
  `delivery_street_address` varchar(64) NOT NULL DEFAULT '',
  `delivery_suburb` varchar(32) DEFAULT NULL,
  `delivery_city` varchar(32) NOT NULL DEFAULT '',
  `delivery_postcode` varchar(10) NOT NULL DEFAULT '',
  `delivery_state` varchar(32) DEFAULT NULL,
  `delivery_country` varchar(32) NOT NULL DEFAULT '',
  `delivery_address_format_id` int(5) NOT NULL DEFAULT '0',
  `billing_name` varchar(64) NOT NULL DEFAULT '',
  `billing_company` varchar(64) DEFAULT NULL,
  `billing_street_address` varchar(64) NOT NULL DEFAULT '',
  `billing_suburb` varchar(32) DEFAULT NULL,
  `billing_city` varchar(32) NOT NULL DEFAULT '',
  `billing_postcode` varchar(10) NOT NULL DEFAULT '',
  `billing_state` varchar(32) DEFAULT NULL,
  `billing_country` varchar(32) NOT NULL DEFAULT '',
  `billing_address_format_id` int(5) NOT NULL DEFAULT '0',
  `payment_method` varchar(128) NOT NULL DEFAULT '',
  `payment_module_code` varchar(32) NOT NULL DEFAULT '',
  `shipping_method` varchar(255) DEFAULT NULL,
  `shipping_module_code` varchar(32) NOT NULL DEFAULT '',
  `coupon_code` varchar(32) NOT NULL DEFAULT '',
  `cc_type` varchar(20) DEFAULT NULL,
  `cc_owner` varchar(64) DEFAULT NULL,
  `cc_number` varchar(32) DEFAULT NULL,
  `cc_expires` varchar(4) DEFAULT NULL,
  `cc_cvv` blob,
  `last_modified` datetime DEFAULT NULL,
  `date_purchased` datetime DEFAULT NULL,
  `orders_status` int(5) NOT NULL DEFAULT '0',
  `orders_date_finished` datetime DEFAULT NULL,
  `currency` char(3) DEFAULT NULL,
  `currency_value` decimal(14,6) DEFAULT NULL,
  `order_total` decimal(15,4) DEFAULT NULL,
  `order_tax` decimal(15,4) DEFAULT NULL,
  `paypal_ipn_id` int(11) NOT NULL DEFAULT '0',
  `ip_address` varchar(96) NOT NULL DEFAULT '',
  `order_weight` float DEFAULT NULL,
  PRIMARY KEY (`orders_id`),
  KEY `idx_status_orders_cust_zen` (`orders_status`,`orders_id`,`customers_id`),
  KEY `idx_date_purchased_zen` (`date_purchased`),
  KEY `idx_cust_id_orders_id_zen` (`customers_id`,`orders_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,1,'kyeongsang yu','peoplespace','1691 kettering street','','Irvine','92620','California','United States','9498291691','21300875@handong.edu',2,'kyeongsang yu','peoplespace','1691 kettering street','','Irvine','92620','California','United States',2,'kyeongsang yu','peoplespace','1691 kettering street','','Irvine','92620','California','United States',2,'Check/Money Order','moneyorder','Store Pickup (Walk In)','storepickup','','','','','',NULL,NULL,'2019-02-19 20:03:13',1,NULL,'USD',1.000000,10.0000,0.0000,0,'::1 - ::1',NULL),(2,1,'kyeongsang yu','peoplespace','1691 kettering street','','Irvine','92620','California','United States','9498291691','21300875@handong.edu',2,'kyeongsang yu','peoplespace','1691 kettering street','','Irvine','92620','California','United States',2,'kyeongsang yu','peoplespace','1691 kettering street','','Irvine','92620','California','United States',2,'Check/Money Order','moneyorder','Flat Rate (Best Way)','flat','','','','','',NULL,NULL,'2019-02-19 22:55:44',1,NULL,'USD',1.000000,35.0000,0.0000,0,'::1 - ::1',NULL),(3,1,'kyeongsang yu','peoplespace','1691 kettering street','','Irvine','92620','California','United States','9498291691','21300875@handong.edu',2,'kyeongsang yu','peoplespace','1691 kettering street','','Irvine','92620','California','United States',2,'kyeongsang yu','peoplespace','1691 kettering street','','Irvine','92620','California','United States',2,'Check/Money Order','moneyorder','Store Pickup (Walk In)','storepickup','','','','','',NULL,NULL,'2019-02-19 22:57:51',1,NULL,'USD',1.000000,32.0000,0.0000,0,'::1 - ::1',NULL);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders_products`
--

DROP TABLE IF EXISTS `orders_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders_products` (
  `orders_products_id` int(11) NOT NULL AUTO_INCREMENT,
  `orders_id` int(11) NOT NULL DEFAULT '0',
  `products_id` int(11) NOT NULL DEFAULT '0',
  `products_model` varchar(32) DEFAULT NULL,
  `products_name` varchar(64) NOT NULL DEFAULT '',
  `products_price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `final_price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `products_tax` decimal(7,4) NOT NULL DEFAULT '0.0000',
  `products_quantity` float NOT NULL DEFAULT '0',
  `onetime_charges` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `products_priced_by_attribute` tinyint(1) NOT NULL DEFAULT '0',
  `product_is_free` tinyint(1) NOT NULL DEFAULT '0',
  `products_discount_type` tinyint(1) NOT NULL DEFAULT '0',
  `products_discount_type_from` tinyint(1) NOT NULL DEFAULT '0',
  `products_prid` tinytext NOT NULL,
  `products_weight` float DEFAULT NULL,
  `products_virtual` tinyint(1) DEFAULT NULL,
  `product_is_always_free_shipping` tinyint(1) DEFAULT NULL,
  `products_quantity_order_min` float DEFAULT NULL,
  `products_quantity_order_units` float DEFAULT NULL,
  `products_quantity_order_max` float DEFAULT NULL,
  `products_quantity_mixed` tinyint(1) DEFAULT NULL,
  `products_mixed_discount_quantity` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`orders_products_id`),
  KEY `idx_orders_id_prod_id_zen` (`orders_id`,`products_id`),
  KEY `idx_prod_id_orders_id_zen` (`products_id`,`orders_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders_products`
--

LOCK TABLES `orders_products` WRITE;
/*!40000 ALTER TABLE `orders_products` DISABLE KEYS */;
INSERT INTO `orders_products` VALUES (1,1,4,'','orgen',10.0000,10.0000,0.0000,1,0.0000,0,0,0,0,'4',0,0,0,1,1,0,1,1),(2,2,17,'','Mid-sized Air Purifier',25.0000,25.0000,0.0000,1,0.0000,0,0,0,0,'17',0,0,0,1,1,0,1,1),(3,2,7,'','Superman Mark',2.0000,2.0000,0.0000,1,0.0000,0,0,0,0,'7',0,0,0,1,1,0,1,1),(4,2,18,'','Wood Basket',3.0000,3.0000,0.0000,1,0.0000,0,0,0,0,'18',0,0,0,1,1,0,1,1),(5,3,6,'','Welcome to Las vegas ! <gear machine>',30.0000,30.0000,0.0000,1,0.0000,0,0,0,0,'6',0,0,0,1,1,0,1,1),(6,3,19,'','Acryl Nametag',2.0000,2.0000,0.0000,1,0.0000,0,0,0,0,'19',0,0,0,1,1,0,1,1);
/*!40000 ALTER TABLE `orders_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders_products_attributes`
--

DROP TABLE IF EXISTS `orders_products_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders_products_attributes` (
  `orders_products_attributes_id` int(11) NOT NULL AUTO_INCREMENT,
  `orders_id` int(11) NOT NULL DEFAULT '0',
  `orders_products_id` int(11) NOT NULL DEFAULT '0',
  `products_options` varchar(32) NOT NULL DEFAULT '',
  `products_options_values` text NOT NULL,
  `options_values_price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `price_prefix` char(1) NOT NULL DEFAULT '',
  `product_attribute_is_free` tinyint(1) NOT NULL DEFAULT '0',
  `products_attributes_weight` float NOT NULL DEFAULT '0',
  `products_attributes_weight_prefix` char(1) NOT NULL DEFAULT '',
  `attributes_discounted` tinyint(1) NOT NULL DEFAULT '1',
  `attributes_price_base_included` tinyint(1) NOT NULL DEFAULT '1',
  `attributes_price_onetime` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `attributes_price_factor` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `attributes_price_factor_offset` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `attributes_price_factor_onetime` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `attributes_price_factor_onetime_offset` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `attributes_qty_prices` text,
  `attributes_qty_prices_onetime` text,
  `attributes_price_words` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `attributes_price_words_free` int(4) NOT NULL DEFAULT '0',
  `attributes_price_letters` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `attributes_price_letters_free` int(4) NOT NULL DEFAULT '0',
  `products_options_id` int(11) NOT NULL DEFAULT '0',
  `products_options_values_id` int(11) NOT NULL DEFAULT '0',
  `products_prid` tinytext NOT NULL,
  PRIMARY KEY (`orders_products_attributes_id`),
  KEY `idx_orders_id_prod_id_zen` (`orders_id`,`orders_products_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders_products_attributes`
--

LOCK TABLES `orders_products_attributes` WRITE;
/*!40000 ALTER TABLE `orders_products_attributes` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders_products_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders_products_download`
--

DROP TABLE IF EXISTS `orders_products_download`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders_products_download` (
  `orders_products_download_id` int(11) NOT NULL AUTO_INCREMENT,
  `orders_id` int(11) NOT NULL DEFAULT '0',
  `orders_products_id` int(11) NOT NULL DEFAULT '0',
  `orders_products_filename` varchar(255) NOT NULL DEFAULT '',
  `download_maxdays` int(2) NOT NULL DEFAULT '0',
  `download_count` int(2) NOT NULL DEFAULT '0',
  `products_prid` tinytext NOT NULL,
  `products_attributes_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`orders_products_download_id`),
  KEY `idx_orders_id_zen` (`orders_id`),
  KEY `idx_orders_products_id_zen` (`orders_products_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders_products_download`
--

LOCK TABLES `orders_products_download` WRITE;
/*!40000 ALTER TABLE `orders_products_download` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders_products_download` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders_status`
--

DROP TABLE IF EXISTS `orders_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders_status` (
  `orders_status_id` int(11) NOT NULL DEFAULT '0',
  `language_id` int(11) NOT NULL DEFAULT '1',
  `orders_status_name` varchar(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`orders_status_id`,`language_id`),
  KEY `idx_orders_status_name_zen` (`orders_status_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders_status`
--

LOCK TABLES `orders_status` WRITE;
/*!40000 ALTER TABLE `orders_status` DISABLE KEYS */;
INSERT INTO `orders_status` VALUES (1,1,'Pending'),(2,1,'Processing'),(3,1,'Delivered'),(4,1,'Update');
/*!40000 ALTER TABLE `orders_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders_status_history`
--

DROP TABLE IF EXISTS `orders_status_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders_status_history` (
  `orders_status_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `orders_id` int(11) NOT NULL DEFAULT '0',
  `orders_status_id` int(5) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `customer_notified` int(1) DEFAULT '0',
  `comments` text,
  `updated_by` varchar(45) NOT NULL DEFAULT '',
  PRIMARY KEY (`orders_status_history_id`),
  KEY `idx_orders_id_status_id_zen` (`orders_id`,`orders_status_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders_status_history`
--

LOCK TABLES `orders_status_history` WRITE;
/*!40000 ALTER TABLE `orders_status_history` DISABLE KEYS */;
INSERT INTO `orders_status_history` VALUES (1,1,1,'2019-02-19 20:03:13',1,'',''),(2,2,1,'2019-02-19 22:55:44',1,'',''),(3,3,1,'2019-02-19 22:57:51',1,'','');
/*!40000 ALTER TABLE `orders_status_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders_total`
--

DROP TABLE IF EXISTS `orders_total`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders_total` (
  `orders_total_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `orders_id` int(11) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `text` varchar(255) NOT NULL DEFAULT '',
  `value` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `class` varchar(32) NOT NULL DEFAULT '',
  `sort_order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`orders_total_id`),
  KEY `idx_ot_orders_id_zen` (`orders_id`),
  KEY `idx_ot_class_zen` (`class`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders_total`
--

LOCK TABLES `orders_total` WRITE;
/*!40000 ALTER TABLE `orders_total` DISABLE KEYS */;
INSERT INTO `orders_total` VALUES (1,1,'Sub-Total:','$10.00',10.0000,'ot_subtotal',100),(2,1,'Store Pickup (Walk In):','$0.00',0.0000,'ot_shipping',200),(3,1,'Total:','$10.00',10.0000,'ot_total',999),(4,2,'Sub-Total:','$30.00',30.0000,'ot_subtotal',100),(5,2,'Flat Rate (Best Way):','$5.00',5.0000,'ot_shipping',200),(6,2,'Total:','$35.00',35.0000,'ot_total',999),(7,3,'Sub-Total:','$32.00',32.0000,'ot_subtotal',100),(8,3,'Store Pickup (Walk In):','$0.00',0.0000,'ot_shipping',200),(9,3,'Total:','$32.00',32.0000,'ot_total',999);
/*!40000 ALTER TABLE `orders_total` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paypal`
--

DROP TABLE IF EXISTS `paypal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paypal` (
  `paypal_ipn_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(11) unsigned NOT NULL DEFAULT '0',
  `txn_type` varchar(40) NOT NULL DEFAULT '',
  `module_name` varchar(40) NOT NULL DEFAULT '',
  `module_mode` varchar(40) NOT NULL DEFAULT '',
  `reason_code` varchar(40) DEFAULT NULL,
  `payment_type` varchar(40) NOT NULL DEFAULT '',
  `payment_status` varchar(32) NOT NULL DEFAULT '',
  `pending_reason` varchar(32) DEFAULT NULL,
  `invoice` varchar(128) DEFAULT NULL,
  `mc_currency` char(3) NOT NULL DEFAULT '',
  `first_name` varchar(32) NOT NULL DEFAULT '',
  `last_name` varchar(32) NOT NULL DEFAULT '',
  `payer_business_name` varchar(128) DEFAULT NULL,
  `address_name` varchar(64) DEFAULT NULL,
  `address_street` varchar(254) DEFAULT NULL,
  `address_city` varchar(120) DEFAULT NULL,
  `address_state` varchar(120) DEFAULT NULL,
  `address_zip` varchar(10) DEFAULT NULL,
  `address_country` varchar(64) DEFAULT NULL,
  `address_status` varchar(11) DEFAULT NULL,
  `payer_email` varchar(128) NOT NULL DEFAULT '',
  `payer_id` varchar(32) NOT NULL DEFAULT '',
  `payer_status` varchar(10) NOT NULL DEFAULT '',
  `payment_date` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `business` varchar(128) NOT NULL DEFAULT '',
  `receiver_email` varchar(128) NOT NULL DEFAULT '',
  `receiver_id` varchar(32) NOT NULL DEFAULT '',
  `txn_id` varchar(20) NOT NULL DEFAULT '',
  `parent_txn_id` varchar(20) DEFAULT NULL,
  `num_cart_items` tinyint(4) unsigned NOT NULL DEFAULT '1',
  `mc_gross` decimal(7,2) NOT NULL DEFAULT '0.00',
  `mc_fee` decimal(7,2) NOT NULL DEFAULT '0.00',
  `payment_gross` decimal(7,2) DEFAULT NULL,
  `payment_fee` decimal(7,2) DEFAULT NULL,
  `settle_amount` decimal(7,2) DEFAULT NULL,
  `settle_currency` char(3) DEFAULT NULL,
  `exchange_rate` decimal(4,2) DEFAULT NULL,
  `notify_version` varchar(6) NOT NULL DEFAULT '',
  `verify_sign` varchar(128) NOT NULL DEFAULT '',
  `last_modified` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `date_added` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `memo` text,
  PRIMARY KEY (`paypal_ipn_id`,`txn_id`),
  KEY `idx_order_id_zen` (`order_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paypal`
--

LOCK TABLES `paypal` WRITE;
/*!40000 ALTER TABLE `paypal` DISABLE KEYS */;
/*!40000 ALTER TABLE `paypal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paypal_payment_status`
--

DROP TABLE IF EXISTS `paypal_payment_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paypal_payment_status` (
  `payment_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `payment_status_name` varchar(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`payment_status_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paypal_payment_status`
--

LOCK TABLES `paypal_payment_status` WRITE;
/*!40000 ALTER TABLE `paypal_payment_status` DISABLE KEYS */;
INSERT INTO `paypal_payment_status` VALUES (1,'Completed'),(2,'Pending'),(3,'Failed'),(4,'Denied'),(5,'Refunded'),(6,'Canceled_Reversal'),(7,'Reversed');
/*!40000 ALTER TABLE `paypal_payment_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paypal_payment_status_history`
--

DROP TABLE IF EXISTS `paypal_payment_status_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paypal_payment_status_history` (
  `payment_status_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `paypal_ipn_id` int(11) NOT NULL DEFAULT '0',
  `txn_id` varchar(64) NOT NULL DEFAULT '',
  `parent_txn_id` varchar(64) NOT NULL DEFAULT '',
  `payment_status` varchar(17) NOT NULL DEFAULT '',
  `pending_reason` varchar(32) DEFAULT NULL,
  `date_added` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  PRIMARY KEY (`payment_status_history_id`),
  KEY `idx_paypal_ipn_id_zen` (`paypal_ipn_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paypal_payment_status_history`
--

LOCK TABLES `paypal_payment_status_history` WRITE;
/*!40000 ALTER TABLE `paypal_payment_status_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `paypal_payment_status_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paypal_session`
--

DROP TABLE IF EXISTS `paypal_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paypal_session` (
  `unique_id` int(11) NOT NULL AUTO_INCREMENT,
  `session_id` text NOT NULL,
  `saved_session` mediumblob NOT NULL,
  `expiry` int(17) NOT NULL DEFAULT '0',
  PRIMARY KEY (`unique_id`),
  KEY `idx_session_id_zen` (`session_id`(36))
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paypal_session`
--

LOCK TABLES `paypal_session` WRITE;
/*!40000 ALTER TABLE `paypal_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `paypal_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paypal_testing`
--

DROP TABLE IF EXISTS `paypal_testing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paypal_testing` (
  `paypal_ipn_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(11) unsigned NOT NULL DEFAULT '0',
  `custom` varchar(255) NOT NULL DEFAULT '',
  `txn_type` varchar(40) NOT NULL DEFAULT '',
  `module_name` varchar(40) NOT NULL DEFAULT '',
  `module_mode` varchar(40) NOT NULL DEFAULT '',
  `reason_code` varchar(40) DEFAULT NULL,
  `payment_type` varchar(40) NOT NULL DEFAULT '',
  `payment_status` varchar(32) NOT NULL DEFAULT '',
  `pending_reason` varchar(32) DEFAULT NULL,
  `invoice` varchar(128) DEFAULT NULL,
  `mc_currency` char(3) NOT NULL DEFAULT '',
  `first_name` varchar(32) NOT NULL DEFAULT '',
  `last_name` varchar(32) NOT NULL DEFAULT '',
  `payer_business_name` varchar(128) DEFAULT NULL,
  `address_name` varchar(64) DEFAULT NULL,
  `address_street` varchar(254) DEFAULT NULL,
  `address_city` varchar(120) DEFAULT NULL,
  `address_state` varchar(120) DEFAULT NULL,
  `address_zip` varchar(10) DEFAULT NULL,
  `address_country` varchar(64) DEFAULT NULL,
  `address_status` varchar(11) DEFAULT NULL,
  `payer_email` varchar(128) NOT NULL DEFAULT '',
  `payer_id` varchar(32) NOT NULL DEFAULT '',
  `payer_status` varchar(10) NOT NULL DEFAULT '',
  `payment_date` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `business` varchar(128) NOT NULL DEFAULT '',
  `receiver_email` varchar(128) NOT NULL DEFAULT '',
  `receiver_id` varchar(32) NOT NULL DEFAULT '',
  `txn_id` varchar(20) NOT NULL DEFAULT '',
  `parent_txn_id` varchar(20) DEFAULT NULL,
  `num_cart_items` tinyint(4) unsigned NOT NULL DEFAULT '1',
  `mc_gross` decimal(7,2) NOT NULL DEFAULT '0.00',
  `mc_fee` decimal(7,2) NOT NULL DEFAULT '0.00',
  `payment_gross` decimal(7,2) DEFAULT NULL,
  `payment_fee` decimal(7,2) DEFAULT NULL,
  `settle_amount` decimal(7,2) DEFAULT NULL,
  `settle_currency` char(3) DEFAULT NULL,
  `exchange_rate` decimal(4,2) DEFAULT NULL,
  `notify_version` decimal(2,1) NOT NULL DEFAULT '0.0',
  `verify_sign` varchar(128) NOT NULL DEFAULT '',
  `last_modified` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `date_added` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `memo` text,
  PRIMARY KEY (`paypal_ipn_id`,`txn_id`),
  KEY `idx_order_id_zen` (`order_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paypal_testing`
--

LOCK TABLES `paypal_testing` WRITE;
/*!40000 ALTER TABLE `paypal_testing` DISABLE KEYS */;
/*!40000 ALTER TABLE `paypal_testing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_music_extra`
--

DROP TABLE IF EXISTS `product_music_extra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_music_extra` (
  `products_id` int(11) NOT NULL DEFAULT '0',
  `artists_id` int(11) NOT NULL DEFAULT '0',
  `record_company_id` int(11) NOT NULL DEFAULT '0',
  `music_genre_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`products_id`),
  KEY `idx_music_genre_id_zen` (`music_genre_id`),
  KEY `idx_artists_id_zen` (`artists_id`),
  KEY `idx_record_company_id_zen` (`record_company_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_music_extra`
--

LOCK TABLES `product_music_extra` WRITE;
/*!40000 ALTER TABLE `product_music_extra` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_music_extra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_type_layout`
--

DROP TABLE IF EXISTS `product_type_layout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_type_layout` (
  `configuration_id` int(11) NOT NULL AUTO_INCREMENT,
  `configuration_title` text NOT NULL,
  `configuration_key` varchar(180) NOT NULL DEFAULT '',
  `configuration_value` text NOT NULL,
  `configuration_description` text NOT NULL,
  `product_type_id` int(11) NOT NULL DEFAULT '0',
  `sort_order` int(5) DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  `date_added` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `use_function` text,
  `set_function` text,
  PRIMARY KEY (`configuration_id`),
  UNIQUE KEY `unq_config_key_zen` (`configuration_key`),
  KEY `idx_key_value_zen` (`configuration_key`,`configuration_value`(10)),
  KEY `idx_type_id_sort_order_zen` (`product_type_id`,`sort_order`)
) ENGINE=MyISAM AUTO_INCREMENT=139 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_type_layout`
--

LOCK TABLES `product_type_layout` WRITE;
/*!40000 ALTER TABLE `product_type_layout` DISABLE KEYS */;
INSERT INTO `product_type_layout` VALUES (1,'Show Model Number','SHOW_PRODUCT_INFO_MODEL','1','Display Model Number on Product Info 0= off 1= on',1,1,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(2,'Show Weight','SHOW_PRODUCT_INFO_WEIGHT','1','Display Weight on Product Info 0= off 1= on',1,2,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(3,'Show Attribute Weight','SHOW_PRODUCT_INFO_WEIGHT_ATTRIBUTES','1','Display Attribute Weight on Product Info 0= off 1= on',1,3,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(4,'Show Manufacturer','SHOW_PRODUCT_INFO_MANUFACTURER','1','Display Manufacturer Name on Product Info 0= off 1= on',1,4,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(5,'Show Quantity in Shopping Cart','SHOW_PRODUCT_INFO_IN_CART_QTY','1','Display Quantity in Current Shopping Cart on Product Info 0= off 1= on',1,5,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(6,'Show Quantity in Stock','SHOW_PRODUCT_INFO_QUANTITY','1','Display Quantity in Stock on Product Info 0= off 1= on',1,6,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(7,'Show Product Reviews Count','SHOW_PRODUCT_INFO_REVIEWS_COUNT','1','Display Product Reviews Count on Product Info 0= off 1= on',1,7,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(8,'Show Product Reviews Button','SHOW_PRODUCT_INFO_REVIEWS','1','Display Product Reviews Button on Product Info 0= off 1= on',1,8,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(9,'Show Date Available','SHOW_PRODUCT_INFO_DATE_AVAILABLE','1','Display Date Available on Product Info 0= off 1= on',1,9,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(10,'Show Date Added','SHOW_PRODUCT_INFO_DATE_ADDED','1','Display Date Added on Product Info 0= off 1= on',1,10,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(11,'Show Product URL','SHOW_PRODUCT_INFO_URL','1','Display URL on Product Info 0= off 1= on',1,11,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(12,'Show Product Additional Images','SHOW_PRODUCT_INFO_ADDITIONAL_IMAGES','1','Display Additional Images on Product Info 0= off 1= on',1,13,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(13,'Show Starting At text on Price','SHOW_PRODUCT_INFO_STARTING_AT','1','Display Starting At text on products with attributes Product Info 0= off 1= on',1,12,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(14,'Product Free Shipping Image Status - Catalog','SHOW_PRODUCT_INFO_ALWAYS_FREE_SHIPPING_IMAGE_SWITCH','0','Show the Free Shipping image/text in the catalog?',1,16,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), '),(15,'Product Price Tax Class Default - When adding new products?','DEFAULT_PRODUCT_TAX_CLASS_ID','0','What should the Product Price Tax Class Default ID be when adding new products?',1,100,NULL,'2019-02-19 14:19:13','',''),(16,'Product Virtual Default Status - Skip Shipping Address - When adding new products?','DEFAULT_PRODUCT_PRODUCTS_VIRTUAL','0','Default Virtual Product status to be ON when adding new products?',1,101,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(17,'Product Free Shipping Default Status - Normal Shipping Rules - When adding new products?','DEFAULT_PRODUCT_PRODUCTS_IS_ALWAYS_FREE_SHIPPING','0','What should the Default Free Shipping status be when adding new products?<br />Yes, Always Free Shipping ON<br />No, Always Free Shipping OFF<br />Special, Product/Download Requires Shipping',1,102,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes, Always ON\'), array(\'id\'=>\'0\', \'text\'=>\'No, Always OFF\'), array(\'id\'=>\'2\', \'text\'=>\'Special\')), '),(18,'Show Model Number','SHOW_PRODUCT_MUSIC_INFO_MODEL','1','Display Model Number on Product Info 0= off 1= on',2,1,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(19,'Show Weight','SHOW_PRODUCT_MUSIC_INFO_WEIGHT','0','Display Weight on Product Info 0= off 1= on',2,2,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(20,'Show Attribute Weight','SHOW_PRODUCT_MUSIC_INFO_WEIGHT_ATTRIBUTES','1','Display Attribute Weight on Product Info 0= off 1= on',2,3,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(21,'Show Artist','SHOW_PRODUCT_MUSIC_INFO_ARTIST','1','Display Artists Name on Product Info 0= off 1= on',2,4,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(22,'Show Music Genre','SHOW_PRODUCT_MUSIC_INFO_GENRE','1','Display Music Genre on Product Info 0= off 1= on',2,4,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(23,'Show Record Company','SHOW_PRODUCT_MUSIC_INFO_RECORD_COMPANY','1','Display Record Company on Product Info 0= off 1= on',2,4,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(24,'Show Quantity in Shopping Cart','SHOW_PRODUCT_MUSIC_INFO_IN_CART_QTY','1','Display Quantity in Current Shopping Cart on Product Info 0= off 1= on',2,5,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(25,'Show Quantity in Stock','SHOW_PRODUCT_MUSIC_INFO_QUANTITY','0','Display Quantity in Stock on Product Info 0= off 1= on',2,6,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(26,'Show Product Reviews Count','SHOW_PRODUCT_MUSIC_INFO_REVIEWS_COUNT','1','Display Product Reviews Count on Product Info 0= off 1= on',2,7,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(27,'Show Product Reviews Button','SHOW_PRODUCT_MUSIC_INFO_REVIEWS','1','Display Product Reviews Button on Product Info 0= off 1= on',2,8,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(28,'Show Date Available','SHOW_PRODUCT_MUSIC_INFO_DATE_AVAILABLE','1','Display Date Available on Product Info 0= off 1= on',2,9,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(29,'Show Date Added','SHOW_PRODUCT_MUSIC_INFO_DATE_ADDED','1','Display Date Added on Product Info 0= off 1= on',2,10,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(30,'Show Starting At text on Price','SHOW_PRODUCT_MUSIC_INFO_STARTING_AT','1','Display Starting At text on products with attributes Product Info 0= off 1= on',2,12,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(31,'Show Product Additional Images','SHOW_PRODUCT_MUSIC_INFO_ADDITIONAL_IMAGES','1','Display Additional Images on Product Info 0= off 1= on',2,13,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(32,'Product Free Shipping Image Status - Catalog','SHOW_PRODUCT_MUSIC_INFO_ALWAYS_FREE_SHIPPING_IMAGE_SWITCH','0','Show the Free Shipping image/text in the catalog?',2,16,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), '),(33,'Product Price Tax Class Default - When adding new products?','DEFAULT_PRODUCT_MUSIC_TAX_CLASS_ID','0','What should the Product Price Tax Class Default ID be when adding new products?',2,100,NULL,'2019-02-19 14:19:13','',''),(34,'Product Virtual Default Status - Skip Shipping Address - When adding new products?','DEFAULT_PRODUCT_MUSIC_PRODUCTS_VIRTUAL','0','Default Virtual Product status to be ON when adding new products?',2,101,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(35,'Product Free Shipping Default Status - Normal Shipping Rules - When adding new products?','DEFAULT_PRODUCT_MUSIC_PRODUCTS_IS_ALWAYS_FREE_SHIPPING','0','What should the Default Free Shipping status be when adding new products?<br />Yes, Always Free Shipping ON<br />No, Always Free Shipping OFF<br />Special, Product/Download Requires Shipping',2,102,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes, Always ON\'), array(\'id\'=>\'0\', \'text\'=>\'No, Always OFF\'), array(\'id\'=>\'2\', \'text\'=>\'Special\')), '),(36,'Show Product Reviews Count','SHOW_DOCUMENT_GENERAL_INFO_REVIEWS_COUNT','1','Display Product Reviews Count on Product Info 0= off 1= on',3,7,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(37,'Show Product Reviews Button','SHOW_DOCUMENT_GENERAL_INFO_REVIEWS','1','Display Product Reviews Button on Product Info 0= off 1= on',3,8,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(38,'Show Date Available','SHOW_DOCUMENT_GENERAL_INFO_DATE_AVAILABLE','1','Display Date Available on Product Info 0= off 1= on',3,9,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(39,'Show Date Added','SHOW_DOCUMENT_GENERAL_INFO_DATE_ADDED','1','Display Date Added on Product Info 0= off 1= on',3,10,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(40,'Show Product URL','SHOW_DOCUMENT_GENERAL_INFO_URL','1','Display URL on Product Info 0= off 1= on',3,11,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(41,'Show Product Additional Images','SHOW_DOCUMENT_GENERAL_INFO_ADDITIONAL_IMAGES','1','Display Additional Images on Product Info 0= off 1= on',3,13,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(42,'Show Model Number','SHOW_DOCUMENT_PRODUCT_INFO_MODEL','1','Display Model Number on Product Info 0= off 1= on',4,1,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(43,'Show Weight','SHOW_DOCUMENT_PRODUCT_INFO_WEIGHT','0','Display Weight on Product Info 0= off 1= on',4,2,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(44,'Show Attribute Weight','SHOW_DOCUMENT_PRODUCT_INFO_WEIGHT_ATTRIBUTES','1','Display Attribute Weight on Product Info 0= off 1= on',4,3,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(45,'Show Manufacturer','SHOW_DOCUMENT_PRODUCT_INFO_MANUFACTURER','1','Display Manufacturer Name on Product Info 0= off 1= on',4,4,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(46,'Show Quantity in Shopping Cart','SHOW_DOCUMENT_PRODUCT_INFO_IN_CART_QTY','1','Display Quantity in Current Shopping Cart on Product Info 0= off 1= on',4,5,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(47,'Show Quantity in Stock','SHOW_DOCUMENT_PRODUCT_INFO_QUANTITY','0','Display Quantity in Stock on Product Info 0= off 1= on',4,6,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(48,'Show Product Reviews Count','SHOW_DOCUMENT_PRODUCT_INFO_REVIEWS_COUNT','1','Display Product Reviews Count on Product Info 0= off 1= on',4,7,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(49,'Show Product Reviews Button','SHOW_DOCUMENT_PRODUCT_INFO_REVIEWS','1','Display Product Reviews Button on Product Info 0= off 1= on',4,8,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(50,'Show Date Available','SHOW_DOCUMENT_PRODUCT_INFO_DATE_AVAILABLE','1','Display Date Available on Product Info 0= off 1= on',4,9,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(51,'Show Date Added','SHOW_DOCUMENT_PRODUCT_INFO_DATE_ADDED','1','Display Date Added on Product Info 0= off 1= on',4,10,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(52,'Show Product URL','SHOW_DOCUMENT_PRODUCT_INFO_URL','1','Display URL on Product Info 0= off 1= on',4,11,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(53,'Show Product Additional Images','SHOW_DOCUMENT_PRODUCT_INFO_ADDITIONAL_IMAGES','1','Display Additional Images on Product Info 0= off 1= on',4,13,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(54,'Show Starting At text on Price','SHOW_DOCUMENT_PRODUCT_INFO_STARTING_AT','1','Display Starting At text on products with attributes Product Info 0= off 1= on',4,12,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(55,'Product Free Shipping Image Status - Catalog','SHOW_DOCUMENT_PRODUCT_INFO_ALWAYS_FREE_SHIPPING_IMAGE_SWITCH','0','Show the Free Shipping image/text in the catalog?',4,16,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), '),(56,'Product Price Tax Class Default - When adding new products?','DEFAULT_DOCUMENT_PRODUCT_TAX_CLASS_ID','0','What should the Product Price Tax Class Default ID be when adding new products?',4,100,NULL,'2019-02-19 14:19:13','',''),(57,'Product Virtual Default Status - Skip Shipping Address - When adding new products?','DEFAULT_DOCUMENT_PRODUCT_PRODUCTS_VIRTUAL','0','Default Virtual Product status to be ON when adding new products?',4,101,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(58,'Product Free Shipping Default Status - Normal Shipping Rules - When adding new products?','DEFAULT_DOCUMENT_PRODUCT_PRODUCTS_IS_ALWAYS_FREE_SHIPPING','0','What should the Default Free Shipping status be when adding new products?<br />Yes, Always Free Shipping ON<br />No, Always Free Shipping OFF<br />Special, Product/Download Requires Shipping',4,102,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes, Always ON\'), array(\'id\'=>\'0\', \'text\'=>\'No, Always OFF\'), array(\'id\'=>\'2\', \'text\'=>\'Special\')), '),(59,'Show Model Number','SHOW_PRODUCT_FREE_SHIPPING_INFO_MODEL','1','Display Model Number on Product Info 0= off 1= on',5,1,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(60,'Show Weight','SHOW_PRODUCT_FREE_SHIPPING_INFO_WEIGHT','0','Display Weight on Product Info 0= off 1= on',5,2,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(61,'Show Attribute Weight','SHOW_PRODUCT_FREE_SHIPPING_INFO_WEIGHT_ATTRIBUTES','1','Display Attribute Weight on Product Info 0= off 1= on',5,3,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(62,'Show Manufacturer','SHOW_PRODUCT_FREE_SHIPPING_INFO_MANUFACTURER','1','Display Manufacturer Name on Product Info 0= off 1= on',5,4,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(63,'Show Quantity in Shopping Cart','SHOW_PRODUCT_FREE_SHIPPING_INFO_IN_CART_QTY','1','Display Quantity in Current Shopping Cart on Product Info 0= off 1= on',5,5,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(64,'Show Quantity in Stock','SHOW_PRODUCT_FREE_SHIPPING_INFO_QUANTITY','1','Display Quantity in Stock on Product Info 0= off 1= on',5,6,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(65,'Show Product Reviews Count','SHOW_PRODUCT_FREE_SHIPPING_INFO_REVIEWS_COUNT','1','Display Product Reviews Count on Product Info 0= off 1= on',5,7,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(66,'Show Product Reviews Button','SHOW_PRODUCT_FREE_SHIPPING_INFO_REVIEWS','1','Display Product Reviews Button on Product Info 0= off 1= on',5,8,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(67,'Show Date Available','SHOW_PRODUCT_FREE_SHIPPING_INFO_DATE_AVAILABLE','0','Display Date Available on Product Info 0= off 1= on',5,9,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(68,'Show Date Added','SHOW_PRODUCT_FREE_SHIPPING_INFO_DATE_ADDED','1','Display Date Added on Product Info 0= off 1= on',5,10,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(69,'Show Product URL','SHOW_PRODUCT_FREE_SHIPPING_INFO_URL','1','Display URL on Product Info 0= off 1= on',5,11,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(70,'Show Product Additional Images','SHOW_PRODUCT_FREE_SHIPPING_INFO_ADDITIONAL_IMAGES','1','Display Additional Images on Product Info 0= off 1= on',5,13,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(71,'Show Starting At text on Price','SHOW_PRODUCT_FREE_SHIPPING_INFO_STARTING_AT','1','Display Starting At text on products with attributes Product Info 0= off 1= on',5,12,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(72,'Product Free Shipping Image Status - Catalog','SHOW_PRODUCT_FREE_SHIPPING_INFO_ALWAYS_FREE_SHIPPING_IMAGE_SWITCH','1','Show the Free Shipping image/text in the catalog?',5,16,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), '),(73,'Product Price Tax Class Default - When adding new products?','DEFAULT_PRODUCT_FREE_SHIPPING_TAX_CLASS_ID','0','What should the Product Price Tax Class Default ID be when adding new products?',5,100,NULL,'2019-02-19 14:19:13','',''),(74,'Product Virtual Default Status - Skip Shipping Address - When adding new products?','DEFAULT_PRODUCT_FREE_SHIPPING_PRODUCTS_VIRTUAL','0','Default Virtual Product status to be ON when adding new products?',5,101,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(75,'Product Free Shipping Default Status - Normal Shipping Rules - When adding new products?','DEFAULT_PRODUCT_FREE_SHIPPING_PRODUCTS_IS_ALWAYS_FREE_SHIPPING','1','What should the Default Free Shipping status be when adding new products?<br />Yes, Always Free Shipping ON<br />No, Always Free Shipping OFF<br />Special, Product/Download Requires Shipping',5,102,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes, Always ON\'), array(\'id\'=>\'0\', \'text\'=>\'No, Always OFF\'), array(\'id\'=>\'2\', \'text\'=>\'Special\')), '),(76,'Show Metatags Title Default - Product Title','SHOW_PRODUCT_INFO_METATAGS_TITLE_STATUS','1','Display Product Title in Meta Tags Title 0= off 1= on',1,50,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(77,'Show Metatags Title Default - Product Name','SHOW_PRODUCT_INFO_METATAGS_PRODUCTS_NAME_STATUS','1','Display Product Name in Meta Tags Title 0= off 1= on',1,51,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(78,'Show Metatags Title Default - Product Model','SHOW_PRODUCT_INFO_METATAGS_MODEL_STATUS','1','Display Product Model in Meta Tags Title 0= off 1= on',1,52,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(79,'Show Metatags Title Default - Product Price','SHOW_PRODUCT_INFO_METATAGS_PRICE_STATUS','1','Display Product Price in Meta Tags Title 0= off 1= on',1,53,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(80,'Show Metatags Title Default - Product Tagline','SHOW_PRODUCT_INFO_METATAGS_TITLE_TAGLINE_STATUS','1','Display Product Tagline in Meta Tags Title 0= off 1= on',1,54,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(81,'Show Metatags Title Default - Product Title','SHOW_PRODUCT_MUSIC_INFO_METATAGS_TITLE_STATUS','1','Display Product Title in Meta Tags Title 0= off 1= on',2,50,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(82,'Show Metatags Title Default - Product Name','SHOW_PRODUCT_MUSIC_INFO_METATAGS_PRODUCTS_NAME_STATUS','1','Display Product Name in Meta Tags Title 0= off 1= on',2,51,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(83,'Show Metatags Title Default - Product Model','SHOW_PRODUCT_MUSIC_INFO_METATAGS_MODEL_STATUS','1','Display Product Model in Meta Tags Title 0= off 1= on',2,52,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(84,'Show Metatags Title Default - Product Price','SHOW_PRODUCT_MUSIC_INFO_METATAGS_PRICE_STATUS','1','Display Product Price in Meta Tags Title 0= off 1= on',2,53,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(85,'Show Metatags Title Default - Product Tagline','SHOW_PRODUCT_MUSIC_INFO_METATAGS_TITLE_TAGLINE_STATUS','1','Display Product Tagline in Meta Tags Title 0= off 1= on',2,54,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(86,'Show Metatags Title Default - Document Title','SHOW_DOCUMENT_GENERAL_INFO_METATAGS_TITLE_STATUS','1','Display Document Title in Meta Tags Title 0= off 1= on',3,50,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(87,'Show Metatags Title Default - Document Name','SHOW_DOCUMENT_GENERAL_INFO_METATAGS_PRODUCTS_NAME_STATUS','1','Display Document Name in Meta Tags Title 0= off 1= on',3,51,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(88,'Show Metatags Title Default - Document Tagline','SHOW_DOCUMENT_GENERAL_INFO_METATAGS_TITLE_TAGLINE_STATUS','1','Display Document Tagline in Meta Tags Title 0= off 1= on',3,54,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(89,'Show Metatags Title Default - Document Title','SHOW_DOCUMENT_PRODUCT_INFO_METATAGS_TITLE_STATUS','1','Display Document Title in Meta Tags Title 0= off 1= on',4,50,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(90,'Show Metatags Title Default - Document Name','SHOW_DOCUMENT_PRODUCT_INFO_METATAGS_PRODUCTS_NAME_STATUS','1','Display Document Name in Meta Tags Title 0= off 1= on',4,51,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(91,'Show Metatags Title Default - Document Model','SHOW_DOCUMENT_PRODUCT_INFO_METATAGS_MODEL_STATUS','1','Display Document Model in Meta Tags Title 0= off 1= on',4,52,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(92,'Show Metatags Title Default - Document Price','SHOW_DOCUMENT_PRODUCT_INFO_METATAGS_PRICE_STATUS','1','Display Document Price in Meta Tags Title 0= off 1= on',4,53,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(93,'Show Metatags Title Default - Document Tagline','SHOW_DOCUMENT_PRODUCT_INFO_METATAGS_TITLE_TAGLINE_STATUS','1','Display Document Tagline in Meta Tags Title 0= off 1= on',4,54,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(94,'Show Metatags Title Default - Product Title','SHOW_PRODUCT_FREE_SHIPPING_INFO_METATAGS_TITLE_STATUS','1','Display Product Title in Meta Tags Title 0= off 1= on',5,50,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(95,'Show Metatags Title Default - Product Name','SHOW_PRODUCT_FREE_SHIPPING_INFO_METATAGS_PRODUCTS_NAME_STATUS','1','Display Product Name in Meta Tags Title 0= off 1= on',5,51,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(96,'Show Metatags Title Default - Product Model','SHOW_PRODUCT_FREE_SHIPPING_INFO_METATAGS_MODEL_STATUS','1','Display Product Model in Meta Tags Title 0= off 1= on',5,52,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(97,'Show Metatags Title Default - Product Price','SHOW_PRODUCT_FREE_SHIPPING_INFO_METATAGS_PRICE_STATUS','1','Display Product Price in Meta Tags Title 0= off 1= on',5,53,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(98,'Show Metatags Title Default - Product Tagline','SHOW_PRODUCT_FREE_SHIPPING_INFO_METATAGS_TITLE_TAGLINE_STATUS','1','Display Product Tagline in Meta Tags Title 0= off 1= on',5,54,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'True\'), array(\'id\'=>\'0\', \'text\'=>\'False\')), '),(99,'PRODUCT Attribute is Display Only - Default','DEFAULT_PRODUCT_ATTRIBUTES_DISPLAY_ONLY','0','PRODUCT Attribute is Display Only<br />Used For Display Purposes Only<br />0= No 1= Yes',1,200,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), '),(100,'PRODUCT Attribute is Free - Default','DEFAULT_PRODUCT_ATTRIBUTE_IS_FREE','1','PRODUCT Attribute is Free<br />Attribute is Free When Product is Free<br />0= No 1= Yes',1,201,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), '),(101,'PRODUCT Attribute is Default - Default','DEFAULT_PRODUCT_ATTRIBUTES_DEFAULT','0','PRODUCT Attribute is Default<br />Default Attribute to be Marked Selected<br />0= No 1= Yes',1,202,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), '),(102,'PRODUCT Attribute is Discounted - Default','DEFAULT_PRODUCT_ATTRIBUTES_DISCOUNTED','1','PRODUCT Attribute is Discounted<br />Apply Discounts Used by Product Special/Sale<br />0= No 1= Yes',1,203,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), '),(103,'PRODUCT Attribute is Included in Base Price - Default','DEFAULT_PRODUCT_ATTRIBUTES_PRICE_BASE_INCLUDED','1','PRODUCT Attribute is Included in Base Price<br />Include in Base Price When Priced by Attributes<br />0= No 1= Yes',1,204,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), '),(104,'PRODUCT Attribute is Required - Default','DEFAULT_PRODUCT_ATTRIBUTES_REQUIRED','0','PRODUCT Attribute is Required<br />Attribute Required for Text<br />0= No 1= Yes',1,205,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), '),(105,'PRODUCT Attribute Price Prefix - Default','DEFAULT_PRODUCT_PRICE_PREFIX','1','PRODUCT Attribute Price Prefix<br />Default Attribute Price Prefix for Adding<br />Blank, + or -',1,206,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'0\', \'text\'=>\'Blank\'), array(\'id\'=>\'1\', \'text\'=>\'+\'), array(\'id\'=>\'2\', \'text\'=>\'-\')), '),(106,'PRODUCT Attribute Weight Prefix - Default','DEFAULT_PRODUCT_PRODUCTS_ATTRIBUTES_WEIGHT_PREFIX','1','PRODUCT Attribute Weight Prefix<br />Default Attribute Weight Prefix<br />Blank, + or -',1,207,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'0\', \'text\'=>\'Blank\'), array(\'id\'=>\'1\', \'text\'=>\'+\'), array(\'id\'=>\'2\', \'text\'=>\'-\')), '),(107,'MUSIC Attribute is Display Only - Default','DEFAULT_PRODUCT_MUSIC_ATTRIBUTES_DISPLAY_ONLY','0','MUSIC Attribute is Display Only<br />Used For Display Purposes Only<br />0= No 1= Yes',2,200,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), '),(108,'MUSIC Attribute is Free - Default','DEFAULT_PRODUCT_MUSIC_ATTRIBUTE_IS_FREE','1','MUSIC Attribute is Free<br />Attribute is Free When Product is Free<br />0= No 1= Yes',2,201,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), '),(109,'MUSIC Attribute is Default - Default','DEFAULT_PRODUCT_MUSIC_ATTRIBUTES_DEFAULT','0','MUSIC Attribute is Default<br />Default Attribute to be Marked Selected<br />0= No 1= Yes',2,202,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), '),(110,'MUSIC Attribute is Discounted - Default','DEFAULT_PRODUCT_MUSIC_ATTRIBUTES_DISCOUNTED','1','MUSIC Attribute is Discounted<br />Apply Discounts Used by Product Special/Sale<br />0= No 1= Yes',2,203,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), '),(111,'MUSIC Attribute is Included in Base Price - Default','DEFAULT_PRODUCT_MUSIC_ATTRIBUTES_PRICE_BASE_INCLUDED','1','MUSIC Attribute is Included in Base Price<br />Include in Base Price When Priced by Attributes<br />0= No 1= Yes',2,204,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), '),(112,'MUSIC Attribute is Required - Default','DEFAULT_PRODUCT_MUSIC_ATTRIBUTES_REQUIRED','0','MUSIC Attribute is Required<br />Attribute Required for Text<br />0= No 1= Yes',2,205,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), '),(113,'MUSIC Attribute Price Prefix - Default','DEFAULT_PRODUCT_MUSIC_PRICE_PREFIX','1','MUSIC Attribute Price Prefix<br />Default Attribute Price Prefix for Adding<br />Blank, + or -',2,206,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'0\', \'text\'=>\'Blank\'), array(\'id\'=>\'1\', \'text\'=>\'+\'), array(\'id\'=>\'2\', \'text\'=>\'-\')), '),(114,'MUSIC Attribute Weight Prefix - Default','DEFAULT_PRODUCT_MUSIC_PRODUCTS_ATTRIBUTES_WEIGHT_PREFIX','1','MUSIC Attribute Weight Prefix<br />Default Attribute Weight Prefix<br />Blank, + or -',2,207,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'0\', \'text\'=>\'Blank\'), array(\'id\'=>\'1\', \'text\'=>\'+\'), array(\'id\'=>\'2\', \'text\'=>\'-\')), '),(115,'DOCUMENT GENERAL Attribute is Display Only - Default','DEFAULT_DOCUMENT_GENERAL_ATTRIBUTES_DISPLAY_ONLY','0','DOCUMENT GENERAL Attribute is Display Only<br />Used For Display Purposes Only<br />0= No 1= Yes',3,200,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), '),(116,'DOCUMENT GENERAL Attribute is Free - Default','DEFAULT_DOCUMENT_GENERAL_ATTRIBUTE_IS_FREE','1','DOCUMENT GENERAL Attribute is Free<br />Attribute is Free When Product is Free<br />0= No 1= Yes',3,201,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), '),(117,'DOCUMENT GENERAL Attribute is Default - Default','DEFAULT_DOCUMENT_GENERAL_ATTRIBUTES_DEFAULT','0','DOCUMENT GENERAL Attribute is Default<br />Default Attribute to be Marked Selected<br />0= No 1= Yes',3,202,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), '),(118,'DOCUMENT GENERAL Attribute is Discounted - Default','DEFAULT_DOCUMENT_GENERAL_ATTRIBUTES_DISCOUNTED','1','DOCUMENT GENERAL Attribute is Discounted<br />Apply Discounts Used by Product Special/Sale<br />0= No 1= Yes',3,203,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), '),(119,'DOCUMENT GENERAL Attribute is Included in Base Price - Default','DEFAULT_DOCUMENT_GENERAL_ATTRIBUTES_PRICE_BASE_INCLUDED','1','DOCUMENT GENERAL Attribute is Included in Base Price<br />Include in Base Price When Priced by Attributes<br />0= No 1= Yes',3,204,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), '),(120,'DOCUMENT GENERAL Attribute is Required - Default','DEFAULT_DOCUMENT_GENERAL_ATTRIBUTES_REQUIRED','0','DOCUMENT GENERAL Attribute is Required<br />Attribute Required for Text<br />0= No 1= Yes',3,205,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), '),(121,'DOCUMENT GENERAL Attribute Price Prefix - Default','DEFAULT_DOCUMENT_GENERAL_PRICE_PREFIX','1','DOCUMENT GENERAL Attribute Price Prefix<br />Default Attribute Price Prefix for Adding<br />Blank, + or -',3,206,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'0\', \'text\'=>\'Blank\'), array(\'id\'=>\'1\', \'text\'=>\'+\'), array(\'id\'=>\'2\', \'text\'=>\'-\')), '),(122,'DOCUMENT GENERAL Attribute Weight Prefix - Default','DEFAULT_DOCUMENT_GENERAL_PRODUCTS_ATTRIBUTES_WEIGHT_PREFIX','1','DOCUMENT GENERAL Attribute Weight Prefix<br />Default Attribute Weight Prefix<br />Blank, + or -',3,207,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'0\', \'text\'=>\'Blank\'), array(\'id\'=>\'1\', \'text\'=>\'+\'), array(\'id\'=>\'2\', \'text\'=>\'-\')), '),(123,'DOCUMENT PRODUCT Attribute is Display Only - Default','DEFAULT_DOCUMENT_PRODUCT_ATTRIBUTES_DISPLAY_ONLY','0','DOCUMENT PRODUCT Attribute is Display Only<br />Used For Display Purposes Only<br />0= No 1= Yes',4,200,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), '),(124,'DOCUMENT PRODUCT Attribute is Free - Default','DEFAULT_DOCUMENT_PRODUCT_ATTRIBUTE_IS_FREE','1','DOCUMENT PRODUCT Attribute is Free<br />Attribute is Free When Product is Free<br />0= No 1= Yes',4,201,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), '),(125,'DOCUMENT PRODUCT Attribute is Default - Default','DEFAULT_DOCUMENT_PRODUCT_ATTRIBUTES_DEFAULT','0','DOCUMENT PRODUCT Attribute is Default<br />Default Attribute to be Marked Selected<br />0= No 1= Yes',4,202,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), '),(126,'DOCUMENT PRODUCT Attribute is Discounted - Default','DEFAULT_DOCUMENT_PRODUCT_ATTRIBUTES_DISCOUNTED','1','DOCUMENT PRODUCT Attribute is Discounted<br />Apply Discounts Used by Product Special/Sale<br />0= No 1= Yes',4,203,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), '),(127,'DOCUMENT PRODUCT Attribute is Included in Base Price - Default','DEFAULT_DOCUMENT_PRODUCT_ATTRIBUTES_PRICE_BASE_INCLUDED','1','DOCUMENT PRODUCT Attribute is Included in Base Price<br />Include in Base Price When Priced by Attributes<br />0= No 1= Yes',4,204,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), '),(128,'DOCUMENT PRODUCT Attribute is Required - Default','DEFAULT_DOCUMENT_PRODUCT_ATTRIBUTES_REQUIRED','0','DOCUMENT PRODUCT Attribute is Required<br />Attribute Required for Text<br />0= No 1= Yes',4,205,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), '),(129,'DOCUMENT PRODUCT Attribute Price Prefix - Default','DEFAULT_DOCUMENT_PRODUCT_PRICE_PREFIX','1','DOCUMENT PRODUCT Attribute Price Prefix<br />Default Attribute Price Prefix for Adding<br />Blank, + or -',4,206,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'0\', \'text\'=>\'Blank\'), array(\'id\'=>\'1\', \'text\'=>\'+\'), array(\'id\'=>\'2\', \'text\'=>\'-\')), '),(130,'DOCUMENT PRODUCT Attribute Weight Prefix - Default','DEFAULT_DOCUMENT_PRODUCT_PRODUCTS_ATTRIBUTES_WEIGHT_PREFIX','1','DOCUMENT PRODUCT Attribute Weight Prefix<br />Default Attribute Weight Prefix<br />Blank, + or -',4,207,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'0\', \'text\'=>\'Blank\'), array(\'id\'=>\'1\', \'text\'=>\'+\'), array(\'id\'=>\'2\', \'text\'=>\'-\')), '),(131,'PRODUCT FREE SHIPPING Attribute is Display Only - Default','DEFAULT_PRODUCT_FREE_SHIPPING_ATTRIBUTES_DISPLAY_ONLY','0','PRODUCT FREE SHIPPING Attribute is Display Only<br />Used For Display Purposes Only<br />0= No 1= Yes',5,201,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), '),(132,'PRODUCT FREE SHIPPING Attribute is Free - Default','DEFAULT_PRODUCT_FREE_SHIPPING_ATTRIBUTE_IS_FREE','1','PRODUCT FREE SHIPPING Attribute is Free<br />Attribute is Free When Product is Free<br />0= No 1= Yes',5,201,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), '),(133,'PRODUCT FREE SHIPPING Attribute is Default - Default','DEFAULT_PRODUCT_FREE_SHIPPING_ATTRIBUTES_DEFAULT','0','PRODUCT FREE SHIPPING Attribute is Default<br />Default Attribute to be Marked Selected<br />0= No 1= Yes',5,202,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), '),(134,'PRODUCT FREE SHIPPING Attribute is Discounted - Default','DEFAULT_PRODUCT_FREE_SHIPPING_ATTRIBUTES_DISCOUNTED','1','PRODUCT FREE SHIPPING Attribute is Discounted<br />Apply Discounts Used by Product Special/Sale<br />0= No 1= Yes',5,203,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), '),(135,'PRODUCT FREE SHIPPING Attribute is Included in Base Price - Default','DEFAULT_PRODUCT_FREE_SHIPPING_ATTRIBUTES_PRICE_BASE_INCLUDED','1','PRODUCT FREE SHIPPING Attribute is Included in Base Price<br />Include in Base Price When Priced by Attributes<br />0= No 1= Yes',5,204,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), '),(136,'PRODUCT FREE SHIPPING Attribute is Required - Default','DEFAULT_PRODUCT_FREE_SHIPPING_ATTRIBUTES_REQUIRED','0','PRODUCT FREE SHIPPING Attribute is Required<br />Attribute Required for Text<br />0= No 1= Yes',5,205,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'1\', \'text\'=>\'Yes\'), array(\'id\'=>\'0\', \'text\'=>\'No\')), '),(137,'PRODUCT FREE SHIPPING Attribute Price Prefix - Default','DEFAULT_PRODUCT_FREE_SHIPPING_PRICE_PREFIX','1','PRODUCT FREE SHIPPING Attribute Price Prefix<br />Default Attribute Price Prefix for Adding<br />Blank, + or -',5,206,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'0\', \'text\'=>\'Blank\'), array(\'id\'=>\'1\', \'text\'=>\'+\'), array(\'id\'=>\'2\', \'text\'=>\'-\')), '),(138,'PRODUCT FREE SHIPPING Attribute Weight Prefix - Default','DEFAULT_PRODUCT_FREE_SHIPPING_PRODUCTS_ATTRIBUTES_WEIGHT_PREFIX','1','PRODUCT FREE SHIPPING Attribute Weight Prefix<br />Default Attribute Weight Prefix<br />Blank, + or -',5,207,NULL,'2019-02-19 14:19:13',NULL,'zen_cfg_select_drop_down(array(array(\'id\'=>\'0\', \'text\'=>\'Blank\'), array(\'id\'=>\'1\', \'text\'=>\'+\'), array(\'id\'=>\'2\', \'text\'=>\'-\')), ');
/*!40000 ALTER TABLE `product_type_layout` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_types`
--

DROP TABLE IF EXISTS `product_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_types` (
  `type_id` int(11) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(255) NOT NULL DEFAULT '',
  `type_handler` varchar(255) NOT NULL DEFAULT '',
  `type_master_type` int(11) NOT NULL DEFAULT '1',
  `allow_add_to_cart` char(1) NOT NULL DEFAULT 'Y',
  `default_image` varchar(255) NOT NULL DEFAULT '',
  `date_added` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `last_modified` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  PRIMARY KEY (`type_id`),
  KEY `idx_type_master_type_zen` (`type_master_type`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_types`
--

LOCK TABLES `product_types` WRITE;
/*!40000 ALTER TABLE `product_types` DISABLE KEYS */;
INSERT INTO `product_types` VALUES (1,'Product - General','product',1,'Y','','2019-02-19 14:19:13','2019-02-19 14:19:13'),(2,'Product - Music','product_music',1,'Y','','2019-02-19 14:19:13','2019-02-19 14:19:13'),(3,'Document - General','document_general',3,'N','','2019-02-19 14:19:13','2019-02-19 14:19:13'),(4,'Document - Product','document_product',3,'Y','','2019-02-19 14:19:13','2019-02-19 14:19:13'),(5,'Product - Free Shipping','product_free_shipping',1,'Y','','2019-02-19 14:19:13','2019-02-19 14:19:13');
/*!40000 ALTER TABLE `product_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_types_to_category`
--

DROP TABLE IF EXISTS `product_types_to_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_types_to_category` (
  `product_type_id` int(11) NOT NULL DEFAULT '0',
  `category_id` int(11) NOT NULL DEFAULT '0',
  KEY `idx_category_id_zen` (`category_id`),
  KEY `idx_product_type_id_zen` (`product_type_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_types_to_category`
--

LOCK TABLES `product_types_to_category` WRITE;
/*!40000 ALTER TABLE `product_types_to_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_types_to_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `products_id` int(11) NOT NULL AUTO_INCREMENT,
  `products_type` int(11) NOT NULL DEFAULT '1',
  `products_quantity` float NOT NULL DEFAULT '0',
  `products_model` varchar(32) DEFAULT NULL,
  `products_image` varchar(255) DEFAULT NULL,
  `products_price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `products_virtual` tinyint(1) NOT NULL DEFAULT '0',
  `products_date_added` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `products_last_modified` datetime DEFAULT NULL,
  `products_date_available` datetime DEFAULT NULL,
  `products_weight` float NOT NULL DEFAULT '0',
  `products_status` tinyint(1) NOT NULL DEFAULT '0',
  `products_tax_class_id` int(11) NOT NULL DEFAULT '0',
  `manufacturers_id` int(11) DEFAULT NULL,
  `products_ordered` float NOT NULL DEFAULT '0',
  `products_quantity_order_min` float NOT NULL DEFAULT '1',
  `products_quantity_order_units` float NOT NULL DEFAULT '1',
  `products_priced_by_attribute` tinyint(1) NOT NULL DEFAULT '0',
  `product_is_free` tinyint(1) NOT NULL DEFAULT '0',
  `product_is_call` tinyint(1) NOT NULL DEFAULT '0',
  `products_quantity_mixed` tinyint(1) NOT NULL DEFAULT '0',
  `product_is_always_free_shipping` tinyint(1) NOT NULL DEFAULT '0',
  `products_qty_box_status` tinyint(1) NOT NULL DEFAULT '1',
  `products_quantity_order_max` float NOT NULL DEFAULT '0',
  `products_sort_order` int(11) NOT NULL DEFAULT '0',
  `products_discount_type` tinyint(1) NOT NULL DEFAULT '0',
  `products_discount_type_from` tinyint(1) NOT NULL DEFAULT '0',
  `products_price_sorter` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `master_categories_id` int(11) NOT NULL DEFAULT '0',
  `products_mixed_discount_quantity` tinyint(1) NOT NULL DEFAULT '1',
  `metatags_title_status` tinyint(1) NOT NULL DEFAULT '0',
  `metatags_products_name_status` tinyint(1) NOT NULL DEFAULT '0',
  `metatags_model_status` tinyint(1) NOT NULL DEFAULT '0',
  `metatags_price_status` tinyint(1) NOT NULL DEFAULT '0',
  `metatags_title_tagline_status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`products_id`),
  KEY `idx_products_date_added_zen` (`products_date_added`),
  KEY `idx_products_status_zen` (`products_status`),
  KEY `idx_products_date_available_zen` (`products_date_available`),
  KEY `idx_products_ordered_zen` (`products_ordered`),
  KEY `idx_products_model_zen` (`products_model`),
  KEY `idx_products_price_sorter_zen` (`products_price_sorter`),
  KEY `idx_master_categories_id_zen` (`master_categories_id`),
  KEY `idx_products_sort_order_zen` (`products_sort_order`),
  KEY `idx_manufacturers_id_zen` (`manufacturers_id`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (2,1,5,'','car.png',5.0000,0,'2019-02-19 16:05:31',NULL,'2019-11-29 00:00:00',0,1,0,5,0,1,1,0,0,0,1,0,1,0,0,0,0,5.0000,25,1,0,0,0,0,0),(3,1,5,'','motor.png',3.0000,0,'2019-02-19 16:06:41',NULL,'2019-11-29 00:00:00',0,1,0,5,0,1,1,0,0,0,1,0,1,0,0,0,0,3.0000,22,1,0,0,0,0,0),(4,1,9,'','orgol.png',10.0000,0,'2019-02-19 16:08:12','2019-02-19 22:30:06','2019-11-22 00:00:00',0,1,0,5,1,1,1,0,0,0,1,0,1,0,0,0,0,10.0000,23,1,0,0,0,0,0),(5,1,10,'','toy.png',10.0000,0,'2019-02-19 16:09:27',NULL,'2019-11-29 00:00:00',0,1,0,5,0,1,1,0,0,0,1,0,1,0,0,0,0,10.0000,24,1,0,0,0,0,0),(6,1,0,'','3.jpeg',30.0000,0,'2019-02-19 16:18:06','2019-02-19 16:18:35','2019-11-15 00:00:00',0,0,0,6,1,1,1,0,0,0,1,0,1,0,0,0,0,30.0000,21,1,0,0,0,0,0),(7,1,9,'','superman.jpeg',2.0000,0,'2019-02-19 16:21:37',NULL,'2019-11-30 00:00:00',0,1,0,1,1,1,1,0,0,0,1,0,1,0,0,0,0,2.0000,19,1,0,0,0,0,0),(8,1,10,'','bell shape.jpeg',2.0000,0,'2019-02-19 16:22:52','2019-02-19 16:26:59','2019-11-28 00:00:00',0,1,0,1,0,1,1,0,0,0,1,0,1,0,0,0,0,2.0000,17,1,0,0,0,0,0),(9,1,10,'','love you.jpeg',2.0000,0,'2019-02-19 16:23:24','2019-02-19 16:26:46','2019-11-29 00:00:00',0,1,0,1,0,1,1,0,0,0,1,0,1,0,0,0,0,2.0000,18,1,0,0,0,0,0),(10,1,1,'','스크린샷 2019-02-19 오후 9.08.54.png',35.0000,0,'2019-02-19 21:15:03','2019-02-19 21:15:46','2019-11-30 00:00:00',0,1,0,2,0,1,1,0,0,0,1,0,1,0,0,0,0,35.0000,13,1,0,0,0,0,0),(11,1,100,'','photo(1).jpeg',2.5000,0,'2019-02-19 21:18:30',NULL,'2019-11-30 00:00:00',0,1,0,2,0,1,1,0,0,0,1,0,1,0,0,0,0,2.5000,6,1,0,0,0,0,0),(12,1,10,'','captainamerica.jpeg',2.0000,0,'2019-02-19 21:20:11','2019-02-19 22:35:20','2019-10-31 00:00:00',0,1,0,2,0,1,1,0,0,0,1,0,1,0,0,0,0,2.0000,30,1,0,0,0,0,0),(13,1,10,'','hulk.jpeg',4.0000,0,'2019-02-19 21:20:45','2019-02-19 22:35:37','2019-11-01 00:00:00',0,1,0,2,0,1,1,0,0,0,1,0,1,0,0,0,0,4.0000,27,1,0,0,0,0,0),(14,1,10,'','ironman.jpeg',5.0000,0,'2019-02-19 21:21:40','2019-02-19 22:35:57','2019-12-25 00:00:00',0,1,0,2,0,1,1,0,0,0,1,0,1,0,0,0,0,5.0000,28,1,0,0,0,0,0),(15,1,5,'','groot.jpeg',15.0000,0,'2019-02-19 21:22:08','2019-02-19 22:35:03','2019-11-14 00:00:00',0,1,0,2,0,1,1,0,0,0,1,0,1,0,0,0,0,15.0000,29,1,0,0,0,0,0),(16,1,5,'','airpurifier1.jpeg',12.0000,0,'2019-02-19 22:13:40',NULL,'2019-12-27 00:00:00',0,1,0,3,0,1,1,0,0,0,1,0,1,0,0,0,0,12.0000,15,1,0,0,0,0,0),(17,1,4,'','airpurifier2.jpeg',25.0000,0,'2019-02-19 22:14:26',NULL,'2019-11-21 00:00:00',0,1,0,3,1,1,1,0,0,0,1,0,1,0,0,0,0,25.0000,14,1,0,0,0,0,0),(18,1,9,'','woodbasket.jpeg',3.0000,0,'2019-02-19 22:15:11',NULL,'2019-11-29 00:00:00',0,1,0,3,1,1,1,0,0,0,1,0,1,0,0,0,0,3.0000,10,1,0,0,0,0,0),(19,1,9,'','acryl nametag.jpeg',2.0000,0,'2019-02-19 22:15:44',NULL,'2019-11-28 00:00:00',0,1,0,3,1,1,1,0,0,0,1,0,1,0,0,0,0,2.0000,9,1,0,0,0,0,0),(20,1,10,'','logprint.jpeg',10.0000,0,'2019-02-19 22:16:09',NULL,'2019-11-15 00:00:00',0,1,0,3,0,1,1,0,0,0,1,0,1,0,0,0,0,10.0000,11,1,0,0,0,0,0),(21,1,5,'','1.jpeg',0.0000,1,'2019-02-19 23:09:13','2019-02-19 23:23:55','2019-12-18 00:00:00',0,1,0,7,0,1,1,1,0,0,0,1,0,0,0,0,0,0.0000,31,1,0,0,0,0,0);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_attributes`
--

DROP TABLE IF EXISTS `products_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products_attributes` (
  `products_attributes_id` int(11) NOT NULL AUTO_INCREMENT,
  `products_id` int(11) NOT NULL DEFAULT '0',
  `options_id` int(11) NOT NULL DEFAULT '0',
  `options_values_id` int(11) NOT NULL DEFAULT '0',
  `options_values_price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `price_prefix` char(1) NOT NULL DEFAULT '',
  `products_options_sort_order` int(11) NOT NULL DEFAULT '0',
  `product_attribute_is_free` tinyint(1) NOT NULL DEFAULT '0',
  `products_attributes_weight` float NOT NULL DEFAULT '0',
  `products_attributes_weight_prefix` char(1) NOT NULL DEFAULT '',
  `attributes_display_only` tinyint(1) NOT NULL DEFAULT '0',
  `attributes_default` tinyint(1) NOT NULL DEFAULT '0',
  `attributes_discounted` tinyint(1) NOT NULL DEFAULT '1',
  `attributes_image` varchar(255) DEFAULT NULL,
  `attributes_price_base_included` tinyint(1) NOT NULL DEFAULT '1',
  `attributes_price_onetime` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `attributes_price_factor` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `attributes_price_factor_offset` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `attributes_price_factor_onetime` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `attributes_price_factor_onetime_offset` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `attributes_qty_prices` text,
  `attributes_qty_prices_onetime` text,
  `attributes_price_words` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `attributes_price_words_free` int(4) NOT NULL DEFAULT '0',
  `attributes_price_letters` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `attributes_price_letters_free` int(4) NOT NULL DEFAULT '0',
  `attributes_required` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`products_attributes_id`),
  KEY `idx_id_options_id_values_zen` (`products_id`,`options_id`,`options_values_id`),
  KEY `idx_opt_sort_order_zen` (`products_options_sort_order`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_attributes`
--

LOCK TABLES `products_attributes` WRITE;
/*!40000 ALTER TABLE `products_attributes` DISABLE KEYS */;
/*!40000 ALTER TABLE `products_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_attributes_download`
--

DROP TABLE IF EXISTS `products_attributes_download`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products_attributes_download` (
  `products_attributes_id` int(11) NOT NULL DEFAULT '0',
  `products_attributes_filename` varchar(255) NOT NULL DEFAULT '',
  `products_attributes_maxdays` int(2) DEFAULT '0',
  `products_attributes_maxcount` int(2) DEFAULT '0',
  PRIMARY KEY (`products_attributes_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_attributes_download`
--

LOCK TABLES `products_attributes_download` WRITE;
/*!40000 ALTER TABLE `products_attributes_download` DISABLE KEYS */;
/*!40000 ALTER TABLE `products_attributes_download` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_description`
--

DROP TABLE IF EXISTS `products_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products_description` (
  `products_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL DEFAULT '1',
  `products_name` varchar(64) NOT NULL DEFAULT '',
  `products_description` text,
  `products_url` varchar(255) DEFAULT NULL,
  `products_viewed` int(5) DEFAULT '0',
  PRIMARY KEY (`products_id`,`language_id`),
  KEY `idx_products_name_zen` (`products_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_description`
--

LOCK TABLES `products_description` WRITE;
/*!40000 ALTER TABLE `products_description` DISABLE KEYS */;
INSERT INTO `products_description` VALUES (3,1,'Mini Motor','this is mini motor made by 3D printer.','',3),(2,1,'Toy Car','this is toy car.','',4),(4,1,'orgel','this is orgel.','',6),(5,1,'Toy Tower','this is toy tower','',3),(6,1,'Welcome to Las vegas ! <gear machine>','','',6),(7,1,'Superman Mark','','',5),(8,1,'Bell-shaped','','',4),(9,1,'Love you','','',4),(10,1,'big-sized air purifier','this is big-sized air purifier.','',7),(11,1,'Customized 3D photo','this is customized 3D photo. \r\nyou can send photo file to our store,\r\nwe can use that image, and can make 3D photo product.','',8),(12,1,'Captain America','','',2),(13,1,'Hulk','','',1),(14,1,'Iron Man','','',3),(15,1,'Baby Groot','','',2),(16,1,'Small-sized Air Purifier','','',4),(17,1,'Mid-sized Air Purifier','','',9),(18,1,'Wood Basket','','',5),(19,1,'Acryl Nametag','','',3),(20,1,'Logo Print','','',5),(21,1,'3D Scanning','This is ATLAS 3D scanner that can scan the real object!\r\nAfter the object is scanned, the modeling file (STL, PLY, OBJ ...) is produced, post-processed, and are ready to be 3D printed. However, this is only appropriate for small and simple objects!!','',7);
/*!40000 ALTER TABLE `products_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_discount_quantity`
--

DROP TABLE IF EXISTS `products_discount_quantity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products_discount_quantity` (
  `discount_id` int(4) NOT NULL DEFAULT '0',
  `products_id` int(11) NOT NULL DEFAULT '0',
  `discount_qty` float NOT NULL DEFAULT '0',
  `discount_price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  KEY `idx_id_qty_zen` (`products_id`,`discount_qty`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_discount_quantity`
--

LOCK TABLES `products_discount_quantity` WRITE;
/*!40000 ALTER TABLE `products_discount_quantity` DISABLE KEYS */;
/*!40000 ALTER TABLE `products_discount_quantity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_notifications`
--

DROP TABLE IF EXISTS `products_notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products_notifications` (
  `products_id` int(11) NOT NULL DEFAULT '0',
  `customers_id` int(11) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  PRIMARY KEY (`products_id`,`customers_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_notifications`
--

LOCK TABLES `products_notifications` WRITE;
/*!40000 ALTER TABLE `products_notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `products_notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_options`
--

DROP TABLE IF EXISTS `products_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products_options` (
  `products_options_id` int(11) NOT NULL DEFAULT '0',
  `language_id` int(11) NOT NULL DEFAULT '1',
  `products_options_name` varchar(32) NOT NULL DEFAULT '',
  `products_options_sort_order` int(11) NOT NULL DEFAULT '0',
  `products_options_type` int(5) NOT NULL DEFAULT '0',
  `products_options_length` smallint(2) NOT NULL DEFAULT '32',
  `products_options_comment` varchar(255) DEFAULT NULL,
  `products_options_size` smallint(2) NOT NULL DEFAULT '32',
  `products_options_images_per_row` int(2) DEFAULT '5',
  `products_options_images_style` int(1) DEFAULT '0',
  `products_options_rows` smallint(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`products_options_id`,`language_id`),
  KEY `idx_lang_id_zen` (`language_id`),
  KEY `idx_products_options_sort_order_zen` (`products_options_sort_order`),
  KEY `idx_products_options_name_zen` (`products_options_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_options`
--

LOCK TABLES `products_options` WRITE;
/*!40000 ALTER TABLE `products_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `products_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_options_types`
--

DROP TABLE IF EXISTS `products_options_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products_options_types` (
  `products_options_types_id` int(11) NOT NULL DEFAULT '0',
  `products_options_types_name` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`products_options_types_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COMMENT='Track products_options_types';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_options_types`
--

LOCK TABLES `products_options_types` WRITE;
/*!40000 ALTER TABLE `products_options_types` DISABLE KEYS */;
INSERT INTO `products_options_types` VALUES (0,'Dropdown'),(1,'Text'),(2,'Radio'),(3,'Checkbox'),(4,'File'),(5,'Read Only');
/*!40000 ALTER TABLE `products_options_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_options_values`
--

DROP TABLE IF EXISTS `products_options_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products_options_values` (
  `products_options_values_id` int(11) NOT NULL DEFAULT '0',
  `language_id` int(11) NOT NULL DEFAULT '1',
  `products_options_values_name` varchar(64) NOT NULL DEFAULT '',
  `products_options_values_sort_order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`products_options_values_id`,`language_id`),
  KEY `idx_products_options_values_name_zen` (`products_options_values_name`),
  KEY `idx_products_options_values_sort_order_zen` (`products_options_values_sort_order`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_options_values`
--

LOCK TABLES `products_options_values` WRITE;
/*!40000 ALTER TABLE `products_options_values` DISABLE KEYS */;
INSERT INTO `products_options_values` VALUES (0,1,'TEXT',0);
/*!40000 ALTER TABLE `products_options_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_options_values_to_products_options`
--

DROP TABLE IF EXISTS `products_options_values_to_products_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products_options_values_to_products_options` (
  `products_options_values_to_products_options_id` int(11) NOT NULL AUTO_INCREMENT,
  `products_options_id` int(11) NOT NULL DEFAULT '0',
  `products_options_values_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`products_options_values_to_products_options_id`),
  KEY `idx_products_options_id_zen` (`products_options_id`),
  KEY `idx_products_options_values_id_zen` (`products_options_values_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_options_values_to_products_options`
--

LOCK TABLES `products_options_values_to_products_options` WRITE;
/*!40000 ALTER TABLE `products_options_values_to_products_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `products_options_values_to_products_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_to_categories`
--

DROP TABLE IF EXISTS `products_to_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products_to_categories` (
  `products_id` int(11) NOT NULL DEFAULT '0',
  `categories_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`products_id`,`categories_id`),
  KEY `idx_cat_prod_id_zen` (`categories_id`,`products_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_to_categories`
--

LOCK TABLES `products_to_categories` WRITE;
/*!40000 ALTER TABLE `products_to_categories` DISABLE KEYS */;
INSERT INTO `products_to_categories` VALUES (2,25),(3,22),(4,23),(5,24),(6,21),(7,19),(8,17),(9,18),(10,13),(11,6),(12,30),(13,27),(14,28),(15,29),(16,15),(17,14),(18,10),(19,9),(20,11),(21,31);
/*!40000 ALTER TABLE `products_to_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_version`
--

DROP TABLE IF EXISTS `project_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_version` (
  `project_version_id` tinyint(3) NOT NULL AUTO_INCREMENT,
  `project_version_key` varchar(40) NOT NULL DEFAULT '',
  `project_version_major` varchar(20) NOT NULL DEFAULT '',
  `project_version_minor` varchar(20) NOT NULL DEFAULT '',
  `project_version_patch1` varchar(20) NOT NULL DEFAULT '',
  `project_version_patch2` varchar(20) NOT NULL DEFAULT '',
  `project_version_patch1_source` varchar(20) NOT NULL DEFAULT '',
  `project_version_patch2_source` varchar(20) NOT NULL DEFAULT '',
  `project_version_comment` varchar(250) NOT NULL DEFAULT '',
  `project_version_date_applied` datetime NOT NULL DEFAULT '0001-01-01 01:01:01',
  PRIMARY KEY (`project_version_id`),
  UNIQUE KEY `idx_project_version_key_zen` (`project_version_key`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='Database Version Tracking';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_version`
--

LOCK TABLES `project_version` WRITE;
/*!40000 ALTER TABLE `project_version` DISABLE KEYS */;
INSERT INTO `project_version` VALUES (1,'Zen-Cart Main','1','5.6a','','','','','New Installation-v156a','2019-02-19 14:19:13'),(2,'Zen-Cart Database','1','5.6','','','','','New Installation-v156a','2019-02-19 14:19:13');
/*!40000 ALTER TABLE `project_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_version_history`
--

DROP TABLE IF EXISTS `project_version_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_version_history` (
  `project_version_id` tinyint(3) NOT NULL AUTO_INCREMENT,
  `project_version_key` varchar(40) NOT NULL DEFAULT '',
  `project_version_major` varchar(20) NOT NULL DEFAULT '',
  `project_version_minor` varchar(20) NOT NULL DEFAULT '',
  `project_version_patch` varchar(20) NOT NULL DEFAULT '',
  `project_version_comment` varchar(250) NOT NULL DEFAULT '',
  `project_version_date_applied` datetime NOT NULL DEFAULT '0001-01-01 01:01:01',
  PRIMARY KEY (`project_version_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='Database Version Tracking History';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_version_history`
--

LOCK TABLES `project_version_history` WRITE;
/*!40000 ALTER TABLE `project_version_history` DISABLE KEYS */;
INSERT INTO `project_version_history` VALUES (1,'Zen-Cart Main','1','5.6a','','New Installation-v156a','2019-02-19 14:19:13'),(2,'Zen-Cart Database','1','5.6','','New Installation-v156a','2019-02-19 14:19:13');
/*!40000 ALTER TABLE `project_version_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `query_builder`
--

DROP TABLE IF EXISTS `query_builder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `query_builder` (
  `query_id` int(11) NOT NULL AUTO_INCREMENT,
  `query_category` varchar(40) NOT NULL DEFAULT '',
  `query_name` varchar(80) NOT NULL DEFAULT '',
  `query_description` text NOT NULL,
  `query_string` text NOT NULL,
  `query_keys_list` text NOT NULL,
  PRIMARY KEY (`query_id`),
  UNIQUE KEY `query_name` (`query_name`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COMMENT='Stores queries for re-use in Admin email and report modules';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `query_builder`
--

LOCK TABLES `query_builder` WRITE;
/*!40000 ALTER TABLE `query_builder` DISABLE KEYS */;
INSERT INTO `query_builder` VALUES (1,'email','All Customers','Returns all customers name and email address for sending mass emails (ie: for newsletters, coupons, GVs, messages, etc).','select customers_email_address, customers_firstname, customers_lastname from TABLE_CUSTOMERS order by customers_lastname, customers_firstname, customers_email_address',''),(2,'email,newsletters','All Newsletter Subscribers','Returns name and email address of newsletter subscribers','select customers_firstname, customers_lastname, customers_email_address from TABLE_CUSTOMERS where customers_newsletter = \'1\'',''),(3,'email,newsletters','Dormant Customers (>3months) (Subscribers)','Subscribers who HAVE purchased something, but have NOT purchased for at least three months.','select max(o.date_purchased) as date_purchased, c.customers_email_address, c.customers_lastname, c.customers_firstname from TABLE_CUSTOMERS c, TABLE_ORDERS o WHERE c.customers_id = o.customers_id AND c.customers_newsletter = 1 GROUP BY c.customers_email_address, c.customers_lastname, c.customers_firstname HAVING max(o.date_purchased) <= subdate(now(),INTERVAL 3 MONTH) ORDER BY c.customers_lastname, c.customers_firstname ASC',''),(4,'email,newsletters','Active customers in past 3 months (Subscribers)','Newsletter subscribers who are also active customers (purchased something) in last 3 months.','select c.customers_email_address, c.customers_lastname, c.customers_firstname from TABLE_CUSTOMERS c, TABLE_ORDERS o where c.customers_newsletter = \'1\' AND c.customers_id = o.customers_id and o.date_purchased > subdate(now(),INTERVAL 3 MONTH) GROUP BY c.customers_email_address, c.customers_lastname, c.customers_firstname order by c.customers_lastname, c.customers_firstname ASC',''),(5,'email,newsletters','Active customers in past 3 months (Regardless of subscription status)','All active customers (purchased something) in last 3 months, ignoring newsletter-subscription status.','select c.customers_email_address, c.customers_lastname, c.customers_firstname from TABLE_CUSTOMERS c, TABLE_ORDERS o WHERE c.customers_id = o.customers_id and o.date_purchased > subdate(now(),INTERVAL 3 MONTH) GROUP BY c.customers_email_address, c.customers_lastname, c.customers_firstname order by c.customers_lastname, c.customers_firstname ASC',''),(6,'email,newsletters','Administrator','Just the email account of the current administrator','select \'ADMIN\' as customers_firstname, admin_name as customers_lastname, admin_email as customers_email_address from TABLE_ADMIN where admin_id = $SESSION:admin_id',''),(7,'email,newsletters','Customers who have never completed a purchase','For sending newsletter to all customers who registered but have never completed a purchase','SELECT DISTINCT c.customers_email_address as customers_email_address, c.customers_lastname as customers_lastname, c.customers_firstname as customers_firstname FROM TABLE_CUSTOMERS c LEFT JOIN  TABLE_ORDERS o ON c.customers_id=o.customers_id WHERE o.date_purchased IS NULL','');
/*!40000 ALTER TABLE `query_builder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `record_artists`
--

DROP TABLE IF EXISTS `record_artists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `record_artists` (
  `artists_id` int(11) NOT NULL AUTO_INCREMENT,
  `artists_name` varchar(32) NOT NULL DEFAULT '',
  `artists_image` varchar(255) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`artists_id`),
  KEY `idx_rec_artists_name_zen` (`artists_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `record_artists`
--

LOCK TABLES `record_artists` WRITE;
/*!40000 ALTER TABLE `record_artists` DISABLE KEYS */;
/*!40000 ALTER TABLE `record_artists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `record_artists_info`
--

DROP TABLE IF EXISTS `record_artists_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `record_artists_info` (
  `artists_id` int(11) NOT NULL DEFAULT '0',
  `languages_id` int(11) NOT NULL DEFAULT '0',
  `artists_url` varchar(255) NOT NULL DEFAULT '',
  `url_clicked` int(5) NOT NULL DEFAULT '0',
  `date_last_click` datetime DEFAULT NULL,
  PRIMARY KEY (`artists_id`,`languages_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `record_artists_info`
--

LOCK TABLES `record_artists_info` WRITE;
/*!40000 ALTER TABLE `record_artists_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `record_artists_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `record_company`
--

DROP TABLE IF EXISTS `record_company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `record_company` (
  `record_company_id` int(11) NOT NULL AUTO_INCREMENT,
  `record_company_name` varchar(32) NOT NULL DEFAULT '',
  `record_company_image` varchar(255) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`record_company_id`),
  KEY `idx_rec_company_name_zen` (`record_company_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `record_company`
--

LOCK TABLES `record_company` WRITE;
/*!40000 ALTER TABLE `record_company` DISABLE KEYS */;
/*!40000 ALTER TABLE `record_company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `record_company_info`
--

DROP TABLE IF EXISTS `record_company_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `record_company_info` (
  `record_company_id` int(11) NOT NULL DEFAULT '0',
  `languages_id` int(11) NOT NULL DEFAULT '0',
  `record_company_url` varchar(255) NOT NULL DEFAULT '',
  `url_clicked` int(5) NOT NULL DEFAULT '0',
  `date_last_click` datetime DEFAULT NULL,
  PRIMARY KEY (`record_company_id`,`languages_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `record_company_info`
--

LOCK TABLES `record_company_info` WRITE;
/*!40000 ALTER TABLE `record_company_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `record_company_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reviews` (
  `reviews_id` int(11) NOT NULL AUTO_INCREMENT,
  `products_id` int(11) NOT NULL DEFAULT '0',
  `customers_id` int(11) DEFAULT NULL,
  `customers_name` varchar(64) NOT NULL DEFAULT '',
  `reviews_rating` int(1) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  `reviews_read` int(5) NOT NULL DEFAULT '0',
  `status` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`reviews_id`),
  KEY `idx_products_id_zen` (`products_id`),
  KEY `idx_customers_id_zen` (`customers_id`),
  KEY `idx_status_zen` (`status`),
  KEY `idx_date_added_zen` (`date_added`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
INSERT INTO `reviews` VALUES (1,4,1,'kyeongsang y.',4,'2019-02-19 22:49:24',NULL,0,0);
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews_description`
--

DROP TABLE IF EXISTS `reviews_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reviews_description` (
  `reviews_id` int(11) NOT NULL DEFAULT '0',
  `languages_id` int(11) NOT NULL DEFAULT '0',
  `reviews_text` text NOT NULL,
  PRIMARY KEY (`reviews_id`,`languages_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews_description`
--

LOCK TABLES `reviews_description` WRITE;
/*!40000 ALTER TABLE `reviews_description` DISABLE KEYS */;
INSERT INTO `reviews_description` VALUES (1,1,'the product is very good.\r\nit is enough to listen! \r\nsounds good!');
/*!40000 ALTER TABLE `reviews_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salemaker_sales`
--

DROP TABLE IF EXISTS `salemaker_sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `salemaker_sales` (
  `sale_id` int(11) NOT NULL AUTO_INCREMENT,
  `sale_status` tinyint(4) NOT NULL DEFAULT '0',
  `sale_name` varchar(128) NOT NULL DEFAULT '',
  `sale_deduction_value` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `sale_deduction_type` tinyint(4) NOT NULL DEFAULT '0',
  `sale_pricerange_from` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `sale_pricerange_to` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `sale_specials_condition` tinyint(4) NOT NULL DEFAULT '0',
  `sale_categories_selected` text,
  `sale_categories_all` text,
  `sale_date_start` date NOT NULL DEFAULT '0001-01-01',
  `sale_date_end` date NOT NULL DEFAULT '0001-01-01',
  `sale_date_added` date NOT NULL DEFAULT '0001-01-01',
  `sale_date_last_modified` date NOT NULL DEFAULT '0001-01-01',
  `sale_date_status_change` date NOT NULL DEFAULT '0001-01-01',
  PRIMARY KEY (`sale_id`),
  KEY `idx_sale_status_zen` (`sale_status`),
  KEY `idx_sale_date_start_zen` (`sale_date_start`),
  KEY `idx_sale_date_end_zen` (`sale_date_end`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salemaker_sales`
--

LOCK TABLES `salemaker_sales` WRITE;
/*!40000 ALTER TABLE `salemaker_sales` DISABLE KEYS */;
/*!40000 ALTER TABLE `salemaker_sales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessions` (
  `sesskey` varchar(191) NOT NULL DEFAULT '',
  `expiry` int(11) unsigned NOT NULL DEFAULT '0',
  `value` mediumblob NOT NULL,
  PRIMARY KEY (`sesskey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES ('e482ikfb0vuvmg7pjtau7smolv',1550690881,'c2VjdXJpdHlUb2tlbnxzOjMyOiI3NGMwZDYwZDE2M2E5OGYzMmYyMDBkZWI4ZDg0MzMyNSI7Y3VzdG9tZXJzX2hvc3RfYWRkcmVzc3xzOjEzOiJpcDYtbG9jYWxob3N0IjtjYXJ0SUR8czowOiIiO2NhcnR8TzoxMjoic2hvcHBpbmdDYXJ0IjoxMzp7czo4OiJjb250ZW50cyI7YTowOnt9czo1OiJ0b3RhbCI7aTowO3M6Njoid2VpZ2h0IjtpOjA7czo2OiJjYXJ0SUQiO047czoxMjoiY29udGVudF90eXBlIjtiOjA7czoxODoiZnJlZV9zaGlwcGluZ19pdGVtIjtpOjA7czoyMDoiZnJlZV9zaGlwcGluZ193ZWlnaHQiO2k6MDtzOjE5OiJmcmVlX3NoaXBwaW5nX3ByaWNlIjtpOjA7czoxNDoiZG93bmxvYWRfY291bnQiO2k6MDtzOjIyOiJ0b3RhbF9iZWZvcmVfZGlzY291bnRzIjtpOjA7czoyMjoiZGlzcGxheV9kZWJ1Z19tZXNzYWdlcyI7YjowO3M6MjM6ImZsYWdfZHVwbGljYXRlX21zZ3Nfc2V0IjtiOjA7czozMjoiZmxhZ19kdXBsaWNhdGVfcXVhbnRpdHlfbXNnc19zZXQiO2I6MDt9Y2hlY2tfdmFsaWR8czo0OiJ0cnVlIjtuYXZpZ2F0aW9ufE86MTc6Im5hdmlnYXRpb25IaXN0b3J5IjoyOntzOjQ6InBhdGgiO2E6MTp7aTowO2E6NDp7czo0OiJwYWdlIjtzOjU6ImluZGV4IjtzOjQ6Im1vZGUiO3M6NjoiTk9OU1NMIjtzOjM6ImdldCI7YTowOnt9czo0OiJwb3N0IjthOjA6e319fXM6ODoic25hcHNob3QiO2E6MDp7fX1sYW5ndWFnZXxzOjc6ImVuZ2xpc2giO2xhbmd1YWdlc19pZHxzOjE6IjEiO2xhbmd1YWdlc19jb2RlfHM6MjoiZW4iO2xheW91dFR5cGV8czo2OiJsZWdhY3kiO2N1cnJlbmN5fHM6MzoiVVNEIjt0b2RheV9pc3xzOjEwOiIyMDE5LTAyLTIwIjt1cGRhdGVFeHBpcmF0aW9uc3xiOjE7Y2F0ZWdvcnlfdHJlZXxPOjIwOiJTaW1wbGVDYXRlZ29yaWVzVHJlZSI6ODp7czoxMzoiY2F0ZWdvcnlfdHJlZSI7YToyNjp7aTo2O2E6Njp7czo0OiJuYW1lIjtzOjg6IjNEIFBob3RvIjtzOjk6InBhcmVudF9pZCI7czoxOiIwIjtzOjQ6InBhdGgiO2E6MTp7aTowO3M6MToiNiI7fXM6Mzoic3ViIjtzOjY6Im5vX3N1YiI7czo1OiJjUGF0aCI7czoxOiI2IjtzOjU6Im5QYXRoIjtzOjE6IjYiO31pOjA7YTo0OntzOjg6InN1Yl9jYXRzIjthOjc6e2k6MDtzOjE6IjYiO2k6MTtzOjI6IjMxIjtpOjI7czoxOiI4IjtpOjM7czoyOiIxMiI7aTo0O3M6MjoiMTYiO2k6NTtzOjI6IjI2IjtpOjY7czoyOiIyMCI7fXM6Mzoic3ViIjtzOjc6Imhhc19zdWIiO3M6NToiY1BhdGgiO2k6MDtzOjU6Im5QYXRoIjtpOjA7fWk6MzE7YTo2OntzOjQ6Im5hbWUiO3M6MTE6IjNEIFNjYW5uaW5nIjtzOjk6InBhcmVudF9pZCI7czoxOiIwIjtzOjQ6InBhdGgiO2E6MTp7aTowO3M6MjoiMzEiO31zOjM6InN1YiI7czo2OiJub19zdWIiO3M6NToiY1BhdGgiO3M6MjoiMzEiO3M6NToiblBhdGgiO3M6MjoiMzEiO31pOjg7YTo3OntzOjQ6Im5hbWUiO3M6MTE6IkFjY2Vzc29yaWVzIjtzOjk6InBhcmVudF9pZCI7czoxOiIwIjtzOjQ6InBhdGgiO2E6MTp7aTowO3M6MToiOCI7fXM6ODoic3ViX2NhdHMiO2E6Mzp7aTowO3M6MjoiMTAiO2k6MTtzOjI6IjExIjtpOjI7czoxOiI5Ijt9czozOiJzdWIiO3M6NzoiaGFzX3N1YiI7czo1OiJjUGF0aCI7czoxOiI4IjtzOjU6Im5QYXRoIjtzOjE6IjgiO31pOjEyO2E6Nzp7czo0OiJuYW1lIjtzOjEyOiJBaXIgcHVyaWZpZXIiO3M6OToicGFyZW50X2lkIjtzOjE6IjAiO3M6NDoicGF0aCI7YToxOntpOjA7czoyOiIxMiI7fXM6ODoic3ViX2NhdHMiO2E6Mzp7aTowO3M6MjoiMTMiO2k6MTtzOjI6IjE0IjtpOjI7czoyOiIxNSI7fXM6Mzoic3ViIjtzOjc6Imhhc19zdWIiO3M6NToiY1BhdGgiO3M6MjoiMTIiO3M6NToiblBhdGgiO3M6MjoiMTIiO31pOjE2O2E6Nzp7czo0OiJuYW1lIjtzOjk6IkNob2NvbGF0ZSI7czo5OiJwYXJlbnRfaWQiO3M6MToiMCI7czo0OiJwYXRoIjthOjE6e2k6MDtzOjI6IjE2Ijt9czo4OiJzdWJfY2F0cyI7YTozOntpOjA7czoyOiIxNyI7aToxO3M6MjoiMTgiO2k6MjtzOjI6IjE5Ijt9czozOiJzdWIiO3M6NzoiaGFzX3N1YiI7czo1OiJjUGF0aCI7czoyOiIxNiI7czo1OiJuUGF0aCI7czoyOiIxNiI7fWk6MjY7YTo3OntzOjQ6Im5hbWUiO3M6NzoiRmlndXJlcyI7czo5OiJwYXJlbnRfaWQiO3M6MToiMCI7czo0OiJwYXRoIjthOjE6e2k6MDtzOjI6IjI2Ijt9czo4OiJzdWJfY2F0cyI7YTo0OntpOjA7czoyOiIzMCI7aToxO3M6MjoiMjkiO2k6MjtzOjI6IjI3IjtpOjM7czoyOiIyOCI7fXM6Mzoic3ViIjtzOjc6Imhhc19zdWIiO3M6NToiY1BhdGgiO3M6MjoiMjYiO3M6NToiblBhdGgiO3M6MjoiMjYiO31pOjIwO2E6Nzp7czo0OiJuYW1lIjtzOjEwOiJUb3kgJiBHZWFyIjtzOjk6InBhcmVudF9pZCI7czoxOiIwIjtzOjQ6InBhdGgiO2E6MTp7aTowO3M6MjoiMjAiO31zOjg6InN1Yl9jYXRzIjthOjU6e2k6MDtzOjI6IjIyIjtpOjE7czoyOiIyMyI7aToyO3M6MjoiMjUiO2k6MztzOjI6IjI0IjtpOjQ7czoyOiIyMSI7fXM6Mzoic3ViIjtzOjc6Imhhc19zdWIiO3M6NToiY1BhdGgiO3M6MjoiMjAiO3M6NToiblBhdGgiO3M6MjoiMjAiO31pOjEwO2E6Njp7czo0OiJuYW1lIjtzOjY6IkJhc2tldCI7czo5OiJwYXJlbnRfaWQiO3M6MToiOCI7czo0OiJwYXRoIjthOjI6e2k6MDtzOjE6IjgiO2k6MTtzOjI6IjEwIjt9czozOiJzdWIiO3M6Njoibm9fc3ViIjtzOjU6ImNQYXRoIjtzOjQ6IjhfMTAiO3M6NToiblBhdGgiO3M6NDoiOF8xMCI7fWk6MTE7YTo2OntzOjQ6Im5hbWUiO3M6MTI6IkxvZ28gUHJvZHVjdCI7czo5OiJwYXJlbnRfaWQiO3M6MToiOCI7czo0OiJwYXRoIjthOjI6e2k6MDtzOjE6IjgiO2k6MTtzOjI6IjExIjt9czozOiJzdWIiO3M6Njoibm9fc3ViIjtzOjU6ImNQYXRoIjtzOjQ6IjhfMTEiO3M6NToiblBhdGgiO3M6NDoiOF8xMSI7fWk6OTthOjY6e3M6NDoibmFtZSI7czo4OiJOYW1lIFRhZyI7czo5OiJwYXJlbnRfaWQiO3M6MToiOCI7czo0OiJwYXRoIjthOjI6e2k6MDtzOjE6IjgiO2k6MTtzOjE6IjkiO31zOjM6InN1YiI7czo2OiJub19zdWIiO3M6NToiY1BhdGgiO3M6MzoiOF85IjtzOjU6Im5QYXRoIjtzOjM6IjhfOSI7fWk6MTM7YTo2OntzOjQ6Im5hbWUiO3M6ODoiQmlnIFNpemUiO3M6OToicGFyZW50X2lkIjtzOjI6IjEyIjtzOjQ6InBhdGgiO2E6Mjp7aTowO3M6MjoiMTIiO2k6MTtzOjI6IjEzIjt9czozOiJzdWIiO3M6Njoibm9fc3ViIjtzOjU6ImNQYXRoIjtzOjU6IjEyXzEzIjtzOjU6Im5QYXRoIjtzOjU6IjEyXzEzIjt9aToxNDthOjY6e3M6NDoibmFtZSI7czoxMToiTWlkZGxlIFNpemUiO3M6OToicGFyZW50X2lkIjtzOjI6IjEyIjtzOjQ6InBhdGgiO2E6Mjp7aTowO3M6MjoiMTIiO2k6MTtzOjI6IjE0Ijt9czozOiJzdWIiO3M6Njoibm9fc3ViIjtzOjU6ImNQYXRoIjtzOjU6IjEyXzE0IjtzOjU6Im5QYXRoIjtzOjU6IjEyXzE0Ijt9aToxNTthOjY6e3M6NDoibmFtZSI7czoxMDoiU21hbGwgU2l6ZSI7czo5OiJwYXJlbnRfaWQiO3M6MjoiMTIiO3M6NDoicGF0aCI7YToyOntpOjA7czoyOiIxMiI7aToxO3M6MjoiMTUiO31zOjM6InN1YiI7czo2OiJub19zdWIiO3M6NToiY1BhdGgiO3M6NToiMTJfMTUiO3M6NToiblBhdGgiO3M6NToiMTJfMTUiO31pOjE3O2E6Njp7czo0OiJuYW1lIjtzOjExOiJCZWxsLXNoYXBlZCI7czo5OiJwYXJlbnRfaWQiO3M6MjoiMTYiO3M6NDoicGF0aCI7YToyOntpOjA7czoyOiIxNiI7aToxO3M6MjoiMTciO31zOjM6InN1YiI7czo2OiJub19zdWIiO3M6NToiY1BhdGgiO3M6NToiMTZfMTciO3M6NToiblBhdGgiO3M6NToiMTZfMTciO31pOjE4O2E6Njp7czo0OiJuYW1lIjtzOjg6IkxvdmUgWW91IjtzOjk6InBhcmVudF9pZCI7czoyOiIxNiI7czo0OiJwYXRoIjthOjI6e2k6MDtzOjI6IjE2IjtpOjE7czoyOiIxOCI7fXM6Mzoic3ViIjtzOjY6Im5vX3N1YiI7czo1OiJjUGF0aCI7czo1OiIxNl8xOCI7czo1OiJuUGF0aCI7czo1OiIxNl8xOCI7fWk6MTk7YTo2OntzOjQ6Im5hbWUiO3M6MTM6IlN1cGVybWFuIE1hcmsiO3M6OToicGFyZW50X2lkIjtzOjI6IjE2IjtzOjQ6InBhdGgiO2E6Mjp7aTowO3M6MjoiMTYiO2k6MTtzOjI6IjE5Ijt9czozOiJzdWIiO3M6Njoibm9fc3ViIjtzOjU6ImNQYXRoIjtzOjU6IjE2XzE5IjtzOjU6Im5QYXRoIjtzOjU6IjE2XzE5Ijt9aToyMjthOjY6e3M6NDoibmFtZSI7czoxMDoiTWluaSBNb3RvciI7czo5OiJwYXJlbnRfaWQiO3M6MjoiMjAiO3M6NDoicGF0aCI7YToyOntpOjA7czoyOiIyMCI7aToxO3M6MjoiMjIiO31zOjM6InN1YiI7czo2OiJub19zdWIiO3M6NToiY1BhdGgiO3M6NToiMjBfMjIiO3M6NToiblBhdGgiO3M6NToiMjBfMjIiO31pOjIzO2E6Njp7czo0OiJuYW1lIjtzOjU6Ik9yZ2VsIjtzOjk6InBhcmVudF9pZCI7czoyOiIyMCI7czo0OiJwYXRoIjthOjI6e2k6MDtzOjI6IjIwIjtpOjE7czoyOiIyMyI7fXM6Mzoic3ViIjtzOjY6Im5vX3N1YiI7czo1OiJjUGF0aCI7czo1OiIyMF8yMyI7czo1OiJuUGF0aCI7czo1OiIyMF8yMyI7fWk6MjU7YTo2OntzOjQ6Im5hbWUiO3M6NzoiVG95IENhciI7czo5OiJwYXJlbnRfaWQiO3M6MjoiMjAiO3M6NDoicGF0aCI7YToyOntpOjA7czoyOiIyMCI7aToxO3M6MjoiMjUiO31zOjM6InN1YiI7czo2OiJub19zdWIiO3M6NToiY1BhdGgiO3M6NToiMjBfMjUiO3M6NToiblBhdGgiO3M6NToiMjBfMjUiO31pOjI0O2E6Njp7czo0OiJuYW1lIjtzOjk6IlRveSBUb3dlciI7czo5OiJwYXJlbnRfaWQiO3M6MjoiMjAiO3M6NDoicGF0aCI7YToyOntpOjA7czoyOiIyMCI7aToxO3M6MjoiMjQiO31zOjM6InN1YiI7czo2OiJub19zdWIiO3M6NToiY1BhdGgiO3M6NToiMjBfMjQiO3M6NToiblBhdGgiO3M6NToiMjBfMjQiO31pOjIxO2E6Njp7czo0OiJuYW1lIjtzOjIxOiJXZWxjb21lIHRvIExhcyBWZWdhcyEiO3M6OToicGFyZW50X2lkIjtzOjI6IjIwIjtzOjQ6InBhdGgiO2E6Mjp7aTowO3M6MjoiMjAiO2k6MTtzOjI6IjIxIjt9czozOiJzdWIiO3M6Njoibm9fc3ViIjtzOjU6ImNQYXRoIjtzOjU6IjIwXzIxIjtzOjU6Im5QYXRoIjtzOjU6IjIwXzIxIjt9aTozMDthOjY6e3M6NDoibmFtZSI7czoxNToiQ2FwdGFpbiBBbWVyaWNhIjtzOjk6InBhcmVudF9pZCI7czoyOiIyNiI7czo0OiJwYXRoIjthOjI6e2k6MDtzOjI6IjI2IjtpOjE7czoyOiIzMCI7fXM6Mzoic3ViIjtzOjY6Im5vX3N1YiI7czo1OiJjUGF0aCI7czo1OiIyNl8zMCI7czo1OiJuUGF0aCI7czo1OiIyNl8zMCI7fWk6Mjk7YTo2OntzOjQ6Im5hbWUiO3M6NToiR3Jvb3QiO3M6OToicGFyZW50X2lkIjtzOjI6IjI2IjtzOjQ6InBhdGgiO2E6Mjp7aTowO3M6MjoiMjYiO2k6MTtzOjI6IjI5Ijt9czozOiJzdWIiO3M6Njoibm9fc3ViIjtzOjU6ImNQYXRoIjtzOjU6IjI2XzI5IjtzOjU6Im5QYXRoIjtzOjU6IjI2XzI5Ijt9aToyNzthOjY6e3M6NDoibmFtZSI7czo0OiJIdWxrIjtzOjk6InBhcmVudF9pZCI7czoyOiIyNiI7czo0OiJwYXRoIjthOjI6e2k6MDtzOjI6IjI2IjtpOjE7czoyOiIyNyI7fXM6Mzoic3ViIjtzOjY6Im5vX3N1YiI7czo1OiJjUGF0aCI7czo1OiIyNl8yNyI7czo1OiJuUGF0aCI7czo1OiIyNl8yNyI7fWk6Mjg7YTo2OntzOjQ6Im5hbWUiO3M6ODoiSXJvbiBNYW4iO3M6OToicGFyZW50X2lkIjtzOjI6IjI2IjtzOjQ6InBhdGgiO2E6Mjp7aTowO3M6MjoiMjYiO2k6MTtzOjI6IjI4Ijt9czozOiJzdWIiO3M6Njoibm9fc3ViIjtzOjU6ImNQYXRoIjtzOjU6IjI2XzI4IjtzOjU6Im5QYXRoIjtzOjU6IjI2XzI4Ijt9fXM6MjE6ImlzX2RlZXBlc3RfY2F0c19idWlsdCI7YjowO3M6MTE6InBhcmVudF9odG1sIjtzOjA6IiI7czoxMDoiY2hpbGRfaHRtbCI7czowOiIiO3M6MTA6ImN1cnJlbnRfaWQiO2k6LTE7czoxNjoiZXhjZXB0aW9uYWxfbGlzdCI7YTowOnt9czo2OiJuZXdfaWQiO047czoxMToiaXNfYXR0YWNoZWQiO2I6MDt9c2Vzc2lvbl9jb3VudGVyfGI6MTtjdXN0b21lcnNfaXBfYWRkcmVzc3xzOjM6Ijo6MSI7'),('pdk6p69prg3q0kbspi3f9arjbh',1550689814,'c2VjdXJpdHlUb2tlbnxzOjMyOiJkNTljMTUyYjdmNTAyOTZmODdkZGNhMjQzNDdmYjIzMSI7bGFuZ3VhZ2V8czo3OiJlbmdsaXNoIjtsYW5ndWFnZXNfaWR8czoxOiIxIjtsYW5ndWFnZXNfY29kZXxzOjI6ImVuIjtzZWxlY3RlZF9ib3h8czoxMzoiY29uZmlndXJhdGlvbiI7aHRtbF9lZGl0b3JfcHJlZmVyZW5jZV9zdGF0dXN8czo0OiJOT05FIjthZG1pbl9pZHxzOjE6IjEiOw==');
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `specials`
--

DROP TABLE IF EXISTS `specials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `specials` (
  `specials_id` int(11) NOT NULL AUTO_INCREMENT,
  `products_id` int(11) NOT NULL DEFAULT '0',
  `specials_new_products_price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `specials_date_added` datetime DEFAULT NULL,
  `specials_last_modified` datetime DEFAULT NULL,
  `expires_date` date NOT NULL DEFAULT '0001-01-01',
  `date_status_change` datetime DEFAULT NULL,
  `status` int(1) NOT NULL DEFAULT '1',
  `specials_date_available` date NOT NULL DEFAULT '0001-01-01',
  PRIMARY KEY (`specials_id`),
  KEY `idx_status_zen` (`status`),
  KEY `idx_products_id_zen` (`products_id`),
  KEY `idx_date_avail_zen` (`specials_date_available`),
  KEY `idx_expires_date_zen` (`expires_date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `specials`
--

LOCK TABLES `specials` WRITE;
/*!40000 ALTER TABLE `specials` DISABLE KEYS */;
/*!40000 ALTER TABLE `specials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `square_payments`
--

DROP TABLE IF EXISTS `square_payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `square_payments` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(11) unsigned NOT NULL,
  `location_id` varchar(40) NOT NULL,
  `transaction_id` varchar(255) NOT NULL,
  `tender_id` varchar(64) DEFAULT NULL,
  `action` varchar(40) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `square_payments`
--

LOCK TABLES `square_payments` WRITE;
/*!40000 ALTER TABLE `square_payments` DISABLE KEYS */;
/*!40000 ALTER TABLE `square_payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tax_class`
--

DROP TABLE IF EXISTS `tax_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tax_class` (
  `tax_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `tax_class_title` varchar(32) NOT NULL DEFAULT '',
  `tax_class_description` varchar(255) NOT NULL DEFAULT '',
  `last_modified` datetime DEFAULT NULL,
  `date_added` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  PRIMARY KEY (`tax_class_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tax_class`
--

LOCK TABLES `tax_class` WRITE;
/*!40000 ALTER TABLE `tax_class` DISABLE KEYS */;
INSERT INTO `tax_class` VALUES (1,'Taxable Goods','The following types of products are included: non-food, services, etc',NULL,'2019-02-19 14:19:13');
/*!40000 ALTER TABLE `tax_class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tax_rates`
--

DROP TABLE IF EXISTS `tax_rates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tax_rates` (
  `tax_rates_id` int(11) NOT NULL AUTO_INCREMENT,
  `tax_zone_id` int(11) NOT NULL DEFAULT '0',
  `tax_class_id` int(11) NOT NULL DEFAULT '0',
  `tax_priority` int(5) DEFAULT '1',
  `tax_rate` decimal(7,4) NOT NULL DEFAULT '0.0000',
  `tax_description` varchar(255) NOT NULL DEFAULT '',
  `last_modified` datetime DEFAULT NULL,
  `date_added` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  PRIMARY KEY (`tax_rates_id`),
  KEY `idx_tax_zone_id_zen` (`tax_zone_id`),
  KEY `idx_tax_class_id_zen` (`tax_class_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tax_rates`
--

LOCK TABLES `tax_rates` WRITE;
/*!40000 ALTER TABLE `tax_rates` DISABLE KEYS */;
INSERT INTO `tax_rates` VALUES (1,1,1,1,7.0000,'FL TAX 7.0%','2019-02-19 14:19:13','2019-02-19 14:19:13');
/*!40000 ALTER TABLE `tax_rates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `template_configuration`
--

DROP TABLE IF EXISTS `template_configuration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `template_configuration` (
  `template_configuration_id` int(11) NOT NULL AUTO_INCREMENT,
  `template_configuration_title` text NOT NULL,
  `template_configuration_tab` text NOT NULL,
  `template_configuration_tab_section` text NOT NULL,
  `template_configuration_key` varchar(255) NOT NULL,
  `template_configuration_value` text NOT NULL,
  `template_configuration_description` text NOT NULL,
  `template_configuration_group_id` int(11) NOT NULL,
  `sort_order` int(5) DEFAULT NULL,
  `set_function` text,
  PRIMARY KEY (`template_configuration_id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `template_configuration`
--

LOCK TABLES `template_configuration` WRITE;
/*!40000 ALTER TABLE `template_configuration` DISABLE KEYS */;
INSERT INTO `template_configuration` VALUES (31,'Body Background Color','Global','Styling','BODY_BACKGROUND_COLOR','#FFFFFF','Body Background Color',2,1,'color'),(32,'Body Headline Color','Global','Styling','BODY_HEADLINE_COLOR','#000000','Body Headline Color',2,2,'color'),(33,'Body Text Color','Global','Styling','BODY_TEXT_COLOR','#000000','Body Headline Color',2,3,'color'),(34,'Body Link Color','Global','Styling','BODY_LINK_COLOR','#0000FF','Body Link Color',2,4,'color'),(35,'Body Link Hover Color','Global','Styling','BODY_LINK_HOVER_COLOR','#C0C0C0','Body Link Hover Color',2,5,'color'),(36,'Logo Upload','Header','Logo Upload','LOGO_UPLOAD','logo.png','Upload your Logo (make sure that your images folder has write permissions):',2,0,'image'),(37,'Header Background Color','Header','Styling','HEADER_BG_COLOR','#2e3233','Change your header background color',2,1,'color'),(38,'Header Link Color','Header','Styling','HEADER_LINK_COLOR','#e2e3df','Change your header link color',2,2,'color'),(39,'Header Link Hover Color','Header','Styling','HEADER_LINK_HOVER_COLOR','#caf200','Change your header link hover color',2,3,'color'),(40,'Drop Down Background Color','Header','Styling','DROP_DOWN_BG_COLOR','#e2e3df','Change your drop down background color',2,4,'color'),(41,'Drop Down Link Color','Header','Styling','DROP_DOWN_LINK_COLOR','#2e3233','Change your drop down link color',2,5,'color'),(42,'Drop Down Link Hover Color','Header','Styling','DROP_DOWN_LINK_HOVER_COLOR','#e2e3df','Change your drop down link hover color',2,6,'color'),(43,'Banner Background Color','Banners','Styling','BANNER_BG_COLOR','rgba(46, 50, 51, 0.8)','Change Banner Background Color:',2,0,'color'),(44,'Banner Text Color','Banners','Styling','BANNER_TXT_COLOR','#ffffff','Change Banner Text Color:',2,1,'color'),(45,'Footer Background Color','Footer','Styling','FTR_BG_COLOR','#2e3233','Change Footer Background Color:',2,0,'color'),(46,'Footer Text Color','Footer','Styling','FTR_TXT_COLOR','#caf200','Change Footer Text Color:',2,1,'color'),(47,'Footer Link Color','Footer','Styling','FTR_LINK_COLOR','#e2e3df','Change Footer Link Color:',2,2,'color'),(48,'Footer Link Hover Color','Footer','Styling','FTR_LINK_HOVER_COLOR','#caf200','Change Footer Link Hover Color:',2,3,'color'),(49,'Copyright Text','Footer','Copyright Text','FTR_COPYRIGHT','© lefab3D 2019','Change Copyright Text',2,4,'text'),(50,'Show Social Icons','Social Networking','Social Networking Status','SOCIAL_ICONS','false','Change Status of Social Icons:',2,0,'truefalse'),(51,'Facebook URL','Social Networking','URLS','FACEBOOK_URL','https://www.facebook.com/lefab3d','Change Facebook URL:',2,1,NULL),(52,'Twitter URL','Social Networking','URLS','TWITTER_URL','http://twitter.com/lefab3d','Change Twitter URL:',2,2,NULL),(53,'Google Plus URL','Social Networking','URLS','GOOGLE_PLUS_URL','','Change Google Plus URL:',2,3,NULL),(54,'YouTube URL','Social Networking','URLS','YOUTUBE_URL','https://www.youtube.com/lefab3d','Change YouTube URL:',2,4,NULL),(55,'Blog URL','Social Networking','URLS','BLOG_URL','www.lefab3d.com','Change Blog URL:',2,5,NULL),(56,'Blog RSS URL','Home Page','Blog RSS Section','BLOG_RSS_URL','www.lefab3d.com','Change Blog RSS URL:',2,1,NULL),(57,'Blog Section Title','Home Page','Blog RSS Section','BLOG_TITLE','lefab3D','Change Blog RSS Section Title:',2,1,NULL),(58,'Blog Section Button Text','Home Page','Blog RSS Section','BLOG_BTN_TEXT','','Change Blog Section Button Text:',2,1,NULL),(59,'Twitter Feed Section Title','Home Page','Twitter Feed Section','TWITTER_TITLE','','Change Twitter Feed Section Title:',2,1,NULL),(60,'Twitter Handle','Home Page','Twitter Feed Section','TWITTER_HANDLE','','Change Twitter Handle:',2,1,NULL);
/*!40000 ALTER TABLE `template_configuration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `template_configuration_group`
--

DROP TABLE IF EXISTS `template_configuration_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `template_configuration_group` (
  `template_configuration_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `template_configuration_group_title` varchar(64) NOT NULL,
  `template_group_description` varchar(255) NOT NULL,
  `sort_order` int(5) NOT NULL,
  `visible` int(1) NOT NULL,
  PRIMARY KEY (`template_configuration_group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `template_configuration_group`
--

LOCK TABLES `template_configuration_group` WRITE;
/*!40000 ALTER TABLE `template_configuration_group` DISABLE KEYS */;
INSERT INTO `template_configuration_group` VALUES (2,'tableau','Set Tableau Template Options',2,1);
/*!40000 ALTER TABLE `template_configuration_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `template_select`
--

DROP TABLE IF EXISTS `template_select`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `template_select` (
  `template_id` int(11) NOT NULL AUTO_INCREMENT,
  `template_dir` varchar(64) NOT NULL DEFAULT '',
  `template_language` varchar(64) NOT NULL DEFAULT '0',
  PRIMARY KEY (`template_id`),
  KEY `idx_tpl_lang_zen` (`template_language`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `template_select`
--

LOCK TABLES `template_select` WRITE;
/*!40000 ALTER TABLE `template_select` DISABLE KEYS */;
INSERT INTO `template_select` VALUES (1,'tableau','0');
/*!40000 ALTER TABLE `template_select` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `upgrade_exceptions`
--

DROP TABLE IF EXISTS `upgrade_exceptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `upgrade_exceptions` (
  `upgrade_exception_id` smallint(5) NOT NULL AUTO_INCREMENT,
  `sql_file` varchar(128) DEFAULT NULL,
  `reason` text,
  `errordate` datetime DEFAULT NULL,
  `sqlstatement` text,
  PRIMARY KEY (`upgrade_exception_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `upgrade_exceptions`
--

LOCK TABLES `upgrade_exceptions` WRITE;
/*!40000 ALTER TABLE `upgrade_exceptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `upgrade_exceptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `whos_online`
--

DROP TABLE IF EXISTS `whos_online`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `whos_online` (
  `customer_id` int(11) DEFAULT NULL,
  `full_name` varchar(64) NOT NULL DEFAULT '',
  `session_id` varchar(191) NOT NULL DEFAULT '',
  `ip_address` varchar(45) NOT NULL DEFAULT '',
  `time_entry` varchar(14) NOT NULL DEFAULT '',
  `time_last_click` varchar(14) NOT NULL DEFAULT '',
  `last_page_url` varchar(255) NOT NULL DEFAULT '',
  `host_address` text NOT NULL,
  `user_agent` varchar(255) NOT NULL DEFAULT '',
  KEY `idx_ip_address_zen` (`ip_address`),
  KEY `idx_session_id_zen` (`session_id`),
  KEY `idx_customer_id_zen` (`customer_id`),
  KEY `idx_time_entry_zen` (`time_entry`),
  KEY `idx_time_last_click_zen` (`time_last_click`),
  KEY `idx_last_page_url_zen` (`last_page_url`(191))
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `whos_online`
--

LOCK TABLES `whos_online` WRITE;
/*!40000 ALTER TABLE `whos_online` DISABLE KEYS */;
INSERT INTO `whos_online` VALUES (0,'&yen;Guest','e482ikfb0vuvmg7pjtau7smolv','::1','1550689225','1550689441','/zen-cart/','ip6-localhost','Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:65.0) Gecko/20100101 Firefox/65.0');
/*!40000 ALTER TABLE `whos_online` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zones`
--

DROP TABLE IF EXISTS `zones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zones` (
  `zone_id` int(11) NOT NULL AUTO_INCREMENT,
  `zone_country_id` int(11) NOT NULL DEFAULT '0',
  `zone_code` varchar(32) NOT NULL DEFAULT '',
  `zone_name` varchar(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`zone_id`),
  KEY `idx_zone_country_id_zen` (`zone_country_id`),
  KEY `idx_zone_code_zen` (`zone_code`)
) ENGINE=MyISAM AUTO_INCREMENT=300 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zones`
--

LOCK TABLES `zones` WRITE;
/*!40000 ALTER TABLE `zones` DISABLE KEYS */;
INSERT INTO `zones` VALUES (1,223,'AL','Alabama'),(2,223,'AK','Alaska'),(3,223,'AS','American Samoa'),(4,223,'AZ','Arizona'),(5,223,'AR','Arkansas'),(7,223,'AA','Armed Forces Americas'),(9,223,'AE','Armed Forces Europe'),(11,223,'AP','Armed Forces Pacific'),(12,223,'CA','California'),(13,223,'CO','Colorado'),(14,223,'CT','Connecticut'),(15,223,'DE','Delaware'),(16,223,'DC','District of Columbia'),(17,223,'FM','Federated States Of Micronesia'),(18,223,'FL','Florida'),(19,223,'GA','Georgia'),(20,223,'GU','Guam'),(21,223,'HI','Hawaii'),(22,223,'ID','Idaho'),(23,223,'IL','Illinois'),(24,223,'IN','Indiana'),(25,223,'IA','Iowa'),(26,223,'KS','Kansas'),(27,223,'KY','Kentucky'),(28,223,'LA','Louisiana'),(29,223,'ME','Maine'),(30,223,'MH','Marshall Islands'),(31,223,'MD','Maryland'),(32,223,'MA','Massachusetts'),(33,223,'MI','Michigan'),(34,223,'MN','Minnesota'),(35,223,'MS','Mississippi'),(36,223,'MO','Missouri'),(37,223,'MT','Montana'),(38,223,'NE','Nebraska'),(39,223,'NV','Nevada'),(40,223,'NH','New Hampshire'),(41,223,'NJ','New Jersey'),(42,223,'NM','New Mexico'),(43,223,'NY','New York'),(44,223,'NC','North Carolina'),(45,223,'ND','North Dakota'),(46,223,'MP','Northern Mariana Islands'),(47,223,'OH','Ohio'),(48,223,'OK','Oklahoma'),(49,223,'OR','Oregon'),(50,163,'PW','Palau'),(51,223,'PA','Pennsylvania'),(52,223,'PR','Puerto Rico'),(53,223,'RI','Rhode Island'),(54,223,'SC','South Carolina'),(55,223,'SD','South Dakota'),(56,223,'TN','Tennessee'),(57,223,'TX','Texas'),(58,223,'UT','Utah'),(59,223,'VT','Vermont'),(60,223,'VI','Virgin Islands'),(61,223,'VA','Virginia'),(62,223,'WA','Washington'),(63,223,'WV','West Virginia'),(64,223,'WI','Wisconsin'),(65,223,'WY','Wyoming'),(66,38,'AB','Alberta'),(67,38,'BC','British Columbia'),(68,38,'MB','Manitoba'),(69,38,'NL','Newfoundland'),(70,38,'NB','New Brunswick'),(71,38,'NS','Nova Scotia'),(72,38,'NT','Northwest Territories'),(73,38,'NU','Nunavut'),(74,38,'ON','Ontario'),(75,38,'PE','Prince Edward Island'),(76,38,'QC','Quebec'),(77,38,'SK','Saskatchewan'),(78,38,'YT','Yukon Territory'),(79,81,'NDS','Niedersachsen'),(80,81,'BAW','Baden-Württemberg'),(81,81,'BAY','Bayern'),(82,81,'BER','Berlin'),(83,81,'BRG','Brandenburg'),(84,81,'BRE','Bremen'),(85,81,'HAM','Hamburg'),(86,81,'HES','Hessen'),(87,81,'MEC','Mecklenburg-Vorpommern'),(88,81,'NRW','Nordrhein-Westfalen'),(89,81,'RHE','Rheinland-Pfalz'),(90,81,'SAR','Saarland'),(91,81,'SAS','Sachsen'),(92,81,'SAC','Sachsen-Anhalt'),(93,81,'SCN','Schleswig-Holstein'),(94,81,'THE','Thüringen'),(95,14,'WI','Wien'),(96,14,'NO','Niederösterreich'),(97,14,'OO','Oberösterreich'),(98,14,'SB','Salzburg'),(99,14,'KN','Kärnten'),(100,14,'ST','Steiermark'),(101,14,'TI','Tirol'),(102,14,'BL','Burgenland'),(103,14,'VB','Voralberg'),(104,204,'AG','Aargau'),(105,204,'AI','Appenzell Innerrhoden'),(106,204,'AR','Appenzell Ausserrhoden'),(107,204,'BE','Bern'),(108,204,'BL','Basel-Landschaft'),(109,204,'BS','Basel-Stadt'),(110,204,'FR','Freiburg'),(111,204,'GE','Genf'),(112,204,'GL','Glarus'),(113,204,'JU','Graubnden'),(114,204,'JU','Jura'),(115,204,'LU','Luzern'),(116,204,'NE','Neuenburg'),(117,204,'NW','Nidwalden'),(118,204,'OW','Obwalden'),(119,204,'SG','St. Gallen'),(120,204,'SH','Schaffhausen'),(121,204,'SO','Solothurn'),(122,204,'SZ','Schwyz'),(123,204,'TG','Thurgau'),(124,204,'TI','Tessin'),(125,204,'UR','Uri'),(126,204,'VD','Waadt'),(127,204,'VS','Wallis'),(128,204,'ZG','Zug'),(129,204,'ZH','Zürich'),(130,195,'A Coruña','A Coruña'),(131,195,'Álava','Álava'),(132,195,'Albacete','Albacete'),(133,195,'Alicante','Alicante'),(134,195,'Almería','Almería'),(135,195,'Asturias','Asturias'),(136,195,'Ávila','Ávila'),(137,195,'Badajoz','Badajoz'),(138,195,'Baleares','Baleares'),(139,195,'Barcelona','Barcelona'),(140,195,'Burgos','Burgos'),(141,195,'Cáceres','Cáceres'),(142,195,'Cádiz','Cádiz'),(143,195,'Cantabria','Cantabria'),(144,195,'Castellón','Castellón'),(145,195,'Ceuta','Ceuta'),(146,195,'Ciudad Real','Ciudad Real'),(147,195,'Córdoba','Córdoba'),(148,195,'Cuenca','Cuenca'),(149,195,'Girona','Girona'),(150,195,'Granada','Granada'),(151,195,'Guadalajara','Guadalajara'),(152,195,'Guipúzcoa','Guipúzcoa'),(153,195,'Huelva','Huelva'),(154,195,'Huesca','Huesca'),(155,195,'Jaén','Jaén'),(156,195,'La Rioja','La Rioja'),(157,195,'Las Palmas','Las Palmas'),(158,195,'León','León'),(159,195,'Lérida','Lérida'),(160,195,'Lugo','Lugo'),(161,195,'Madrid','Madrid'),(162,195,'Málaga','Málaga'),(163,195,'Melilla','Melilla'),(164,195,'Murcia','Murcia'),(165,195,'Navarra','Navarra'),(166,195,'Ourense','Ourense'),(167,195,'Palencia','Palencia'),(168,195,'Pontevedra','Pontevedra'),(169,195,'Salamanca','Salamanca'),(170,195,'Santa Cruz de Tenerife','Santa Cruz de Tenerife'),(171,195,'Segovia','Segovia'),(172,195,'Sevilla','Sevilla'),(173,195,'Soria','Soria'),(174,195,'Tarragona','Tarragona'),(175,195,'Teruel','Teruel'),(176,195,'Toledo','Toledo'),(177,195,'Valencia','Valencia'),(178,195,'Valladolid','Valladolid'),(179,195,'Vizcaya','Vizcaya'),(180,195,'Zamora','Zamora'),(181,195,'Zaragoza','Zaragoza'),(182,13,'ACT','Australian Capital Territory'),(183,13,'NSW','New South Wales'),(184,13,'NT','Northern Territory'),(185,13,'QLD','Queensland'),(186,13,'SA','South Australia'),(187,13,'TAS','Tasmania'),(188,13,'VIC','Victoria'),(189,13,'WA','Western Australia'),(190,105,'AG','Agrigento'),(191,105,'AL','Alessandria'),(192,105,'AN','Ancona'),(193,105,'AO','Aosta'),(194,105,'AR','Arezzo'),(195,105,'AP','Ascoli Piceno'),(196,105,'AT','Asti'),(197,105,'AV','Avellino'),(198,105,'BA','Bari'),(199,105,'BT','Barletta Andria Trani'),(200,105,'BL','Belluno'),(201,105,'BN','Benevento'),(202,105,'BG','Bergamo'),(203,105,'BI','Biella'),(204,105,'BO','Bologna'),(205,105,'BZ','Bolzano'),(206,105,'BS','Brescia'),(207,105,'BR','Brindisi'),(208,105,'CA','Cagliari'),(209,105,'CL','Caltanissetta'),(210,105,'CB','Campobasso'),(211,105,'CI','Carbonia-Iglesias'),(212,105,'CE','Caserta'),(213,105,'CT','Catania'),(214,105,'CZ','Catanzaro'),(215,105,'CH','Chieti'),(216,105,'CO','Como'),(217,105,'CS','Cosenza'),(218,105,'CR','Cremona'),(219,105,'KR','Crotone'),(220,105,'CN','Cuneo'),(221,105,'EN','Enna'),(222,105,'FM','Fermo'),(223,105,'FE','Ferrara'),(224,105,'FI','Firenze'),(225,105,'FG','Foggia'),(226,105,'FC','Forlì Cesena'),(227,105,'FR','Frosinone'),(228,105,'GE','Genova'),(229,105,'GO','Gorizia'),(230,105,'GR','Grosseto'),(231,105,'IM','Imperia'),(232,105,'IS','Isernia'),(233,105,'AQ','Aquila'),(234,105,'SP','La Spezia'),(235,105,'LT','Latina'),(236,105,'LE','Lecce'),(237,105,'LC','Lecco'),(238,105,'LI','Livorno'),(239,105,'LO','Lodi'),(240,105,'LU','Lucca'),(241,105,'MC','Macerata'),(242,105,'MN','Mantova'),(243,105,'MS','Massa Carrara'),(244,105,'MT','Matera'),(245,105,'VS','Medio Campidano'),(246,105,'ME','Messina'),(247,105,'MI','Milano'),(248,105,'MO','Modena'),(249,105,'MB','Monza e Brianza'),(250,105,'NA','Napoli'),(251,105,'NO','Novara'),(252,105,'NU','Nuoro'),(253,105,'OG','Ogliastra'),(254,105,'OT','Olbia-Tempio'),(255,105,'OR','Oristano'),(256,105,'PD','Padova'),(257,105,'PA','Palermo'),(258,105,'PR','Parma'),(259,105,'PG','Perugia'),(260,105,'PV','Pavia'),(261,105,'PU','Pesaro Urbino'),(262,105,'PE','Pescara'),(263,105,'PC','Piacenza'),(264,105,'PI','Pisa'),(265,105,'PT','Pistoia'),(266,105,'PN','Pordenone'),(267,105,'PZ','Potenza'),(268,105,'PO','Prato'),(269,105,'RG','Ragusa'),(270,105,'RA','Ravenna'),(271,105,'RC','Reggio Calabria'),(272,105,'RE','Reggio Emilia'),(273,105,'RI','Rieti'),(274,105,'RN','Rimini'),(275,105,'RM','Roma'),(276,105,'RO','Rovigo'),(277,105,'SA','Salerno'),(278,105,'SS','Sassari'),(279,105,'SV','Savona'),(280,105,'SI','Siena'),(281,105,'SR','Siracusa'),(282,105,'SO','Sondrio'),(283,105,'TA','Taranto'),(284,105,'TE','Teramo'),(285,105,'TR','Terni'),(286,105,'TO','Torino'),(287,105,'TP','Trapani'),(288,105,'TN','Trento'),(289,105,'TV','Treviso'),(290,105,'TS','Trieste'),(291,105,'UD','Udine'),(292,105,'VA','Varese'),(293,105,'VE','Venezia'),(294,105,'VB','Verbania'),(295,105,'VC','Vercelli'),(296,105,'VR','Verona'),(297,105,'VV','Vibo Valentia'),(298,105,'VI','Vicenza'),(299,105,'VT','Viterbo');
/*!40000 ALTER TABLE `zones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zones_to_geo_zones`
--

DROP TABLE IF EXISTS `zones_to_geo_zones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zones_to_geo_zones` (
  `association_id` int(11) NOT NULL AUTO_INCREMENT,
  `zone_country_id` int(11) NOT NULL DEFAULT '0',
  `zone_id` int(11) DEFAULT NULL,
  `geo_zone_id` int(11) DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  `date_added` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  PRIMARY KEY (`association_id`),
  KEY `idx_zones_zen` (`geo_zone_id`,`zone_country_id`,`zone_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zones_to_geo_zones`
--

LOCK TABLES `zones_to_geo_zones` WRITE;
/*!40000 ALTER TABLE `zones_to_geo_zones` DISABLE KEYS */;
INSERT INTO `zones_to_geo_zones` VALUES (1,223,18,1,NULL,'2019-02-19 14:19:13');
/*!40000 ALTER TABLE `zones_to_geo_zones` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-02-20 11:06:33
