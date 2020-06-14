-- MySQL dump 10.13  Distrib 5.7.30, for Linux (x86_64)
--
-- Host: localhost    Database: nida
-- ------------------------------------------------------
-- Server version	5.7.30-0ubuntu0.18.04.1

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
-- Table structure for table `courses`
--

DROP TABLE IF EXISTS `courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `courses` (
  `d_name` varchar(75) DEFAULT NULL,
  `c_number` int(4) NOT NULL,
  `c_name` varchar(8) NOT NULL,
  UNIQUE KEY `c_number` (`c_number`),
  UNIQUE KEY `c_name` (`c_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses`
--

LOCK TABLES `courses` WRITE;
/*!40000 ALTER TABLE `courses` DISABLE KEYS */;
INSERT INTO `courses` VALUES ('Computer Sciences',1111,'CS101'),('Computer Sciences',1112,'CS205'),('Computer Sciences',1113,'CS402'),('Computer Sciences',1114,'CS506'),('Computer Sciences',1115,'CS403'),('MATHEMATICS',2111,'MATH101'),('MATHEMATICS',2112,'MATH221'),('MATHEMATICS',2113,'MATH322'),('MATHEMATICS',2114,'MATH241'),('Geometry',3114,'Geo300'),('Geometry',3115,'Geo301');
/*!40000 ALTER TABLE `courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `departments` (
  `d_name` varchar(75) NOT NULL,
  `num_phds` int(3) DEFAULT NULL,
  UNIQUE KEY `d_name` (`d_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departments`
--

LOCK TABLES `departments` WRITE;
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
INSERT INTO `departments` VALUES ('BIOLOGY',60),('CHEMISTRY',20),('Computer Sciences',40),('Geometry',30),('HISTORY',55),('MATHEMATICS',10),('MEDICINE',70),('PHYSICS',30);
/*!40000 ALTER TABLE `departments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enroll`
--

DROP TABLE IF EXISTS `enroll`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enroll` (
  `s_id` int(4) DEFAULT NULL,
  `d_name` varchar(75) DEFAULT NULL,
  `c_number` int(4) DEFAULT NULL,
  `s_number` int(2) DEFAULT NULL,
  `grade` decimal(4,2) DEFAULT NULL,
  UNIQUE KEY `unique_entries` (`s_id`,`c_number`),
  KEY `c_number` (`c_number`,`s_number`),
  CONSTRAINT `enroll_ibfk_1` FOREIGN KEY (`c_number`, `s_number`) REFERENCES `sections` (`c_number`, `s_number`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enroll`
--

LOCK TABLES `enroll` WRITE;
/*!40000 ALTER TABLE `enroll` DISABLE KEYS */;
INSERT INTO `enroll` VALUES (1001,'Computer Sciences',1111,1,19.50),(1002,'Computer Sciences',1111,1,30.20),(1003,'Computer Sciences',1111,1,29.10),(1004,'Computer Sciences',1113,2,33.60),(1005,'Computer Sciences',1113,2,24.80),(1006,'Computer Sciences',1111,3,23.80),(1006,'MEDICINE',2111,1,23.80),(1006,'Computer Sciences',1113,2,23.80),(1002,'Computer Sciences',1113,2,23.80),(1001,'Computer Sciences',1113,2,23.80),(1002,'Geometry',3114,1,19.50),(1001,'Geometry',3114,1,19.50),(1003,'Geometry',3115,2,19.50),(1004,'Geometry',3115,2,19.50);
/*!40000 ALTER TABLE `enroll` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `major`
--

DROP TABLE IF EXISTS `major`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `major` (
  `d_name` varchar(75) DEFAULT NULL,
  `s_id` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `major`
--

LOCK TABLES `major` WRITE;
/*!40000 ALTER TABLE `major` DISABLE KEYS */;
INSERT INTO `major` VALUES ('Computer Sciences',1001),('Computer Sciences',1002),('Computer Sciences',1003),('MATHEMATICS',1004),('MATHEMATICS',1005),('Computer Sciences',1006),('MATHEMATICS',1009),('Geometry',1007),('Geometry',1008);
/*!40000 ALTER TABLE `major` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `professors`
--

DROP TABLE IF EXISTS `professors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `professors` (
  `p_name` varchar(50) NOT NULL,
  `d_name` varchar(75) NOT NULL,
  PRIMARY KEY (`p_name`,`d_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `professors`
--

LOCK TABLES `professors` WRITE;
/*!40000 ALTER TABLE `professors` DISABLE KEYS */;
INSERT INTO `professors` VALUES ('Alex','Computer Sciences'),('Bill','Computer Sciences'),('Braudy','HISTORY'),('Carlos','PHYSICS'),('Dave','BIOLOGY'),('Fernando','Computer Sciences'),('Jessica','BIOLOGY'),('Jhonson','CHEMISTRY'),('Johnatan','MATHEMATICS'),('Silvester','MEC'),('Sixto','Geometry'),('Smith','HISTORY'),('Suheiry','MEC');
/*!40000 ALTER TABLE `professors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sections`
--

DROP TABLE IF EXISTS `sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sections` (
  `d_name` varchar(75) DEFAULT NULL,
  `c_number` int(4) NOT NULL,
  `s_number` int(2) NOT NULL,
  `p_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`c_number`,`s_number`),
  KEY `p_name` (`p_name`,`d_name`),
  CONSTRAINT `sections_ibfk_1` FOREIGN KEY (`p_name`, `d_name`) REFERENCES `professors` (`p_name`, `d_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sections`
--

LOCK TABLES `sections` WRITE;
/*!40000 ALTER TABLE `sections` DISABLE KEYS */;
INSERT INTO `sections` VALUES ('Computer Sciences',1112,2,'Alex'),('Computer Sciences',1113,2,'Alex'),('Computer Sciences',1111,1,'BilL'),('Computer Sciences',1113,1,'BilL'),('Computer Sciences',1111,2,'Fernando'),('Computer Sciences',1111,3,'Fernando'),('Computer Sciences',1112,1,'Fernando'),('MATHEMATICS',2111,1,'Johnatan'),('Geometry',3114,1,'Sixto'),('Geometry',3115,2,'Sixto');
/*!40000 ALTER TABLE `sections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `students` (
  `s_id` int(11) NOT NULL,
  `s_name` varchar(50) NOT NULL,
  `s_sex` varchar(10) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `yr` year(4) DEFAULT NULL,
  `gpa` decimal(3,2) DEFAULT NULL,
  PRIMARY KEY (`s_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` VALUES (1001,'Manuel','male',23,2019,3.27),(1002,'Alfredo','male',12,2019,2.12),(1003,'Trung','male',43,2000,3.12),(1004,'Edom','male',123,2001,1.23),(1005,'Rubiner','male',11,2029,2.12),(1006,'Chen','male',45,1999,4.00),(1007,'Saran','male',65,1919,4.00),(1008,'Dian','male',13,1989,3.32),(1009,'Alejandro','male',88,1979,3.92);
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-06-14  1:47:44
