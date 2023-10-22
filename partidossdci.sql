CREATE DATABASE  IF NOT EXISTS `partidossdci` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `partidossdci`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: partidossdci
-- ------------------------------------------------------
-- Server version	8.0.33

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
-- Table structure for table `deporte`
--

DROP TABLE IF EXISTS `deporte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `deporte` (
  `iddeporte` int NOT NULL AUTO_INCREMENT,
  `nombreDeporte` varchar(45) NOT NULL,
  `pesoDeporte` int NOT NULL,
  PRIMARY KEY (`iddeporte`),
  UNIQUE KEY `nombreActividad_UNIQUE` (`nombreDeporte`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deporte`
--

LOCK TABLES `deporte` WRITE;
/*!40000 ALTER TABLE `deporte` DISABLE KEYS */;
INSERT INTO `deporte` VALUES (1,'Futbol',2),(2,'Ballet',2),(5,'Basket',2);
/*!40000 ALTER TABLE `deporte` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipo`
--

DROP TABLE IF EXISTS `equipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `equipo` (
  `idequipo` int NOT NULL AUTO_INCREMENT,
  `nombreEquipo` varchar(45) NOT NULL,
  `colorEquipo` varchar(45) NOT NULL,
  `mascota` varchar(45) NOT NULL,
  PRIMARY KEY (`idequipo`),
  UNIQUE KEY `nombre_UNIQUE` (`nombreEquipo`),
  UNIQUE KEY `color_UNIQUE` (`colorEquipo`),
  UNIQUE KEY `mascota_UNIQUE` (`mascota`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipo`
--

LOCK TABLES `equipo` WRITE;
/*!40000 ALTER TABLE `equipo` DISABLE KEYS */;
INSERT INTO `equipo` VALUES (1,'Equipo 1','Azul','Rata'),(2,'Equipo 2','Rojo','Pez'),(3,'Equipo 3','Verde','Cucaracha'),(4,'Equipo 4','Negro','Pulga'),(5,'Equipo 5','Turquesa','Puerco');
/*!40000 ALTER TABLE `equipo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `historialpartidos`
--

DROP TABLE IF EXISTS `historialpartidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `historialpartidos` (
  `idhistorialPartidos` int NOT NULL AUTO_INCREMENT,
  `partido_idpartido` int NOT NULL,
  `deporte_iddeporte` int NOT NULL,
  `horaFecha` datetime NOT NULL,
  PRIMARY KEY (`idhistorialPartidos`),
  KEY `fk_historialPartidos_partido1_idx` (`partido_idpartido`),
  KEY `fk_historialPartidos_deporte1_idx` (`deporte_iddeporte`),
  CONSTRAINT `fk_historialPartidos_deporte1` FOREIGN KEY (`deporte_iddeporte`) REFERENCES `deporte` (`iddeporte`),
  CONSTRAINT `fk_historialPartidos_partido1` FOREIGN KEY (`partido_idpartido`) REFERENCES `partido` (`idpartido`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historialpartidos`
--

LOCK TABLES `historialpartidos` WRITE;
/*!40000 ALTER TABLE `historialpartidos` DISABLE KEYS */;
INSERT INTO `historialpartidos` VALUES (2,1,1,'2000-11-01 00:00:00'),(3,2,1,'2000-11-01 00:00:00'),(4,3,1,'2000-11-01 00:00:00'),(5,4,1,'2000-11-01 00:00:00'),(6,5,1,'2000-11-01 00:00:00'),(7,6,1,'2000-11-01 00:00:00'),(8,7,1,'2000-11-01 00:00:00'),(9,8,1,'2000-11-01 00:00:00'),(10,9,1,'2000-11-01 00:00:00');
/*!40000 ALTER TABLE `historialpartidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `participante`
--

DROP TABLE IF EXISTS `participante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `participante` (
  `idparticipante` int NOT NULL AUTO_INCREMENT,
  `equipo` int NOT NULL,
  `carrera` varchar(45) NOT NULL,
  `codigo` decimal(10,0) NOT NULL,
  `tipoParticipante` varchar(45) NOT NULL,
  PRIMARY KEY (`idparticipante`),
  KEY `fk_participante_equipo_idx` (`equipo`),
  CONSTRAINT `fk_participante_equipo` FOREIGN KEY (`equipo`) REFERENCES `equipo` (`idequipo`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `participante`
--

LOCK TABLES `participante` WRITE;
/*!40000 ALTER TABLE `participante` DISABLE KEYS */;
INSERT INTO `participante` VALUES (1,1,'Telecomunicaciones',20125421,'Suplente'),(2,1,'Telecomunicaciones',20125422,'Suplente'),(3,2,'Telecomunicaciones',20125423,'Suplente'),(4,2,'Telecomunicaciones',20125424,'Suplente'),(5,3,'Telecomunicaciones',20125424,'Suplente'),(6,3,'Telecomunicaciones',20125425,'Suplente'),(7,4,'Telecomunicaciones',20125426,'Suplente'),(8,4,'Telecomunicaciones',20125427,'Suplente'),(9,2,'Telecomunicaciones',20125416,'Suplente');
/*!40000 ALTER TABLE `participante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `participantespartido`
--

DROP TABLE IF EXISTS `participantespartido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `participantespartido` (
  `idparticipantesPartido` int NOT NULL AUTO_INCREMENT,
  `partido_idpartido` int NOT NULL,
  `participante_idparticipante` int NOT NULL,
  `horaFecha` datetime NOT NULL,
  PRIMARY KEY (`idparticipantesPartido`),
  KEY `fk_participantesPartido_partido1_idx` (`partido_idpartido`),
  KEY `fk_participantesPartido_participante1_idx` (`participante_idparticipante`),
  CONSTRAINT `fk_participantesPartido_participante1` FOREIGN KEY (`participante_idparticipante`) REFERENCES `participante` (`idparticipante`),
  CONSTRAINT `fk_participantesPartido_partido1` FOREIGN KEY (`partido_idpartido`) REFERENCES `partido` (`idpartido`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `participantespartido`
--

LOCK TABLES `participantespartido` WRITE;
/*!40000 ALTER TABLE `participantespartido` DISABLE KEYS */;
INSERT INTO `participantespartido` VALUES (10,1,5,'2000-11-01 00:00:00'),(11,1,6,'2000-11-01 00:00:00'),(12,1,7,'2000-11-01 00:00:00'),(13,1,8,'2000-11-01 00:00:00'),(14,2,5,'2000-11-01 00:00:00'),(15,2,6,'2000-11-01 00:00:00'),(16,2,7,'2000-11-01 00:00:00'),(17,2,8,'2000-11-01 00:00:00'),(18,3,5,'2000-11-01 00:00:00'),(19,3,6,'2000-11-01 00:00:00'),(20,3,7,'2000-11-01 00:00:00'),(21,3,8,'2000-11-01 00:00:00'),(22,4,1,'2000-11-01 00:00:00'),(23,4,2,'2000-11-01 00:00:00'),(24,4,5,'2000-11-01 00:00:00'),(25,4,6,'2000-11-01 00:00:00'),(26,5,3,'2000-11-01 00:00:00'),(27,5,4,'2000-11-01 00:00:00'),(28,5,5,'2000-11-01 00:00:00'),(29,5,6,'2000-11-01 00:00:00'),(30,6,3,'2000-11-01 00:00:00'),(31,6,4,'2000-11-01 00:00:00'),(32,6,5,'2000-11-01 00:00:00'),(33,6,6,'2000-11-01 00:00:00'),(34,7,5,'2000-11-01 00:00:00'),(35,7,6,'2000-11-01 00:00:00'),(36,7,7,'2000-11-01 00:00:00'),(37,7,8,'2000-11-01 00:00:00'),(38,8,5,'2000-11-01 00:00:00'),(39,8,6,'2000-11-01 00:00:00'),(40,8,7,'2000-11-01 00:00:00'),(41,8,8,'2000-11-01 00:00:00'),(42,9,5,'2000-11-01 00:00:00'),(43,9,6,'2000-11-01 00:00:00'),(44,9,7,'2000-11-01 00:00:00'),(45,9,8,'2000-11-01 00:00:00');
/*!40000 ALTER TABLE `participantespartido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `partido`
--

DROP TABLE IF EXISTS `partido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `partido` (
  `idpartido` int NOT NULL AUTO_INCREMENT,
  `equipoA` int NOT NULL,
  `equipoB` int NOT NULL,
  `scoreA` int NOT NULL,
  `scoreB` int NOT NULL,
  PRIMARY KEY (`idpartido`),
  KEY `fk_partido_equipo1_idx` (`equipoA`),
  KEY `fk_partido_equipo2_idx` (`equipoB`),
  CONSTRAINT `fk_partido_equipo1` FOREIGN KEY (`equipoA`) REFERENCES `equipo` (`idequipo`),
  CONSTRAINT `fk_partido_equipo2` FOREIGN KEY (`equipoB`) REFERENCES `equipo` (`idequipo`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `partido`
--

LOCK TABLES `partido` WRITE;
/*!40000 ALTER TABLE `partido` DISABLE KEYS */;
INSERT INTO `partido` VALUES (1,3,4,4,5),(2,3,4,4,5),(3,3,4,4,5),(4,1,3,4,5),(5,2,3,4,5),(6,2,3,4,5),(7,4,3,4,5),(8,3,4,4,5),(9,3,4,4,5);
/*!40000 ALTER TABLE `partido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spring_session`
--

DROP TABLE IF EXISTS `spring_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `spring_session` (
  `PRIMARY_ID` char(36) NOT NULL,
  `SESSION_ID` char(36) NOT NULL,
  `CREATION_TIME` bigint NOT NULL,
  `LAST_ACCESS_TIME` bigint NOT NULL,
  `MAX_INACTIVE_INTERVAL` int NOT NULL,
  `EXPIRY_TIME` bigint NOT NULL,
  `PRINCIPAL_NAME` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`PRIMARY_ID`),
  UNIQUE KEY `SPRING_SESSION_IX1` (`SESSION_ID`),
  KEY `SPRING_SESSION_IX2` (`EXPIRY_TIME`),
  KEY `SPRING_SESSION_IX3` (`PRINCIPAL_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spring_session`
--

LOCK TABLES `spring_session` WRITE;
/*!40000 ALTER TABLE `spring_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `spring_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spring_session_attributes`
--

DROP TABLE IF EXISTS `spring_session_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `spring_session_attributes` (
  `SESSION_PRIMARY_ID` char(36) NOT NULL,
  `ATTRIBUTE_NAME` varchar(200) NOT NULL,
  `ATTRIBUTE_BYTES` blob NOT NULL,
  PRIMARY KEY (`SESSION_PRIMARY_ID`,`ATTRIBUTE_NAME`),
  CONSTRAINT `SPRING_SESSION_ATTRIBUTES_FK` FOREIGN KEY (`SESSION_PRIMARY_ID`) REFERENCES `spring_session` (`PRIMARY_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spring_session_attributes`
--

LOCK TABLES `spring_session_attributes` WRITE;
/*!40000 ALTER TABLE `spring_session_attributes` DISABLE KEYS */;
/*!40000 ALTER TABLE `spring_session_attributes` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-10-22  2:44:48
