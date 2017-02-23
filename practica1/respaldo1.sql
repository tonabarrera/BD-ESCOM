-- MySQL dump 10.13  Distrib 5.6.16, for Win32 (x86)
--
-- Host: localhost    Database: trabajos_terminales
-- ------------------------------------------------------
-- Server version	5.6.16

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
-- Table structure for table `catedratico`
--

DROP TABLE IF EXISTS `catedratico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catedratico` (
  `idProf` int(11) NOT NULL,
  `nombre` varchar(20) DEFAULT NULL,
  `ap` varchar(30) DEFAULT NULL,
  `am` varchar(30) DEFAULT NULL,
  `academia` varchar(50) DEFAULT NULL,
  `salario` double DEFAULT NULL,
  `idDepto` int(11) DEFAULT NULL,
  `tel` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`idProf`),
  KEY `idDepto` (`idDepto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catedratico`
--

LOCK TABLES `catedratico` WRITE;
/*!40000 ALTER TABLE `catedratico` DISABLE KEYS */;
/*!40000 ALTER TABLE `catedratico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `depto`
--

DROP TABLE IF EXISTS `depto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `depto` (
  `idDepto` int(11) NOT NULL,
  `depto` varchar(50) NOT NULL,
  PRIMARY KEY (`idDepto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `depto`
--

LOCK TABLES `depto` WRITE;
/*!40000 ALTER TABLE `depto` DISABLE KEYS */;
/*!40000 ALTER TABLE `depto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dirige`
--

DROP TABLE IF EXISTS `dirige`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dirige` (
  `idProf` int(11) NOT NULL,
  `nott` int(11) NOT NULL,
  PRIMARY KEY (`idProf`,`nott`),
  KEY `nott` (`nott`),
  CONSTRAINT `dirige_ibfk_1` FOREIGN KEY (`idProf`) REFERENCES `catedratico` (`idProf`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `dirige_ibfk_2` FOREIGN KEY (`nott`) REFERENCES `tt` (`nott`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dirige`
--

LOCK TABLES `dirige` WRITE;
/*!40000 ALTER TABLE `dirige` DISABLE KEYS */;
/*!40000 ALTER TABLE `dirige` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `presentacion`
--

DROP TABLE IF EXISTS `presentacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `presentacion` (
  `idPresentacion` int(11) NOT NULL,
  `fecha` date NOT NULL DEFAULT '0000-00-00',
  `califRevisor` float DEFAULT NULL,
  `califSinodales` float DEFAULT NULL,
  `tipo` varchar(30) DEFAULT NULL,
  `dictamen` varchar(30) DEFAULT NULL,
  `nott` int(11) DEFAULT NULL,
  PRIMARY KEY (`idPresentacion`,`fecha`),
  KEY `nott` (`nott`),
  CONSTRAINT `presentacion_ibfk_1` FOREIGN KEY (`nott`) REFERENCES `tt` (`nott`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `presentacion`
--

LOCK TABLES `presentacion` WRITE;
/*!40000 ALTER TABLE `presentacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `presentacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tt`
--

DROP TABLE IF EXISTS `tt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tt` (
  `nott` int(11) NOT NULL,
  `titulo` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`nott`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tt`
--

LOCK TABLES `tt` WRITE;
/*!40000 ALTER TABLE `tt` DISABLE KEYS */;
/*!40000 ALTER TABLE `tt` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-02-22 20:59:45
