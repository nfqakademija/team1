-- MySQL dump 10.13  Distrib 5.7.27, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: symfony
-- ------------------------------------------------------
-- Server version	5.5.5-10.3.13-MariaDB-1:10.3.13+maria~bionic

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
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `id_category` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(75) NOT NULL,
  `picture` varchar(255) DEFAULT NULL,
  `summary` text DEFAULT NULL,
  PRIMARY KEY (`id_category`),
  UNIQUE KEY `Id_Category_UNIQUE` (`id_category`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migration_versions`
--

DROP TABLE IF EXISTS `migration_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migration_versions` (
  `version` varchar(14) COLLATE utf8mb4_unicode_ci NOT NULL,
  `executed_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migration_versions`
--

LOCK TABLES `migration_versions` WRITE;
/*!40000 ALTER TABLE `migration_versions` DISABLE KEYS */;
INSERT INTO `migration_versions` VALUES ('20191117144206','2019-11-17 14:42:12');
/*!40000 ALTER TABLE `migration_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order` (
  `id_order` int(11) NOT NULL AUTO_INCREMENT,
  `price_total` int(11) NOT NULL,
  `fk_order_vehicle_data` int(11) DEFAULT NULL,
  `fk_user` int(11) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  PRIMARY KEY (`id_order`),
  UNIQUE KEY `id_order_UNIQUE` (`id_order`),
  KEY `fk_order_order_vehicle_data1_idx` (`fk_order_vehicle_data`),
  KEY `fk_order_user1_idx` (`fk_user`),
  CONSTRAINT `fk_order_order_vehicle_data1` FOREIGN KEY (`fk_order_vehicle_data`) REFERENCES `order_vehicle_data` (`id_order_vehicle_data`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_order_user1` FOREIGN KEY (`fk_user`) REFERENCES `user` (`id_user`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_state`
--

DROP TABLE IF EXISTS `order_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_state` (
  `id_order_state` int(11) NOT NULL AUTO_INCREMENT,
  `state` varchar(45) NOT NULL,
  `fk_order` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_order_state`),
  UNIQUE KEY `id_order_status_UNIQUE` (`id_order_state`),
  KEY `fk_order_status_order1_idx` (`fk_order`),
  CONSTRAINT `fk_order_status_order1` FOREIGN KEY (`fk_order`) REFERENCES `order` (`id_order`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_state`
--

LOCK TABLES `order_state` WRITE;
/*!40000 ALTER TABLE `order_state` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_status_log`
--

DROP TABLE IF EXISTS `order_status_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_status_log` (
  `id_order_status_log` int(11) NOT NULL,
  `fk_order` int(11) DEFAULT NULL,
  `previous_state` varchar(45) DEFAULT NULL,
  `current_state` varchar(45) NOT NULL,
  `date` datetime DEFAULT NULL,
  `fk_user` int(11) NOT NULL,
  PRIMARY KEY (`id_order_status_log`,`fk_user`),
  UNIQUE KEY `id_order_status_log_UNIQUE` (`id_order_status_log`),
  KEY `fk_order_status_log_order1_idx` (`fk_order`),
  KEY `fk_order_status_log_user1_idx` (`fk_user`),
  CONSTRAINT `fk_order_status_log_order1` FOREIGN KEY (`fk_order`) REFERENCES `order` (`id_order`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_order_status_log_user1` FOREIGN KEY (`fk_user`) REFERENCES `user` (`id_user`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_status_log`
--

LOCK TABLES `order_status_log` WRITE;
/*!40000 ALTER TABLE `order_status_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_status_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_to_service`
--

DROP TABLE IF EXISTS `order_to_service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_to_service` (
  `fk_service` int(11) NOT NULL,
  `fk_order` int(11) NOT NULL,
  PRIMARY KEY (`fk_service`,`fk_order`),
  KEY `IDX_DCDF5A7211B2A7FE` (`fk_service`),
  KEY `IDX_DCDF5A7234C4B0ED` (`fk_order`),
  CONSTRAINT `fk_service_has_order_order1` FOREIGN KEY (`fk_order`) REFERENCES `order` (`id_order`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_service_has_order_service1` FOREIGN KEY (`fk_service`) REFERENCES `service` (`id_service`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_to_service`
--

LOCK TABLES `order_to_service` WRITE;
/*!40000 ALTER TABLE `order_to_service` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_to_service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_to_vehicle_ecu_file`
--

DROP TABLE IF EXISTS `order_to_vehicle_ecu_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_to_vehicle_ecu_file` (
  `fk_order` int(11) NOT NULL,
  `fk_vehicle_ecu_file` int(11) NOT NULL,
  PRIMARY KEY (`fk_order`,`fk_vehicle_ecu_file`),
  KEY `IDX_2360B0C634C4B0ED` (`fk_order`),
  KEY `IDX_2360B0C680786249` (`fk_vehicle_ecu_file`),
  CONSTRAINT `fk_order_has_vehicle_ecu_file_order1` FOREIGN KEY (`fk_order`) REFERENCES `order` (`id_order`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_order_has_vehicle_ecu_file_vehicle_ecu_file1` FOREIGN KEY (`fk_vehicle_ecu_file`) REFERENCES `vehicle_ecu_file` (`id_vehicle_ecu_file`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_to_vehicle_ecu_file`
--

LOCK TABLES `order_to_vehicle_ecu_file` WRITE;
/*!40000 ALTER TABLE `order_to_vehicle_ecu_file` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_to_vehicle_ecu_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_vehicle_data`
--

DROP TABLE IF EXISTS `order_vehicle_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_vehicle_data` (
  `id_order_vehicle_data` int(11) NOT NULL AUTO_INCREMENT,
  `year` int(11) DEFAULT NULL,
  `power` int(11) DEFAULT NULL,
  `displacement` int(11) DEFAULT NULL,
  `ecu_model` varchar(75) DEFAULT NULL,
  `fk_vehicle_model` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_order_vehicle_data`),
  UNIQUE KEY `id_order_vehicle_data_UNIQUE` (`id_order_vehicle_data`),
  KEY `fk_order_vehicle_data_vehicle_model1_idx` (`fk_vehicle_model`),
  CONSTRAINT `fk_order_vehicle_data_vehicle_model1` FOREIGN KEY (`fk_vehicle_model`) REFERENCES `vehicle_model` (`id_vehicle_model`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_vehicle_data`
--

LOCK TABLES `order_vehicle_data` WRITE;
/*!40000 ALTER TABLE `order_vehicle_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_vehicle_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service`
--

DROP TABLE IF EXISTS `service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `service` (
  `id_service` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(75) NOT NULL,
  `price` int(11) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `fk_category` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_service`),
  UNIQUE KEY `id_service_UNIQUE` (`id_service`),
  KEY `fk_category_idx` (`fk_category`),
  CONSTRAINT `fk_category` FOREIGN KEY (`fk_category`) REFERENCES `category` (`id_category`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service`
--

LOCK TABLES `service` WRITE;
/*!40000 ALTER TABLE `service` DISABLE KEYS */;
/*!40000 ALTER TABLE `service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id_user` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(45) NOT NULL,
  `password` varchar(255) NOT NULL,
  `confirmation_hash` varchar(255) DEFAULT NULL,
  `is_confirmed` tinyint(1) DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `is_admin` tinyint(1) NOT NULL,
  PRIMARY KEY (`id_user`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicle_ecu_file`
--

DROP TABLE IF EXISTS `vehicle_ecu_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vehicle_ecu_file` (
  `id_vehicle_ecu_file` int(11) NOT NULL AUTO_INCREMENT,
  `filename` varchar(75) NOT NULL,
  `hash` varchar(255) DEFAULT 'NULL',
  `type` varchar(20) NOT NULL,
  PRIMARY KEY (`id_vehicle_ecu_file`),
  UNIQUE KEY `id_file_UNIQUE` (`id_vehicle_ecu_file`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicle_ecu_file`
--

LOCK TABLES `vehicle_ecu_file` WRITE;
/*!40000 ALTER TABLE `vehicle_ecu_file` DISABLE KEYS */;
/*!40000 ALTER TABLE `vehicle_ecu_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicle_make`
--

DROP TABLE IF EXISTS `vehicle_make`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vehicle_make` (
  `id_vehicle_make` int(11) NOT NULL AUTO_INCREMENT,
  `make` varchar(45) NOT NULL,
  PRIMARY KEY (`id_vehicle_make`),
  UNIQUE KEY `id_vehicle_make_UNIQUE` (`id_vehicle_make`)
) ENGINE=InnoDB AUTO_INCREMENT=125 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicle_make`
--

LOCK TABLES `vehicle_make` WRITE;
/*!40000 ALTER TABLE `vehicle_make` DISABLE KEYS */;
INSERT INTO `vehicle_make` VALUES (1,'AC'),(2,'Acura'),(3,'Aixam'),(4,'AlfaRomeo'),(5,'Alpina'),(6,'AMC'),(7,'ARO'),(8,'Asia'),(9,'AstonMartin'),(10,'Audi'),(11,'AustinRover'),(12,'Austin-Healey'),(13,'Bentley'),(14,'BMW'),(15,'Briliance'),(16,'Bugatti'),(17,'Buick'),(18,'Cadillac'),(19,'Chevrolet'),(20,'Chrysler'),(21,'Citroen'),(22,'Cobra'),(23,'Dacia'),(24,'Daewoo'),(25,'DAF'),(26,'Daihatsu'),(27,'Datsun'),(28,'Delorean'),(29,'Desoto'),(30,'Dodge'),(31,'DRMotor'),(32,'Eagle'),(33,'Ferrari'),(34,'Fiat'),(35,'Fisker'),(36,'Ford'),(37,'GAZ'),(38,'Geo'),(39,'GMC'),(40,'Gonow'),(41,'GreatWall'),(42,'Honda'),(43,'Hudson'),(44,'Hummer'),(45,'Hyundai'),(46,'Infiniti'),(47,'International'),(48,'Isuzu'),(49,'Iveco'),(50,'Jaguar'),(51,'Jeep'),(52,'Kia'),(53,'Koenigsegg'),(54,'Lada'),(55,'Lamborghini'),(56,'Lancia'),(57,'LandRover'),(58,'Landwind'),(59,'Lexus'),(60,'Ligier'),(61,'Lincoln'),(62,'Lotus'),(63,'LuAZ'),(64,'Mahindra'),(65,'Maserati'),(66,'Maybach'),(67,'Mazda'),(68,'Mclaren'),(69,'Mercedes-Benz'),(70,'Mercury'),(71,'MG'),(72,'Microcar'),(73,'Mini'),(74,'Mitsubishi'),(75,'Morgan'),(76,'Moskvich'),(77,'Nissan'),(78,'Norster'),(79,'Nysa'),(80,'Oldsmobile'),(81,'Opel'),(82,'Packard'),(83,'Peugeot'),(84,'Plymouth'),(85,'Pontiac'),(86,'Porsche'),(87,'Proton'),(88,'Renault'),(89,'Rolls-Royce'),(90,'Roosevelt'),(91,'Rover'),(92,'Saab'),(93,'Santana'),(94,'Saturn'),(95,'Scion'),(96,'Seat'),(97,'Secma'),(98,'Shuanghuan'),(99,'Skoda'),(100,'Smart'),(101,'Spartan'),(102,'Spyker'),(103,'SsangYong'),(104,'Studebaker'),(105,'Subaru'),(106,'Suzuki'),(107,'Talbot'),(108,'Tartan'),(109,'Tata'),(110,'Tatra'),(111,'Tazzari'),(112,'Tesla'),(113,'Think'),(114,'Toyota'),(115,'Trabant'),(116,'Triumph'),(117,'UAZ'),(118,'Vauxhall'),(119,'Venturi'),(120,'Volkswagen'),(121,'Volvo'),(122,'Wanderer'),(123,'Wartburg'),(124,'ZAZ');
/*!40000 ALTER TABLE `vehicle_make` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicle_model`
--

DROP TABLE IF EXISTS `vehicle_model`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vehicle_model` (
  `id_vehicle_model` int(11) NOT NULL AUTO_INCREMENT,
  `model` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fk_vehicle_make` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_vehicle_model`),
  UNIQUE KEY `id_vehicle_model_UNIQUE` (`id_vehicle_model`),
  KEY `fk_vehicle_model_vehicle_make1_idx` (`fk_vehicle_make`),
  CONSTRAINT `fk_vehicle_model_vehicle_make1` FOREIGN KEY (`fk_vehicle_make`) REFERENCES `vehicle_make` (`id_vehicle_make`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2497 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicle_model`
--

LOCK TABLES `vehicle_model` WRITE;
/*!40000 ALTER TABLE `vehicle_model` DISABLE KEYS */;
INSERT INTO `vehicle_model` VALUES (1,'-other-',1),(2,'Ace',1),(3,'Aceca',1),(4,'Cobra',1),(5,'-other-',2),(6,'CL',2),(7,'EL',2),(8,'ILX',2),(9,'Integra',2),(10,'MDX',2),(11,'NSX',2),(12,'RDX',2),(13,'RL',2),(14,'RLX',2),(15,'RSX',2),(16,'SLX',2),(17,'TL',2),(18,'TLX',2),(19,'TSX',2),(20,'Vigor',2),(21,'ZDX',2),(22,'-other-',3),(23,'400',3),(24,'500',3),(25,'A751',3),(26,'City',3),(27,'Crossline',3),(28,'Ligier',3),(29,'Scouty',3),(30,'-other-',4),(31,'145',4),(32,'146',4),(33,'147',4),(34,'155',4),(35,'156',4),(36,'159',4),(37,'164',4),(38,'166',4),(39,'33',4),(40,'4C',4),(41,'75',4),(42,'8C',4),(43,'90',4),(44,'Alfasud',4),(45,'Alfetta',4),(46,'Arna',4),(47,'Brera',4),(48,'Crosswagon Q4',4),(49,'Giulia',4),(50,'Giulietta',4),(51,'GT',4),(52,'GTV',4),(53,'Junior',4),(54,'Mito',4),(55,'RZ\\/SZ',4),(56,'Spider',4),(57,'Sportwagon',4),(58,'Sprint',4),(59,'Stelvio ',4),(60,'B10',5),(61,'B12',5),(62,'B3',5),(63,'B5',5),(64,'B6',5),(65,'B7',5),(66,'B8',5),(67,'D10',5),(68,'D3',5),(69,'Roadster S',5),(70,'-other-',6),(71,'Ambassador',6),(72,'Concord',6),(73,'Eagle',6),(74,'Gremlin',6),(75,'Javelin',6),(76,'Matador',6),(77,'Pacer',6),(78,'Rambler',6),(79,'Rebel',6),(80,'Spirit',6),(81,'-other-',7),(82,'10',7),(83,'24',7),(84,'243',7),(85,'244',7),(86,'245',7),(87,'246',7),(88,'K450',7),(89,'Spartana',7),(90,'-other-',8),(91,'Hi-Topic',8),(92,'Retona',8),(93,'Rocsta',8),(94,'Towner',8),(95,'-other-',9),(96,'AR1',9),(97,'Cygnet',9),(98,'DB',9),(99,'DB7',9),(100,'DB9',9),(101,'DBS',9),(102,'Lagonda',9),(103,'Rapide',9),(104,'Vanquish',9),(105,'Vantage',9),(106,'Virage',9),(107,'Volante',9),(108,'Zagato',9),(109,'-other-',10),(110,'100',10),(111,'200',10),(112,'5000',10),(113,'80',10),(114,'90',10),(115,'A1',10),(116,'A2',10),(117,'A3',10),(118,'A4',10),(119,'A4 ALLROAD',10),(120,'A5',10),(121,'A5 SPORTBACK',10),(122,'A6',10),(123,'A6 ALLROAD',10),(124,'A7 SPORTBACK',10),(125,'A8',10),(126,'Allroad',10),(127,'Cabriolet',10),(128,'Coupe',10),(129,'Q2',10),(130,'Q3',10),(131,'Q5',10),(132,'Q7',10),(133,'Quattro',10),(134,'R8',10),(135,'RS Q3',10),(136,'RS2',10),(137,'RS3',10),(138,'RS4',10),(139,'RS5',10),(140,'RS6',10),(141,'RS7',10),(142,'S1',10),(143,'S2',10),(144,'S3',10),(145,'S4',10),(146,'S5',10),(147,'S6',10),(148,'S7',10),(149,'S8',10),(150,'SQ5',10),(151,'SQ7',10),(152,'TT',10),(153,'TT RS',10),(154,'TTS',10),(155,'V8',10),(156,'-kita- ',11),(157,'-Kita-',12),(158,'MK 3000',12),(159,'-other-',13),(160,'Arnage',13),(161,'Azure',13),(162,'Bentayga',13),(163,'Brooklands',13),(164,'Continental',13),(165,'Eight',13),(166,'Flying Spur',13),(167,'Mulsanne',13),(168,'S1',13),(169,'Turbo R',13),(170,'-other-',14),(171,'1 serija',14),(172,'114',14),(173,'116',14),(174,'118',14),(175,'120',14),(176,'123',14),(177,'125',14),(178,'128',14),(179,'130',14),(180,'135',14),(181,'2 serija',14),(182,'214 Active Tourer',14),(183,'216 Active Tourer',14),(184,'216 Gran Tourer',14),(185,'218',14),(186,'218 Active Tourer',14),(187,'218 Gran Tourer',14),(188,'220',14),(189,'220 Active Tourer',14),(190,'220 Gran Tourer',14),(191,'225',14),(192,'225 Active Tourer',14),(193,'228',14),(194,'3 serija',14),(195,'315',14),(196,'316',14),(197,'318',14),(198,'318 Gran turismo',14),(199,'320',14),(200,'320 Gran turismo',14),(201,'323',14),(202,'324',14),(203,'325',14),(204,'325 Gran turismo',14),(205,'327',14),(206,'328',14),(207,'328 Gran turismo',14),(208,'330',14),(209,'330 Gran turismo',14),(210,'335',14),(211,'335 Gran turismo',14),(212,'340',14),(213,'346',14),(214,'Active Hybrid 3',14),(215,'4 serija',14),(216,'418 Gran Coupe',14),(217,'420',14),(218,'420 Gran Coupe',14),(219,'425',14),(220,'428',14),(221,'428 Gran Coupe',14),(222,'430',14),(223,'430 Gran Coupe',14),(224,'435',14),(225,'435 Gran Coupe',14),(226,'440',14),(227,'5 serija',14),(228,'518',14),(229,'520',14),(230,'520 Gran turismo',14),(231,'523',14),(232,'524',14),(233,'525',14),(234,'528',14),(235,'530',14),(236,'530 Gran Turismo',14),(237,'535',14),(238,'535 Gran Turismo',14),(239,'540',14),(240,'545',14),(241,'550',14),(242,'550 Gran turismo',14),(243,'Active Hybrid 5',14),(244,'6 serija',14),(245,'628',14),(246,'630',14),(247,'630 Gran Turismo',14),(248,'632',14),(249,'633',14),(250,'635',14),(251,'640',14),(252,'640 Gran Coupe',14),(253,'640 Gran Turismo',14),(254,'645',14),(255,'650',14),(256,'650 Gran Coupe',14),(257,'7 serija',14),(258,'725',14),(259,'728',14),(260,'730',14),(261,'732',14),(262,'735',14),(263,'740',14),(264,'745',14),(265,'750',14),(266,'760',14),(267,'Active Hybrid 7',14),(268,'8 serija',14),(269,'840',14),(270,'850',14),(271,'i serija',14),(272,'i3',14),(273,'i8',14),(274,'M serija',14),(275,'1M Coupe',14),(276,'M Coupe',14),(277,'M Roadster',14),(278,'M1',14),(279,'M135',14),(280,'M2',14),(281,'M235',14),(282,'M3',14),(283,'M4',14),(284,'M5',14),(285,'M550',14),(286,'M6',14),(287,'X serija',14),(288,'X1',14),(289,'X2',14),(290,'X3',14),(291,'X4',14),(292,'X5',14),(293,'X5 M',14),(294,'X6',14),(295,'X6 M',14),(296,'Z serija',14),(297,'Z1',14),(298,'Z3',14),(299,'Z3 M',14),(300,'Z4',14),(301,'Z4 M',14),(302,'Z8',14),(303,'1502',14),(304,'1602',14),(305,'1802',14),(306,'2002',14),(307,'2800CS',14),(308,'-kita- ',15),(309,'Andere',15),(310,'BC3',15),(311,'BS2',15),(312,'BS4',15),(313,'BS6',15),(314,'-other-',16),(315,'Veyron',16),(316,'-other-',17),(317,'Century',17),(318,'Electra',17),(319,'Enclave',17),(320,'Encore',17),(321,'LaCrosse',17),(322,'Le Sabre',17),(323,'LeSabre',17),(324,'Lucerne',17),(325,'Park Avenue',17),(326,'Rainier',17),(327,'Regal',17),(328,'Rendezvous',17),(329,'Riviera',17),(330,'Roadmaster',17),(331,'Skylark',17),(332,'Super',17),(333,'Terraza',17),(334,'Verano',17),(335,'Wildcat',17),(336,'-other-',18),(337,'Allante',18),(338,'ATS',18),(339,'BLS',18),(340,'Catera',18),(341,'CT6',18),(342,'CTS',18),(343,'DeVille',18),(344,'DTS',18),(345,'Eldorado',18),(346,'Escalade',18),(347,'Fleetwood',18),(348,'Seville',18),(349,'SRX',18),(350,'STS',18),(351,'Vizon',18),(352,'XLR',18),(353,'XT5',18),(354,'XTS',18),(355,'-other-',19),(356,'2500',19),(357,'Alero',19),(358,'Astro',19),(359,'Avalanche',19),(360,'Aveo',19),(361,'Bel Air',19),(362,'Beretta',19),(363,'Blazer',19),(364,'C1500',19),(365,'Camaro',19),(366,'Caprice',19),(367,'Captiva',19),(368,'Cavalier',19),(369,'Chevelle',19),(370,'Chevy Van',19),(371,'Citation',19),(372,'Cobalt',19),(373,'Colorado',19),(374,'Corsica',19),(375,'Corvette',19),(376,'Cruze',19),(377,'El Camino',19),(378,'Epica',19),(379,'Equinox',19),(380,'Evanda',19),(381,'Express',19),(382,'HHR',19),(383,'Impala',19),(384,'Ipanema',19),(385,'Kalos',19),(386,'Lacetti',19),(387,'Lumina',19),(388,'M-1009',19),(389,'Malibu',19),(390,'Matiz',19),(391,'Metro',19),(392,'Monte Carlo',19),(393,'Monza',19),(394,'Nubira',19),(395,'Orlando',19),(396,'Pickup',19),(397,'Prizm',19),(398,'Rezzo',19),(399,'S-10',19),(400,'Silverado',19),(401,'Sonic',19),(402,'Spark',19),(403,'Special Deluxe',19),(404,'SS',19),(405,'SSR',19),(406,'Suburban',19),(407,'Tacuma',19),(408,'Tahoe',19),(409,'Tracker',19),(410,'TrailBlazer',19),(411,'Trans Sport',19),(412,'Traverse',19),(413,'Trax',19),(414,'Uplander',19),(415,'Venture',19),(416,'Volt',19),(417,'-other-',20),(418,'200',20),(419,'300',20),(420,'300C',20),(421,'300M',20),(422,'Aspen',20),(423,'Cirrus',20),(424,'Concorde',20),(425,'Conquest',20),(426,'Crossfire',20),(427,'Daytona',20),(428,'Daytona Shelby',20),(429,'ES',20),(430,'Grand Voyager',20),(431,'Imperial',20),(432,'Intrepid',20),(433,'Le Baron',20),(434,'LHS',20),(435,'Neon',20),(436,'New Yorker',20),(437,'Newport',20),(438,'Pacifica',20),(439,'Plymouth',20),(440,'Prowler',20),(441,'PT Cruiser',20),(442,'Saratoga',20),(443,'Sebring',20),(444,'Stratus',20),(445,'Town & Country',20),(446,'Valiant',20),(447,'Viper',20),(448,'Vision',20),(449,'Voyager',20),(450,'-other-',21),(451,'2 CV',21),(452,'AX',21),(453,'Berlingo',21),(454,'BX',21),(455,'C-Crosser',21),(456,'C-Elysee',21),(457,'C-Zero',21),(458,'C1',21),(459,'C15',21),(460,'C2',21),(461,'C25',21),(462,'C3',21),(463,'C3 Aircross',21),(464,'C3 Picasso  ',21),(465,'C3 Pluriel',21),(466,'C4',21),(467,'C4 Aircross',21),(468,'C4 Cactus',21),(469,'C4 Picasso',21),(470,'C5',21),(471,'C6',21),(472,'C8',21),(473,'CX',21),(474,'DS',21),(475,'DS3',21),(476,'DS4',21),(477,'DS5',21),(478,'Evasion',21),(479,'Grand C4 Picasso',21),(480,'GSA',21),(481,'Jumper',21),(482,'Jumpy',21),(483,'Nemo',21),(484,'Saxo',21),(485,'SM',21),(486,'Spacetourer',21),(487,'Synergie',21),(488,'Visa',21),(489,'Xantia',21),(490,'XM',21),(491,'Xsara',21),(492,'Xsara Picasso',21),(493,'ZX',21),(494,'-other-',22),(495,'AC',22),(496,'-other-',23),(497,'Dokker',23),(498,'Duster',23),(499,'Lodgy',23),(500,'Logan',23),(501,'Sandero',23),(502,'-other-',24),(503,'Espero',24),(504,'Evanda',24),(505,'Istana',24),(506,'Kalos',24),(507,'Korando',24),(508,'Labo',24),(509,'Lacetti',24),(510,'Lanos',24),(511,'Leganza',24),(512,'Lublin',24),(513,'Magnus',24),(514,'Matiz',24),(515,'Musso',24),(516,'Nexia',24),(517,'Nubira',24),(518,'Polonez',24),(519,'Prince',24),(520,'Racer',24),(521,'Rexton',24),(522,'Rezzo',24),(523,'Tacuma',24),(524,'Tico',24),(525,'-other-',25),(526,'33',25),(527,'44',25),(528,'46',25),(529,'55',25),(530,'600',25),(531,'66',25),(532,'-other-',26),(533,'1000',26),(534,'1000',26),(535,'Applause',26),(536,'Charade',26),(537,'Charmant',26),(538,'Copen',26),(539,'Cuore',26),(540,'Delta',26),(541,'Feroza',26),(542,'Freeclimber',26),(543,'Gran Move',26),(544,'Hi Jet',26),(545,'Leeza',26),(546,'Materia',26),(547,'Max',26),(548,'Mira',26),(549,'Move',26),(550,'Naked',26),(551,'Opti',26),(552,'Rocky',26),(553,'Sirion',26),(554,'Sparcar',26),(555,'Terios',26),(556,'Trevis',26),(557,'Valera',26),(558,'YRV',26),(559,'-other-',27),(560,'240z',27),(561,'260z',27),(562,'280z',27),(563,'DMC-12',28),(564,'-other-',29),(565,'Adventurer',29),(566,'Airflow',29),(567,'Airstream',29),(568,'Custom',29),(569,'Deluxe',29),(570,'Diplomat',29),(571,'Firedome',29),(572,'Fireflite',29),(573,'Firesweep',29),(574,'Powermaster',29),(575,'-other-',30),(576,'Avenger',30),(577,'Caliber',30),(578,'Caravan',30),(579,'Challenger',30),(580,'Charger',30),(581,'Dakota',30),(582,'Dart',30),(583,'Demon',30),(584,'Durango',30),(585,'Grand Caravan',30),(586,'Hornet',30),(587,'Intrepid',30),(588,'Journey',30),(589,'Magnum',30),(590,'Neon',30),(591,'Nitro',30),(592,'Ram',30),(593,'Spirit',30),(594,'Stealth',30),(595,'Stratus',30),(596,'Viper',30),(597,'Voyager',30),(598,'-other-',31),(599,'-other-',32),(600,'Summit',32),(601,'Summit Wagon',32),(602,'Talon',32),(603,'Vision',32),(604,'-other-',33),(605,'F 360',33),(606,'208',33),(607,'246',33),(608,'250',33),(609,'275',33),(610,'288',33),(611,'308',33),(612,'328',33),(613,'330',33),(614,'348',33),(615,'360',33),(616,'365',33),(617,'400',33),(618,'412',33),(619,'456',33),(620,'458',33),(621,'512',33),(622,'550',33),(623,'575',33),(624,'599 GTB Fiorano',33),(625,'612',33),(626,'612 Scaglietti',33),(627,'750',33),(628,'Barchetta',33),(629,'California',33),(630,'Daytona',33),(631,'Enzo',33),(632,'F 355',33),(633,'F 40',33),(634,'F 430',33),(635,'F 50',33),(636,'F 512',33),(637,'Maranello',33),(638,'Mondial',33),(639,'Superamerica',33),(640,'Testarossa',33),(641,'-other-',34),(642,'124',34),(643,'126',34),(644,'127',34),(645,'130',34),(646,'131',34),(647,'500',34),(648,'500 Abarth',34),(649,'500L',34),(650,'500X',34),(651,'850 Spider ',34),(652,'Albea',34),(653,'Barchetta',34),(654,'Brava',34),(655,'Bravo',34),(656,'Cinquecento',34),(657,'Coupe',34),(658,'Croma',34),(659,'Dino',34),(660,'Doblo',34),(661,'Ducato',34),(662,'Duna',34),(663,'Fiorino',34),(664,'Freemont',34),(665,'Fullback',34),(666,'Grande Punto',34),(667,'Idea',34),(668,'Linea',34),(669,'Marea',34),(670,'Marengo',34),(671,'Multipla',34),(672,'Palio',34),(673,'Palio Weekend',34),(674,'Panda',34),(675,'Punto',34),(676,'Punto Evo',34),(677,'Qubo',34),(678,'Regata',34),(679,'Ritmo',34),(680,'Scudo',34),(681,'Sedici',34),(682,'Seicento',34),(683,'Stilo',34),(684,'Strada',34),(685,'Talento',34),(686,'Tempra',34),(687,'Tipo',34),(688,'Ulysse',34),(689,'Uno',34),(690,'X 1\\/9',34),(691,'-other-',35),(692,'Atlantic',35),(693,'Karma ',35),(694,'-other-',36),(695,'Aerostar',36),(696,'Aspire',36),(697,'B-MAX',36),(698,'Bronco',36),(699,'C-MAX',36),(700,'Capri',36),(701,'Caravan',36),(702,'Cargo',36),(703,'Club Wagon',36),(704,'Connect Tourneo',36),(705,'Contour',36),(706,'Cougar',36),(707,'Courier',36),(708,'Crown Victoria',36),(709,'Econoline',36),(710,'Econovan',36),(711,'EcoSport',36),(712,'Edge',36),(713,'Escape',36),(714,'Escort',36),(715,'Excursion',36),(716,'Expedition',36),(717,'Explorer',36),(718,'Express',36),(719,'F150',36),(720,'F250',36),(721,'F350',36),(722,'F450',36),(723,'F470',36),(724,'F700',36),(725,'Fairlane',36),(726,'Falcon',36),(727,'Fiesta',36),(728,'Five Hundred',36),(729,'Flex',36),(730,'Focus',36),(731,'Freestar',36),(732,'Freestyle',36),(733,'Fusion',36),(734,'Galaxy',36),(735,'Granada',36),(736,'Grand C-MAX',36),(737,'GT',36),(738,'Ka',36),(739,'Kuga',36),(740,'LTD',36),(741,'Maverick',36),(742,'Mercury',36),(743,'Mondeo',36),(744,'Mustang',36),(745,'Orion',36),(746,'Probe',36),(747,'Puma',36),(748,'Ranger',36),(749,'S-MAX',36),(750,'Scorpio',36),(751,'Sierra',36),(752,'Sportka',36),(753,'Streetka',36),(754,'Superduty',36),(755,'Taunus',36),(756,'Taurus',36),(757,'Tempo',36),(758,'Thunderbird',36),(759,'Tourneo',36),(760,'Transit',36),(761,'Transit Connect',36),(762,'Transit Custom',36),(763,'Windstar',36),(764,'-other-',37),(765,'22',37),(766,'11-73',37),(767,'12 ZiM',37),(768,'12B',37),(769,'13',37),(770,'14',37),(771,'21',37),(772,'2110',37),(773,'24',37),(774,'2410',37),(775,'2752',37),(776,'3110',37),(777,'32213',37),(778,'3302',37),(779,'3308',37),(780,'53',37),(781,'61',37),(782,'64',37),(783,'66',37),(784,'67',37),(785,'69A',37),(786,'Chaika',37),(787,'Gazele',37),(788,'M-20 Pobeda',37),(789,'M1',37),(790,'Volga',37),(791,'-other-',38),(792,'Metro',38),(793,'Prizm',38),(794,'Spectrum',38),(795,'Storm',38),(796,'Tracker',38),(797,'-other-',39),(798,'Acadia',39),(799,'Envoy',39),(800,'Jimmy',39),(801,'Safari',39),(802,'Savana',39),(803,'Sierra',39),(804,'Sonoma',39),(805,'Suburban',39),(806,'Syclone',39),(807,'Terrain',39),(808,'Typhoon',39),(809,'Yukon',39),(810,'-Kita-',40),(811,'GA200',40),(812,'GX6',40),(813,'-other-',41),(814,'Deer',41),(815,'Hover',41),(816,'Pegasus',41),(817,'Safe',41),(818,'Sailor',41),(819,'Sing',41),(820,'Socool',41),(821,'Wingle',41),(822,'-other-',42),(823,'Accord',42),(824,'Aerodeck',42),(825,'Avancier',42),(826,'Capa',42),(827,'City',42),(828,'Civic',42),(829,'Concerto',42),(830,'CR-V',42),(831,'Crosstour',42),(832,'CRX',42),(833,'CRZ',42),(834,'Domani',42),(835,'Element',42),(836,'F- MX',42),(837,'FIT',42),(838,'FR-V',42),(839,'HR-V',42),(840,'Insight',42),(841,'Inspire',42),(842,'Integra',42),(843,'Jazz',42),(844,'Lagreat',42),(845,'Legend',42),(846,'Life',42),(847,'Logo',42),(848,'Mobilo',42),(849,'NSX',42),(850,'Odyssey',42),(851,'Passport',42),(852,'Pilot',42),(853,'Prelude',42),(854,'Ridgeline',42),(855,'S2000',42),(856,'Shuttle',42),(857,'Stream',42),(858,'Today',42),(859,'-other-',43),(860,'Hollywood',43),(861,'-other-',44),(862,'H1',44),(863,'H2',44),(864,'H3',44),(865,'-other-',45),(866,'Accent',45),(867,'Atos',45),(868,'Azera',45),(869,'Coupe',45),(870,'Elantra',45),(871,'Entourage',45),(872,'Equus',45),(873,'Excel',45),(874,'Galloper',45),(875,'Genesis',45),(876,'Getz',45),(877,'Grand Santa Fe',45),(878,'Grandeur',45),(879,'H1',45),(880,'H1 Travel',45),(881,'H100',45),(882,'H200',45),(883,'i10',45),(884,'i20',45),(885,'i30',45),(886,'i40',45),(887,'i50',45),(888,'IONIQ',45),(889,'ix20',45),(890,'ix35',45),(891,'ix55',45),(892,'Kona',45),(893,'Lantra',45),(894,'Lavita',45),(895,'Marcia',45),(896,'Matrix',45),(897,'Pony',45),(898,'S-Coupe',45),(899,'Santa Fe',45),(900,'Santamo',45),(901,'Solaris',45),(902,'Sonata',45),(903,'Sonica',45),(904,'Starex',45),(905,'Terracan',45),(906,'Tiburon',45),(907,'Trajet',45),(908,'Tucson',45),(909,'Veloster',45),(910,'Veracruz',45),(911,'XG',45),(912,'XG 350',45),(913,'XG30',45),(914,'-other-',46),(915,'EX',46),(916,'EX30',46),(917,'EX35',46),(918,'EX37',46),(919,'FX',46),(920,'FX30',46),(921,'FX35',46),(922,'FX37',46),(923,'FX45',46),(924,'FX50',46),(925,'G20',46),(926,'G35',46),(927,'G37',46),(928,'I30',46),(929,'I35',46),(930,'J30',46),(931,'JX35',46),(932,'M30',46),(933,'M35\\/45',46),(934,'M37',46),(935,'M56',46),(936,'Q30',46),(937,'Q45',46),(938,'Q50',46),(939,'Q60',46),(940,'Q70',46),(941,'QX30',46),(942,'QX4',46),(943,'QX50',46),(944,'QX56',46),(945,'QX60',46),(946,'QX70',46),(947,'-other-',47),(948,'Scout',47),(949,'Scout II',47),(950,'-other-',48),(951,'Amigo',48),(952,'Ascender',48),(953,'Aska',48),(954,'Axiom',48),(955,'Bighorn',48),(956,'Campo',48),(957,'D-Max',48),(958,'Gemini',48),(959,'HiLander',48),(960,'Impulse',48),(961,'Midi',48),(962,'MU',48),(963,'NPR',48),(964,'Panther',48),(965,'Piazza',48),(966,'Pick Up',48),(967,'Rodeo',48),(968,'Trooper',48),(969,'Turkuaz',48),(970,'Vehi Cross',48),(971,'Wizard',48),(972,'-other-',49),(973,'Daily',49),(974,'35-12',49),(975,'Massif',49),(976,'-other-',50),(977,'Daimler',50),(978,'E-Type',50),(979,'F-Pace',50),(980,'F-Type',50),(981,'MK II',50),(982,'S-Type',50),(983,'Sovereign',50),(984,'Vanden Plas',50),(985,'X-Type',50),(986,'XE',50),(987,'XF',50),(988,'XJ',50),(989,'XJ-Series',50),(990,'XJ12',50),(991,'XJ40',50),(992,'XJ6',50),(993,'XJ8',50),(994,'XJR',50),(995,'XJS',50),(996,'XK',50),(997,'XK-Series',50),(998,'XK8',50),(999,'XKR',50),(1000,'-other-',51),(1001,'Cherokee',51),(1002,'CJ',51),(1003,'Comanche',51),(1004,'Commander',51),(1005,'Compass',51),(1006,'Grand Cherokee',51),(1007,'Liberty',51),(1008,'Patriot',51),(1009,'Renegade',51),(1010,'Wagoneer',51),(1011,'Willys',51),(1012,'Wrangler',51),(1013,'-other-',52),(1014,'Avella',52),(1015,'Besta',52),(1016,'Borrego',52),(1017,'Cadenza',52),(1018,'Carens',52),(1019,'Carnival',52),(1020,'cee\'d',52),(1021,'Cerato',52),(1022,'Clarus',52),(1023,'Elan',52),(1024,'Enterprise',52),(1025,'Forte',52),(1026,'Joice',52),(1027,'K2500',52),(1028,'K2700',52),(1029,'Leo',52),(1030,'Magentis',52),(1031,'Mentor',52),(1032,'Mini',52),(1033,'Niro',52),(1034,'Opirus',52),(1035,'Optima',52),(1036,'Picanto',52),(1037,'Potentia',52),(1038,'Pregio',52),(1039,'Pride',52),(1040,'Pro cee\'d',52),(1041,'Retona',52),(1042,'Rio',52),(1043,'Roadster',52),(1044,'Rocsta',52),(1045,'Rondo',52),(1046,'Sedona',52),(1047,'Sephia',52),(1048,'Shuma',52),(1049,'Sorento',52),(1050,'Soul',52),(1051,'Spectra',52),(1052,'Sportage',52),(1053,'Stinger',52),(1054,'Stonic',52),(1055,'Venga',52),(1056,'-other-',53),(1057,'Agera',53),(1058,'CC8S',53),(1059,'CCGT',53),(1060,'CCR',53),(1061,'CCX',53),(1062,'CCX Edition',53),(1063,'CCXR',53),(1064,'CCXR Edition',53),(1065,'CCXR Special Edition',53),(1066,'Trevita',53),(1067,'-other-',54),(1068,'110',54),(1069,'111',54),(1070,'112',54),(1071,'1200',54),(1072,'2101',54),(1073,'21011',54),(1074,'21013',54),(1075,'2102',54),(1076,'2103',54),(1077,'2104',54),(1078,'2105',54),(1079,'21051',54),(1080,'21053',54),(1081,'2106',54),(1082,'21061',54),(1083,'21063',54),(1084,'2107',54),(1085,'2108',54),(1086,'2109',54),(1087,'2110',54),(1088,'2111',54),(1089,'21110',54),(1090,'21111',54),(1091,'2112',54),(1092,'2115',54),(1093,'2120',54),(1094,'2121',54),(1095,'21213',54),(1096,'21214',54),(1097,'21215',54),(1098,'2123',54),(1099,'2129',54),(1100,'2131',54),(1101,'2141',54),(1102,'2329',54),(1103,'Aleko',54),(1104,'Forma',54),(1105,'Kalina',54),(1106,'Niva',54),(1107,'Nova',54),(1108,'Oka',54),(1109,'Priora',54),(1110,'Samara',54),(1111,'Vis',54),(1112,'-other-',55),(1113,'Aventador',55),(1114,'Countach',55),(1115,'Diablo',55),(1116,'Espada',55),(1117,'Gallardo',55),(1118,'Huracan',55),(1119,'Jalpa',55),(1120,'LM',55),(1121,'Miura',55),(1122,'Murcielago',55),(1123,'Urraco',55),(1124,'-other-',56),(1125,'Beta',56),(1126,'Dedra',56),(1127,'Delta',56),(1128,'Flaminia',56),(1129,'Fulvia',56),(1130,'Gamma',56),(1131,'Kappa',56),(1132,'Lybra',56),(1133,'Montecarlo',56),(1134,'Musa',56),(1135,'Phedra',56),(1136,'Prisma',56),(1137,'Stratos',56),(1138,'Thema',56),(1139,'Thesis',56),(1140,'Voyager',56),(1141,'Y',56),(1142,'Ypsilon',56),(1143,'Zeta',56),(1144,'-other-',57),(1145,'Defender',57),(1146,'Discovery',57),(1147,'Discovery Sport',57),(1148,'Evoque',57),(1149,'Freelander',57),(1150,'Range Rover',57),(1151,'Range Rover Sport',57),(1152,'Range Rover Velar',57),(1153,'CV9',58),(1154,'-other-',58),(1155,'S',58),(1156,'SC 2',58),(1157,'SC 4',58),(1158,'-other-',59),(1159,'CT 200h',59),(1160,'ES klasÄ',59),(1161,'ES 300',59),(1162,'ES 300h',59),(1163,'ES 330',59),(1164,'ES 350',59),(1165,'ES 350h',59),(1166,'GS klasÄ',59),(1167,'GS 200t',59),(1168,'GS 250',59),(1169,'GS 300',59),(1170,'GS 300h',59),(1171,'GS 350 ',59),(1172,'GS 400',59),(1173,'GS 430',59),(1174,'GS 450',59),(1175,'GS 460',59),(1176,'GS-F',59),(1177,'GX klasÄ',59),(1178,'GX 460',59),(1179,'GX 470',59),(1180,'GX 640',59),(1181,'HS klasÄ',59),(1182,'HS 250',59),(1183,'IS klasÄ',59),(1184,'IS 200',59),(1185,'IS 220',59),(1186,'IS 250',59),(1187,'IS 300',59),(1188,'IS 300h',59),(1189,'IS 350',59),(1190,'IS-F',59),(1191,'LC klasÄ',59),(1192,'LC 500',59),(1193,'LC 500h',59),(1194,'LFA',59),(1195,'LS klasÄ',59),(1196,'LS 400',59),(1197,'LS 430',59),(1198,'LS 460',59),(1199,'LS 500 h',59),(1200,'LS 600 h',59),(1201,'LX klasÄ',59),(1202,'LX 450',59),(1203,'LX 470',59),(1204,'LX 570',59),(1205,'NX klasÄ',59),(1206,'NX 200t',59),(1207,'NX 300h',59),(1208,'RC klasÄ',59),(1209,'RC 200t',59),(1210,'RC 300h',59),(1211,'RC 350',59),(1212,'RC-F',59),(1213,'RX klasÄ',59),(1214,'RX 200t',59),(1215,'RX 300',59),(1216,'RX 330',59),(1217,'RX 350',59),(1218,'RX 400h',59),(1219,'RX 450h',59),(1220,'SC klasÄ',59),(1221,'SC 300',59),(1222,'SC 400',59),(1223,'SC 430',59),(1224,'SL',59),(1225,'-other-',60),(1226,'Ambra',60),(1227,'Andere',60),(1228,'ixo',60),(1229,'JS 50',60),(1230,'Nova',60),(1231,'Optima',60),(1232,'X - Too',60),(1233,'-other-',61),(1234,'Aviator',61),(1235,'Continental',61),(1236,'LS',61),(1237,'Mark',61),(1238,'MKS',61),(1239,'MKT',61),(1240,'MKX',61),(1241,'MKZ',61),(1242,'Navigator',61),(1243,'Town Car',61),(1244,'Zephyr',61),(1245,'-other-',62),(1246,'340 R',62),(1247,'Cortina',62),(1248,'Eagle',62),(1249,'Elan',62),(1250,'Elise',62),(1251,'Elite',62),(1252,'Esprit',62),(1253,'Europa',62),(1254,'Evora',62),(1255,'Excel',62),(1256,'Exige',62),(1257,'Super Seven',62),(1258,'V8',62),(1259,'-other-',63),(1260,'1302',63),(1261,'967M',63),(1262,'969M',63),(1263,'-other-',64),(1264,'-other-',65),(1265,'222',65),(1266,'224',65),(1267,'228',65),(1268,'3200',65),(1269,'3200 GT',65),(1270,'418',65),(1271,'420',65),(1272,'4200',65),(1273,'422',65),(1274,'424',65),(1275,'430',65),(1276,'Biturbo',65),(1277,'Chamal',65),(1278,'Ghibli',65),(1279,'GranCabrio',65),(1280,'Gransport',65),(1281,'GranTurismo',65),(1282,'Indy',65),(1283,'Karif',65),(1284,'Levante',65),(1285,'MC12',65),(1286,'Merak',65),(1287,'Quattroporte',65),(1288,'Spyder',65),(1289,'-other-',66),(1290,'57',66),(1291,'62',66),(1292,'-other-',67),(1293,'121',67),(1294,'2',67),(1295,'3',67),(1296,'323',67),(1297,'323F',67),(1298,'5',67),(1299,'6',67),(1300,'626',67),(1301,'929',67),(1302,'Atenza',67),(1303,'AZ',67),(1304,'B Series',67),(1305,'Bongo',67),(1306,'BT-50',67),(1307,'Carol',67),(1308,'Clef',67),(1309,'Cronos',67),(1310,'CX-3',67),(1311,'CX-5',67),(1312,'CX-7',67),(1313,'CX-9',67),(1314,'Demio',67),(1315,'Eunos',67),(1316,'Lantis',67),(1317,'Laputa',67),(1318,'Levante',67),(1319,'Miata',67),(1320,'Millenia',67),(1321,'MPV',67),(1322,'MX-3',67),(1323,'MX-5',67),(1324,'MX-6',67),(1325,'Navajo',67),(1326,'PickUp',67),(1327,'Premacy',67),(1328,'Protege',67),(1329,'Rustler',67),(1330,'RX-6',67),(1331,'RX-7',67),(1332,'RX-8',67),(1333,'Tribute',67),(1334,'Vantred',67),(1335,'Xedos 6',67),(1336,'Xedos 9',67),(1337,'540C',68),(1338,'570S',68),(1339,'650S',68),(1340,'650S Coupe',68),(1341,'650S Spider',68),(1342,'675LT',68),(1343,'675LT Spider',68),(1344,'Andere',68),(1345,'MP4-12C',68),(1346,'P1',68),(1347,'-other-',69),(1348,'100',69),(1349,'108',69),(1350,'110',69),(1351,'123',69),(1352,'124',69),(1353,'190',69),(1354,'200',69),(1355,'207',69),(1356,'208',69),(1357,'211',69),(1358,'212',69),(1359,'220',69),(1360,'230',69),(1361,'240',69),(1362,'250',69),(1363,'260',69),(1364,'270',69),(1365,'280',69),(1366,'290',69),(1367,'300',69),(1368,'300 GD',69),(1369,'307',69),(1370,'308',69),(1371,'320',69),(1372,'350',69),(1373,'380',69),(1374,'400',69),(1375,'416',69),(1376,'420',69),(1377,'450',69),(1378,'500',69),(1379,'560',69),(1380,'600',69),(1381,'608',69),(1382,'A klasÄ',69),(1383,'A140',69),(1384,'A150',69),(1385,'A160',69),(1386,'A170',69),(1387,'A180',69),(1388,'A190',69),(1389,'A200',69),(1390,'A210',69),(1391,'A220',69),(1392,'A250',69),(1393,'A45 AMG',69),(1394,'AMG GT ',69),(1395,'Atego',69),(1396,'B klasÄ',69),(1397,'B150',69),(1398,'B160',69),(1399,'B170',69),(1400,'B180',69),(1401,'B200',69),(1402,'B220',69),(1403,'B250',69),(1404,'C klasÄ',69),(1405,'C160',69),(1406,'C180',69),(1407,'C200',69),(1408,'C220',69),(1409,'C230',69),(1410,'C240',69),(1411,'C250',69),(1412,'C270',69),(1413,'C280',69),(1414,'C30 AMG',69),(1415,'C300',69),(1416,'C32 AMG',69),(1417,'C320',69),(1418,'C350',69),(1419,'C36 AMG',69),(1420,'C400',69),(1421,'C43 AMG',69),(1422,'C450',69),(1423,'C55 AMG',69),(1424,'C63 AMG',69),(1425,'C klasÄ SC',69),(1426,'CE klasÄ',69),(1427,'CE200',69),(1428,'CE220',69),(1429,'CE230',69),(1430,'CE300',69),(1431,'Citan',69),(1432,'CL klasÄ',69),(1433,'CL180',69),(1434,'CL200',69),(1435,'CL220',69),(1436,'CL230',69),(1437,'CL420',69),(1438,'CL500',69),(1439,'CL55 AMG',69),(1440,'CL600',69),(1441,'CL63 AMG',69),(1442,'CL65 AMG',69),(1443,'CLA klasÄ',69),(1444,'CLA180',69),(1445,'CLA200',69),(1446,'CLA220',69),(1447,'CLA250',69),(1448,'CLA45 AMG',69),(1449,'CLC klasÄ',69),(1450,'CLC160',69),(1451,'CLC180',69),(1452,'CLC200',69),(1453,'CLC220',69),(1454,'CLC230',69),(1455,'CLC250',69),(1456,'CLC350',69),(1457,'CLK klasÄ',69),(1458,'CLK200',69),(1459,'CLK220',69),(1460,'CLK230',69),(1461,'CLK240',69),(1462,'CLK270',69),(1463,'CLK280',69),(1464,'CLK320',69),(1465,'CLK350',69),(1466,'CLK430',69),(1467,'CLK500',69),(1468,'CLK55 AMG',69),(1469,'CLK63 AMG',69),(1470,'CLS klasÄ',69),(1471,'CLS220',69),(1472,'CLS250',69),(1473,'CLS280',69),(1474,'CLS300',69),(1475,'CLS320',69),(1476,'CLS350',69),(1477,'CLS400',69),(1478,'CLS500',69),(1479,'CLS55 AMG',69),(1480,'CLS550',69),(1481,'CLS63 AMG',69),(1482,'E klasÄ',69),(1483,'E200',69),(1484,'E220',69),(1485,'E230',69),(1486,'E240',69),(1487,'E250',69),(1488,'E260',69),(1489,'E270',69),(1490,'E280',69),(1491,'E290',69),(1492,'E300',69),(1493,'E320',69),(1494,'E350',69),(1495,'E36 AMG',69),(1496,'E400',69),(1497,'E420',69),(1498,'E430',69),(1499,'E50 AMG',69),(1500,'E500',69),(1501,'E55',69),(1502,'E55 AMG',69),(1503,'E550',69),(1504,'E60 AMG',69),(1505,'E63 AMG',69),(1506,'G klasÄ',69),(1507,'G230',69),(1508,'G240',69),(1509,'G250',69),(1510,'G270',69),(1511,'G280',69),(1512,'G290',69),(1513,'G300',69),(1514,'G320',69),(1515,'G350',69),(1516,'G400',69),(1517,'G500',69),(1518,'G55 AMG',69),(1519,'G63 AMG',69),(1520,'G65 AMG',69),(1521,'GL klasÄ',69),(1522,'GL320',69),(1523,'GL350',69),(1524,'GL350 BlueTEC',69),(1525,'GL420',69),(1526,'GL450',69),(1527,'GL500',69),(1528,'GL55 AMG',69),(1529,'GL550',69),(1530,'GL63 AMG',69),(1531,'GLA klasÄ',69),(1532,'GLA180',69),(1533,'GLA200',69),(1534,'GLA220',69),(1535,'GLA250',69),(1536,'GLA45 AMG',69),(1537,'GLC Coupe klasÄ ',69),(1538,'-other-',69),(1539,'GLC Coupe 220 ',69),(1540,'GLC Coupe 250 ',69),(1541,'GLC Coupe 300 ',69),(1542,'GLC Coupe 350 ',69),(1543,'GLC Coupe 43 AMG ',69),(1544,'GLC klasÄ',69),(1545,'GLC220',69),(1546,'GLC250',69),(1547,'GLC300',69),(1548,'GLC350',69),(1549,'GLC43 AMG',69),(1550,'GLE Coupe klasÄ',69),(1551,'GLE Coupe 250',69),(1552,'GLE Coupe 350',69),(1553,'GLE Coupe 400',69),(1554,'GLE Coupe 450',69),(1555,'GLE Coupe 500',69),(1556,'GLE Coupe 63 AMG',69),(1557,'GLE klasÄ',69),(1558,'GLE250',69),(1559,'GLE350',69),(1560,'GLE400',69),(1561,'GLE450',69),(1562,'GLE500',69),(1563,'GLE63 AMG',69),(1564,'GLK klasÄ',69),(1565,'GLK200',69),(1566,'GLK220',69),(1567,'GLK250',69),(1568,'GLK280',69),(1569,'GLK300',69),(1570,'GLK320',69),(1571,'GLK350',69),(1572,'GLS klasÄ',69),(1573,'GLS350',69),(1574,'GLS400',69),(1575,'GLS450',69),(1576,'GLS500',69),(1577,'GLS63 AMG',69),(1578,'M klasÄ',69),(1579,'ML klasÄ',69),(1580,'ML230',69),(1581,'ML250',69),(1582,'ML270',69),(1583,'ML280',69),(1584,'ML300',69),(1585,'ML320',69),(1586,'ML350',69),(1587,'ML400',69),(1588,'ML420',69),(1589,'ML430',69),(1590,'ML450',69),(1591,'ML500',69),(1592,'ML53 AMG',69),(1593,'ML55 AMG',69),(1594,'ML550',69),(1595,'ML63 AMG',69),(1596,'R klasÄ',69),(1597,'R280',69),(1598,'R300',69),(1599,'R320',69),(1600,'R350',69),(1601,'R500',69),(1602,'R63 AMG',69),(1603,'S klasÄ',69),(1604,'S250',69),(1605,'S260',69),(1606,'S280',69),(1607,'S300',69),(1608,'S320',69),(1609,'S350',69),(1610,'S400',69),(1611,'S420',69),(1612,'S430',69),(1613,'S450',69),(1614,'S500',69),(1615,'S55 AMG',69),(1616,'S550',69),(1617,'S560',69),(1618,'S600',69),(1619,'S63 AMG',69),(1620,'S65 AMG',69),(1621,'SL klasÄ',69),(1622,'SL280',69),(1623,'SL300',69),(1624,'SL320',69),(1625,'SL350',69),(1626,'SL380',69),(1627,'SL400',69),(1628,'SL420',69),(1629,'SL450',69),(1630,'SL500',69),(1631,'SL55 AMG',69),(1632,'SL560',69),(1633,'SL60 AMG',69),(1634,'SL600',69),(1635,'SL63 AMG',69),(1636,'SL65 AMG',69),(1637,'SL70 AMG',69),(1638,'SL73 AMG',69),(1639,'SLK klasÄ',69),(1640,'SLK200',69),(1641,'SLK230',69),(1642,'SLK250',69),(1643,'SLK260',69),(1644,'SLK280 ',69),(1645,'SLK300',69),(1646,'SLK32 AMG',69),(1647,'SLK320',69),(1648,'SLK350',69),(1649,'SLK55 AMG',69),(1650,'SLR McLaren',69),(1651,'SLS AMG',69),(1652,'Sprinter',69),(1653,'T 1',69),(1654,'V klasÄ',69),(1655,'V200',69),(1656,'V220',69),(1657,'V230',69),(1658,'V250',69),(1659,'V280',69),(1660,'Vaneo',69),(1661,'Vario',69),(1662,'Viano',69),(1663,'Vito',69),(1664,'-other-',70),(1665,'Capri',70),(1666,'Cougar',70),(1667,'Grand Marquis',70),(1668,'Marauder',70),(1669,'Mariner',70),(1670,'Milan',70),(1671,'Mountaineer',70),(1672,'Mystique',70),(1673,'Sable',70),(1674,'Tiffany',70),(1675,'Topaz',70),(1676,'Tracer',70),(1677,'Villager',70),(1678,'-other-',71),(1679,'Express',71),(1680,'Maestro',71),(1681,'Metro',71),(1682,'MGA',71),(1683,'MGB',71),(1684,'MGF',71),(1685,'MGR V8',71),(1686,'Midget',71),(1687,'Montego',71),(1688,'TF',71),(1689,'X',71),(1690,'ZR',71),(1691,'ZS',71),(1692,'ZT',71),(1693,'-other-',72),(1694,'Mc 1 ',72),(1695,'Mgo',72),(1696,'-other-',73),(1697,'1000',73),(1698,'1300',73),(1699,'Clubman',73),(1700,'Cooper',73),(1701,'Cooper S',73),(1702,'Countryman',73),(1703,'Mini',73),(1704,'One',73),(1705,'Paceman',73),(1706,'-other-',74),(1707,'3000 GT',74),(1708,'ASX',74),(1709,'Canter',74),(1710,'Carisma',74),(1711,'Colt',74),(1712,'Cordia',74),(1713,'Delica',74),(1714,'Diamante',74),(1715,'Eclipse',74),(1716,'Eclipse Cross',74),(1717,'Endeavor',74),(1718,'FTO',74),(1719,'Galant',74),(1720,'Galloper',74),(1721,'Grandis',74),(1722,'GTO',74),(1723,'L200',74),(1724,'L300',74),(1725,'L400',74),(1726,'Lancer',74),(1727,'Lancer  Evolution',74),(1728,'MiEV',74),(1729,'Mirage',74),(1730,'Montero',74),(1731,'Outlander',74),(1732,'Pajero',74),(1733,'Pajero Pinin',74),(1734,'Pajero Sport',74),(1735,'Pick-up',74),(1736,'Pinin',74),(1737,'Santamo',74),(1738,'Sapporo',74),(1739,'Shogun',74),(1740,'Sigma',74),(1741,'Space Gear',74),(1742,'Space Runner',74),(1743,'Space Star',74),(1744,'Space Wagon',74),(1745,'Starion',74),(1746,'-kita- ',75),(1747,'4\\/4',75),(1748,'Aero 8',75),(1749,'Plus 4',75),(1750,'Plus 8',75),(1751,'Roadster',75),(1752,'-other-',76),(1753,'407',76),(1754,'423',76),(1755,'2140',76),(1756,'2141',76),(1757,'401',76),(1758,'403',76),(1759,'408',76),(1760,'412',76),(1761,'M-400',76),(1762,'M-402',76),(1763,'M-408',76),(1764,'M-412',76),(1765,'-other-',77),(1766,'100 NX',77),(1767,'200 SX',77),(1768,'240 SX',77),(1769,'280 ZX',77),(1770,'300 ZX',77),(1771,'350Z',77),(1772,'370Z',77),(1773,'Almera',77),(1774,'Almera Tino',77),(1775,'Altima',77),(1776,'Armada',77),(1777,'Bluebird',77),(1778,'Cabstar',77),(1779,'Cargo',77),(1780,'Cherry',77),(1781,'Cima',77),(1782,'Cube',77),(1783,'Evalia',77),(1784,'Frontier',77),(1785,'GT-R',77),(1786,'Interstar',77),(1787,'Juke',77),(1788,'King Cab',77),(1789,'Kubistar',77),(1790,'Laurel',77),(1791,'Leaf',77),(1792,'Liberty',77),(1793,'Maxima',77),(1794,'Micra',77),(1795,'Murano',77),(1796,'Navara',77),(1797,'Note',77),(1798,'NP300',77),(1799,'NV200',77),(1800,'NV300',77),(1801,'NV400',77),(1802,'Pathfinder',77),(1803,'Patrol',77),(1804,'Pick-Up',77),(1805,'Pixo',77),(1806,'Prairie',77),(1807,'President',77),(1808,'Primastar',77),(1809,'Primera',77),(1810,'Pulsar',77),(1811,'Qashqai',77),(1812,'Qashqai+2',77),(1813,'Quest',77),(1814,'Rogue',77),(1815,'Rougue',77),(1816,'Sentra',77),(1817,'Serena',77),(1818,'Silvia',77),(1819,'Skyline',77),(1820,'Sunny',77),(1821,'Terrano',77),(1822,'Tiida',77),(1823,'Titan',77),(1824,'Trade',77),(1825,'Urvan',77),(1826,'Vanette',77),(1827,'Versa',77),(1828,'Wingroad',77),(1829,'X-Terra',77),(1830,'X-Trail',77),(1831,'-other-',78),(1832,'600R',78),(1833,'-other-',79),(1834,'522',79),(1835,'-other-',80),(1836,'Achieva',80),(1837,'Alero',80),(1838,'Aurora',80),(1839,'Bravada',80),(1840,'Custom Cruiser',80),(1841,'Cutlass',80),(1842,'Delta 88',80),(1843,'Eighty-Eight',80),(1844,'Intrigue',80),(1845,'Silhouete',80),(1846,'Silhouette',80),(1847,'Super 88',80),(1848,'Toronado',80),(1849,'-other-',81),(1850,'Adam',81),(1851,'Agila',81),(1852,'Ampera',81),(1853,'Antara',81),(1854,'Arena',81),(1855,'Ascona',81),(1856,'Astra',81),(1857,'Calibra',81),(1858,'Campo',81),(1859,'Cascada',81),(1860,'Combo',81),(1861,'Commodore GS',81),(1862,'Corsa',81),(1863,'Crossland X',81),(1864,'Diplomat',81),(1865,'Frontera',81),(1866,'Grandland X',81),(1867,'GT',81),(1868,'Insignia',81),(1869,'Kadett',81),(1870,'Karl',81),(1871,'Manta',81),(1872,'Meriva',81),(1873,'Mokka',81),(1874,'Mokka X',81),(1875,'Monterey',81),(1876,'Monza',81),(1877,'Movano',81),(1878,'Nova',81),(1879,'Omega',81),(1880,'Rekord',81),(1881,'Senator',81),(1882,'Signum',81),(1883,'Sintra',81),(1884,'Speedster',81),(1885,'Tigra',81),(1886,'Vectra',81),(1887,'Vivaro',81),(1888,'Zafira',81),(1889,'Zafira tourer',81),(1890,'-other-',82),(1891,'110',82),(1892,'120',82),(1893,'180',82),(1894,'200',82),(1895,'300',82),(1896,'Caribbean',82),(1897,'Cavalier',82),(1898,'Clipper',82),(1899,'Executive',82),(1900,'Hawk',82),(1901,'Patrician',82),(1902,'Station Sedan',82),(1903,'Super Eight',82),(1904,'-other-',83),(1905,'1007',83),(1906,'104',83),(1907,'106',83),(1908,'107',83),(1909,'108',83),(1910,'2008',83),(1911,'204',83),(1912,'205',83),(1913,'206',83),(1914,'206+',83),(1915,'207',83),(1916,'208',83),(1917,'3008',83),(1918,'301',83),(1919,'304',83),(1920,'305',83),(1921,'306',83),(1922,'307',83),(1923,'308',83),(1924,'309',83),(1925,'4007',83),(1926,'4008',83),(1927,'404',83),(1928,'405',83),(1929,'406',83),(1930,'407',83),(1931,'5008',83),(1932,'504',83),(1933,'505',83),(1934,'508',83),(1935,'508 RXH',83),(1936,'604',83),(1937,'605',83),(1938,'607',83),(1939,'806',83),(1940,'807',83),(1941,'Bipper',83),(1942,'Boxer',83),(1943,'Expert',83),(1944,'iOn',83),(1945,'J5',83),(1946,'Partner',83),(1947,'RCZ',83),(1948,'Traveller',83),(1949,'Vivacity',83),(1950,'-other-',84),(1951,'Breeze',84),(1952,'Grand Voyager',84),(1953,'Neon',84),(1954,'Prowler',84),(1955,'Voyager',84),(1956,' G5',85),(1957,'-other-',85),(1958,'6000',85),(1959,'Aztek',85),(1960,'Bonneville',85),(1961,'Catalina',85),(1962,'Fiero',85),(1963,'Firebird',85),(1964,'G6',85),(1965,'G8',85),(1966,'Grand-Am',85),(1967,'Grand-Prix',85),(1968,'GTO',85),(1969,'Montana',85),(1970,'Solstice',85),(1971,'Sunbird',85),(1972,'Sunfire',85),(1973,'Targa',85),(1974,'Trans Am',85),(1975,'Trans Sport',85),(1976,'Vibe',85),(1977,'-other-',86),(1978,'356',86),(1979,'911',86),(1980,'912',86),(1981,'914',86),(1982,'924',86),(1983,'928',86),(1984,'944',86),(1985,'959',86),(1986,'968',86),(1987,'Boxster',86),(1988,'Carrera GT',86),(1989,'Cayenne',86),(1990,'Cayman',86),(1991,'Macan',86),(1992,'Panamera',86),(1993,'-other-',87),(1994,'313',87),(1995,'315',87),(1996,'416',87),(1997,'Gen-2',87),(1998,'Persona',87),(1999,'Satria',87),(2000,'-other-',88),(2001,'11',88),(2002,'19',88),(2003,'21',88),(2004,'25',88),(2005,'4',88),(2006,'5',88),(2007,'9',88),(2008,'Avantime',88),(2009,'Captur',88),(2010,'Clio',88),(2011,'Espace',88),(2012,'Express',88),(2013,'Fluence',88),(2014,'Fuego',88),(2015,'Grand Espace',88),(2016,'Grand Modus',88),(2017,'Grand Scenic',88),(2018,'Kadjar',88),(2019,'Kangoo',88),(2020,'Koleos',88),(2021,'Laguna',88),(2022,'Latitude',88),(2023,'Logan',88),(2024,'Magnum',88),(2025,'Mascott',88),(2026,'Master',88),(2027,'Megane',88),(2028,'Modus',88),(2029,'Nevada',88),(2030,'Rapid',88),(2031,'Safrane',88),(2032,'Scenic',88),(2033,'Spacetourer',88),(2034,'Sport Spider',88),(2035,'Super 5',88),(2036,'Symbol',88),(2037,'Talisman',88),(2038,'Thalia',88),(2039,'Trafic',88),(2040,'Twingo',88),(2041,'Twizy',88),(2042,'Vel Satis',88),(2043,'Wind',88),(2044,'Zoe',88),(2045,'-other-',89),(2046,'Corniche',89),(2047,'Flying Spur',89),(2048,'Ghost',89),(2049,'Park Ward',89),(2050,'Phantom',89),(2051,'Silver',89),(2052,'-other-',90),(2053,'-other-',91),(2054,'25',91),(2055,'45',91),(2056,'75',91),(2057,'100',91),(2058,'200 serija',91),(2059,'200',91),(2060,'211',91),(2061,'213',91),(2062,'214',91),(2063,'216',91),(2064,'218',91),(2065,'220',91),(2066,'400 serija',91),(2067,'400',91),(2068,'414',91),(2069,'416',91),(2070,'418',91),(2071,'420',91),(2072,'600 serija',91),(2073,'600',91),(2074,'618',91),(2075,'620',91),(2076,'623',91),(2077,'800 serija',91),(2078,'800',91),(2079,'820',91),(2080,'825',91),(2081,'827',91),(2082,'Discovery',91),(2083,'Maestro',91),(2084,'Metro',91),(2085,'MGF',91),(2086,'Mini',91),(2087,'Montego',91),(2088,'Streetwise',91),(2089,'-other-',92),(2090,'9-2X',92),(2091,'9-3',92),(2092,'9-4X',92),(2093,'9-5',92),(2094,'9-7X',92),(2095,'90',92),(2096,'900',92),(2097,'9000',92),(2098,'92',92),(2099,'96',92),(2100,'97',92),(2101,'99',92),(2102,'-other-',93),(2103,'300',93),(2104,'350',93),(2105,'PS-10',93),(2106,'-other-',94),(2107,'Aura',94),(2108,'ION',94),(2109,'LS',94),(2110,'LW',94),(2111,'Outlook',94),(2112,'Relay',94),(2113,'SC',94),(2114,'Sky',94),(2115,'SL',94),(2116,'SW',94),(2117,'VUE',94),(2118,'FR-S',95),(2119,'iM',95),(2120,'IQ',95),(2121,'TC',95),(2122,'XA',95),(2123,'XB',95),(2124,'XD',95),(2125,'-other-',96),(2126,'Alhambra',96),(2127,'Altea',96),(2128,'Altea XL',96),(2129,'Arona',96),(2130,'Arosa',96),(2131,'Ateca',96),(2132,'Cordoba',96),(2133,'Exeo',96),(2134,'Ibiza',96),(2135,'Inca',96),(2136,'Leon',96),(2137,'Malaga',96),(2138,'Marbella',96),(2139,'Mii',96),(2140,'Terra',96),(2141,'Toledo',96),(2142,'-other-',97),(2143,'Extrem 500',97),(2144,'F16',97),(2145,'Fun Family',97),(2146,'-other-',98),(2147,'CEO',98),(2148,'Sceo',98),(2149,'-other-',99),(2150,'105',99),(2151,'120',99),(2152,'130',99),(2153,'135',99),(2154,'Citigo',99),(2155,'Fabia',99),(2156,'Favorit',99),(2157,'Felicia',99),(2158,'Forman',99),(2159,'Karoq',99),(2160,'Kodiaq',99),(2161,'Octavia',99),(2162,'Pick Up',99),(2163,'Praktik',99),(2164,'Rapid',99),(2165,'Roomster',99),(2166,'Superb',99),(2167,'Yeti',99),(2168,'-other-',100),(2169,'City',100),(2170,'Coupe',100),(2171,'Crossblade',100),(2172,'Forfour',100),(2173,'Fortwo',100),(2174,'Fortwo Coupe',100),(2175,'MCC',100),(2176,'Roadster',100),(2177,'-other-',101),(2178,'Roadster',101),(2179,'Sherwood',101),(2180,'Starcraft',101),(2181,'Treka',101),(2182,'C8 Laviolette',102),(2183,'-other-',103),(2184,'Actyon',103),(2185,'Actyon Sports',103),(2186,'Chairman',103),(2187,'Family',103),(2188,'Istana',103),(2189,'Kallista',103),(2190,'Korando',103),(2191,'Kyron',103),(2192,'Musso',103),(2193,'Rexton',103),(2194,'Rodius',103),(2195,'Tivoli',103),(2196,'-other-',104),(2197,'Avanti',104),(2198,'Big Six',104),(2199,'Champion',104),(2200,'Commander',104),(2201,'Conestoga',104),(2202,'Cruiser',104),(2203,'Daytona',104),(2204,'Desoto',104),(2205,'Dictator',104),(2206,'Electric car',104),(2207,'Flight Hawk',104),(2208,'Golden Hawk',104),(2209,'Gran Turismo Hawk',104),(2210,'Land Cruiser',104),(2211,'Lark',104),(2212,'Light Four',104),(2213,'Light Six',104),(2214,'Power Hawk',104),(2215,'President',104),(2216,'Scotsman',104),(2217,'Silver Hawk',104),(2218,'Sky Hawk',104),(2219,'Special Six',104),(2220,'Speedster',104),(2221,'Standard Six',104),(2222,'Starlight',104),(2223,'Wagonaire',104),(2224,'-other-',105),(2225,'Baja',105),(2226,'BRZ',105),(2227,'Forester',105),(2228,'Impreza',105),(2229,'Impreza  WRX',105),(2230,'Justy',105),(2231,'Legacy',105),(2232,'Leone',105),(2233,'Levorg',105),(2234,'Libero',105),(2235,'M 80',105),(2236,'Outback',105),(2237,'R1',105),(2238,'SVX',105),(2239,'Trezia',105),(2240,'Tribeca',105),(2241,'Vivio',105),(2242,'XT Coupe',105),(2243,'XV',105),(2244,'-other-',106),(2245,'Aerio',106),(2246,'Alto',106),(2247,'Baleno',106),(2248,'Cappuccino',106),(2249,'Carry',106),(2250,'Celerio ',106),(2251,'Cultis Wagon',106),(2252,'Equator',106),(2253,'Esteem',106),(2254,'Every Landy',106),(2255,'Forenza',106),(2256,'Grand Vitara',106),(2257,'Ignis',106),(2258,'Jimny',106),(2259,'Kei',106),(2260,'Kizashi',106),(2261,'Liana',106),(2262,'LJ',106),(2263,'Reno',106),(2264,'Samurai',106),(2265,'SJ',106),(2266,'Splash',106),(2267,'Super-Carry',106),(2268,'Swift',106),(2269,'SX4',106),(2270,'SX4 S-Cross',106),(2271,'Twin',106),(2272,'Verona',106),(2273,'Vitara',106),(2274,'Wagon R+',106),(2275,'X-90',106),(2276,'XL7',106),(2277,'-other-',107),(2278,'Andere',107),(2279,'Horizon',107),(2280,'Samba',107),(2281,'-Kita-',108),(2282,'Prancer',108),(2283,'-other-',109),(2284,'Indica',109),(2285,'Indigo',109),(2286,'Nano',109),(2287,'Safari',109),(2288,'Sumo',109),(2289,'Telcoline',109),(2290,'Telcosport',109),(2291,'Xenon',109),(2292,'-other-',110),(2293,'603',110),(2294,'613',110),(2295,'700',110),(2296,'77',110),(2297,'80',110),(2298,'87',110),(2299,'Zero',111),(2300,'-other-',112),(2301,'Andere',112),(2302,'Model S',112),(2303,'Model X',112),(2304,'Roadster',112),(2305,'-other-',113),(2306,'City',113),(2307,'-other-',114),(2308,'4Runner',114),(2309,'Allion',114),(2310,'Alphard',114),(2311,'Auris',114),(2312,'Avalon',114),(2313,'Avensis',114),(2314,'Avensis Verso',114),(2315,'Aygo',114),(2316,'C-HR',114),(2317,'Camry',114),(2318,'Carina',114),(2319,'Celica',114),(2320,'Chaser',114),(2321,'Corolla',114),(2322,'Corolla Verso',114),(2323,'Cressida',114),(2324,'Cresta',114),(2325,'Crown',114),(2326,'Dyna',114),(2327,'Echo',114),(2328,'Estima',114),(2329,'FJ Cruiser',114),(2330,'GT 86',114),(2331,'Hiace',114),(2332,'Highlander',114),(2333,'Hilux',114),(2334,'Ipsum',114),(2335,'iQ',114),(2336,'Kluger V',114),(2337,'Land Cruiser',114),(2338,'Liteace',114),(2339,'Matrix',114),(2340,'Mega Cruiser',114),(2341,'MR 2',114),(2342,'Nadia',114),(2343,'Paseo',114),(2344,'Picnic',114),(2345,'Previa',114),(2346,'Prius',114),(2347,'Prius C',114),(2348,'Prius+',114),(2349,'ProAce',114),(2350,'RAV4',114),(2351,'Rush',114),(2352,'Sequoia',114),(2353,'Sienna',114),(2354,'Soarer',114),(2355,'Solara',114),(2356,'Starlet',114),(2357,'Supra',114),(2358,'Tacoma',114),(2359,'Tercel',114),(2360,'Tundra',114),(2361,'Urban Cruiser',114),(2362,'Venza',114),(2363,'Verso',114),(2364,'Verso-S',114),(2365,'Yaris',114),(2366,'Yaris Verso',114),(2367,'-other-',115),(2368,'601',115),(2369,'-other-',116),(2370,'Dolomite',116),(2371,'Moss',116),(2372,'Spitfire',116),(2373,'TR6',116),(2374,'2101',117),(2375,'2103',117),(2376,'2206',117),(2377,'3151',117),(2378,'3303',117),(2379,'3741',117),(2380,'3909',117),(2381,'3962',117),(2382,'452',117),(2383,'469',117),(2384,'Hunter',117),(2385,'Patriot',117),(2386,'Pickup',117),(2387,'-other-',118),(2388,'Astra',118),(2389,'Insignia',118),(2390,'Vectra',118),(2391,'-other-',119),(2392,'210',119),(2393,'260',119),(2394,'300',119),(2395,'400',119),(2396,'-other-',120),(2397,'Amarok',120),(2398,'Arteon',120),(2399,'Beetle',120),(2400,'Bora',120),(2401,'Buggy ',120),(2402,'Caddy',120),(2403,'California',120),(2404,'Caravelle',120),(2405,'Corrado',120),(2406,'Crafter',120),(2407,'Cross Touran',120),(2408,'Derby',120),(2409,'Eos',120),(2410,'Fox',120),(2411,'Golf',120),(2412,'Golf Plus',120),(2413,'Golf Sportsvan',120),(2414,'Golf SportWagen',120),(2415,'Iltia',120),(2416,'Jetta',120),(2417,'Kaefer',120),(2418,'Karmann Ghia',120),(2419,'LT',120),(2420,'Lupo',120),(2421,'Multivan',120),(2422,'Passat',120),(2423,'Passat Alltrack',120),(2424,'Passat CC',120),(2425,'Phaeton',120),(2426,'Polo',120),(2427,'Rabbit',120),(2428,'Routan',120),(2429,'Santana',120),(2430,'Scirocco',120),(2431,'Sharan',120),(2432,'T-Roc',120),(2433,'Taro',120),(2434,'Tiguan',120),(2435,'Touareg',120),(2436,'Touran',120),(2437,'Transporter',120),(2438,'Up',120),(2439,'Vento',120),(2440,'-other-',121),(2441,'240',121),(2442,'244',121),(2443,'245',121),(2444,'262',121),(2445,'264',121),(2446,'340',121),(2447,'360',121),(2448,'440',121),(2449,'460',121),(2450,'480',121),(2451,'740',121),(2452,'744',121),(2453,'745',121),(2454,'760',121),(2455,'780',121),(2456,'850',121),(2457,'855',121),(2458,'940',121),(2459,'944',121),(2460,'945',121),(2461,'960',121),(2462,'965',121),(2463,'Amazon',121),(2464,'C30',121),(2465,'C70',121),(2466,'Polar',121),(2467,'S40',121),(2468,'S60',121),(2469,'S60 Cross Country ',121),(2470,'S70',121),(2471,'S80',121),(2472,'S90',121),(2473,'V40',121),(2474,'V40 Cross Country',121),(2475,'V50',121),(2476,'V60',121),(2477,'V60 Cross Country ',121),(2478,'V70',121),(2479,'V90',121),(2480,'V90 Cross Country',121),(2481,'XC40',121),(2482,'XC60',121),(2483,'XC70',121),(2484,'XC90',121),(2485,'-other-',122),(2486,'W 25K',122),(2487,'-other-',123),(2488,'311',123),(2489,'353',123),(2490,'-other-',124),(2491,'965',124),(2492,'966',124),(2493,'968',124),(2494,'968A',124),(2495,'968M',124),(2496,'Tavrija',124);
/*!40000 ALTER TABLE `vehicle_model` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-11-17 21:01:39
