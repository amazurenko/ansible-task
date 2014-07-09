-- MySQL dump 10.13  Distrib 5.1.73, for redhat-linux-gnu (x86_64)
--
-- Host: localhost    Database: zabbix
-- ------------------------------------------------------
-- Server version	5.1.73

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
-- Table structure for table `acknowledges`
--

DROP TABLE IF EXISTS `acknowledges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acknowledges` (
  `acknowledgeid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `userid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `eventid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `clock` int(11) NOT NULL DEFAULT '0',
  `message` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`acknowledgeid`),
  KEY `acknowledges_1` (`userid`),
  KEY `acknowledges_2` (`eventid`),
  KEY `acknowledges_3` (`clock`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acknowledges`
--

LOCK TABLES `acknowledges` WRITE;
/*!40000 ALTER TABLE `acknowledges` DISABLE KEYS */;
/*!40000 ALTER TABLE `acknowledges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `actions`
--

DROP TABLE IF EXISTS `actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `actions` (
  `actionid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `eventsource` int(11) NOT NULL DEFAULT '0',
  `evaltype` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0',
  `esc_period` int(11) NOT NULL DEFAULT '0',
  `def_shortdata` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `def_longdata` blob NOT NULL,
  `recovery_msg` int(11) NOT NULL DEFAULT '0',
  `r_shortdata` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `r_longdata` blob NOT NULL,
  PRIMARY KEY (`actionid`),
  KEY `actions_1` (`eventsource`,`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actions`
--

LOCK TABLES `actions` WRITE;
/*!40000 ALTER TABLE `actions` DISABLE KEYS */;
INSERT INTO `actions` VALUES (2,'Auto discovery. Linux servers.',1,0,1,0,'','',0,'',''),(3,'Auto discovery. Windows servers.',1,0,1,0,'','',0,'','');
/*!40000 ALTER TABLE `actions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alerts`
--

DROP TABLE IF EXISTS `alerts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alerts` (
  `alertid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `actionid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `eventid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `userid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `clock` int(11) NOT NULL DEFAULT '0',
  `mediatypeid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `sendto` varchar(100) COLLATE utf8_bin NOT NULL DEFAULT '',
  `subject` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `message` blob NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `retries` int(11) NOT NULL DEFAULT '0',
  `error` varchar(128) COLLATE utf8_bin NOT NULL DEFAULT '',
  `nextcheck` int(11) NOT NULL DEFAULT '0',
  `esc_step` int(11) NOT NULL DEFAULT '0',
  `alerttype` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`alertid`),
  KEY `alerts_1` (`actionid`),
  KEY `alerts_2` (`clock`),
  KEY `alerts_3` (`eventid`),
  KEY `alerts_4` (`status`,`retries`),
  KEY `alerts_5` (`mediatypeid`),
  KEY `alerts_6` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alerts`
--

LOCK TABLES `alerts` WRITE;
/*!40000 ALTER TABLE `alerts` DISABLE KEYS */;
/*!40000 ALTER TABLE `alerts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `applications`
--

DROP TABLE IF EXISTS `applications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `applications` (
  `applicationid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `hostid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `templateid` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`applicationid`),
  UNIQUE KEY `applications_2` (`hostid`,`name`),
  KEY `applications_1` (`templateid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `applications`
--

LOCK TABLES `applications` WRITE;
/*!40000 ALTER TABLE `applications` DISABLE KEYS */;
INSERT INTO `applications` VALUES (1,10001,'OS',0),(2,10001,'Services',0),(5,10001,'Filesystem',0),(7,10001,'Network',0),(9,10001,'Processes',0),(11,10001,'Log files',0),(13,10001,'CPU',0),(15,10001,'Memory',0),(17,10001,'Performance',0),(19,10001,'Availability',0),(21,10001,'General',0),(23,10001,'Integrity',0),(25,10002,'Availability',0),(27,10002,'CPU',0),(29,10002,'Filesystem',0),(31,10002,'General',0),(33,10002,'Integrity',0),(35,10002,'Memory',0),(37,10002,'Network',0),(39,10002,'OS',0),(41,10002,'Performance',0),(43,10002,'Processes',0),(45,10002,'Services',0),(47,10008,'General',0),(48,10008,'Processes',0),(49,10008,'Log files',0),(50,10008,'OS',0),(51,10008,'Network',0),(52,10008,'Performance',0),(53,10008,'Services',0),(54,10008,'CPU',0),(55,10008,'Availability',0),(56,10008,'Filesystem',0),(57,10008,'Integrity',0),(58,10008,'Memory',0),(59,10009,'General',0),(60,10009,'Processes',0),(61,10009,'Log files',0),(62,10009,'OS',0),(63,10009,'Network',0),(64,10009,'Performance',0),(65,10009,'Services',0),(66,10009,'CPU',0),(67,10009,'Availability',0),(68,10009,'Filesystem',0),(69,10009,'Integrity',0),(70,10009,'Memory',0),(71,10010,'General',0),(72,10010,'Processes',0),(73,10010,'Log files',0),(74,10010,'OS',0),(75,10010,'Network',0),(76,10010,'Performance',0),(77,10010,'Services',0),(78,10010,'CPU',0),(79,10010,'Availability',0),(80,10010,'Filesystem',0),(81,10010,'Integrity',0),(82,10010,'Memory',0),(83,10011,'General',0),(84,10011,'Processes',0),(85,10011,'Log files',0),(86,10011,'OS',0),(87,10011,'Network',0),(88,10011,'Performance',0),(89,10011,'Services',0),(90,10011,'CPU',0),(91,10011,'Availability',0),(92,10011,'Filesystem',0),(93,10011,'Integrity',0),(94,10011,'Memory',0),(95,10012,'General',0),(96,10012,'Processes',0),(97,10012,'Log files',0),(98,10012,'OS',0),(99,10012,'Network',0),(100,10012,'Performance',0),(101,10012,'Services',0),(102,10012,'CPU',0),(103,10012,'Availability',0),(104,10012,'Filesystem',0),(105,10012,'Integrity',0),(106,10012,'Memory',0),(107,10013,'General',0),(108,10013,'Processes',0),(109,10013,'Log files',0),(110,10013,'OS',0),(111,10013,'Network',0),(112,10013,'Performance',0),(113,10013,'Services',0),(114,10013,'CPU',0),(115,10013,'Availability',0),(116,10013,'Filesystem',0),(117,10013,'Integrity',0),(118,10013,'Memory',0),(119,10014,'General',0),(120,10014,'Processes',0),(121,10014,'Log files',0),(122,10014,'OS',0),(123,10014,'Network',0),(124,10014,'Performance',0),(125,10014,'Services',0),(126,10014,'CPU',0),(127,10014,'Availability',0),(128,10014,'Filesystem',0),(129,10014,'Integrity',0),(130,10014,'Memory',0),(131,10015,'General',0),(132,10015,'Processes',0),(133,10015,'Log files',0),(134,10015,'OS',0),(135,10015,'Network',0),(136,10015,'Performance',0),(137,10015,'Services',0),(138,10015,'CPU',0),(139,10015,'Availability',0),(140,10015,'Filesystem',0),(141,10015,'Integrity',0),(142,10015,'Memory',0),(143,10017,'Availability',19),(144,10017,'CPU',13),(145,10017,'Filesystem',5),(146,10017,'General',21),(147,10017,'Integrity',23),(148,10017,'Log files',11),(149,10017,'Memory',15),(150,10017,'Network',7),(151,10017,'OS',1),(152,10017,'Performance',17),(153,10017,'Processes',9),(154,10017,'Services',2),(155,10031,'General',0),(156,10031,'Network',0),(157,10032,'Network',0),(158,10032,'CPU',0),(159,10032,'Memory',0),(160,10032,'General',0),(161,10033,'General',0),(162,10033,'Network',0),(163,10034,'General',0),(164,10034,'Network',0),(165,10041,'Exchange Memory',0),(166,10041,'Exchange Connections',0),(167,10041,'Exchange Message History',0),(168,10041,'Exchange Services',0),(169,10045,'pfCounter',0),(170,10045,'pfInterfaces',0),(171,10045,'pfLimits',0),(172,10045,'pfLogInterface',0),(173,10045,'pfSrcNodes',0),(174,10045,'pfStateTable',0),(175,10045,'pfStatus',0),(177,10048,'jenkins',0);
/*!40000 ALTER TABLE `applications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auditlog`
--

DROP TABLE IF EXISTS `auditlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auditlog` (
  `auditid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `userid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `clock` int(11) NOT NULL DEFAULT '0',
  `action` int(11) NOT NULL DEFAULT '0',
  `resourcetype` int(11) NOT NULL DEFAULT '0',
  `details` varchar(128) COLLATE utf8_bin NOT NULL DEFAULT '0',
  `ip` varchar(39) COLLATE utf8_bin NOT NULL DEFAULT '',
  `resourceid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `resourcename` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`auditid`),
  KEY `auditlog_1` (`userid`,`clock`),
  KEY `auditlog_2` (`clock`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auditlog`
--

LOCK TABLES `auditlog` WRITE;
/*!40000 ALTER TABLE `auditlog` DISABLE KEYS */;
INSERT INTO `auditlog` VALUES (1,2,1404811401,3,0,'Login failed [amdin]','10.6.35.14',0,''),(2,2,1404811412,3,0,'Login failed [zabbix]','10.6.35.14',0,''),(3,2,1404811416,3,0,'Login failed [admin]','10.6.35.14',0,''),(4,1,1404811436,3,0,'Correct login [Admin]','10.6.35.14',0,''),(5,1,1404812190,0,4,'0','10.6.35.14',10047,'Jenkins server'),(6,2,1404813141,4,0,'Manual Logout','10.6.35.14',0,''),(7,1,1404813144,3,0,'Correct login [Admin]','10.6.35.14',0,''),(8,1,1404813172,0,12,'Application [jenkins ] [176]','10.6.35.14',0,''),(9,1,1404814332,0,15,'0','10.6.35.14',22162,'Jenkins server:http.check'),(10,1,1404814651,0,20,' Name [Jenkins] ','10.6.35.14',0,''),(11,1,1404814659,1,20,' Name [Jenkins] ','10.6.35.14',0,''),(12,1,1404815032,0,13,'0','10.6.35.14',13000,'Jenkins server:http.check'),(13,1,1404815233,0,6,'Graph [http check]','10.6.35.14',0,''),(14,1,1404815504,1,13,'0','10.6.35.14',13000,'Jenkins server:http.check'),(15,2,1404820134,4,0,'Manual Logout','10.6.35.14',0,''),(16,1,1404820136,3,0,'Correct login [Admin]','10.6.35.14',0,''),(17,1,1404820700,0,15,'0','10.6.35.14',22163,'Jenkins server:Download speed for step \"$2\" of scenario \"$1\"'),(18,1,1404820700,0,15,'0','10.6.35.14',22164,'Jenkins server:Response time for step \"$2\" of scenario \"$1\"'),(19,1,1404820700,0,15,'0','10.6.35.14',22165,'Jenkins server:Response code for step \"$2\" of scenario \"$1\"'),(20,1,1404820700,0,15,'0','10.6.35.14',22166,'Jenkins server:Download speed for scenario \'$1\''),(21,1,1404820700,0,15,'0','10.6.35.14',22167,'Jenkins server:Failed step of scenario \'$1\''),(22,1,1404820700,0,22,'Scenario [web_check] [1] Host [Jenkins server]','10.6.35.14',0,''),(23,1,1404820815,1,13,'0','10.6.35.14',13000,'Jenkins server:http.check'),(24,2,1404842637,4,0,'Manual Logout','10.6.35.14',0,''),(25,1,1404842640,3,0,'Correct login [Admin]','10.6.35.14',0,''),(26,1,1404842811,2,15,'0','10.6.35.14',22163,'Download speed for step \"$2\" of scenario \"$1\"'),(27,1,1404842811,2,15,'0','10.6.35.14',22164,'Response time for step \"$2\" of scenario \"$1\"'),(28,1,1404842811,2,15,'0','10.6.35.14',22165,'Response code for step \"$2\" of scenario \"$1\"'),(29,1,1404842811,2,15,'0','10.6.35.14',22166,'Download speed for scenario \'$1\''),(30,1,1404842811,2,15,'0','10.6.35.14',22167,'Failed step of scenario \'$1\''),(31,1,1404842811,2,15,'0','10.6.35.14',22162,'http.check'),(32,1,1404842811,2,4,'0','10.6.35.14',10047,'Jenkins server'),(33,1,1404842835,0,4,'0','10.6.35.14',10048,'Jenkins server'),(34,1,1404842869,0,12,'Application [jenkins ] [177]','10.6.35.14',0,''),(35,1,1404842910,0,15,'0','10.6.35.14',22168,'Jenkins server:http.check'),(36,1,1404842956,0,13,'0','10.6.35.14',13001,'Jenkins server:Jenkins server:http.check'),(37,1,1404843061,0,15,'0','10.6.35.14',22169,'Jenkins server:Download speed for step \"$2\" of scenario \"$1\"'),(38,1,1404843061,0,15,'0','10.6.35.14',22170,'Jenkins server:Response time for step \"$2\" of scenario \"$1\"'),(39,1,1404843061,0,15,'0','10.6.35.14',22171,'Jenkins server:Response code for step \"$2\" of scenario \"$1\"'),(40,1,1404843061,0,15,'0','10.6.35.14',22172,'Jenkins server:Download speed for scenario \'$1\''),(41,1,1404843061,0,15,'0','10.6.35.14',22173,'Jenkins server:Failed step of scenario \'$1\''),(42,1,1404843061,0,22,'Scenario [web_check] [1] Host [Jenkins server]','10.6.35.14',0,'');
/*!40000 ALTER TABLE `auditlog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auditlog_details`
--

DROP TABLE IF EXISTS `auditlog_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auditlog_details` (
  `auditdetailid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `auditid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `field_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `oldvalue` blob NOT NULL,
  `newvalue` blob NOT NULL,
  PRIMARY KEY (`auditdetailid`),
  KEY `auditlog_details_1` (`auditid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auditlog_details`
--

LOCK TABLES `auditlog_details` WRITE;
/*!40000 ALTER TABLE `auditlog_details` DISABLE KEYS */;
INSERT INTO `auditlog_details` VALUES (1,14,'triggers','expression','{12128}=0','{12129}=1'),(2,14,'triggers','value','1','2'),(3,14,'triggers','lastchange','1404815032','1404815504'),(4,23,'triggers','expression','{12129}=1','{12130}=0'),(5,23,'triggers','value','1','2'),(6,23,'triggers','lastchange','1404817252','1404820815');
/*!40000 ALTER TABLE `auditlog_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `autoreg_host`
--

DROP TABLE IF EXISTS `autoreg_host`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `autoreg_host` (
  `autoreg_hostid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `proxy_hostid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `host` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`autoreg_hostid`),
  KEY `autoreg_host_1` (`proxy_hostid`,`host`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autoreg_host`
--

LOCK TABLES `autoreg_host` WRITE;
/*!40000 ALTER TABLE `autoreg_host` DISABLE KEYS */;
/*!40000 ALTER TABLE `autoreg_host` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conditions`
--

DROP TABLE IF EXISTS `conditions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `conditions` (
  `conditionid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `actionid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `conditiontype` int(11) NOT NULL DEFAULT '0',
  `operator` int(11) NOT NULL DEFAULT '0',
  `value` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`conditionid`),
  KEY `conditions_1` (`actionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conditions`
--

LOCK TABLES `conditions` WRITE;
/*!40000 ALTER TABLE `conditions` DISABLE KEYS */;
INSERT INTO `conditions` VALUES (2,2,10,0,'0'),(3,2,8,0,'9'),(4,2,12,2,'Linux'),(5,3,8,0,'9'),(6,3,10,0,'0'),(7,3,12,2,'Windows');
/*!40000 ALTER TABLE `conditions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `config`
--

DROP TABLE IF EXISTS `config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `config` (
  `configid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `alert_history` int(11) NOT NULL DEFAULT '0',
  `event_history` int(11) NOT NULL DEFAULT '0',
  `refresh_unsupported` int(11) NOT NULL DEFAULT '0',
  `work_period` varchar(100) COLLATE utf8_bin NOT NULL DEFAULT '1-5,00:00-24:00',
  `alert_usrgrpid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `event_ack_enable` int(11) NOT NULL DEFAULT '1',
  `event_expire` int(11) NOT NULL DEFAULT '7',
  `event_show_max` int(11) NOT NULL DEFAULT '100',
  `default_theme` varchar(128) COLLATE utf8_bin NOT NULL DEFAULT 'default.css',
  `authentication_type` int(11) NOT NULL DEFAULT '0',
  `ldap_host` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `ldap_port` int(11) NOT NULL DEFAULT '389',
  `ldap_base_dn` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `ldap_bind_dn` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `ldap_bind_password` varchar(128) COLLATE utf8_bin NOT NULL DEFAULT '',
  `ldap_search_attribute` varchar(128) COLLATE utf8_bin NOT NULL DEFAULT '',
  `dropdown_first_entry` int(11) NOT NULL DEFAULT '1',
  `dropdown_first_remember` int(11) NOT NULL DEFAULT '1',
  `discovery_groupid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `max_in_table` int(11) NOT NULL DEFAULT '50',
  `search_limit` int(11) NOT NULL DEFAULT '1000',
  PRIMARY KEY (`configid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config`
--

LOCK TABLES `config` WRITE;
/*!40000 ALTER TABLE `config` DISABLE KEYS */;
INSERT INTO `config` VALUES (1,365,365,600,'1-5,00:00-24:00',7,1,7,100,'default.css',0,'',389,'','','','',1,1,5,50,1000);
/*!40000 ALTER TABLE `config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dchecks`
--

DROP TABLE IF EXISTS `dchecks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dchecks` (
  `dcheckid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `druleid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `type` int(11) NOT NULL DEFAULT '0',
  `key_` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '0',
  `snmp_community` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '0',
  `ports` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '0',
  `snmpv3_securityname` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `snmpv3_securitylevel` int(11) NOT NULL DEFAULT '0',
  `snmpv3_authpassphrase` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `snmpv3_privpassphrase` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`dcheckid`),
  KEY `dchecks_1` (`druleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dchecks`
--

LOCK TABLES `dchecks` WRITE;
/*!40000 ALTER TABLE `dchecks` DISABLE KEYS */;
INSERT INTO `dchecks` VALUES (2,2,9,'system.uname','','10050','',0,'','');
/*!40000 ALTER TABLE `dchecks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dhosts`
--

DROP TABLE IF EXISTS `dhosts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dhosts` (
  `dhostid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `druleid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0',
  `lastup` int(11) NOT NULL DEFAULT '0',
  `lastdown` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`dhostid`),
  KEY `dhosts_1` (`druleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dhosts`
--

LOCK TABLES `dhosts` WRITE;
/*!40000 ALTER TABLE `dhosts` DISABLE KEYS */;
/*!40000 ALTER TABLE `dhosts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drules`
--

DROP TABLE IF EXISTS `drules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `drules` (
  `druleid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `proxy_hostid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `iprange` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `delay` int(11) NOT NULL DEFAULT '0',
  `nextcheck` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0',
  `unique_dcheckid` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`druleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drules`
--

LOCK TABLES `drules` WRITE;
/*!40000 ALTER TABLE `drules` DISABLE KEYS */;
INSERT INTO `drules` VALUES (2,0,'Local network','192.168.1.1-255',3600,0,1,0);
/*!40000 ALTER TABLE `drules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dservices`
--

DROP TABLE IF EXISTS `dservices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dservices` (
  `dserviceid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `dhostid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `type` int(11) NOT NULL DEFAULT '0',
  `key_` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '0',
  `value` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '0',
  `port` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0',
  `lastup` int(11) NOT NULL DEFAULT '0',
  `lastdown` int(11) NOT NULL DEFAULT '0',
  `dcheckid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `ip` varchar(39) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`dserviceid`),
  UNIQUE KEY `dservices_1` (`dcheckid`,`type`,`key_`,`ip`,`port`),
  KEY `dservices_2` (`dhostid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dservices`
--

LOCK TABLES `dservices` WRITE;
/*!40000 ALTER TABLE `dservices` DISABLE KEYS */;
/*!40000 ALTER TABLE `dservices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `escalations`
--

DROP TABLE IF EXISTS `escalations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `escalations` (
  `escalationid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `actionid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `triggerid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `eventid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `r_eventid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `nextcheck` int(11) NOT NULL DEFAULT '0',
  `esc_step` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`escalationid`),
  KEY `escalations_1` (`actionid`,`triggerid`),
  KEY `escalations_2` (`status`,`nextcheck`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `escalations`
--

LOCK TABLES `escalations` WRITE;
/*!40000 ALTER TABLE `escalations` DISABLE KEYS */;
/*!40000 ALTER TABLE `escalations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `events` (
  `eventid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `source` int(11) NOT NULL DEFAULT '0',
  `object` int(11) NOT NULL DEFAULT '0',
  `objectid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `clock` int(11) NOT NULL DEFAULT '0',
  `value` int(11) NOT NULL DEFAULT '0',
  `acknowledged` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`eventid`),
  KEY `events_1` (`object`,`objectid`,`eventid`),
  KEY `events_2` (`clock`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events`
--

LOCK TABLES `events` WRITE;
/*!40000 ALTER TABLE `events` DISABLE KEYS */;
INSERT INTO `events` VALUES (7,0,0,13001,1404842998,0,0);
/*!40000 ALTER TABLE `events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `expressions`
--

DROP TABLE IF EXISTS `expressions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `expressions` (
  `expressionid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `regexpid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `expression` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `expression_type` int(11) NOT NULL DEFAULT '0',
  `exp_delimiter` varchar(1) COLLATE utf8_bin NOT NULL DEFAULT '',
  `case_sensitive` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`expressionid`),
  KEY `expressions_1` (`regexpid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expressions`
--

LOCK TABLES `expressions` WRITE;
/*!40000 ALTER TABLE `expressions` DISABLE KEYS */;
/*!40000 ALTER TABLE `expressions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `functions`
--

DROP TABLE IF EXISTS `functions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `functions` (
  `functionid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `itemid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `triggerid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `lastvalue` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `function` varchar(12) COLLATE utf8_bin NOT NULL DEFAULT '',
  `parameter` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '0',
  PRIMARY KEY (`functionid`),
  KEY `functions_1` (`triggerid`),
  KEY `functions_2` (`itemid`,`function`,`parameter`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `functions`
--

LOCK TABLES `functions` WRITE;
/*!40000 ALTER TABLE `functions` DISABLE KEYS */;
INSERT INTO `functions` VALUES (10010,10010,10010,NULL,'last','0'),(10013,10016,10013,NULL,'last','0'),(10030,10039,10030,NULL,'diff','0'),(10048,10090,10048,NULL,'last','0'),(10056,10098,10056,NULL,'last','0'),(10057,10099,10057,NULL,'last','0'),(10058,10102,10058,NULL,'last','0'),(10059,10103,10059,NULL,'last','0'),(10068,10114,10068,NULL,'last','0'),(10081,10137,10081,NULL,'last','0'),(10091,10147,10091,NULL,'diff','0'),(10094,10150,10094,NULL,'last','0'),(10196,10025,10021,NULL,'last','0'),(10197,10017,10014,NULL,'diff','0'),(10198,10040,10031,NULL,'diff','0'),(10199,10019,10016,NULL,'diff','0'),(10200,10038,10029,NULL,'diff','0'),(10201,10018,10015,NULL,'diff','0'),(10202,10048,10034,NULL,'last','0'),(10203,10056,10042,NULL,'last','0'),(10204,10055,10041,NULL,'last','0'),(10205,10031,10022,NULL,'last','0'),(10206,10032,10023,NULL,'last','0'),(10207,10058,10044,NULL,'diff','0'),(10208,10057,10043,NULL,'diff','0'),(10209,10037,10028,NULL,'last','0'),(10210,10047,10033,NULL,'last','0'),(10211,10001,10001,NULL,'last','0'),(10212,10014,10012,NULL,'last','0'),(10225,10049,10035,NULL,'last','0'),(10226,10046,10032,NULL,'last','0'),(10227,10036,10027,NULL,'last','0'),(10228,10061,10047,NULL,'last','0'),(10229,10033,10024,NULL,'last','0'),(10230,10051,10037,NULL,'last','0'),(10231,10050,10036,NULL,'last','0'),(10233,10009,10190,NULL,'last','0'),(10234,10013,10011,NULL,'last','0'),(10235,10059,10045,NULL,'diff','0'),(10236,10060,10046,NULL,'last','0'),(10237,10052,10038,NULL,'last','0'),(10238,10053,10039,NULL,'last','0'),(10240,10106,10061,NULL,'diff','0'),(10241,10091,10049,NULL,'last','0'),(10242,10358,10191,NULL,'last','0'),(10243,10148,10092,NULL,'diff','0'),(11001,17001,12001,NULL,'diff','0'),(11002,17002,12002,NULL,'diff','0'),(11003,17003,12003,NULL,'delta','0'),(11004,17004,12004,NULL,'delta','0'),(11005,17005,12005,NULL,'diff','0'),(11006,17006,12006,NULL,'delta','0'),(11007,17007,12007,NULL,'delta','0'),(11008,17008,12008,NULL,'diff','0'),(11009,17009,12009,NULL,'diff','0'),(11010,17010,12010,NULL,'diff','0'),(11011,17011,12011,NULL,'diff','0'),(11012,17012,12012,NULL,'diff','0'),(11013,17013,12013,NULL,'diff','0'),(11014,17014,12014,NULL,'diff','0'),(11015,17015,12015,NULL,'diff','0'),(11016,17016,12016,NULL,'diff','0'),(11017,17017,12017,NULL,'diff','0'),(11018,17018,12018,NULL,'diff','0'),(11019,17019,12019,NULL,'diff','0'),(11020,17020,12020,NULL,'diff','0'),(11021,17021,12021,NULL,'diff','0'),(11022,17022,12022,NULL,'diff','0'),(11023,17023,12023,NULL,'diff','0'),(11024,17024,12024,NULL,'diff','0'),(11025,17025,12025,NULL,'diff','0'),(11026,17026,12026,NULL,'diff','0'),(11027,17027,12027,NULL,'diff','0'),(11028,17028,12028,NULL,'diff','0'),(11029,17029,12029,NULL,'diff','0'),(11030,17030,12030,NULL,'diff','0'),(11031,17031,12031,NULL,'diff','0'),(11032,17032,12032,NULL,'diff','0'),(11033,17033,12033,NULL,'diff','0'),(11034,17034,12034,NULL,'diff','0'),(11035,17035,12035,NULL,'diff','0'),(11036,17036,12036,NULL,'diff','0'),(11037,17037,12037,NULL,'diff','0'),(11038,17038,12038,NULL,'diff','0'),(11039,17039,12039,NULL,'diff','0'),(11040,17040,12040,NULL,'diff','0'),(11041,17041,12041,NULL,'diff','0'),(11042,17042,12042,NULL,'diff','0'),(11043,17043,12043,NULL,'diff','0'),(11044,17044,12044,NULL,'diff','0'),(11045,17045,12045,NULL,'diff','0'),(11046,17046,12046,NULL,'diff','0'),(11047,17047,12047,NULL,'diff','0'),(11048,17048,12048,NULL,'diff','0'),(11049,17049,12049,NULL,'diff','0'),(11050,17050,12050,NULL,'diff','0'),(11051,17051,12051,NULL,'diff','0'),(11052,17052,12052,NULL,'diff','0'),(11053,17053,12053,NULL,'diff','0'),(11054,17054,12054,NULL,'diff','0'),(11055,17055,12055,NULL,'diff','0'),(11056,17056,12056,NULL,'diff','0'),(11057,17057,12057,NULL,'diff','0'),(11058,17058,12058,NULL,'diff','0'),(11059,17059,12059,NULL,'diff','0'),(11060,17060,12060,NULL,'delta','0'),(11061,17061,12061,NULL,'delta','0'),(11062,17062,12062,NULL,'delta','0'),(11063,17063,12063,NULL,'delta','0'),(11064,17064,12064,NULL,'delta','0'),(11065,17065,12065,NULL,'delta','0'),(11066,17066,12066,NULL,'delta','0'),(11067,17067,12067,NULL,'delta','0'),(11068,17068,12068,NULL,'delta','0'),(11069,17069,12069,NULL,'delta','0'),(11070,17070,12070,NULL,'delta','0'),(11071,17071,12071,NULL,'delta','0'),(11072,17072,12072,NULL,'delta','0'),(11073,17073,12073,NULL,'delta','0'),(11074,17074,12074,NULL,'delta','0'),(11075,17075,12075,NULL,'delta','0'),(11076,17076,12076,NULL,'delta','0'),(11077,17077,12077,NULL,'delta','0'),(11078,17078,12078,NULL,'delta','0'),(11079,17079,12079,NULL,'delta','0'),(11080,17080,12080,NULL,'delta','0'),(11081,17081,12081,NULL,'delta','0'),(11082,17082,12082,NULL,'delta','0'),(11083,17083,12083,NULL,'delta','0'),(11084,17084,12084,NULL,'delta','0'),(11085,17085,12085,NULL,'delta','0'),(11086,17086,12086,NULL,'delta','0'),(11087,17087,12087,NULL,'delta','0'),(11088,17088,12088,NULL,'delta','0'),(11089,17089,12089,NULL,'delta','0'),(11090,17090,12090,NULL,'delta','0'),(11091,17091,12091,NULL,'delta','0'),(11092,17092,12092,NULL,'delta','0'),(11093,17093,12093,NULL,'delta','0'),(11094,17094,12094,NULL,'delta','0'),(11095,17095,12095,NULL,'delta','0'),(11096,17096,12096,NULL,'delta','0'),(11097,17097,12097,NULL,'delta','0'),(11098,17098,12098,NULL,'delta','0'),(11099,17099,12099,NULL,'delta','0'),(11100,17100,12100,NULL,'delta','0'),(11101,17101,12101,NULL,'delta','0'),(11102,17102,12102,NULL,'delta','0'),(11103,17103,12103,NULL,'delta','0'),(11104,17104,12104,NULL,'delta','0'),(11105,17105,12105,NULL,'delta','0'),(11106,17106,12106,NULL,'delta','0'),(11107,17107,12107,NULL,'delta','0'),(11108,17108,12108,NULL,'delta','0'),(11109,17109,12109,NULL,'delta','0'),(11110,17110,12110,NULL,'delta','0'),(11111,17111,12111,NULL,'delta','0'),(11112,17112,12112,NULL,'delta','0'),(11113,17113,12113,NULL,'delta','0'),(11114,17114,12114,NULL,'delta','0'),(11115,17115,12115,NULL,'delta','0'),(11116,17116,12116,NULL,'delta','0'),(11117,17117,12117,NULL,'delta','0'),(11118,17118,12118,NULL,'delta','0'),(11119,17119,12119,NULL,'delta','0'),(11120,17120,12120,NULL,'delta','0'),(11121,17121,12121,NULL,'delta','0'),(11122,17122,12122,NULL,'delta','0'),(11123,17123,12123,NULL,'delta','0'),(11124,17124,12124,NULL,'delta','0'),(11125,17125,12125,NULL,'delta','0'),(11126,17126,12126,NULL,'delta','0'),(11127,17127,12127,NULL,'delta','0'),(11128,17128,12128,NULL,'delta','0'),(11129,17129,12129,NULL,'delta','0'),(11130,17130,12130,NULL,'delta','0'),(11131,17131,12131,NULL,'delta','0'),(11132,17132,12132,NULL,'delta','0'),(11133,17133,12133,NULL,'delta','0'),(11134,17134,12134,NULL,'delta','0'),(11135,17135,12135,NULL,'delta','0'),(11136,17136,12136,NULL,'delta','0'),(11137,17137,12137,NULL,'delta','0'),(11138,17138,12138,NULL,'delta','0'),(11139,17139,12139,NULL,'delta','0'),(11140,17140,12140,NULL,'delta','0'),(11141,17141,12141,NULL,'delta','0'),(11142,17142,12142,NULL,'delta','0'),(11143,17143,12143,NULL,'delta','0'),(11144,17144,12144,NULL,'delta','0'),(11145,17145,12145,NULL,'delta','0'),(11146,17146,12146,NULL,'delta','0'),(11147,17147,12147,NULL,'delta','0'),(11148,17148,12148,NULL,'delta','0'),(11149,17149,12149,NULL,'delta','0'),(11150,17150,12150,NULL,'delta','0'),(11151,17151,12151,NULL,'delta','0'),(11152,17152,12152,NULL,'delta','0'),(11153,17153,12153,NULL,'delta','0'),(11154,17154,12154,NULL,'delta','0'),(11155,17155,12155,NULL,'delta','0'),(11156,17156,12156,NULL,'delta','0'),(11157,17157,12157,NULL,'delta','0'),(11158,17158,12158,NULL,'delta','0'),(11159,17159,12159,NULL,'delta','0'),(11160,17160,12160,NULL,'delta','0'),(11161,17161,12161,NULL,'delta','0'),(11162,17162,12162,NULL,'last','0'),(11163,17163,12163,NULL,'last','0'),(11164,17164,12164,NULL,'delta','0'),(11165,17165,12165,NULL,'delta','0'),(11166,17166,12166,NULL,'delta','0'),(11167,17167,12167,NULL,'delta','0'),(11168,17168,12168,NULL,'delta','0'),(11169,17169,12169,NULL,'delta','0'),(11170,17170,12170,NULL,'delta','0'),(11171,17171,12171,NULL,'delta','0'),(11172,17172,12172,NULL,'delta','0'),(11173,17173,12173,NULL,'delta','0'),(11174,17174,12174,NULL,'delta','0'),(11175,17175,12175,NULL,'delta','0'),(11176,17176,12176,NULL,'delta','0'),(11177,17177,12177,NULL,'delta','0'),(11178,17178,12178,NULL,'delta','0'),(11179,17179,12179,NULL,'delta','0'),(11180,17180,12180,NULL,'delta','0'),(11181,17181,12181,NULL,'delta','0'),(11182,17182,12182,NULL,'delta','0'),(11183,17183,12183,NULL,'delta','0'),(11184,17184,12184,NULL,'delta','0'),(11185,17185,12185,NULL,'delta','0'),(11186,17186,12186,NULL,'delta','0'),(11187,17187,12187,NULL,'delta','0'),(11188,17188,12188,NULL,'delta','0'),(11189,17189,12189,NULL,'delta','0'),(11190,17190,12190,NULL,'delta','0'),(11191,17191,12191,NULL,'delta','0'),(11192,17192,12192,NULL,'delta','0'),(11193,17193,12193,NULL,'delta','0'),(11194,17194,12194,NULL,'delta','0'),(11195,17195,12195,NULL,'delta','0'),(11196,17196,12196,NULL,'delta','0'),(11197,17197,12197,NULL,'delta','0'),(11198,17198,12198,NULL,'delta','0'),(11199,17199,12199,NULL,'delta','0'),(11200,17200,12200,NULL,'delta','0'),(11202,17202,12202,NULL,'delta','0'),(11203,17203,12203,NULL,'delta','0'),(11204,17204,12204,NULL,'delta','0'),(11205,17205,12205,NULL,'delta','0'),(11206,17206,12206,NULL,'delta','0'),(11207,17207,12207,NULL,'delta','0'),(11208,17208,12208,NULL,'delta','0'),(11263,10298,10163,NULL,'last','0'),(11265,10299,10164,NULL,'last','0'),(11267,10304,10169,NULL,'last','0'),(11269,10313,10173,NULL,'last','0'),(11271,10303,10168,NULL,'last','0'),(11273,10300,10165,NULL,'last','0'),(11275,10327,10187,NULL,'last','0'),(11277,17322,10002,NULL,'last','0'),(11279,17324,10017,NULL,'last','0'),(11281,17326,10020,NULL,'last','0'),(11283,17328,10189,NULL,'last','0'),(11285,17320,10004,NULL,'last','0'),(11287,17373,10019,NULL,'last','0'),(11289,17330,10005,NULL,'last','0'),(11291,17332,10018,NULL,'last','0'),(11293,17334,10006,NULL,'last','0'),(11295,17338,10008,NULL,'last','0'),(11297,17336,10007,NULL,'last','0'),(11298,17511,12209,NULL,'last','0'),(11299,17482,12210,NULL,'last','0'),(11300,17501,12211,NULL,'last','0'),(11301,17467,12212,NULL,'last','0'),(11302,17473,12213,NULL,'last','0'),(11303,17476,12214,NULL,'last','0'),(11304,17479,12215,NULL,'last','0'),(11305,17445,12216,NULL,'last','0'),(11306,17430,12217,NULL,'last','0'),(11307,17454,12218,NULL,'last','0'),(11308,17459,12219,NULL,'last','0'),(11309,17460,12220,NULL,'diff','0'),(11311,17461,12222,NULL,'diff','0'),(11312,17487,12223,NULL,'last','0'),(11313,17470,12224,NULL,'last','0'),(11314,17506,12225,NULL,'last','0'),(11315,17491,12226,NULL,'last','0'),(11316,17458,12227,NULL,'last','0'),(11317,17428,12228,NULL,'last','0'),(11318,17423,12229,NULL,'last','0'),(11319,17429,12230,NULL,'last','0'),(11320,17427,12231,NULL,'last','0'),(11321,17425,12232,NULL,'last','0'),(11322,17464,12233,NULL,'diff','0'),(11323,17463,12234,NULL,'diff','0'),(11324,17462,12235,NULL,'diff','0'),(11325,17426,12236,NULL,'last','0'),(11326,17432,12237,NULL,'last','0'),(11327,17431,12238,NULL,'last','0'),(11328,17433,12239,NULL,'last','0'),(11329,17435,12240,NULL,'last','0'),(11330,17434,12241,NULL,'last','0'),(11331,17436,12242,NULL,'last','0'),(11332,17437,12243,NULL,'last','0'),(11333,17416,12244,NULL,'last','0'),(11334,17415,12245,NULL,'last','0'),(11335,17452,12246,NULL,'diff','0'),(11336,17457,12247,NULL,'diff','0'),(11337,17413,12248,NULL,'diff','0'),(11338,17424,12249,NULL,'last','0'),(11339,17442,12250,NULL,'last','0'),(11340,17496,12251,NULL,'last','0'),(11341,17438,12252,NULL,'last','0'),(11342,17613,12253,NULL,'last','0'),(11343,17584,12254,NULL,'last','0'),(11344,17603,12255,NULL,'last','0'),(11345,17569,12256,NULL,'last','0'),(11346,17575,12257,NULL,'last','0'),(11347,17578,12258,NULL,'last','0'),(11348,17581,12259,NULL,'last','0'),(11349,17547,12260,NULL,'last','0'),(11350,17532,12261,NULL,'last','0'),(11351,17556,12262,NULL,'last','0'),(11352,17561,12263,NULL,'last','0'),(11353,17562,12264,NULL,'diff','0'),(11355,17563,12266,NULL,'diff','0'),(11356,17589,12267,NULL,'last','0'),(11357,17572,12268,NULL,'last','0'),(11358,17608,12269,NULL,'last','0'),(11359,17593,12270,NULL,'last','0'),(11360,17560,12271,NULL,'last','0'),(11361,17530,12272,NULL,'last','0'),(11362,17525,12273,NULL,'last','0'),(11363,17531,12274,NULL,'last','0'),(11364,17529,12275,NULL,'last','0'),(11365,17527,12276,NULL,'last','0'),(11366,17566,12277,NULL,'diff','0'),(11367,17565,12278,NULL,'diff','0'),(11368,17564,12279,NULL,'diff','0'),(11369,17528,12280,NULL,'last','0'),(11370,17534,12281,NULL,'last','0'),(11371,17533,12282,NULL,'last','0'),(11372,17535,12283,NULL,'last','0'),(11373,17537,12284,NULL,'last','0'),(11374,17536,12285,NULL,'last','0'),(11375,17538,12286,NULL,'last','0'),(11376,17539,12287,NULL,'last','0'),(11377,17518,12288,NULL,'last','0'),(11378,17517,12289,NULL,'last','0'),(11379,17554,12290,NULL,'diff','0'),(11380,17559,12291,NULL,'diff','0'),(11381,17515,12292,NULL,'diff','0'),(11382,17526,12293,NULL,'last','0'),(11383,17544,12294,NULL,'last','0'),(11384,17598,12295,NULL,'last','0'),(11385,17540,12296,NULL,'last','0'),(11386,17715,12297,NULL,'last','0'),(11387,17686,12298,NULL,'last','0'),(11388,17705,12299,NULL,'last','0'),(11389,17671,12300,NULL,'last','0'),(11390,17677,12301,NULL,'last','0'),(11391,17680,12302,NULL,'last','0'),(11392,17683,12303,NULL,'last','0'),(11393,17649,12304,NULL,'last','0'),(11394,17634,12305,NULL,'last','0'),(11395,17658,12306,NULL,'last','0'),(11396,17663,12307,NULL,'last','0'),(11397,17664,12308,NULL,'diff','0'),(11399,17665,12310,NULL,'diff','0'),(11400,17691,12311,NULL,'last','0'),(11401,17674,12312,NULL,'last','0'),(11402,17710,12313,NULL,'last','0'),(11403,17695,12314,NULL,'last','0'),(11404,17662,12315,NULL,'last','0'),(11405,17632,12316,NULL,'last','0'),(11406,17627,12317,NULL,'last','0'),(11407,17633,12318,NULL,'last','0'),(11408,17631,12319,NULL,'last','0'),(11409,17629,12320,NULL,'last','0'),(11410,17668,12321,NULL,'diff','0'),(11411,17667,12322,NULL,'diff','0'),(11412,17666,12323,NULL,'diff','0'),(11413,17630,12324,NULL,'last','0'),(11414,17636,12325,NULL,'last','0'),(11415,17635,12326,NULL,'last','0'),(11416,17637,12327,NULL,'last','0'),(11417,17639,12328,NULL,'last','0'),(11418,17638,12329,NULL,'last','0'),(11419,17640,12330,NULL,'last','0'),(11420,17641,12331,NULL,'last','0'),(11421,17620,12332,NULL,'last','0'),(11422,17619,12333,NULL,'last','0'),(11423,17656,12334,NULL,'diff','0'),(11424,17661,12335,NULL,'diff','0'),(11425,17617,12336,NULL,'diff','0'),(11426,17628,12337,NULL,'last','0'),(11427,17646,12338,NULL,'last','0'),(11428,17700,12339,NULL,'last','0'),(11429,17642,12340,NULL,'last','0'),(11430,17817,12341,NULL,'last','0'),(11431,17788,12342,NULL,'last','0'),(11432,17807,12343,NULL,'last','0'),(11433,17773,12344,NULL,'last','0'),(11434,17779,12345,NULL,'last','0'),(11435,17782,12346,NULL,'last','0'),(11436,17785,12347,NULL,'last','0'),(11437,17751,12348,NULL,'last','0'),(11438,17736,12349,NULL,'last','0'),(11439,17760,12350,NULL,'last','0'),(11440,17765,12351,NULL,'last','0'),(11441,17766,12352,NULL,'diff','0'),(11443,17767,12354,NULL,'diff','0'),(11444,17793,12355,NULL,'last','0'),(11445,17776,12356,NULL,'last','0'),(11446,17812,12357,NULL,'last','0'),(11447,17797,12358,NULL,'last','0'),(11448,17764,12359,NULL,'last','0'),(11449,17734,12360,NULL,'last','0'),(11450,17729,12361,NULL,'last','0'),(11451,17735,12362,NULL,'last','0'),(11452,17733,12363,NULL,'last','0'),(11453,17731,12364,NULL,'last','0'),(11454,17770,12365,NULL,'diff','0'),(11455,17769,12366,NULL,'diff','0'),(11456,17768,12367,NULL,'diff','0'),(11457,17732,12368,NULL,'last','0'),(11458,17738,12369,NULL,'last','0'),(11459,17737,12370,NULL,'last','0'),(11460,17739,12371,NULL,'last','0'),(11461,17741,12372,NULL,'last','0'),(11462,17740,12373,NULL,'last','0'),(11463,17742,12374,NULL,'last','0'),(11464,17743,12375,NULL,'last','0'),(11465,17722,12376,NULL,'last','0'),(11466,17721,12377,NULL,'last','0'),(11467,17758,12378,NULL,'diff','0'),(11468,17763,12379,NULL,'diff','0'),(11469,17719,12380,NULL,'diff','0'),(11470,17730,12381,NULL,'last','0'),(11471,17748,12382,NULL,'last','0'),(11472,17802,12383,NULL,'last','0'),(11473,17744,12384,NULL,'last','0'),(11474,17919,12385,NULL,'last','0'),(11475,17890,12386,NULL,'last','0'),(11476,17909,12387,NULL,'last','0'),(11477,17875,12388,NULL,'last','0'),(11478,17881,12389,NULL,'last','0'),(11479,17884,12390,NULL,'last','0'),(11480,17887,12391,NULL,'last','0'),(11481,17853,12392,NULL,'last','0'),(11482,17838,12393,NULL,'last','0'),(11483,17862,12394,NULL,'last','0'),(11484,17867,12395,NULL,'last','0'),(11485,17868,12396,NULL,'diff','0'),(11487,17869,12398,NULL,'diff','0'),(11488,17895,12399,NULL,'last','0'),(11489,17878,12400,NULL,'last','0'),(11490,17914,12401,NULL,'last','0'),(11491,17899,12402,NULL,'last','0'),(11492,17866,12403,NULL,'last','0'),(11493,17836,12404,NULL,'last','0'),(11494,17831,12405,NULL,'last','0'),(11495,17837,12406,NULL,'last','0'),(11496,17835,12407,NULL,'last','0'),(11497,17833,12408,NULL,'last','0'),(11498,17872,12409,NULL,'diff','0'),(11499,17871,12410,NULL,'diff','0'),(11500,17870,12411,NULL,'diff','0'),(11501,17834,12412,NULL,'last','0'),(11502,17840,12413,NULL,'last','0'),(11503,17839,12414,NULL,'last','0'),(11504,17841,12415,NULL,'last','0'),(11505,17843,12416,NULL,'last','0'),(11506,17842,12417,NULL,'last','0'),(11507,17844,12418,NULL,'last','0'),(11508,17845,12419,NULL,'last','0'),(11509,17824,12420,NULL,'last','0'),(11510,17823,12421,NULL,'last','0'),(11511,17860,12422,NULL,'diff','0'),(11512,17865,12423,NULL,'diff','0'),(11513,17821,12424,NULL,'diff','0'),(11514,17832,12425,NULL,'last','0'),(11515,17850,12426,NULL,'last','0'),(11516,17904,12427,NULL,'last','0'),(11517,17846,12428,NULL,'last','0'),(11518,18021,12429,NULL,'last','0'),(11519,17992,12430,NULL,'last','0'),(11520,18011,12431,NULL,'last','0'),(11521,17977,12432,NULL,'last','0'),(11522,17983,12433,NULL,'last','0'),(11523,17986,12434,NULL,'last','0'),(11524,17989,12435,NULL,'last','0'),(11525,17955,12436,NULL,'last','0'),(11526,17940,12437,NULL,'last','0'),(11527,17964,12438,NULL,'last','0'),(11528,17969,12439,NULL,'last','0'),(11529,17970,12440,NULL,'diff','0'),(11531,17971,12442,NULL,'diff','0'),(11532,17997,12443,NULL,'last','0'),(11533,17980,12444,NULL,'last','0'),(11534,18016,12445,NULL,'last','0'),(11535,18001,12446,NULL,'last','0'),(11536,17968,12447,NULL,'last','0'),(11537,17938,12448,NULL,'last','0'),(11538,17933,12449,NULL,'last','0'),(11539,17939,12450,NULL,'last','0'),(11540,17937,12451,NULL,'last','0'),(11541,17935,12452,NULL,'last','0'),(11542,17974,12453,NULL,'diff','0'),(11543,17973,12454,NULL,'diff','0'),(11544,17972,12455,NULL,'diff','0'),(11545,17936,12456,NULL,'last','0'),(11546,17942,12457,NULL,'last','0'),(11547,17941,12458,NULL,'last','0'),(11548,17943,12459,NULL,'last','0'),(11549,17945,12460,NULL,'last','0'),(11550,17944,12461,NULL,'last','0'),(11551,17946,12462,NULL,'last','0'),(11552,17947,12463,NULL,'last','0'),(11553,17926,12464,NULL,'last','0'),(11554,17925,12465,NULL,'last','0'),(11555,17962,12466,NULL,'diff','0'),(11556,17967,12467,NULL,'diff','0'),(11557,17923,12468,NULL,'diff','0'),(11558,17934,12469,NULL,'last','0'),(11559,17952,12470,NULL,'last','0'),(11560,18006,12471,NULL,'last','0'),(11561,17948,12472,NULL,'last','0'),(11562,18123,12473,NULL,'last','0'),(11563,18094,12474,NULL,'last','0'),(11564,18113,12475,NULL,'last','0'),(11565,18079,12476,NULL,'last','0'),(11566,18085,12477,NULL,'last','0'),(11567,18088,12478,NULL,'last','0'),(11568,18091,12479,NULL,'last','0'),(11569,18057,12480,NULL,'last','0'),(11570,18042,12481,NULL,'last','0'),(11571,18066,12482,NULL,'last','0'),(11572,18071,12483,NULL,'last','0'),(11573,18072,12484,NULL,'diff','0'),(11575,18073,12486,NULL,'diff','0'),(11576,18099,12487,NULL,'last','0'),(11577,18082,12488,NULL,'last','0'),(11578,18118,12489,NULL,'last','0'),(11579,18103,12490,NULL,'last','0'),(11580,18070,12491,NULL,'last','0'),(11581,18040,12492,NULL,'last','0'),(11582,18035,12493,NULL,'last','0'),(11583,18041,12494,NULL,'last','0'),(11584,18039,12495,NULL,'last','0'),(11585,18037,12496,NULL,'last','0'),(11586,18076,12497,NULL,'diff','0'),(11587,18075,12498,NULL,'diff','0'),(11588,18074,12499,NULL,'diff','0'),(11589,18038,12500,NULL,'last','0'),(11590,18044,12501,NULL,'last','0'),(11591,18043,12502,NULL,'last','0'),(11592,18045,12503,NULL,'last','0'),(11593,18047,12504,NULL,'last','0'),(11594,18046,12505,NULL,'last','0'),(11595,18048,12506,NULL,'last','0'),(11596,18049,12507,NULL,'last','0'),(11597,18028,12508,NULL,'last','0'),(11598,18027,12509,NULL,'last','0'),(11599,18064,12510,NULL,'diff','0'),(11600,18069,12511,NULL,'diff','0'),(11601,18025,12512,NULL,'diff','0'),(11602,18036,12513,NULL,'last','0'),(11603,18054,12514,NULL,'last','0'),(11604,18108,12515,NULL,'last','0'),(11605,18050,12516,NULL,'last','0'),(11606,18225,12517,NULL,'last','0'),(11607,18196,12518,NULL,'last','0'),(11608,18215,12519,NULL,'last','0'),(11609,18181,12520,NULL,'last','0'),(11610,18187,12521,NULL,'last','0'),(11611,18190,12522,NULL,'last','0'),(11612,18193,12523,NULL,'last','0'),(11613,18159,12524,NULL,'last','0'),(11614,18144,12525,NULL,'last','0'),(11615,18168,12526,NULL,'last','0'),(11616,18173,12527,NULL,'last','0'),(11617,18174,12528,NULL,'diff','0'),(11619,18175,12530,NULL,'diff','0'),(11620,18201,12531,NULL,'last','0'),(11621,18184,12532,NULL,'last','0'),(11622,18220,12533,NULL,'last','0'),(11623,18205,12534,NULL,'last','0'),(11624,18172,12535,NULL,'last','0'),(11625,18142,12536,NULL,'last','0'),(11626,18137,12537,NULL,'last','0'),(11627,18143,12538,NULL,'last','0'),(11628,18141,12539,NULL,'last','0'),(11629,18139,12540,NULL,'last','0'),(11630,18178,12541,NULL,'diff','0'),(11631,18177,12542,NULL,'diff','0'),(11632,18176,12543,NULL,'diff','0'),(11633,18140,12544,NULL,'last','0'),(11634,18146,12545,NULL,'last','0'),(11635,18145,12546,NULL,'last','0'),(11636,18147,12547,NULL,'last','0'),(11637,18149,12548,NULL,'last','0'),(11638,18148,12549,NULL,'last','0'),(11639,18150,12550,NULL,'last','0'),(11640,18151,12551,NULL,'last','0'),(11641,18130,12552,NULL,'last','0'),(11642,18129,12553,NULL,'last','0'),(11643,18166,12554,NULL,'diff','0'),(11644,18171,12555,NULL,'diff','0'),(11645,18127,12556,NULL,'diff','0'),(11646,18138,12557,NULL,'last','0'),(11647,18156,12558,NULL,'last','0'),(11648,18210,12559,NULL,'last','0'),(11649,18152,12560,NULL,'last','0'),(11650,18434,12561,NULL,'diff','0'),(11651,18429,12562,NULL,'diff','0'),(11652,18431,12563,NULL,'delta','0'),(11653,18427,12564,NULL,'delta','0'),(11654,18428,12565,NULL,'diff','0'),(11655,18430,12566,NULL,'delta','0'),(11656,18432,12567,NULL,'delta','0'),(11657,18433,12568,NULL,'diff','0'),(11658,18254,12569,NULL,'diff','0'),(11659,18265,12570,NULL,'diff','0'),(11660,18276,12571,NULL,'diff','0'),(11661,18287,12572,NULL,'diff','0'),(11662,18298,12573,NULL,'diff','0'),(11663,18301,12574,NULL,'diff','0'),(11664,18302,12575,NULL,'diff','0'),(11665,18303,12576,NULL,'diff','0'),(11666,18304,12577,NULL,'diff','0'),(11667,18255,12578,NULL,'diff','0'),(11668,18256,12579,NULL,'diff','0'),(11669,18257,12580,NULL,'diff','0'),(11670,18258,12581,NULL,'diff','0'),(11671,18259,12582,NULL,'diff','0'),(11672,18260,12583,NULL,'diff','0'),(11673,18261,12584,NULL,'diff','0'),(11674,18262,12585,NULL,'diff','0'),(11675,18263,12586,NULL,'diff','0'),(11676,18264,12587,NULL,'diff','0'),(11677,18266,12588,NULL,'diff','0'),(11678,18267,12589,NULL,'diff','0'),(11679,18268,12590,NULL,'diff','0'),(11680,18269,12591,NULL,'diff','0'),(11681,18270,12592,NULL,'diff','0'),(11682,18271,12593,NULL,'diff','0'),(11683,18272,12594,NULL,'diff','0'),(11684,18273,12595,NULL,'diff','0'),(11685,18274,12596,NULL,'diff','0'),(11686,18275,12597,NULL,'diff','0'),(11687,18277,12598,NULL,'diff','0'),(11688,18278,12599,NULL,'diff','0'),(11689,18279,12600,NULL,'diff','0'),(11690,18280,12601,NULL,'diff','0'),(11691,18281,12602,NULL,'diff','0'),(11692,18282,12603,NULL,'diff','0'),(11693,18283,12604,NULL,'diff','0'),(11694,18284,12605,NULL,'diff','0'),(11695,18285,12606,NULL,'diff','0'),(11696,18286,12607,NULL,'diff','0'),(11697,18288,12608,NULL,'diff','0'),(11698,18289,12609,NULL,'diff','0'),(11699,18290,12610,NULL,'diff','0'),(11700,18291,12611,NULL,'diff','0'),(11701,18292,12612,NULL,'diff','0'),(11702,18293,12613,NULL,'diff','0'),(11703,18294,12614,NULL,'diff','0'),(11704,18295,12615,NULL,'diff','0'),(11705,18296,12616,NULL,'diff','0'),(11706,18297,12617,NULL,'diff','0'),(11707,18299,12618,NULL,'diff','0'),(11708,18300,12619,NULL,'diff','0'),(11709,18305,12620,NULL,'delta','0'),(11710,18316,12621,NULL,'delta','0'),(11711,18327,12622,NULL,'delta','0'),(11712,18338,12623,NULL,'delta','0'),(11713,18349,12624,NULL,'delta','0'),(11714,18352,12625,NULL,'delta','0'),(11715,18353,12626,NULL,'delta','0'),(11716,18354,12627,NULL,'delta','0'),(11717,18355,12628,NULL,'delta','0'),(11718,18306,12629,NULL,'delta','0'),(11719,18307,12630,NULL,'delta','0'),(11720,18308,12631,NULL,'delta','0'),(11721,18309,12632,NULL,'delta','0'),(11722,18310,12633,NULL,'delta','0'),(11723,18311,12634,NULL,'delta','0'),(11724,18312,12635,NULL,'delta','0'),(11725,18313,12636,NULL,'delta','0'),(11726,18314,12637,NULL,'delta','0'),(11727,18315,12638,NULL,'delta','0'),(11728,18317,12639,NULL,'delta','0'),(11729,18318,12640,NULL,'delta','0'),(11730,18319,12641,NULL,'delta','0'),(11731,18320,12642,NULL,'delta','0'),(11732,18321,12643,NULL,'delta','0'),(11733,18322,12644,NULL,'delta','0'),(11734,18323,12645,NULL,'delta','0'),(11735,18324,12646,NULL,'delta','0'),(11736,18325,12647,NULL,'delta','0'),(11737,18326,12648,NULL,'delta','0'),(11738,18328,12649,NULL,'delta','0'),(11739,18329,12650,NULL,'delta','0'),(11740,18330,12651,NULL,'delta','0'),(11741,18331,12652,NULL,'delta','0'),(11742,18332,12653,NULL,'delta','0'),(11743,18333,12654,NULL,'delta','0'),(11744,18334,12655,NULL,'delta','0'),(11745,18335,12656,NULL,'delta','0'),(11746,18336,12657,NULL,'delta','0'),(11747,18337,12658,NULL,'delta','0'),(11748,18339,12659,NULL,'delta','0'),(11749,18340,12660,NULL,'delta','0'),(11750,18341,12661,NULL,'delta','0'),(11751,18342,12662,NULL,'delta','0'),(11752,18343,12663,NULL,'delta','0'),(11753,18344,12664,NULL,'delta','0'),(11754,18345,12665,NULL,'delta','0'),(11755,18346,12666,NULL,'delta','0'),(11756,18347,12667,NULL,'delta','0'),(11757,18348,12668,NULL,'delta','0'),(11758,18350,12669,NULL,'delta','0'),(11759,18351,12670,NULL,'delta','0'),(11760,18356,12671,NULL,'delta','0'),(11761,18367,12672,NULL,'delta','0'),(11762,18378,12673,NULL,'delta','0'),(11763,18389,12674,NULL,'delta','0'),(11764,18400,12675,NULL,'delta','0'),(11765,18403,12676,NULL,'delta','0'),(11766,18404,12677,NULL,'delta','0'),(11767,18405,12678,NULL,'delta','0'),(11768,18406,12679,NULL,'delta','0'),(11769,18357,12680,NULL,'delta','0'),(11770,18358,12681,NULL,'delta','0'),(11771,18359,12682,NULL,'delta','0'),(11772,18360,12683,NULL,'delta','0'),(11773,18361,12684,NULL,'delta','0'),(11774,18362,12685,NULL,'delta','0'),(11775,18363,12686,NULL,'delta','0'),(11776,18364,12687,NULL,'delta','0'),(11777,18365,12688,NULL,'delta','0'),(11778,18366,12689,NULL,'delta','0'),(11779,18368,12690,NULL,'delta','0'),(11780,18369,12691,NULL,'delta','0'),(11781,18370,12692,NULL,'delta','0'),(11782,18371,12693,NULL,'delta','0'),(11783,18372,12694,NULL,'delta','0'),(11784,18373,12695,NULL,'delta','0'),(11785,18374,12696,NULL,'delta','0'),(11786,18375,12697,NULL,'delta','0'),(11787,18376,12698,NULL,'delta','0'),(11788,18377,12699,NULL,'delta','0'),(11789,18379,12700,NULL,'delta','0'),(11790,18380,12701,NULL,'delta','0'),(11791,18381,12702,NULL,'delta','0'),(11792,18382,12703,NULL,'delta','0'),(11793,18383,12704,NULL,'delta','0'),(11794,18384,12705,NULL,'delta','0'),(11795,18385,12706,NULL,'delta','0'),(11796,18386,12707,NULL,'delta','0'),(11797,18387,12708,NULL,'delta','0'),(11798,18388,12709,NULL,'delta','0'),(11799,18390,12710,NULL,'delta','0'),(11800,18391,12711,NULL,'delta','0'),(11801,18392,12712,NULL,'delta','0'),(11802,18393,12713,NULL,'delta','0'),(11803,18394,12714,NULL,'delta','0'),(11804,18395,12715,NULL,'delta','0'),(11805,18396,12716,NULL,'delta','0'),(11806,18397,12717,NULL,'delta','0'),(11807,18398,12718,NULL,'delta','0'),(11808,18399,12719,NULL,'delta','0'),(11809,18401,12720,NULL,'delta','0'),(11810,18402,12721,NULL,'delta','0'),(11811,18408,12722,NULL,'last','0'),(11812,18407,12723,NULL,'last','0'),(11813,18417,12724,NULL,'delta','0'),(11814,18416,12725,NULL,'delta','0'),(11815,18412,12726,NULL,'delta','0'),(11816,18415,12727,NULL,'delta','0'),(11817,18418,12728,NULL,'delta','0'),(11818,18414,12729,NULL,'delta','0'),(11819,18413,12730,NULL,'delta','0'),(11820,18421,12731,NULL,'delta','0'),(11821,18419,12732,NULL,'delta','0'),(11822,18420,12733,NULL,'delta','0'),(11823,18425,12734,NULL,'delta','0'),(11824,18424,12735,NULL,'delta','0'),(11825,18423,12736,NULL,'delta','0'),(11826,18422,12737,NULL,'delta','0'),(11827,18411,12738,NULL,'delta','0'),(11828,18410,12739,NULL,'delta','0'),(11829,18409,12740,NULL,'delta','0'),(11830,18426,12741,NULL,'delta','0'),(11831,18234,12742,NULL,'delta','0'),(11832,18233,12743,NULL,'delta','0'),(11833,18230,12744,NULL,'delta','0'),(11834,18238,12745,NULL,'delta','0'),(11835,18235,12746,NULL,'delta','0'),(11836,18237,12747,NULL,'delta','0'),(11837,18236,12748,NULL,'delta','0'),(11838,18232,12749,NULL,'delta','0'),(11839,18231,12750,NULL,'delta','0'),(11840,18240,12751,NULL,'delta','0'),(11841,18239,12752,NULL,'delta','0'),(11842,18229,12753,NULL,'delta','0'),(11843,18228,12754,NULL,'delta','0'),(11844,18247,12755,NULL,'delta','0'),(11845,18246,12756,NULL,'delta','0'),(11846,18243,12757,NULL,'delta','0'),(11847,18251,12758,NULL,'delta','0'),(11848,18248,12759,NULL,'delta','0'),(11849,18250,12760,NULL,'delta','0'),(11850,18245,12761,NULL,'delta','0'),(11851,18244,12762,NULL,'delta','0'),(11852,18253,12763,NULL,'delta','0'),(11853,18252,12764,NULL,'delta','0'),(11854,18242,12765,NULL,'delta','0'),(11855,18241,12766,NULL,'delta','0'),(11856,18249,12767,NULL,'delta','0'),(11857,18436,12768,NULL,'diff','0'),(11858,18438,12769,NULL,'last','0'),(11859,18439,12770,NULL,'last','0'),(11860,18446,12771,NULL,'last','0'),(11861,18447,12772,NULL,'last','0'),(11862,18448,12773,NULL,'last','0'),(11863,18449,12774,NULL,'last','0'),(11864,18450,12775,NULL,'last','0'),(11865,18451,12776,NULL,'last','0'),(11866,18452,12777,NULL,'last','0'),(11867,18453,12778,NULL,'last','0'),(11868,18454,12779,NULL,'last','0'),(11869,18455,12780,NULL,'last','0'),(11870,18456,12781,NULL,'last','0'),(11871,18457,12782,NULL,'last','0'),(11872,18458,12783,NULL,'last','0'),(11873,18459,12784,NULL,'last','0'),(11874,18460,12785,NULL,'last','0'),(11875,18461,12786,NULL,'last','0'),(11876,18465,12787,NULL,'last','0'),(11877,18468,12788,NULL,'last','0'),(11878,18475,12789,NULL,'diff','0'),(11879,18477,12790,NULL,'last','0'),(11880,18480,12791,NULL,'diff','0'),(11881,18481,12792,NULL,'last','0'),(11882,18482,12793,NULL,'last','0'),(11883,18483,12794,NULL,'diff','0'),(11884,18484,12795,NULL,'diff','0'),(11885,18485,12796,NULL,'diff','0'),(11886,18486,12797,NULL,'diff','0'),(11887,18487,12798,NULL,'diff','0'),(11888,18488,12799,NULL,'diff','0'),(11889,18490,12800,NULL,'last','0'),(11890,18493,12801,NULL,'last','0'),(11891,18496,12802,NULL,'last','0'),(11892,18499,12803,NULL,'last','0'),(11893,18502,12804,NULL,'last','0'),(11894,18505,12805,NULL,'last','0'),(11895,18510,12806,NULL,'last','0'),(11896,18514,12807,NULL,'last','0'),(11897,18519,12808,NULL,'last','0'),(11898,18524,12809,NULL,'last','0'),(11899,18529,12810,NULL,'last','0'),(11900,18534,12811,NULL,'last','0'),(11901,19404,12812,NULL,'last','0'),(11902,19409,12813,NULL,'last','0'),(11903,19407,12814,NULL,'last','0'),(11904,19408,12815,NULL,'last','0'),(11905,19408,12816,NULL,'last','0'),(11907,19406,12817,NULL,'last','0'),(11908,19417,12818,NULL,'last','0'),(11909,19418,12819,NULL,'last','0'),(11910,19419,12820,NULL,'last','0'),(11911,19420,12821,NULL,'last','0'),(11912,19421,12822,NULL,'last','0'),(11913,19411,12823,NULL,'last','0'),(11915,19412,12825,NULL,'last','0'),(11917,19422,12827,NULL,'last','0'),(11918,19413,12824,NULL,'last','0'),(11919,19414,12826,NULL,'last','0'),(11922,19428,12828,NULL,'last','0'),(11923,19427,12829,NULL,'last','0'),(11925,19429,12830,NULL,'last','0'),(11927,19430,12831,NULL,'last','0'),(11929,19431,12832,NULL,'last','0'),(11931,19432,12833,NULL,'last','0'),(11933,19433,12834,NULL,'last','0'),(11935,19434,12835,NULL,'last','0'),(11937,19435,12836,NULL,'last','0'),(11939,19436,12837,NULL,'last','0'),(11941,19437,12838,NULL,'last','0'),(11943,19423,12839,NULL,'last','0'),(11945,19425,12840,NULL,'last','0'),(11947,19424,12841,NULL,'last','0'),(11949,19426,12842,NULL,'last','0'),(11950,19441,12843,NULL,'last','0'),(11951,19448,12844,NULL,'avg','300'),(11952,19448,12845,NULL,'avg','120'),(11953,19540,12846,NULL,'diff','0'),(11954,19521,12847,NULL,'diff','0'),(11955,19532,12848,NULL,'diff','0'),(11956,19538,12849,NULL,'diff','0'),(11957,19539,12850,NULL,'diff','0'),(11958,19541,12851,NULL,'diff','0'),(11959,19542,12852,NULL,'diff','0'),(11960,19543,12853,NULL,'diff','0'),(11961,19544,12854,NULL,'diff','0'),(11962,19522,12855,NULL,'diff','0'),(11963,19523,12856,NULL,'diff','0'),(11964,19524,12857,NULL,'diff','0'),(11965,19525,12858,NULL,'diff','0'),(11966,19526,12859,NULL,'diff','0'),(11967,19527,12860,NULL,'diff','0'),(11968,19528,12861,NULL,'diff','0'),(11969,19529,12862,NULL,'diff','0'),(11970,19530,12863,NULL,'diff','0'),(11971,19531,12864,NULL,'diff','0'),(11972,19533,12865,NULL,'diff','0'),(11973,19534,12866,NULL,'diff','0'),(11974,19535,12867,NULL,'diff','0'),(11975,19536,12868,NULL,'diff','0'),(11976,19537,12869,NULL,'diff','0'),(11977,19712,12870,NULL,'diff','0'),(11978,19692,12871,NULL,'diff','0'),(11979,19703,12872,NULL,'diff','0'),(11980,19710,12873,NULL,'diff','0'),(11981,19711,12874,NULL,'diff','0'),(11982,19713,12875,NULL,'diff','0'),(11983,19714,12876,NULL,'diff','0'),(11984,19715,12877,NULL,'diff','0'),(11985,19716,12878,NULL,'diff','0'),(11986,19693,12879,NULL,'diff','0'),(11987,19694,12880,NULL,'diff','0'),(11988,19695,12881,NULL,'diff','0'),(11989,19696,12882,NULL,'diff','0'),(11990,19697,12883,NULL,'diff','0'),(11991,19698,12884,NULL,'diff','0'),(11992,19699,12885,NULL,'diff','0'),(11993,19700,12886,NULL,'diff','0'),(11994,19701,12887,NULL,'diff','0'),(11995,19702,12888,NULL,'diff','0'),(11996,19704,12889,NULL,'diff','0'),(11997,19705,12890,NULL,'diff','0'),(11998,19706,12891,NULL,'diff','0'),(11999,19707,12892,NULL,'diff','0'),(12000,19708,12893,NULL,'diff','0'),(12001,19709,12894,NULL,'diff','0'),(12002,20702,12895,NULL,'last','0'),(12003,20750,12896,NULL,'last','0'),(12004,20718,12897,NULL,'last','0'),(12005,20719,12898,NULL,'last','0'),(12006,20720,12899,NULL,'last','0'),(12007,20721,12900,NULL,'last','0'),(12008,20723,12901,NULL,'last','0'),(12009,20722,12902,NULL,'last','0'),(12010,20966,12903,NULL,'last','0'),(12011,20874,12904,NULL,'last','0'),(12012,20875,12905,NULL,'last','0'),(12013,21228,12906,NULL,'last','0'),(12014,21132,12907,NULL,'last','0'),(12015,21133,12908,NULL,'last','0'),(12016,21249,12909,NULL,'last','0'),(12017,21248,12910,NULL,'last','0'),(12018,21244,12911,NULL,'last','0'),(12019,21245,12912,NULL,'last','0'),(12020,21246,12913,NULL,'last','0'),(12021,21247,12914,NULL,'last','0'),(12034,21717,12927,NULL,'nodata','60'),(12035,21712,12928,NULL,'str','Server'),(12036,21723,12929,NULL,'nodata','7200'),(12037,21715,12930,NULL,'last','0'),(12038,21716,12930,NULL,'last','0'),(12039,21737,12931,NULL,'last','0'),(12040,21738,12931,NULL,'last','0'),(12041,21737,12932,NULL,'last','0'),(12042,21736,12932,NULL,'last','0'),(12043,21740,12933,NULL,'last','0'),(12044,21741,12933,NULL,'last','0'),(12045,21740,12934,NULL,'last','0'),(12046,21739,12934,NULL,'last','0'),(12047,21743,12935,NULL,'last','0'),(12048,21744,12935,NULL,'last','0'),(12049,21743,12936,NULL,'last','0'),(12050,21742,12936,NULL,'last','0'),(12051,21746,12937,NULL,'last','0'),(12052,21747,12937,NULL,'last','0'),(12053,21746,12938,NULL,'last','0'),(12054,21745,12938,NULL,'last','0'),(12055,21749,12939,NULL,'last','0'),(12056,21750,12939,NULL,'last','0'),(12057,21749,12940,NULL,'last','0'),(12058,21748,12940,NULL,'last','0'),(12059,21752,12941,NULL,'last','0'),(12060,21753,12941,NULL,'last','0'),(12061,21752,12942,NULL,'last','0'),(12062,21751,12942,NULL,'last','0'),(12063,21755,12943,NULL,'last','0'),(12064,21756,12943,NULL,'last','0'),(12065,21755,12944,NULL,'last','0'),(12066,21754,12944,NULL,'last','0'),(12067,21728,12945,NULL,'last','0'),(12068,21726,12945,NULL,'last','0'),(12069,21732,12946,NULL,'last','0'),(12070,21734,12946,NULL,'last','0'),(12071,21724,12947,NULL,'last','0'),(12072,21730,12947,NULL,'last','0'),(12073,21757,12948,NULL,'last','0'),(12074,21758,12949,NULL,'last','0'),(12075,21760,12950,NULL,'last','0'),(12076,21769,12951,NULL,'last','0'),(12077,21768,12952,NULL,'last','0'),(12078,21770,12953,NULL,'last','0'),(12079,21771,12954,NULL,'last','0'),(12080,21772,12955,NULL,'last','0'),(12081,21775,12956,NULL,'last','0'),(12082,21776,12957,NULL,'last','0'),(12083,21777,12958,NULL,'last','0'),(12084,21778,12959,NULL,'last','0'),(12085,21774,12960,NULL,'last','0'),(12086,21773,12961,NULL,'last','0'),(12087,21810,12962,NULL,'avg','300'),(12088,21801,12963,NULL,'avg','300'),(12089,21809,12964,NULL,'avg','300'),(12090,21803,12965,NULL,'avg','300'),(12091,21806,12966,NULL,'avg','300'),(12092,21807,12967,NULL,'avg','300'),(12093,21796,12968,NULL,'avg','300'),(12094,21797,12969,NULL,'avg','300'),(12095,21851,12970,NULL,'last','0'),(12096,21853,12970,NULL,'last','0'),(12097,21862,12971,NULL,'str','off'),(12098,21859,12972,NULL,'last','0'),(12099,21861,12972,NULL,'last','0'),(12100,21871,12973,NULL,'str','off'),(12101,21868,12974,NULL,'last','0'),(12102,21870,12974,NULL,'last','0'),(12103,21887,12975,NULL,'last','0'),(12104,21886,12976,NULL,'last','0'),(12105,21885,12977,NULL,'last','0'),(12106,21888,12978,NULL,'last','0'),(12107,21889,12979,NULL,'last','0'),(12108,21890,12980,NULL,'last','0'),(12109,22156,12981,NULL,'last','0'),(12110,22156,12982,NULL,'last','0'),(12111,22157,12983,NULL,'last','0'),(12112,22157,12984,NULL,'last','0'),(12113,22155,12985,NULL,'last','0'),(12114,22155,12986,NULL,'last','0'),(12115,22160,12987,NULL,'last','0'),(12116,22160,12988,NULL,'last','0'),(12117,22160,12989,NULL,'last','0'),(12118,22138,12990,NULL,'last','0'),(12119,22139,12991,NULL,'last','0'),(12120,22141,12992,NULL,'last','0'),(12121,22140,12993,NULL,'last','0'),(12122,22146,12994,NULL,'last','0'),(12123,22147,12995,NULL,'last','0'),(12124,22148,12996,NULL,'last','0'),(12125,22149,12997,NULL,'last','0'),(12126,22136,12998,NULL,'last','0'),(12127,22137,12999,NULL,'last','0'),(12131,22168,13001,NULL,'last','60,60');
/*!40000 ALTER TABLE `functions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `globalmacro`
--

DROP TABLE IF EXISTS `globalmacro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `globalmacro` (
  `globalmacroid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `macro` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `value` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`globalmacroid`),
  KEY `globalmacro_1` (`macro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `globalmacro`
--

LOCK TABLES `globalmacro` WRITE;
/*!40000 ALTER TABLE `globalmacro` DISABLE KEYS */;
/*!40000 ALTER TABLE `globalmacro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `graph_theme`
--

DROP TABLE IF EXISTS `graph_theme`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `graph_theme` (
  `graphthemeid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `description` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `theme` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `backgroundcolor` varchar(6) COLLATE utf8_bin NOT NULL DEFAULT 'F0F0F0',
  `graphcolor` varchar(6) COLLATE utf8_bin NOT NULL DEFAULT 'FFFFFF',
  `graphbordercolor` varchar(6) COLLATE utf8_bin NOT NULL DEFAULT '222222',
  `gridcolor` varchar(6) COLLATE utf8_bin NOT NULL DEFAULT 'CCCCCC',
  `maingridcolor` varchar(6) COLLATE utf8_bin NOT NULL DEFAULT 'AAAAAA',
  `gridbordercolor` varchar(6) COLLATE utf8_bin NOT NULL DEFAULT '000000',
  `textcolor` varchar(6) COLLATE utf8_bin NOT NULL DEFAULT '202020',
  `highlightcolor` varchar(6) COLLATE utf8_bin NOT NULL DEFAULT 'AA4444',
  `leftpercentilecolor` varchar(6) COLLATE utf8_bin NOT NULL DEFAULT '11CC11',
  `rightpercentilecolor` varchar(6) COLLATE utf8_bin NOT NULL DEFAULT 'CC1111',
  `noneworktimecolor` varchar(6) COLLATE utf8_bin NOT NULL DEFAULT 'CCCCCC',
  `gridview` int(11) NOT NULL DEFAULT '1',
  `legendview` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`graphthemeid`),
  KEY `graph_theme_1` (`description`),
  KEY `graph_theme_2` (`theme`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `graph_theme`
--

LOCK TABLES `graph_theme` WRITE;
/*!40000 ALTER TABLE `graph_theme` DISABLE KEYS */;
INSERT INTO `graph_theme` VALUES (1,'Original Blue','css_ob.css','F0F0F0','FFFFFF','333333','CCCCCC','AAAAAA','000000','222222','AA4444','11CC11','CC1111','E0E0E0',1,1),(2,'Black & Blue','css_bb.css','333333','0A0A0A','888888','222222','4F4F4F','EFEFEF','0088FF','CC4444','1111FF','FF1111','1F1F1F',1,1);
/*!40000 ALTER TABLE `graph_theme` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `graphs`
--

DROP TABLE IF EXISTS `graphs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `graphs` (
  `graphid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `name` varchar(128) COLLATE utf8_bin NOT NULL DEFAULT '',
  `width` int(11) NOT NULL DEFAULT '0',
  `height` int(11) NOT NULL DEFAULT '0',
  `yaxismin` double(16,4) NOT NULL DEFAULT '0.0000',
  `yaxismax` double(16,4) NOT NULL DEFAULT '0.0000',
  `templateid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `show_work_period` int(11) NOT NULL DEFAULT '1',
  `show_triggers` int(11) NOT NULL DEFAULT '1',
  `graphtype` int(11) NOT NULL DEFAULT '0',
  `show_legend` int(11) NOT NULL DEFAULT '0',
  `show_3d` int(11) NOT NULL DEFAULT '0',
  `percent_left` double(16,4) NOT NULL DEFAULT '0.0000',
  `percent_right` double(16,4) NOT NULL DEFAULT '0.0000',
  `ymin_type` int(11) NOT NULL DEFAULT '0',
  `ymax_type` int(11) NOT NULL DEFAULT '0',
  `ymin_itemid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `ymax_itemid` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`graphid`),
  KEY `graphs_graphs_1` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `graphs`
--

LOCK TABLES `graphs` WRITE;
/*!40000 ALTER TABLE `graphs` DISABLE KEYS */;
INSERT INTO `graphs` VALUES (2,'CPU Loads',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(3,'CPU Utilization',900,200,0.0000,100.0000,0,1,1,1,0,0,0.0000,0.0000,0,0,0,0),(4,'Network utilization',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(5,'Disk usage',900,200,0.0000,100.0000,0,1,1,1,0,0,0.0000,0.0000,0,0,0,0),(6,'Interface 01 Bandwidth',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(7,'Interface 02 Bandwidth',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(8,'Interface 03 Bandwidth',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(9,'Interface 04 Bandwidth',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(10,'Interface 05 Bandwidth',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(11,'Interface 06 Bandwidth',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(12,'Interface 07 Bandwidth',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(13,'Interface 08 Bandwidth',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(14,'Interface 09 Bandwidth',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(15,'Interface 10 Bandwidth',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(16,'Interface 11 Bandwidth',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(17,'Interface 12 Bandwidth',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(18,'Interface 13 Bandwidth',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(19,'Interface 14 Bandwidth',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(20,'Interface 15 Bandwidth',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(21,'Interface 16 Bandwidth',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(22,'Interface 17 Bandwidth',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(23,'Interface 18 Bandwidth',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(24,'Interface 19 Bandwidth',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(25,'Interface 20 Bandwidth',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(26,'Interface 21 Bandwidth',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(27,'Interface 22 Bandwidth',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(28,'Interface 23 Bandwidth',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(29,'Interface 24 Bandwidth',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(30,'Interface 25 Bandwidth',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(31,'Interface 26 Bandwidth',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(32,'Interface 27 Bandwidth',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(33,'Interface 28 Bandwidth',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(34,'Interface 29 Bandwidth',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(35,'Interface 30 Bandwidth',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(36,'Interface 31 Bandwidth',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(37,'Interface 32 Bandwidth',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(38,'Interface 33 Bandwidth',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(39,'Interface 34 Bandwidth',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(40,'Interface 35 Bandwidth',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(41,'Interface 36 Bandwidth',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(42,'Interface 37 Bandwidth',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(43,'Interface 38 Bandwidth',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(44,'Interface 39 Bandwidth',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(45,'Interface 40 Bandwidth',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(46,'Interface 41 Bandwidth',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(47,'Interface 42 Bandwidth',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(48,'Interface 43 Bandwidth',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(49,'Interface 44 Bandwidth',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(50,'Interface 45 Bandwidth',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(51,'Interface 46 Bandwidth',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(52,'Interface 47 Bandwidth',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(53,'Interface 48 Bandwidth',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(54,'Interface 49 Bandwidth',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(55,'Interface 50 Bandwidth',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(56,'Interface 51 Bandwidth',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(57,'Interface 52 Bandwidth',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(58,'Network Traffic',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(59,'Dell PowerEdge Chassis Temperature',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(60,'Port 1 Traffic',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(61,'Port 2 Traffic',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(62,'Port 3 Traffic',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(63,'Port 4 Traffic',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(64,'Port 5 Traffic',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(65,'Port 6 Traffic',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(66,'Port 7 Traffic',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(67,'Port 8 Traffic',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(68,'Port 9 Traffic',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(69,'Port 10 Traffic',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(70,'Port 11 Traffic',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(71,'Port 12 Traffic',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(72,'Port 13 Traffic',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(73,'Port 14 Traffic',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(74,'Port 15 Traffic',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(75,'Port 16 Traffic',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(76,'Port 17 Traffic',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(77,'Port 18 Traffic',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(78,'Port 19 Traffic',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(79,'Port 20 Traffic',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(80,'Port 21 Traffic',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(81,'Port 22 Traffic',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(82,'Port 23 Traffic',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(83,'Port 24 Traffic',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(84,'Port 1 Traffic',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(85,'Port 2 Traffic',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(86,'Port 3 Traffic',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(87,'Port 4 Traffic',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(88,'Port 5 Traffic',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(89,'Port 6 Traffic',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(90,'Port 7 Traffic',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(91,'Port 8 Traffic',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(92,'Port 9 Traffic',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(93,'Port 10 Traffic',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(94,'Port 11 Traffic',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(95,'Port 12 Traffic',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(96,'Port 13 Traffic',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(97,'Port 14 Traffic',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(98,'Port 15 Traffic',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(99,'Port 16 Traffic',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(100,'Port 17 Traffic',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(101,'Port 18 Traffic',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(102,'Port 19 Traffic',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(103,'Port 20 Traffic',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(104,'Port 21 Traffic',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(105,'Port 22 Traffic',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(106,'Port 23 Traffic',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(107,'Port 24 Traffic',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(108,'Port 25 Traffic',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(109,'Voltages',900,200,200.0000,250.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(110,'Frequencies',900,200,40.0000,60.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(111,'Current',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(112,'ATM0 Network utilization',900,200,0.0000,68000.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(113,'uptime',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(114,'icmpping',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(115,'ATM0 Network utilization',900,200,0.0000,68000.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(116,'uptime',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(117,'icmpping',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(118,'FastEthernet0/1',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(119,'FastEthernet0/10',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(120,'FastEthernet0/11',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(121,'FastEthernet0/12',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(122,'FastEthernet0/13',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(123,'FastEthernet0/14',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(124,'FastEthernet0/15',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(125,'FastEthernet0/16',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(126,'FastEthernet0/17',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(127,'FastEthernet0/18',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(128,'FastEthernet0/19',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(129,'FastEthernet0/2',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(130,'FastEthernet0/20',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(131,'FastEthernet0/21',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(132,'FastEthernet0/22',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(133,'FastEthernet0/23',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(134,'FastEthernet0/24',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(135,'FastEthernet0/3',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(136,'FastEthernet0/4',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(137,'FastEthernet0/5',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(138,'FastEthernet0/6',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(139,'FastEthernet0/7',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(140,'FastEthernet0/8',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(141,'FastEthernet0/9',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(142,'GigabitEthernet0/1',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(143,'GigabitEthernet0/2',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(144,'Interface utilization on Fa1/0/1',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(145,'Interface utilization on Fa1/0/2',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(146,'Interface utilization on Fa1/0/3',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(147,'Interface utilization on Fa1/0/4',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(148,'Interface utilization on Fa1/0/5',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(149,'Interface utilization on Fa1/0/6',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(150,'Interface utilization on Fa1/0/7',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(151,'Interface utilization on Fa1/0/8',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(152,'Interface utilization on Fa1/0/9',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(153,'Interface utilization on Fa1/0/10',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(154,'Interface utilization on Fa1/0/11',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(155,'Interface utilization on Fa1/0/12',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(156,'Interface utilization on Fa1/0/13',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(157,'Interface utilization on Fa1/0/14',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(158,'Interface utilization on Fa1/0/15',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(159,'Interface utilization on Fa1/0/16',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(160,'Interface utilization on Fa1/0/17',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(161,'Interface utilization on Fa1/0/18',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(162,'Interface utilization on Fa1/0/19',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(163,'Interface utilization on Fa1/0/20',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(164,'Interface utilization on Fa1/0/21',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(165,'Interface utilization on Fa1/0/22',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(166,'Interface utilization on Fa1/0/23',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(167,'Interface utilization on Fa1/0/24',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(168,'Interface utilization on Fa1/0/25',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(169,'Interface utilization on Fa1/0/26',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(170,'Interface utilization on Fa1/0/27',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(171,'Interface utilization on Fa1/0/28',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(172,'Interface utilization on Fa1/0/29',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(173,'Interface utilization on Fa1/0/30',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(174,'Interface utilization on Fa1/0/31',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(175,'Interface utilization on Fa1/0/32',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(176,'Interface utilization on Fa1/0/33',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(177,'Interface utilization on Fa1/0/34',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(178,'Interface utilization on Fa1/0/35',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(179,'Interface utilization on Fa1/0/36',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(180,'Interface utilization on Fa1/0/37',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(181,'Interface utilization on Fa1/0/38',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(182,'Interface utilization on Fa1/0/39',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(183,'Interface utilization on Fa1/0/40',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(184,'Interface utilization on Fa1/0/41',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(185,'Interface utilization on Fa1/0/42',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(186,'Interface utilization on Fa1/0/43',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(187,'Interface utilization on Fa1/0/44',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(188,'Interface utilization on Fa1/0/45',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(189,'Interface utilization on Fa1/0/46',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(190,'Interface utilization on Fa1/0/47',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(191,'Interface utilization on Fa1/0/48',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(192,'Interface utilization on Gi1/0/1',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(193,'Interface utilization on Gi1/0/2',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(194,'Interface utilization on Gi1/0/3',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(195,'Interface utilization on Gi1/0/4',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(196,'Interface utilization on Fa2/0/1',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(197,'Interface utilization on Fa2/0/2',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(198,'Interface utilization on Fa2/0/3',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(199,'Interface utilization on Fa2/0/4',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(200,'Interface utilization on Fa2/0/5',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(201,'Interface utilization on Fa2/0/6',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(202,'Interface utilization on Fa2/0/7',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(203,'Interface utilization on Fa2/0/8',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(204,'Interface utilization on Fa2/0/9',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(205,'Interface utilization on Fa2/0/10',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(206,'Interface utilization on Fa2/0/11',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(207,'Interface utilization on Fa2/0/12',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(208,'Interface utilization on Fa2/0/13',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(209,'Interface utilization on Fa2/0/14',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(210,'Interface utilization on Fa2/0/15',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(211,'Interface utilization on Fa2/0/16',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(212,'Interface utilization on Fa2/0/17',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(213,'Interface utilization on Fa2/0/18',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(214,'Interface utilization on Fa2/0/19',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(215,'Interface utilization on Fa2/0/20',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(216,'Interface utilization on Fa2/0/21',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(217,'Interface utilization on Fa2/0/22',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(218,'Interface utilization on Fa2/0/23',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(219,'Interface utilization on Fa2/0/24',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(220,'Interface utilization on Fa2/0/25',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(221,'Interface utilization on Fa2/0/26',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(222,'Interface utilization on Fa2/0/27',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(223,'Interface utilization on Fa2/0/28',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(224,'Interface utilization on Fa2/0/29',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(225,'Interface utilization on Fa2/0/30',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(226,'Interface utilization on Fa2/0/31',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(227,'Interface utilization on Fa2/0/32',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(228,'Interface utilization on Fa2/0/33',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(229,'Interface utilization on Fa2/0/34',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(230,'Interface utilization on Fa2/0/35',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(231,'Interface utilization on Fa2/0/36',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(232,'Interface utilization on Fa2/0/37',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(233,'Interface utilization on Fa2/0/38',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(234,'Interface utilization on Fa2/0/39',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(235,'Interface utilization on Fa2/0/40',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(236,'Interface utilization on Fa2/0/41',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(237,'Interface utilization on Fa2/0/42',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(238,'Interface utilization on Fa2/0/43',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(239,'Interface utilization on Fa2/0/44',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(240,'Interface utilization on Fa2/0/45',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(241,'Interface utilization on Fa2/0/46',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(242,'Interface utilization on Fa2/0/47',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(243,'Interface utilization on Fa2/0/48',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(244,'Interface utilization on Gi2/0/1',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(245,'Interface utilization on Gi2/0/2',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(246,'Interface utilization on Gi2/0/3',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(247,'Interface utilization on Gi2/0/4',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(248,'Interface utilization on ethernet0',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(249,'Interface utilization on ethernet1',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(250,'Interface utilization on ethernet2',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(251,'Interface utilization on ethernet3',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(252,'Interface utilization on ethernet4',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(253,'Interface utilization on ethernet5',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(254,'Memory usage',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(255,'Current Connections',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(256,'CPU usage',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(257,'Interface utilization on 1/1',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(258,'Interface utilization on 1/10',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(259,'Interface utilization on 1/11',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(260,'Interface utilization on 1/12',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(261,'Interface utilization on 1/13',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(262,'Interface utilization on 1/14',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(263,'Interface utilization on 1/15',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(264,'Interface utilization on 1/16',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(265,'Interface utilization on 1/17',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(266,'Interface utilization on 1/18',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(267,'Interface utilization on 1/19',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(268,'Interface utilization on 1/2',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(269,'Interface utilization on 1/20',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(270,'Interface utilization on 1/21',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(271,'Interface utilization on 1/22',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(272,'Interface utilization on 1/23',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(273,'Interface utilization on 1/24',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(274,'Interface utilization on 1/3',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(275,'Interface utilization on 1/4',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(276,'Interface utilization on 1/5',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(277,'Interface utilization on 1/6',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(278,'Interface utilization on 1/7',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(279,'Interface utilization on 1/8',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(280,'Interface utilization on 1/9',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(281,'Interface utilization on G1',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(282,'Interface utilization on G2',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(283,'Interface utilization on G3',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(284,'Interface utilization on G4',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(285,'Interface utilization on G5',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(286,'Interface utilization on G6',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(287,'Interface utilization on G7',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(288,'Interface utilization on G8',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(289,'Interface utilization on G9',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(290,'Interface utilization on G10',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(291,'Interface utilization on G11',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(292,'Interface utilization on G12',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(293,'Interface utilization on G13',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(294,'Interface utilization on G14',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(295,'Interface utilization on G15',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(296,'Interface utilization on G16',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(297,'Interface utilization on G17',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(298,'Interface utilization on G18',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(299,'Interface utilization on G19',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(300,'Interface utilization on G20',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(301,'Interface utilization on G21',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(302,'Interface utilization on G22',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(303,'Interface utilization on G23',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(304,'Interface utilization on G24',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(305,'hibernate transactions per second',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(306,'hibernate sessions',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(307,'if01',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(308,'if02',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(309,'if03',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(310,'if04',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(311,'if05',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(312,'if06',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(313,'if07',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(314,'if08',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(315,'if09',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(316,'if10',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(317,'if11',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(318,'if12',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(319,'if13',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(320,'if14',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(321,'if15',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(322,'if16',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(323,'if17',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(324,'if18',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(325,'if19',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(326,'if20',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(327,'if21',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(328,'if22',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(329,'if23',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(330,'if24',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(331,'if25',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(332,'if26',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(333,'if27',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(334,'if28',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(335,'if29',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(336,'if30',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(337,'if31',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(338,'if32',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(339,'if33',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(340,'if34',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(341,'if35',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(342,'if36',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(343,'if37',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(344,'if38',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(345,'if39',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(346,'if40',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(347,'if41',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(348,'if42',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(349,'if43',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(350,'if44',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(351,'if45',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(352,'if46',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(353,'if47',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(354,'if48',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(355,'if49',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(356,'if50',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(357,'if51',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(358,'classloader',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(359,'file descriptors',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(360,'threads',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(361,'memorypool perm gen',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(362,'memorypool code cache',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(363,'memorypool tenured gen',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(364,'memorypool ps old gen',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(365,'memorypool ps perm gen',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(366,'memorypool cms old gen',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(367,'memorypool cms perm gen',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(368,'garbage collector cycles per second',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(369,'Messages: Received',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(370,'Messages: Sent',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(371,'Messages: Local Delivery',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(372,'jk-8009 worker threads',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(373,'http-8080 worker threads',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(374,'http-8443 worker threads',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(375,'sessions /',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(376,'States',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(377,'Packet counters',900,200,0.0000,100.0000,0,1,1,1,0,0,0.0000,0.0000,0,0,0,0),(378,'CPU Load',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(379,'Interface 1',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(380,'Interface 2',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(381,'Memory',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(382,'Sessions',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(383,'Interface 3',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(384,'Interface 4',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0),(385,'Latency',900,200,0.0000,100.0000,0,1,1,0,0,0,0.0000,0.0000,0,0,0,0);
/*!40000 ALTER TABLE `graphs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `graphs_items`
--

DROP TABLE IF EXISTS `graphs_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `graphs_items` (
  `gitemid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `graphid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `itemid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `drawtype` int(11) NOT NULL DEFAULT '0',
  `sortorder` int(11) NOT NULL DEFAULT '0',
  `color` varchar(6) COLLATE utf8_bin NOT NULL DEFAULT '009600',
  `yaxisside` int(11) NOT NULL DEFAULT '1',
  `calc_fnc` int(11) NOT NULL DEFAULT '2',
  `type` int(11) NOT NULL DEFAULT '0',
  `periods_cnt` int(11) NOT NULL DEFAULT '5',
  PRIMARY KEY (`gitemid`),
  KEY `graphs_items_1` (`itemid`),
  KEY `graphs_items_2` (`graphid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `graphs_items`
--

LOCK TABLES `graphs_items` WRITE;
/*!40000 ALTER TABLE `graphs_items` DISABLE KEYS */;
INSERT INTO `graphs_items` VALUES (2,2,18467,0,0,'990000',1,2,0,5),(3,2,18468,0,0,'009900',1,2,0,5),(4,2,18469,0,0,'999900',1,2,0,5),(5,3,18472,1,0,'990000',1,2,0,5),(6,3,18470,1,0,'009900',1,2,0,5),(7,3,18473,1,0,'999900',1,2,0,5),(8,4,18443,0,0,'000099',1,2,0,5),(9,4,18440,0,0,'009900',1,2,0,5),(10,5,18506,1,0,'990000',1,2,0,5),(11,5,18505,1,0,'009900',1,2,0,5),(12,6,18576,2,0,'0000CC',1,7,0,5),(13,6,18582,2,0,'009900',1,7,0,5),(14,7,18752,0,0,'0000CC',1,7,0,5),(15,7,18758,2,0,'009900',1,7,0,5),(16,8,18646,2,0,'009900',1,7,0,5),(17,8,18928,2,0,'0000FF',1,7,0,5),(18,9,19110,2,0,'009900',1,7,0,5),(19,9,19104,2,0,'0000FF',1,7,0,5),(20,10,19286,2,0,'009900',1,7,0,5),(21,10,19280,2,0,'0000FF',1,7,0,5),(22,11,19350,2,0,'009900',1,7,0,5),(23,11,19344,2,0,'0000FF',1,7,0,5),(24,12,19366,2,0,'009900',1,7,0,5),(25,12,19360,2,0,'0000FF',1,7,0,5),(26,13,19382,2,0,'009900',1,7,0,5),(27,13,19376,2,0,'0000FF',1,7,0,5),(28,14,19398,2,0,'009900',1,7,0,5),(29,14,19392,2,0,'0000FF',1,7,0,5),(30,15,18598,2,0,'009900',1,7,0,5),(31,15,18592,2,0,'0000FF',1,7,0,5),(32,16,18614,2,0,'009900',1,7,0,5),(33,16,18608,2,0,'0000FF',1,7,0,5),(34,17,18630,2,0,'009900',1,7,0,5),(35,17,18624,2,0,'0000FF',1,7,0,5),(36,18,18646,2,0,'009900',1,7,0,5),(37,18,18640,2,0,'0000FF',1,7,0,5),(38,19,18662,2,0,'009900',1,7,0,5),(39,19,18656,2,0,'0000FF',1,7,0,5),(40,20,18678,2,0,'009900',1,7,0,5),(41,20,18672,2,0,'0000FF',1,7,0,5),(42,21,18694,2,0,'009900',1,7,0,5),(43,21,18688,2,0,'0000FF',1,7,0,5),(44,22,18710,2,0,'009900',1,7,0,5),(45,22,18704,2,0,'0000FF',1,7,0,5),(46,23,18726,2,0,'009900',1,7,0,5),(47,23,18720,2,0,'0000FF',1,7,0,5),(48,24,18742,2,0,'009900',1,7,0,5),(49,24,18736,2,0,'0000FF',1,7,0,5),(50,25,18774,2,0,'009900',1,7,0,5),(51,25,18768,2,0,'0000FF',1,7,0,5),(52,26,18790,2,0,'009900',1,7,0,5),(53,26,18784,2,0,'0000FF',1,7,0,5),(54,27,18806,2,0,'009900',1,7,0,5),(55,27,18800,2,0,'0000FF',1,7,0,5),(56,28,18822,2,0,'009900',1,7,0,5),(57,28,18816,2,0,'0000FF',1,7,0,5),(58,29,18838,2,0,'009900',1,7,0,5),(59,29,18832,2,0,'0000FF',1,7,0,5),(60,30,18854,2,0,'009900',1,7,0,5),(61,30,18848,2,0,'0000FF',1,7,0,5),(62,31,18870,2,0,'009900',1,7,0,5),(63,31,18864,2,0,'0000FF',1,7,0,5),(64,32,18886,2,0,'009900',1,7,0,5),(65,32,18880,2,0,'0000FF',1,7,0,5),(66,33,18902,2,0,'009900',1,7,0,5),(67,33,18896,2,0,'0000FF',1,7,0,5),(68,34,18918,2,0,'009900',1,7,0,5),(69,34,18912,2,0,'0000FF',1,7,0,5),(70,35,18950,2,0,'009900',1,7,0,5),(71,35,18944,2,0,'0000FF',1,7,0,5),(72,36,18966,2,0,'009900',1,7,0,5),(73,36,18960,2,0,'0000FF',1,7,0,5),(74,37,18982,2,0,'009900',1,7,0,5),(75,37,18976,2,0,'0000FF',1,7,0,5),(76,38,18998,2,0,'009900',1,7,0,5),(77,38,18992,2,0,'0000FF',1,7,0,5),(78,39,19014,2,0,'009900',1,7,0,5),(79,39,19008,2,0,'0000FF',1,7,0,5),(80,40,19030,2,0,'009900',1,7,0,5),(81,40,19024,2,0,'0000FF',1,7,0,5),(82,41,19046,2,0,'009900',1,7,0,5),(83,41,19040,2,0,'0000FF',1,7,0,5),(84,42,19062,2,0,'009900',1,7,0,5),(85,42,19056,2,0,'0000FF',1,7,0,5),(86,43,19078,2,0,'009900',1,7,0,5),(87,43,19072,2,0,'0000FF',1,7,0,5),(88,44,19094,2,0,'009900',1,7,0,5),(89,44,19088,2,0,'0000FF',1,7,0,5),(90,45,19126,2,0,'009900',1,7,0,5),(91,45,19120,2,0,'0000FF',1,7,0,5),(92,46,19142,2,0,'009900',1,7,0,5),(93,46,19136,2,0,'0000FF',1,7,0,5),(94,47,19158,2,0,'009900',1,7,0,5),(95,47,19152,2,0,'0000FF',1,7,0,5),(96,48,19174,2,0,'009900',1,7,0,5),(97,48,19168,2,0,'0000FF',1,7,0,5),(98,49,19190,2,0,'009900',1,7,0,5),(99,49,19184,2,0,'0000FF',1,7,0,5),(100,50,19206,2,0,'009900',1,7,0,5),(101,50,19200,2,0,'0000FF',1,7,0,5),(102,51,19222,2,0,'009900',1,7,0,5),(103,51,19216,2,0,'0000FF',1,7,0,5),(104,52,19238,2,0,'009900',1,7,0,5),(105,52,19232,2,0,'0000FF',1,7,0,5),(106,53,19254,2,0,'009900',1,7,0,5),(107,53,19248,2,0,'0000FF',1,7,0,5),(108,54,19270,2,0,'009900',1,7,0,5),(109,54,19264,2,0,'0000FF',1,7,0,5),(110,55,19302,2,0,'009900',1,7,0,5),(111,55,19296,2,0,'0000FF',1,7,0,5),(112,56,19318,2,0,'009900',1,7,0,5),(113,56,19312,2,0,'0000FF',1,7,0,5),(114,57,19334,2,0,'009900',1,7,0,5),(115,57,19328,2,0,'0000FF',1,7,0,5),(116,58,19444,1,1,'009900',1,2,0,5),(117,58,19445,2,2,'3333FF',1,2,0,5),(118,59,19448,2,0,'FF0000',1,2,0,5),(119,60,19473,0,0,'009900',1,2,0,5),(120,60,19569,0,0,'FF0000',1,2,0,5),(121,61,19484,0,0,'009900',1,2,0,5),(122,61,19580,0,0,'FF0000',1,2,0,5),(123,62,19490,0,0,'009900',1,2,0,5),(124,62,19586,0,0,'FF0000',1,2,0,5),(125,63,19491,0,0,'009900',1,2,0,5),(126,63,19587,0,0,'FF0000',1,2,0,5),(127,64,19492,0,0,'009900',1,2,0,5),(128,64,19588,0,0,'FF0000',1,2,0,5),(129,65,19493,0,0,'009900',1,2,0,5),(130,65,19589,0,0,'FF0000',1,2,0,5),(131,66,19494,0,0,'009900',1,2,0,5),(132,66,19590,0,0,'FF0000',1,2,0,5),(133,67,19495,0,0,'009900',1,2,0,5),(134,67,19591,0,0,'FF0000',1,2,0,5),(135,68,19496,0,0,'009900',1,2,0,5),(136,68,19592,0,0,'FF0000',1,2,0,5),(137,69,19474,0,0,'009900',1,2,0,5),(138,69,19570,0,0,'FF0000',1,2,0,5),(139,70,19475,0,0,'009900',1,2,0,5),(140,70,19571,0,0,'FF0000',1,2,0,5),(141,71,19476,0,0,'009900',1,2,0,5),(142,71,19572,0,0,'FF0000',1,2,0,5),(143,72,19477,0,0,'009900',1,2,0,5),(144,72,19573,0,0,'FF0000',1,2,0,5),(145,73,19478,0,0,'009900',1,2,0,5),(146,73,19574,0,0,'FF0000',1,2,0,5),(147,74,19479,0,0,'009900',1,2,0,5),(148,74,19575,0,0,'FF0000',1,2,0,5),(149,75,19480,0,0,'009900',1,2,0,5),(150,75,19576,0,0,'FF0000',1,2,0,5),(151,76,19481,0,0,'009900',1,2,0,5),(152,76,19577,0,0,'FF0000',1,2,0,5),(153,77,19482,0,0,'009900',1,2,0,5),(154,77,19578,0,0,'FF0000',1,2,0,5),(155,78,19483,0,0,'009900',1,2,0,5),(156,78,19579,0,0,'FF0000',1,2,0,5),(157,79,19485,0,0,'009900',1,2,0,5),(158,79,19581,0,0,'FF0000',1,2,0,5),(159,80,19486,0,0,'009900',1,2,0,5),(160,80,19582,0,0,'FF0000',1,2,0,5),(161,81,19487,0,0,'009900',1,2,0,5),(162,81,19583,0,0,'FF0000',1,2,0,5),(163,82,19488,0,0,'009900',1,2,0,5),(164,82,19584,0,0,'FF0000',1,2,0,5),(165,83,19489,0,0,'009900',1,2,0,5),(166,83,19585,0,0,'FF0000',1,2,0,5),(167,84,19642,0,0,'009900',1,2,0,5),(168,84,19742,0,0,'FF0000',1,2,0,5),(169,85,19653,0,0,'009900',1,2,0,5),(170,85,19753,0,0,'FF0000',1,2,0,5),(171,86,19660,0,0,'009900',1,2,0,5),(172,86,19760,0,0,'FF0000',1,2,0,5),(173,87,19661,0,0,'009900',1,2,0,5),(174,87,19761,0,0,'FF0000',1,2,0,5),(175,88,19662,0,0,'009900',1,2,0,5),(176,88,19762,0,0,'FF0000',1,2,0,5),(177,89,19663,0,0,'009900',1,2,0,5),(178,89,19763,0,0,'FF0000',1,2,0,5),(179,90,19664,0,0,'009900',1,2,0,5),(180,90,19764,0,0,'FF0000',1,2,0,5),(181,91,19665,0,0,'009900',1,2,0,5),(182,91,19765,0,0,'FF0000',1,2,0,5),(183,92,19666,0,0,'009900',1,2,0,5),(184,92,19766,0,0,'FF0000',1,2,0,5),(185,93,19643,0,0,'009900',1,2,0,5),(186,93,19743,0,0,'FF0000',1,2,0,5),(187,94,19644,0,0,'009900',1,2,0,5),(188,94,19744,0,0,'FF0000',1,2,0,5),(189,95,19645,0,0,'009900',1,2,0,5),(190,95,19745,0,0,'FF0000',1,2,0,5),(191,96,19646,0,0,'009900',1,2,0,5),(192,96,19746,0,0,'FF0000',1,2,0,5),(193,97,19647,0,0,'009900',1,2,0,5),(194,97,19747,0,0,'FF0000',1,2,0,5),(195,98,19648,0,0,'009900',1,2,0,5),(196,98,19748,0,0,'FF0000',1,2,0,5),(197,99,19649,0,0,'009900',1,2,0,5),(198,99,19749,0,0,'FF0000',1,2,0,5),(199,100,19650,0,0,'009900',1,2,0,5),(200,100,19750,0,0,'FF0000',1,2,0,5),(201,101,19651,0,0,'009900',1,2,0,5),(202,101,19751,0,0,'FF0000',1,2,0,5),(203,102,19652,0,0,'009900',1,2,0,5),(204,102,19752,0,0,'FF0000',1,2,0,5),(205,103,19654,0,0,'009900',1,2,0,5),(206,103,19754,0,0,'FF0000',1,2,0,5),(207,104,19655,0,0,'009900',1,2,0,5),(208,104,19755,0,0,'FF0000',1,2,0,5),(209,105,19656,0,0,'009900',1,2,0,5),(210,105,19756,0,0,'FF0000',1,2,0,5),(211,106,19657,0,0,'009900',1,2,0,5),(212,106,19757,0,0,'FF0000',1,2,0,5),(213,107,19658,0,0,'009900',1,2,0,5),(214,107,19758,0,0,'FF0000',1,2,0,5),(215,108,19659,0,0,'009900',1,2,0,5),(216,108,19759,0,0,'FF0000',1,2,0,5),(217,109,19800,0,0,'009900',1,2,0,5),(218,109,19801,0,1,'0000FF',1,2,0,5),(219,109,19804,0,2,'FF0000',1,2,0,5),(220,110,19798,0,0,'009900',1,2,0,5),(221,110,19799,0,1,'0000FF',1,2,0,5),(222,110,19803,0,2,'FF0000',1,2,0,5),(223,111,19802,0,0,'009900',1,2,0,5),(224,112,19832,1,0,'009900',1,2,0,5),(225,112,19839,0,1,'0000CC',1,2,0,5),(226,113,19844,0,0,'009900',1,2,0,5),(227,114,19811,2,0,'990000',1,2,0,5),(228,115,19871,1,0,'009900',1,2,0,5),(229,115,19883,0,1,'0000CC',1,2,0,5),(230,116,19889,0,0,'009900',1,2,0,5),(231,117,19846,2,0,'990000',1,2,0,5),(232,118,19891,1,0,'009900',1,2,0,5),(233,118,19917,0,1,'000099',1,2,0,5),(234,119,19900,1,0,'009900',1,2,0,5),(235,119,19926,0,1,'000099',1,2,0,5),(236,120,19901,1,0,'009900',1,2,0,5),(237,120,19927,0,1,'000099',1,2,0,5),(238,121,19902,1,0,'009900',1,2,0,5),(239,121,19928,0,1,'000099',1,2,0,5),(240,122,19903,1,0,'009900',1,2,0,5),(241,122,19929,0,1,'000099',1,2,0,5),(242,123,19904,1,0,'009900',1,2,0,5),(243,123,19930,0,1,'000099',1,2,0,5),(244,124,19905,1,0,'009900',1,2,0,5),(245,124,19931,0,1,'000099',1,2,0,5),(246,125,19906,1,0,'009900',1,2,0,5),(247,125,19932,0,1,'000099',1,2,0,5),(248,126,19907,1,0,'009900',1,2,0,5),(249,126,19933,0,1,'000099',1,2,0,5),(250,127,19908,1,0,'009900',1,2,0,5),(251,127,19934,0,1,'000099',1,2,0,5),(252,128,19909,1,0,'009900',1,2,0,5),(253,128,19935,0,1,'000099',1,2,0,5),(254,129,19892,1,0,'009900',1,2,0,5),(255,129,19918,0,1,'000099',1,2,0,5),(256,130,19910,1,0,'009900',1,2,0,5),(257,130,19936,0,1,'000099',1,2,0,5),(258,131,19911,1,0,'009900',1,2,0,5),(259,131,19937,0,1,'000099',1,2,0,5),(260,132,19912,1,0,'009900',1,2,0,5),(261,132,19938,0,1,'000099',1,2,0,5),(262,133,19913,1,0,'009900',1,2,0,5),(263,133,19939,0,1,'000099',1,2,0,5),(264,134,19914,1,0,'009900',1,2,0,5),(265,134,19940,0,1,'000099',1,2,0,5),(266,135,19893,1,0,'009900',1,2,0,5),(267,135,19919,0,1,'000099',1,2,0,5),(268,136,19894,1,0,'009900',1,2,0,5),(269,136,19920,0,1,'000099',1,2,0,5),(270,137,19895,1,0,'009900',1,2,0,5),(271,137,19921,0,1,'000099',1,2,0,5),(272,138,19896,1,0,'009900',1,2,0,5),(273,138,19922,0,1,'000099',1,2,0,5),(274,139,19897,1,0,'009900',1,2,0,5),(275,139,19923,0,1,'000099',1,2,0,5),(276,140,19898,1,0,'009900',1,2,0,5),(277,140,19924,0,1,'000099',1,2,0,5),(278,141,19899,1,0,'009900',1,2,0,5),(279,141,19925,0,1,'000099',1,2,0,5),(280,142,19915,1,0,'009900',1,2,0,5),(281,142,19941,0,1,'000099',1,2,0,5),(282,143,19916,1,0,'009900',1,2,0,5),(283,143,19942,0,1,'000099',1,2,0,5),(284,144,20377,0,0,'0000CC',1,2,0,5),(285,144,20162,0,0,'009900',1,2,0,5),(286,145,20378,0,0,'0000CC',1,2,0,5),(287,145,20163,0,0,'009900',1,2,0,5),(288,146,20379,0,0,'0000CC',1,2,0,5),(289,146,20164,0,0,'009900',1,2,0,5),(290,147,20380,0,0,'0000CC',1,2,0,5),(291,147,20165,0,0,'009900',1,2,0,5),(292,148,20381,0,0,'0000CC',1,2,0,5),(293,148,20166,0,0,'009900',1,2,0,5),(294,149,20382,0,0,'0000CC',1,2,0,5),(295,149,20167,0,0,'009900',1,2,0,5),(296,150,20383,0,0,'0000CC',1,2,0,5),(297,150,20168,0,0,'009900',1,2,0,5),(298,151,20384,0,0,'0000CC',1,2,0,5),(299,151,20169,0,0,'009900',1,2,0,5),(300,152,20385,0,0,'0000CC',1,2,0,5),(301,152,20170,0,0,'009900',1,2,0,5),(302,153,20386,0,0,'0000CC',1,2,0,5),(303,153,20171,0,0,'009900',1,2,0,5),(304,154,20387,0,0,'0000CC',1,2,0,5),(305,154,20172,0,0,'009900',1,2,0,5),(306,155,20388,0,0,'0000CC',1,2,0,5),(307,155,20173,0,0,'009900',1,2,0,5),(308,156,20389,0,0,'0000CC',1,2,0,5),(309,156,20174,0,0,'009900',1,2,0,5),(310,157,20390,0,0,'0000CC',1,2,0,5),(311,157,20175,0,0,'009900',1,2,0,5),(312,158,20391,0,0,'0000CC',1,2,0,5),(313,158,20176,0,0,'009900',1,2,0,5),(314,159,20392,0,0,'0000CC',1,2,0,5),(315,159,20177,0,0,'009900',1,2,0,5),(316,160,20393,0,0,'0000CC',1,2,0,5),(317,160,20178,0,0,'009900',1,2,0,5),(318,161,20394,0,0,'0000CC',1,2,0,5),(319,161,20179,0,0,'009900',1,2,0,5),(320,162,20395,0,0,'0000CC',1,2,0,5),(321,162,20180,0,0,'009900',1,2,0,5),(322,163,20396,0,0,'0000CC',1,2,0,5),(323,163,20181,0,0,'009900',1,2,0,5),(324,164,20397,0,0,'0000CC',1,2,0,5),(325,164,20182,0,0,'009900',1,2,0,5),(326,165,20398,0,0,'0000CC',1,2,0,5),(327,165,20183,0,0,'009900',1,2,0,5),(328,166,20399,0,0,'0000CC',1,2,0,5),(329,166,20184,0,0,'009900',1,2,0,5),(330,167,20400,0,0,'0000CC',1,2,0,5),(331,167,20185,0,0,'009900',1,2,0,5),(332,168,20401,0,0,'0000CC',1,2,0,5),(333,168,20186,0,0,'009900',1,2,0,5),(334,169,20402,0,0,'0000CC',1,2,0,5),(335,169,20187,0,0,'009900',1,2,0,5),(336,170,20403,0,0,'0000CC',1,2,0,5),(337,170,20188,0,0,'009900',1,2,0,5),(338,171,20404,0,0,'0000CC',1,2,0,5),(339,171,20189,0,0,'009900',1,2,0,5),(340,172,20405,0,0,'0000CC',1,2,0,5),(341,172,20190,0,0,'009900',1,2,0,5),(342,173,20406,0,0,'0000CC',1,2,0,5),(343,173,20191,0,0,'009900',1,2,0,5),(344,174,20407,0,0,'0000CC',1,2,0,5),(345,174,20192,0,0,'009900',1,2,0,5),(346,175,20408,0,0,'0000CC',1,2,0,5),(347,175,20193,0,0,'009900',1,2,0,5),(348,176,20409,0,0,'0000CC',1,2,0,5),(349,176,20194,0,0,'009900',1,2,0,5),(350,177,20410,0,0,'0000CC',1,2,0,5),(351,177,20195,0,0,'009900',1,2,0,5),(352,178,20411,0,0,'0000CC',1,2,0,5),(353,178,20196,0,0,'009900',1,2,0,5),(354,179,20412,0,0,'0000CC',1,2,0,5),(355,179,20197,0,0,'009900',1,2,0,5),(356,180,20413,0,0,'0000CC',1,2,0,5),(357,180,20198,0,0,'009900',1,2,0,5),(358,181,20414,0,0,'0000CC',1,2,0,5),(359,181,20199,0,0,'009900',1,2,0,5),(360,182,20415,0,0,'0000CC',1,2,0,5),(361,182,20200,0,0,'009900',1,2,0,5),(362,183,20416,0,0,'0000CC',1,2,0,5),(363,183,20201,0,0,'009900',1,2,0,5),(364,184,20417,0,0,'0000CC',1,2,0,5),(365,184,20202,0,0,'009900',1,2,0,5),(366,185,20418,0,0,'0000CC',1,2,0,5),(367,185,20203,0,0,'009900',1,2,0,5),(368,186,20419,0,0,'0000CC',1,2,0,5),(369,186,20204,0,0,'009900',1,2,0,5),(370,187,20420,0,0,'0000CC',1,2,0,5),(371,187,20205,0,0,'009900',1,2,0,5),(372,188,20421,0,0,'0000CC',1,2,0,5),(373,188,20206,0,0,'009900',1,2,0,5),(374,189,20422,0,0,'0000CC',1,2,0,5),(375,189,20207,0,0,'009900',1,2,0,5),(376,190,20423,0,0,'0000CC',1,2,0,5),(377,190,20208,0,0,'009900',1,2,0,5),(378,191,20424,0,0,'0000CC',1,2,0,5),(379,191,20209,0,0,'009900',1,2,0,5),(380,192,20425,0,0,'0000CC',1,2,0,5),(381,192,20210,0,0,'009900',1,2,0,5),(382,193,20426,0,0,'0000CC',1,2,0,5),(383,193,20211,0,0,'009900',1,2,0,5),(384,194,20427,0,0,'0000CC',1,2,0,5),(385,194,20212,0,0,'009900',1,2,0,5),(386,195,20428,0,0,'0000CC',1,2,0,5),(387,195,20213,0,0,'009900',1,2,0,5),(388,196,20429,0,0,'0000CC',1,2,0,5),(389,196,20214,0,0,'009900',1,2,0,5),(390,197,20430,0,0,'0000CC',1,2,0,5),(391,197,20215,0,0,'009900',1,2,0,5),(392,198,20431,0,0,'0000CC',1,2,0,5),(393,198,20216,0,0,'009900',1,2,0,5),(394,199,20432,0,0,'0000CC',1,2,0,5),(395,199,20217,0,0,'009900',1,2,0,5),(396,200,20433,0,0,'0000CC',1,2,0,5),(397,200,20218,0,0,'009900',1,2,0,5),(398,201,20434,0,0,'0000CC',1,2,0,5),(399,201,20219,0,0,'009900',1,2,0,5),(400,202,20435,0,0,'0000CC',1,2,0,5),(401,202,20220,0,0,'009900',1,2,0,5),(402,203,20436,0,0,'0000CC',1,2,0,5),(403,203,20221,0,0,'009900',1,2,0,5),(404,204,20437,0,0,'0000CC',1,2,0,5),(405,204,20222,0,0,'009900',1,2,0,5),(406,205,20438,0,0,'0000CC',1,2,0,5),(407,205,20223,0,0,'009900',1,2,0,5),(408,206,20439,0,0,'0000CC',1,2,0,5),(409,206,20224,0,0,'009900',1,2,0,5),(410,207,20440,0,0,'0000CC',1,2,0,5),(411,207,20225,0,0,'009900',1,2,0,5),(412,208,20441,0,0,'0000CC',1,2,0,5),(413,208,20226,0,0,'009900',1,2,0,5),(414,209,20442,0,0,'0000CC',1,2,0,5),(415,209,20227,0,0,'009900',1,2,0,5),(416,210,20443,0,0,'0000CC',1,2,0,5),(417,210,20228,0,0,'009900',1,2,0,5),(418,211,20444,0,0,'0000CC',1,2,0,5),(419,211,20229,0,0,'009900',1,2,0,5),(420,212,20445,0,0,'0000CC',1,2,0,5),(421,212,20230,0,0,'009900',1,2,0,5),(422,213,20446,0,0,'0000CC',1,2,0,5),(423,213,20231,0,0,'009900',1,2,0,5),(424,214,20447,0,0,'0000CC',1,2,0,5),(425,214,20232,0,0,'009900',1,2,0,5),(426,215,20448,0,0,'0000CC',1,2,0,5),(427,215,20233,0,0,'009900',1,2,0,5),(428,216,20449,0,0,'0000CC',1,2,0,5),(429,216,20234,0,0,'009900',1,2,0,5),(430,217,20450,0,0,'0000CC',1,2,0,5),(431,217,20235,0,0,'009900',1,2,0,5),(432,218,20451,0,0,'0000CC',1,2,0,5),(433,218,20236,0,0,'009900',1,2,0,5),(434,219,20452,0,0,'0000CC',1,2,0,5),(435,219,20237,0,0,'009900',1,2,0,5),(436,220,20453,0,0,'0000CC',1,2,0,5),(437,220,20238,0,0,'009900',1,2,0,5),(438,221,20454,0,0,'0000CC',1,2,0,5),(439,221,20239,0,0,'009900',1,2,0,5),(440,222,20455,0,0,'0000CC',1,2,0,5),(441,222,20240,0,0,'009900',1,2,0,5),(442,223,20456,0,0,'0000CC',1,2,0,5),(443,223,20241,0,0,'009900',1,2,0,5),(444,224,20457,0,0,'0000CC',1,2,0,5),(445,224,20242,0,0,'009900',1,2,0,5),(446,225,20458,0,0,'0000CC',1,2,0,5),(447,225,20243,0,0,'009900',1,2,0,5),(448,226,20459,0,0,'0000CC',1,2,0,5),(449,226,20244,0,0,'009900',1,2,0,5),(450,227,20460,0,0,'0000CC',1,2,0,5),(451,227,20245,0,0,'009900',1,2,0,5),(452,228,20461,0,0,'0000CC',1,2,0,5),(453,228,20246,0,0,'009900',1,2,0,5),(454,229,20462,0,0,'0000CC',1,2,0,5),(455,229,20247,0,0,'009900',1,2,0,5),(456,230,20463,0,0,'0000CC',1,2,0,5),(457,230,20248,0,0,'009900',1,2,0,5),(458,231,20464,0,0,'0000CC',1,2,0,5),(459,231,20249,0,0,'009900',1,2,0,5),(460,232,20465,0,0,'0000CC',1,2,0,5),(461,232,20250,0,0,'009900',1,2,0,5),(462,233,20466,0,0,'0000CC',1,2,0,5),(463,233,20251,0,0,'009900',1,2,0,5),(464,234,20467,0,0,'0000CC',1,2,0,5),(465,234,20252,0,0,'009900',1,2,0,5),(466,235,20468,0,0,'0000CC',1,2,0,5),(467,235,20253,0,0,'009900',1,2,0,5),(468,236,20469,0,0,'0000CC',1,2,0,5),(469,236,20254,0,0,'009900',1,2,0,5),(470,237,20470,0,0,'0000CC',1,2,0,5),(471,237,20255,0,0,'009900',1,2,0,5),(472,238,20471,0,0,'0000CC',1,2,0,5),(473,238,20256,0,0,'009900',1,2,0,5),(474,239,20472,0,0,'0000CC',1,2,0,5),(475,239,20257,0,0,'009900',1,2,0,5),(476,240,20473,0,0,'0000CC',1,2,0,5),(477,240,20258,0,0,'009900',1,2,0,5),(478,241,20474,0,0,'0000CC',1,2,0,5),(479,241,20259,0,0,'009900',1,2,0,5),(480,242,20475,0,0,'0000CC',1,2,0,5),(481,242,20260,0,0,'009900',1,2,0,5),(482,243,20476,0,0,'0000CC',1,2,0,5),(483,243,20261,0,0,'009900',1,2,0,5),(484,244,20477,0,0,'0000CC',1,2,0,5),(485,244,20262,0,0,'009900',1,2,0,5),(486,245,20478,0,0,'0000CC',1,2,0,5),(487,245,20263,0,0,'009900',1,2,0,5),(488,246,20479,0,0,'0000CC',1,2,0,5),(489,246,20264,0,0,'009900',1,2,0,5),(490,247,20480,0,0,'0000CC',1,2,0,5),(491,247,20265,0,0,'009900',1,2,0,5),(492,248,20711,0,0,'009900',1,2,0,5),(493,248,20724,0,0,'0000CC',1,2,0,5),(494,249,20712,0,0,'009900',1,2,0,5),(495,249,20725,0,0,'0000CC',1,2,0,5),(496,250,20713,0,0,'009900',1,2,0,5),(497,250,20726,0,0,'0000CC',1,2,0,5),(498,251,20714,0,0,'009900',1,2,0,5),(499,251,20727,0,0,'0000CC',1,2,0,5),(500,252,20715,0,0,'009900',1,2,0,5),(501,252,20728,0,0,'0000CC',1,2,0,5),(502,253,20716,0,0,'009900',1,2,0,5),(503,253,20729,0,0,'0000CC',1,2,0,5),(504,254,20743,1,0,'000099',1,2,0,5),(505,254,20742,2,0,'CCCC00',1,2,0,5),(506,255,20703,1,0,'CCCC00',1,2,0,5),(507,256,20704,1,0,'FF0000',1,2,0,5),(508,257,20805,0,0,'009900',1,2,0,5),(509,257,20884,0,0,'0000CC',1,2,0,5),(510,258,20806,0,0,'009900',1,2,0,5),(511,258,20885,0,0,'0000CC',1,2,0,5),(512,259,20808,0,0,'009900',1,2,0,5),(513,259,20887,0,0,'0000CC',1,2,0,5),(514,260,20809,0,0,'009900',1,2,0,5),(515,260,20888,0,0,'0000CC',1,2,0,5),(516,261,20810,0,0,'009900',1,2,0,5),(517,261,20889,0,0,'0000CC',1,2,0,5),(518,262,20811,0,0,'009900',1,2,0,5),(519,262,20890,0,0,'0000CC',1,2,0,5),(520,263,20812,0,0,'009900',1,2,0,5),(521,263,20891,0,0,'0000CC',1,2,0,5),(522,264,20813,0,0,'009900',1,2,0,5),(523,264,20892,0,0,'0000CC',1,2,0,5),(524,265,20814,0,0,'009900',1,2,0,5),(525,265,20893,0,0,'0000CC',1,2,0,5),(526,266,20815,0,0,'009900',1,2,0,5),(527,266,20894,0,0,'0000CC',1,2,0,5),(528,267,20816,0,0,'009900',1,2,0,5),(529,267,20895,0,0,'0000CC',1,2,0,5),(530,268,20817,0,0,'009900',1,2,0,5),(531,268,20896,0,0,'0000CC',1,2,0,5),(532,269,20818,0,0,'009900',1,2,0,5),(533,269,20897,0,0,'0000CC',1,2,0,5),(534,270,20819,0,0,'009900',1,2,0,5),(535,270,20898,0,0,'0000CC',1,2,0,5),(536,271,20820,0,0,'009900',1,2,0,5),(537,271,20899,0,0,'0000CC',1,2,0,5),(538,272,20821,0,0,'009900',1,2,0,5),(539,272,20900,0,0,'0000CC',1,2,0,5),(540,273,20822,0,0,'009900',1,2,0,5),(541,273,20901,0,0,'0000CC',1,2,0,5),(542,274,20823,0,0,'009900',1,2,0,5),(543,274,20902,0,0,'0000CC',1,2,0,5),(544,275,20825,0,0,'009900',1,2,0,5),(545,275,20904,0,0,'0000CC',1,2,0,5),(546,276,20826,0,0,'009900',1,2,0,5),(547,276,20905,0,0,'0000CC',1,2,0,5),(548,277,20827,0,0,'009900',1,2,0,5),(549,277,20906,0,0,'0000CC',1,2,0,5),(550,278,20828,0,0,'009900',1,2,0,5),(551,278,20907,0,0,'0000CC',1,2,0,5),(552,279,20829,0,0,'009900',1,2,0,5),(553,279,20908,0,0,'0000CC',1,2,0,5),(554,280,20830,0,0,'009900',1,2,0,5),(555,280,20909,0,0,'0000CC',1,2,0,5),(556,281,21151,0,0,'0000CC',1,2,0,5),(557,281,21042,0,0,'009900',1,2,0,5),(558,282,21166,0,0,'0000CC',1,2,0,5),(559,282,21057,0,0,'009900',1,2,0,5),(560,283,21177,0,0,'0000CC',1,2,0,5),(561,283,21068,0,0,'009900',1,2,0,5),(562,284,21181,0,0,'0000CC',1,2,0,5),(563,284,21072,0,0,'009900',1,2,0,5),(564,285,21182,0,0,'0000CC',1,2,0,5),(565,285,21073,0,0,'009900',1,2,0,5),(566,286,21183,0,0,'0000CC',1,2,0,5),(567,286,21074,0,0,'009900',1,2,0,5),(568,287,21184,0,0,'0000CC',1,2,0,5),(569,287,21075,0,0,'009900',1,2,0,5),(570,288,21185,0,0,'0000CC',1,2,0,5),(571,288,21076,0,0,'009900',1,2,0,5),(572,289,21186,0,0,'0000CC',1,2,0,5),(573,289,21077,0,0,'009900',1,2,0,5),(574,290,21152,0,0,'0000CC',1,2,0,5),(575,290,21043,0,0,'009900',1,2,0,5),(576,291,21157,0,0,'0000CC',1,2,0,5),(577,291,21048,0,0,'009900',1,2,0,5),(578,292,21158,0,0,'0000CC',1,2,0,5),(579,292,21049,0,0,'009900',1,2,0,5),(580,293,21159,0,0,'0000CC',1,2,0,5),(581,293,21050,0,0,'009900',1,2,0,5),(582,294,21160,0,0,'0000CC',1,2,0,5),(583,294,21051,0,0,'009900',1,2,0,5),(584,295,21161,0,0,'0000CC',1,2,0,5),(585,295,21052,0,0,'009900',1,2,0,5),(586,296,21162,0,0,'0000CC',1,2,0,5),(587,296,21053,0,0,'009900',1,2,0,5),(588,297,21163,0,0,'0000CC',1,2,0,5),(589,297,21054,0,0,'009900',1,2,0,5),(590,298,21164,0,0,'0000CC',1,2,0,5),(591,298,21055,0,0,'009900',1,2,0,5),(592,299,21165,0,0,'0000CC',1,2,0,5),(593,299,21056,0,0,'009900',1,2,0,5),(594,300,21167,0,0,'0000CC',1,2,0,5),(595,300,21058,0,0,'009900',1,2,0,5),(596,301,21168,0,0,'0000CC',1,2,0,5),(597,301,21059,0,0,'009900',1,2,0,5),(598,302,21169,0,0,'0000CC',1,2,0,5),(599,302,21060,0,0,'009900',1,2,0,5),(600,303,21170,0,0,'0000CC',1,2,0,5),(601,303,21061,0,0,'009900',1,2,0,5),(602,304,21171,0,0,'0000CC',1,2,0,5),(603,304,21062,0,0,'009900',1,2,0,5),(604,305,21229,0,0,'990000',1,2,0,5),(605,305,21234,0,0,'009900',1,2,0,5),(606,305,21235,0,0,'000099',1,2,0,5),(607,306,21233,0,0,'009900',1,2,0,5),(608,306,21232,0,0,'000099',1,2,0,5),(609,307,21629,2,1,'0000CC',1,2,0,5),(610,307,21447,1,1,'009900',1,2,0,5),(611,308,21458,1,0,'009900',1,2,0,5),(612,308,21640,2,0,'0000CC',1,2,0,5),(613,309,21469,1,0,'009900',1,2,0,5),(614,309,21651,2,0,'0000CC',1,2,0,5),(615,310,21480,1,0,'009900',1,2,0,5),(616,310,21662,2,0,'0000CC',1,2,0,5),(617,311,21491,1,0,'009900',1,2,0,5),(618,311,21673,2,0,'0000CC',1,2,0,5),(619,312,21494,1,0,'009900',1,2,0,5),(620,312,21676,2,0,'0000CC',1,2,0,5),(621,313,21495,1,0,'009900',1,2,0,5),(622,313,21677,2,0,'0000CC',1,2,0,5),(623,314,21496,1,0,'009900',1,2,0,5),(624,314,21678,2,0,'0000CC',1,2,0,5),(625,315,21497,1,0,'009900',1,2,0,5),(626,315,21679,2,0,'0000CC',1,2,0,5),(627,316,21448,1,0,'009900',1,2,0,5),(628,316,21630,2,0,'0000CC',1,2,0,5),(629,317,21449,1,0,'009900',1,2,0,5),(630,317,21631,2,0,'0000CC',1,2,0,5),(631,318,21450,1,0,'009900',1,2,0,5),(632,318,21632,2,0,'0000CC',1,2,0,5),(633,319,21451,1,0,'009900',1,2,0,5),(634,319,21633,2,0,'0000CC',1,2,0,5),(635,320,21452,1,0,'009900',1,2,0,5),(636,320,21634,2,0,'0000CC',1,2,0,5),(637,321,21453,1,0,'009900',1,2,0,5),(638,321,21635,2,0,'0000CC',1,2,0,5),(639,322,21454,1,0,'009900',1,2,0,5),(640,322,21636,2,0,'0000CC',1,2,0,5),(641,323,21455,1,0,'009900',1,2,0,5),(642,323,21637,2,0,'0000CC',1,2,0,5),(643,324,21456,1,0,'009900',1,2,0,5),(644,324,21638,2,0,'0000CC',1,2,0,5),(645,325,21457,1,0,'009900',1,2,0,5),(646,325,21639,2,0,'0000CC',1,2,0,5),(647,326,21459,1,0,'009900',1,2,0,5),(648,326,21641,2,0,'0000CC',1,2,0,5),(649,327,21460,1,0,'009900',1,2,0,5),(650,327,21642,2,0,'0000CC',1,2,0,5),(651,328,21461,1,0,'009900',1,2,0,5),(652,328,21643,2,0,'0000CC',1,2,0,5),(653,329,21462,1,0,'009900',1,2,0,5),(654,329,21644,2,0,'0000CC',1,2,0,5),(655,330,21463,1,0,'009900',1,2,0,5),(656,330,21645,2,0,'0000CC',1,2,0,5),(657,331,21464,1,0,'009900',1,2,0,5),(658,331,21646,2,0,'0000CC',1,2,0,5),(659,332,21465,1,0,'009900',1,2,0,5),(660,332,21647,2,0,'0000CC',1,2,0,5),(661,333,21466,1,0,'009900',1,2,0,5),(662,333,21648,2,0,'0000CC',1,2,0,5),(663,334,21467,1,0,'009900',1,2,0,5),(664,334,21649,2,0,'0000CC',1,2,0,5),(665,335,21468,1,0,'009900',1,2,0,5),(666,335,21650,2,0,'0000CC',1,2,0,5),(667,336,21470,1,0,'009900',1,2,0,5),(668,336,21652,2,0,'0000CC',1,2,0,5),(669,337,21471,1,0,'009900',1,2,0,5),(670,337,21653,2,0,'0000CC',1,2,0,5),(671,338,21472,1,0,'009900',1,2,0,5),(672,338,21654,2,0,'0000CC',1,2,0,5),(673,339,21473,1,0,'009900',1,2,0,5),(674,339,21655,2,0,'0000CC',1,2,0,5),(675,340,21474,1,0,'009900',1,2,0,5),(676,340,21656,2,0,'0000CC',1,2,0,5),(677,341,21475,1,0,'009900',1,2,0,5),(678,341,21657,2,0,'0000CC',1,2,0,5),(679,342,21476,1,0,'009900',1,2,0,5),(680,342,21658,2,0,'0000CC',1,2,0,5),(681,343,21477,1,0,'009900',1,2,0,5),(682,343,21659,2,0,'0000CC',1,2,0,5),(683,344,21478,1,0,'009900',1,2,0,5),(684,344,21660,2,0,'0000CC',1,2,0,5),(685,345,21479,1,0,'009900',1,2,0,5),(686,345,21661,2,0,'0000CC',1,2,0,5),(687,346,21481,1,0,'009900',1,2,0,5),(688,346,21663,2,0,'0000CC',1,2,0,5),(689,347,21482,1,0,'009900',1,2,0,5),(690,347,21664,2,0,'0000CC',1,2,0,5),(691,348,21483,1,0,'009900',1,2,0,5),(692,348,21665,2,0,'0000CC',1,2,0,5),(693,349,21484,1,0,'009900',1,2,0,5),(694,349,21666,2,0,'0000CC',1,2,0,5),(695,350,21485,1,0,'009900',1,2,0,5),(696,350,21667,2,0,'0000CC',1,2,0,5),(697,351,21486,1,0,'009900',1,2,0,5),(698,351,21668,2,0,'0000CC',1,2,0,5),(699,352,21487,1,0,'009900',1,2,0,5),(700,352,21669,2,0,'0000CC',1,2,0,5),(701,353,21488,1,0,'009900',1,2,0,5),(702,353,21670,2,0,'0000CC',1,2,0,5),(703,354,21489,1,0,'009900',1,2,0,5),(704,354,21671,2,0,'0000CC',1,2,0,5),(705,355,21490,1,0,'009900',1,2,0,5),(706,355,21672,2,0,'0000CC',1,2,0,5),(707,356,21492,1,0,'009900',1,2,0,5),(708,356,21674,2,0,'0000CC',1,2,0,5),(709,357,21493,1,0,'009900',1,2,0,5),(710,357,21675,2,0,'0000CC',1,2,0,5),(711,358,21710,0,0,'000099',1,2,0,5),(712,358,21711,0,0,'999900',1,2,0,5),(713,358,21709,0,0,'009900',1,2,0,5),(714,359,21715,0,0,'990000',1,2,0,5),(715,359,21716,0,0,'009900',1,2,0,5),(716,360,21720,0,0,'990000',1,2,0,5),(717,360,21719,0,0,'000099',1,2,0,5),(718,360,21721,0,0,'009900',1,2,0,5),(719,361,21736,0,0,'000099',1,2,0,5),(720,361,21737,0,0,'990000',1,2,0,5),(721,361,21738,0,0,'009900',1,2,0,5),(722,362,21739,0,0,'000099',1,2,0,5),(723,362,21740,0,0,'990000',1,2,0,5),(724,362,21741,0,0,'009900',1,2,0,5),(725,363,21742,0,0,'000099',1,2,0,5),(726,363,21743,0,0,'990000',1,2,0,5),(727,363,21744,0,0,'009900',1,2,0,5),(728,364,21745,0,0,'000099',1,2,0,5),(729,364,21746,0,0,'990000',1,2,0,5),(730,364,21747,0,0,'009900',1,2,0,5),(731,365,21748,0,0,'000099',1,2,0,5),(732,365,21749,0,0,'990000',1,2,0,5),(733,365,21750,0,0,'009900',1,2,0,5),(734,366,21751,0,0,'000099',1,2,0,5),(735,366,21752,0,0,'990000',1,2,0,5),(736,366,21753,0,0,'009900',1,2,0,5),(737,367,21754,0,0,'000099',1,2,0,5),(738,367,21755,0,0,'990000',1,2,0,5),(739,367,21756,0,0,'009900',1,2,0,5),(740,368,21734,0,0,'009900',1,2,0,5),(741,368,21724,0,0,'990000',1,2,0,5),(742,368,21726,0,0,'009900',1,2,0,5),(743,368,21728,0,0,'990000',1,2,0,5),(744,368,21732,0,0,'990000',1,2,0,5),(745,368,21730,0,0,'009900',1,2,0,5),(746,369,21790,2,0,'009900',1,7,0,5),(747,370,21792,2,0,'0000CC',1,7,0,5),(748,371,21783,2,0,'009900',1,7,0,5),(749,372,21851,0,0,'990000',1,2,0,5),(750,372,21853,0,0,'009900',1,2,0,5),(751,372,21852,0,0,'000099',1,2,0,5),(752,373,21859,0,0,'990000',1,2,0,5),(753,373,21861,0,0,'009900',1,2,0,5),(754,373,21860,0,0,'000099',1,2,0,5),(755,374,21868,0,0,'990000',1,2,0,5),(756,374,21870,0,0,'009900',1,2,0,5),(757,374,21869,0,0,'000099',1,2,0,5),(758,375,21874,0,0,'990000',1,2,0,5),(759,375,21872,0,0,'009900',1,2,0,5),(760,375,21873,0,0,'000099',1,2,0,5),(761,376,22110,4,0,'FF0000',1,2,0,5),(762,376,22128,2,1,'009900',1,2,0,5),(763,376,22129,0,2,'FFAA00',1,2,0,5),(764,376,22130,0,3,'FF0000',1,2,0,5),(765,376,22131,0,4,'0000FF',1,2,0,5),(766,377,21891,1,0,'999999',1,2,0,5),(767,377,21892,1,1,'009900',1,2,0,5),(768,377,21893,1,2,'0000FF',1,2,0,5),(769,377,21894,1,3,'FF0000',1,2,0,5),(770,377,21895,1,4,'FFFF00',1,2,0,5),(771,377,21896,1,5,'000000',1,2,0,5),(772,378,22154,0,0,'009900',1,2,0,5),(773,378,22155,0,0,'00CCCC',1,2,0,5),(774,378,22156,0,0,'0000FF',1,2,0,5),(775,378,22157,0,0,'FF0000',1,2,0,5),(776,379,22150,0,0,'0000FF',1,2,0,5),(777,379,22142,0,0,'00CC00',1,2,0,5),(778,379,22146,0,0,'FF00FF',1,2,0,5),(779,379,22138,0,0,'FF0000',1,2,0,5),(780,380,22143,0,0,'00CC00',1,2,0,5),(781,380,22151,0,0,'0000FF',1,2,0,5),(782,380,22139,0,0,'FF0000',1,2,0,5),(783,380,22147,0,0,'FF00FF',1,2,0,5),(784,381,22158,0,0,'009900',1,2,0,5),(785,381,22159,0,0,'0000FF',1,2,0,5),(786,382,22161,0,0,'FF0000',1,2,0,5),(787,382,22160,0,0,'009900',1,2,0,5),(788,383,22144,0,0,'00CC00',1,2,0,5),(789,383,22152,0,0,'0000FF',1,2,0,5),(790,383,22140,0,0,'FF0000',1,2,0,5),(791,383,22148,0,0,'FF00FF',1,2,0,5),(792,384,22145,0,0,'00CC00',1,2,0,5),(793,384,22153,0,0,'0000FF',1,2,0,5),(794,384,22141,0,0,'FF0000',1,2,0,5),(795,384,22149,0,0,'FF00FF',1,2,0,5),(796,385,22137,0,0,'009900',1,2,0,5);
/*!40000 ALTER TABLE `graphs_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groups`
--

DROP TABLE IF EXISTS `groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groups` (
  `groupid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `internal` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`groupid`),
  KEY `groups_1` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groups`
--

LOCK TABLES `groups` WRITE;
/*!40000 ALTER TABLE `groups` DISABLE KEYS */;
INSERT INTO `groups` VALUES (1,'Templates',0),(2,'Linux servers',0),(3,'Windows servers',0),(4,'Zabbix servers',0),(5,'Discovered hosts',1),(6,'Jenkins servers',0);
/*!40000 ALTER TABLE `groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `help_items`
--

DROP TABLE IF EXISTS `help_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `help_items` (
  `itemtype` int(11) NOT NULL DEFAULT '0',
  `key_` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `description` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`itemtype`,`key_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `help_items`
--

LOCK TABLES `help_items` WRITE;
/*!40000 ALTER TABLE `help_items` DISABLE KEYS */;
INSERT INTO `help_items` VALUES (0,'agent.ping','Check the agent usability. Always return 1. Can be used as a TCP ping.'),(0,'agent.version','Version of zabbix_agent(d) running on monitored host. String value. Example of returned value: 1.1'),(0,'kernel.maxfiles','Maximum number of opened files supported by OS.'),(0,'kernel.maxproc','Maximum number of processes supported by OS.'),(0,'net.if.collisions[if]','Out-of-window collision. Collisions count.'),(0,'net.if.in[if &lt;,mode&gt;]','Network interface input statistic. Integer value. If mode is missing bytes is used.'),(0,'net.if.list','List of network interfaces. Text value.'),(0,'net.if.out[if &lt;,mode&gt;]','Network interface output statistic. Integer value. If mode is missing bytes is used.'),(0,'net.if.total[if &lt;,mode&gt;]','Sum of network interface incoming and outgoing statistics. Integer value. Mode - one of bytes (default), packets, errors or dropped'),(0,'net.tcp.dns.query[ip, zone, type]','Performs a query for the record type specified by the parameter type'),(0,'net.tcp.dns[ip, zone]','Checks if DNS service is up. 0 - DNS is down, 1 - DNS is up.'),(0,'net.tcp.listen[port]','Checks if this port is in LISTEN state. 0 - it is not, 1 - it is in LISTEN state.'),(0,'net.tcp.port[&lt;ip&gt;, port]','Check, if it is possible to make TCP connection to the port number. 0 - cannot connect, 1 - can connect. IP address is optional. If ip is missing, 127.0.0.1 is used. Example: net.tcp.port[,80]'),(0,'net.tcp.service.perf[service &lt;,ip&gt; &lt;,port&gt;]','Check performance of service &quot;service&quot;. 0 - service is down, sec - number of seconds spent on connection to the service. If ip is missing 127.0.0.1 is used.  If port number is missing, default service port is used.'),(0,'net.tcp.service[service &lt;,ip&gt; &lt;,port&gt;]','Check if service server is running and accepting connections. 0 - service is down, 1 - service is running. If ip is missing 127.0.0.1 is used. If port number is missing, default service port is used. Example: net.tcp.service[ftp,,45].'),(0,'perf_counter[counter, interval]','Value of any performance counter, where \"counter\" parameter is the counter path and \"interval\" parameter is a number of last seconds, for which the agent returns an average value.'),(0,'proc.mem[&lt;name&gt; &lt;,user&gt; &lt;,mode&gt; &lt;,cmdline&gt;]','Memory used by process with name name running under user user. Memory used by processes. Process name, user and mode is optional. If name or user is missing all processes will be calculated. If mode is missing sum is used. Example: proc.mem[,root]'),(0,'proc.num[&lt;name&gt; &lt;,user&gt; &lt;,state&gt; &lt;,cmdline&gt;]','Number of processes with name name running under user user having state state. Process name, user and state are optional. Examples: proc.num[,mysql]; proc.num[apache2,www-data]; proc.num[,oracle,sleep,oracleZABBIX]'),(0,'proc_info[&lt;process&gt;,&lt;attribute&gt;,&lt;type&gt;]','Different information about specific process(es)'),(0,'service_state[service]','State of service. 0 - running, 1 - paused, 2 - start pending, 3 - pause pending, 4 - continue pending, 5 - stop pending, 6 - stopped, 7 - unknown, 255 - no such service'),(0,'system.boottime','Timestamp of system boot.'),(0,'system.cpu.intr','Device interrupts.'),(0,'system.cpu.load[&lt;cpu&gt; &lt;,mode&gt;]','CPU(s) load. Processor load. The cpu and mode are optional. If cpu is missing all is used. If mode is missing avg1 is used. Note that this is not percentage.'),(0,'system.cpu.num','Number of available proccessors.'),(0,'system.cpu.switches','Context switches.'),(0,'system.cpu.util[&lt;cpu&gt; &lt;,type&gt; &lt;,mode&gt;]','CPU(s) utilisation. Processor load in percents. The cpu, type and mode are optional. If cpu is missing all is used.  If type is missing user is used. If mode is missing avg1 is used.'),(0,'system.hostname[&lt;type&gt;]','Returns hostname (or NetBIOS name (by default) on Windows). String value. Example of returned value: www.zabbix.com'),(0,'system.localtime','System local time. Time in seconds.'),(0,'system.run[command,&lt;mode&gt]','Run specified command on the host.'),(0,'system.stat[resource &lt;,type&gt;]','Virtual memory statistics.'),(0,'system.swap.in[&lt;swap&gt; &lt;,type&gt;]','Swap in. If type is count - swapins is returned. If type is pages - pages swapped in is returned. If swap is missing all is used.'),(0,'system.swap.out[&lt;swap&gt; &lt;,type&gt;]','Swap out. If type is count - swapouts is returned. If type is pages - pages swapped in is returned. If swap is missing all is used.'),(0,'system.swap.size[&lt;swap&gt; &lt;,mode&gt;]','Swap space. Number of bytes. If swap is missing all is used. If mode is missing free is used.'),(0,'system.uname','Returns detailed host information. String value'),(0,'system.uptime','System uptime in seconds.'),(0,'system.users.num','Number of users connected. Command who is used on agent side.'),(0,'vfs.dev.read[device &lt;,type&gt; &lt;,mode&gt;]','Device read statistics.'),(0,'vfs.dev.write[device &lt;,type&gt; &lt;,mode&gt;]','Device write statistics.'),(0,'vfs.file.cksum[file]','Calculate check sum of a given file. Check sum of the file calculate by standard algorithm used by UNIX utility cksum. Example: vfs.file.cksum[/etc/passwd]'),(0,'vfs.file.exists[file]','Check file existence. 0 - file does not exist, 1 - file exists'),(0,'vfs.file.md5sum[file]','Calculate MD5 check sum of a given file. String MD5 hash of the file. Can be used for files less than 64MB, unsupported otherwise. Example: vfs.file.md5sum[/etc/zabbix/zabbix_agentd.conf]'),(0,'vfs.file.regexp[file,regexp]','Find string in a file. Matched string'),(0,'vfs.file.regmatch[file,regexp]','Find string in a file. 0 - expression not found, 1 - found'),(0,'vfs.file.size[file]','Size of a given file. Size in bytes. File must have read permissions for user zabbix. Example: vfs.file.size[/var/log/syslog]'),(0,'vfs.file.time[file &lt;,mode&gt;]','File time information. Number of seconds.	The mode is optional. If mode is missing modify is used.'),(0,'vfs.fs.inode[fs &lt;,mode&gt;]','Number of inodes for a given volume. If mode is missing total is used.'),(0,'vfs.fs.size[fs &lt;,mode&gt;]','Calculate disk space for a given volume. Disk space in KB. If mode is missing total is used.  In case of mounted volume, unused disk space for local file system is returned. Example: vfs.fs.size[/tmp,free].'),(0,'vm.memory.size[&lt;mode&gt;]','Amount of memory size in bytes. If mode is missing total is used.'),(0,'web.page.get[host,&lt;path&gt;,&lt;port&gt;]','Get content of WEB page. Default path is /'),(0,'web.page.perf[host,&lt;path&gt;,&lt;port&gt;]','Get timing of loading full WEB page. Default path is /'),(0,'web.page.regexp[host,&lt;path&gt;,&lt;port&gt;,&lt;regexp&gt;,&lt;length&gt;]','Get first occurence of regexp in WEB page. Default path is /'),(3,'ftp&lt;,port&gt;','Checks if FTP server is running and accepting connections. 0 - FTP server is down. 1 - FTP server is running.'),(3,'ftp_perf&lt;,port&gt;','Checks if FTP server is running and accepting connections. 0 - FTP server is down. Otherwise, number of seconds spent connecting to FTP server.'),(3,'http&lt;,port&gt;','Checks if HTTP (WEB) server is running and accepting connections. 0 - HTTP server is down. 1 - HTTP server is running.'),(3,'http_perf&lt;,port&gt;','Checks if HTTP (WEB) server is running and accepting connections. 0 - HTTP server is down. Otherwise, number of seconds spent connecting to HTTP server.'),(3,'icmpping[&lt;ip&gt;,&lt;count&gt;,&lt;interval&gt;,&lt;size&gt;,&lt;timeout&gt;]','Checks if server is accessible by ICMP ping. 0 - ICMP ping fails. 1 - ICMP ping successful. One of zabbix_server processes performs ICMP pings once per PingerFrequency seconds.'),(3,'icmppingloss[&lt;ip&gt;,&lt;count&gt;,&lt;interval&gt;,&lt;size&gt;,&lt;timeout&gt;]','Returns percentage of lost ICMP ping packets.'),(3,'icmppingsec[&lt;ip&gt;,&lt;count&gt;,&lt;interval&gt;,&lt;size&gt;,&lt;timeout&gt;,&lt;type&gt;]','Returns ICMP ping response time in seconds. Example: 0.02'),(3,'imap&lt;,port&gt;','Checks if IMAP server is running and accepting connections. 0 - IMAP server is down. 1 - IMAP server is running.'),(3,'imap_perf&lt;,port&gt;','Checks if IMAP server is running and accepting connections. 0 - IMAP server is down. Otherwise, number of seconds spent connecting to IMAP server.'),(3,'ldap&lt;,port&gt;','Checks if LDAP server is running and accepting connections. 0 - LDAP server is down. 1 - LDAP server is running.'),(3,'ldap_perf&lt;,port&gt;','Checks if LDAP server is running and accepting connections. 0 - LDAP server is down. Otherwise, number of seconds spent connecting to LDAP server.'),(3,'nntp&lt;,port&gt;','Checks if NNTP server is running and accepting connections. 0 - NNTP server is down. 1 - NNTP server is running.'),(3,'nntp_perf&lt;,port&gt;','Checks if NNTP server is running and accepting connections. 0 - NNTP server is down. Otherwise, number of seconds spent connecting to NNTP server.'),(3,'ntp&lt;,port&gt;','Checks if NTP server is running and accepting connections. 0 - NTP server is down. 1 - NTP server is running.'),(3,'ntp_perf&lt;,port&gt;','Checks if NTP server is running and accepting connections. 0 - NTP server is down. Otherwise, number of seconds spent connecting to NTP server.'),(3,'pop&lt;,port&gt;','Checks if POP server is running and accepting connections. 0 - POP server is down. 1 - POP server is running.'),(3,'pop_perf&lt;,port&gt;','Checks if POP server is running and accepting connections. 0 - POP server is down. Otherwise, number of milliseconds spent connecting to POP server.'),(3,'smtp&lt;,port&gt;','Checks if SMTP server is running and accepting connections. 0 - SMTP server is down. 1 - SMTP server is running.'),(3,'smtp_perf&lt;,port&gt;','Checks if SMTP server is running and accepting connections. 0 - SMTP server is down. Otherwise, number of seconds spent connecting to SMTP server.'),(3,'ssh&lt;,port&gt;','Checks if SSH server is running and accepting connections. 0 - SSH server is down. 1 - SSH server is running.'),(3,'ssh_perf&lt;,port&gt;','Checks if SSH server is running and accepting connections. 0 - SSH server is down. Otherwise, number of seconds spent connecting to SSH server.'),(3,'tcp,port','Checks if TCP service is running and accepting connections on port. 0 - the service on the port is down. 1 - the service is running.'),(3,'tcp_perf,port','Checks if TCP service is running and accepting connections on port. 0 - the service on the port is down. Otherwise, number of seconds spent connecting to TCP service.'),(5,'zabbix[boottime]','Startup time of Zabbix server, Unix timestamp.'),(5,'zabbix[history]','Number of values stored in table HISTORY.'),(5,'zabbix[history_log]','Number of values stored in table HISTORY_LOG.'),(5,'zabbix[history_str]','Number of values stored in table HISTORY_STR.'),(5,'zabbix[history_text]','Number of values stored in table HISTORY_TEXT.'),(5,'zabbix[history_uint]','Number of values stored in table HISTORY_UINT.'),(5,'zabbix[items]','Number of items in Zabbix database.'),(5,'zabbix[items_unsupported]','Number of unsupported items in Zabbix database.'),(5,'zabbix[log]','Stores warning and error messages generated by Zabbix server.'),(5,'zabbix[process,&lt;type&gt;,&lt;num&gt;,&lt;state&gt;]','Time a particular Zabbix process or a group of processes (identified by &lt;type&gt; and &lt;num&gt;) spent in &lt;state&gt; in percentage.'),(5,'zabbix[proxy,&lt;name&gt;,&lt;param&gt;]','Time of proxy last access. Name - proxy name. Param - lastaccess. Unix timestamp.'),(5,'zabbix[queue&lt;,from&gt;&lt;,to&gt;]','Number of items in the queue which are delayed by from to to seconds, inclusive.'),(5,'zabbix[rcache,&lt;cache&gt;,&lt;mode&gt;]','Configuration cache statistics. Cache - buffer (modes: pfree, total, used, free).'),(5,'zabbix[trends]','Number of values stored in table TRENDS.'),(5,'zabbix[trends_uint]','Number of values stored in table TRENDS_UINT.'),(5,'zabbix[triggers]','Number of triggers in Zabbix database.'),(5,'zabbix[uptime]','Uptime of Zabbix server process in seconds.'),(5,'zabbix[wcache,&lt;cache&gt;,&lt;mode&gt;]','Data cache statistics. Cache - one of values (modes: all, float, uint, str, log, text), history (modes: pfree, total, used, free), trend (modes: pfree, total, used, free), text (modes: pfree, total, used, free).'),(7,'agent.ping','Check the agent usability. Always return 1. Can be used as a TCP ping.'),(7,'agent.version','Version of zabbix_agent(d) running on monitored host. String value. Example of returned value: 1.1'),(7,'eventlog[logtype,&lt;pattern&gt;,&lt;severity&gt;,&lt;source&gt;,&lt;eventid&gt;,&lt;maxlines&gt;]','Monitoring of Windows event logs. pattern, severity, eventid - regular expressions'),(7,'kernel.maxfiles','Maximum number of opened files supported by OS.'),(7,'kernel.maxproc','Maximum number of processes supported by OS.'),(7,'log[file,&lt;pattern&gt;,&lt;encoding&gt;,&lt;maxlines&gt;]','Monitoring of log file. pattern - regular expression'),(7,'logrt[file_format,&lt;pattern&gt;,&lt;encoding&gt;,&lt;maxlines&gt;]','Monitoring of log file with rotation. fileformat - [path][regexp], pattern - regular expression'),(7,'net.if.collisions[if]','Out-of-window collision. Collisions count.'),(7,'net.if.in[if &lt;,mode&gt;]','Network interface input statistic. Integer value. If mode is missing bytes is used.'),(7,'net.if.list','List of network interfaces. Text value.'),(7,'net.if.out[if &lt;,mode&gt;]','Network interface output statistic. Integer value. If mode is missing bytes is used.'),(7,'net.if.total[if &lt;,mode&gt;]','Sum of network interface incoming and outgoing statistics. Integer value. Mode - one of bytes (default), packets, errors or dropped'),(7,'net.tcp.dns.query[ip, zone, type]','Performs a query for the record type specified by the parameter type'),(7,'net.tcp.dns[ip, zone]','Checks if DNS service is up. 0 - DNS is down, 1 - DNS is up.'),(7,'net.tcp.listen[port]','Checks if this port is in LISTEN state. 0 - it is not, 1 - it is in LISTEN state.'),(7,'net.tcp.port[&lt;ip&gt;, port]','Check, if it is possible to make TCP connection to the port number. 0 - cannot connect, 1 - can connect. IP address is optional. If ip is missing, 127.0.0.1 is used. Example: net.tcp.port[,80]'),(7,'net.tcp.service.perf[service &lt;,ip&gt; &lt;,port&gt;]','Check performance of service &quot;service&quot;. 0 - service is down, sec - number of seconds spent on connection to the service. If ip is missing 127.0.0.1 is used.  If port number is missing, default service port is used.'),(7,'net.tcp.service[service &lt;,ip&gt; &lt;,port&gt;]','Check if service server is running and accepting connections. 0 - service is down, 1 - service is running. If ip is missing 127.0.0.1 is used. If port number is missing, default service port is used. Example: net.tcp.service[ftp,,45].'),(7,'perf_counter[counter]','Value of any performance counter, where parameter is the counter path.'),(7,'proc.mem[&lt;name&gt; &lt;,user&gt; &lt;,mode&gt; &lt;,cmdline&gt;]','Memory used by process with name name running under user user. Memory used by processes. Process name, user and mode is optional. If name or user is missing all processes will be calculated. If mode is missing sum is used. Example: proc.mem[,root]'),(7,'proc.num[&lt;name&gt; &lt;,user&gt; &lt;,state&gt; &lt;,cmdline&gt;]','Number of processes with name name running under user user having state state. Process name, user and state are optional. Examples: proc.num[,mysql]; proc.num[apache2,www-data]; proc.num[,oracle,sleep,oracleZABBIX]'),(7,'proc_info[&lt;process&gt;,&lt;attribute&gt;,&lt;type&gt;]','Different information about specific process(es)'),(7,'service_state[service]','State of service. 0 - running, 1 - paused, 2 - start pending, 3 - pause pending, 4 - continue pending, 5 - stop pending, 6 - stopped, 7 - unknown, 255 - no such service'),(7,'system.boottime','Timestamp of system boot.'),(7,'system.cpu.intr','Device interrupts.'),(7,'system.cpu.load[&lt;cpu&gt; &lt;,mode&gt;]','CPU(s) load. Processor load. The cpu and mode are optional. If cpu is missing all is used. If mode is missing avg1 is used. Note that this is not percentage.'),(7,'system.cpu.num','Number of available proccessors.'),(7,'system.cpu.switches','Context switches.'),(7,'system.cpu.util[&lt;cpu&gt; &lt;,type&gt; &lt;,mode&gt;]','CPU(s) utilisation. Processor load in percents. The cpu, type and mode are optional. If cpu is missing all is used.  If type is missing user is used. If mode is missing avg1 is used.'),(7,'system.hostname[&lt;type&gt;]','Returns hostname (or NetBIOS name (by default) on Windows). String value. Example of returned value: www.zabbix.com'),(7,'system.localtime','System local time. Time in seconds.'),(7,'system.run[command,&lt;mode&gt]','Run specified command on the host.'),(7,'system.stat[resource &lt;,type&gt;]','Virtual memory statistics.'),(7,'system.swap.in[&lt;swap&gt; &lt;,type&gt;]','Swap in. If type is count - swapins is returned. If type is pages - pages swapped in is returned. If swap is missing all is used.'),(7,'system.swap.out[&lt;swap&gt; &lt;,type&gt;]','Swap out. If type is count - swapouts is returned. If type is pages - pages swapped in is returned. If swap is missing all is used.'),(7,'system.swap.size[&lt;swap&gt; &lt;,mode&gt;]','Swap space. Number of bytes. If swap is missing all is used. If mode is missing free is used.'),(7,'system.uname','Returns detailed host information. String value'),(7,'system.uptime','System uptime in seconds.'),(7,'system.users.num','Number of users connected. Command who is used on agent side.'),(7,'vfs.dev.read[device &lt;,type&gt; &lt;,mode&gt;]','Device read statistics.'),(7,'vfs.dev.write[device &lt;,type&gt; &lt;,mode&gt;]','Device write statistics.'),(7,'vfs.file.cksum[file]','Calculate check sum of a given file. Check sum of the file calculate by standard algorithm used by UNIX utility cksum. Example: vfs.file.cksum[/etc/passwd]'),(7,'vfs.file.exists[file]','Check file existence. 0 - file does not exist, 1 - file exists'),(7,'vfs.file.md5sum[file]','Calculate MD5 check sum of a given file. String MD5 hash of the file. Can be used for files less than 64MB, unsupported otherwise. Example: vfs.file.md5sum[/etc/zabbix/zabbix_agentd.conf]'),(7,'vfs.file.regexp[file,regexp]','Find string in a file. Matched string'),(7,'vfs.file.regmatch[file,regexp]','Find string in a file. 0 - expression not found, 1 - found'),(7,'vfs.file.size[file]','Size of a given file. Size in bytes. File must have read permissions for user zabbix. Example: vfs.file.size[/var/log/syslog]'),(7,'vfs.file.time[file&lt;, mode&gt;]','File time information. Number of seconds.	The mode is optional. If mode is missing modify is used.'),(7,'vfs.fs.inode[fs &lt;,mode&gt;]','Number of inodes for a given volume. If mode is missing total is used.'),(7,'vfs.fs.size[fs &lt;,mode&gt;]','Calculate disk space for a given volume. Disk space in KB. If mode is missing total is used.  In case of mounted volume, unused disk space for local file system is returned. Example: vfs.fs.size[/tmp,free].'),(7,'vm.memory.size[&lt;mode&gt;]','Amount of memory size in bytes. If mode is missing total is used.'),(7,'web.page.get[host,&lt;path&gt;,&lt;port&gt;]','Get content of WEB page. Default path is /'),(7,'web.page.perf[host,&lt;path&gt;,&lt;port&gt;]','Get timing of loading full WEB page. Default path is /'),(7,'web.page.regexp[host,&lt;path&gt;,&lt;port&gt;,&lt;regexp&gt;,&lt;length&gt;]','Get first occurence of regexp in WEB page. Default path is /'),(8,'grpfunc[&lt;Group&gt;,&lt;Key&gt;,&lt;func&gt;,&lt;param&gt;]','Aggregate checks do not require any agent running on a host being monitored. Zabbix server collects aggregate information by doing direct database queries. See Zabbix Manual.');
/*!40000 ALTER TABLE `help_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `history`
--

DROP TABLE IF EXISTS `history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `history` (
  `itemid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `clock` int(11) NOT NULL DEFAULT '0',
  `value` double(16,4) NOT NULL DEFAULT '0.0000',
  KEY `history_1` (`itemid`,`clock`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `history`
--

LOCK TABLES `history` WRITE;
/*!40000 ALTER TABLE `history` DISABLE KEYS */;
INSERT INTO `history` VALUES (22163,1404820702,64986.0000),(22164,1404820702,0.1635),(22166,1404820702,64986.0000),(22163,1404820762,190555.0000),(22164,1404820762,0.0541),(22166,1404820762,190555.0000),(22163,1404820823,98063.0000),(22164,1404820823,0.1084),(22166,1404820823,98063.0000),(22163,1404820882,119068.0000),(22164,1404820882,0.0867),(22166,1404820882,119068.0000),(22163,1404820942,257358.0000),(22164,1404820942,0.0401),(22166,1404820942,257358.0000),(22163,1404821002,141367.0000),(22164,1404821002,0.0752),(22166,1404821002,141367.0000),(22163,1404821062,311092.0000),(22164,1404821062,0.0332),(22166,1404821062,311092.0000),(22163,1404821122,195553.0000),(22164,1404821122,0.0528),(22166,1404821122,195553.0000),(22163,1404821182,215596.0000),(22164,1404821182,0.0479),(22166,1404821182,215596.0000),(22163,1404821243,0.0000),(22164,1404821243,0.0000),(22166,1404821243,0.0000),(22163,1404821303,0.0000),(22164,1404821303,0.0000),(22166,1404821303,0.0000),(22163,1404821366,3279.0000),(22164,1404821366,3.5277),(22166,1404821366,3279.0000),(22163,1404821423,61346.0000),(22164,1404821423,0.1732),(22166,1404821423,61346.0000),(22163,1404821483,43786.0000),(22164,1404821483,0.2356),(22166,1404821483,43786.0000),(22163,1404821543,127860.0000),(22164,1404821543,0.0831),(22166,1404821543,127860.0000),(22163,1404821604,170087.0000),(22164,1404821604,0.0607),(22166,1404821604,170087.0000),(22163,1404821663,122409.0000),(22164,1404821663,0.0843),(22166,1404821663,122409.0000),(22163,1404821723,222301.0000),(22164,1404821723,0.0478),(22166,1404821723,222301.0000),(22163,1404821783,201602.0000),(22164,1404821783,0.0512),(22166,1404821783,201602.0000),(22163,1404821843,188794.0000),(22164,1404821843,0.0547),(22166,1404821843,188794.0000),(22163,1404842582,358303.0000),(22164,1404842582,0.0288),(22166,1404842582,358303.0000),(22163,1404842642,518442.0000),(22164,1404842642,0.0199),(22166,1404842642,518442.0000),(22163,1404842702,425460.0000),(22164,1404842702,0.0242),(22166,1404842702,425460.0000),(22163,1404842762,517609.0000),(22164,1404842762,0.0199),(22166,1404842762,517609.0000),(22169,1404843062,537036.0000),(22170,1404843062,0.0192),(22172,1404843062,537036.0000),(22169,1404843123,543200.0000),(22170,1404843123,0.0190),(22172,1404843123,543200.0000),(22169,1404843182,386737.0000),(22170,1404843182,0.0267),(22172,1404843182,386737.0000),(22169,1404843242,136304.0000),(22170,1404843242,0.0757),(22172,1404843242,136304.0000),(22169,1404843302,523625.0000),(22170,1404843302,0.0197),(22172,1404843302,523625.0000),(22169,1404843362,575853.0000),(22170,1404843362,0.0179),(22172,1404843362,575853.0000);
/*!40000 ALTER TABLE `history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `history_log`
--

DROP TABLE IF EXISTS `history_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `history_log` (
  `id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `itemid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `clock` int(11) NOT NULL DEFAULT '0',
  `timestamp` int(11) NOT NULL DEFAULT '0',
  `source` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `severity` int(11) NOT NULL DEFAULT '0',
  `value` text COLLATE utf8_bin NOT NULL,
  `logeventid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `history_log_2` (`itemid`,`id`),
  KEY `history_log_1` (`itemid`,`clock`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `history_log`
--

LOCK TABLES `history_log` WRITE;
/*!40000 ALTER TABLE `history_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `history_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `history_str`
--

DROP TABLE IF EXISTS `history_str`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `history_str` (
  `itemid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `clock` int(11) NOT NULL DEFAULT '0',
  `value` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  KEY `history_str_1` (`itemid`,`clock`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `history_str`
--

LOCK TABLES `history_str` WRITE;
/*!40000 ALTER TABLE `history_str` DISABLE KEYS */;
/*!40000 ALTER TABLE `history_str` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `history_str_sync`
--

DROP TABLE IF EXISTS `history_str_sync`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `history_str_sync` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nodeid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `itemid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `clock` int(11) NOT NULL DEFAULT '0',
  `value` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `history_str_sync_1` (`nodeid`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `history_str_sync`
--

LOCK TABLES `history_str_sync` WRITE;
/*!40000 ALTER TABLE `history_str_sync` DISABLE KEYS */;
/*!40000 ALTER TABLE `history_str_sync` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `history_sync`
--

DROP TABLE IF EXISTS `history_sync`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `history_sync` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nodeid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `itemid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `clock` int(11) NOT NULL DEFAULT '0',
  `value` double(16,4) NOT NULL DEFAULT '0.0000',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `history_sync_1` (`nodeid`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `history_sync`
--

LOCK TABLES `history_sync` WRITE;
/*!40000 ALTER TABLE `history_sync` DISABLE KEYS */;
/*!40000 ALTER TABLE `history_sync` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `history_text`
--

DROP TABLE IF EXISTS `history_text`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `history_text` (
  `id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `itemid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `clock` int(11) NOT NULL DEFAULT '0',
  `value` text COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `history_text_2` (`itemid`,`id`),
  KEY `history_text_1` (`itemid`,`clock`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `history_text`
--

LOCK TABLES `history_text` WRITE;
/*!40000 ALTER TABLE `history_text` DISABLE KEYS */;
/*!40000 ALTER TABLE `history_text` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `history_uint`
--

DROP TABLE IF EXISTS `history_uint`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `history_uint` (
  `itemid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `clock` int(11) NOT NULL DEFAULT '0',
  `value` bigint(20) unsigned NOT NULL DEFAULT '0',
  KEY `history_uint_1` (`itemid`,`clock`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `history_uint`
--

LOCK TABLES `history_uint` WRITE;
/*!40000 ALTER TABLE `history_uint` DISABLE KEYS */;
INSERT INTO `history_uint` VALUES (22162,1404814372,0),(22162,1404814402,0),(22162,1404814432,0),(22162,1404814462,0),(22162,1404814493,0),(22162,1404814522,0),(22162,1404814552,0),(22162,1404814582,0),(22162,1404814612,0),(22162,1404814642,0),(22162,1404814672,0),(22162,1404814702,0),(22162,1404814732,0),(22162,1404814762,0),(22162,1404814792,0),(22162,1404814822,0),(22162,1404814852,0),(22162,1404814882,0),(22162,1404814912,0),(22162,1404814942,0),(22162,1404814972,0),(22162,1404815002,0),(22162,1404815032,0),(22162,1404815062,0),(22162,1404815092,0),(22162,1404815122,0),(22162,1404815152,0),(22162,1404815182,0),(22162,1404815212,0),(22162,1404815242,0),(22162,1404815272,0),(22162,1404815302,0),(22162,1404815332,0),(22162,1404815362,0),(22162,1404815392,0),(22162,1404815422,0),(22162,1404815452,0),(22162,1404815482,0),(22162,1404815512,0),(22162,1404815542,0),(22162,1404815572,0),(22162,1404815602,0),(22162,1404815632,0),(22162,1404815662,0),(22162,1404815693,0),(22162,1404815722,0),(22162,1404815752,0),(22162,1404815782,0),(22162,1404815812,0),(22162,1404815842,0),(22162,1404815872,0),(22162,1404815902,0),(22162,1404815932,0),(22162,1404815962,0),(22162,1404815992,0),(22162,1404816022,0),(22162,1404816052,0),(22162,1404816082,0),(22162,1404816112,0),(22162,1404816142,0),(22162,1404816172,0),(22162,1404816202,0),(22162,1404816232,0),(22162,1404816262,0),(22162,1404816292,0),(22162,1404816322,0),(22162,1404816352,0),(22162,1404816382,0),(22162,1404816412,0),(22162,1404816442,0),(22162,1404816472,0),(22162,1404816502,0),(22162,1404816532,0),(22162,1404816562,0),(22162,1404816592,0),(22162,1404816622,0),(22162,1404816652,0),(22162,1404816682,0),(22162,1404816712,0),(22162,1404816742,0),(22162,1404816772,0),(22162,1404816802,0),(22162,1404816832,0),(22162,1404816862,0),(22162,1404816892,0),(22162,1404816922,0),(22162,1404816952,0),(22162,1404816982,0),(22162,1404817012,0),(22162,1404817042,0),(22162,1404817072,0),(22162,1404817102,0),(22162,1404817132,0),(22162,1404817162,0),(22162,1404817192,1),(22162,1404817222,1),(22162,1404817252,1),(22162,1404817282,1),(22162,1404817312,1),(22162,1404817342,1),(22162,1404817372,1),(22162,1404817402,1),(22162,1404817432,1),(22162,1404817462,1),(22162,1404817492,1),(22162,1404817522,1),(22162,1404817552,1),(22162,1404817582,1),(22162,1404817612,1),(22162,1404817642,1),(22162,1404817672,1),(22162,1404817702,1),(22162,1404817732,1),(22162,1404817762,1),(22162,1404817792,1),(22162,1404817822,1),(22162,1404817852,1),(22162,1404817882,1),(22162,1404817912,1),(22162,1404817942,1),(22162,1404817972,1),(22162,1404818002,1),(22162,1404818032,1),(22162,1404818062,1),(22162,1404818092,1),(22162,1404818122,1),(22162,1404818152,1),(22162,1404818182,1),(22162,1404818212,1),(22162,1404818242,1),(22162,1404818272,1),(22162,1404818302,1),(22162,1404818332,1),(22162,1404818362,1),(22162,1404818392,1),(22162,1404818422,1),(22162,1404818452,1),(22162,1404818482,1),(22162,1404818512,1),(22162,1404818542,1),(22162,1404818572,1),(22162,1404818602,1),(22162,1404818632,1),(22162,1404818662,1),(22162,1404818692,1),(22162,1404818722,1),(22162,1404818752,1),(22162,1404818782,1),(22162,1404818812,1),(22162,1404818842,1),(22162,1404818872,1),(22162,1404818902,1),(22162,1404818932,1),(22162,1404818962,1),(22162,1404818992,1),(22162,1404819022,1),(22162,1404819052,1),(22162,1404819082,1),(22162,1404819112,1),(22162,1404819142,1),(22162,1404819172,1),(22162,1404819202,1),(22162,1404819232,1),(22162,1404819262,1),(22162,1404819292,1),(22162,1404819322,1),(22162,1404819352,1),(22162,1404819382,1),(22162,1404819412,1),(22162,1404819442,1),(22162,1404819472,1),(22162,1404819502,1),(22162,1404819532,1),(22162,1404819562,1),(22162,1404819592,1),(22162,1404819622,1),(22162,1404819652,1),(22162,1404819682,1),(22162,1404819712,1),(22162,1404819742,1),(22162,1404819772,1),(22162,1404819802,1),(22162,1404819832,1),(22162,1404819863,1),(22162,1404819892,1),(22162,1404819922,1),(22162,1404819952,1),(22162,1404819982,1),(22162,1404820012,1),(22162,1404820042,1),(22162,1404820072,1),(22162,1404820102,1),(22162,1404820132,1),(22162,1404820162,1),(22162,1404820192,1),(22162,1404820222,1),(22162,1404820252,1),(22162,1404820282,1),(22162,1404820312,1),(22162,1404820342,1),(22162,1404820372,1),(22162,1404820402,1),(22162,1404820432,1),(22162,1404820463,1),(22162,1404820492,1),(22162,1404820522,1),(22162,1404820552,1),(22162,1404820582,1),(22162,1404820612,1),(22162,1404820642,1),(22162,1404820672,1),(22162,1404820702,1),(22165,1404820702,200),(22167,1404820702,0),(22162,1404820732,1),(22162,1404820762,1),(22165,1404820762,200),(22167,1404820762,0),(22162,1404820792,1),(22162,1404820822,1),(22165,1404820823,200),(22167,1404820823,0),(22162,1404820852,1),(22162,1404820882,1),(22165,1404820882,200),(22167,1404820882,0),(22162,1404820912,1),(22162,1404820942,1),(22165,1404820942,200),(22167,1404820942,0),(22162,1404820973,1),(22162,1404821002,1),(22165,1404821002,200),(22167,1404821002,0),(22162,1404821032,1),(22162,1404821062,1),(22165,1404821062,200),(22167,1404821062,0),(22162,1404821092,1),(22162,1404821122,1),(22165,1404821122,200),(22167,1404821122,0),(22162,1404821152,1),(22162,1404821182,1),(22165,1404821182,200),(22167,1404821182,0),(22162,1404821212,1),(22162,1404821242,1),(22165,1404821243,0),(22167,1404821243,1),(22162,1404821272,1),(22162,1404821302,1),(22165,1404821303,0),(22167,1404821303,1),(22162,1404821332,1),(22162,1404821362,1),(22165,1404821366,200),(22167,1404821366,0),(22162,1404821392,1),(22162,1404821422,1),(22165,1404821423,200),(22167,1404821423,0),(22162,1404821452,1),(22162,1404821482,1),(22165,1404821483,200),(22167,1404821483,0),(22162,1404821512,1),(22162,1404821542,1),(22165,1404821543,200),(22167,1404821543,0),(22162,1404821572,1),(22162,1404821602,1),(22165,1404821604,200),(22167,1404821604,0),(22162,1404821632,1),(22162,1404821662,1),(22165,1404821663,200),(22167,1404821663,0),(22162,1404821692,1),(22162,1404821722,1),(22165,1404821723,200),(22167,1404821723,0),(22162,1404821752,1),(22162,1404821782,1),(22165,1404821783,200),(22167,1404821783,0),(22162,1404821812,1),(22162,1404821842,1),(22165,1404821843,200),(22167,1404821843,0),(22162,1404821872,1),(22165,1404842582,200),(22167,1404842582,0),(22162,1404842602,1),(22162,1404842632,1),(22165,1404842642,200),(22167,1404842642,0),(22162,1404842662,1),(22162,1404842692,1),(22165,1404842702,200),(22167,1404842702,0),(22162,1404842722,1),(22162,1404842752,1),(22165,1404842762,200),(22167,1404842762,0),(22162,1404842782,1),(22168,1404842938,1),(22168,1404842968,1),(22168,1404842998,1),(22168,1404843028,1),(22168,1404843058,1),(22171,1404843062,200),(22173,1404843062,0),(22168,1404843088,1),(22168,1404843118,1),(22171,1404843123,200),(22173,1404843123,0),(22168,1404843148,1),(22168,1404843178,1),(22171,1404843182,200),(22173,1404843182,0),(22168,1404843208,1),(22168,1404843238,1),(22171,1404843242,200),(22173,1404843242,0),(22168,1404843268,1),(22168,1404843298,1),(22171,1404843302,200),(22173,1404843302,0),(22168,1404843328,1),(22168,1404843358,1),(22171,1404843362,200),(22173,1404843362,0);
/*!40000 ALTER TABLE `history_uint` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `history_uint_sync`
--

DROP TABLE IF EXISTS `history_uint_sync`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `history_uint_sync` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nodeid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `itemid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `clock` int(11) NOT NULL DEFAULT '0',
  `value` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `history_uint_sync_1` (`nodeid`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `history_uint_sync`
--

LOCK TABLES `history_uint_sync` WRITE;
/*!40000 ALTER TABLE `history_uint_sync` DISABLE KEYS */;
/*!40000 ALTER TABLE `history_uint_sync` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hostmacro`
--

DROP TABLE IF EXISTS `hostmacro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hostmacro` (
  `hostmacroid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `hostid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `macro` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `value` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`hostmacroid`),
  KEY `hostmacro_1` (`hostid`,`macro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hostmacro`
--

LOCK TABLES `hostmacro` WRITE;
/*!40000 ALTER TABLE `hostmacro` DISABLE KEYS */;
/*!40000 ALTER TABLE `hostmacro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hosts`
--

DROP TABLE IF EXISTS `hosts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hosts` (
  `hostid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `proxy_hostid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `host` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `dns` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `useip` int(11) NOT NULL DEFAULT '1',
  `ip` varchar(39) COLLATE utf8_bin NOT NULL DEFAULT '127.0.0.1',
  `port` int(11) NOT NULL DEFAULT '10050',
  `status` int(11) NOT NULL DEFAULT '0',
  `disable_until` int(11) NOT NULL DEFAULT '0',
  `error` varchar(128) COLLATE utf8_bin NOT NULL DEFAULT '',
  `available` int(11) NOT NULL DEFAULT '0',
  `errors_from` int(11) NOT NULL DEFAULT '0',
  `lastaccess` int(11) NOT NULL DEFAULT '0',
  `inbytes` bigint(20) unsigned NOT NULL DEFAULT '0',
  `outbytes` bigint(20) unsigned NOT NULL DEFAULT '0',
  `useipmi` int(11) NOT NULL DEFAULT '0',
  `ipmi_port` int(11) NOT NULL DEFAULT '623',
  `ipmi_authtype` int(11) NOT NULL DEFAULT '0',
  `ipmi_privilege` int(11) NOT NULL DEFAULT '2',
  `ipmi_username` varchar(16) COLLATE utf8_bin NOT NULL DEFAULT '',
  `ipmi_password` varchar(20) COLLATE utf8_bin NOT NULL DEFAULT '',
  `ipmi_disable_until` int(11) NOT NULL DEFAULT '0',
  `ipmi_available` int(11) NOT NULL DEFAULT '0',
  `snmp_disable_until` int(11) NOT NULL DEFAULT '0',
  `snmp_available` int(11) NOT NULL DEFAULT '0',
  `maintenanceid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `maintenance_status` int(11) NOT NULL DEFAULT '0',
  `maintenance_type` int(11) NOT NULL DEFAULT '0',
  `maintenance_from` int(11) NOT NULL DEFAULT '0',
  `ipmi_ip` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '127.0.0.1',
  `ipmi_errors_from` int(11) NOT NULL DEFAULT '0',
  `snmp_errors_from` int(11) NOT NULL DEFAULT '0',
  `ipmi_error` varchar(128) COLLATE utf8_bin NOT NULL DEFAULT '',
  `snmp_error` varchar(128) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`hostid`),
  KEY `hosts_1` (`host`),
  KEY `hosts_2` (`status`),
  KEY `hosts_3` (`proxy_hostid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hosts`
--

LOCK TABLES `hosts` WRITE;
/*!40000 ALTER TABLE `hosts` DISABLE KEYS */;
INSERT INTO `hosts` VALUES (10001,0,'Template_Linux','',0,'',10050,3,0,'',0,0,0,0,0,0,623,0,2,'','',0,0,0,0,0,0,0,0,'',0,0,'',''),(10002,0,'Template_Windows','',0,'',10050,3,0,'',0,0,0,0,0,0,623,0,2,'','',0,0,0,0,0,0,0,0,'',0,0,'',''),(10003,0,'Template_App_MySQL','',0,'',10050,3,0,'',0,0,0,0,0,0,623,0,2,'','',0,0,0,0,0,0,0,0,'',0,0,'',''),(10004,0,'Template_Standalone','',0,'',10050,3,0,'',0,0,0,0,0,0,623,0,2,'','',0,0,0,0,0,0,0,0,'',0,0,'',''),(10007,0,'Template_SNMPv2_Device','',0,'',10050,3,0,'',0,0,0,0,0,0,623,0,2,'','',0,0,0,0,0,0,0,0,'',0,0,'',''),(10008,0,'Template_FreeBSD','',0,'',10050,3,0,'',0,0,0,0,0,0,623,0,2,'','',0,0,0,0,0,0,0,0,'',0,0,'',''),(10009,0,'Template_OpenBSD','',0,'',10050,3,0,'',0,0,0,0,0,0,623,0,2,'','',0,0,0,0,0,0,0,0,'',0,0,'',''),(10010,0,'Template_Tru64','',0,'',10050,3,0,'',0,0,0,0,0,0,623,0,2,'','',0,0,0,0,0,0,0,0,'',0,0,'',''),(10011,0,'Template_Netware','',0,'',10050,3,0,'',0,0,0,0,0,0,623,0,2,'','',0,0,0,0,0,0,0,0,'',0,0,'',''),(10012,0,'Template_AIX','',0,'',10050,3,0,'',0,0,0,0,0,0,623,0,2,'','',0,0,0,0,0,0,0,0,'',0,0,'',''),(10013,0,'Template_HPUX','',0,'',10050,3,0,'',0,0,0,0,0,0,623,0,2,'','',0,0,0,0,0,0,0,0,'',0,0,'',''),(10014,0,'Template_MacOS_X','',0,'',10050,3,0,'',0,0,0,0,0,0,623,0,2,'','',0,0,0,0,0,0,0,0,'',0,0,'',''),(10015,0,'Template_Solaris','',0,'',10050,3,0,'',0,0,0,0,0,0,623,0,2,'','',0,0,0,0,0,0,0,0,'',0,0,'',''),(10016,0,'Template_SNMPv1_Device','',0,'',10050,3,0,'',0,0,0,0,0,0,623,0,2,'','',0,0,0,0,0,0,0,0,'',0,0,'',''),(10017,0,'Zabbix server','',1,'127.0.0.1',10050,1,0,'',0,0,0,0,0,0,623,0,2,'','',0,0,0,0,0,0,0,0,'',0,0,'',''),(10018,0,'Template_Cisco_PIX_525','',0,'',10050,3,0,'',0,0,0,0,0,0,623,0,2,'','',0,0,0,0,0,0,0,0,'',0,0,'',''),(10019,0,'Template_Dell_PowerConnect_6248','',0,'',10050,3,0,'',0,0,0,0,0,0,623,0,2,'','',0,0,0,0,0,0,0,0,'',0,0,'',''),(10020,0,'Template_APC_Battery','',0,'',10050,3,0,'',0,0,0,0,0,0,623,0,2,'','',0,0,0,0,0,0,0,0,'',0,0,'',''),(10021,0,'Template_HP_InsightManager','',0,'',10050,3,0,'',0,0,0,0,0,0,623,0,2,'','',0,0,0,0,0,0,0,0,'',0,0,'',''),(10022,0,'Template_Dell_OpenManage','',0,'',10050,3,0,'',0,0,0,0,0,0,623,0,2,'','',0,0,0,0,0,0,0,0,'',0,0,'',''),(10023,0,'Template_Cisco_PIX','',0,'',10050,3,0,'',0,0,0,0,0,0,623,0,2,'','',0,0,0,0,0,0,0,0,'',0,0,'',''),(10024,0,'Template_Dell_PowerEdge','',0,'',10050,3,0,'',0,0,0,0,0,0,623,0,2,'','',0,0,0,0,0,0,0,0,'',0,0,'',''),(10025,0,'Template_3COM_3824','',0,'',10050,3,0,'',0,0,0,0,0,0,623,0,2,'','',0,0,0,0,0,0,0,0,'',0,0,'',''),(10026,0,'Template_3COM_4400','',0,'',10050,3,0,'',0,0,0,0,0,0,623,0,2,'','',0,0,0,0,0,0,0,0,'',0,0,'',''),(10027,0,'Template_APC_Automatic_Transfer_Switch','',0,'',10050,3,0,'',0,0,0,0,0,0,623,0,2,'','',0,0,0,0,0,0,0,0,'',0,0,'',''),(10028,0,'Template_Cisco_837','',0,'',10050,3,0,'',0,0,0,0,0,0,623,0,2,'','',0,0,0,0,0,0,0,0,'',0,0,'',''),(10029,0,'Template_Cisco_877','',0,'',10050,3,0,'',0,0,0,0,0,0,623,0,2,'','',0,0,0,0,0,0,0,0,'',0,0,'',''),(10030,0,'Template_Cisco_2960','',0,'',10050,3,0,'',0,0,0,0,0,0,623,0,2,'','',0,0,0,0,0,0,0,0,'',0,0,'',''),(10031,0,'Template_C3750-48TS','',0,'',10050,3,0,'',0,0,0,0,0,0,623,0,2,'','',0,0,0,0,0,0,0,0,'',0,0,'',''),(10032,0,'Template_Cisco_PIX515E','',0,'',10050,3,0,'',0,0,0,0,0,0,623,0,2,'','',0,0,0,0,0,0,0,0,'',0,0,'',''),(10033,0,'Template_Dell_PowerConnect_5224','',0,'',10050,3,0,'',0,0,0,0,0,0,623,0,2,'','',0,0,0,0,0,0,0,0,'',0,0,'',''),(10034,0,'Template_Dell_PowerConnect_5324','',0,'',10050,3,0,'',0,0,0,0,0,0,623,0,2,'','',0,0,0,0,0,0,0,0,'',0,0,'',''),(10035,0,'Template_Hibernate','',0,'',10050,3,0,'',0,0,0,0,0,0,623,0,2,'','',0,0,0,0,0,0,0,0,'',0,0,'',''),(10036,0,'Template_HP_ColorLaserJet','',0,'',10050,3,0,'',0,0,0,0,0,0,623,0,2,'','',0,0,0,0,0,0,0,0,'',0,0,'',''),(10038,0,'Template_HP_Procurve','',0,'',10050,3,0,'',0,0,0,0,0,0,623,0,2,'','',0,0,0,0,0,0,0,0,'',0,0,'',''),(10039,0,'Template_Java','',0,'',10050,3,0,'',0,0,0,0,0,0,623,0,2,'','',0,0,0,0,0,0,0,0,'',0,0,'',''),(10040,0,'Template_Microsoft_Exchange_2003','',0,'',10050,3,0,'',0,0,0,0,0,0,623,0,2,'','',0,0,0,0,0,0,0,0,'',0,0,'',''),(10041,0,'Template_Microsoft_Exchange_2007','',0,'',10050,3,0,'',0,0,0,0,0,0,623,0,2,'','',0,0,0,0,0,0,0,0,'',0,0,'',''),(10042,0,'Template_IPMI_Sun_Fire_X4100_M2','',0,'',10050,3,0,'',0,0,0,0,0,0,623,0,2,'','',0,0,0,0,0,0,0,0,'',0,0,'',''),(10043,0,'Template_Tomcat','',0,'',10050,3,0,'',0,0,0,0,0,0,623,0,2,'','',0,0,0,0,0,0,0,0,'',0,0,'',''),(10044,0,'Template_Microsoft_SQLServer_2005','',0,'',10050,3,0,'',0,0,0,0,0,0,623,0,2,'','',0,0,0,0,0,0,0,0,'',0,0,'',''),(10045,0,'Template_pfSense','',0,'',10050,3,0,'',0,0,0,0,0,0,623,0,2,'','',0,0,0,0,0,0,0,0,'',0,0,'',''),(10046,0,'Template_NetScreen_25','',0,'',10050,3,0,'',0,0,0,0,0,0,623,0,2,'','',0,0,0,0,0,0,0,0,'',0,0,'',''),(10048,0,'Jenkins server','jenkins.srv',0,'0.0.0.0',10050,0,0,'',0,0,0,0,0,0,623,-1,2,'','',0,0,0,0,0,0,0,0,'',0,0,'','');
/*!40000 ALTER TABLE `hosts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hosts_groups`
--

DROP TABLE IF EXISTS `hosts_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hosts_groups` (
  `hostgroupid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `hostid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `groupid` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`hostgroupid`),
  KEY `hosts_groups_1` (`hostid`,`groupid`),
  KEY `hosts_groups_2` (`groupid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hosts_groups`
--

LOCK TABLES `hosts_groups` WRITE;
/*!40000 ALTER TABLE `hosts_groups` DISABLE KEYS */;
INSERT INTO `hosts_groups` VALUES (1,10001,1),(2,10002,1),(3,10003,1),(4,10004,1),(7,10007,1),(8,10008,1),(9,10009,1),(10,10010,1),(11,10011,1),(12,10012,1),(13,10013,1),(14,10014,1),(15,10015,1),(16,10016,1),(17,10017,4),(18,10018,1),(19,10019,1),(20,10020,1),(21,10021,1),(22,10022,1),(23,10023,1),(24,10024,1),(25,10025,1),(26,10026,1),(27,10027,1),(28,10028,1),(29,10029,1),(30,10030,1),(31,10031,1),(32,10032,1),(33,10033,1),(34,10034,1),(35,10035,1),(36,10036,1),(38,10038,1),(39,10039,1),(40,10040,1),(41,10041,1),(42,10042,1),(43,10043,1),(44,10044,1),(45,10045,1),(46,10046,1),(49,10048,6);
/*!40000 ALTER TABLE `hosts_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hosts_profiles`
--

DROP TABLE IF EXISTS `hosts_profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hosts_profiles` (
  `hostid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `devicetype` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `os` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `serialno` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `tag` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `macaddress` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `hardware` blob NOT NULL,
  `software` blob NOT NULL,
  `contact` blob NOT NULL,
  `location` blob NOT NULL,
  `notes` blob NOT NULL,
  PRIMARY KEY (`hostid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hosts_profiles`
--

LOCK TABLES `hosts_profiles` WRITE;
/*!40000 ALTER TABLE `hosts_profiles` DISABLE KEYS */;
/*!40000 ALTER TABLE `hosts_profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hosts_profiles_ext`
--

DROP TABLE IF EXISTS `hosts_profiles_ext`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hosts_profiles_ext` (
  `hostid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `device_alias` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `device_type` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `device_chassis` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `device_os` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `device_os_short` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `device_hw_arch` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `device_serial` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `device_model` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `device_tag` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `device_vendor` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `device_contract` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `device_who` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `device_status` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `device_app_01` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `device_app_02` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `device_app_03` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `device_app_04` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `device_app_05` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `device_url_1` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `device_url_2` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `device_url_3` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `device_networks` blob NOT NULL,
  `device_notes` blob NOT NULL,
  `device_hardware` blob NOT NULL,
  `device_software` blob NOT NULL,
  `ip_subnet_mask` varchar(39) COLLATE utf8_bin NOT NULL DEFAULT '',
  `ip_router` varchar(39) COLLATE utf8_bin NOT NULL DEFAULT '',
  `ip_macaddress` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `oob_ip` varchar(39) COLLATE utf8_bin NOT NULL DEFAULT '',
  `oob_subnet_mask` varchar(39) COLLATE utf8_bin NOT NULL DEFAULT '',
  `oob_router` varchar(39) COLLATE utf8_bin NOT NULL DEFAULT '',
  `date_hw_buy` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `date_hw_install` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `date_hw_expiry` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `date_hw_decomm` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `site_street_1` varchar(128) COLLATE utf8_bin NOT NULL DEFAULT '',
  `site_street_2` varchar(128) COLLATE utf8_bin NOT NULL DEFAULT '',
  `site_street_3` varchar(128) COLLATE utf8_bin NOT NULL DEFAULT '',
  `site_city` varchar(128) COLLATE utf8_bin NOT NULL DEFAULT '',
  `site_state` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `site_country` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `site_zip` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `site_rack` varchar(128) COLLATE utf8_bin NOT NULL DEFAULT '',
  `site_notes` blob NOT NULL,
  `poc_1_name` varchar(128) COLLATE utf8_bin NOT NULL DEFAULT '',
  `poc_1_email` varchar(128) COLLATE utf8_bin NOT NULL DEFAULT '',
  `poc_1_phone_1` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `poc_1_phone_2` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `poc_1_cell` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `poc_1_screen` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `poc_1_notes` blob NOT NULL,
  `poc_2_name` varchar(128) COLLATE utf8_bin NOT NULL DEFAULT '',
  `poc_2_email` varchar(128) COLLATE utf8_bin NOT NULL DEFAULT '',
  `poc_2_phone_1` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `poc_2_phone_2` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `poc_2_cell` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `poc_2_screen` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `poc_2_notes` blob NOT NULL,
  PRIMARY KEY (`hostid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hosts_profiles_ext`
--

LOCK TABLES `hosts_profiles_ext` WRITE;
/*!40000 ALTER TABLE `hosts_profiles_ext` DISABLE KEYS */;
/*!40000 ALTER TABLE `hosts_profiles_ext` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hosts_templates`
--

DROP TABLE IF EXISTS `hosts_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hosts_templates` (
  `hosttemplateid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `hostid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `templateid` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`hosttemplateid`),
  UNIQUE KEY `hosts_templates_1` (`hostid`,`templateid`),
  KEY `hosts_templates_2` (`templateid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hosts_templates`
--

LOCK TABLES `hosts_templates` WRITE;
/*!40000 ALTER TABLE `hosts_templates` DISABLE KEYS */;
INSERT INTO `hosts_templates` VALUES (1,10017,10001);
/*!40000 ALTER TABLE `hosts_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `housekeeper`
--

DROP TABLE IF EXISTS `housekeeper`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `housekeeper` (
  `housekeeperid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `tablename` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `value` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`housekeeperid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `housekeeper`
--

LOCK TABLES `housekeeper` WRITE;
/*!40000 ALTER TABLE `housekeeper` DISABLE KEYS */;
INSERT INTO `housekeeper` VALUES (1,'trends','itemid',22163),(2,'trends_uint','itemid',22163),(3,'history_text','itemid',22163),(4,'history_log','itemid',22163),(5,'history_uint','itemid',22163),(6,'history_str','itemid',22163),(7,'history','itemid',22163),(8,'trends','itemid',22164),(9,'trends_uint','itemid',22164),(10,'history_text','itemid',22164),(11,'history_log','itemid',22164),(12,'history_uint','itemid',22164),(13,'history_str','itemid',22164),(14,'history','itemid',22164),(15,'trends','itemid',22165),(16,'trends_uint','itemid',22165),(17,'history_text','itemid',22165),(18,'history_log','itemid',22165),(19,'history_uint','itemid',22165),(20,'history_str','itemid',22165),(21,'history','itemid',22165),(22,'trends','itemid',22166),(23,'trends_uint','itemid',22166),(24,'trends','itemid',22167),(25,'trends_uint','itemid',22167),(26,'history_text','itemid',22166),(27,'history_log','itemid',22166),(28,'history_uint','itemid',22166),(29,'history_str','itemid',22166),(30,'history','itemid',22166),(31,'history_text','itemid',22167),(32,'history_log','itemid',22167),(33,'history_uint','itemid',22167),(34,'history_str','itemid',22167),(35,'history','itemid',22167),(36,'trends','itemid',22162),(37,'trends_uint','itemid',22162),(38,'history_text','itemid',22162),(39,'history_log','itemid',22162),(40,'history_uint','itemid',22162),(41,'history_str','itemid',22162),(42,'history','itemid',22162);
/*!40000 ALTER TABLE `housekeeper` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `httpstep`
--

DROP TABLE IF EXISTS `httpstep`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `httpstep` (
  `httpstepid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `httptestid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `no` int(11) NOT NULL DEFAULT '0',
  `url` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `timeout` int(11) NOT NULL DEFAULT '30',
  `posts` blob NOT NULL,
  `required` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `status_codes` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`httpstepid`),
  KEY `httpstep_httpstep_1` (`httptestid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `httpstep`
--

LOCK TABLES `httpstep` WRITE;
/*!40000 ALTER TABLE `httpstep` DISABLE KEYS */;
INSERT INTO `httpstep` VALUES (2,2,'web_check',1,'http://jenkins.srv:8080',15,'','','200');
/*!40000 ALTER TABLE `httpstep` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `httpstepitem`
--

DROP TABLE IF EXISTS `httpstepitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `httpstepitem` (
  `httpstepitemid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `httpstepid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `itemid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `type` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`httpstepitemid`),
  UNIQUE KEY `httpstepitem_httpstepitem_1` (`httpstepid`,`itemid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `httpstepitem`
--

LOCK TABLES `httpstepitem` WRITE;
/*!40000 ALTER TABLE `httpstepitem` DISABLE KEYS */;
INSERT INTO `httpstepitem` VALUES (4,2,22169,2),(5,2,22170,1),(6,2,22171,0);
/*!40000 ALTER TABLE `httpstepitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `httptest`
--

DROP TABLE IF EXISTS `httptest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `httptest` (
  `httptestid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `applicationid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `lastcheck` int(11) NOT NULL DEFAULT '0',
  `nextcheck` int(11) NOT NULL DEFAULT '0',
  `curstate` int(11) NOT NULL DEFAULT '0',
  `curstep` int(11) NOT NULL DEFAULT '0',
  `lastfailedstep` int(11) NOT NULL DEFAULT '0',
  `delay` int(11) NOT NULL DEFAULT '60',
  `status` int(11) NOT NULL DEFAULT '0',
  `macros` blob NOT NULL,
  `agent` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `time` double(16,4) NOT NULL DEFAULT '0.0000',
  `error` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `authentication` int(11) NOT NULL DEFAULT '0',
  `http_user` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `http_password` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`httptestid`),
  KEY `httptest_httptest_1` (`applicationid`),
  KEY `httptest_2` (`name`),
  KEY `httptest_3` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `httptest`
--

LOCK TABLES `httptest` WRITE;
/*!40000 ALTER TABLE `httptest` DISABLE KEYS */;
INSERT INTO `httptest` VALUES (2,'web_check',177,1404843362,1404843422,0,0,0,60,0,'','Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1; .NET CLR 2.0.50727)',0.0179,'',0,'','');
/*!40000 ALTER TABLE `httptest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `httptestitem`
--

DROP TABLE IF EXISTS `httptestitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `httptestitem` (
  `httptestitemid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `httptestid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `itemid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `type` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`httptestitemid`),
  UNIQUE KEY `httptestitem_httptestitem_1` (`httptestid`,`itemid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `httptestitem`
--

LOCK TABLES `httptestitem` WRITE;
/*!40000 ALTER TABLE `httptestitem` DISABLE KEYS */;
INSERT INTO `httptestitem` VALUES (3,2,22172,2),(4,2,22173,3);
/*!40000 ALTER TABLE `httptestitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ids`
--

DROP TABLE IF EXISTS `ids`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ids` (
  `nodeid` int(11) NOT NULL DEFAULT '0',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `field_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `nextid` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`nodeid`,`table_name`,`field_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ids`
--

LOCK TABLES `ids` WRITE;
/*!40000 ALTER TABLE `ids` DISABLE KEYS */;
INSERT INTO `ids` VALUES (0,'applications','applicationid',177),(0,'auditlog','auditid',42),(0,'auditlog_details','auditdetailid',6),(0,'events','eventid',7),(0,'functions','functionid',12131),(0,'graphs','graphid',386),(0,'graphs_items','gitemid',797),(0,'groups','groupid',6),(0,'hosts','hostid',10048),(0,'hosts_groups','hostgroupid',49),(0,'housekeeper','housekeeperid',42),(0,'httpstep','httpstepid',2),(0,'httpstepitem','httpstepitemid',6),(0,'httptest','httptestid',2),(0,'httptestitem','httptestitemid',4),(0,'items','itemid',22173),(0,'items_applications','itemappid',4020),(0,'profiles','profileid',87),(0,'screens','screenid',3),(0,'triggers','triggerid',13001),(0,'user_history','userhistoryid',1);
/*!40000 ALTER TABLE `ids` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `images`
--

DROP TABLE IF EXISTS `images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `images` (
  `imageid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `imagetype` int(11) NOT NULL DEFAULT '0',
  `name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '0',
  `image` longblob NOT NULL,
  PRIMARY KEY (`imageid`),
  KEY `images_1` (`imagetype`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `images`
--

LOCK TABLES `images` WRITE;
/*!40000 ALTER TABLE `images` DISABLE KEYS */;
INSERT INTO `images` VALUES (1,1,'Hub','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\00\0\0\00\0\0\0W��\0\0\0bKGD\0�\0�\0�����\0\0\0tIME�	+M��\0\0JIDATx��OlS��?�٘,���dA%EB�%ڂ��T��A{X�V�8���=pA\\��^���D�P���*U*iڈ*bը�=@v\"�Z+HI���{~3�3��؉�8f��<�~3���;������v85X�h��z_g]|�9\0�\Z\0h����ѩS�~�nݺV��/)弿fn��<{��mmm�����ٳ��X�udd�u(���6o�g^�l��۷����1�P��,�p\r(������]�v��M��,ccc\0��* ����\"~+��z�H)]y���BJ������|�썿���\0�\0�����V+��l�wff�����6��tWJ�\Z�\0��J)�R45ƈ�#�]+}�_�_	�\0B&`�*�$�y�L���.t�뀼Y�D��4�Y�|��-���%O2��)ƞ��z��m*|Ga��]\r\0.��匿��D\"aR�\n�\0�R�1����M�N�P(\n�/�(�X	17\'�JY��e!\0Nq���B����o6�|�N�����rFG?��\n������y��k�Q���(|?ϫ�,\rMQ���Π=¥�\\��\0�T�;v�\\sQ�������J(��\0�S���R��g_0��и��qX�aѵ�l�V��sw!\0RJ��f�!7��Rܾ}ۮ9�Q�K�F�t���3>5�R�7%� �q��a��O�)�Lz�K\\�)>0��{�r�Сy78|�0���\0\r\ZD\0xz���A�M�,�М���LJ�`d��y�x,I ٹ�[Q�1\0������L&�t�gϞ%�ۑX�y>k�}\"�Y º������޺RTB�B_05z˖-\\�re�n������TI��0���Anݺř3g$�ϣg�����(�����!Bp���\0���*�U����S=��l��{���njj�299��P��B�7�RJ^�xAQaP8r�Haӹ\\���Z[[\r\r��*���h\0�ܹ�w7n���R��m��q�F���O���u�L:J�9��$�I.^�ȵk�ʦ��O\Z@^��o�{���Hu:x�\"��D:��V�(��d�������BZB/bJ����Z���\"��Y�����uw��������ܼy�H$¶m�H�RA���4�p�\0y\rbNo���3V*��ǘ���i.����~\Z\Z\Zذa�d� ��r��q�>}Zɢ�za�=�nh{����8�)���s��R)���R�f�\Z\\׭���čF^W��rT\Z[�G�Q�ܹ3�{������ܻw�m6������*z�GV�Kg@��\'�������twws��1�^�j�6}��?-�g��X)�֭[Bj���R�����}����~֯__��PQ���\'B�{�n�R���ͻ�R200𛁁��s�ν҇ �N�?�\0\\��/�\'.�Lͷ�B� 0��?����[��\r�S�\'~?��W�W��3�M.��|�}� � 0��V����K����\'�<�.044��͛����\'O����ǣG��P�ө��\r{V͖�\"XO,c��Q`�044T��D�T\"��VG5��Y�[�XnO��>�pb�o��xL3�f�$�5u�QW�L�ryb�k�8�%�Q�9�c�4���� ���2%Ԣ���*\\��}��r{b;���Et�,#)��RsOL�\nR�в=�mQ����ѣGy��a�<�R�7�W�a���K��/q�[O�5)�E?n�\'��W��g2511�zzz�	��(�!}�Jg!�?��+j��H���Z\\���<����R��%�2�_��++��e����Q:;;�{���F�JH�J,��RG��F��j�E���;�r��j\0X�3h�sO+֯���,�\Z*V�!���\"b��c��VsR�Z��	���-��\0\0\0\0IEND�B`�'),(2,1,'Hub (small)','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0\0\0\0\0\0\0�w=�\0\0\0bKGD\0�\0�\0�����\0\0\0	pHYs\0\0\0\0��~�\0\0\0tIME�#&>#�\0\0mIDATxڵ�?L[W��ٮ\rJ�۩�\"5*R��\"u@�0@%V#��H�]:5���dAbh%*1t\"��tH(X�e@�R��i�@A�� �\r`�g\'�s���1&���~��[���s��������ߏD\"�].�[JI�B �`ii��h4:H�e���:�~���R���GOOO}4\Z}d�����zozz�癙�/\n��]Jɵ�����.F���ېBQ�E�_����+@�\Z\0�a�677n!���\"g�9z������Ǐ�����X,�\0;�Y\07����)�4�\0����&\'\'?Ns�܃���o�R\n!u��n�y��)fuN׮7\0 �|���vtt�J$x<<\'\'\'�8���x�5MCJ���1��P(�5yix����\0!.\0ؤ�tuu���EKK�L����\"��N����˾P(�����7�z���/\0hJ)��$���d2������p8<�\\�|�*�~����H@��R\n�ߏa���Q*�*�rl2\n�o��$�*I w`aa���)\\.�T꜎f�\02@�	�pV�P&�9^x�^���QJ��:+++T&]vwwwF\"��N��-��,y,w	!H$��b���3 ���{6���񭱱�/;;;_����-����ﵷ��oI���u�b��,���������������ӹ��OM2z�I���g}}��Q:���.��f�	S[��Z-I>\n�o�\'�4p�G	廽l��~~)�]�t�0�a�Y�%�x���\0���]!Davv��$[V��R����V�GGG/��*��$W����d�����i=;P����7���:����J��=<<�f(��C{E�8\'w5��xǼ~\0N�L�W�\n�L��iߪ�o�O 㾢\0\0\0\0IEND�B`�'),(3,1,'Network','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\00\0\0\00\0\0\0W��\0\0\0bKGD\0�\0�\0�����\0\0\0tIME�	+M��\0\0JIDATx��OlS��?�٘,���dA%EB�%ڂ��T��A{X�V�8���=pA\\��^���D�P���*U*iڈ*bը�=@v\"�Z+HI���{~3�3��؉�8f��<�~3���;������v85X�h��z_g]|�9\0�\Z\0h����ѩS�~�nݺV��/)弿fn��<{��mmm�����ٳ��X�udd�u(���6o�g^�l��۷����1�P��,�p\r(������]�v��M��,ccc\0��* ����\"~+��z�H)]y���BJ������|�썿���\0�\0�����V+��l�wff�����6��tWJ�\Z�\0��J)�R45ƈ�#�]+}�_�_	�\0B&`�*�$�y�L���.t�뀼Y�D��4�Y�|��-���%O2��)ƞ��z��m*|Ga��]\r\0.��匿��D\"aR�\n�\0�R�1����M�N�P(\n�/�(�X	17\'�JY��e!\0Nq���B����o6�|�N�����rFG?��\n������y��k�Q���(|?ϫ�,\rMQ���Π=¥�\\��\0�T�;v�\\sQ�������J(��\0�S���R��g_0��и��qX�aѵ�l�V��sw!\0RJ��f�!7��Rܾ}ۮ9�Q�K�F�t���3>5�R�7%� �q��a��O�)�Lz�K\\�)>0��{�r�Сy78|�0���\0\r\ZD\0xz���A�M�,�М���LJ�`d��y�x,I ٹ�[Q�1\0������L&�t�gϞ%�ۑX�y>k�}\"�Y º������޺RTB�B_05z˖-\\�re�n������TI��0���Anݺř3g$�ϣg�����(�����!Bp���\0���*�U����S=��l��{���njj�299��P��B�7�RJ^�xAQaP8r�Haӹ\\���Z[[\r\r��*���h\0�ܹ�w7n���R��m��q�F���O���u�L:J�9��$�I.^�ȵk�ʦ��O\Z@^��o�{���Hu:x�\"��D:��V�(��d�������BZB/bJ����Z���\"��Y�����uw��������ܼy�H$¶m�H�RA���4�p�\0y\rbNo���3V*��ǘ���i.����~\Z\Z\Zذa�d� ��r��q�>}Zɢ�za�=�nh{����8�)���s��R)���R�f�\Z\\׭���čF^W��rT\Z[�G�Q�ܹ3�{������ܻw�m6������*z�GV�Kg@��\'�������twws��1�^�j�6}��?-�g��X)�֭[Bj���R�����}����~֯__��PQ���\'B�{�n�R���ͻ�R200𛁁��s�ν҇ �N�?�\0\\��/�\'.�Lͷ�B� 0��?����[��\r�S�\'~?��W�W��3�M.��|�}� � 0��V����K����\'�<�.044��͛����\'O����ǣG��P�ө��\r{V͖�\"XO,c��Q`�044T��D�T\"��VG5��Y�[�XnO��>�pb�o��xL3�f�$�5u�QW�L�ryb�k�8�%�Q�9�c�4���� ���2%Ԣ���*\\��}��r{b;���Et�,#)��RsOL�\nR�в=�mQ����ѣGy��a�<�R�7�W�a���K��/q�[O�5)�E?n�\'��W��g2511�zzz�	��(�!}�Jg!�?��+j��H���Z\\���<����R��%�2�_��++��e����Q:;;�{���F�JH�J,��RG��F��j�E���;�r��j\0X�3h�sO+֯���,�\Z*V�!���\"b��c��VsR�Z��	���-��\0\0\0\0IEND�B`�'),(4,1,'Network (small)','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0\0\0\0\0\0\0�w=�\0\0\0bKGD\0�\0�\0�����\0\0\0	pHYs\0\0\0\0��~�\0\0\0tIME� +8�ظ\0\0mIDATxڵ�?L[W��ٮ\rJ�۩�\"5*R��\"u@�0@%V#��H�]:5���dAbh%*1t\"��tH(X�e@�R��i�@A�� �\r`�g\'�s���1&���~��[���s��������ߏD\"�].�[JI�B �`ii��h4:H�e���:�~���R���GOOO}4\Z}d�����zozz�癙�/\n��]Jɵ�����.F���ېBQ�E�_����+@�\Z\0�a�677n!���\"g�9z������Ǐ�����X,�\0;�Y\07����)�4�\0����&\'\'?Ns�܃���o�R\n!u��n�y��)fuN׮7\0 �|���vtt�J$x<<\'\'\'�8���x�5MCJ���1��P(�5yix����\0!.\0ؤ�tuu���EKK�L����\"��N����˾P(�����7�z���/\0hJ)��$���d2������p8<�\\�|�*�~����H@��R\n�ߏa���Q*�*�rl2\n�o��$�*I w`aa���)\\.�T꜎f�\02@�	�pV�P&�9^x�^���QJ��:+++T&]vwwwF\"��N��-��,y,w	!H$��b���3 ���{6���񭱱�/;;;_����-����ﵷ��oI���u�b��,���������������ӹ��OM2z�I���g}}��Q:���.��f�	S[��Z-I>\n�o�\'�4p�G	廽l��~~)�]�t�0�a�Y�%�x���\0���]!Davv��$[V��R����V�GGG/��*��$W����d�����i=;P����7���:����J��=<<�f(��C{E�8\'w5��xǼ~\0N�L�W�\n�L��iߪ�o�O 㾢\0\0\0\0IEND�B`�'),(5,1,'Notebook','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\00\0\0\00\0\0\0W��\0\0\0bKGD\0\0\0\0\0\0�C�\0\0\0	pHYs\0\0\0\0��~�\0\0\0tIME�	63�\0\0\0>tEXtComment\0Created with The GIMP\n\n(c) 2003 Jakub \'jimmac\' Steiner\'3�X\0\0�IDATx���o\\W�?�q��qSG�u\',���@��	 �*b�-��@��ȪR���U�X4m6Y�j����PEJ�D�I��x�s�=��s�x2�cي���~�wf�������q��؎�؎����K��\0��0�O����:#� D�H@��\"�\0	�&ƈ  ͽ �.N�\"�Qb$��압�=1��.�֑�������_���#]���-~���}]�o$������_���(h�,EQ`���k\r�\Z�1��F��B)��DBB�x��㼧�=�vT���jʲ��g+�#�����	�j�Y��*��*��RS�VD�(B!�$BQ�1�ö���F���2�5J)\r�cR;Q�p��������B��]�8p>4�r�\Z\n��)����b��F	J��	���&��Q!Iʇ��:�,�C^�f	B���*�R�\nK�m)�A�V\Zt\"�CDD��l�$�B�����i�\0I��r��5-J�n�:)�%�C� *fiE�Vt[���\'�4�i�v�¤��\n�ֵO�T��^��j�*�TT�>Ƥjd��0���C\"Ӳ\Z�*Fb��NO�ߏ7�y�!&q�PU;�1�:-�U�`���*�[�B+�*C�T.D(��h���ރò��ڈG�F[%��Qd{�1b���?O6�u;��>��\n]�5(�QZa�Ƙ����1ت\0��=e������\ZW�\'�l�;�$�����Ͽ䥗�h��:t��;��V�V��Z�1\Z�S�j[C�j6F%���sb�H�c�B�;�s`�J���uq�R�|���Ě��Y�eY�#��k[�#�1�9��Ե�����@b�dm�\\�˼�8��׵��֩�	B���:we�Q!0y�F1�m1V�zY1m1����E�\0�>p�e����9��f�L�}��B�&ЌM�w���1xB�zch����@��u�&���g�.\"�	�N��}�rΥ��<���%[[cF�1���|��(�d�ɵQ#��r���j;�yL�6��4�$�D`�۞&Һr����j��cR�\0�W�^%?=����kz2�\n���!I��X;��9X����0ڍ�}N�`�ԩ�ߜ;w��W^���x���L&���.+���U�i��	=՚b�4)�흜�d��Y�\')3d?T���������ҕ˗/���1Z���⨭�����C�����u�Za5-��$��\r�=��_��_�~]��!�ш[�n����ӧO��x��Z�\"BQ,//S�墈\0�ێ�߹��ۗ��^{�ڵkzmm���M����͛����,,,���s	����۷�޳���s������t�*���1~��<���7n��UUQ�%!:��d�������ꑝ����okY__�{ߐx�M�PӚ�ZY���>����Ǐ�sn2�w�]�����B�Pr�	^�7XXX�Z��ӧ��\'s��M���^���>��ϯ���j���a�:�5=�����1�9s��x�2�i���⅏?��V1թS���^;�Yг���|��恭��ʃ�;�ȧ��Ci���i�F�z��=���8q��`��,K�:��o2EQ���,{ENܯ��Ʒ����<�+�~�\nX���Dn�s��YZj��N��v�h�Co�u��n��3}����\Z�hr�γF�I�d�z�L�03\0w#0{����=N��S^6�&�6G~:��y�z�l4��Nd�GRvY�8s3Ğ�y�:�^��@J;��{�gy�Sۏ�؎�����R��H�<�\0\0\0\0IEND�B`�'),(6,1,'Notebook (small)','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0\0\0\0\0\0\0�w=�\0\0\0bKGD\0�\0�\0�����\0\0\0	pHYs\0\0\0\0d_�\0\0\0tIME�!��\0�\0\0\0>tEXtComment\0Created with The GIMP\n\n(c) 2003 Jakub \'jimmac\' Steiner\'3�X\0\0�IDATx��M�U��{�vUM�tOZ�@�fp���M�\r�ApidV.Z��	�q3?���l�e�d�$�ŀ.lж��]��q���K�\n������:����{�x^�����I���AD\0��\0xD@��9�E��ǿ<[��L`k��<��	�8Ĵ�:@\n�����*J[Q�$sUxk0��d�q�ڛ��+�Wb�8\"[h�hw�S%�`��9�̸�g�-ݼ��J���E�V��JSy�t��:�ґ%e�gx�4/(K�њ�/�J�@<�@��Ƌ`+G^V̲��Y�\"�iN��9N��(v� (J[���,�����:L�d%/7\\ᩀ��?��]��[��[��]%�#L�1JSU��,c2���%�9�aI�Y�3�#�R�aH��ZQU���%�9����d<a�即6���i:�ݎ��c����\0G����x�h�U���������{�� \rRM��gx�@@�G�@[�r���J�{?��zID�&@x�և_�����8f���sYB���ӏ�&I�;���7E$?o�w�޺�ͷ��oll���NOO��E�ڥ�eY���M��bww�������U@����g���\\��q��!J��66k-�9:�{{{���Û�o�Łf8.�A�9G��A��k�F#���\r`U��׻_��M^�g�T}��Q�P�����\0]7�:?/v���B��Ȁ\\]�h�?�\"D�}�?�/���7џzoX��O\0\0\0\0IEND�B`�'),(7,1,'Phone','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\00\0\0\00\0\0\0W��\0\0\0bKGD\0�\0�\0�����\0\0�IDATx��ypU�}�?�.o�CHb!l�!8vl���xH�f�Ƥ�u�H�ԥS�2m2^&u�m�i�t�I��	ijc��B�\"[iR%`�bY 	�?���.������!v증�9s�w�9��o��|<>����r���[�\r���{��\0bp��[�d�^?��2������(��A�3<�Nnt��/n��7%�Ui����\0���/>���G`\0`\07�BKI %D\"������<�٬������R3g�Ś���.�Q �G\r@\0��gO�wwS���?u\n�ϣ�Bk���\r�H�c1��3M��ǰ�P��������ص�M@���@\"��\0`�?��Wm�\\<~���ɠ�\0L��UU��Y��a���A���FG��8*�U����%],�z���7n�����E7ݴ7D}P �y�	/��F\r�\n�߿\'��5knѨ)]��T�S�1k�\\�56b��$l�X<N��i䤜=P,>����.iz�~�N����]}�CRQ��u>	�R���mC�x��A��wMs�\0=--��ڊi�:r�m\"3{6�2)�>�H��J$��ǩ��g�1���o��{�)�v]�@P��B\"X�`ю�}��N������W�dMM@�o�m�3g�&B��\rC���J��^R����0��Q�(A2I����裏�?700��C�������\n;9�0/\0��ݶ��h��Y	�B,XpbzSSS��)�g3�����&N���a�����ˑ9��t���5�LFLkh��ml�\"\Z�R�H`A$��~~i}������1E�6\0� �-���;�E��2u*b�|�%K�5�hӄ�~\Z�I�55���MS4j2��+�65�EQ,�x�a���R�Zc�r��\\<u�q`hh���N\n��q���?s��1������0jk��<F$�hlD͙\r##��Q\Z��(tuY���c\0,Z���0��0\"�\ZӶ1�\0���e2�9��K�IўN�/�p^�6.�NԳ��W��+�g�Y���B��\"y�]�c�2�m�ҥg|����7�\\�]W��Lb�b`�h�1�D4ʌD���h��b@��@c2U:\0\r��+�|ܾ���\"��+��^�e���G_|J�S��ѹa\0��0n*-\0}�s�g�1��QU���ӇDL��m3#!f�Snml�$�h�S\Z�`@�n۶�2�����h˄�Y��(C��	T,�J�}��|�������!p���c�֎s?�V��<��4��m�D\"�)Ī�`�� �w޺�ֈemҍs �C��u��X�5Z�q_WW���Љ���E�y���G�N���Fǧ낔�B],��\0CJ����4)A/�U��D��d�=�XSԶ������)To/�u�Z��DJ�RmY��)��������ZJ�R(�C���꺨\\�Q�(/�?+ۀ���b�5Y7�����\0ZkԴZ�\0�B{.JJ˲	���@z2�;}P���iS� �Q���r�t\Z�8 %A>O�u)H�!S,k�p{�� \0�y��e��fQ~�E�h�����z\n:�*Y�X:�y�\0��~ٹ�i��ӟ�\\��󐎃��\"s9t>���y��y�<�s����o��.s�������72Z�+d����>4��UW��cp�ɀRB`f2��?K���z�#[�0��C�X�X(���\n��i3�b�_~�k��n���ZZZvN�&�B�Y٧Id�Y��Z����;r���O�#Р/����\nBPU߀�[g��i�w� U��a��b�cJ#�B�-(������p�uO����8p�k���OV�^�RHg�ߕ\0\0�qpGTWW��D�T��Ԉ�m�i͛��6\r�Lbb\Z9C��kGw~��b�,N�@Զunh(pl!���<r�{���-k9�����+7�|s�ƍ��J�~�vO���U!�38�8���F-a��������\'���&�1}&��<��Ǹ���Lw�~�]ӎFA)|߇x���2\0Oh�J�*y�	����[�n���s�����K.\\���{�@�nE��q2������}S��{�*�����㿞y�Ŷ͊����c�o<^j�֞�����f2�?�0V\0�i�\nػ}�vn���e===.\\X\0�\\�i�$*�\'�ڗn��x���,b�	�X4J$\Z%� �֦m#�R�i��m�z�����v�X(��	a�Z3�͞3�{Z��<�[{<�- \0�ԩS�{���>::�Y�j��#G��b����.��\0�\"`uۆ/�hZ���\Z�*�@�@��R�y�m�gO=%�Rx�O_��+����q��uݺ�q)_y�P�q��<�-=�---�\\w�u����d���_^/��J\0V	@�\nL�s���[�E/��sU�$�a�D�GF9z���w����$�Ԥ\\�̎477�Q�g�DX6$�\0\'N��صkף�6mz�h)��ᬳ4��x�@~�|�·�~����ቈ�e�8�C�XD[\'�J���I�O)�����{�R�8��t^@�����L&C<��۷oݖ-[>[b�5neg��* d\0�_9�l�o�����㍥\n��<�\Z\Z&�xV�߼V,���r�o�x��T*�~hh�mmm�QA|��\"�7}��ǖ.]zgkk�?UWW���b����GK*��g��û?��ʵ�G_{;?y�����?����)�K�s��桡�n��Lkk�3f������jvtt��ʕ+}��(1���sFYJ�\"��0�^������KV��� ��L��R���/q��^�u۶���������y��w�Y�lٲ�ǹ�����G�]���q���/\r\r�}�����|��,)c�\n�̥\n�r�1 ]�c7����~��{R\'�u�7H�����.㤔/o��7��K�bxv͚5[_z��{zz(\nk�����<�m۶m���]{�رkb��ˍ��s�,Y�嫯�zg:���B�D(�!i�U+V!��]W]��{>��o����_�2bD�)�g�H0���~=o޼\r�joo���ݻ�����{�w^___W{{;���w�(1�+��\\�J��P���0�rR�d���n�/�ʮ�\0\'���~߶mcÆ\r�Çw�߿�������!/�\r���؇U���D���*q�|�f�쬜\"\\��o,]�b�\0�o�.��3��Q���D�P�>0\\ߪ�d�P�XVS�\"OS.�<��#�V-3�B*�y����2D�UQ�U:?����W	$\\�銦F�mX-����B N���\0���8�|\r�J���:Ā3ZU�����Z���Nƈ��R&���(��w��?�e�%�U\09|C\0\0\0\0IEND�B`�'),(8,1,'Phone (small)','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0\0\0\0\0\0\0�w=�\0\0\0bKGD\0�\0�\0�����\0\0\0	pHYs\0\0\0\0��~�\0\0\0tIME�#��b_\0\0�IDATx��]hSg����IN���5qiź�\n��������Zel�Jp�Yq �W�07]x5?:e](Nв�Ut���Uʌ]5mcӦ�iNNrrr>����t��/�۽�\\=/�w��y���������̎��r�U���NM&���b��p@��Rfa�_F~M��9r�D	��2�j\0���j��j<\rHy�a+�&�C\"s�t#!�����O�tv޶Aֳ\0\\5@��Z�%�J%9�u+�4���G��N4P�6�{Ƕ��ɑ���wE~��|V���퍍S���U�~=�khh�\0��a\n55,��n*����圯�B޺5�M[B��k	��g:�{ڌ��;���(޽��Ѿ��,�:�w>o�p옰<F](�\Z�>�����%�O*J�z6�-�\'7����1��a�˰Lֺu��в�[_���;��@x��n��|M!A8\n���l�@���ʕ+I0 �f���*�a���\Z��Vm���	����p0����u���n%���o��2�Y�04\r���XR(�(��4MPӄY*�E��J)8B4���H���K`�M\n0y��\0nf�K�#5#��R�8y2:���q�3��4ffg����_Ӓ�|Q��e��1a�a�NdJeԨ*Q\0p��q�c�\0IUɬ(�W��CCC�DQ�F��\0P\0t�����IYӈ�넨*��Җs.\rE7���qhcc,;9IL��ϳY��YR.\0J�����i��H�t:���H/t�\r�ja+���i0u��1��2kt��%�T�H��-�*�mmEC$��X���8yqttlxx������`0襔�����X{�:s���g;�ޟ��f�)�G^��*�dn>C�UE]\0����\n�ߒ{z���i�\0�r����$= �l\0��\0� �N��/��~w2��	e��#_*A!�e��4�W�(���{������s���f\0����d�m+\nY\0NG�\Z�\0\0�D.�;?2����imll�zkB�dMO�~�\\�↦�T��r�xKK����m{___ϡC�:)��T*u?��L�b1�iە��\n\0kl����ȇ7����έx�[ׯ_?�����k׮� `yΖu\0\0�ly�\\�l���ª�F�k;gP\0����+l�n�Y�%��E]\0�\04���U���`HEŕw���x������=��Gߢ\0\0\0\0IEND�B`�'),(9,1,'Printer','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\00\0\0\00\0\0\0W��\0\0\0bKGD\0�\0�\0�����\0\0�IDATx���oI\Z���·�|YK�\"$6k	�L0�iV�D���=q�3#E ��A��\0\0��C Xmhvg��X��e#AX��6��qwW��ݦc���j2��T�����T���TWZK\Z�4�,\0�ϐ��h� ~R(���8CCCtvv���I�R�B!�x�����q,�buu����311�+ �S�^,--��~�(7O$ܸq�h4JOO�`�@ �c����Döm�����s��my��E���Ν;�\'������������]��Rr��M��b1+$4M���]׷o˚�R\n�qp����LNN�K�.i\'N��D\"��ݻ\'�vv�����z��*�jccC�J%U*�ԭ[��իW��J�R�4M�8���ɶm��dT6�U����ڵk�O�lB�������!�$�L�w�^4MCQ1��$�B�*�������y��0�����i>\\où��r�E>|���(���J�����L���^�d�$���ݻ���(\nu��Fʶm,��qB�(��Ǐ��矣i\Zf�Ȟp��L�pw�{9�?Y�]��4)\n�y�fg: �DJ����<_}�5��cO�<�ߋ����?���R����,!p��ږ	)�PJ�Q(޳���q4!X[[�����������3���\\�����Ew��ֽx�X,��\0B��/_&�l��V��9[���G������t]\'��F�t�\n0yu�z���<���(�r��!��F�s略�6^�~M*��v ��gZ�5�_lK�^�|Y�,+��ކ�\"���;�X�L5��V�~��#FGG�\'d�m��8�a044DWWWe�Ҋͷj^��m�&�H`Y\'O�l�/M��?N<GJ�eYض]Ypyٶ�J��U��˽2�O��g߾}D\"����G�aFS�ێ�63-!�t\Z�mmm;�B\0�^6oY��737�4wF�n�R6���������x�ˬ��+�8v��O��,�r�d�\n_]�aP(j��w�8sssd2���9t�Pӑ���e100��i�զWw��zzz���%�L�4�{:���St]���a077�Q>��G���]�K��o��z:M�*^��\n�T*���S,nb��R�\Z#_��r�)��O�f3[�WW_1;;����nVWW��lyyYI)�/MȄ�E�?hD�.�t@�����L��O���J����ٳg�R�Μ9���\Z�Db2\nM*�Ч���������9u�Ԯ�+W�033C\"�`bb�h4�~���;l�KȦ������Ν;�]o�/\0@;�	�gee�l6�T�fffXXXر�E\"����:�4FA2�dii���14M����m�֫��#����)��2)�a`(���x���@�r\n�_�O���_�.���[�x��u922�U��ow/��\r�Z��e�L��g��Y�t�0(7�:\0��������s��PU�{A��/T��au}:���Ⱥ�U�w\0A�0�hY�_/\\�@0�X,Vv���ٶ�i�\r�Y���i��_~�e2�bq���)�	�o�ț@�=����t�<�e�����\0�#�\'��C��\r��p���o*�\Zk*�3O�e\Z�>k�IhuL�������\0��{ɩ��q|�V��\n������5ߠx����<���w�}�JT�U`��u\0�]�� U=#�fG��U��\nP?�,�X|���\0\0\0\0IEND�B`�'),(10,1,'Printer (small)','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0\0\0\0\0\0\0�w=�\0\0\0bKGD\0�\0�\0�����\0\0\0	pHYs\0\0\0\0��~�\0\0\0tIME�!/&�-�\0\0DIDATx�햻O#W�����!C�IcdQD!ё2PQl���*�Q�A��ݎ�&��hY	9ͮ\"Eڔ��<2)�x��H�av�BJ�\\�j��9���;�}���%���o��&> �����~����B���>���8��1�1���	���Y__7���nq��r�����e����6�B��ES�V�R�h��vc��R���;����<o������X,2>>���I��\nr��|�`��;�j5����\0�=۲�d2ض�d�5\'\'\'\r\r5���(�ּ{��.��<�֘�W�1A�xS���{��4�d2r�{|��i���J)*�J�����ʶ-+�H�AZ��X|��~�r�]���%�dtt�T�Nl\0J��J�t:���F�1h\"�/�� �@J�R\n�u��R�ž��%�J�y^g\r�P��#t;;;h����ka�J����FJIOO###�J��\Z����86�4����\Z\\__qx�g䷷����������\Z,//�h�km8??cll�����=�HX�z���u�����jAg\rVWWI$�T?Zk��\r���c4gg�x����L����fW\0nnn�4����9���k����\"�����R�k)嶽���!888 �|��~�xyy��%Ioo/������B���,��Ǔ�|����۷�|[.��	�4���LMM100�T&�m���KTyxx`t�3..�y���ߌ1��^:6p���K���/�(��Ç?\Z��x��O\0)%Ƙ������BT,���l��t�H�z]��IѰ��֜��T\0hX�<��X!3��Ǡ]!P�����c�D��>�6�E�� b��y�P�a�E��]��\n�\0\0\0\0IEND�B`�'),(11,1,'Router','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\00\0\0\00\0\0\0W��\0\0\0bKGD\0�\0�\0�����\0\0\0tIME�	+M��\0\0JIDATx��OlS��?�٘,���dA%EB�%ڂ��T��A{X�V�8���=pA\\��^���D�P���*U*iڈ*bը�=@v\"�Z+HI���{~3�3��؉�8f��<�~3���;������v85X�h��z_g]|�9\0�\Z\0h����ѩS�~�nݺV��/)弿fn��<{��mmm�����ٳ��X�udd�u(���6o�g^�l��۷����1�P��,�p\r(������]�v��M��,ccc\0��* ����\"~+��z�H)]y���BJ������|�썿���\0�\0�����V+��l�wff�����6��tWJ�\Z�\0��J)�R45ƈ�#�]+}�_�_	�\0B&`�*�$�y�L���.t�뀼Y�D��4�Y�|��-���%O2��)ƞ��z��m*|Ga��]\r\0.��匿��D\"aR�\n�\0�R�1����M�N�P(\n�/�(�X	17\'�JY��e!\0Nq���B����o6�|�N�����rFG?��\n������y��k�Q���(|?ϫ�,\rMQ���Π=¥�\\��\0�T�;v�\\sQ�������J(��\0�S���R��g_0��и��qX�aѵ�l�V��sw!\0RJ��f�!7��Rܾ}ۮ9�Q�K�F�t���3>5�R�7%� �q��a��O�)�Lz�K\\�)>0��{�r�Сy78|�0���\0\r\ZD\0xz���A�M�,�М���LJ�`d��y�x,I ٹ�[Q�1\0������L&�t�gϞ%�ۑX�y>k�}\"�Y º������޺RTB�B_05z˖-\\�re�n������TI��0���Anݺř3g$�ϣg�����(�����!Bp���\0���*�U����S=��l��{���njj�299��P��B�7�RJ^�xAQaP8r�Haӹ\\���Z[[\r\r��*���h\0�ܹ�w7n���R��m��q�F���O���u�L:J�9��$�I.^�ȵk�ʦ��O\Z@^��o�{���Hu:x�\"��D:��V�(��d�������BZB/bJ����Z���\"��Y�����uw��������ܼy�H$¶m�H�RA���4�p�\0y\rbNo���3V*��ǘ���i.����~\Z\Z\Zذa�d� ��r��q�>}Zɢ�za�=�nh{����8�)���s��R)���R�f�\Z\\׭���čF^W��rT\Z[�G�Q�ܹ3�{������ܻw�m6������*z�GV�Kg@��\'�������twws��1�^�j�6}��?-�g��X)�֭[Bj���R�����}����~֯__��PQ���\'B�{�n�R���ͻ�R200𛁁��s�ν҇ �N�?�\0\\��/�\'.�Lͷ�B� 0��?����[��\r�S�\'~?��W�W��3�M.��|�}� � 0��V����K����\'�<�.044��͛����\'O����ǣG��P�ө��\r{V͖�\"XO,c��Q`�044T��D�T\"��VG5��Y�[�XnO��>�pb�o��xL3�f�$�5u�QW�L�ryb�k�8�%�Q�9�c�4���� ���2%Ԣ���*\\��}��r{b;���Et�,#)��RsOL�\nR�в=�mQ����ѣGy��a�<�R�7�W�a���K��/q�[O�5)�E?n�\'��W��g2511�zzz�	��(�!}�Jg!�?��+j��H���Z\\���<����R��%�2�_��++��e����Q:;;�{���F�JH�J,��RG��F��j�E���;�r��j\0X�3h�sO+֯���,�\Z*V�!���\"b��c��VsR�Z��	���-��\0\0\0\0IEND�B`�'),(12,1,'Router (small)','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0\0\0\0\0\0\0�w=�\0\0\0bKGD\0�\0�\0�����\0\0\0	pHYs\0\0\0\0��~�\0\0\0tIME�\"/\r�~#\0\0mIDATxڵ�?L[W��ٮ\rJ�۩�\"5*R��\"u@�0@%V#��H�]:5���dAbh%*1t\"��tH(X�e@�R��i�@A�� �\r`�g\'�s���1&���~��[���s��������ߏD\"�].�[JI�B �`ii��h4:H�e���:�~���R���GOOO}4\Z}d�����zozz�癙�/\n��]Jɵ�����.F���ېBQ�E�_����+@�\Z\0�a�677n!���\"g�9z������Ǐ�����X,�\0;�Y\07����)�4�\0����&\'\'?Ns�܃���o�R\n!u��n�y��)fuN׮7\0 �|���vtt�J$x<<\'\'\'�8���x�5MCJ���1��P(�5yix����\0!.\0ؤ�tuu���EKK�L����\"��N����˾P(�����7�z���/\0hJ)��$���d2������p8<�\\�|�*�~����H@��R\n�ߏa���Q*�*�rl2\n�o��$�*I w`aa���)\\.�T꜎f�\02@�	�pV�P&�9^x�^���QJ��:+++T&]vwwwF\"��N��-��,y,w	!H$��b���3 ���{6���񭱱�/;;;_����-����ﵷ��oI���u�b��,���������������ӹ��OM2z�I���g}}��Q:���.��f�	S[��Z-I>\n�o�\'�4p�G	廽l��~~)�]�t�0�a�Y�%�x���\0���]!Davv��$[V��R����V�GGG/��*��$W����d�����i=;P����7���:����J��=<<�f(��C{E�8\'w5��xǼ~\0N�L�W�\n�L��iߪ�o�O 㾢\0\0\0\0IEND�B`�'),(13,1,'Satellite','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\00\0\0\00\0\0\0W��\0\0\0bKGD\0�\0�\0�����\0\0\nDIDATx�ݙ{l��3;~�mlc���	d�2�r\Za�5<TAJ�R�PK!r\n�,�G@Q% 9(#F���6Q�(V�(\r��!���NS��Ԧ�e1����ֻ{��g&��Y��Fj�t5wfvg��;�{��?n�\0qQ�I����]�4k��Q\0�&��B�h�gƩ����(�gG�$D�O\0��x�f2Uf�F�gQ��Mµ�kS\"@��Q��\r���ްz�nm�*�`�z��ZgJf.�q�	|pxϞ=�ܹs���Y|��Ǣ��T����L�Ǩ@��Ϙ&�U��eee�n���)���Dss�hoo7o�/^�����6�<��4�9@��5,*�;&.e�����L]]ݣO>�$��ø\\.���B����z�,Y���˗/|��z�Tè���-HU}�(s%�ϯ\0vz��7	���!�@�$$i|�kGY����d޼yW�<U�I�Q�|�\n���?�\'�����;�C ���W*�2�$�52k׮}\0��Tׁ����\r��X%�^�_}��CO?�4.�����0������(�<���gJ Yu��XE���ǎ;�s�Nz{{����A����Y�x1����\0�]�-w�*��-,,�ܾ};������N\0	>r<22BQQ���PLGq3�hmGaaa�[o������\n��X,�u�^LL����,;;��������J�*\"�>>w�\\���u�QFk7n�`�Νl޼9�7IIIz����(T��\n�dU�����U6l�p�����ʕ+\rM=_���`�֭:x��o߾M(BAzz��;w�\0uS!�W�H���v����k׮�����+W\Z\Z,.����J�]�#�Bu��������0###!B���M}}��\\HR����~�����b����9kjj2���ٰa���lܸ1���=\n��z�z��o\0���hkk��B�=�($L©�~�kjj\"##�_G����Ӽ�����a��M�k`-K���8�\0�B!�O��3I����#�����ڵ�a��΅hll�̙3?~<��1|��Ġ(�NB�eRRRp8a�k��Dw�[�ո?!�����+[l,�v������7oRUU�k��Fgg�W�R	-�j��t:��B066F�ru�d` ʢU�nݺO�8��m�8q�/��$>>�}����o���F�H�b����Hwwwx#	��LXL9m�-|��IMMe���|>�v;UUU��������ݻ�������4�KMM��`08�@KK˿M\"�-`�����?���Cyy9�Ν�W^���\0�<y������طo/���Em�ҥ=�B�0���)3\n���������\0tuu!��c��c�())!--��G�RQQAGG�$Kbb\"�������f�|5�m-\"	�������ǃ$I���s��)^x��n7���x<���Ј���p��a\0233q8�\\.���_|�|0�dNkf�/,--%&&�`0�$I���p��Y�������?>G������ɓ��n���p����vB��i�Կx�\"===���Δ���Bqq1�\',�Q�Պ,�z�+� �u�Vjkkٻw/>������Hc����p���A�/S))�D \'\'����	���b!666��<��X�VE���Cw�@ ���(�������w����7j��������Z�-�������F=Y�@kcY���l���������}\0�� 66vB�i	��� �������!ݵ��%I��O?���d��5�rdY�_�J��=�\Z��LR�����6֔���/�z���@ ,�\\�p��>|����cͪ�\Z>���7���)X�j\r���\" 8E�@J7���������ҥKx<x0���x<���PSSæ�Ď�~JS�gH�x��l�2rWf��ԅ��U����nڴ����	$RRR���������V�e�>00��㡩��O>���������g^Ϡ��m�ĸ���b�Ҭ5�캶�:�I,�V��B�WMMM۳����|�V+���ܸq���|>�����n�N\'N����|�.��Ǜ�I��g�c[��u�e���rsU�k��݆�eR�\"�\r8���Gii�-[�<�����+W���aѢE�D����֭[tuuq��e�իW;����Vg���)V�XAH��3w>nw�)xI�HK�ł�y�����X�N�Z��{Y@� !��\0K�u�2u�t��}j*�\0n]@���ܷ~�#�!B�x�l��ݦ���0�,�l6�O��l�1��A@(�\\#�fs�[�6+I�-j/[�4k��5�X�V�$��ij�<j*I��g�ys��r-W�v��\r�IN`L�)�w�Xu�4N�����Ij���߲�Q�<�����d��3p��b�eY&��ic��gY��*�e2s@�k��H(�\rŐF�\nH?��m���T�u�JψsY�I��oP$����U��$��\\1���v#�x�@!��~���:Ǽ*�1i��[G�m]/Ʊ��v��m��!�h��*��~�|j�6⢹�0tI}�l�P_�W_ Ț}@��\"#[d��C�{Fծ�oL�/M!�0��.Ng�D�	m,�J�(��jD���26*�@�7L8�N��O�2\"B�H!���\0���g�;u�\0\0\0\0IEND�B`�'),(14,1,'Satellite (small)','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0\0\0\0\0\0\0�w=�\0\0\0bKGD\0�\0�\0�����\0\0\0	pHYs\0\0\0\0��~�\0\0\0tIME� ;%��\0\00IDATxڵ�]hU�3w�#��l[���MB�J�&�.Aq�J71���\'!�$�з>T\n��/�A,�A��B���E\n}(H�&X\r�$$�m�f?��mgw�d|��0������̝�s����gMt�C�8�\0RA���\\<��\r��X%�	T�u ��U]�}@0��[���\\�s�6����\0^;q����ׯ;����ٳg��v����\0�\0�UUY=F��S�.]�888����G�4����B�����U�ϘX�t�꿥��Q=y\"�8s�ڵ3���a!�R�����[U�ք����X����������i]�q!��ox$����v&��~3�p��P-{S�����㧒�$RJt]�4M��8�H��K�X������I��@C�U�X=w���x<N6�Ւ�$>�x�qfggI$455Q,	���je��P������=�w�xx8�F�h�i�ض���T*aY~���|��Q���\\�r�SM�\"�t���6�޽�!^��0,--������W\Z���:(�Hv�qX\\\\���355���!��|�r9*�\nRJ��rX�;�T�K����:;;��r\r\rQ(�R�J�B�������e!�d~~�P�`�7JOOχ�X������Y^^f���,,,055EKK�t�Z����������m�W�!bcccQ�4	���q��*�ms��!|>�T�R���۶�q��j�R���P����1۶�4\r�0�ô����ۋeY��yj�\Z�e�������x��wo��`Y���i\Z����:�`���Y��,�j�4�z�*{��ő�W}�{;:�����m\"�J]�K�Z��L&�d2\n�ܹ���?�@O����a*keB� ��|� ��f��ԁ����wFFF�gff�	!Z5M�������̯�{;_�������{X���RfCԬ\Z翸�K���#Jz�\0���P�����~����G�:JS ď�~��Su5<LL�̗�?\0�֌\0�{]�hR\']��,��̣�#r�KJB�*��Z�5��V*i�r����d��H�e+�+�\'��Q��6���Q������~e��@}~n\0\0\0\0IEND�B`�'),(15,1,'Server','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\00\0\0\00\0\0\0W��\0\0\0bKGD\0\0\0\0\0\0�C�\0\0�IDATx��YKkY�n=:I?��mgV\r� �n��av:0�Aa�Y��?��7���!�`+dDe�Q�N�]ufso�훪�G�ra��Vݺ��}�|��S��Ǐ#գ\0��a�T�oll��y��O��<��u]r�l�&۶i0�`0���Sz��Y�$\n�8��2h�����>��}��zt||L�e�ӧOS!�\'�����.u:z���7\'1\"���p8��\nS�,9����=��h�D����=\"B�Z��˗g��1냥R	W�\\A�ۍ$w-��qf�7!\0\0�n�>}���\0@���͛7�#�$�?��wC`�G��`��k�����4M�8��^T��Y�+++�������)�IDnYVzj4\Z�q�\\׍��$}D�0҉@�XD�\\F��O�:�P1�z�w�0Γ��~%sTB��mܾ};	�;�4����@O[J�����n��z�Tr��n#�ϣ�jM�u9�E�J,//�T*�\\.�\0��z(\n���;77��4JD8::��O��@6��(ѫ�j:\n�\0o߾���.z�j�\Znݺ�N���W���n�))���}4\Z\rT�����Ǐcss;;;����ݻwqtt�u����Yf!�+�?\'&���~b��LD����:F^���۶�j��>۶��t��J�e�����*���V>�ߒ�y�{GDM��;\0��\0���I�x��%<σi���a8<��^�����@�V���6Z�<x��R	kkk���-�\ns�޽{���X__���\nj�\Z\0���\rM��<�sئiZׯ_o�q��}c���ig$����;w��6�>|��#�/]���x�\0���#��:�1��2\0�c�׮][���o\Z����|V��b$�\0�2!-�uGZ�q��dF���`������7o�l��RPT3ɠ\\˦�1Q^u\'(\0ǵ��ǕK\0<\0�nO\Z�j�tnH}�<�� \\�c�� �χ�Q����q��9\0C\0>������F\0|C񰮘��$L\0u-/����ya�i\Z\\׍���a�w����I\"C\nG \r׺�p�� RB�Xl�	��`�:`pO�Q�r.J��DDHh���&P#�iZHD&�@@�@O��T����:�0i���׺ v!UB\"j�\Z%��<���h�R������\Z_,瀈������N@Hq��F�|/\'�)Y�%�.�@���9p��g4?M1���i�攚�Q��\"�D`�{���Pʃ؅,���6�����全�P�T��fQ.���fQ�T���Q�T���p��Ű��u�bQ��2�9�y�Q`	��Y�-p�����_��j�6�^��D�^���\0������@���Y�J�G�����?��??��!/S���H�1�1�xNZ�2�=#��P�+Y�LYQ�\"%���6��(kM�����Qe�.}L�X\\�$\r���b~�Z56�V+R�\\SΓ��ސD��\ZH-�h\Zj��>�&��$Q.�F\0c��=?nlT�Bc�$Eoj�_���Y�Y����P��\0\0\0\0IEND�B`�'),(16,1,'Server (small)','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0\0\0\0\0\0\0�w=�\0\0\0bKGD\0�\0�\0�����\0\0\0	pHYs\0\0\0\0��~�\0\0\0tIME�\"�A�c\0\0�IDATxڵ�=o�F�qI�C�m:@�\\ �\ZW�8\'���k�\0�nW�s�[�� @�K�\\990����bJ����5KA�%�A@�\0���ygw@����g��f����o������;c�h��,K)�B�,�4Me8���\0?-�����Z��RU����2\Z����\\������<�{uwwG\0��X\0�Z�1�����g����0�����Z��c���4M���X��B@UU����\'�KD���\'�1\r{&!������۔e��~REQPU��i���a�t�(Z��4M�F3�[kɲ�����[[[DQ4�V)�\0<>>.oQ�����(��v�$I�\0��}���~\0�>>���~����z�$�W\"B�e��޲����y��:�\"���������v��%��_����lu�ݯ�o��<����ޞ��eY6v���O����c�˝����?�-��j������܏~���÷����c�}!��s��8�50)㻑��\0�U`��1�q�\'����Z]It�������\n�}tDc�Zʲ|6&ʲdee�( �\\��b�����rgrbj����(h��u�W�u��r��u@7�QJ5\0J)�0$��\Z�\r$Φ�\0�	 ��z]\\\\|WCf�\"���{��]/C�Ԯ��\0�6�U��ɛ�T\\�2`�*�*f�I�w�8;ꍢ����h}�����5�O�<S%&j��\0\0\0\0IEND�B`�'),(17,1,'UPS','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\00\0\0\00\0\0\0W��\0\0\0bKGD\0�\0�\0�����\0\0�IDATx��]lW���]{��i��U�������7�R�C*Q$$�(B�UR�(�\nP������M�!J��v6k����|ܹ3�Ϯ����z@>�љݝ����s�=�ށ=ٓ=ٓ=ٓ=�I�w�*�ρGn�j����	<�����}��g�p��2I��o_|�_���o����u�\r��\"p�nc���!�{�s3�������ط���O�z�����l��$�xu��a1�� J��,_��=��/:|��̹���=��\Z\0��z�;��>����}��_\']���/K��e\Z!eJk�������\"���t��X�u����	��еSo,훬i��y곬m����{�����ׁc@x3=�姾�ا_��W�=pǾ�f�@�P��R\ZW�}f�\rWN���ə�^���ŵ+k�~L��F\Z�4��m���\\�ؙ�qx�f����s���xo����T�RxH)�dʛK�𼘋�=��\\Z]g��*�	׭2Q�����nZ����<³?�	��[犜�i!T�^���7�}d:D3��b�S(#A3$>0�R\ZY�Xzw���~У��1�v1L��>� �O<ƕ��A�\0�7;���a��SZ�\'��h)�����ai�DJ��s��$\Zr�������C<�2��w/�˻o�ι���rnE�TF��_�r�A7k8��Q�A*�\n����:R���O&z�%��~�Lcvd�������^F���c�\Zq,IB]30�	�tra1@��z�\"!�$I�ł^�#�66��0��c�,G*E���@�I��h����nY�Fݰ����s�8�ea�\'	�~� L�����BB\n�Th(�H\\}�7���<��G5�i\ZJ�Ȥ$�$i�\"��8�X\"eF�H�r��i`�����8�l��QE�	*�AI ���f(y��6�~MC��d9薆ij��Fg#g��n\r�Mq��;D��!*�6	���(�P\n�,\'W�e\n�2Pض���bV��e�|ή(���nM��O�~7�ݠђ����&*�p�>Y\Z\0��҅R\Zinq��ċl.u��$iv�f�J���:�j��1\\ץ�鰰�@LNN�y>�apqM�4�����q������J�B��B�����6�q�r�8j��*��P�Z��}\\���<*�\n��c�6��o���i6��z=&\'\'?�V�U��&��333C���P�@��	֯���4�u�}�f�I8�C�8�C�j5<��@����4\Z\r����<�uB�=0\rL�b�1\"bM�Dv��A�.��`ڶ�1��h6���}Z��~��j��&&&�}�z�^��>`h��H�DB��U�V��I��&�q8U��1�������8���F��pH��,{�\rL�,ªV�Ƕ^�1�(������X��p8Ķm��F�=$Gd\\ץ^�c�x��0d���1���B\'J�*�k!�q���Z�F�X�EEX�5�D�cO�Ȍl\\�p�h3B��*qc��x�آ��:EB_��I��8qc�&Q���C���{H��m�����Q�Ǳm)eyI�\n�K��$���m�$I�T*�m�a�$	�a�I�q<���NEض�۶�u�B#�#��Nv�;&��)�e!��q�n�Վ�z��eY�iJ�Z-��c,z	S��l!�K�nw������4B�i\Zi��iژ����l��C� o�&������o\n$őK\\|��Uds����B�u�<߱5�,��u�N�C�cO�Z-80�(�v\\��\n2Y���u/�����4\Z\r[�6�r\'vDz�Y�4��*�v۶9~�8�^/-p��P�iA�}!��s��_}��\'<����͑�9�e!��F>M���Vh��LOO3;;��\'N������<�z%H���5�����9z�(���9r�u���0���8��I�$	B�(��}N�>���\n��q�ԩѸ����z�\'�-��q�;	<�r�ţ�>�l���i��V�eH)�4MB �Pqga���ϧ+++��X�/|�J!3�7�Z;�[Zvw�9��]<�G�o��\"����Q\0�6�o��^���r_/���6-�VrZ���HE*i	x��ٵ�� b�6!��_�\\�D�i�He[\n��MH\\���T�����e%2�6�U]��G+y�jc^7��A`7c*���L��(��y�R\0\0\0\0IEND�B`�'),(18,1,'UPS (small)','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0\0\0\0\0\0\0�w=�\0\0\0bKGD\0�\0�\0�����\0\0\0	pHYs\0\0\0\0��~�\0\0\0tIME�\"�@�,\0\0�IDATx��O�W�?���]�O�E�B�V[+�Bփ�ۂ�� �(�i��G��z.��Y�R(����Q���q�$�N7c2�d2�޼��IȮ��/}�Ǜ���~������G��N���K��_�c���G��v�����m�u��x����#�>]�p�حɉ�9`��(80w�ۛ�o\\��㩃\'�i�ۑV۔���K�{g&���>�]6���T�v�P�op��_o\\�)�v�ݻw��fy�a�XE���8D>�C���O�����a\09`OT����D�\"�~��NɮO�|����bu�N����<Xft3�h�Z�!GsX��VQ����:TW*���yU��:����Ġ�ʛ�QX�F�1�	�[5�F������c�ڢ�T[<+fx�wϫvֈt��:2������ْ$%G\0��HJ��\Z�2����T�Q,j\\��u]j�\Z~�Bڽ�\'\0\r( �\nlۖ@b�F)�1�}���!�Nc�vwkO�S�H��b�4cJ)�Rh���ð�VJ	��Y��;#��FE=�F��  ��ю$Y\r��ĮXl�Z��&��u�l)%�mwՍ\0�5�;� ��cL�QA�\\��}���H.4N@�?��\0c�_�B!�����B � ���8�f�\0���J�]ڰ��fzz��|>`vv���ޮ��|ߧ�hD���t��P\0�@�>@����ɺ�qT��@�%Y�7���\0�*�\"9@%����g�@7���͏;�goZ��\0\0\0\0IEND�B`�'),(19,1,'Workstation','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\00\0\0\00\0\0\0W��\0\0\0bKGD\0\0\0\0\0\0�C�\0\0\0	pHYs\0\0\0\0��~�\0\0\0tIME�	+*AyK\'\0\0\0>tEXtComment\0Created with The GIMP\n\n(c) 2003 Jakub \'jimmac\' Steiner\'3�X\0\0YIDATx��]hU���������Fј�SS[m5��Aȓ�Ѵ�Jd�R���Am�6 ����#�`!��\Z(��:�MbjLB>����hrs���Շ�y�7_MF��9g�}�Y����c�o۷��\r�,|4\Z�7բ�� �,\0DD\0hoo�y�R(ğV)�8_Pn�B�B)�kPJ�\0��0`߾}3ʙ33����x��6�t�)J�pU�x�/-%wI��_DD<x ���RSS�󾺺ZDD��������gAp[cc#׮]cÆ\rA�����Ĭ�D�ݻw���F�02�L9�5IYYk��\"Pwp����M޳�����\0���N.[ۺu+=����fs;�=�J��[_�lY����7�!.�Oo|��-�t\n-�hAD#\"��\0ڛ���>���Y�1�@�(\"�(lŦ�ւ8�h���s|��S~����n��[A�� ��X�[0%�B�8 D��p�m��4h��9ɓ3ǈ�[@4���_]�{�^�|�@i;DjGӶ��X�>��\")N7�IPYYIOO��\0P�N!�-\"��:\ZVb(D+_X� 6�S��_k�v,�\0����w�����h�)���O��2�w���Ρ����߻Jp-��$�&���ش�ǽ=�O�TJ��?���0���$�lk��&q�ӟҚ�X��狑�����g�3W\0�U)h��)mߋ`)��8n�#J�A�F�LX��$�������x��Df	� p� ���R\Z��v��F��R��J�HX)t zi���o�M�j��P@�O���+10P�)�P(���̏R�	����\Z���\"X\0G@_â%ni�4S���^�qE��~�s,b_�lqc�\0p�VJaƜ-��U���[�\04�J^U�F!IO�m�8V�9m����\\��ν�}����t�R�͙B.�L3f�umK~(U~��ѐ�/�QIk��$����1\n�!�9�g��SRR�u���ЂWP;w�7�YWd;;����-�eȗ_~�8+2���_��6�P�����tM�Kz�����FD���;@,V&~M������fV�YMծ�̲_�@�iMMͥ��nݺWv�Ky�a��j�:�\\��޶m�7n����[\0?�35C��,~����n��F}}��@7p�70X�>1��\0�\'N�\0 ��q�F���(((��j�\n�,�\n����+�]#��m\n�4�ɱ�`Y�d�gϞ122B}}=�����@��c]�x�-[�PRRBYY��\rǙK�q`\"H%�E��R`LD�����/`l|�O����^�(�]6�	|�88�2����{?\0��\0�@b:\'`��a�&K!������4�\\f�{釟�p�;���([�mz��q����L���I`�}5\'�������7�}Q�����Mӫ63U��r{�G���;����I��ϟ�4M�������U(��1411qh���,%�%ng�4Ū��(e[D��\"���.�_9Ჶ����Z�,Y�Uhשݒ݌��M$l\0G�]^^^NEE��Dc�XC60�w���o߾a�ڵA\'zc����X�5���OO�>}��ի��h�NDnfR(X�544���7���N���L&�ԩS���F������q��計|�ʈ>+��.�pǎ���`�&�����a�߿�����J~~~��U��w�^����~����������H�ޅ�{�.���\r\r���Kss3S�)���>\"b����<{��s��U�B��[���~s�رPGG���<z�H$Bgg�φa���M$���3����`Y�7w(\'��� ��㌏����K,����LLN�D�Zs��e����>�����/-�z\nX������ɓ\'�������Ë/x��	�P���ab�J�i��d2�>�����p�4y��%+V�@�PQ��Ǐ���Naa!���000@^^�v����P]�r%~���\\�~}��|�z�;������7o�쭘$[���d\0\'�J����!UyaW���F���j���M���BKK��9s�ֺ�u⏁CCC���}���&	��^�$^\0v������	Rk��N4r��u�2�qwD�/��\nw��H�rj���V?)޶������FU��*\0\0\0\0IEND�B`�'),(20,1,'Workstation (small)','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0\0\0\0\0\0\0�w=�\0\0\0bKGD\0�\0�\0�����\0\0\0	pHYs\0\0\0\0d_�\0\0\0tIME�! �o0q\0\0\0>tEXtComment\0Created with The GIMP\n\n(c) 2003 Jakub \'jimmac\' Steiner\'3�X\0\0cIDATx�Օ?L$U�?��3���� �D��A�!�ҙPXXY������9s\\A#t4�RR�X`���׬zn�H�j΋.�SXt��3�޳؝����.��̼�2����w�?69��q��펎�kO�X,�[^^���(�B�X|kk�J�r����S@��3�gbQj�����\"�~�͢T*�������X�yn�m�Z:�f||�ܹӮ���}�~w�g]<��^�;���@_�?<`rtk\r���k�拏۶͹����09:�g����E����q���Zk���cLK+/ ��/ܹ�����$\"`�A�ֆ��~�o�u\0@$y|�0���I^\Z~��O;X�\Z�6\Z�p^���ǔ�e�\0�x�r�G�U�k	�Ԃ�J�J��1�A�+9ӦC�H`��#5�A�4/��j�1�4W���g �^�t�f-BxwB�KW�J����/It�\"�Z�Z���@����j�������`*\"���r�f������Y!�y������S����fI�R-� ��\0\"\n�}�|>?U(\0��[�����ݑ��Wzzz�D\"(���<Xk��p����5�\\��H<�vV켙���{ׯ���`��=�-..���2l&� �R)�����yĢ�]%.��R,ω]?{{{x������R�|\"�\0�����##�ڨxݹ��Uggg�,�<(��[���=�d2�sss/��2��;KKK�J%�R-�:���8��u]��(�r��L����dGGǶ��U�t:������\\�B��R\n�u�9�D\"���뺔J�:g`ww��x��������^�q��ű���d2)�Z��S\rwxx�����+���W�փ$��dU[Ay���\0�����?otu��qh\0\0\0\0IEND�B`�');
/*!40000 ALTER TABLE `images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `items` (
  `itemid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `type` int(11) NOT NULL DEFAULT '0',
  `snmp_community` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `snmp_oid` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `snmp_port` int(11) NOT NULL DEFAULT '161',
  `hostid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `description` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `key_` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `delay` int(11) NOT NULL DEFAULT '0',
  `history` int(11) NOT NULL DEFAULT '90',
  `trends` int(11) NOT NULL DEFAULT '365',
  `lastvalue` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `lastclock` int(11) DEFAULT NULL,
  `prevvalue` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `value_type` int(11) NOT NULL DEFAULT '0',
  `trapper_hosts` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `units` varchar(10) COLLATE utf8_bin NOT NULL DEFAULT '',
  `multiplier` int(11) NOT NULL DEFAULT '0',
  `delta` int(11) NOT NULL DEFAULT '0',
  `prevorgvalue` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `snmpv3_securityname` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `snmpv3_securitylevel` int(11) NOT NULL DEFAULT '0',
  `snmpv3_authpassphrase` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `snmpv3_privpassphrase` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `formula` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '1',
  `error` varchar(128) COLLATE utf8_bin NOT NULL DEFAULT '',
  `lastlogsize` int(11) NOT NULL DEFAULT '0',
  `logtimefmt` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `templateid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `valuemapid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `delay_flex` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `params` text COLLATE utf8_bin NOT NULL,
  `ipmi_sensor` varchar(128) COLLATE utf8_bin NOT NULL DEFAULT '',
  `data_type` int(11) NOT NULL DEFAULT '0',
  `authtype` int(11) NOT NULL DEFAULT '0',
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `password` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `publickey` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `privatekey` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `mtime` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`itemid`),
  UNIQUE KEY `items_1` (`hostid`,`key_`),
  KEY `items_3` (`status`),
  KEY `items_4` (`templateid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items`
--

LOCK TABLES `items` WRITE;
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
/*!40000 ALTER TABLE `items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `items_applications`
--

DROP TABLE IF EXISTS `items_applications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `items_applications` (
  `itemappid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `applicationid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `itemid` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`itemappid`),
  KEY `items_applications_1` (`applicationid`,`itemid`),
  KEY `items_applications_2` (`itemid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items_applications`
--

LOCK TABLES `items_applications` WRITE;
/*!40000 ALTER TABLE `items_applications` DISABLE KEYS */;
INSERT INTO `items_applications` VALUES (138,1,10016),(694,1,10025),(636,1,10055),(634,1,10056),(448,1,10057),(444,1,10058),(734,1,10061),(186,1,10418),(182,1,10419),(184,1,10420),(646,1,17318),(642,1,17352),(716,2,10031),(718,2,10032),(726,2,10033),(724,2,10036),(720,2,10037),(722,2,10046),(730,2,10060),(740,5,10002),(752,5,10003),(756,5,10004),(272,5,10005),(280,5,10006),(284,5,10007),(288,5,10008),(744,5,10021),(276,5,10022),(760,5,10023),(748,5,10024),(312,5,10062),(320,5,10063),(324,5,10064),(328,5,10065),(316,5,10066),(698,5,10067),(706,5,10068),(710,5,10069),(714,5,10070),(702,5,10071),(764,5,10412),(772,5,10413),(784,5,10414),(776,5,10415),(780,5,10416),(768,5,10417),(512,5,17320),(514,5,17322),(518,5,17324),(522,5,17326),(526,5,17328),(530,5,17330),(534,5,17332),(538,5,17334),(542,5,17336),(546,5,17338),(550,5,17340),(554,5,17342),(558,5,17344),(562,5,17346),(566,5,17348),(570,5,17350),(786,5,17373),(611,7,10072),(607,7,10075),(627,7,10078),(623,7,10081),(619,7,10084),(631,7,10087),(600,9,10009),(804,9,10013),(796,9,10047),(794,9,10048),(798,9,10049),(802,9,10050),(800,9,10051),(790,9,10052),(792,9,10053),(220,9,10059),(178,11,10015),(587,13,10010),(595,13,10011),(591,13,10012),(689,13,17354),(671,13,17356),(675,13,17358),(679,13,17360),(683,13,17362),(236,15,10001),(244,15,10026),(240,15,10027),(650,15,10028),(232,15,10029),(588,17,10010),(596,17,10011),(592,17,10012),(612,17,10072),(608,17,10075),(628,17,10078),(624,17,10081),(620,17,10084),(632,17,10087),(690,17,17354),(672,17,17356),(676,17,17358),(680,17,17360),(684,17,17362),(235,19,10001),(739,19,10002),(751,19,10003),(755,19,10004),(271,19,10005),(279,19,10006),(283,19,10007),(287,19,10008),(604,19,10014),(743,19,10021),(275,19,10022),(759,19,10023),(747,19,10024),(243,19,10026),(239,19,10027),(649,19,10028),(231,19,10029),(602,19,10030),(311,19,10062),(319,19,10063),(323,19,10064),(327,19,10065),(315,19,10066),(697,19,10067),(705,19,10068),(709,19,10069),(713,19,10070),(701,19,10071),(763,19,10412),(771,19,10413),(783,19,10414),(775,19,10415),(779,19,10416),(767,19,10417),(511,19,17320),(513,19,17322),(517,19,17324),(521,19,17326),(525,19,17328),(529,19,17330),(533,19,17332),(537,19,17334),(541,19,17336),(545,19,17338),(549,19,17340),(553,19,17342),(557,19,17344),(561,19,17346),(565,19,17348),(569,19,17350),(785,19,17373),(736,21,10020),(693,21,10025),(447,21,10057),(443,21,10058),(733,21,10061),(854,21,10109),(856,21,10148),(645,21,17318),(641,21,17352),(652,23,10017),(660,23,10018),(654,23,10019),(662,23,10038),(658,23,10039),(656,23,10040),(835,25,10090),(807,25,10091),(848,25,10103),(839,25,10115),(850,25,10119),(815,25,10156),(811,25,10358),(819,25,10359),(823,27,10099),(831,27,10100),(827,27,10101),(808,29,10091),(816,29,10156),(812,29,10358),(820,29,10359),(872,29,17401),(878,29,17403),(890,29,17405),(899,29,17409),(905,29,17411),(846,31,10114),(842,31,10147),(844,31,10150),(862,33,10104),(858,33,10106),(860,33,10357),(836,35,10090),(840,35,10115),(891,37,17405),(900,37,17409),(906,37,17411),(870,39,17399),(873,39,17401),(879,39,17403),(824,41,10099),(832,41,10100),(828,41,10101),(874,41,17401),(880,41,17403),(892,41,17405),(901,41,17409),(907,41,17411),(852,43,10098),(864,43,10102),(866,43,10137),(869,43,17397),(908,47,17412),(944,47,17442),(946,47,17443),(964,47,17452),(966,47,17453),(972,47,17457),(974,47,17458),(909,48,17413),(932,48,17430),(933,48,17431),(934,48,17432),(935,48,17433),(936,48,17434),(937,48,17435),(938,48,17436),(939,48,17437),(940,48,17438),(910,49,17414),(911,50,17415),(912,50,17416),(941,50,17439),(942,50,17440),(943,50,17441),(945,50,17442),(947,50,17443),(965,50,17452),(967,50,17453),(973,50,17457),(975,50,17458),(976,50,17459),(913,51,17417),(915,51,17418),(917,51,17419),(919,51,17420),(921,51,17421),(923,51,17422),(914,52,17417),(916,52,17418),(918,52,17419),(920,52,17420),(922,52,17421),(924,52,17422),(949,52,17444),(951,52,17445),(953,52,17446),(955,52,17447),(957,52,17448),(959,52,17449),(961,52,17450),(963,52,17451),(925,53,17423),(926,53,17424),(927,53,17425),(928,53,17426),(929,53,17427),(930,53,17428),(931,53,17429),(948,54,17444),(950,54,17445),(952,54,17446),(954,54,17447),(956,54,17448),(958,54,17449),(960,54,17450),(962,54,17451),(968,55,17454),(969,55,17455),(971,55,17456),(983,55,17466),(985,55,17467),(987,55,17468),(989,55,17469),(991,55,17470),(993,55,17471),(995,55,17472),(997,55,17473),(999,55,17474),(1001,55,17475),(1003,55,17476),(1005,55,17477),(1007,55,17478),(1009,55,17479),(1011,55,17480),(1013,55,17481),(1015,55,17482),(1017,55,17483),(1019,55,17484),(1021,55,17485),(1023,55,17486),(1025,55,17487),(1027,55,17488),(1029,55,17489),(1031,55,17490),(1033,55,17491),(1035,55,17492),(1037,55,17493),(1039,55,17494),(1041,55,17495),(1043,55,17496),(1045,55,17497),(1047,55,17498),(1049,55,17499),(1051,55,17500),(1053,55,17501),(1055,55,17502),(1057,55,17503),(1059,55,17504),(1061,55,17505),(1063,55,17506),(1065,55,17507),(1067,55,17508),(1069,55,17509),(1071,55,17510),(1073,55,17511),(1075,55,17512),(1077,55,17513),(970,56,17455),(984,56,17466),(986,56,17467),(988,56,17468),(990,56,17469),(992,56,17470),(994,56,17471),(996,56,17472),(998,56,17473),(1000,56,17474),(1002,56,17475),(1004,56,17476),(1006,56,17477),(1008,56,17478),(1010,56,17479),(1012,56,17480),(1014,56,17481),(1016,56,17482),(1018,56,17483),(1020,56,17484),(1022,56,17485),(1024,56,17486),(1026,56,17487),(1028,56,17488),(1030,56,17489),(1032,56,17490),(1034,56,17491),(1036,56,17492),(1038,56,17493),(1040,56,17494),(1042,56,17495),(1044,56,17496),(1046,56,17497),(1048,56,17498),(1050,56,17499),(1052,56,17500),(1054,56,17501),(1056,56,17502),(1058,56,17503),(1060,56,17504),(1062,56,17505),(1064,56,17506),(1066,56,17507),(1068,56,17508),(977,57,17460),(978,57,17461),(979,57,17462),(980,57,17463),(981,57,17464),(1070,58,17509),(1072,58,17510),(1074,58,17511),(1076,58,17512),(1078,58,17513),(1079,59,17514),(1115,59,17544),(1117,59,17545),(1135,59,17554),(1137,59,17555),(1143,59,17559),(1145,59,17560),(1080,60,17515),(1103,60,17532),(1104,60,17533),(1105,60,17534),(1106,60,17535),(1107,60,17536),(1108,60,17537),(1109,60,17538),(1110,60,17539),(1111,60,17540),(1081,61,17516),(1082,62,17517),(1083,62,17518),(1112,62,17541),(1113,62,17542),(1114,62,17543),(1116,62,17544),(1118,62,17545),(1136,62,17554),(1138,62,17555),(1144,62,17559),(1146,62,17560),(1147,62,17561),(1084,63,17519),(1086,63,17520),(1088,63,17521),(1090,63,17522),(1092,63,17523),(1094,63,17524),(1085,64,17519),(1087,64,17520),(1089,64,17521),(1091,64,17522),(1093,64,17523),(1095,64,17524),(1120,64,17546),(1122,64,17547),(1124,64,17548),(1126,64,17549),(1128,64,17550),(1130,64,17551),(1132,64,17552),(1134,64,17553),(1096,65,17525),(1097,65,17526),(1098,65,17527),(1099,65,17528),(1100,65,17529),(1101,65,17530),(1102,65,17531),(1119,66,17546),(1121,66,17547),(1123,66,17548),(1125,66,17549),(1127,66,17550),(1129,66,17551),(1131,66,17552),(1133,66,17553),(1139,67,17556),(1140,67,17557),(1142,67,17558),(1154,67,17568),(1156,67,17569),(1158,67,17570),(1160,67,17571),(1162,67,17572),(1164,67,17573),(1166,67,17574),(1168,67,17575),(1170,67,17576),(1172,67,17577),(1174,67,17578),(1176,67,17579),(1178,67,17580),(1180,67,17581),(1182,67,17582),(1184,67,17583),(1186,67,17584),(1188,67,17585),(1190,67,17586),(1192,67,17587),(1194,67,17588),(1196,67,17589),(1198,67,17590),(1200,67,17591),(1202,67,17592),(1204,67,17593),(1206,67,17594),(1208,67,17595),(1210,67,17596),(1212,67,17597),(1214,67,17598),(1216,67,17599),(1218,67,17600),(1220,67,17601),(1222,67,17602),(1224,67,17603),(1226,67,17604),(1228,67,17605),(1230,67,17606),(1232,67,17607),(1234,67,17608),(1236,67,17609),(1238,67,17610),(1240,67,17611),(1242,67,17612),(1244,67,17613),(1246,67,17614),(1248,67,17615),(1141,68,17557),(1155,68,17568),(1157,68,17569),(1159,68,17570),(1161,68,17571),(1163,68,17572),(1165,68,17573),(1167,68,17574),(1169,68,17575),(1171,68,17576),(1173,68,17577),(1175,68,17578),(1177,68,17579),(1179,68,17580),(1181,68,17581),(1183,68,17582),(1185,68,17583),(1187,68,17584),(1189,68,17585),(1191,68,17586),(1193,68,17587),(1195,68,17588),(1197,68,17589),(1199,68,17590),(1201,68,17591),(1203,68,17592),(1205,68,17593),(1207,68,17594),(1209,68,17595),(1211,68,17596),(1213,68,17597),(1215,68,17598),(1217,68,17599),(1219,68,17600),(1221,68,17601),(1223,68,17602),(1225,68,17603),(1227,68,17604),(1229,68,17605),(1231,68,17606),(1233,68,17607),(1235,68,17608),(1237,68,17609),(1239,68,17610),(1148,69,17562),(1149,69,17563),(1150,69,17564),(1151,69,17565),(1152,69,17566),(1241,70,17611),(1243,70,17612),(1245,70,17613),(1247,70,17614),(1249,70,17615),(1250,71,17616),(1286,71,17646),(1288,71,17647),(1306,71,17656),(1308,71,17657),(1314,71,17661),(1316,71,17662),(1251,72,17617),(1274,72,17634),(1275,72,17635),(1276,72,17636),(1277,72,17637),(1278,72,17638),(1279,72,17639),(1280,72,17640),(1281,72,17641),(1282,72,17642),(1252,73,17618),(1253,74,17619),(1254,74,17620),(1283,74,17643),(1284,74,17644),(1285,74,17645),(1287,74,17646),(1289,74,17647),(1307,74,17656),(1309,74,17657),(1315,74,17661),(1317,74,17662),(1318,74,17663),(1255,75,17621),(1257,75,17622),(1259,75,17623),(1261,75,17624),(1263,75,17625),(1265,75,17626),(1256,76,17621),(1258,76,17622),(1260,76,17623),(1262,76,17624),(1264,76,17625),(1266,76,17626),(1291,76,17648),(1293,76,17649),(1295,76,17650),(1297,76,17651),(1299,76,17652),(1301,76,17653),(1303,76,17654),(1305,76,17655),(1267,77,17627),(1268,77,17628),(1269,77,17629),(1270,77,17630),(1271,77,17631),(1272,77,17632),(1273,77,17633),(1290,78,17648),(1292,78,17649),(1294,78,17650),(1296,78,17651),(1298,78,17652),(1300,78,17653),(1302,78,17654),(1304,78,17655),(1310,79,17658),(1311,79,17659),(1313,79,17660),(1325,79,17670),(1327,79,17671),(1329,79,17672),(1331,79,17673),(1333,79,17674),(1335,79,17675),(1337,79,17676),(1339,79,17677),(1341,79,17678),(1343,79,17679),(1345,79,17680),(1347,79,17681),(1349,79,17682),(1351,79,17683),(1353,79,17684),(1355,79,17685),(1357,79,17686),(1359,79,17687),(1361,79,17688),(1363,79,17689),(1365,79,17690),(1367,79,17691),(1369,79,17692),(1371,79,17693),(1373,79,17694),(1375,79,17695),(1377,79,17696),(1379,79,17697),(1381,79,17698),(1383,79,17699),(1385,79,17700),(1387,79,17701),(1389,79,17702),(1391,79,17703),(1393,79,17704),(1395,79,17705),(1397,79,17706),(1399,79,17707),(1401,79,17708),(1403,79,17709),(1405,79,17710),(1407,79,17711),(1409,79,17712),(1411,79,17713),(1413,79,17714),(1415,79,17715),(1417,79,17716),(1419,79,17717),(1312,80,17659),(1326,80,17670),(1328,80,17671),(1330,80,17672),(1332,80,17673),(1334,80,17674),(1336,80,17675),(1338,80,17676),(1340,80,17677),(1342,80,17678),(1344,80,17679),(1346,80,17680),(1348,80,17681),(1350,80,17682),(1352,80,17683),(1354,80,17684),(1356,80,17685),(1358,80,17686),(1360,80,17687),(1362,80,17688),(1364,80,17689),(1366,80,17690),(1368,80,17691),(1370,80,17692),(1372,80,17693),(1374,80,17694),(1376,80,17695),(1378,80,17696),(1380,80,17697),(1382,80,17698),(1384,80,17699),(1386,80,17700),(1388,80,17701),(1390,80,17702),(1392,80,17703),(1394,80,17704),(1396,80,17705),(1398,80,17706),(1400,80,17707),(1402,80,17708),(1404,80,17709),(1406,80,17710),(1408,80,17711),(1410,80,17712),(1319,81,17664),(1320,81,17665),(1321,81,17666),(1322,81,17667),(1323,81,17668),(1412,82,17713),(1414,82,17714),(1416,82,17715),(1418,82,17716),(1420,82,17717),(1421,83,17718),(1457,83,17748),(1459,83,17749),(1477,83,17758),(1479,83,17759),(1485,83,17763),(1487,83,17764),(1422,84,17719),(1445,84,17736),(1446,84,17737),(1447,84,17738),(1448,84,17739),(1449,84,17740),(1450,84,17741),(1451,84,17742),(1452,84,17743),(1453,84,17744),(1423,85,17720),(1424,86,17721),(1425,86,17722),(1454,86,17745),(1455,86,17746),(1456,86,17747),(1458,86,17748),(1460,86,17749),(1478,86,17758),(1480,86,17759),(1486,86,17763),(1488,86,17764),(1489,86,17765),(1426,87,17723),(1428,87,17724),(1430,87,17725),(1432,87,17726),(1434,87,17727),(1436,87,17728),(1427,88,17723),(1429,88,17724),(1431,88,17725),(1433,88,17726),(1435,88,17727),(1437,88,17728),(1462,88,17750),(1464,88,17751),(1466,88,17752),(1468,88,17753),(1470,88,17754),(1472,88,17755),(1474,88,17756),(1476,88,17757),(1438,89,17729),(1439,89,17730),(1440,89,17731),(1441,89,17732),(1442,89,17733),(1443,89,17734),(1444,89,17735),(1461,90,17750),(1463,90,17751),(1465,90,17752),(1467,90,17753),(1469,90,17754),(1471,90,17755),(1473,90,17756),(1475,90,17757),(1481,91,17760),(1482,91,17761),(1484,91,17762),(1496,91,17772),(1498,91,17773),(1500,91,17774),(1502,91,17775),(1504,91,17776),(1506,91,17777),(1508,91,17778),(1510,91,17779),(1512,91,17780),(1514,91,17781),(1516,91,17782),(1518,91,17783),(1520,91,17784),(1522,91,17785),(1524,91,17786),(1526,91,17787),(1528,91,17788),(1530,91,17789),(1532,91,17790),(1534,91,17791),(1536,91,17792),(1538,91,17793),(1540,91,17794),(1542,91,17795),(1544,91,17796),(1546,91,17797),(1548,91,17798),(1550,91,17799),(1552,91,17800),(1554,91,17801),(1556,91,17802),(1558,91,17803),(1560,91,17804),(1562,91,17805),(1564,91,17806),(1566,91,17807),(1568,91,17808),(1570,91,17809),(1572,91,17810),(1574,91,17811),(1576,91,17812),(1578,91,17813),(1580,91,17814),(1582,91,17815),(1584,91,17816),(1586,91,17817),(1588,91,17818),(1590,91,17819),(1483,92,17761),(1497,92,17772),(1499,92,17773),(1501,92,17774),(1503,92,17775),(1505,92,17776),(1507,92,17777),(1509,92,17778),(1511,92,17779),(1513,92,17780),(1515,92,17781),(1517,92,17782),(1519,92,17783),(1521,92,17784),(1523,92,17785),(1525,92,17786),(1527,92,17787),(1529,92,17788),(1531,92,17789),(1533,92,17790),(1535,92,17791),(1537,92,17792),(1539,92,17793),(1541,92,17794),(1543,92,17795),(1545,92,17796),(1547,92,17797),(1549,92,17798),(1551,92,17799),(1553,92,17800),(1555,92,17801),(1557,92,17802),(1559,92,17803),(1561,92,17804),(1563,92,17805),(1565,92,17806),(1567,92,17807),(1569,92,17808),(1571,92,17809),(1573,92,17810),(1575,92,17811),(1577,92,17812),(1579,92,17813),(1581,92,17814),(1490,93,17766),(1491,93,17767),(1492,93,17768),(1493,93,17769),(1494,93,17770),(1583,94,17815),(1585,94,17816),(1587,94,17817),(1589,94,17818),(1591,94,17819),(1592,95,17820),(1628,95,17850),(1630,95,17851),(1648,95,17860),(1650,95,17861),(1656,95,17865),(1658,95,17866),(1593,96,17821),(1616,96,17838),(1617,96,17839),(1618,96,17840),(1619,96,17841),(1620,96,17842),(1621,96,17843),(1622,96,17844),(1623,96,17845),(1624,96,17846),(1594,97,17822),(1595,98,17823),(1596,98,17824),(1625,98,17847),(1626,98,17848),(1627,98,17849),(1629,98,17850),(1631,98,17851),(1649,98,17860),(1651,98,17861),(1657,98,17865),(1659,98,17866),(1660,98,17867),(1597,99,17825),(1599,99,17826),(1601,99,17827),(1603,99,17828),(1605,99,17829),(1607,99,17830),(1598,100,17825),(1600,100,17826),(1602,100,17827),(1604,100,17828),(1606,100,17829),(1608,100,17830),(1633,100,17852),(1635,100,17853),(1637,100,17854),(1639,100,17855),(1641,100,17856),(1643,100,17857),(1645,100,17858),(1647,100,17859),(1609,101,17831),(1610,101,17832),(1611,101,17833),(1612,101,17834),(1613,101,17835),(1614,101,17836),(1615,101,17837),(1632,102,17852),(1634,102,17853),(1636,102,17854),(1638,102,17855),(1640,102,17856),(1642,102,17857),(1644,102,17858),(1646,102,17859),(1652,103,17862),(1653,103,17863),(1655,103,17864),(1667,103,17874),(1669,103,17875),(1671,103,17876),(1673,103,17877),(1675,103,17878),(1677,103,17879),(1679,103,17880),(1681,103,17881),(1683,103,17882),(1685,103,17883),(1687,103,17884),(1689,103,17885),(1691,103,17886),(1693,103,17887),(1695,103,17888),(1697,103,17889),(1699,103,17890),(1701,103,17891),(1703,103,17892),(1705,103,17893),(1707,103,17894),(1709,103,17895),(1711,103,17896),(1713,103,17897),(1715,103,17898),(1717,103,17899),(1719,103,17900),(1721,103,17901),(1723,103,17902),(1725,103,17903),(1727,103,17904),(1729,103,17905),(1731,103,17906),(1733,103,17907),(1735,103,17908),(1737,103,17909),(1739,103,17910),(1741,103,17911),(1743,103,17912),(1745,103,17913),(1747,103,17914),(1749,103,17915),(1751,103,17916),(1753,103,17917),(1755,103,17918),(1757,103,17919),(1759,103,17920),(1761,103,17921),(1654,104,17863),(1668,104,17874),(1670,104,17875),(1672,104,17876),(1674,104,17877),(1676,104,17878),(1678,104,17879),(1680,104,17880),(1682,104,17881),(1684,104,17882),(1686,104,17883),(1688,104,17884),(1690,104,17885),(1692,104,17886),(1694,104,17887),(1696,104,17888),(1698,104,17889),(1700,104,17890),(1702,104,17891),(1704,104,17892),(1706,104,17893),(1708,104,17894),(1710,104,17895),(1712,104,17896),(1714,104,17897),(1716,104,17898),(1718,104,17899),(1720,104,17900),(1722,104,17901),(1724,104,17902),(1726,104,17903),(1728,104,17904),(1730,104,17905),(1732,104,17906),(1734,104,17907),(1736,104,17908),(1738,104,17909),(1740,104,17910),(1742,104,17911),(1744,104,17912),(1746,104,17913),(1748,104,17914),(1750,104,17915),(1752,104,17916),(1661,105,17868),(1662,105,17869),(1663,105,17870),(1664,105,17871),(1665,105,17872),(1754,106,17917),(1756,106,17918),(1758,106,17919),(1760,106,17920),(1762,106,17921),(1763,107,17922),(1799,107,17952),(1801,107,17953),(1819,107,17962),(1821,107,17963),(1827,107,17967),(1829,107,17968),(1764,108,17923),(1787,108,17940),(1788,108,17941),(1789,108,17942),(1790,108,17943),(1791,108,17944),(1792,108,17945),(1793,108,17946),(1794,108,17947),(1795,108,17948),(1765,109,17924),(1766,110,17925),(1767,110,17926),(1796,110,17949),(1797,110,17950),(1798,110,17951),(1800,110,17952),(1802,110,17953),(1820,110,17962),(1822,110,17963),(1828,110,17967),(1830,110,17968),(1831,110,17969),(1768,111,17927),(1770,111,17928),(1772,111,17929),(1774,111,17930),(1776,111,17931),(1778,111,17932),(1769,112,17927),(1771,112,17928),(1773,112,17929),(1775,112,17930),(1777,112,17931),(1779,112,17932),(1804,112,17954),(1806,112,17955),(1808,112,17956),(1810,112,17957),(1812,112,17958),(1814,112,17959),(1816,112,17960),(1818,112,17961),(1780,113,17933),(1781,113,17934),(1782,113,17935),(1783,113,17936),(1784,113,17937),(1785,113,17938),(1786,113,17939),(1803,114,17954),(1805,114,17955),(1807,114,17956),(1809,114,17957),(1811,114,17958),(1813,114,17959),(1815,114,17960),(1817,114,17961),(1823,115,17964),(1824,115,17965),(1826,115,17966),(1838,115,17976),(1840,115,17977),(1842,115,17978),(1844,115,17979),(1846,115,17980),(1848,115,17981),(1850,115,17982),(1852,115,17983),(1854,115,17984),(1856,115,17985),(1858,115,17986),(1860,115,17987),(1862,115,17988),(1864,115,17989),(1866,115,17990),(1868,115,17991),(1870,115,17992),(1872,115,17993),(1874,115,17994),(1876,115,17995),(1878,115,17996),(1880,115,17997),(1882,115,17998),(1884,115,17999),(1886,115,18000),(1888,115,18001),(1890,115,18002),(1892,115,18003),(1894,115,18004),(1896,115,18005),(1898,115,18006),(1900,115,18007),(1902,115,18008),(1904,115,18009),(1906,115,18010),(1908,115,18011),(1910,115,18012),(1912,115,18013),(1914,115,18014),(1916,115,18015),(1918,115,18016),(1920,115,18017),(1922,115,18018),(1924,115,18019),(1926,115,18020),(1928,115,18021),(1930,115,18022),(1932,115,18023),(1825,116,17965),(1839,116,17976),(1841,116,17977),(1843,116,17978),(1845,116,17979),(1847,116,17980),(1849,116,17981),(1851,116,17982),(1853,116,17983),(1855,116,17984),(1857,116,17985),(1859,116,17986),(1861,116,17987),(1863,116,17988),(1865,116,17989),(1867,116,17990),(1869,116,17991),(1871,116,17992),(1873,116,17993),(1875,116,17994),(1877,116,17995),(1879,116,17996),(1881,116,17997),(1883,116,17998),(1885,116,17999),(1887,116,18000),(1889,116,18001),(1891,116,18002),(1893,116,18003),(1895,116,18004),(1897,116,18005),(1899,116,18006),(1901,116,18007),(1903,116,18008),(1905,116,18009),(1907,116,18010),(1909,116,18011),(1911,116,18012),(1913,116,18013),(1915,116,18014),(1917,116,18015),(1919,116,18016),(1921,116,18017),(1923,116,18018),(1832,117,17970),(1833,117,17971),(1834,117,17972),(1835,117,17973),(1836,117,17974),(1925,118,18019),(1927,118,18020),(1929,118,18021),(1931,118,18022),(1933,118,18023),(1934,119,18024),(1970,119,18054),(1972,119,18055),(1990,119,18064),(1992,119,18065),(1998,119,18069),(2000,119,18070),(1935,120,18025),(1958,120,18042),(1959,120,18043),(1960,120,18044),(1961,120,18045),(1962,120,18046),(1963,120,18047),(1964,120,18048),(1965,120,18049),(1966,120,18050),(1936,121,18026),(1937,122,18027),(1938,122,18028),(1967,122,18051),(1968,122,18052),(1969,122,18053),(1971,122,18054),(1973,122,18055),(1991,122,18064),(1993,122,18065),(1999,122,18069),(2001,122,18070),(2002,122,18071),(1939,123,18029),(1941,123,18030),(1943,123,18031),(1945,123,18032),(1947,123,18033),(1949,123,18034),(1940,124,18029),(1942,124,18030),(1944,124,18031),(1946,124,18032),(1948,124,18033),(1950,124,18034),(1975,124,18056),(1977,124,18057),(1979,124,18058),(1981,124,18059),(1983,124,18060),(1985,124,18061),(1987,124,18062),(1989,124,18063),(1951,125,18035),(1952,125,18036),(1953,125,18037),(1954,125,18038),(1955,125,18039),(1956,125,18040),(1957,125,18041),(1974,126,18056),(1976,126,18057),(1978,126,18058),(1980,126,18059),(1982,126,18060),(1984,126,18061),(1986,126,18062),(1988,126,18063),(1994,127,18066),(1995,127,18067),(1997,127,18068),(2009,127,18078),(2011,127,18079),(2013,127,18080),(2015,127,18081),(2017,127,18082),(2019,127,18083),(2021,127,18084),(2023,127,18085),(2025,127,18086),(2027,127,18087),(2029,127,18088),(2031,127,18089),(2033,127,18090),(2035,127,18091),(2037,127,18092),(2039,127,18093),(2041,127,18094),(2043,127,18095),(2045,127,18096),(2047,127,18097),(2049,127,18098),(2051,127,18099),(2053,127,18100),(2055,127,18101),(2057,127,18102),(2059,127,18103),(2061,127,18104),(2063,127,18105),(2065,127,18106),(2067,127,18107),(2069,127,18108),(2071,127,18109),(2073,127,18110),(2075,127,18111),(2077,127,18112),(2079,127,18113),(2081,127,18114),(2083,127,18115),(2085,127,18116),(2087,127,18117),(2089,127,18118),(2091,127,18119),(2093,127,18120),(2095,127,18121),(2097,127,18122),(2099,127,18123),(2101,127,18124),(2103,127,18125),(1996,128,18067),(2010,128,18078),(2012,128,18079),(2014,128,18080),(2016,128,18081),(2018,128,18082),(2020,128,18083),(2022,128,18084),(2024,128,18085),(2026,128,18086),(2028,128,18087),(2030,128,18088),(2032,128,18089),(2034,128,18090),(2036,128,18091),(2038,128,18092),(2040,128,18093),(2042,128,18094),(2044,128,18095),(2046,128,18096),(2048,128,18097),(2050,128,18098),(2052,128,18099),(2054,128,18100),(2056,128,18101),(2058,128,18102),(2060,128,18103),(2062,128,18104),(2064,128,18105),(2066,128,18106),(2068,128,18107),(2070,128,18108),(2072,128,18109),(2074,128,18110),(2076,128,18111),(2078,128,18112),(2080,128,18113),(2082,128,18114),(2084,128,18115),(2086,128,18116),(2088,128,18117),(2090,128,18118),(2092,128,18119),(2094,128,18120),(2003,129,18072),(2004,129,18073),(2005,129,18074),(2006,129,18075),(2007,129,18076),(2096,130,18121),(2098,130,18122),(2100,130,18123),(2102,130,18124),(2104,130,18125),(2105,131,18126),(2141,131,18156),(2143,131,18157),(2161,131,18166),(2163,131,18167),(2169,131,18171),(2171,131,18172),(2106,132,18127),(2129,132,18144),(2130,132,18145),(2131,132,18146),(2132,132,18147),(2133,132,18148),(2134,132,18149),(2135,132,18150),(2136,132,18151),(2137,132,18152),(2107,133,18128),(2108,134,18129),(2109,134,18130),(2138,134,18153),(2139,134,18154),(2140,134,18155),(2142,134,18156),(2144,134,18157),(2162,134,18166),(2164,134,18167),(2170,134,18171),(2172,134,18172),(2173,134,18173),(2110,135,18131),(2112,135,18132),(2114,135,18133),(2116,135,18134),(2118,135,18135),(2120,135,18136),(2111,136,18131),(2113,136,18132),(2115,136,18133),(2117,136,18134),(2119,136,18135),(2121,136,18136),(2146,136,18158),(2148,136,18159),(2150,136,18160),(2152,136,18161),(2154,136,18162),(2156,136,18163),(2158,136,18164),(2160,136,18165),(2122,137,18137),(2123,137,18138),(2124,137,18139),(2125,137,18140),(2126,137,18141),(2127,137,18142),(2128,137,18143),(2145,138,18158),(2147,138,18159),(2149,138,18160),(2151,138,18161),(2153,138,18162),(2155,138,18163),(2157,138,18164),(2159,138,18165),(2165,139,18168),(2166,139,18169),(2168,139,18170),(2180,139,18180),(2182,139,18181),(2184,139,18182),(2186,139,18183),(2188,139,18184),(2190,139,18185),(2192,139,18186),(2194,139,18187),(2196,139,18188),(2198,139,18189),(2200,139,18190),(2202,139,18191),(2204,139,18192),(2206,139,18193),(2208,139,18194),(2210,139,18195),(2212,139,18196),(2214,139,18197),(2216,139,18198),(2218,139,18199),(2220,139,18200),(2222,139,18201),(2224,139,18202),(2226,139,18203),(2228,139,18204),(2230,139,18205),(2232,139,18206),(2234,139,18207),(2236,139,18208),(2238,139,18209),(2240,139,18210),(2242,139,18211),(2244,139,18212),(2246,139,18213),(2248,139,18214),(2250,139,18215),(2252,139,18216),(2254,139,18217),(2256,139,18218),(2258,139,18219),(2260,139,18220),(2262,139,18221),(2264,139,18222),(2266,139,18223),(2268,139,18224),(2270,139,18225),(2272,139,18226),(2274,139,18227),(2167,140,18169),(2181,140,18180),(2183,140,18181),(2185,140,18182),(2187,140,18183),(2189,140,18184),(2191,140,18185),(2193,140,18186),(2195,140,18187),(2197,140,18188),(2199,140,18189),(2201,140,18190),(2203,140,18191),(2205,140,18192),(2207,140,18193),(2209,140,18194),(2211,140,18195),(2213,140,18196),(2215,140,18197),(2217,140,18198),(2219,140,18199),(2221,140,18200),(2223,140,18201),(2225,140,18202),(2227,140,18203),(2229,140,18204),(2231,140,18205),(2233,140,18206),(2235,140,18207),(2237,140,18208),(2239,140,18209),(2241,140,18210),(2243,140,18211),(2245,140,18212),(2247,140,18213),(2249,140,18214),(2251,140,18215),(2253,140,18216),(2255,140,18217),(2257,140,18218),(2259,140,18219),(2261,140,18220),(2263,140,18221),(2265,140,18222),(2174,141,18174),(2175,141,18175),(2176,141,18176),(2177,141,18177),(2178,141,18178),(2267,142,18223),(2269,142,18224),(2271,142,18225),(2273,142,18226),(2275,142,18227),(2336,143,18477),(2338,143,18478),(2339,143,18479),(2352,143,18489),(2354,143,18490),(2356,143,18491),(2358,143,18492),(2360,143,18493),(2362,143,18494),(2364,143,18495),(2366,143,18496),(2368,143,18497),(2370,143,18498),(2372,143,18499),(2374,143,18500),(2376,143,18501),(2378,143,18502),(2380,143,18503),(2382,143,18504),(2384,143,18505),(2386,143,18506),(2388,143,18507),(2390,143,18508),(2392,143,18509),(2394,143,18510),(2396,143,18511),(2398,143,18512),(2400,143,18513),(2402,143,18514),(2404,143,18515),(2406,143,18516),(2408,143,18517),(2410,143,18518),(2412,143,18519),(2414,143,18520),(2416,143,18521),(2418,143,18522),(2420,143,18523),(2422,143,18524),(2424,143,18525),(2426,143,18526),(2428,143,18527),(2430,143,18528),(2432,143,18529),(2434,143,18530),(2436,143,18531),(2438,143,18532),(2440,143,18533),(2442,143,18534),(2444,143,18535),(2446,143,18536),(2316,144,18467),(2318,144,18468),(2320,144,18469),(2322,144,18470),(2324,144,18471),(2326,144,18472),(2328,144,18473),(2330,144,18474),(2337,145,18478),(2351,145,18489),(2353,145,18490),(2355,145,18491),(2357,145,18492),(2359,145,18493),(2361,145,18494),(2363,145,18495),(2365,145,18496),(2367,145,18497),(2369,145,18498),(2371,145,18499),(2373,145,18500),(2375,145,18501),(2377,145,18502),(2379,145,18503),(2381,145,18504),(2383,145,18505),(2385,145,18506),(2387,145,18507),(2389,145,18508),(2391,145,18509),(2393,145,18510),(2395,145,18511),(2397,145,18512),(2399,145,18513),(2401,145,18514),(2403,145,18515),(2405,145,18516),(2407,145,18517),(2409,145,18518),(2411,145,18519),(2413,145,18520),(2415,145,18521),(2417,145,18522),(2419,145,18523),(2421,145,18524),(2423,145,18525),(2425,145,18526),(2427,145,18527),(2429,145,18528),(2431,145,18529),(2433,145,18530),(2435,145,18531),(2276,146,18435),(2313,146,18465),(2315,146,18466),(2333,146,18475),(2335,146,18476),(2341,146,18480),(2343,146,18481),(2345,147,18483),(2346,147,18484),(2347,147,18485),(2348,147,18486),(2349,147,18487),(2350,147,18488),(2278,148,18437),(2437,149,18532),(2439,149,18533),(2441,149,18534),(2443,149,18535),(2445,149,18536),(2281,150,18440),(2283,150,18441),(2285,150,18442),(2287,150,18443),(2289,150,18444),(2291,150,18445),(2279,151,18438),(2280,151,18439),(2309,151,18462),(2310,151,18463),(2311,151,18464),(2312,151,18465),(2314,151,18466),(2332,151,18475),(2334,151,18476),(2340,151,18480),(2342,151,18481),(2344,151,18482),(2282,152,18440),(2284,152,18441),(2286,152,18442),(2288,152,18443),(2290,152,18444),(2292,152,18445),(2317,152,18467),(2319,152,18468),(2321,152,18469),(2323,152,18470),(2325,152,18471),(2327,152,18472),(2329,152,18473),(2331,152,18474),(2277,153,18436),(2300,153,18453),(2301,153,18454),(2302,153,18455),(2303,153,18456),(2304,153,18457),(2305,153,18458),(2306,153,18459),(2307,153,18460),(2308,153,18461),(2293,154,18446),(2294,154,18447),(2295,154,18448),(2296,154,18449),(2297,154,18450),(2298,154,18451),(2299,154,18452),(2447,155,19944),(2448,155,19945),(2449,155,19946),(3200,155,20697),(3201,155,20698),(3202,155,20699),(3203,155,20700),(3204,155,20701),(3205,155,20702),(2450,156,19947),(2451,156,19948),(2452,156,19949),(2453,156,19950),(2454,156,19951),(2455,156,19952),(2456,156,19953),(2457,156,19954),(2458,156,19955),(2459,156,19956),(2460,156,19957),(2461,156,19958),(2462,156,19959),(2463,156,19960),(2464,156,19961),(2465,156,19962),(2466,156,19963),(2467,156,19964),(2468,156,19965),(2469,156,19966),(2470,156,19967),(2471,156,19968),(2472,156,19969),(2473,156,19970),(2474,156,19971),(2475,156,19972),(2476,156,19973),(2477,156,19974),(2478,156,19975),(2479,156,19976),(2480,156,19977),(2481,156,19978),(2482,156,19979),(2483,156,19980),(2484,156,19981),(2485,156,19982),(2486,156,19983),(2487,156,19984),(2488,156,19985),(2489,156,19986),(2490,156,19987),(2491,156,19988),(2492,156,19989),(2493,156,19990),(2494,156,19991),(2495,156,19992),(2496,156,19993),(2497,156,19994),(2498,156,19995),(2499,156,19996),(2500,156,19997),(2501,156,19998),(2502,156,19999),(2503,156,20000),(2504,156,20001),(2505,156,20002),(2506,156,20003),(2507,156,20004),(2508,156,20005),(2509,156,20006),(2510,156,20007),(2511,156,20008),(2512,156,20009),(2513,156,20010),(2514,156,20011),(2515,156,20012),(2516,156,20013),(2517,156,20014),(2518,156,20015),(2519,156,20016),(2520,156,20017),(2521,156,20018),(2522,156,20019),(2523,156,20020),(2524,156,20021),(2525,156,20022),(2526,156,20023),(2527,156,20024),(2528,156,20025),(2529,156,20026),(2530,156,20027),(2531,156,20028),(2532,156,20029),(2533,156,20030),(2534,156,20031),(2535,156,20032),(2536,156,20033),(2537,156,20034),(2538,156,20035),(2539,156,20036),(2540,156,20037),(2541,156,20038),(2542,156,20039),(2543,156,20040),(2544,156,20041),(2545,156,20042),(2546,156,20043),(2547,156,20044),(2548,156,20045),(2549,156,20046),(2550,156,20047),(2551,156,20048),(2552,156,20049),(2553,156,20050),(2554,156,20051),(2555,156,20052),(2556,156,20053),(2557,156,20054),(2558,156,20055),(2559,156,20056),(2560,156,20057),(2561,156,20058),(2562,156,20059),(2563,156,20060),(2564,156,20061),(2565,156,20062),(2566,156,20063),(2567,156,20064),(2568,156,20065),(2569,156,20066),(2570,156,20067),(2571,156,20068),(2572,156,20069),(2573,156,20070),(2574,156,20071),(2575,156,20072),(2576,156,20073),(2577,156,20074),(2578,156,20075),(2579,156,20076),(2580,156,20077),(2581,156,20078),(2582,156,20079),(2583,156,20080),(2584,156,20081),(2585,156,20082),(2586,156,20083),(2587,156,20084),(2588,156,20085),(2589,156,20086),(2590,156,20087),(2591,156,20088),(2592,156,20089),(2593,156,20090),(2594,156,20091),(2595,156,20092),(2596,156,20093),(2597,156,20094),(2598,156,20095),(2599,156,20096),(2600,156,20097),(2601,156,20098),(2602,156,20099),(2603,156,20100),(2604,156,20101),(2605,156,20102),(2606,156,20103),(2607,156,20104),(2608,156,20105),(2609,156,20106),(2610,156,20107),(2611,156,20108),(2612,156,20109),(2613,156,20110),(2614,156,20111),(2615,156,20112),(2616,156,20113),(2617,156,20114),(2618,156,20115),(2619,156,20116),(2620,156,20117),(2621,156,20118),(2622,156,20119),(2623,156,20120),(2624,156,20121),(2625,156,20122),(2626,156,20123),(2627,156,20124),(2628,156,20125),(2629,156,20126),(2630,156,20127),(2631,156,20128),(2632,156,20129),(2633,156,20130),(2634,156,20131),(2635,156,20132),(2636,156,20133),(2637,156,20134),(2638,156,20135),(2639,156,20136),(2640,156,20137),(2641,156,20138),(2642,156,20139),(2643,156,20140),(2644,156,20141),(2645,156,20142),(2646,156,20143),(2647,156,20144),(2648,156,20145),(2649,156,20146),(2650,156,20147),(2651,156,20148),(2652,156,20149),(2653,156,20150),(2654,156,20151),(2655,156,20152),(2656,156,20153),(2657,156,20154),(2658,156,20155),(2659,156,20156),(2660,156,20157),(2661,156,20158),(2662,156,20159),(2663,156,20160),(2664,156,20161),(2665,156,20162),(2666,156,20163),(2667,156,20164),(2668,156,20165),(2669,156,20166),(2670,156,20167),(2671,156,20168),(2672,156,20169),(2673,156,20170),(2674,156,20171),(2675,156,20172),(2676,156,20173),(2677,156,20174),(2678,156,20175),(2679,156,20176),(2680,156,20177),(2681,156,20178),(2682,156,20179),(2683,156,20180),(2684,156,20181),(2685,156,20182),(2686,156,20183),(2687,156,20184),(2688,156,20185),(2689,156,20186),(2690,156,20187),(2691,156,20188),(2692,156,20189),(2693,156,20190),(2694,156,20191),(2695,156,20192),(2696,156,20193),(2697,156,20194),(2698,156,20195),(2699,156,20196),(2700,156,20197),(2701,156,20198),(2702,156,20199),(2703,156,20200),(2704,156,20201),(2705,156,20202),(2706,156,20203),(2707,156,20204),(2708,156,20205),(2709,156,20206),(2710,156,20207),(2711,156,20208),(2712,156,20209),(2713,156,20210),(2714,156,20211),(2715,156,20212),(2716,156,20213),(2717,156,20214),(2718,156,20215),(2719,156,20216),(2720,156,20217),(2721,156,20218),(2722,156,20219),(2723,156,20220),(2724,156,20221),(2725,156,20222),(2726,156,20223),(2727,156,20224),(2728,156,20225),(2729,156,20226),(2730,156,20227),(2731,156,20228),(2732,156,20229),(2733,156,20230),(2734,156,20231),(2735,156,20232),(2736,156,20233),(2737,156,20234),(2738,156,20235),(2739,156,20236),(2740,156,20237),(2741,156,20238),(2742,156,20239),(2743,156,20240),(2744,156,20241),(2745,156,20242),(2746,156,20243),(2747,156,20244),(2748,156,20245),(2749,156,20246),(2750,156,20247),(2751,156,20248),(2752,156,20249),(2753,156,20250),(2754,156,20251),(2755,156,20252),(2756,156,20253),(2757,156,20254),(2758,156,20255),(2759,156,20256),(2760,156,20257),(2761,156,20258),(2762,156,20259),(2763,156,20260),(2764,156,20261),(2765,156,20262),(2766,156,20263),(2767,156,20264),(2768,156,20265),(2769,156,20266),(2770,156,20267),(2771,156,20268),(2772,156,20269),(2773,156,20270),(2774,156,20271),(2775,156,20272),(2776,156,20273),(2777,156,20274),(2778,156,20275),(2779,156,20276),(2780,156,20277),(2781,156,20278),(2782,156,20279),(2783,156,20280),(2784,156,20281),(2785,156,20282),(2786,156,20283),(2787,156,20284),(2788,156,20285),(2789,156,20286),(2790,156,20287),(2791,156,20288),(2792,156,20289),(2793,156,20290),(2794,156,20291),(2795,156,20292),(2796,156,20293),(2797,156,20294),(2798,156,20295),(2799,156,20296),(2800,156,20297),(2801,156,20298),(2802,156,20299),(2803,156,20300),(2804,156,20301),(2805,156,20302),(2806,156,20303),(2807,156,20304),(2808,156,20305),(2809,156,20306),(2810,156,20307),(2811,156,20308),(2812,156,20309),(2813,156,20310),(2814,156,20311),(2815,156,20312),(2816,156,20313),(2817,156,20314),(2818,156,20315),(2819,156,20316),(2820,156,20317),(2821,156,20318),(2822,156,20319),(2823,156,20320),(2824,156,20321),(2825,156,20322),(2826,156,20323),(2827,156,20324),(2828,156,20325),(2829,156,20326),(2830,156,20327),(2831,156,20328),(2832,156,20329),(2833,156,20330),(2834,156,20331),(2835,156,20332),(2836,156,20333),(2837,156,20334),(2838,156,20335),(2839,156,20336),(2840,156,20337),(2841,156,20338),(2842,156,20339),(2843,156,20340),(2844,156,20341),(2845,156,20342),(2846,156,20343),(2847,156,20344),(2848,156,20345),(2849,156,20346),(2850,156,20347),(2851,156,20348),(2852,156,20349),(2853,156,20350),(2854,156,20351),(2855,156,20352),(2856,156,20353),(2857,156,20354),(2858,156,20355),(2859,156,20356),(2860,156,20357),(2861,156,20358),(2862,156,20359),(2863,156,20360),(2864,156,20361),(2865,156,20362),(2866,156,20363),(2867,156,20364),(2868,156,20365),(2869,156,20366),(2870,156,20367),(2871,156,20368),(2872,156,20369),(2873,156,20370),(2874,156,20371),(2875,156,20372),(2876,156,20373),(2877,156,20374),(2878,156,20375),(2879,156,20376),(2880,156,20377),(2881,156,20378),(2882,156,20379),(2883,156,20380),(2884,156,20381),(2885,156,20382),(2886,156,20383),(2887,156,20384),(2888,156,20385),(2889,156,20386),(2890,156,20387),(2891,156,20388),(2892,156,20389),(2893,156,20390),(2894,156,20391),(2895,156,20392),(2896,156,20393),(2897,156,20394),(2898,156,20395),(2899,156,20396),(2900,156,20397),(2901,156,20398),(2902,156,20399),(2903,156,20400),(2904,156,20401),(2905,156,20402),(2906,156,20403),(2907,156,20404),(2908,156,20405),(2909,156,20406),(2910,156,20407),(2911,156,20408),(2912,156,20409),(2913,156,20410),(2914,156,20411),(2915,156,20412),(2916,156,20413),(2917,156,20414),(2918,156,20415),(2919,156,20416),(2920,156,20417),(2921,156,20418),(2922,156,20419),(2923,156,20420),(2924,156,20421),(2925,156,20422),(2926,156,20423),(2927,156,20424),(2928,156,20425),(2929,156,20426),(2930,156,20427),(2931,156,20428),(2932,156,20429),(2933,156,20430),(2934,156,20431),(2935,156,20432),(2936,156,20433),(2937,156,20434),(2938,156,20435),(2939,156,20436),(2940,156,20437),(2941,156,20438),(2942,156,20439),(2943,156,20440),(2944,156,20441),(2945,156,20442),(2946,156,20443),(2947,156,20444),(2948,156,20445),(2949,156,20446),(2950,156,20447),(2951,156,20448),(2952,156,20449),(2953,156,20450),(2954,156,20451),(2955,156,20452),(2956,156,20453),(2957,156,20454),(2958,156,20455),(2959,156,20456),(2960,156,20457),(2961,156,20458),(2962,156,20459),(2963,156,20460),(2964,156,20461),(2965,156,20462),(2966,156,20463),(2967,156,20464),(2968,156,20465),(2969,156,20466),(2970,156,20467),(2971,156,20468),(2972,156,20469),(2973,156,20470),(2974,156,20471),(2975,156,20472),(2976,156,20473),(2977,156,20474),(2978,156,20475),(2979,156,20476),(2980,156,20477),(2981,156,20478),(2982,156,20479),(2983,156,20480),(2984,156,20481),(2985,156,20482),(2986,156,20483),(2987,156,20484),(2988,156,20485),(2989,156,20486),(2990,156,20487),(2991,156,20488),(2992,156,20489),(2993,156,20490),(2994,156,20491),(2995,156,20492),(2996,156,20493),(2997,156,20494),(2998,156,20495),(2999,156,20496),(3000,156,20497),(3001,156,20498),(3002,156,20499),(3003,156,20500),(3004,156,20501),(3005,156,20502),(3006,156,20503),(3007,156,20504),(3008,156,20505),(3009,156,20506),(3010,156,20507),(3011,156,20508),(3012,156,20509),(3013,156,20510),(3014,156,20511),(3015,156,20512),(3016,156,20513),(3017,156,20514),(3018,156,20515),(3019,156,20516),(3020,156,20517),(3021,156,20518),(3022,156,20519),(3023,156,20520),(3024,156,20521),(3025,156,20522),(3026,156,20523),(3027,156,20524),(3028,156,20525),(3029,156,20526),(3030,156,20527),(3031,156,20528),(3032,156,20529),(3033,156,20530),(3034,156,20531),(3035,156,20532),(3036,156,20533),(3037,156,20534),(3038,156,20535),(3039,156,20536),(3040,156,20537),(3041,156,20538),(3042,156,20539),(3043,156,20540),(3044,156,20541),(3045,156,20542),(3046,156,20543),(3047,156,20544),(3048,156,20545),(3049,156,20546),(3050,156,20547),(3051,156,20548),(3052,156,20549),(3053,156,20550),(3054,156,20551),(3055,156,20552),(3056,156,20553),(3057,156,20554),(3058,156,20555),(3059,156,20556),(3060,156,20557),(3061,156,20558),(3062,156,20559),(3063,156,20560),(3064,156,20561),(3065,156,20562),(3066,156,20563),(3067,156,20564),(3068,156,20565),(3069,156,20566),(3070,156,20567),(3071,156,20568),(3072,156,20569),(3073,156,20570),(3074,156,20571),(3075,156,20572),(3076,156,20573),(3077,156,20574),(3078,156,20575),(3079,156,20576),(3080,156,20577),(3081,156,20578),(3082,156,20579),(3083,156,20580),(3084,156,20581),(3085,156,20582),(3086,156,20583),(3087,156,20584),(3088,156,20585),(3089,156,20586),(3090,156,20587),(3091,156,20588),(3092,156,20589),(3093,156,20590),(3094,156,20591),(3095,156,20592),(3096,156,20593),(3097,156,20594),(3098,156,20595),(3099,156,20596),(3100,156,20597),(3101,156,20598),(3102,156,20599),(3103,156,20600),(3104,156,20601),(3105,156,20602),(3106,156,20603),(3107,156,20604),(3108,156,20605),(3109,156,20606),(3110,156,20607),(3111,156,20608),(3112,156,20609),(3113,156,20610),(3114,156,20611),(3115,156,20612),(3116,156,20613),(3117,156,20614),(3118,156,20615),(3119,156,20616),(3120,156,20617),(3121,156,20618),(3122,156,20619),(3123,156,20620),(3124,156,20621),(3125,156,20622),(3126,156,20623),(3127,156,20624),(3128,156,20625),(3129,156,20626),(3130,156,20627),(3131,156,20628),(3132,156,20629),(3133,156,20630),(3134,156,20631),(3135,156,20632),(3136,156,20633),(3137,156,20634),(3138,156,20635),(3139,156,20636),(3140,156,20637),(3141,156,20638),(3142,156,20639),(3143,156,20640),(3144,156,20641),(3145,156,20642),(3146,156,20643),(3147,156,20644),(3148,156,20645),(3149,156,20646),(3150,156,20647),(3151,156,20648),(3152,156,20649),(3153,156,20650),(3154,156,20651),(3155,156,20652),(3156,156,20653),(3157,156,20654),(3158,156,20655),(3159,156,20656),(3160,156,20657),(3161,156,20658),(3162,156,20659),(3163,156,20660),(3164,156,20661),(3165,156,20662),(3166,156,20663),(3167,156,20664),(3168,156,20665),(3169,156,20666),(3170,156,20667),(3171,156,20668),(3172,156,20669),(3173,156,20670),(3174,156,20671),(3175,156,20672),(3176,156,20673),(3177,156,20674),(3178,156,20675),(3179,156,20676),(3180,156,20677),(3181,156,20678),(3182,156,20679),(3183,156,20680),(3184,156,20681),(3185,156,20682),(3186,156,20683),(3187,156,20684),(3188,156,20685),(3189,156,20686),(3190,156,20687),(3191,156,20688),(3192,156,20689),(3193,156,20690),(3194,156,20691),(3195,156,20692),(3196,156,20693),(3197,156,20694),(3198,156,20695),(3199,156,20696),(3206,157,20703),(3208,157,20705),(3209,157,20706),(3210,157,20707),(3211,157,20708),(3212,157,20709),(3213,157,20710),(3214,157,20711),(3215,157,20712),(3216,157,20713),(3217,157,20714),(3218,157,20715),(3219,157,20716),(3220,157,20717),(3221,157,20718),(3222,157,20719),(3223,157,20720),(3224,157,20721),(3225,157,20722),(3226,157,20723),(3227,157,20724),(3228,157,20725),(3229,157,20726),(3230,157,20727),(3231,157,20728),(3232,157,20729),(3233,157,20730),(3234,157,20731),(3235,157,20732),(3236,157,20733),(3237,157,20734),(3238,157,20735),(3239,157,20736),(3240,157,20737),(3241,157,20738),(3242,157,20739),(3243,157,20740),(3244,157,20741),(3207,158,20704),(3245,159,20742),(3246,159,20743),(3247,160,20744),(3248,160,20745),(3249,160,20746),(3250,160,20747),(3251,160,20748),(3252,160,20749),(3253,160,20750),(3254,161,20751),(3255,161,20752),(3465,161,20962),(3466,161,20963),(3467,161,20964),(3468,161,20965),(3469,161,20966),(3256,162,20753),(3257,162,20754),(3258,162,20755),(3259,162,20756),(3260,162,20757),(3261,162,20758),(3262,162,20759),(3263,162,20760),(3264,162,20761),(3265,162,20762),(3266,162,20763),(3267,162,20764),(3268,162,20765),(3269,162,20766),(3270,162,20767),(3271,162,20768),(3272,162,20769),(3273,162,20770),(3274,162,20771),(3275,162,20772),(3276,162,20773),(3277,162,20774),(3278,162,20775),(3279,162,20776),(3280,162,20777),(3281,162,20778),(3282,162,20779),(3283,162,20780),(3284,162,20781),(3285,162,20782),(3286,162,20783),(3287,162,20784),(3288,162,20785),(3289,162,20786),(3290,162,20787),(3291,162,20788),(3292,162,20789),(3293,162,20790),(3294,162,20791),(3295,162,20792),(3296,162,20793),(3297,162,20794),(3298,162,20795),(3299,162,20796),(3300,162,20797),(3301,162,20798),(3302,162,20799),(3303,162,20800),(3304,162,20801),(3305,162,20802),(3306,162,20803),(3307,162,20804),(3308,162,20805),(3309,162,20806),(3310,162,20807),(3311,162,20808),(3312,162,20809),(3313,162,20810),(3314,162,20811),(3315,162,20812),(3316,162,20813),(3317,162,20814),(3318,162,20815),(3319,162,20816),(3320,162,20817),(3321,162,20818),(3322,162,20819),(3323,162,20820),(3324,162,20821),(3325,162,20822),(3326,162,20823),(3327,162,20824),(3328,162,20825),(3329,162,20826),(3330,162,20827),(3331,162,20828),(3332,162,20829),(3333,162,20830),(3334,162,20831),(3335,162,20832),(3336,162,20833),(3337,162,20834),(3338,162,20835),(3339,162,20836),(3340,162,20837),(3341,162,20838),(3342,162,20839),(3343,162,20840),(3344,162,20841),(3345,162,20842),(3346,162,20843),(3347,162,20844),(3348,162,20845),(3349,162,20846),(3350,162,20847),(3351,162,20848),(3352,162,20849),(3353,162,20850),(3354,162,20851),(3355,162,20852),(3356,162,20853),(3357,162,20854),(3358,162,20855),(3359,162,20856),(3360,162,20857),(3361,162,20858),(3362,162,20859),(3363,162,20860),(3364,162,20861),(3365,162,20862),(3366,162,20863),(3367,162,20864),(3368,162,20865),(3369,162,20866),(3370,162,20867),(3371,162,20868),(3372,162,20869),(3373,162,20870),(3374,162,20871),(3375,162,20872),(3376,162,20873),(3377,162,20874),(3378,162,20875),(3379,162,20876),(3380,162,20877),(3381,162,20878),(3382,162,20879),(3383,162,20880),(3384,162,20881),(3385,162,20882),(3386,162,20883),(3387,162,20884),(3388,162,20885),(3389,162,20886),(3390,162,20887),(3391,162,20888),(3392,162,20889),(3393,162,20890),(3394,162,20891),(3395,162,20892),(3396,162,20893),(3397,162,20894),(3398,162,20895),(3399,162,20896),(3400,162,20897),(3401,162,20898),(3402,162,20899),(3403,162,20900),(3404,162,20901),(3405,162,20902),(3406,162,20903),(3407,162,20904),(3408,162,20905),(3409,162,20906),(3410,162,20907),(3411,162,20908),(3412,162,20909),(3413,162,20910),(3414,162,20911),(3415,162,20912),(3416,162,20913),(3417,162,20914),(3418,162,20915),(3419,162,20916),(3420,162,20917),(3421,162,20918),(3422,162,20919),(3423,162,20920),(3424,162,20921),(3425,162,20922),(3426,162,20923),(3427,162,20924),(3428,162,20925),(3429,162,20926),(3430,162,20927),(3431,162,20928),(3432,162,20929),(3433,162,20930),(3434,162,20931),(3435,162,20932),(3436,162,20933),(3437,162,20934),(3438,162,20935),(3439,162,20936),(3440,162,20937),(3441,162,20938),(3442,162,20939),(3443,162,20940),(3444,162,20941),(3445,162,20942),(3446,162,20943),(3447,162,20944),(3448,162,20945),(3449,162,20946),(3450,162,20947),(3451,162,20948),(3452,162,20949),(3453,162,20950),(3454,162,20951),(3455,162,20952),(3456,162,20953),(3457,162,20954),(3458,162,20955),(3459,162,20956),(3460,162,20957),(3461,162,20958),(3462,162,20959),(3463,162,20960),(3464,162,20961),(3470,163,20967),(3471,163,20968),(3472,163,20969),(3726,163,21223),(3727,163,21224),(3728,163,21225),(3729,163,21226),(3730,163,21227),(3731,163,21228),(3473,164,20970),(3474,164,20971),(3475,164,20972),(3476,164,20973),(3477,164,20974),(3478,164,20975),(3479,164,20976),(3480,164,20977),(3481,164,20978),(3482,164,20979),(3483,164,20980),(3484,164,20981),(3485,164,20982),(3486,164,20983),(3487,164,20984),(3488,164,20985),(3489,164,20986),(3490,164,20987),(3491,164,20988),(3492,164,20989),(3493,164,20990),(3494,164,20991),(3495,164,20992),(3496,164,20993),(3497,164,20994),(3498,164,20995),(3499,164,20996),(3500,164,20997),(3501,164,20998),(3502,164,20999),(3503,164,21000),(3504,164,21001),(3505,164,21002),(3506,164,21003),(3507,164,21004),(3508,164,21005),(3509,164,21006),(3510,164,21007),(3511,164,21008),(3512,164,21009),(3513,164,21010),(3514,164,21011),(3515,164,21012),(3516,164,21013),(3517,164,21014),(3518,164,21015),(3519,164,21016),(3520,164,21017),(3521,164,21018),(3522,164,21019),(3523,164,21020),(3524,164,21021),(3525,164,21022),(3526,164,21023),(3527,164,21024),(3528,164,21025),(3529,164,21026),(3530,164,21027),(3531,164,21028),(3532,164,21029),(3533,164,21030),(3534,164,21031),(3535,164,21032),(3536,164,21033),(3537,164,21034),(3538,164,21035),(3539,164,21036),(3540,164,21037),(3541,164,21038),(3542,164,21039),(3543,164,21040),(3544,164,21041),(3545,164,21042),(3546,164,21043),(3547,164,21044),(3548,164,21045),(3549,164,21046),(3550,164,21047),(3551,164,21048),(3552,164,21049),(3553,164,21050),(3554,164,21051),(3555,164,21052),(3556,164,21053),(3557,164,21054),(3558,164,21055),(3559,164,21056),(3560,164,21057),(3561,164,21058),(3562,164,21059),(3563,164,21060),(3564,164,21061),(3565,164,21062),(3566,164,21063),(3567,164,21064),(3568,164,21065),(3569,164,21066),(3570,164,21067),(3571,164,21068),(3572,164,21069),(3573,164,21070),(3574,164,21071),(3575,164,21072),(3576,164,21073),(3577,164,21074),(3578,164,21075),(3579,164,21076),(3580,164,21077),(3581,164,21078),(3582,164,21079),(3583,164,21080),(3584,164,21081),(3585,164,21082),(3586,164,21083),(3587,164,21084),(3588,164,21085),(3589,164,21086),(3590,164,21087),(3591,164,21088),(3592,164,21089),(3593,164,21090),(3594,164,21091),(3595,164,21092),(3596,164,21093),(3597,164,21094),(3598,164,21095),(3599,164,21096),(3600,164,21097),(3601,164,21098),(3602,164,21099),(3603,164,21100),(3604,164,21101),(3605,164,21102),(3606,164,21103),(3607,164,21104),(3608,164,21105),(3609,164,21106),(3610,164,21107),(3611,164,21108),(3612,164,21109),(3613,164,21110),(3614,164,21111),(3615,164,21112),(3616,164,21113),(3617,164,21114),(3618,164,21115),(3619,164,21116),(3620,164,21117),(3621,164,21118),(3622,164,21119),(3623,164,21120),(3624,164,21121),(3625,164,21122),(3626,164,21123),(3627,164,21124),(3628,164,21125),(3629,164,21126),(3630,164,21127),(3631,164,21128),(3632,164,21129),(3633,164,21130),(3634,164,21131),(3635,164,21132),(3636,164,21133),(3637,164,21134),(3638,164,21135),(3639,164,21136),(3640,164,21137),(3641,164,21138),(3642,164,21139),(3643,164,21140),(3644,164,21141),(3645,164,21142),(3646,164,21143),(3647,164,21144),(3648,164,21145),(3649,164,21146),(3650,164,21147),(3651,164,21148),(3652,164,21149),(3653,164,21150),(3654,164,21151),(3655,164,21152),(3656,164,21153),(3657,164,21154),(3658,164,21155),(3659,164,21156),(3660,164,21157),(3661,164,21158),(3662,164,21159),(3663,164,21160),(3664,164,21161),(3665,164,21162),(3666,164,21163),(3667,164,21164),(3668,164,21165),(3669,164,21166),(3670,164,21167),(3671,164,21168),(3672,164,21169),(3673,164,21170),(3674,164,21171),(3675,164,21172),(3676,164,21173),(3677,164,21174),(3678,164,21175),(3679,164,21176),(3680,164,21177),(3681,164,21178),(3682,164,21179),(3683,164,21180),(3684,164,21181),(3685,164,21182),(3686,164,21183),(3687,164,21184),(3688,164,21185),(3689,164,21186),(3690,164,21187),(3691,164,21188),(3692,164,21189),(3693,164,21190),(3694,164,21191),(3695,164,21192),(3696,164,21193),(3697,164,21194),(3698,164,21195),(3699,164,21196),(3700,164,21197),(3701,164,21198),(3702,164,21199),(3703,164,21200),(3704,164,21201),(3705,164,21202),(3706,164,21203),(3707,164,21204),(3708,164,21205),(3709,164,21206),(3710,164,21207),(3711,164,21208),(3712,164,21209),(3713,164,21210),(3714,164,21211),(3715,164,21212),(3716,164,21213),(3717,164,21214),(3718,164,21215),(3719,164,21216),(3720,164,21217),(3721,164,21218),(3722,164,21219),(3723,164,21220),(3724,164,21221),(3725,164,21222),(3732,165,21779),(3733,165,21780),(3746,165,21793),(3734,166,21781),(3735,166,21782),(3738,166,21785),(3739,166,21786),(3742,166,21789),(3736,167,21783),(3737,167,21784),(3740,167,21787),(3741,167,21788),(3743,167,21790),(3744,167,21791),(3745,167,21792),(3747,168,21794),(3748,168,21795),(3749,168,21796),(3750,168,21797),(3751,168,21798),(3752,168,21799),(3753,168,21800),(3754,168,21801),(3755,168,21802),(3756,168,21803),(3757,168,21804),(3758,168,21805),(3759,168,21806),(3760,168,21807),(3761,168,21808),(3762,168,21809),(3763,168,21810),(3764,169,21891),(3765,169,21892),(3766,169,21893),(3767,169,21894),(3768,169,21895),(3769,169,21896),(3770,170,21897),(3771,170,21898),(3772,170,21899),(3773,170,21900),(3774,170,21901),(3775,170,21902),(3776,170,21903),(3777,170,21904),(3778,170,21905),(3779,170,21906),(3780,170,21907),(3781,170,21908),(3782,170,21909),(3783,170,21910),(3784,170,21911),(3785,170,21912),(3786,170,21913),(3787,170,21914),(3788,170,21915),(3789,170,21916),(3790,170,21917),(3791,170,21918),(3792,170,21919),(3793,170,21920),(3794,170,21921),(3795,170,21922),(3796,170,21923),(3797,170,21924),(3798,170,21925),(3799,170,21926),(3800,170,21927),(3801,170,21928),(3802,170,21929),(3803,170,21930),(3804,170,21931),(3805,170,21932),(3806,170,21933),(3807,170,21934),(3808,170,21935),(3809,170,21936),(3810,170,21937),(3811,170,21938),(3812,170,21939),(3813,170,21940),(3814,170,21941),(3815,170,21942),(3816,170,21943),(3817,170,21944),(3818,170,21945),(3819,170,21946),(3820,170,21947),(3821,170,21948),(3822,170,21949),(3823,170,21950),(3824,170,21951),(3825,170,21952),(3826,170,21953),(3827,170,21954),(3828,170,21955),(3829,170,21956),(3830,170,21957),(3831,170,21958),(3832,170,21959),(3833,170,21960),(3834,170,21961),(3835,170,21962),(3836,170,21963),(3837,170,21964),(3838,170,21965),(3839,170,21966),(3840,170,21967),(3841,170,21968),(3842,170,21969),(3843,170,21970),(3844,170,21971),(3845,170,21972),(3846,170,21973),(3847,170,21974),(3848,170,21975),(3849,170,21976),(3850,170,21977),(3851,170,21978),(3852,170,21979),(3853,170,21980),(3854,170,21981),(3855,170,21982),(3856,170,21983),(3857,170,21984),(3858,170,21985),(3859,170,21986),(3860,170,21987),(3861,170,21988),(3862,170,21989),(3863,170,21990),(3864,170,21991),(3865,170,21992),(3866,170,21993),(3867,170,21994),(3868,170,21995),(3869,170,21996),(3870,170,21997),(3871,170,21998),(3872,170,21999),(3873,170,22000),(3874,170,22001),(3875,170,22002),(3876,170,22003),(3877,170,22004),(3878,170,22005),(3879,170,22006),(3880,170,22007),(3881,170,22008),(3882,170,22009),(3883,170,22010),(3884,170,22011),(3885,170,22012),(3886,170,22013),(3887,170,22014),(3888,170,22015),(3889,170,22016),(3890,170,22017),(3891,170,22018),(3892,170,22019),(3893,170,22020),(3894,170,22021),(3895,170,22022),(3896,170,22023),(3897,170,22024),(3898,170,22025),(3899,170,22026),(3900,170,22027),(3901,170,22028),(3902,170,22029),(3903,170,22030),(3904,170,22031),(3905,170,22032),(3906,170,22033),(3907,170,22034),(3908,170,22035),(3909,170,22036),(3910,170,22037),(3911,170,22038),(3912,170,22039),(3913,170,22040),(3914,170,22041),(3915,170,22042),(3916,170,22043),(3917,170,22044),(3918,170,22045),(3919,170,22046),(3920,170,22047),(3921,170,22048),(3922,170,22049),(3923,170,22050),(3924,170,22051),(3925,170,22052),(3926,170,22053),(3927,170,22054),(3928,170,22055),(3929,170,22056),(3930,170,22057),(3931,170,22058),(3932,170,22059),(3933,170,22060),(3934,170,22061),(3935,170,22062),(3936,170,22063),(3937,170,22064),(3938,170,22065),(3939,170,22066),(3940,170,22067),(3941,170,22068),(3942,170,22069),(3943,170,22070),(3944,170,22071),(3945,170,22072),(3946,170,22073),(3947,170,22074),(3948,170,22075),(3949,170,22076),(3950,170,22077),(3951,170,22078),(3952,170,22079),(3953,170,22080),(3954,170,22081),(3955,170,22082),(3956,170,22083),(3957,170,22084),(3958,170,22085),(3959,170,22086),(3960,170,22087),(3961,170,22088),(3962,170,22089),(3963,170,22090),(3964,170,22091),(3965,170,22092),(3966,170,22093),(3967,170,22094),(3968,170,22095),(3969,170,22096),(3970,170,22097),(3971,170,22098),(3972,170,22099),(3973,170,22100),(3974,170,22101),(3975,170,22102),(3976,170,22103),(3977,170,22104),(3978,170,22105),(3979,170,22106),(3980,170,22107),(3981,171,22108),(3982,171,22109),(3983,171,22110),(3984,172,22111),(3985,172,22112),(3986,172,22113),(3987,172,22114),(3988,172,22115),(3989,172,22116),(3990,172,22117),(3991,172,22118),(3992,172,22119),(3993,172,22120),(3994,172,22121),(3995,172,22122),(3996,172,22123),(3997,173,22124),(3998,173,22125),(3999,173,22126),(4000,173,22127),(4001,174,22128),(4002,174,22129),(4003,174,22130),(4004,174,22131),(4005,175,22132),(4006,175,22133),(4007,175,22134),(4008,175,22135),(4015,177,22168),(4016,177,22169),(4017,177,22170),(4018,177,22171),(4019,177,22172),(4020,177,22173);
/*!40000 ALTER TABLE `items_applications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maintenances`
--

DROP TABLE IF EXISTS `maintenances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `maintenances` (
  `maintenanceid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `name` varchar(128) COLLATE utf8_bin NOT NULL DEFAULT '',
  `maintenance_type` int(11) NOT NULL DEFAULT '0',
  `description` blob NOT NULL,
  `active_since` int(11) NOT NULL DEFAULT '0',
  `active_till` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`maintenanceid`),
  KEY `maintenances_1` (`active_since`,`active_till`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maintenances`
--

LOCK TABLES `maintenances` WRITE;
/*!40000 ALTER TABLE `maintenances` DISABLE KEYS */;
/*!40000 ALTER TABLE `maintenances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maintenances_groups`
--

DROP TABLE IF EXISTS `maintenances_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `maintenances_groups` (
  `maintenance_groupid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `maintenanceid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `groupid` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`maintenance_groupid`),
  KEY `maintenances_groups_1` (`maintenanceid`,`groupid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maintenances_groups`
--

LOCK TABLES `maintenances_groups` WRITE;
/*!40000 ALTER TABLE `maintenances_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `maintenances_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maintenances_hosts`
--

DROP TABLE IF EXISTS `maintenances_hosts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `maintenances_hosts` (
  `maintenance_hostid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `maintenanceid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `hostid` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`maintenance_hostid`),
  KEY `maintenances_hosts_1` (`maintenanceid`,`hostid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maintenances_hosts`
--

LOCK TABLES `maintenances_hosts` WRITE;
/*!40000 ALTER TABLE `maintenances_hosts` DISABLE KEYS */;
/*!40000 ALTER TABLE `maintenances_hosts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maintenances_windows`
--

DROP TABLE IF EXISTS `maintenances_windows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `maintenances_windows` (
  `maintenance_timeperiodid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `maintenanceid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `timeperiodid` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`maintenance_timeperiodid`),
  KEY `maintenances_windows_1` (`maintenanceid`,`timeperiodid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maintenances_windows`
--

LOCK TABLES `maintenances_windows` WRITE;
/*!40000 ALTER TABLE `maintenances_windows` DISABLE KEYS */;
/*!40000 ALTER TABLE `maintenances_windows` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mappings`
--

DROP TABLE IF EXISTS `mappings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mappings` (
  `mappingid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `valuemapid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `value` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `newvalue` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`mappingid`),
  KEY `mappings_1` (`valuemapid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mappings`
--

LOCK TABLES `mappings` WRITE;
/*!40000 ALTER TABLE `mappings` DISABLE KEYS */;
INSERT INTO `mappings` VALUES (1,1,'0','Down'),(2,1,'1','Up'),(3,2,'0','Up'),(4,2,'2','Unreachable'),(5,3,'0','Running'),(6,3,'1','Paused'),(7,3,'3','Pause pending'),(8,3,'4','Continue pending'),(9,3,'5','Stop pending'),(10,3,'6','Stopped'),(11,3,'7','Unknown'),(12,3,'255','No such service');
/*!40000 ALTER TABLE `mappings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media`
--

DROP TABLE IF EXISTS `media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media` (
  `mediaid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `userid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `mediatypeid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `sendto` varchar(100) COLLATE utf8_bin NOT NULL DEFAULT '',
  `active` int(11) NOT NULL DEFAULT '0',
  `severity` int(11) NOT NULL DEFAULT '63',
  `period` varchar(100) COLLATE utf8_bin NOT NULL DEFAULT '1-7,00:00-23:59',
  PRIMARY KEY (`mediaid`),
  KEY `media_1` (`userid`),
  KEY `media_2` (`mediatypeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media`
--

LOCK TABLES `media` WRITE;
/*!40000 ALTER TABLE `media` DISABLE KEYS */;
/*!40000 ALTER TABLE `media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_type`
--

DROP TABLE IF EXISTS `media_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media_type` (
  `mediatypeid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `type` int(11) NOT NULL DEFAULT '0',
  `description` varchar(100) COLLATE utf8_bin NOT NULL DEFAULT '',
  `smtp_server` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `smtp_helo` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `smtp_email` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `exec_path` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `gsm_modem` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `username` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `passwd` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`mediatypeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_type`
--

LOCK TABLES `media_type` WRITE;
/*!40000 ALTER TABLE `media_type` DISABLE KEYS */;
INSERT INTO `media_type` VALUES (1,0,'Email','mail.company.com','company.com','zabbix@company.com','','','',''),(2,3,'Jabber','','','','','','jabber@company.com','zabbix'),(3,2,'SMS','','','','','/dev/ttyS0','','');
/*!40000 ALTER TABLE `media_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `node_cksum`
--

DROP TABLE IF EXISTS `node_cksum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `node_cksum` (
  `nodeid` int(11) NOT NULL DEFAULT '0',
  `tablename` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `recordid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `cksumtype` int(11) NOT NULL DEFAULT '0',
  `cksum` text COLLATE utf8_bin NOT NULL,
  `sync` char(128) COLLATE utf8_bin NOT NULL DEFAULT '',
  KEY `node_cksum_1` (`nodeid`,`cksumtype`,`tablename`,`recordid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `node_cksum`
--

LOCK TABLES `node_cksum` WRITE;
/*!40000 ALTER TABLE `node_cksum` DISABLE KEYS */;
/*!40000 ALTER TABLE `node_cksum` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nodes`
--

DROP TABLE IF EXISTS `nodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nodes` (
  `nodeid` int(11) NOT NULL DEFAULT '0',
  `name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '0',
  `timezone` int(11) NOT NULL DEFAULT '0',
  `ip` varchar(39) COLLATE utf8_bin NOT NULL DEFAULT '',
  `port` int(11) NOT NULL DEFAULT '10051',
  `slave_history` int(11) NOT NULL DEFAULT '30',
  `slave_trends` int(11) NOT NULL DEFAULT '365',
  `nodetype` int(11) NOT NULL DEFAULT '0',
  `masterid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`nodeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nodes`
--

LOCK TABLES `nodes` WRITE;
/*!40000 ALTER TABLE `nodes` DISABLE KEYS */;
/*!40000 ALTER TABLE `nodes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opconditions`
--

DROP TABLE IF EXISTS `opconditions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `opconditions` (
  `opconditionid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `operationid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `conditiontype` int(11) NOT NULL DEFAULT '0',
  `operator` int(11) NOT NULL DEFAULT '0',
  `value` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`opconditionid`),
  KEY `opconditions_1` (`operationid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opconditions`
--

LOCK TABLES `opconditions` WRITE;
/*!40000 ALTER TABLE `opconditions` DISABLE KEYS */;
/*!40000 ALTER TABLE `opconditions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operations`
--

DROP TABLE IF EXISTS `operations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `operations` (
  `operationid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `actionid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `operationtype` int(11) NOT NULL DEFAULT '0',
  `object` int(11) NOT NULL DEFAULT '0',
  `objectid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `shortdata` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `longdata` blob NOT NULL,
  `esc_period` int(11) NOT NULL DEFAULT '0',
  `esc_step_from` int(11) NOT NULL DEFAULT '0',
  `esc_step_to` int(11) NOT NULL DEFAULT '0',
  `default_msg` int(11) NOT NULL DEFAULT '0',
  `evaltype` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`operationid`),
  KEY `operations_1` (`actionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operations`
--

LOCK TABLES `operations` WRITE;
/*!40000 ALTER TABLE `operations` DISABLE KEYS */;
INSERT INTO `operations` VALUES (3,2,6,0,10001,'','',0,1,1,0,0),(4,2,4,0,2,'','',0,1,1,0,0),(5,3,4,0,3,'','',0,1,1,0,0),(6,3,6,0,10002,'','',0,1,1,0,0);
/*!40000 ALTER TABLE `operations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opmediatypes`
--

DROP TABLE IF EXISTS `opmediatypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `opmediatypes` (
  `opmediatypeid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `operationid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `mediatypeid` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`opmediatypeid`),
  UNIQUE KEY `opmediatypes_1` (`operationid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opmediatypes`
--

LOCK TABLES `opmediatypes` WRITE;
/*!40000 ALTER TABLE `opmediatypes` DISABLE KEYS */;
/*!40000 ALTER TABLE `opmediatypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profiles`
--

DROP TABLE IF EXISTS `profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profiles` (
  `profileid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `userid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `idx` varchar(96) COLLATE utf8_bin NOT NULL DEFAULT '',
  `idx2` bigint(20) unsigned NOT NULL DEFAULT '0',
  `value_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `value_int` int(11) NOT NULL DEFAULT '0',
  `value_str` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `source` varchar(96) COLLATE utf8_bin NOT NULL DEFAULT '',
  `type` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`profileid`),
  KEY `profiles_1` (`userid`,`idx`,`idx2`),
  KEY `profiles_2` (`userid`,`profileid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profiles`
--

LOCK TABLES `profiles` WRITE;
/*!40000 ALTER TABLE `profiles` DISABLE KEYS */;
INSERT INTO `profiles` VALUES (1,2,'web.menu.login.last',0,0,0,'index.php','',3),(2,2,'web.paging.lastpage',0,0,0,'index.php','',3),(3,1,'web.menu.login.last',0,0,0,'index.php','',3),(4,1,'web.paging.lastpage',0,0,0,'httpdetails.php','',3),(5,1,'web.menu.view.last',0,0,0,'httpmon.php','',3),(6,1,'web.overview.view.style',0,0,1,'','',2),(7,1,'web.overview.type',0,0,0,'','',2),(8,1,'web.menu.cm.last',0,0,0,'hostprofiles.php','',3),(9,1,'web.hostprofiles.php.sort',0,0,0,'host','',3),(10,1,'web.hostprofiles.php.sortorder',0,0,0,'ASC','',3),(11,1,'web.paging.start',0,0,0,'','',2),(12,1,'web.menu.config.last',0,0,0,'httpconf.php','',3),(13,1,'web.hosts.php.sort',0,0,0,'host','',3),(14,1,'web.hosts.php.sortorder',0,0,0,'ASC','',3),(15,1,'web.httpconf.php.sort',0,0,0,'name','',3),(16,1,'web.httpconf.php.sortorder',0,0,0,'DESC','',3),(17,1,'web.httpconf.showdisabled',0,0,0,'0','',3),(18,1,'web.config.groupid',0,6,0,'','',1),(19,1,'web.latest.groupid',0,6,0,'','',1),(20,1,'web.config.hostid',0,10048,0,'','',1),(21,1,'web.latest.hostid',0,0,0,'','',1),(22,1,'HOST_PORT',0,0,10050,'','',2),(23,1,'web.applications.php.sort',0,0,0,'name','',3),(24,1,'web.applications.php.sortorder',0,0,0,'ASC','',3),(25,1,'web.items.php.sort',0,0,0,'description','',3),(26,1,'web.items.php.sortorder',0,0,0,'ASC','',3),(27,1,'web.items.filter_group',0,0,0,'','',3),(28,1,'web.items.filter_host',0,0,0,'Jenkins server','',3),(29,1,'web.items.filter_application',0,0,0,'','',3),(30,1,'web.items.filter_description',0,0,0,'','',3),(31,1,'web.items.filter_type',0,0,-1,'','',2),(32,1,'web.items.filter_key',0,0,0,'','',3),(33,1,'web.items.filter_snmp_community',0,0,0,'','',3),(34,1,'web.items.filter_snmpv3_securityname',0,0,0,'','',3),(35,1,'web.items.filter_snmp_oid',0,0,0,'','',3),(36,1,'web.items.filter_snmp_port',0,0,0,'','',3),(37,1,'web.items.filter_value_type',0,0,-1,'','',2),(38,1,'web.items.filter_data_type',0,0,-1,'','',2),(39,1,'web.items.filter_delay',0,0,0,'','',3),(40,1,'web.items.filter_history',0,0,0,'','',3),(41,1,'web.items.filter_trends',0,0,0,'','',3),(42,1,'web.items.filter_templated_items',0,0,-1,'','',2),(43,1,'web.items.filter_with_triggers',0,0,-1,'','',2),(44,1,'web.items.filter_ipmi_sensor',0,0,0,'','',3),(45,1,'web.hostgroups.php.sort',0,0,0,'name','',3),(46,1,'web.hostgroups.php.sortorder',0,0,0,'ASC','',3),(47,1,'web.view.groupid',0,6,0,'','',1),(48,1,'web.view.hostid',0,0,0,'','',1),(49,1,'web.tr_status.php.sort',0,0,0,'lastchange','',3),(50,1,'web.tr_status.php.sortorder',0,0,0,'DESC','',3),(51,1,'web.events.source',0,0,0,'','',2),(52,1,'web.screens.elementid',0,2,0,'','',1),(53,1,'web.charts.graphid',0,3,0,'','',1),(54,1,'web.charts.graphid',0,3,0,'','',1),(55,1,'web.charts.graphid',0,3,0,'','',1),(56,1,'web.charts.graphid',0,3,0,'','',1),(57,1,'web.screens.period',2,0,3600,'','',2),(58,1,'web.screens.stime',2,0,0,'20140510061550','',3),(59,1,'web.screenconf.php.sort',0,0,0,'s.name','',3),(60,1,'web.screenconf.php.sortorder',0,0,0,'ASC','',3),(61,1,'web.screenconf.config',0,0,0,'','',2),(62,1,'web.actionconf.php.sort',0,0,0,'name','',3),(63,1,'web.actionconf.php.sortorder',0,0,0,'ASC','',3),(64,1,'web.actionconf.eventsource',0,0,0,'','',2),(65,1,'web.triggers.php.sort',0,0,0,'description','',3),(66,1,'web.triggers.php.sortorder',0,0,0,'ASC','',3),(67,1,'web.triggers.showdisabled',0,0,0,'','',2),(68,1,'web.graphs.php.sort',0,0,0,'name','',3),(69,1,'web.graphs.php.sortorder',0,0,0,'ASC','',3),(70,1,'web.menu.reports.last',0,0,0,'report1.php','',3),(71,1,'web.reports.hostid',0,10048,0,'','',1),(73,1,'web.httpmon.php.sort',0,0,0,'wt.name','',3),(74,1,'web.httpmon.php.sortorder',0,0,0,'DESC','',3),(76,1,'web.httptest.period',1,0,3600,'','',2),(77,1,'web.httptest.stime',1,0,0,'20150708140724','',3),(83,1,'web.httpconf.applications',0,176,0,'','',1),(84,1,'web.httpconf.applications',0,177,0,'','',1),(86,1,'web.httpmon.applications',0,176,0,'','',1),(87,1,'web.httpmon.applications',0,177,0,'','',1);
/*!40000 ALTER TABLE `profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proxy_autoreg_host`
--

DROP TABLE IF EXISTS `proxy_autoreg_host`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proxy_autoreg_host` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `clock` int(11) NOT NULL DEFAULT '0',
  `host` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `proxy_autoreg_host_1` (`clock`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proxy_autoreg_host`
--

LOCK TABLES `proxy_autoreg_host` WRITE;
/*!40000 ALTER TABLE `proxy_autoreg_host` DISABLE KEYS */;
/*!40000 ALTER TABLE `proxy_autoreg_host` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proxy_dhistory`
--

DROP TABLE IF EXISTS `proxy_dhistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proxy_dhistory` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `clock` int(11) NOT NULL DEFAULT '0',
  `druleid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `type` int(11) NOT NULL DEFAULT '0',
  `ip` varchar(39) COLLATE utf8_bin NOT NULL DEFAULT '',
  `port` int(11) NOT NULL DEFAULT '0',
  `key_` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `value` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `status` int(11) NOT NULL DEFAULT '0',
  `dcheckid` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `proxy_dhistory_1` (`clock`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proxy_dhistory`
--

LOCK TABLES `proxy_dhistory` WRITE;
/*!40000 ALTER TABLE `proxy_dhistory` DISABLE KEYS */;
/*!40000 ALTER TABLE `proxy_dhistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proxy_history`
--

DROP TABLE IF EXISTS `proxy_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proxy_history` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `itemid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `clock` int(11) NOT NULL DEFAULT '0',
  `timestamp` int(11) NOT NULL DEFAULT '0',
  `source` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `severity` int(11) NOT NULL DEFAULT '0',
  `value` text COLLATE utf8_bin NOT NULL,
  `logeventid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `proxy_history_1` (`clock`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proxy_history`
--

LOCK TABLES `proxy_history` WRITE;
/*!40000 ALTER TABLE `proxy_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `proxy_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `regexps`
--

DROP TABLE IF EXISTS `regexps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `regexps` (
  `regexpid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `name` varchar(128) COLLATE utf8_bin NOT NULL DEFAULT '',
  `test_string` blob NOT NULL,
  PRIMARY KEY (`regexpid`),
  KEY `regexps_1` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `regexps`
--

LOCK TABLES `regexps` WRITE;
/*!40000 ALTER TABLE `regexps` DISABLE KEYS */;
/*!40000 ALTER TABLE `regexps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rights`
--

DROP TABLE IF EXISTS `rights`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rights` (
  `rightid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `groupid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `permission` int(11) NOT NULL DEFAULT '0',
  `id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`rightid`),
  KEY `rights_1` (`groupid`),
  KEY `rights_2` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rights`
--

LOCK TABLES `rights` WRITE;
/*!40000 ALTER TABLE `rights` DISABLE KEYS */;
/*!40000 ALTER TABLE `rights` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `screens`
--

DROP TABLE IF EXISTS `screens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `screens` (
  `screenid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT 'Screen',
  `hsize` int(11) NOT NULL DEFAULT '1',
  `vsize` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`screenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `screens`
--

LOCK TABLES `screens` WRITE;
/*!40000 ALTER TABLE `screens` DISABLE KEYS */;
INSERT INTO `screens` VALUES (2,'Zabbix server',2,3),(3,'Jenkins',1,1);
/*!40000 ALTER TABLE `screens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `screens_items`
--

DROP TABLE IF EXISTS `screens_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `screens_items` (
  `screenitemid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `screenid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `resourcetype` int(11) NOT NULL DEFAULT '0',
  `resourceid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `width` int(11) NOT NULL DEFAULT '320',
  `height` int(11) NOT NULL DEFAULT '200',
  `x` int(11) NOT NULL DEFAULT '0',
  `y` int(11) NOT NULL DEFAULT '0',
  `colspan` int(11) NOT NULL DEFAULT '0',
  `rowspan` int(11) NOT NULL DEFAULT '0',
  `elements` int(11) NOT NULL DEFAULT '25',
  `valign` int(11) NOT NULL DEFAULT '0',
  `halign` int(11) NOT NULL DEFAULT '0',
  `style` int(11) NOT NULL DEFAULT '0',
  `url` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `dynamic` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`screenitemid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `screens_items`
--

LOCK TABLES `screens_items` WRITE;
/*!40000 ALTER TABLE `screens_items` DISABLE KEYS */;
INSERT INTO `screens_items` VALUES (2,2,2,2,0,0,0,0,2,0,0,0,0,0,'',0),(4,2,0,2,400,100,0,1,0,0,0,0,0,0,'',0),(5,2,0,3,400,100,1,1,0,0,0,0,0,0,'',0),(6,2,0,4,400,100,0,2,0,0,0,0,0,0,'',0),(7,2,0,5,400,100,1,2,0,0,0,0,0,0,'',0);
/*!40000 ALTER TABLE `screens_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scripts`
--

DROP TABLE IF EXISTS `scripts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scripts` (
  `scriptid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `command` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `host_access` int(11) NOT NULL DEFAULT '2',
  `usrgrpid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `groupid` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`scriptid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scripts`
--

LOCK TABLES `scripts` WRITE;
/*!40000 ALTER TABLE `scripts` DISABLE KEYS */;
INSERT INTO `scripts` VALUES (1,'Ping','/bin/ping -c 3 {HOST.CONN}',2,0,0),(2,'Traceroute','/bin/traceroute {HOST.CONN}',2,0,0);
/*!40000 ALTER TABLE `scripts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_alarms`
--

DROP TABLE IF EXISTS `service_alarms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `service_alarms` (
  `servicealarmid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `serviceid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `clock` int(11) NOT NULL DEFAULT '0',
  `value` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`servicealarmid`),
  KEY `service_alarms_1` (`serviceid`,`clock`),
  KEY `service_alarms_2` (`clock`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_alarms`
--

LOCK TABLES `service_alarms` WRITE;
/*!40000 ALTER TABLE `service_alarms` DISABLE KEYS */;
/*!40000 ALTER TABLE `service_alarms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `services`
--

DROP TABLE IF EXISTS `services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `services` (
  `serviceid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `name` varchar(128) COLLATE utf8_bin NOT NULL DEFAULT '',
  `status` int(11) NOT NULL DEFAULT '0',
  `algorithm` int(11) NOT NULL DEFAULT '0',
  `triggerid` bigint(20) unsigned DEFAULT NULL,
  `showsla` int(11) NOT NULL DEFAULT '0',
  `goodsla` double(16,4) NOT NULL DEFAULT '99.9000',
  `sortorder` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`serviceid`),
  KEY `services_1` (`triggerid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `services`
--

LOCK TABLES `services` WRITE;
/*!40000 ALTER TABLE `services` DISABLE KEYS */;
/*!40000 ALTER TABLE `services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `services_links`
--

DROP TABLE IF EXISTS `services_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `services_links` (
  `linkid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `serviceupid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `servicedownid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `soft` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`linkid`),
  UNIQUE KEY `services_links_links_2` (`serviceupid`,`servicedownid`),
  KEY `services_links_links_1` (`servicedownid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `services_links`
--

LOCK TABLES `services_links` WRITE;
/*!40000 ALTER TABLE `services_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `services_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `services_times`
--

DROP TABLE IF EXISTS `services_times`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `services_times` (
  `timeid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `serviceid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `type` int(11) NOT NULL DEFAULT '0',
  `ts_from` int(11) NOT NULL DEFAULT '0',
  `ts_to` int(11) NOT NULL DEFAULT '0',
  `note` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`timeid`),
  KEY `services_times_times_1` (`serviceid`,`type`,`ts_from`,`ts_to`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `services_times`
--

LOCK TABLES `services_times` WRITE;
/*!40000 ALTER TABLE `services_times` DISABLE KEYS */;
/*!40000 ALTER TABLE `services_times` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessions` (
  `sessionid` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `userid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `lastaccess` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`sessionid`),
  KEY `sessions_1` (`userid`,`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES ('7aa9148ca3e6c1bd45e963669c4098fc',2,1404842637,1),('88d2ad501eafbd5345dfc6d0fafd6b38',2,1404842640,0),('9bb16cad938f408f9d18dd79d5094fc0',1,1404843261,0);
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `slides`
--

DROP TABLE IF EXISTS `slides`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `slides` (
  `slideid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `slideshowid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `screenid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `step` int(11) NOT NULL DEFAULT '0',
  `delay` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`slideid`),
  KEY `slides_slides_1` (`slideshowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slides`
--

LOCK TABLES `slides` WRITE;
/*!40000 ALTER TABLE `slides` DISABLE KEYS */;
/*!40000 ALTER TABLE `slides` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `slideshows`
--

DROP TABLE IF EXISTS `slideshows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `slideshows` (
  `slideshowid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `delay` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`slideshowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slideshows`
--

LOCK TABLES `slideshows` WRITE;
/*!40000 ALTER TABLE `slideshows` DISABLE KEYS */;
/*!40000 ALTER TABLE `slideshows` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sysmaps`
--

DROP TABLE IF EXISTS `sysmaps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sysmaps` (
  `sysmapid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `name` varchar(128) COLLATE utf8_bin NOT NULL DEFAULT '',
  `width` int(11) NOT NULL DEFAULT '0',
  `height` int(11) NOT NULL DEFAULT '0',
  `backgroundid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `label_type` int(11) NOT NULL DEFAULT '0',
  `label_location` int(11) NOT NULL DEFAULT '0',
  `highlight` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`sysmapid`),
  KEY `sysmaps_1` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sysmaps`
--

LOCK TABLES `sysmaps` WRITE;
/*!40000 ALTER TABLE `sysmaps` DISABLE KEYS */;
INSERT INTO `sysmaps` VALUES (2,'Local network',980,200,0,1,2,0);
/*!40000 ALTER TABLE `sysmaps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sysmaps_elements`
--

DROP TABLE IF EXISTS `sysmaps_elements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sysmaps_elements` (
  `selementid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `sysmapid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `elementid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `elementtype` int(11) NOT NULL DEFAULT '0',
  `iconid_off` bigint(20) unsigned NOT NULL DEFAULT '0',
  `iconid_on` bigint(20) unsigned NOT NULL DEFAULT '0',
  `iconid_unknown` bigint(20) unsigned NOT NULL DEFAULT '0',
  `label` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `label_location` int(11) DEFAULT NULL,
  `x` int(11) NOT NULL DEFAULT '0',
  `y` int(11) NOT NULL DEFAULT '0',
  `url` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `iconid_disabled` bigint(20) unsigned NOT NULL DEFAULT '0',
  `iconid_maintenance` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`selementid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sysmaps_elements`
--

LOCK TABLES `sysmaps_elements` WRITE;
/*!40000 ALTER TABLE `sysmaps_elements` DISABLE KEYS */;
INSERT INTO `sysmaps_elements` VALUES (2,2,10017,0,19,0,0,'Zabbix server',NULL,100,100,'',0,0);
/*!40000 ALTER TABLE `sysmaps_elements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sysmaps_link_triggers`
--

DROP TABLE IF EXISTS `sysmaps_link_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sysmaps_link_triggers` (
  `linktriggerid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `linkid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `triggerid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `drawtype` int(11) NOT NULL DEFAULT '0',
  `color` varchar(6) COLLATE utf8_bin NOT NULL DEFAULT '000000',
  PRIMARY KEY (`linktriggerid`),
  UNIQUE KEY `sysmaps_link_triggers_1` (`linkid`,`triggerid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sysmaps_link_triggers`
--

LOCK TABLES `sysmaps_link_triggers` WRITE;
/*!40000 ALTER TABLE `sysmaps_link_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `sysmaps_link_triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sysmaps_links`
--

DROP TABLE IF EXISTS `sysmaps_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sysmaps_links` (
  `linkid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `sysmapid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `selementid1` bigint(20) unsigned NOT NULL DEFAULT '0',
  `selementid2` bigint(20) unsigned NOT NULL DEFAULT '0',
  `drawtype` int(11) NOT NULL DEFAULT '0',
  `color` varchar(6) COLLATE utf8_bin NOT NULL DEFAULT '000000',
  `label` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`linkid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sysmaps_links`
--

LOCK TABLES `sysmaps_links` WRITE;
/*!40000 ALTER TABLE `sysmaps_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `sysmaps_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `timeperiods`
--

DROP TABLE IF EXISTS `timeperiods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `timeperiods` (
  `timeperiodid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `timeperiod_type` int(11) NOT NULL DEFAULT '0',
  `every` int(11) NOT NULL DEFAULT '0',
  `month` int(11) NOT NULL DEFAULT '0',
  `dayofweek` int(11) NOT NULL DEFAULT '0',
  `day` int(11) NOT NULL DEFAULT '0',
  `start_time` int(11) NOT NULL DEFAULT '0',
  `period` int(11) NOT NULL DEFAULT '0',
  `start_date` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`timeperiodid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `timeperiods`
--

LOCK TABLES `timeperiods` WRITE;
/*!40000 ALTER TABLE `timeperiods` DISABLE KEYS */;
/*!40000 ALTER TABLE `timeperiods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trends`
--

DROP TABLE IF EXISTS `trends`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trends` (
  `itemid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `clock` int(11) NOT NULL DEFAULT '0',
  `num` int(11) NOT NULL DEFAULT '0',
  `value_min` double(16,4) NOT NULL DEFAULT '0.0000',
  `value_avg` double(16,4) NOT NULL DEFAULT '0.0000',
  `value_max` double(16,4) NOT NULL DEFAULT '0.0000',
  PRIMARY KEY (`itemid`,`clock`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trends`
--

LOCK TABLES `trends` WRITE;
/*!40000 ALTER TABLE `trends` DISABLE KEYS */;
INSERT INTO `trends` VALUES (22163,1404817200,2,64986.0000,127770.5000,190555.0000),(22164,1404817200,2,0.0541,0.1088,0.1635),(22166,1404817200,2,64986.0000,127770.5000,190555.0000);
/*!40000 ALTER TABLE `trends` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trends_uint`
--

DROP TABLE IF EXISTS `trends_uint`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trends_uint` (
  `itemid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `clock` int(11) NOT NULL DEFAULT '0',
  `num` int(11) NOT NULL DEFAULT '0',
  `value_min` bigint(20) unsigned NOT NULL DEFAULT '0',
  `value_avg` bigint(20) unsigned NOT NULL DEFAULT '0',
  `value_max` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`itemid`,`clock`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trends_uint`
--

LOCK TABLES `trends_uint` WRITE;
/*!40000 ALTER TABLE `trends_uint` DISABLE KEYS */;
INSERT INTO `trends_uint` VALUES (22162,1404813600,95,0,0,1),(22162,1404817200,120,1,1,1),(22165,1404817200,2,200,200,200),(22167,1404817200,2,0,0,0);
/*!40000 ALTER TABLE `trends_uint` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trigger_depends`
--

DROP TABLE IF EXISTS `trigger_depends`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trigger_depends` (
  `triggerdepid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `triggerid_down` bigint(20) unsigned NOT NULL DEFAULT '0',
  `triggerid_up` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`triggerdepid`),
  KEY `trigger_depends_1` (`triggerid_down`,`triggerid_up`),
  KEY `trigger_depends_2` (`triggerid_up`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trigger_depends`
--

LOCK TABLES `trigger_depends` WRITE;
/*!40000 ALTER TABLE `trigger_depends` DISABLE KEYS */;
/*!40000 ALTER TABLE `trigger_depends` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `triggers`
--

DROP TABLE IF EXISTS `triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `triggers` (
  `triggerid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `expression` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `description` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `url` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `status` int(11) NOT NULL DEFAULT '0',
  `value` int(11) NOT NULL DEFAULT '0',
  `priority` int(11) NOT NULL DEFAULT '0',
  `lastchange` int(11) NOT NULL DEFAULT '0',
  `dep_level` int(11) NOT NULL DEFAULT '0',
  `comments` blob NOT NULL,
  `error` varchar(128) COLLATE utf8_bin NOT NULL DEFAULT '',
  `templateid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `type` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`triggerid`),
  KEY `triggers_1` (`status`),
  KEY `triggers_2` (`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `triggers`
--

LOCK TABLES `triggers` WRITE;
/*!40000 ALTER TABLE `triggers` DISABLE KEYS */;
INSERT INTO `triggers` VALUES (10001,'{10211}<10000','Lack of free memory on server {HOSTNAME}','',0,2,3,0,0,'','',0,0),(10002,'{11277}<10','Low free disk space on {HOSTNAME} volume /','',0,2,4,0,0,'','',0,0),(10004,'{11285}<10','Low free disk space on {HOSTNAME} volume /usr','',0,2,4,0,0,'','',0,0),(10005,'{11289}<10','Low number of free inodes on {HOSTNAME} volume /','',0,2,4,0,0,'','',0,0),(10006,'{11293}<10','Low number of free inodes on {HOSTNAME} volume /opt','',0,2,4,0,0,'','',0,0),(10007,'{11297}<10','Low number of free inodes on {HOSTNAME} volume /tmp','',0,2,4,0,0,'','',0,0),(10008,'{11295}<10','Low number of free inodes on {HOSTNAME} volume /usr','',0,2,4,0,0,'','',0,0),(10010,'{10010}>5','Processor load is too high on {HOSTNAME}','',0,2,3,0,0,'','',0,0),(10011,'{10234}>10','Too many processes running on {HOSTNAME}','',0,2,3,0,0,'','',0,0),(10012,'{10212}<100000','Lack of free swap space on {HOSTNAME}','',0,2,4,0,0,'','',0,0),(10013,'{10013}>50','Too many users connected on server {HOSTNAME}','',0,2,3,0,0,'','',0,0),(10014,'{10197}>0','/etc/inetd.conf has been changed on server {HOSTNAME}','',0,2,2,0,0,'','',0,0),(10015,'{10201}>0','/boot/vmlinuz has been changed on server {HOSTNAME}','',0,2,2,0,0,'','',0,0),(10016,'{10199}>0','/etc/passwd has been changed on server {HOSTNAME}','',0,2,3,0,0,'','',0,0),(10017,'{11279}<10','Low free disk space on {HOSTNAME} volume /home','',0,2,4,0,0,'','',0,0),(10018,'{11291}<10','Low number of free inodes on {HOSTNAME} volume /home','',0,2,4,0,0,'','',0,0),(10019,'{11287}<10','Low free disk space on {HOSTNAME} volume /var','',0,2,4,0,0,'','',0,0),(10020,'{11281}<10','Low free disk space on {HOSTNAME} volume /opt','',0,2,4,0,0,'','',0,0),(10021,'{10196}<600','{HOSTNAME} has just been restarted','',0,2,1,0,0,'','',0,0),(10022,'{10205}=0','Email (SMTP) server is down on {HOSTNAME}','',0,2,3,0,0,'','',0,0),(10023,'{10206}=0','FTP server is down on {HOSTNAME}','',0,2,3,0,0,'','',0,0),(10024,'{10229}=0','SSH server is down on {HOSTNAME}','',0,2,3,0,0,'','',0,0),(10027,'{10227}=0','POP3 server is down on {HOSTNAME}','',0,2,3,0,0,'','',0,0),(10028,'{10209}=0','IMAP server is down on {HOSTNAME}','',0,2,3,0,0,'','',0,0),(10029,'{10200}>0','/usr/sbin/sshd has been changed on server {HOSTNAME}','',0,2,3,0,0,'','',0,0),(10030,'{10030}>0','/usr/bin/ssh has been changed on server {HOSTNAME}','',0,2,3,0,0,'','',0,0),(10031,'{10198}>0','/etc/services has been changed on server {HOSTNAME}','',0,2,3,0,0,'','',0,0),(10032,'{10226}=0','News (NNTP) server is down on {HOSTNAME}','',0,2,3,0,0,'','',0,0),(10033,'{10210}<1','Inetd is not running on {HOSTNAME}','',0,2,3,0,0,'','',0,0),(10034,'{10202}<1','Apache is not running on {HOSTNAME}','',0,2,3,0,0,'','',0,0),(10035,'{10225}<1','Mysql is not running on {HOSTNAME}','',0,2,3,0,0,'','',0,0),(10036,'{10231}<1','Syslogd is not running on {HOSTNAME}','',0,2,3,0,0,'','',0,0),(10037,'{10230}<1','Sshd is not running on {HOSTNAME}','',0,2,3,0,0,'','',0,0),(10038,'{10237}<1','Zabbix_agentd is not running on {HOSTNAME}','',0,2,3,0,0,'','',0,0),(10039,'{10238}<1','Zabbix_server is not running on {HOSTNAME}','',0,2,3,0,0,'','',0,0),(10041,'{10204}<256','Configured max number of processes is too low on {HOSTNAME}','',0,2,1,0,0,'','',0,0),(10042,'{10203}<512','Configured max number of opened files is too low on {HOSTNAME}','',0,2,1,0,0,'','',0,0),(10043,'{10208}>0','Hostname was changed on {HOSTNAME}','',0,2,1,0,0,'','',0,0),(10044,'{10207}>0','Host information was changed on {HOSTNAME}','',0,2,1,0,0,'','',0,0),(10045,'{10235}>0','Version of zabbix_agent(d) was changed on {HOSTNAME}','',0,2,3,0,0,'','',0,0),(10046,'{10236}=0','WEB (HTTP) server is down on {HOSTNAME}','',0,2,3,0,0,'','',0,0),(10047,'{10228}=2','Server {HOSTNAME} is unreachable','',0,2,4,0,0,'','',0,0),(10048,'{10048}<10000','Lack of free memory on server {HOSTNAME}','',0,2,3,0,0,'','',0,0),(10049,'{10241}<10000','Low free disk space on {HOSTNAME} volume c:','',0,2,3,0,0,'','',0,0),(10056,'{10056}>300','Too many processes on {HOSTNAME}','',0,2,3,0,0,'','',0,0),(10057,'{10057}>5','Processor load is too high on {HOSTNAME}','',0,2,3,0,0,'','',0,0),(10058,'{10058}>10','Too many processes running on {HOSTNAME}','',0,2,3,0,0,'','',0,0),(10059,'{10059}<100000','Lack of free swap space on {HOSTNAME}','',0,2,3,0,0,'','',0,0),(10061,'{10240}>0','c:\\autoexec.bat has been changed on server {HOSTNAME}','',0,2,3,0,0,'','',0,0),(10068,'{10068}<600','{HOSTNAME} has just been restarted','',0,2,3,0,0,'','',0,0),(10081,'{10081}<1','Apache is not running on {HOSTNAME}','',0,2,3,0,0,'','',0,0),(10091,'{10091}>0','Host information was changed on {HOSTNAME}','',0,2,3,0,0,'','',0,0),(10092,'{10243}>0','Version of zabbix_agent(d) was changed on {HOSTNAME}','',0,2,1,0,0,'','',0,0),(10094,'{10094}=2','Server {HOSTNAME} is unreachable','',0,2,3,0,0,'','',0,0),(10163,'{11263}#1','Email (SMTP) server is down on {HOSTNAME}','',0,2,3,0,0,'','',0,0),(10164,'{11265}#1','FTP server is down on {HOSTNAME}','',0,2,3,0,0,'','',0,0),(10165,'{11273}#1','SSH server is down on {HOSTNAME}','',0,2,3,0,0,'','',0,0),(10168,'{11271}#1','POP3 server is down on {HOSTNAME}','',0,2,3,0,0,'','',0,0),(10169,'{11267}#1','IMAP server is down on {HOSTNAME}','',0,2,3,0,0,'','',0,0),(10173,'{11269}#1','News (NNTP) server is down on {HOSTNAME}','',0,2,3,0,0,'','',0,0),(10187,'{11275}#1','WEB (HTTP) server is down on {HOSTNAME}','',0,2,3,0,0,'','',0,0),(10189,'{11283}<10','Low free disk space on {HOSTNAME} volume /tmp','',0,2,4,0,0,'','',0,0),(10190,'{10233}>300','Too many processes on {HOSTNAME}','',0,2,4,0,0,'','',0,0),(10191,'{10242}<10000','Low free disk space on {HOSTNAME} volume d:','',0,2,3,0,0,'','',0,0),(12001,'{11001}=1','sysName on {HOSTNAME} has Changed','',0,2,3,0,0,'','',0,0),(12002,'{11002}=1','lenvSerialNumber on {HOSTNAME} has Changed','',0,2,3,0,0,'','',0,0),(12003,'{11003}>0','lmemBufferNoMem on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12004,'{11004}>75','lcpuPercentBusy on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12005,'{11005}=1','lenvFirmVersion on {HOSTNAME} has Changed','',0,2,3,0,0,'','',0,0),(12006,'{11006}>0','lmemBufferFail on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12007,'{11007}<10240','lmemFreeMem on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12008,'{11008}=1','lmemRomID on {HOSTNAME} has Changed','',0,2,3,0,0,'','',0,0),(12009,'{11009}=1','ifDescr1 on {HOSTNAME} has Changed','',0,2,3,0,0,'','',0,0),(12010,'{11010}=1','ifDescr2 on {HOSTNAME} has Changed','',0,2,3,0,0,'','',0,0),(12011,'{11011}=1','ifDescr3 on {HOSTNAME} has Changed','',0,2,3,0,0,'','',0,0),(12012,'{11012}=1','ifDescr4 on {HOSTNAME} has Changed','',0,2,3,0,0,'','',0,0),(12013,'{11013}=1','ifDescr5 on {HOSTNAME} has Changed','',0,2,3,0,0,'','',0,0),(12014,'{11014}=1','ifDescr6 on {HOSTNAME} has Changed','',0,2,3,0,0,'','',0,0),(12015,'{11015}=1','ifDescr7 on {HOSTNAME} has Changed','',0,2,3,0,0,'','',0,0),(12016,'{11016}=1','ifDescr8 on {HOSTNAME} has Changed','',0,2,3,0,0,'','',0,0),(12017,'{11017}=1','ifDescr9 on {HOSTNAME} has Changed','',0,2,3,0,0,'','',0,0),(12018,'{11018}=1','ifDescr10 on {HOSTNAME} has Changed','',0,2,3,0,0,'','',0,0),(12019,'{11019}=1','ifDescr11 on {HOSTNAME} has Changed','',0,2,3,0,0,'','',0,0),(12020,'{11020}=1','ifDescr12 on {HOSTNAME} has Changed','',0,2,3,0,0,'','',0,0),(12021,'{11021}=1','ifDescr13 on {HOSTNAME} has Changed','',0,2,3,0,0,'','',0,0),(12022,'{11022}=1','ifDescr14 on {HOSTNAME} has Changed','',0,2,3,0,0,'','',0,0),(12023,'{11023}=1','ifDescr15 on {HOSTNAME} has Changed','',0,2,3,0,0,'','',0,0),(12024,'{11024}=1','ifDescr16 on {HOSTNAME} has Changed','',0,2,3,0,0,'','',0,0),(12025,'{11025}=1','ifDescr17 on {HOSTNAME} has Changed','',0,2,3,0,0,'','',0,0),(12026,'{11026}=1','ifDescr18 on {HOSTNAME} has Changed','',0,2,3,0,0,'','',0,0),(12027,'{11027}=1','ifDescr19 on {HOSTNAME} has Changed','',0,2,3,0,0,'','',0,0),(12028,'{11028}=1','ifDescr20 on {HOSTNAME} has Changed','',0,2,3,0,0,'','',0,0),(12029,'{11029}=1','ifDescr21 on {HOSTNAME} has Changed','',0,2,3,0,0,'','',0,0),(12030,'{11030}=1','ifDescr22 on {HOSTNAME} has Changed','',0,2,3,0,0,'','',0,0),(12031,'{11031}=1','ifDescr23 on {HOSTNAME} has Changed','',0,2,3,0,0,'','',0,0),(12032,'{11032}=1','ifDescr24 on {HOSTNAME} has Changed','',0,2,3,0,0,'','',0,0),(12033,'{11033}=1','ifDescr25 on {HOSTNAME} has Changed','',0,2,3,0,0,'','',0,0),(12034,'{11034}=1','ifDescr26 on {HOSTNAME} has Changed','',0,2,3,0,0,'','',0,0),(12035,'{11035}=1','ifDescr27 on {HOSTNAME} has Changed','',0,2,3,0,0,'','',0,0),(12036,'{11036}=1','ifDescr28 on {HOSTNAME} has Changed','',0,2,3,0,0,'','',0,0),(12037,'{11037}=1','ifDescr29 on {HOSTNAME} has Changed','',0,2,3,0,0,'','',0,0),(12038,'{11038}=1','ifDescr30 on {HOSTNAME} has Changed','',0,2,3,0,0,'','',0,0),(12039,'{11039}=1','ifDescr31 on {HOSTNAME} has Changed','',0,2,3,0,0,'','',0,0),(12040,'{11040}=1','ifDescr32 on {HOSTNAME} has Changed','',0,2,3,0,0,'','',0,0),(12041,'{11041}=1','ifDescr33 on {HOSTNAME} has Changed','',0,2,3,0,0,'','',0,0),(12042,'{11042}=1','ifDescr34 on {HOSTNAME} has Changed','',0,2,3,0,0,'','',0,0),(12043,'{11043}=1','ifDescr35 on {HOSTNAME} has Changed','',0,2,3,0,0,'','',0,0),(12044,'{11044}=1','ifDescr36 on {HOSTNAME} has Changed','',0,2,3,0,0,'','',0,0),(12045,'{11045}=1','ifDescr37 on {HOSTNAME} has Changed','',0,2,3,0,0,'','',0,0),(12046,'{11046}=1','ifDescr38 on {HOSTNAME} has Changed','',0,2,3,0,0,'','',0,0),(12047,'{11047}=1','ifDescr39 on {HOSTNAME} has Changed','',0,2,3,0,0,'','',0,0),(12048,'{11048}=1','ifDescr40 on {HOSTNAME} has Changed','',0,2,3,0,0,'','',0,0),(12049,'{11049}=1','ifDescr41 on {HOSTNAME} has Changed','',0,2,3,0,0,'','',0,0),(12050,'{11050}=1','ifDescr42 on {HOSTNAME} has Changed','',0,2,3,0,0,'','',0,0),(12051,'{11051}=1','ifDescr43 on {HOSTNAME} has Changed','',0,2,3,0,0,'','',0,0),(12052,'{11052}=1','ifDescr44 on {HOSTNAME} has Changed','',0,2,3,0,0,'','',0,0),(12053,'{11053}=1','ifDescr45 on {HOSTNAME} has Changed','',0,2,3,0,0,'','',0,0),(12054,'{11054}=1','ifDescr46 on {HOSTNAME} has Changed','',0,2,3,0,0,'','',0,0),(12055,'{11055}=1','ifDescr47 on {HOSTNAME} has Changed','',0,2,3,0,0,'','',0,0),(12056,'{11056}=1','ifDescr48 on {HOSTNAME} has Changed','',0,2,3,0,0,'','',0,0),(12057,'{11057}=1','ifDescr49 on {HOSTNAME} has Changed','',0,2,3,0,0,'','',0,0),(12058,'{11058}=1','ifDescr50 on {HOSTNAME} has Changed','',0,2,3,0,0,'','',0,0),(12059,'{11059}=1','ifDescr51 on {HOSTNAME} has Changed','',0,2,3,0,0,'','',0,0),(12060,'{11060}>150000','ifInOctets1 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12061,'{11061}>150000','ifInOctets2 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12062,'{11062}>150000','ifInOctets3 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12063,'{11063}>150000','ifInOctets4 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12064,'{11064}>150000','ifInOctets5 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12065,'{11065}>150000','ifInOctets6 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12066,'{11066}>150000','ifInOctets7 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12067,'{11067}>150000','ifInOctets8 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12068,'{11068}>150000','ifInOctets9 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12069,'{11069}>150000','ifInOctets10 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12070,'{11070}>150000','ifInOctets11 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12071,'{11071}>150000','ifInOctets12 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12072,'{11072}>150000','ifInOctets13 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12073,'{11073}>150000','ifInOctets14 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12074,'{11074}>150000','ifInOctets15 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12075,'{11075}>150000','ifInOctets16 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12076,'{11076}>150000','ifInOctets17 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12077,'{11077}>150000','ifInOctets18 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12078,'{11078}>150000','ifInOctets19 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12079,'{11079}>150000','ifInOctets20 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12080,'{11080}>150000','ifInOctets21 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12081,'{11081}>150000','ifInOctets22 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12082,'{11082}>150000','ifInOctets23 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12083,'{11083}>150000','ifInOctets24 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12084,'{11084}>150000','ifInOctets25 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12085,'{11085}>150000','ifInOctets26 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12086,'{11086}>150000','ifInOctets27 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12087,'{11087}>150000','ifInOctets28 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12088,'{11088}>150000','ifInOctets29 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12089,'{11089}>150000','ifInOctets30 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12090,'{11090}>150000','ifInOctets31 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12091,'{11091}>150000','ifInOctets32 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12092,'{11092}>150000','ifInOctets33 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12093,'{11093}>150000','ifInOctets34 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12094,'{11094}>150000','ifInOctets35 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12095,'{11095}>150000','ifInOctets36 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12096,'{11096}>150000','ifInOctets37 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12097,'{11097}>150000','ifInOctets38 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12098,'{11098}>150000','ifInOctets39 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12099,'{11099}>150000','ifInOctets40 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12100,'{11100}>150000','ifInOctets41 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12101,'{11101}>150000','ifInOctets42 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12102,'{11102}>150000','ifInOctets43 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12103,'{11103}>150000','ifInOctets44 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12104,'{11104}>150000','ifInOctets45 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12105,'{11105}>150000','ifInOctets46 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12106,'{11106}>150000','ifInOctets47 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12107,'{11107}>150000','ifInOctets48 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12108,'{11108}>150000','ifInOctets49 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12109,'{11109}>150000','ifInOctets50 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12110,'{11110}>150000','ifInOctets51 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12111,'{11111}>150000','ifOutOctets1 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12112,'{11112}>150000','ifOutOctets2 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12113,'{11113}>150000','ifOutOctets3 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12114,'{11114}>150000','ifOutOctets4 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12115,'{11115}>150000','ifOutOctets5 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12116,'{11116}>150000','ifOutOctets6 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12117,'{11117}>150000','ifOutOctets7 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12118,'{11118}>150000','ifOutOctets8 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12119,'{11119}>150000','ifOutOctets9 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12120,'{11120}>150000','ifOutOctets10 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12121,'{11121}>150000','ifOutOctets11 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12122,'{11122}>150000','ifOutOctets12 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12123,'{11123}>150000','ifOutOctets13 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12124,'{11124}>150000','ifOutOctets14 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12125,'{11125}>150000','ifOutOctets15 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12126,'{11126}>150000','ifOutOctets16 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12127,'{11127}>150000','ifOutOctets17 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12128,'{11128}>150000','ifOutOctets18 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12129,'{11129}>150000','ifOutOctets19 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12130,'{11130}>150000','ifOutOctets20 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12131,'{11131}>150000','ifOutOctets21 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12132,'{11132}>150000','ifOutOctets22 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12133,'{11133}>150000','ifOutOctets23 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12134,'{11134}>150000','ifOutOctets24 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12135,'{11135}>150000','ifOutOctets25 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12136,'{11136}>150000','ifOutOctets26 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12137,'{11137}>150000','ifOutOctets27 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12138,'{11138}>150000','ifOutOctets28 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12139,'{11139}>150000','ifOutOctets29 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12140,'{11140}>150000','ifOutOctets30 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12141,'{11141}>150000','ifOutOctets31 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12142,'{11142}>150000','ifOutOctets32 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12143,'{11143}>150000','ifOutOctets33 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12144,'{11144}>150000','ifOutOctets34 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12145,'{11145}>150000','ifOutOctets35 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12146,'{11146}>150000','ifOutOctets36 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12147,'{11147}>150000','ifOutOctets37 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12148,'{11148}>150000','ifOutOctets38 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12149,'{11149}>150000','ifOutOctets39 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12150,'{11150}>150000','ifOutOctets40 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12151,'{11151}>150000','ifOutOctets41 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12152,'{11152}>150000','ifOutOctets42 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12153,'{11153}>150000','ifOutOctets43 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12154,'{11154}>150000','ifOutOctets44 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12155,'{11155}>150000','ifOutOctets45 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12156,'{11156}>150000','ifOutOctets46 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12157,'{11157}>150000','ifOutOctets47 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12158,'{11158}>150000','ifOutOctets48 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12159,'{11159}>150000','ifOutOctets49 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12160,'{11160}>150000','ifOutOctets50 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12161,'{11161}>150000','ifOutOctets51 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12162,'{11162}=0','ipForwarding on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12163,'{11163}>255','ipDefaultTTL on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12164,'{11164}>150000','ipInReceives on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12165,'{11165}>0','ipInHdrErrors on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12166,'{11166}>0','ipInAddrErrors on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12167,'{11167}>150000','ipInForwDatagrams on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12168,'{11168}>0','ipInUnknownProtos on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12169,'{11169}>0','ipInDiscards on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12170,'{11170}>150000','ipInDelivers on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12171,'{11171}>150000','ipOutRequests on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12172,'{11172}>0','ipOutDiscards on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12173,'{11173}>0','ipOutNoRoutes on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12174,'{11174}>0','ipReasmTimeout on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12175,'{11175}>150000','ipReasmReqds on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12176,'{11176}>150000','ipReasmOKs on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12177,'{11177}>0','ipReasmFails on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12178,'{11178}>150000','ipFragOKs on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12179,'{11179}>0','ipFragFails on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12180,'{11180}>150000','ipFragCreates on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12181,'{11181}>0','ipRoutingDiscards on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12182,'{11182}>150000','icmpInMsgs on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12183,'{11183}>0','icmpInErrors on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12184,'{11184}>0','icmpInDestUnreachs on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12185,'{11185}>1000','icmpInTimeExcds on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12186,'{11186}>0','icmpInParmProbs on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12187,'{11187}>0','icmpInSrcQuenchs on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12188,'{11188}>150000','icmpInRedirects on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12189,'{11189}>100','icmpInEchos on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12190,'{11190}>100','icmpInEchoReps on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12191,'{11191}>100','icmpInTimestamps on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12192,'{11192}>100','icmpInTimestampReps on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12193,'{11193}>100','icmpInAddrMasks on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12194,'{11194}>100','icmpInAddrMaskReps on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12195,'{11195}>150000','icmpOutMsgs on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12196,'{11196}>0','icmpOutErrors on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12197,'{11197}>0','icmpOutDesUnreachs on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12198,'{11198}>1000','icmpOutTimeExcds on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12199,'{11199}>0','icmpOutParmProbs on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12200,'{11200}>0','icmpOutSrcQuenchs on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12202,'{11202}>100','icmpOutEchos on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12203,'{11203}>100','icmpOutEchoReps on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12204,'{11204}>100','icmpOutTimestamps on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12205,'{11205}>100','icmpOutTimestampReps on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12206,'{11206}>100','icmpOutAddrMasks on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12207,'{11207}>100','icmpOutAddrMaskReps on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12208,'{11208}>1000','icmpOutRedirects on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12209,'{11298}<10000','Lack of free memory on server {HOSTNAME}','',0,2,3,0,0,'','',0,0),(12210,'{11299}<10','Low free disk space on {HOSTNAME} volume /','',0,2,4,0,0,'','',0,0),(12211,'{11300}<10','Low free disk space on {HOSTNAME} volume /usr','',0,2,4,0,0,'','',0,0),(12212,'{11301}<10','Low number of free inodes on {HOSTNAME} volume /','',0,2,4,0,0,'','',0,0),(12213,'{11302}<10','Low number of free inodes on {HOSTNAME} volume /opt','',0,2,4,0,0,'','',0,0),(12214,'{11303}<10','Low number of free inodes on {HOSTNAME} volume /tmp','',0,2,4,0,0,'','',0,0),(12215,'{11304}<10','Low number of free inodes on {HOSTNAME} volume /usr','',0,2,4,0,0,'','',0,0),(12216,'{11305}>5','Processor load is too high on {HOSTNAME}','',0,2,3,0,0,'','',0,0),(12217,'{11306}>10','Too many processes running on {HOSTNAME}','',0,2,3,0,0,'','',0,0),(12218,'{11307}<100000','Lack of free swap space on {HOSTNAME}','',0,2,4,0,0,'','',0,0),(12219,'{11308}>50','Too many users connected on server {HOSTNAME}','',0,2,3,0,0,'','',0,0),(12220,'{11309}>0','/etc/inetd.conf has been changed on server {HOSTNAME}','',0,2,2,0,0,'','',0,0),(12222,'{11311}>0','/etc/passwd has been changed on server {HOSTNAME}','',0,2,3,0,0,'','',0,0),(12223,'{11312}<10','Low free disk space on {HOSTNAME} volume /home','',0,2,4,0,0,'','',0,0),(12224,'{11313}<10','Low number of free inodes on {HOSTNAME} volume /home','',0,2,4,0,0,'','',0,0),(12225,'{11314}<10','Low free disk space on {HOSTNAME} volume /var','',0,2,4,0,0,'','',0,0),(12226,'{11315}<10','Low free disk space on {HOSTNAME} volume /opt','',0,2,4,0,0,'','',0,0),(12227,'{11316}<600','{HOSTNAME} has just been restarted','',0,2,1,0,0,'','',0,0),(12228,'{11317}=0','Email (SMTP) server is down on {HOSTNAME}','',0,2,3,0,0,'','',0,0),(12229,'{11318}=0','FTP server is down on {HOSTNAME}','',0,2,3,0,0,'','',0,0),(12230,'{11319}=0','SSH server is down on {HOSTNAME}','',0,2,3,0,0,'','',0,0),(12231,'{11320}=0','POP3 server is down on {HOSTNAME}','',0,2,3,0,0,'','',0,0),(12232,'{11321}=0','IMAP server is down on {HOSTNAME}','',0,2,3,0,0,'','',0,0),(12233,'{11322}>0','/usr/sbin/sshd has been changed on server {HOSTNAME}','',0,2,3,0,0,'','',0,0),(12234,'{11323}>0','/usr/bin/ssh has been changed on server {HOSTNAME}','',0,2,3,0,0,'','',0,0),(12235,'{11324}>0','/etc/services has been changed on server {HOSTNAME}','',0,2,3,0,0,'','',0,0),(12236,'{11325}=0','News (NNTP) server is down on {HOSTNAME}','',0,2,3,0,0,'','',0,0),(12237,'{11326}<1','Inetd is not running on {HOSTNAME}','',0,2,3,0,0,'','',0,0),(12238,'{11327}<1','Apache is not running on {HOSTNAME}','',0,2,3,0,0,'','',0,0),(12239,'{11328}<1','Mysql is not running on {HOSTNAME}','',0,2,3,0,0,'','',0,0),(12240,'{11329}<1','Syslogd is not running on {HOSTNAME}','',0,2,3,0,0,'','',0,0),(12241,'{11330}<1','Sshd is not running on {HOSTNAME}','',0,2,3,0,0,'','',0,0),(12242,'{11331}<1','Zabbix_agentd is not running on {HOSTNAME}','',0,2,3,0,0,'','',0,0),(12243,'{11332}<1','Zabbix_server is not running on {HOSTNAME}','',0,2,3,0,0,'','',0,0),(12244,'{11333}<256','Configured max number of processes is too low on {HOSTNAME}','',0,2,1,0,0,'','',0,0),(12245,'{11334}<512','Configured max number of opened files is too low on {HOSTNAME}','',0,2,1,0,0,'','',0,0),(12246,'{11335}>0','Hostname was changed on {HOSTNAME}','',0,2,1,0,0,'','',0,0),(12247,'{11336}>0','Host information was changed on {HOSTNAME}','',0,2,1,0,0,'','',0,0),(12248,'{11337}>0','Version of zabbix_agent(d) was changed on {HOSTNAME}','',0,2,3,0,0,'','',0,0),(12249,'{11338}=0','WEB (HTTP) server is down on {HOSTNAME}','',0,2,3,0,0,'','',0,0),(12250,'{11339}=2','Server {HOSTNAME} is unreachable','',0,2,4,0,0,'','',0,0),(12251,'{11340}<10','Low free disk space on {HOSTNAME} volume /tmp','',0,2,4,0,0,'','',0,0),(12252,'{11341}>300','Too many processes on {HOSTNAME}','',0,2,4,0,0,'','',0,0),(12253,'{11342}<10000','Lack of free memory on server {HOSTNAME}','',0,2,3,0,0,'','',0,0),(12254,'{11343}<10','Low free disk space on {HOSTNAME} volume /','',0,2,4,0,0,'','',0,0),(12255,'{11344}<10','Low free disk space on {HOSTNAME} volume /usr','',0,2,4,0,0,'','',0,0),(12256,'{11345}<10','Low number of free inodes on {HOSTNAME} volume /','',0,2,4,0,0,'','',0,0),(12257,'{11346}<10','Low number of free inodes on {HOSTNAME} volume /opt','',0,2,4,0,0,'','',0,0),(12258,'{11347}<10','Low number of free inodes on {HOSTNAME} volume /tmp','',0,2,4,0,0,'','',0,0),(12259,'{11348}<10','Low number of free inodes on {HOSTNAME} volume /usr','',0,2,4,0,0,'','',0,0),(12260,'{11349}>5','Processor load is too high on {HOSTNAME}','',0,2,3,0,0,'','',0,0),(12261,'{11350}>10','Too many processes running on {HOSTNAME}','',0,2,3,0,0,'','',0,0),(12262,'{11351}<100000','Lack of free swap space on {HOSTNAME}','',0,2,4,0,0,'','',0,0),(12263,'{11352}>50','Too many users connected on server {HOSTNAME}','',0,2,3,0,0,'','',0,0),(12264,'{11353}>0','/etc/inetd.conf has been changed on server {HOSTNAME}','',0,2,2,0,0,'','',0,0),(12266,'{11355}>0','/etc/passwd has been changed on server {HOSTNAME}','',0,2,3,0,0,'','',0,0),(12267,'{11356}<10','Low free disk space on {HOSTNAME} volume /home','',0,2,4,0,0,'','',0,0),(12268,'{11357}<10','Low number of free inodes on {HOSTNAME} volume /home','',0,2,4,0,0,'','',0,0),(12269,'{11358}<10','Low free disk space on {HOSTNAME} volume /var','',0,2,4,0,0,'','',0,0),(12270,'{11359}<10','Low free disk space on {HOSTNAME} volume /opt','',0,2,4,0,0,'','',0,0),(12271,'{11360}<600','{HOSTNAME} has just been restarted','',0,2,1,0,0,'','',0,0),(12272,'{11361}=0','Email (SMTP) server is down on {HOSTNAME}','',0,2,3,0,0,'','',0,0),(12273,'{11362}=0','FTP server is down on {HOSTNAME}','',0,2,3,0,0,'','',0,0),(12274,'{11363}=0','SSH server is down on {HOSTNAME}','',0,2,3,0,0,'','',0,0),(12275,'{11364}=0','POP3 server is down on {HOSTNAME}','',0,2,3,0,0,'','',0,0),(12276,'{11365}=0','IMAP server is down on {HOSTNAME}','',0,2,3,0,0,'','',0,0),(12277,'{11366}>0','/usr/sbin/sshd has been changed on server {HOSTNAME}','',0,2,3,0,0,'','',0,0),(12278,'{11367}>0','/usr/bin/ssh has been changed on server {HOSTNAME}','',0,2,3,0,0,'','',0,0),(12279,'{11368}>0','/etc/services has been changed on server {HOSTNAME}','',0,2,3,0,0,'','',0,0),(12280,'{11369}=0','News (NNTP) server is down on {HOSTNAME}','',0,2,3,0,0,'','',0,0),(12281,'{11370}<1','Inetd is not running on {HOSTNAME}','',0,2,3,0,0,'','',0,0),(12282,'{11371}<1','Apache is not running on {HOSTNAME}','',0,2,3,0,0,'','',0,0),(12283,'{11372}<1','Mysql is not running on {HOSTNAME}','',0,2,3,0,0,'','',0,0),(12284,'{11373}<1','Syslogd is not running on {HOSTNAME}','',0,2,3,0,0,'','',0,0),(12285,'{11374}<1','Sshd is not running on {HOSTNAME}','',0,2,3,0,0,'','',0,0),(12286,'{11375}<1','Zabbix_agentd is not running on {HOSTNAME}','',0,2,3,0,0,'','',0,0),(12287,'{11376}<1','Zabbix_server is not running on {HOSTNAME}','',0,2,3,0,0,'','',0,0),(12288,'{11377}<256','Configured max number of processes is too low on {HOSTNAME}','',0,2,1,0,0,'','',0,0),(12289,'{11378}<512','Configured max number of opened files is too low on {HOSTNAME}','',0,2,1,0,0,'','',0,0),(12290,'{11379}>0','Hostname was changed on {HOSTNAME}','',0,2,1,0,0,'','',0,0),(12291,'{11380}>0','Host information was changed on {HOSTNAME}','',0,2,1,0,0,'','',0,0),(12292,'{11381}>0','Version of zabbix_agent(d) was changed on {HOSTNAME}','',0,2,3,0,0,'','',0,0),(12293,'{11382}=0','WEB (HTTP) server is down on {HOSTNAME}','',0,2,3,0,0,'','',0,0),(12294,'{11383}=2','Server {HOSTNAME} is unreachable','',0,2,4,0,0,'','',0,0),(12295,'{11384}<10','Low free disk space on {HOSTNAME} volume /tmp','',0,2,4,0,0,'','',0,0),(12296,'{11385}>300','Too many processes on {HOSTNAME}','',0,2,4,0,0,'','',0,0),(12297,'{11386}<10000','Lack of free memory on server {HOSTNAME}','',0,2,3,0,0,'','',0,0),(12298,'{11387}<10','Low free disk space on {HOSTNAME} volume /','',0,2,4,0,0,'','',0,0),(12299,'{11388}<10','Low free disk space on {HOSTNAME} volume /usr','',0,2,4,0,0,'','',0,0),(12300,'{11389}<10','Low number of free inodes on {HOSTNAME} volume /','',0,2,4,0,0,'','',0,0),(12301,'{11390}<10','Low number of free inodes on {HOSTNAME} volume /opt','',0,2,4,0,0,'','',0,0),(12302,'{11391}<10','Low number of free inodes on {HOSTNAME} volume /tmp','',0,2,4,0,0,'','',0,0),(12303,'{11392}<10','Low number of free inodes on {HOSTNAME} volume /usr','',0,2,4,0,0,'','',0,0),(12304,'{11393}>5','Processor load is too high on {HOSTNAME}','',0,2,3,0,0,'','',0,0),(12305,'{11394}>10','Too many processes running on {HOSTNAME}','',0,2,3,0,0,'','',0,0),(12306,'{11395}<100000','Lack of free swap space on {HOSTNAME}','',0,2,4,0,0,'','',0,0),(12307,'{11396}>50','Too many users connected on server {HOSTNAME}','',0,2,3,0,0,'','',0,0),(12308,'{11397}>0','/etc/inetd.conf has been changed on server {HOSTNAME}','',0,2,2,0,0,'','',0,0),(12310,'{11399}>0','/etc/passwd has been changed on server {HOSTNAME}','',0,2,3,0,0,'','',0,0),(12311,'{11400}<10','Low free disk space on {HOSTNAME} volume /home','',0,2,4,0,0,'','',0,0),(12312,'{11401}<10','Low number of free inodes on {HOSTNAME} volume /home','',0,2,4,0,0,'','',0,0),(12313,'{11402}<10','Low free disk space on {HOSTNAME} volume /var','',0,2,4,0,0,'','',0,0),(12314,'{11403}<10','Low free disk space on {HOSTNAME} volume /opt','',0,2,4,0,0,'','',0,0),(12315,'{11404}<600','{HOSTNAME} has just been restarted','',0,2,1,0,0,'','',0,0),(12316,'{11405}=0','Email (SMTP) server is down on {HOSTNAME}','',0,2,3,0,0,'','',0,0),(12317,'{11406}=0','FTP server is down on {HOSTNAME}','',0,2,3,0,0,'','',0,0),(12318,'{11407}=0','SSH server is down on {HOSTNAME}','',0,2,3,0,0,'','',0,0),(12319,'{11408}=0','POP3 server is down on {HOSTNAME}','',0,2,3,0,0,'','',0,0),(12320,'{11409}=0','IMAP server is down on {HOSTNAME}','',0,2,3,0,0,'','',0,0),(12321,'{11410}>0','/usr/sbin/sshd has been changed on server {HOSTNAME}','',0,2,3,0,0,'','',0,0),(12322,'{11411}>0','/usr/bin/ssh has been changed on server {HOSTNAME}','',0,2,3,0,0,'','',0,0),(12323,'{11412}>0','/etc/services has been changed on server {HOSTNAME}','',0,2,3,0,0,'','',0,0),(12324,'{11413}=0','News (NNTP) server is down on {HOSTNAME}','',0,2,3,0,0,'','',0,0),(12325,'{11414}<1','Inetd is not running on {HOSTNAME}','',0,2,3,0,0,'','',0,0),(12326,'{11415}<1','Apache is not running on {HOSTNAME}','',0,2,3,0,0,'','',0,0),(12327,'{11416}<1','Mysql is not running on {HOSTNAME}','',0,2,3,0,0,'','',0,0),(12328,'{11417}<1','Syslogd is not running on {HOSTNAME}','',0,2,3,0,0,'','',0,0),(12329,'{11418}<1','Sshd is not running on {HOSTNAME}','',0,2,3,0,0,'','',0,0),(12330,'{11419}<1','Zabbix_agentd is not running on {HOSTNAME}','',0,2,3,0,0,'','',0,0),(12331,'{11420}<1','Zabbix_server is not running on {HOSTNAME}','',0,2,3,0,0,'','',0,0),(12332,'{11421}<256','Configured max number of processes is too low on {HOSTNAME}','',0,2,1,0,0,'','',0,0),(12333,'{11422}<512','Configured max number of opened files is too low on {HOSTNAME}','',0,2,1,0,0,'','',0,0),(12334,'{11423}>0','Hostname was changed on {HOSTNAME}','',0,2,1,0,0,'','',0,0),(12335,'{11424}>0','Host information was changed on {HOSTNAME}','',0,2,1,0,0,'','',0,0),(12336,'{11425}>0','Version of zabbix_agent(d) was changed on {HOSTNAME}','',0,2,3,0,0,'','',0,0),(12337,'{11426}=0','WEB (HTTP) server is down on {HOSTNAME}','',0,2,3,0,0,'','',0,0),(12338,'{11427}=2','Server {HOSTNAME} is unreachable','',0,2,4,0,0,'','',0,0),(12339,'{11428}<10','Low free disk space on {HOSTNAME} volume /tmp','',0,2,4,0,0,'','',0,0),(12340,'{11429}>300','Too many processes on {HOSTNAME}','',0,2,4,0,0,'','',0,0),(12341,'{11430}<10000','Lack of free memory on server {HOSTNAME}','',0,2,3,0,0,'','',0,0),(12342,'{11431}<10','Low free disk space on {HOSTNAME} volume /','',0,2,4,0,0,'','',0,0),(12343,'{11432}<10','Low free disk space on {HOSTNAME} volume /usr','',0,2,4,0,0,'','',0,0),(12344,'{11433}<10','Low number of free inodes on {HOSTNAME} volume /','',0,2,4,0,0,'','',0,0),(12345,'{11434}<10','Low number of free inodes on {HOSTNAME} volume /opt','',0,2,4,0,0,'','',0,0),(12346,'{11435}<10','Low number of free inodes on {HOSTNAME} volume /tmp','',0,2,4,0,0,'','',0,0),(12347,'{11436}<10','Low number of free inodes on {HOSTNAME} volume /usr','',0,2,4,0,0,'','',0,0),(12348,'{11437}>5','Processor load is too high on {HOSTNAME}','',0,2,3,0,0,'','',0,0),(12349,'{11438}>10','Too many processes running on {HOSTNAME}','',0,2,3,0,0,'','',0,0),(12350,'{11439}<100000','Lack of free swap space on {HOSTNAME}','',0,2,4,0,0,'','',0,0),(12351,'{11440}>50','Too many users connected on server {HOSTNAME}','',0,2,3,0,0,'','',0,0),(12352,'{11441}>0','/etc/inetd.conf has been changed on server {HOSTNAME}','',0,2,2,0,0,'','',0,0),(12354,'{11443}>0','/etc/passwd has been changed on server {HOSTNAME}','',0,2,3,0,0,'','',0,0),(12355,'{11444}<10','Low free disk space on {HOSTNAME} volume /home','',0,2,4,0,0,'','',0,0),(12356,'{11445}<10','Low number of free inodes on {HOSTNAME} volume /home','',0,2,4,0,0,'','',0,0),(12357,'{11446}<10','Low free disk space on {HOSTNAME} volume /var','',0,2,4,0,0,'','',0,0),(12358,'{11447}<10','Low free disk space on {HOSTNAME} volume /opt','',0,2,4,0,0,'','',0,0),(12359,'{11448}<600','{HOSTNAME} has just been restarted','',0,2,1,0,0,'','',0,0),(12360,'{11449}=0','Email (SMTP) server is down on {HOSTNAME}','',0,2,3,0,0,'','',0,0),(12361,'{11450}=0','FTP server is down on {HOSTNAME}','',0,2,3,0,0,'','',0,0),(12362,'{11451}=0','SSH server is down on {HOSTNAME}','',0,2,3,0,0,'','',0,0),(12363,'{11452}=0','POP3 server is down on {HOSTNAME}','',0,2,3,0,0,'','',0,0),(12364,'{11453}=0','IMAP server is down on {HOSTNAME}','',0,2,3,0,0,'','',0,0),(12365,'{11454}>0','/usr/sbin/sshd has been changed on server {HOSTNAME}','',0,2,3,0,0,'','',0,0),(12366,'{11455}>0','/usr/bin/ssh has been changed on server {HOSTNAME}','',0,2,3,0,0,'','',0,0),(12367,'{11456}>0','/etc/services has been changed on server {HOSTNAME}','',0,2,3,0,0,'','',0,0),(12368,'{11457}=0','News (NNTP) server is down on {HOSTNAME}','',0,2,3,0,0,'','',0,0),(12369,'{11458}<1','Inetd is not running on {HOSTNAME}','',0,2,3,0,0,'','',0,0),(12370,'{11459}<1','Apache is not running on {HOSTNAME}','',0,2,3,0,0,'','',0,0),(12371,'{11460}<1','Mysql is not running on {HOSTNAME}','',0,2,3,0,0,'','',0,0),(12372,'{11461}<1','Syslogd is not running on {HOSTNAME}','',0,2,3,0,0,'','',0,0),(12373,'{11462}<1','Sshd is not running on {HOSTNAME}','',0,2,3,0,0,'','',0,0),(12374,'{11463}<1','Zabbix_agentd is not running on {HOSTNAME}','',0,2,3,0,0,'','',0,0),(12375,'{11464}<1','Zabbix_server is not running on {HOSTNAME}','',0,2,3,0,0,'','',0,0),(12376,'{11465}<256','Configured max number of processes is too low on {HOSTNAME}','',0,2,1,0,0,'','',0,0),(12377,'{11466}<512','Configured max number of opened files is too low on {HOSTNAME}','',0,2,1,0,0,'','',0,0),(12378,'{11467}>0','Hostname was changed on {HOSTNAME}','',0,2,1,0,0,'','',0,0),(12379,'{11468}>0','Host information was changed on {HOSTNAME}','',0,2,1,0,0,'','',0,0),(12380,'{11469}>0','Version of zabbix_agent(d) was changed on {HOSTNAME}','',0,2,3,0,0,'','',0,0),(12381,'{11470}=0','WEB (HTTP) server is down on {HOSTNAME}','',0,2,3,0,0,'','',0,0),(12382,'{11471}=2','Server {HOSTNAME} is unreachable','',0,2,4,0,0,'','',0,0),(12383,'{11472}<10','Low free disk space on {HOSTNAME} volume /tmp','',0,2,4,0,0,'','',0,0),(12384,'{11473}>300','Too many processes on {HOSTNAME}','',0,2,4,0,0,'','',0,0),(12385,'{11474}<10000','Lack of free memory on server {HOSTNAME}','',0,2,3,0,0,'','',0,0),(12386,'{11475}<10','Low free disk space on {HOSTNAME} volume /','',0,2,4,0,0,'','',0,0),(12387,'{11476}<10','Low free disk space on {HOSTNAME} volume /usr','',0,2,4,0,0,'','',0,0),(12388,'{11477}<10','Low number of free inodes on {HOSTNAME} volume /','',0,2,4,0,0,'','',0,0),(12389,'{11478}<10','Low number of free inodes on {HOSTNAME} volume /opt','',0,2,4,0,0,'','',0,0),(12390,'{11479}<10','Low number of free inodes on {HOSTNAME} volume /tmp','',0,2,4,0,0,'','',0,0),(12391,'{11480}<10','Low number of free inodes on {HOSTNAME} volume /usr','',0,2,4,0,0,'','',0,0),(12392,'{11481}>5','Processor load is too high on {HOSTNAME}','',0,2,3,0,0,'','',0,0),(12393,'{11482}>10','Too many processes running on {HOSTNAME}','',0,2,3,0,0,'','',0,0),(12394,'{11483}<100000','Lack of free swap space on {HOSTNAME}','',0,2,4,0,0,'','',0,0),(12395,'{11484}>50','Too many users connected on server {HOSTNAME}','',0,2,3,0,0,'','',0,0),(12396,'{11485}>0','/etc/inetd.conf has been changed on server {HOSTNAME}','',0,2,2,0,0,'','',0,0),(12398,'{11487}>0','/etc/passwd has been changed on server {HOSTNAME}','',0,2,3,0,0,'','',0,0),(12399,'{11488}<10','Low free disk space on {HOSTNAME} volume /home','',0,2,4,0,0,'','',0,0),(12400,'{11489}<10','Low number of free inodes on {HOSTNAME} volume /home','',0,2,4,0,0,'','',0,0),(12401,'{11490}<10','Low free disk space on {HOSTNAME} volume /var','',0,2,4,0,0,'','',0,0),(12402,'{11491}<10','Low free disk space on {HOSTNAME} volume /opt','',0,2,4,0,0,'','',0,0),(12403,'{11492}<600','{HOSTNAME} has just been restarted','',0,2,1,0,0,'','',0,0),(12404,'{11493}=0','Email (SMTP) server is down on {HOSTNAME}','',0,2,3,0,0,'','',0,0),(12405,'{11494}=0','FTP server is down on {HOSTNAME}','',0,2,3,0,0,'','',0,0),(12406,'{11495}=0','SSH server is down on {HOSTNAME}','',0,2,3,0,0,'','',0,0),(12407,'{11496}=0','POP3 server is down on {HOSTNAME}','',0,2,3,0,0,'','',0,0),(12408,'{11497}=0','IMAP server is down on {HOSTNAME}','',0,2,3,0,0,'','',0,0),(12409,'{11498}>0','/usr/sbin/sshd has been changed on server {HOSTNAME}','',0,2,3,0,0,'','',0,0),(12410,'{11499}>0','/usr/bin/ssh has been changed on server {HOSTNAME}','',0,2,3,0,0,'','',0,0),(12411,'{11500}>0','/etc/services has been changed on server {HOSTNAME}','',0,2,3,0,0,'','',0,0),(12412,'{11501}=0','News (NNTP) server is down on {HOSTNAME}','',0,2,3,0,0,'','',0,0),(12413,'{11502}<1','Inetd is not running on {HOSTNAME}','',0,2,3,0,0,'','',0,0),(12414,'{11503}<1','Apache is not running on {HOSTNAME}','',0,2,3,0,0,'','',0,0),(12415,'{11504}<1','Mysql is not running on {HOSTNAME}','',0,2,3,0,0,'','',0,0),(12416,'{11505}<1','Syslogd is not running on {HOSTNAME}','',0,2,3,0,0,'','',0,0),(12417,'{11506}<1','Sshd is not running on {HOSTNAME}','',0,2,3,0,0,'','',0,0),(12418,'{11507}<1','Zabbix_agentd is not running on {HOSTNAME}','',0,2,3,0,0,'','',0,0),(12419,'{11508}<1','Zabbix_server is not running on {HOSTNAME}','',0,2,3,0,0,'','',0,0),(12420,'{11509}<256','Configured max number of processes is too low on {HOSTNAME}','',0,2,1,0,0,'','',0,0),(12421,'{11510}<512','Configured max number of opened files is too low on {HOSTNAME}','',0,2,1,0,0,'','',0,0),(12422,'{11511}>0','Hostname was changed on {HOSTNAME}','',0,2,1,0,0,'','',0,0),(12423,'{11512}>0','Host information was changed on {HOSTNAME}','',0,2,1,0,0,'','',0,0),(12424,'{11513}>0','Version of zabbix_agent(d) was changed on {HOSTNAME}','',0,2,3,0,0,'','',0,0),(12425,'{11514}=0','WEB (HTTP) server is down on {HOSTNAME}','',0,2,3,0,0,'','',0,0),(12426,'{11515}=2','Server {HOSTNAME} is unreachable','',0,2,4,0,0,'','',0,0),(12427,'{11516}<10','Low free disk space on {HOSTNAME} volume /tmp','',0,2,4,0,0,'','',0,0),(12428,'{11517}>300','Too many processes on {HOSTNAME}','',0,2,4,0,0,'','',0,0),(12429,'{11518}<10000','Lack of free memory on server {HOSTNAME}','',0,2,3,0,0,'','',0,0),(12430,'{11519}<10','Low free disk space on {HOSTNAME} volume /','',0,2,4,0,0,'','',0,0),(12431,'{11520}<10','Low free disk space on {HOSTNAME} volume /usr','',0,2,4,0,0,'','',0,0),(12432,'{11521}<10','Low number of free inodes on {HOSTNAME} volume /','',0,2,4,0,0,'','',0,0),(12433,'{11522}<10','Low number of free inodes on {HOSTNAME} volume /opt','',0,2,4,0,0,'','',0,0),(12434,'{11523}<10','Low number of free inodes on {HOSTNAME} volume /tmp','',0,2,4,0,0,'','',0,0),(12435,'{11524}<10','Low number of free inodes on {HOSTNAME} volume /usr','',0,2,4,0,0,'','',0,0),(12436,'{11525}>5','Processor load is too high on {HOSTNAME}','',0,2,3,0,0,'','',0,0),(12437,'{11526}>10','Too many processes running on {HOSTNAME}','',0,2,3,0,0,'','',0,0),(12438,'{11527}<100000','Lack of free swap space on {HOSTNAME}','',0,2,4,0,0,'','',0,0),(12439,'{11528}>50','Too many users connected on server {HOSTNAME}','',0,2,3,0,0,'','',0,0),(12440,'{11529}>0','/etc/inetd.conf has been changed on server {HOSTNAME}','',0,2,2,0,0,'','',0,0),(12442,'{11531}>0','/etc/passwd has been changed on server {HOSTNAME}','',0,2,3,0,0,'','',0,0),(12443,'{11532}<10','Low free disk space on {HOSTNAME} volume /home','',0,2,4,0,0,'','',0,0),(12444,'{11533}<10','Low number of free inodes on {HOSTNAME} volume /home','',0,2,4,0,0,'','',0,0),(12445,'{11534}<10','Low free disk space on {HOSTNAME} volume /var','',0,2,4,0,0,'','',0,0),(12446,'{11535}<10','Low free disk space on {HOSTNAME} volume /opt','',0,2,4,0,0,'','',0,0),(12447,'{11536}<600','{HOSTNAME} has just been restarted','',0,2,1,0,0,'','',0,0),(12448,'{11537}=0','Email (SMTP) server is down on {HOSTNAME}','',0,2,3,0,0,'','',0,0),(12449,'{11538}=0','FTP server is down on {HOSTNAME}','',0,2,3,0,0,'','',0,0),(12450,'{11539}=0','SSH server is down on {HOSTNAME}','',0,2,3,0,0,'','',0,0),(12451,'{11540}=0','POP3 server is down on {HOSTNAME}','',0,2,3,0,0,'','',0,0),(12452,'{11541}=0','IMAP server is down on {HOSTNAME}','',0,2,3,0,0,'','',0,0),(12453,'{11542}>0','/usr/sbin/sshd has been changed on server {HOSTNAME}','',0,2,3,0,0,'','',0,0),(12454,'{11543}>0','/usr/bin/ssh has been changed on server {HOSTNAME}','',0,2,3,0,0,'','',0,0),(12455,'{11544}>0','/etc/services has been changed on server {HOSTNAME}','',0,2,3,0,0,'','',0,0),(12456,'{11545}=0','News (NNTP) server is down on {HOSTNAME}','',0,2,3,0,0,'','',0,0),(12457,'{11546}<1','Inetd is not running on {HOSTNAME}','',0,2,3,0,0,'','',0,0),(12458,'{11547}<1','Apache is not running on {HOSTNAME}','',0,2,3,0,0,'','',0,0),(12459,'{11548}<1','Mysql is not running on {HOSTNAME}','',0,2,3,0,0,'','',0,0),(12460,'{11549}<1','Syslogd is not running on {HOSTNAME}','',0,2,3,0,0,'','',0,0),(12461,'{11550}<1','Sshd is not running on {HOSTNAME}','',0,2,3,0,0,'','',0,0),(12462,'{11551}<1','Zabbix_agentd is not running on {HOSTNAME}','',0,2,3,0,0,'','',0,0),(12463,'{11552}<1','Zabbix_server is not running on {HOSTNAME}','',0,2,3,0,0,'','',0,0),(12464,'{11553}<256','Configured max number of processes is too low on {HOSTNAME}','',0,2,1,0,0,'','',0,0),(12465,'{11554}<512','Configured max number of opened files is too low on {HOSTNAME}','',0,2,1,0,0,'','',0,0),(12466,'{11555}>0','Hostname was changed on {HOSTNAME}','',0,2,1,0,0,'','',0,0),(12467,'{11556}>0','Host information was changed on {HOSTNAME}','',0,2,1,0,0,'','',0,0),(12468,'{11557}>0','Version of zabbix_agent(d) was changed on {HOSTNAME}','',0,2,3,0,0,'','',0,0),(12469,'{11558}=0','WEB (HTTP) server is down on {HOSTNAME}','',0,2,3,0,0,'','',0,0),(12470,'{11559}=2','Server {HOSTNAME} is unreachable','',0,2,4,0,0,'','',0,0),(12471,'{11560}<10','Low free disk space on {HOSTNAME} volume /tmp','',0,2,4,0,0,'','',0,0),(12472,'{11561}>300','Too many processes on {HOSTNAME}','',0,2,4,0,0,'','',0,0),(12473,'{11562}<10000','Lack of free memory on server {HOSTNAME}','',0,2,3,0,0,'','',0,0),(12474,'{11563}<10','Low free disk space on {HOSTNAME} volume /','',0,2,4,0,0,'','',0,0),(12475,'{11564}<10','Low free disk space on {HOSTNAME} volume /usr','',0,2,4,0,0,'','',0,0),(12476,'{11565}<10','Low number of free inodes on {HOSTNAME} volume /','',0,2,4,0,0,'','',0,0),(12477,'{11566}<10','Low number of free inodes on {HOSTNAME} volume /opt','',0,2,4,0,0,'','',0,0),(12478,'{11567}<10','Low number of free inodes on {HOSTNAME} volume /tmp','',0,2,4,0,0,'','',0,0),(12479,'{11568}<10','Low number of free inodes on {HOSTNAME} volume /usr','',0,2,4,0,0,'','',0,0),(12480,'{11569}>5','Processor load is too high on {HOSTNAME}','',0,2,3,0,0,'','',0,0),(12481,'{11570}>10','Too many processes running on {HOSTNAME}','',0,2,3,0,0,'','',0,0),(12482,'{11571}<100000','Lack of free swap space on {HOSTNAME}','',0,2,4,0,0,'','',0,0),(12483,'{11572}>50','Too many users connected on server {HOSTNAME}','',0,2,3,0,0,'','',0,0),(12484,'{11573}>0','/etc/inetd.conf has been changed on server {HOSTNAME}','',0,2,2,0,0,'','',0,0),(12486,'{11575}>0','/etc/passwd has been changed on server {HOSTNAME}','',0,2,3,0,0,'','',0,0),(12487,'{11576}<10','Low free disk space on {HOSTNAME} volume /home','',0,2,4,0,0,'','',0,0),(12488,'{11577}<10','Low number of free inodes on {HOSTNAME} volume /home','',0,2,4,0,0,'','',0,0),(12489,'{11578}<10','Low free disk space on {HOSTNAME} volume /var','',0,2,4,0,0,'','',0,0),(12490,'{11579}<10','Low free disk space on {HOSTNAME} volume /opt','',0,2,4,0,0,'','',0,0),(12491,'{11580}<600','{HOSTNAME} has just been restarted','',0,2,1,0,0,'','',0,0),(12492,'{11581}=0','Email (SMTP) server is down on {HOSTNAME}','',0,2,3,0,0,'','',0,0),(12493,'{11582}=0','FTP server is down on {HOSTNAME}','',0,2,3,0,0,'','',0,0),(12494,'{11583}=0','SSH server is down on {HOSTNAME}','',0,2,3,0,0,'','',0,0),(12495,'{11584}=0','POP3 server is down on {HOSTNAME}','',0,2,3,0,0,'','',0,0),(12496,'{11585}=0','IMAP server is down on {HOSTNAME}','',0,2,3,0,0,'','',0,0),(12497,'{11586}>0','/usr/sbin/sshd has been changed on server {HOSTNAME}','',0,2,3,0,0,'','',0,0),(12498,'{11587}>0','/usr/bin/ssh has been changed on server {HOSTNAME}','',0,2,3,0,0,'','',0,0),(12499,'{11588}>0','/etc/services has been changed on server {HOSTNAME}','',0,2,3,0,0,'','',0,0),(12500,'{11589}=0','News (NNTP) server is down on {HOSTNAME}','',0,2,3,0,0,'','',0,0),(12501,'{11590}<1','Inetd is not running on {HOSTNAME}','',0,2,3,0,0,'','',0,0),(12502,'{11591}<1','Apache is not running on {HOSTNAME}','',0,2,3,0,0,'','',0,0),(12503,'{11592}<1','Mysql is not running on {HOSTNAME}','',0,2,3,0,0,'','',0,0),(12504,'{11593}<1','Syslogd is not running on {HOSTNAME}','',0,2,3,0,0,'','',0,0),(12505,'{11594}<1','Sshd is not running on {HOSTNAME}','',0,2,3,0,0,'','',0,0),(12506,'{11595}<1','Zabbix_agentd is not running on {HOSTNAME}','',0,2,3,0,0,'','',0,0),(12507,'{11596}<1','Zabbix_server is not running on {HOSTNAME}','',0,2,3,0,0,'','',0,0),(12508,'{11597}<256','Configured max number of processes is too low on {HOSTNAME}','',0,2,1,0,0,'','',0,0),(12509,'{11598}<512','Configured max number of opened files is too low on {HOSTNAME}','',0,2,1,0,0,'','',0,0),(12510,'{11599}>0','Hostname was changed on {HOSTNAME}','',0,2,1,0,0,'','',0,0),(12511,'{11600}>0','Host information was changed on {HOSTNAME}','',0,2,1,0,0,'','',0,0),(12512,'{11601}>0','Version of zabbix_agent(d) was changed on {HOSTNAME}','',0,2,3,0,0,'','',0,0),(12513,'{11602}=0','WEB (HTTP) server is down on {HOSTNAME}','',0,2,3,0,0,'','',0,0),(12514,'{11603}=2','Server {HOSTNAME} is unreachable','',0,2,4,0,0,'','',0,0),(12515,'{11604}<10','Low free disk space on {HOSTNAME} volume /tmp','',0,2,4,0,0,'','',0,0),(12516,'{11605}>300','Too many processes on {HOSTNAME}','',0,2,4,0,0,'','',0,0),(12517,'{11606}<10000','Lack of free memory on server {HOSTNAME}','',0,2,3,0,0,'','',0,0),(12518,'{11607}<10','Low free disk space on {HOSTNAME} volume /','',0,2,4,0,0,'','',0,0),(12519,'{11608}<10','Low free disk space on {HOSTNAME} volume /usr','',0,2,4,0,0,'','',0,0),(12520,'{11609}<10','Low number of free inodes on {HOSTNAME} volume /','',0,2,4,0,0,'','',0,0),(12521,'{11610}<10','Low number of free inodes on {HOSTNAME} volume /opt','',0,2,4,0,0,'','',0,0),(12522,'{11611}<10','Low number of free inodes on {HOSTNAME} volume /tmp','',0,2,4,0,0,'','',0,0),(12523,'{11612}<10','Low number of free inodes on {HOSTNAME} volume /usr','',0,2,4,0,0,'','',0,0),(12524,'{11613}>5','Processor load is too high on {HOSTNAME}','',0,2,3,0,0,'','',0,0),(12525,'{11614}>10','Too many processes running on {HOSTNAME}','',0,2,3,0,0,'','',0,0),(12526,'{11615}<100000','Lack of free swap space on {HOSTNAME}','',0,2,4,0,0,'','',0,0),(12527,'{11616}>50','Too many users connected on server {HOSTNAME}','',0,2,3,0,0,'','',0,0),(12528,'{11617}>0','/etc/inetd.conf has been changed on server {HOSTNAME}','',0,2,2,0,0,'','',0,0),(12530,'{11619}>0','/etc/passwd has been changed on server {HOSTNAME}','',0,2,3,0,0,'','',0,0),(12531,'{11620}<10','Low free disk space on {HOSTNAME} volume /home','',0,2,4,0,0,'','',0,0),(12532,'{11621}<10','Low number of free inodes on {HOSTNAME} volume /home','',0,2,4,0,0,'','',0,0),(12533,'{11622}<10','Low free disk space on {HOSTNAME} volume /var','',0,2,4,0,0,'','',0,0),(12534,'{11623}<10','Low free disk space on {HOSTNAME} volume /opt','',0,2,4,0,0,'','',0,0),(12535,'{11624}<600','{HOSTNAME} has just been restarted','',0,2,1,0,0,'','',0,0),(12536,'{11625}=0','Email (SMTP) server is down on {HOSTNAME}','',0,2,3,0,0,'','',0,0),(12537,'{11626}=0','FTP server is down on {HOSTNAME}','',0,2,3,0,0,'','',0,0),(12538,'{11627}=0','SSH server is down on {HOSTNAME}','',0,2,3,0,0,'','',0,0),(12539,'{11628}=0','POP3 server is down on {HOSTNAME}','',0,2,3,0,0,'','',0,0),(12540,'{11629}=0','IMAP server is down on {HOSTNAME}','',0,2,3,0,0,'','',0,0),(12541,'{11630}>0','/usr/sbin/sshd has been changed on server {HOSTNAME}','',0,2,3,0,0,'','',0,0),(12542,'{11631}>0','/usr/bin/ssh has been changed on server {HOSTNAME}','',0,2,3,0,0,'','',0,0),(12543,'{11632}>0','/etc/services has been changed on server {HOSTNAME}','',0,2,3,0,0,'','',0,0),(12544,'{11633}=0','News (NNTP) server is down on {HOSTNAME}','',0,2,3,0,0,'','',0,0),(12545,'{11634}<1','Inetd is not running on {HOSTNAME}','',0,2,3,0,0,'','',0,0),(12546,'{11635}<1','Apache is not running on {HOSTNAME}','',0,2,3,0,0,'','',0,0),(12547,'{11636}<1','Mysql is not running on {HOSTNAME}','',0,2,3,0,0,'','',0,0),(12548,'{11637}<1','Syslogd is not running on {HOSTNAME}','',0,2,3,0,0,'','',0,0),(12549,'{11638}<1','Sshd is not running on {HOSTNAME}','',0,2,3,0,0,'','',0,0),(12550,'{11639}<1','Zabbix_agentd is not running on {HOSTNAME}','',0,2,3,0,0,'','',0,0),(12551,'{11640}<1','Zabbix_server is not running on {HOSTNAME}','',0,2,3,0,0,'','',0,0),(12552,'{11641}<256','Configured max number of processes is too low on {HOSTNAME}','',0,2,1,0,0,'','',0,0),(12553,'{11642}<512','Configured max number of opened files is too low on {HOSTNAME}','',0,2,1,0,0,'','',0,0),(12554,'{11643}>0','Hostname was changed on {HOSTNAME}','',0,2,1,0,0,'','',0,0),(12555,'{11644}>0','Host information was changed on {HOSTNAME}','',0,2,1,0,0,'','',0,0),(12556,'{11645}>0','Version of zabbix_agent(d) was changed on {HOSTNAME}','',0,2,3,0,0,'','',0,0),(12557,'{11646}=0','WEB (HTTP) server is down on {HOSTNAME}','',0,2,3,0,0,'','',0,0),(12558,'{11647}=2','Server {HOSTNAME} is unreachable','',0,2,4,0,0,'','',0,0),(12559,'{11648}<10','Low free disk space on {HOSTNAME} volume /tmp','',0,2,4,0,0,'','',0,0),(12560,'{11649}>300','Too many processes on {HOSTNAME}','',0,2,4,0,0,'','',0,0),(12561,'{11650}=1','sysName on {HOSTNAME} has Changed','',0,2,3,0,0,'','',0,0),(12562,'{11651}=1','lenvSerialNumber on {HOSTNAME} has Changed','',0,2,3,0,0,'','',0,0),(12563,'{11652}>0','lmemBufferNoMem on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12564,'{11653}>75','lcpuPercentBusy on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12565,'{11654}=1','lenvFirmVersion on {HOSTNAME} has Changed','',0,2,3,0,0,'','',0,0),(12566,'{11655}>0','lmemBufferFail on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12567,'{11656}<10240','lmemFreeMem on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12568,'{11657}=1','lmemRomID on {HOSTNAME} has Changed','',0,2,3,0,0,'','',0,0),(12569,'{11658}=1','ifDescr1 on {HOSTNAME} has Changed','',0,2,3,0,0,'','',0,0),(12570,'{11659}=1','ifDescr2 on {HOSTNAME} has Changed','',0,2,3,0,0,'','',0,0),(12571,'{11660}=1','ifDescr3 on {HOSTNAME} has Changed','',0,2,3,0,0,'','',0,0),(12572,'{11661}=1','ifDescr4 on {HOSTNAME} has Changed','',0,2,3,0,0,'','',0,0),(12573,'{11662}=1','ifDescr5 on {HOSTNAME} has Changed','',0,2,3,0,0,'','',0,0),(12574,'{11663}=1','ifDescr6 on {HOSTNAME} has Changed','',0,2,3,0,0,'','',0,0),(12575,'{11664}=1','ifDescr7 on {HOSTNAME} has Changed','',0,2,3,0,0,'','',0,0),(12576,'{11665}=1','ifDescr8 on {HOSTNAME} has Changed','',0,2,3,0,0,'','',0,0),(12577,'{11666}=1','ifDescr9 on {HOSTNAME} has Changed','',0,2,3,0,0,'','',0,0),(12578,'{11667}=1','ifDescr10 on {HOSTNAME} has Changed','',0,2,3,0,0,'','',0,0),(12579,'{11668}=1','ifDescr11 on {HOSTNAME} has Changed','',0,2,3,0,0,'','',0,0),(12580,'{11669}=1','ifDescr12 on {HOSTNAME} has Changed','',0,2,3,0,0,'','',0,0),(12581,'{11670}=1','ifDescr13 on {HOSTNAME} has Changed','',0,2,3,0,0,'','',0,0),(12582,'{11671}=1','ifDescr14 on {HOSTNAME} has Changed','',0,2,3,0,0,'','',0,0),(12583,'{11672}=1','ifDescr15 on {HOSTNAME} has Changed','',0,2,3,0,0,'','',0,0),(12584,'{11673}=1','ifDescr16 on {HOSTNAME} has Changed','',0,2,3,0,0,'','',0,0),(12585,'{11674}=1','ifDescr17 on {HOSTNAME} has Changed','',0,2,3,0,0,'','',0,0),(12586,'{11675}=1','ifDescr18 on {HOSTNAME} has Changed','',0,2,3,0,0,'','',0,0),(12587,'{11676}=1','ifDescr19 on {HOSTNAME} has Changed','',0,2,3,0,0,'','',0,0),(12588,'{11677}=1','ifDescr20 on {HOSTNAME} has Changed','',0,2,3,0,0,'','',0,0),(12589,'{11678}=1','ifDescr21 on {HOSTNAME} has Changed','',0,2,3,0,0,'','',0,0),(12590,'{11679}=1','ifDescr22 on {HOSTNAME} has Changed','',0,2,3,0,0,'','',0,0),(12591,'{11680}=1','ifDescr23 on {HOSTNAME} has Changed','',0,2,3,0,0,'','',0,0),(12592,'{11681}=1','ifDescr24 on {HOSTNAME} has Changed','',0,2,3,0,0,'','',0,0),(12593,'{11682}=1','ifDescr25 on {HOSTNAME} has Changed','',0,2,3,0,0,'','',0,0),(12594,'{11683}=1','ifDescr26 on {HOSTNAME} has Changed','',0,2,3,0,0,'','',0,0),(12595,'{11684}=1','ifDescr27 on {HOSTNAME} has Changed','',0,2,3,0,0,'','',0,0),(12596,'{11685}=1','ifDescr28 on {HOSTNAME} has Changed','',0,2,3,0,0,'','',0,0),(12597,'{11686}=1','ifDescr29 on {HOSTNAME} has Changed','',0,2,3,0,0,'','',0,0),(12598,'{11687}=1','ifDescr30 on {HOSTNAME} has Changed','',0,2,3,0,0,'','',0,0),(12599,'{11688}=1','ifDescr31 on {HOSTNAME} has Changed','',0,2,3,0,0,'','',0,0),(12600,'{11689}=1','ifDescr32 on {HOSTNAME} has Changed','',0,2,3,0,0,'','',0,0),(12601,'{11690}=1','ifDescr33 on {HOSTNAME} has Changed','',0,2,3,0,0,'','',0,0),(12602,'{11691}=1','ifDescr34 on {HOSTNAME} has Changed','',0,2,3,0,0,'','',0,0),(12603,'{11692}=1','ifDescr35 on {HOSTNAME} has Changed','',0,2,3,0,0,'','',0,0),(12604,'{11693}=1','ifDescr36 on {HOSTNAME} has Changed','',0,2,3,0,0,'','',0,0),(12605,'{11694}=1','ifDescr37 on {HOSTNAME} has Changed','',0,2,3,0,0,'','',0,0),(12606,'{11695}=1','ifDescr38 on {HOSTNAME} has Changed','',0,2,3,0,0,'','',0,0),(12607,'{11696}=1','ifDescr39 on {HOSTNAME} has Changed','',0,2,3,0,0,'','',0,0),(12608,'{11697}=1','ifDescr40 on {HOSTNAME} has Changed','',0,2,3,0,0,'','',0,0),(12609,'{11698}=1','ifDescr41 on {HOSTNAME} has Changed','',0,2,3,0,0,'','',0,0),(12610,'{11699}=1','ifDescr42 on {HOSTNAME} has Changed','',0,2,3,0,0,'','',0,0),(12611,'{11700}=1','ifDescr43 on {HOSTNAME} has Changed','',0,2,3,0,0,'','',0,0),(12612,'{11701}=1','ifDescr44 on {HOSTNAME} has Changed','',0,2,3,0,0,'','',0,0),(12613,'{11702}=1','ifDescr45 on {HOSTNAME} has Changed','',0,2,3,0,0,'','',0,0),(12614,'{11703}=1','ifDescr46 on {HOSTNAME} has Changed','',0,2,3,0,0,'','',0,0),(12615,'{11704}=1','ifDescr47 on {HOSTNAME} has Changed','',0,2,3,0,0,'','',0,0),(12616,'{11705}=1','ifDescr48 on {HOSTNAME} has Changed','',0,2,3,0,0,'','',0,0),(12617,'{11706}=1','ifDescr49 on {HOSTNAME} has Changed','',0,2,3,0,0,'','',0,0),(12618,'{11707}=1','ifDescr50 on {HOSTNAME} has Changed','',0,2,3,0,0,'','',0,0),(12619,'{11708}=1','ifDescr51 on {HOSTNAME} has Changed','',0,2,3,0,0,'','',0,0),(12620,'{11709}>150000','ifInOctets1 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12621,'{11710}>150000','ifInOctets2 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12622,'{11711}>150000','ifInOctets3 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12623,'{11712}>150000','ifInOctets4 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12624,'{11713}>150000','ifInOctets5 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12625,'{11714}>150000','ifInOctets6 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12626,'{11715}>150000','ifInOctets7 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12627,'{11716}>150000','ifInOctets8 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12628,'{11717}>150000','ifInOctets9 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12629,'{11718}>150000','ifInOctets10 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12630,'{11719}>150000','ifInOctets11 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12631,'{11720}>150000','ifInOctets12 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12632,'{11721}>150000','ifInOctets13 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12633,'{11722}>150000','ifInOctets14 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12634,'{11723}>150000','ifInOctets15 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12635,'{11724}>150000','ifInOctets16 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12636,'{11725}>150000','ifInOctets17 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12637,'{11726}>150000','ifInOctets18 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12638,'{11727}>150000','ifInOctets19 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12639,'{11728}>150000','ifInOctets20 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12640,'{11729}>150000','ifInOctets21 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12641,'{11730}>150000','ifInOctets22 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12642,'{11731}>150000','ifInOctets23 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12643,'{11732}>150000','ifInOctets24 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12644,'{11733}>150000','ifInOctets25 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12645,'{11734}>150000','ifInOctets26 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12646,'{11735}>150000','ifInOctets27 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12647,'{11736}>150000','ifInOctets28 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12648,'{11737}>150000','ifInOctets29 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12649,'{11738}>150000','ifInOctets30 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12650,'{11739}>150000','ifInOctets31 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12651,'{11740}>150000','ifInOctets32 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12652,'{11741}>150000','ifInOctets33 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12653,'{11742}>150000','ifInOctets34 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12654,'{11743}>150000','ifInOctets35 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12655,'{11744}>150000','ifInOctets36 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12656,'{11745}>150000','ifInOctets37 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12657,'{11746}>150000','ifInOctets38 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12658,'{11747}>150000','ifInOctets39 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12659,'{11748}>150000','ifInOctets40 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12660,'{11749}>150000','ifInOctets41 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12661,'{11750}>150000','ifInOctets42 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12662,'{11751}>150000','ifInOctets43 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12663,'{11752}>150000','ifInOctets44 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12664,'{11753}>150000','ifInOctets45 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12665,'{11754}>150000','ifInOctets46 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12666,'{11755}>150000','ifInOctets47 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12667,'{11756}>150000','ifInOctets48 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12668,'{11757}>150000','ifInOctets49 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12669,'{11758}>150000','ifInOctets50 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12670,'{11759}>150000','ifInOctets51 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12671,'{11760}>150000','ifOutOctets1 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12672,'{11761}>150000','ifOutOctets2 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12673,'{11762}>150000','ifOutOctets3 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12674,'{11763}>150000','ifOutOctets4 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12675,'{11764}>150000','ifOutOctets5 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12676,'{11765}>150000','ifOutOctets6 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12677,'{11766}>150000','ifOutOctets7 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12678,'{11767}>150000','ifOutOctets8 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12679,'{11768}>150000','ifOutOctets9 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12680,'{11769}>150000','ifOutOctets10 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12681,'{11770}>150000','ifOutOctets11 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12682,'{11771}>150000','ifOutOctets12 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12683,'{11772}>150000','ifOutOctets13 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12684,'{11773}>150000','ifOutOctets14 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12685,'{11774}>150000','ifOutOctets15 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12686,'{11775}>150000','ifOutOctets16 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12687,'{11776}>150000','ifOutOctets17 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12688,'{11777}>150000','ifOutOctets18 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12689,'{11778}>150000','ifOutOctets19 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12690,'{11779}>150000','ifOutOctets20 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12691,'{11780}>150000','ifOutOctets21 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12692,'{11781}>150000','ifOutOctets22 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12693,'{11782}>150000','ifOutOctets23 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12694,'{11783}>150000','ifOutOctets24 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12695,'{11784}>150000','ifOutOctets25 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12696,'{11785}>150000','ifOutOctets26 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12697,'{11786}>150000','ifOutOctets27 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12698,'{11787}>150000','ifOutOctets28 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12699,'{11788}>150000','ifOutOctets29 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12700,'{11789}>150000','ifOutOctets30 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12701,'{11790}>150000','ifOutOctets31 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12702,'{11791}>150000','ifOutOctets32 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12703,'{11792}>150000','ifOutOctets33 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12704,'{11793}>150000','ifOutOctets34 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12705,'{11794}>150000','ifOutOctets35 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12706,'{11795}>150000','ifOutOctets36 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12707,'{11796}>150000','ifOutOctets37 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12708,'{11797}>150000','ifOutOctets38 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12709,'{11798}>150000','ifOutOctets39 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12710,'{11799}>150000','ifOutOctets40 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12711,'{11800}>150000','ifOutOctets41 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12712,'{11801}>150000','ifOutOctets42 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12713,'{11802}>150000','ifOutOctets43 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12714,'{11803}>150000','ifOutOctets44 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12715,'{11804}>150000','ifOutOctets45 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12716,'{11805}>150000','ifOutOctets46 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12717,'{11806}>150000','ifOutOctets47 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12718,'{11807}>150000','ifOutOctets48 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12719,'{11808}>150000','ifOutOctets49 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12720,'{11809}>150000','ifOutOctets50 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12721,'{11810}>150000','ifOutOctets51 on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12722,'{11811}=0','ipForwarding on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12723,'{11812}>255','ipDefaultTTL on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12724,'{11813}>150000','ipInReceives on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12725,'{11814}>0','ipInHdrErrors on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12726,'{11815}>0','ipInAddrErrors on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12727,'{11816}>150000','ipInForwDatagrams on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12728,'{11817}>0','ipInUnknownProtos on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12729,'{11818}>0','ipInDiscards on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12730,'{11819}>150000','ipInDelivers on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12731,'{11820}>150000','ipOutRequests on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12732,'{11821}>0','ipOutDiscards on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12733,'{11822}>0','ipOutNoRoutes on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12734,'{11823}>0','ipReasmTimeout on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12735,'{11824}>150000','ipReasmReqds on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12736,'{11825}>150000','ipReasmOKs on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12737,'{11826}>0','ipReasmFails on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12738,'{11827}>150000','ipFragOKs on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12739,'{11828}>0','ipFragFails on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12740,'{11829}>150000','ipFragCreates on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12741,'{11830}>0','ipRoutingDiscards on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12742,'{11831}>150000','icmpInMsgs on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12743,'{11832}>0','icmpInErrors on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12744,'{11833}>0','icmpInDestUnreachs on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12745,'{11834}>1000','icmpInTimeExcds on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12746,'{11835}>0','icmpInParmProbs on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12747,'{11836}>0','icmpInSrcQuenchs on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12748,'{11837}>150000','icmpInRedirects on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12749,'{11838}>100','icmpInEchos on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12750,'{11839}>100','icmpInEchoReps on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12751,'{11840}>100','icmpInTimestamps on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12752,'{11841}>100','icmpInTimestampReps on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12753,'{11842}>100','icmpInAddrMasks on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12754,'{11843}>100','icmpInAddrMaskReps on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12755,'{11844}>150000','icmpOutMsgs on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12756,'{11845}>0','icmpOutErrors on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12757,'{11846}>0','icmpOutDesUnreachs on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12758,'{11847}>1000','icmpOutTimeExcds on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12759,'{11848}>0','icmpOutParmProbs on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12760,'{11849}>0','icmpOutSrcQuenchs on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12761,'{11850}>100','icmpOutEchos on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12762,'{11851}>100','icmpOutEchoReps on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12763,'{11852}>100','icmpOutTimestamps on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12764,'{11853}>100','icmpOutTimestampReps on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12765,'{11854}>100','icmpOutAddrMasks on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12766,'{11855}>100','icmpOutAddrMaskReps on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12767,'{11856}>1000','icmpOutRedirects on {HOSTNAME} is too High','',0,2,3,0,0,'','',0,0),(12768,'{11857}>0','Version of zabbix_agent(d) was changed on {HOSTNAME}','',0,2,3,0,0,'','Trigger just added. No status update so far.',10045,0),(12769,'{11858}<512','Configured max number of opened files is too low on {HOSTNAME}','',0,2,1,0,0,'','Trigger just added. No status update so far.',10042,0),(12770,'{11859}<256','Configured max number of processes is too low on {HOSTNAME}','',0,2,1,0,0,'','Trigger just added. No status update so far.',10041,0),(12771,'{11860}=0','FTP server is down on {HOSTNAME}','',0,2,3,0,0,'','Trigger just added. No status update so far.',10023,0),(12772,'{11861}=0','WEB (HTTP) server is down on {HOSTNAME}','',0,2,3,0,0,'','Trigger just added. No status update so far.',10046,0),(12773,'{11862}=0','IMAP server is down on {HOSTNAME}','',0,2,3,0,0,'','Trigger just added. No status update so far.',10028,0),(12774,'{11863}=0','News (NNTP) server is down on {HOSTNAME}','',0,2,3,0,0,'','Trigger just added. No status update so far.',10032,0),(12775,'{11864}=0','POP3 server is down on {HOSTNAME}','',0,2,3,0,0,'','Trigger just added. No status update so far.',10027,0),(12776,'{11865}=0','Email (SMTP) server is down on {HOSTNAME}','',0,2,3,0,0,'','Trigger just added. No status update so far.',10022,0),(12777,'{11866}=0','SSH server is down on {HOSTNAME}','',0,2,3,0,0,'','Trigger just added. No status update so far.',10024,0),(12778,'{11867}>10','Too many processes running on {HOSTNAME}','',0,2,3,0,0,'','Trigger just added. No status update so far.',10011,0),(12779,'{11868}<1','Apache is not running on {HOSTNAME}','',0,2,3,0,0,'','Trigger just added. No status update so far.',10034,0),(12780,'{11869}<1','Inetd is not running on {HOSTNAME}','',0,2,3,0,0,'','Trigger just added. No status update so far.',10033,0),(12781,'{11870}<1','Mysql is not running on {HOSTNAME}','',0,2,3,0,0,'','Trigger just added. No status update so far.',10035,0),(12782,'{11871}<1','Sshd is not running on {HOSTNAME}','',0,2,3,0,0,'','Trigger just added. No status update so far.',10037,0),(12783,'{11872}<1','Syslogd is not running on {HOSTNAME}','',0,2,3,0,0,'','Trigger just added. No status update so far.',10036,0),(12784,'{11873}<1','Zabbix_agentd is not running on {HOSTNAME}','',0,2,3,0,0,'','Trigger just added. No status update so far.',10038,0),(12785,'{11874}<1','Zabbix_server is not running on {HOSTNAME}','',0,2,3,0,0,'','Trigger just added. No status update so far.',10039,0),(12786,'{11875}>300','Too many processes on {HOSTNAME}','',0,2,4,0,0,'','Trigger just added. No status update so far.',10190,0),(12787,'{11876}=2','Server {HOSTNAME} is unreachable','',0,2,4,0,0,'','Trigger just added. No status update so far.',10047,0),(12788,'{11877}>5','Processor load is too high on {HOSTNAME}','',0,2,3,0,0,'','Trigger just added. No status update so far.',10010,0),(12789,'{11878}>0','Hostname was changed on {HOSTNAME}','',0,2,1,0,0,'','Trigger just added. No status update so far.',10043,0),(12790,'{11879}<100000','Lack of free swap space on {HOSTNAME}','',0,2,4,0,0,'','Trigger just added. No status update so far.',10012,0),(12791,'{11880}>0','Host information was changed on {HOSTNAME}','',0,2,1,0,0,'','Trigger just added. No status update so far.',10044,0),(12792,'{11881}<600','{HOSTNAME} has just been restarted','',0,2,1,0,0,'','Trigger just added. No status update so far.',10021,0),(12793,'{11882}>50','Too many users connected on server {HOSTNAME}','',0,2,3,0,0,'','Trigger just added. No status update so far.',10013,0),(12794,'{11883}>0','/etc/inetd.conf has been changed on server {HOSTNAME}','',0,2,2,0,0,'','Trigger just added. No status update so far.',10014,0),(12795,'{11884}>0','/etc/passwd has been changed on server {HOSTNAME}','',0,2,3,0,0,'','Trigger just added. No status update so far.',10016,0),(12796,'{11885}>0','/etc/services has been changed on server {HOSTNAME}','',0,2,3,0,0,'','Trigger just added. No status update so far.',10031,0),(12797,'{11886}>0','/usr/bin/ssh has been changed on server {HOSTNAME}','',0,2,3,0,0,'','Trigger just added. No status update so far.',10030,0),(12798,'{11887}>0','/usr/sbin/sshd has been changed on server {HOSTNAME}','',0,2,3,0,0,'','Trigger just added. No status update so far.',10029,0),(12799,'{11888}>0','/boot/vmlinuz has been changed on server {HOSTNAME}','',0,2,2,0,0,'','Trigger just added. No status update so far.',10015,0),(12800,'{11889}<10','Low number of free inodes on {HOSTNAME} volume /','',0,2,4,0,0,'','Trigger just added. No status update so far.',10005,0),(12801,'{11890}<10','Low number of free inodes on {HOSTNAME} volume /home','',0,2,4,0,0,'','Trigger just added. No status update so far.',10018,0),(12802,'{11891}<10','Low number of free inodes on {HOSTNAME} volume /opt','',0,2,4,0,0,'','Trigger just added. No status update so far.',10006,0),(12803,'{11892}<10','Low number of free inodes on {HOSTNAME} volume /tmp','',0,2,4,0,0,'','Trigger just added. No status update so far.',10007,0),(12804,'{11893}<10','Low number of free inodes on {HOSTNAME} volume /usr','',0,2,4,0,0,'','Trigger just added. No status update so far.',10008,0),(12805,'{11894}<10','Low free disk space on {HOSTNAME} volume /','',0,2,4,0,0,'','Trigger just added. No status update so far.',10002,0),(12806,'{11895}<10','Low free disk space on {HOSTNAME} volume /home','',0,2,4,0,0,'','Trigger just added. No status update so far.',10017,0),(12807,'{11896}<10','Low free disk space on {HOSTNAME} volume /opt','',0,2,4,0,0,'','Trigger just added. No status update so far.',10020,0),(12808,'{11897}<10','Low free disk space on {HOSTNAME} volume /tmp','',0,2,4,0,0,'','Trigger just added. No status update so far.',10189,0),(12809,'{11898}<10','Low free disk space on {HOSTNAME} volume /usr','',0,2,4,0,0,'','Trigger just added. No status update so far.',10004,0),(12810,'{11899}<10','Low free disk space on {HOSTNAME} volume /var','',0,2,4,0,0,'','Trigger just added. No status update so far.',10019,0),(12811,'{11900}<10000','Lack of free memory on server {HOSTNAME}','',0,2,3,0,0,'','Trigger just added. No status update so far.',10001,0),(12812,'{11901}>40','APC: High Battery Temperature - {HOSTNAME}','',0,2,5,0,0,'','',0,0),(12813,'{11902}#2','APC: Loss of Input Power - {HOSTNAME}','',0,2,5,0,0,'','',0,0),(12814,'{11903}#1','APC: Replace Battery - {HOSTNAME}','',0,2,5,0,0,'','',0,0),(12815,'{11904}<5','APC: Run Time Remaining Critical Level - {HOSTNAME}','',0,2,5,0,0,'','',0,0),(12816,'{11905}<10','APC: Run Time Remaining Low - {HOSTNAME}','',0,2,4,0,0,'','',0,0),(12817,'{11907}>90','APC: Output Load Too High - {HOSTNAME}','',0,2,2,0,0,'','',0,0),(12818,'{11908}>2','HW: Chassis Status','',0,2,5,0,0,'','',0,0),(12819,'{11909}>2','HW: Fan Unit Status','',0,2,5,0,0,'','',0,0),(12820,'{11910}>2','HW: Global System Status','',0,2,5,0,0,'','',0,0),(12821,'{11911}>2','HW: Memory Status','',0,2,5,0,0,'','',0,0),(12822,'{11912}>2','HW: Power Supply Status','',0,2,5,0,0,'','',0,0),(12823,'{11913}>2','HW: Disk Controller 1 Status','',0,2,5,0,0,'','',0,0),(12824,'{11918}>2','HW: Disk Enclosure 1 Status','',0,2,5,0,0,'','',0,0),(12825,'{11915}>2','HW: Disk Controller 2 Status','',0,2,5,0,0,'','',0,0),(12826,'{11919}>2','HW: Disk Enclosure 2 Status','',0,2,5,0,0,'','',0,0),(12827,'{11917}>2','HW: Temperature Status','',0,2,5,0,0,'','',0,0),(12828,'{11922}>4','OM: Chassis Status','',0,2,5,0,0,'','',0,0),(12829,'{11923}>4','OM: Chassis Intrusion','',0,2,5,0,0,'','',0,0),(12830,'{11925}>4','OM: Fan Status','',0,2,5,0,0,'','',0,0),(12831,'{11927}>4','OM: Fan Unit Status','',0,2,5,0,0,'','',0,0),(12832,'{11929}>4','OM: Event Log Status','',0,2,5,0,0,'','',0,0),(12833,'{11931}>4','OM: Global System Status','',0,2,5,0,0,'','',0,0),(12834,'{11933}>4','OM: Memory Status','',0,2,5,0,0,'','',0,0),(12835,'{11935}>4','OM: Power Supply Status','',0,2,5,0,0,'','',0,0),(12836,'{11937}>4','OM: Processor Status','',0,2,5,0,0,'','',0,0),(12837,'{11939}>4','OM: Temperature Status','',0,2,5,0,0,'','',0,0),(12838,'{11941}>4','OM: Voltage Status','',0,2,5,0,0,'','',0,0),(12839,'{11943}>4','OM: Disk Controller 1 Status','',0,2,5,0,0,'','',0,0),(12840,'{11945}>4','OM: Disk Enclosure 1 Status','',0,2,5,0,0,'','',0,0),(12841,'{11947}>4','OM: Disk Controller 2 Status','',0,2,5,0,0,'','',0,0),(12842,'{11949}>4','OM: Disk Enclosure 2 Status','',0,2,5,0,0,'','',0,0),(12843,'{11950}=0','Ping Check','',0,2,3,0,0,'','',0,0),(12844,'{11951}>47','Server Temperature Max Failure Threshold','',0,2,4,0,0,'The internal chassis temperature of the server is above 47 degrees Celsius or 116.6 degrees Fahrenheit.  This exceeds Dell specifications.','',0,0),(12845,'{11952}>42','Server Temperature Max Waring Threshold','',0,2,2,0,0,'The internal chassis temperature of the server is above 42 degrees Celsius or 107.6 degrees Fahrenheit.','',0,0),(12846,'{11953}=1','Port 5 on {HOSTNAME} Status Change','',0,2,3,0,0,'','',0,0),(12847,'{11954}=1','Port 1 on {HOSTNAME} Status Change','',0,2,3,0,0,'','',0,0),(12848,'{11955}=1','Port 2 on {HOSTNAME} Status Change','',0,2,3,0,0,'','',0,0),(12849,'{11956}=1','Port 3 on {HOSTNAME} Status Change','',0,2,3,0,0,'','',0,0),(12850,'{11957}=1','Port 4 on {HOSTNAME} Status Change','',0,2,3,0,0,'','',0,0),(12851,'{11958}=1','Port 6 on {HOSTNAME} Status Change','',0,2,3,0,0,'','',0,0),(12852,'{11959}=1','Port 7 on {HOSTNAME} Status Change','',0,2,3,0,0,'','',0,0),(12853,'{11960}=1','Port 8 on {HOSTNAME} Status Change','',0,2,3,0,0,'','',0,0),(12854,'{11961}=1','Port 9 on {HOSTNAME} Status Change','',0,2,3,0,0,'','',0,0),(12855,'{11962}=1','Port 10 on {HOSTNAME} Status Change','',0,2,3,0,0,'','',0,0),(12856,'{11963}=1','Port 11 on {HOSTNAME} Status Change','',0,2,3,0,0,'','',0,0),(12857,'{11964}=1','Port 12 on {HOSTNAME} Status Change','',0,2,3,0,0,'','',0,0),(12858,'{11965}=1','Port 13 on {HOSTNAME} Status Change','',0,2,3,0,0,'','',0,0),(12859,'{11966}=1','Port 14 on {HOSTNAME} Status Change','',0,2,3,0,0,'','',0,0),(12860,'{11967}=1','Port 15 on {HOSTNAME} Status Change','',0,2,3,0,0,'','',0,0),(12861,'{11968}=1','Port 16 on {HOSTNAME} Status Change','',0,2,3,0,0,'','',0,0),(12862,'{11969}=1','Port 17 on {HOSTNAME} Status Change','',0,2,3,0,0,'','',0,0),(12863,'{11970}=1','Port 18 on {HOSTNAME} Status Change','',0,2,3,0,0,'','',0,0),(12864,'{11971}=1','Port 19 on {HOSTNAME} Status Change','',0,2,3,0,0,'','',0,0),(12865,'{11972}=1','Port 20 on {HOSTNAME} Status Change','',0,2,3,0,0,'','',0,0),(12866,'{11973}=1','Port 21 on {HOSTNAME} Status Change','',0,2,3,0,0,'','',0,0),(12867,'{11974}=1','Port 22 on {HOSTNAME} Status Change','',0,2,3,0,0,'','',0,0),(12868,'{11975}=1','Port 23 on {HOSTNAME} Status Change','',0,2,3,0,0,'','',0,0),(12869,'{11976}=1','Port 24 on {HOSTNAME} Status Change','',0,2,3,0,0,'','',0,0),(12870,'{11977}=1','Port 5 on {HOSTNAME} Status Change','',0,2,3,0,0,'','',0,0),(12871,'{11978}=1','Port 1 on {HOSTNAME} Status Change','',0,2,3,0,0,'','',0,0),(12872,'{11979}=1','Port 2 on {HOSTNAME} Status Change','',0,2,3,0,0,'','',0,0),(12873,'{11980}=1','Port 3 on {HOSTNAME} Status Change','',0,2,3,0,0,'','',0,0),(12874,'{11981}=1','Port 4 on {HOSTNAME} Status Change','',0,2,3,0,0,'','',0,0),(12875,'{11982}=1','Port 6 on {HOSTNAME} Status Change','',0,2,3,0,0,'','',0,0),(12876,'{11983}=1','Port 7 on {HOSTNAME} Status Change','',0,2,3,0,0,'','',0,0),(12877,'{11984}=1','Port 8 on {HOSTNAME} Status Change','',0,2,3,0,0,'','',0,0),(12878,'{11985}=1','Port 9 on {HOSTNAME} Status Change','',0,2,3,0,0,'','',0,0),(12879,'{11986}=1','Port 10 on {HOSTNAME} Status Change','',0,2,3,0,0,'','',0,0),(12880,'{11987}=1','Port 11 on {HOSTNAME} Status Change','',0,2,3,0,0,'','',0,0),(12881,'{11988}=1','Port 12 on {HOSTNAME} Status Change','',0,2,3,0,0,'','',0,0),(12882,'{11989}=1','Port 13 on {HOSTNAME} Status Change','',0,2,3,0,0,'','',0,0),(12883,'{11990}=1','Port 14 on {HOSTNAME} Status Change','',0,2,3,0,0,'','',0,0),(12884,'{11991}=1','Port 15 on {HOSTNAME} Status Change','',0,2,3,0,0,'','',0,0),(12885,'{11992}=1','Port 16 on {HOSTNAME} Status Change','',0,2,3,0,0,'','',0,0),(12886,'{11993}=1','Port 17 on {HOSTNAME} Status Change','',0,2,3,0,0,'','',0,0),(12887,'{11994}=1','Port 18 on {HOSTNAME} Status Change','',0,2,3,0,0,'','',0,0),(12888,'{11995}=1','Port 19 on {HOSTNAME} Status Change','',0,2,3,0,0,'','',0,0),(12889,'{11996}=1','Port 20 on {HOSTNAME} Status Change','',0,2,3,0,0,'','',0,0),(12890,'{11997}=1','Port 21 on {HOSTNAME} Status Change','',0,2,3,0,0,'','',0,0),(12891,'{11998}=1','Port 22 on {HOSTNAME} Status Change','',0,2,3,0,0,'','',0,0),(12892,'{11999}=1','Port 23 on {HOSTNAME} Status Change','',0,2,3,0,0,'','',0,0),(12893,'{12000}=1','Port 24 on {HOSTNAME} Status Change','',0,2,3,0,0,'','',0,0),(12894,'{12001}=1','Port 25 on {HOSTNAME} Status Change','',0,2,3,0,0,'','',0,0),(12895,'{12002}<600','{HOSTNAME} has just been restarted','',0,2,1,0,0,'','',0,0),(12896,'{12003}<600','{HOSTNAME} has just been restarted','',0,2,1,0,0,'','',0,0),(12897,'{12004}#1','Interface Ethernet0 is down on {HOSTNAME}','',0,2,4,0,0,'','',0,0),(12898,'{12005}#1','Interface Ethernet1 is down on {HOSTNAME}','',0,2,4,0,0,'','',0,0),(12899,'{12006}#1','Interface Ethernet2 is down on {HOSTNAME}','',0,2,4,0,0,'','',0,0),(12900,'{12007}#1','Interface Ethernet3 is down on {HOSTNAME}','',0,2,4,0,0,'','',0,0),(12901,'{12008}#1','Interface Ethernet5 is down on {HOSTNAME}','',0,2,4,0,0,'','',0,0),(12902,'{12009}#1','Interface Ethernet4 is down on {HOSTNAME}','',0,2,4,0,0,'','',0,0),(12903,'{12010}<600','{HOSTNAME} has just been restarted','',0,2,1,0,0,'','',0,0),(12904,'{12011}#1','Uplink 1/23 is down on {HOSTNAME}','',0,2,4,0,0,'The uplink 1/23 is down on this switch, the device is still reachable but may have become a single point of failure.','',0,0),(12905,'{12012}#1','Uplink 1/24 is down on {HOSTNAME}','',0,2,4,0,0,'The uplink 1/24 is down on this switch, the device is still reachable but may have become a single point of failure.','',0,0),(12906,'{12013}<600','{HOSTNAME} has just been restarted','',0,2,1,0,0,'','',0,0),(12907,'{12014}#1','Uplink g21 is down on {HOSTNAME}','',0,2,4,0,0,'The uplink g21 is down on this switch, the device is still reachable but may have become a single point of failure.','',0,0),(12908,'{12015}#1','Uplink g22 is down on {HOSTNAME}','',0,2,4,0,0,'The uplink g22 is down on this switch, the device is still reachable but may have become a single point of failure.','',0,0),(12909,'{12016}<1000','Supplies \"Image Fuser Kit\"  low on printer {HOSTNAME}','',0,2,0,0,0,'','',0,0),(12910,'{12017}<1000','Supplies \"Image Transfer Kit\"  low on printer {HOSTNAME}','',0,2,0,0,0,'','',0,0),(12911,'{12018}<1000','Toner black low on printer {HOSTNAME}','',0,2,0,0,0,'','',0,0),(12912,'{12019}<1000','Toner cyan low on printer {HOSTNAME}','',0,2,0,0,0,'','',0,0),(12913,'{12020}<1000','Toner magenta low on printer {HOSTNAME}','',0,2,0,0,0,'','',0,0),(12914,'{12021}<1000','Toner yellow low on printer {HOSTNAME}','',0,2,0,0,0,'','',0,0),(12927,'{12034}=1','{HOSTNAME} is not reachable','',0,2,4,0,0,'','',0,0),(12928,'{12035}#1','{HOSTNAME} uses suboptimal jit compiler','',0,2,2,0,0,'','',0,0),(12929,'{12036}=0','display environment variable set on {HOSTNAME}','',0,2,2,0,0,'','',0,0),(12930,'{12038}>({12037}*0.7)','70% file descriptors used on {HOSTNAME}','',0,2,4,0,0,'','',0,0),(12931,'{12040}>({12039}*0.7)','70% memorypool perm gen used on {HOSTNAME}','',0,2,4,0,0,'','',0,0),(12932,'{12042}={12041}','memory pool perm gen fully committed on {HOSTNAME}','',0,2,3,0,0,'','',0,0),(12933,'{12044}>({12043}*0.7)','70% memorypool code cache used on {HOSTNAME}','',0,2,4,0,0,'','',0,0),(12934,'{12046}={12045}','memory pool code cache fully committed on {HOSTNAME}','',0,2,3,0,0,'','',0,0),(12935,'{12048}>({12047}*0.7)','70% memorypool tenured gen used on {HOSTNAME}','',0,2,4,0,0,'','',0,0),(12936,'{12050}={12049}','memory pool tenured gen fully committed on {HOSTNAME}','',0,2,3,0,0,'','',0,0),(12937,'{12052}>({12051}*0.7)','70% memorypool ps old gen used on {HOSTNAME}','',0,2,4,0,0,'','',0,0),(12938,'{12054}={12053}','memory pool ps old gen fully committed on {HOSTNAME}','',0,2,3,0,0,'','',0,0),(12939,'{12056}>({12055}*0.7)','70% memorypool ps perm gen used on {HOSTNAME}','',0,2,4,0,0,'','',0,0),(12940,'{12058}={12057}','memory pool ps perm gen fully committed on {HOSTNAME}','',0,2,3,0,0,'','',0,0),(12941,'{12060}>({12059}*0.7)','70% memorypool cms old gen used on {HOSTNAME}','',0,2,4,0,0,'','',0,0),(12942,'{12062}={12061}','memory pool cms old gen fully committed on {HOSTNAME}','',0,2,3,0,0,'','',0,0),(12943,'{12064}>({12063}*0.7)','70% memorypool cms perm gen used on {HOSTNAME}','',0,2,4,0,0,'','',0,0),(12944,'{12066}={12065}','memory pool cms perm gen fully committed on {HOSTNAME}','',0,2,3,0,0,'','',0,0),(12945,'{12068}<{12067}','gc marksweepcompact in fire fighting mode on {HOSTNAME}','',0,2,4,0,0,'','',0,0),(12946,'{12070}<{12069}','gc ps marksweep in fire fighting mode on {HOSTNAME}','',0,2,4,0,0,'','',0,0),(12947,'{12072}<{12071}','gc concurrentmarksweep in fire fighting mode on {HOSTNAME}','',0,2,4,0,0,'','',0,0),(12948,'{12073}<4000000','EXNG: Memory Available Bytes','',0,2,3,0,0,'Recommneded to be more than 4000KB','',0,0),(12949,'{12074}>20','EXNG: Memory Pages per sec','',0,2,3,0,0,'','',0,0),(12950,'{12075}>75','EXNG: Page File Usage','',0,2,3,0,0,'','',0,0),(12951,'{12076}#0','EXNG: Service State - Event','',0,2,4,0,0,'','',0,0),(12952,'{12077}#0','EXNG: Service State - IMAP4','',0,2,4,0,0,'','',0,0),(12953,'{12078}#0','EXNG: Service State - Information Store','',0,2,4,0,0,'','',0,0),(12954,'{12079}#0','EXNG: Service State - Management','',0,2,4,0,0,'','',0,0),(12955,'{12080}#0','EXNG: Service State - MTA Stacks','',0,2,4,0,0,'','',0,0),(12956,'{12081}#0','EXNG: Service State - Network News Transfer Protocol (NNTP)','',0,2,4,0,0,'','',0,0),(12957,'{12082}#0','EXNG: Service State - POP3','',0,2,4,0,0,'','',0,0),(12958,'{12083}#0','EXNG: Service State - Routing Engine','',0,2,4,0,0,'','',0,0),(12959,'{12084}#0','EXNG: Service State - Simple Mail Transfer Protocol (SMTP)','',0,2,4,0,0,'','',0,0),(12960,'{12085}#0','EXNG: Service State - Site Replication Service','',0,2,4,0,0,'','',0,0),(12961,'{12086}#0','EXNG: Service State - System Attendant','',0,2,4,0,0,'','',0,0),(12962,'{12087}>0','{HOSTNAME} has WWW Service State In Questionable State','',0,2,2,0,0,'','',0,0),(12963,'{12088}>0','{HOSTNAME} has Exchange Information Store in Questionable State','',0,2,4,0,0,'','',0,0),(12964,'{12089}>0','{HOSTNAME} has Exchange Transport in Questionable State','',0,2,4,0,0,'','',0,0),(12965,'{12090}>0','{HOSTNAME} has Exchange Mail Submission Service in Questionable State','',0,2,4,0,0,'','',0,0),(12966,'{12091}>0','{HOSTNAME} has Exchange System Attendant in Questionable State','',0,2,4,0,0,'','',0,0),(12967,'{12092}>0','{HOSTNAME} has Exchange Service Host Service in Questionable State','',0,2,4,0,0,'','',0,0),(12968,'{12093}>0','{HOSTNAME} has IIS Admin Service Service in Questionable State.','',0,2,2,0,0,'','',0,0),(12969,'{12094}>0','{HOSTNAME} has Exchange Active Directory Topology Service in Questionable State.','',0,2,4,0,0,'','',0,0),(12970,'{12096}>({12095}*0.7)','70% jk-8009 worker threads busy on {HOSTNAME}','',0,2,4,0,0,'','',0,0),(12971,'{12097}=1','gzip compression is off for connector http-8080 on {HOSTNAME}','',0,2,2,0,0,'','',0,0),(12972,'{12099}>({12098}*0.7)','70% http-8080 worker threads busy on {HOSTNAME}','',0,2,4,0,0,'','',0,0),(12973,'{12100}=1','gzip compression is off for connector http-8443 on {HOSTNAME}','',0,2,2,0,0,'','',0,0),(12974,'{12102}>({12101}*0.7)','70% http-8443 worker threads busy on {HOSTNAME}','',0,2,4,0,0,'','',0,0),(12975,'{12103}#0','SQL: Service State - SQL Server','',0,2,4,0,0,'','',0,0),(12976,'{12104}#0','SQL: Service State - Analysis Services','',0,2,4,0,0,'','',0,0),(12977,'{12105}#0','SQL: Service State - Integration Services','',0,2,4,0,0,'','',0,0),(12978,'{12106}#0','SQL: Service State - Reporting Services','',0,2,4,0,0,'','',0,0),(12979,'{12107}#0','SQL: Service State - SQL Agent','',0,2,4,0,0,'','',0,0),(12980,'{12108}#0','SQL: Service State - SQL Browser','',0,2,4,0,0,'','',0,0),(12981,'{12109}>80','NS CPU 1 min avg > 80%','',0,2,3,0,0,'','',0,0),(12982,'{12110}>70','NS CPU 1 min avg > 70%','',0,2,2,0,0,'','',0,0),(12983,'{12111}>70','NS CPU 5 min avg > 70%','',0,2,3,0,0,'','',0,0),(12984,'{12112}>60','NS CPU 5 min avg > 60%','',0,2,2,0,0,'','',0,0),(12985,'{12113}>50','NS CPU 15 min avg > 50%','',0,2,2,0,0,'','',0,0),(12986,'{12114}>60','NS CPU 15 min avg > 60%','',0,2,3,0,0,'','',0,0),(12987,'{12115}>1000','NS Sessions > 50% Capacity','',0,2,2,0,0,'','',0,0),(12988,'{12116}>1800','NS Sessions > 90% Capacity','',0,2,4,0,0,'','',0,0),(12989,'{12117}>1500','NS Sessions > 75% Capacity','',0,2,3,0,0,'','',0,0),(12990,'{12118}>1','NS Int 1 In Errors > 1','',0,2,3,0,0,'','',0,0),(12991,'{12119}>1','NS Int 2 In Errors > 1','',0,2,3,0,0,'','',0,0),(12992,'{12120}>1','NS Int 4 In Errors > 1','',0,2,3,0,0,'','',0,0),(12993,'{12121}>1','NS Int 3 In Errors > 1','',0,2,3,0,0,'','',0,0),(12994,'{12122}>1','NS Int 1 Out Errors > 1','',0,2,3,0,0,'','',0,0),(12995,'{12123}>1','NS Int 2 Out Errors > 1','',0,2,3,0,0,'','',0,0),(12996,'{12124}>1','NS Int 3 Out Errors > 1','',0,2,3,0,0,'','',0,0),(12997,'{12125}>1','NS Int 4 Out Errors > 1','',0,2,3,0,0,'','',0,0),(12998,'{12126}<1','NS Ping Check','',0,2,5,0,0,'','',0,0),(12999,'{12127}>1','Latency > 1 second','',0,2,4,0,0,'','',0,0),(13001,'{12131}=0','Jenkins server:http.check','',0,0,1,1404842998,0,'','',0,0);
/*!40000 ALTER TABLE `triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_history`
--

DROP TABLE IF EXISTS `user_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_history` (
  `userhistoryid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `userid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `title1` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `url1` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `title2` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `url2` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `title3` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `url3` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `title4` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `url4` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `title5` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `url5` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`userhistoryid`),
  UNIQUE KEY `user_history_1` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_history`
--

LOCK TABLES `user_history` WRITE;
/*!40000 ALTER TABLE `user_history` DISABLE KEYS */;
INSERT INTO `user_history` VALUES (1,1,'S_HOST_GROUPS','hostgroups.php','S_CONFIGURATION_OF_WEB_MONITORING','httpconf.php?groupid=6&hostid=10048','S_DASHBOARD','dashboard.php','S_STATUS_OF_WEB_MONITORING','httpmon.php?open=1&groupid=6&hostid=0','S_DETAILS_OF_SCENARIO','httpdetails.php?httptestid=2');
/*!40000 ALTER TABLE `user_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `userid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `alias` varchar(100) COLLATE utf8_bin NOT NULL DEFAULT '',
  `name` varchar(100) COLLATE utf8_bin NOT NULL DEFAULT '',
  `surname` varchar(100) COLLATE utf8_bin NOT NULL DEFAULT '',
  `passwd` char(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `url` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `autologin` int(11) NOT NULL DEFAULT '0',
  `autologout` int(11) NOT NULL DEFAULT '900',
  `lang` varchar(5) COLLATE utf8_bin NOT NULL DEFAULT 'en_gb',
  `refresh` int(11) NOT NULL DEFAULT '30',
  `type` int(11) NOT NULL DEFAULT '0',
  `theme` varchar(128) COLLATE utf8_bin NOT NULL DEFAULT 'default.css',
  `attempt_failed` int(11) NOT NULL DEFAULT '0',
  `attempt_ip` varchar(39) COLLATE utf8_bin NOT NULL DEFAULT '',
  `attempt_clock` int(11) NOT NULL DEFAULT '0',
  `rows_per_page` int(11) NOT NULL DEFAULT '50',
  PRIMARY KEY (`userid`),
  KEY `users_1` (`alias`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Admin','Zabbix','Administrator','5fce1b3e34b520afeffb37ce08c7cd66','',0,900,'en_gb',30,3,'default.css',0,'',0,50),(2,'guest','Default','User','d41d8cd98f00b204e9800998ecf8427e','',0,900,'en_gb',30,1,'default.css',0,'',0,50);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_groups`
--

DROP TABLE IF EXISTS `users_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_groups` (
  `id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `usrgrpid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `userid` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `users_groups_1` (`usrgrpid`,`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_groups`
--

LOCK TABLES `users_groups` WRITE;
/*!40000 ALTER TABLE `users_groups` DISABLE KEYS */;
INSERT INTO `users_groups` VALUES (1,7,1),(2,8,2);
/*!40000 ALTER TABLE `users_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usrgrp`
--

DROP TABLE IF EXISTS `usrgrp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usrgrp` (
  `usrgrpid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `gui_access` int(11) NOT NULL DEFAULT '0',
  `users_status` int(11) NOT NULL DEFAULT '0',
  `api_access` int(11) NOT NULL DEFAULT '0',
  `debug_mode` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`usrgrpid`),
  KEY `usrgrp_1` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usrgrp`
--

LOCK TABLES `usrgrp` WRITE;
/*!40000 ALTER TABLE `usrgrp` DISABLE KEYS */;
INSERT INTO `usrgrp` VALUES (1,'UNIX administrators',0,0,0,0),(2,'Database administrators',0,0,0,0),(3,'Network administrators',0,0,0,0),(4,'Security specialists',0,0,0,0),(5,'WEB administrators',0,0,0,0),(6,'Head of IT department',0,0,0,0),(7,'Zabbix administrators',0,0,0,0),(8,'Guests',0,0,0,0),(9,'Disabled',0,1,0,0),(10,'API access',0,0,1,0);
/*!40000 ALTER TABLE `usrgrp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `valuemaps`
--

DROP TABLE IF EXISTS `valuemaps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `valuemaps` (
  `valuemapid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`valuemapid`),
  KEY `valuemaps_1` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `valuemaps`
--

LOCK TABLES `valuemaps` WRITE;
/*!40000 ALTER TABLE `valuemaps` DISABLE KEYS */;
INSERT INTO `valuemaps` VALUES (4,'APC Battery Replacement Status'),(5,'APC Battery Status'),(7,'Dell Open Manage System Status'),(6,'HP Insight System Status'),(2,'Host status'),(1,'Service state'),(3,'Windows service state');
/*!40000 ALTER TABLE `valuemaps` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-07-08 18:16:08