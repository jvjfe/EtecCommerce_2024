-- MariaDB dump 10.19  Distrib 10.4.32-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: eteccommerce
-- ------------------------------------------------------
-- Server version	10.4.32-MariaDB

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
-- Table structure for table `bkpcidade`
--

DROP TABLE IF EXISTS `bkpcidade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bkpcidade` (
  `IDBKPCIDADE` int(11) NOT NULL AUTO_INCREMENT,
  `IDCIDADE` int(11) NOT NULL,
  `NOME` varchar(50) NOT NULL,
  `IDESTADO` int(11) NOT NULL,
  `CLIENTES` int(11) DEFAULT 0,
  `DTINSERT` date DEFAULT NULL,
  `HRINSERT` time DEFAULT NULL,
  `DTUPDATE` date DEFAULT NULL,
  `HRUPDATE` time DEFAULT NULL,
  `DTBKP` date DEFAULT NULL,
  `HRBKP` time DEFAULT NULL,
  PRIMARY KEY (`IDBKPCIDADE`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bkpcidade`
--

LOCK TABLES `bkpcidade` WRITE;
/*!40000 ALTER TABLE `bkpcidade` DISABLE KEYS */;
INSERT INTO `bkpcidade` VALUES (2,2,'RIBEIRÃO PRETO',1,0,'2024-12-02','11:04:59',NULL,NULL,'2024-12-02','11:04:59'),(3,3,'PINDAMONHAGABA',1,0,'2024-12-02','11:05:14',NULL,NULL,'2024-12-02','11:05:14'),(4,3,'PINDAMONHAGABA',1,0,'2024-12-02','11:05:14',NULL,NULL,'2024-12-02','11:09:43'),(5,4,'BELFORD ROXO',2,0,'2024-12-02','11:13:11',NULL,NULL,'2024-12-02','11:13:11'),(6,5,'NOVA IGUAÇU',2,0,'2024-12-02','11:13:25',NULL,NULL,'2024-12-02','11:13:25'),(7,6,'PETRÓPOLIS',2,0,'2024-12-02','11:13:34',NULL,NULL,'2024-12-02','11:13:34'),(8,7,'CAMPOS DOS GOYTACAZES',2,0,'2024-12-02','11:13:46',NULL,NULL,'2024-12-02','11:13:46'),(9,8,'SOROCABA',1,0,'2024-12-02','11:14:01',NULL,NULL,'2024-12-02','11:14:01'),(10,9,'CAMPINAS',1,0,'2024-12-02','11:14:15',NULL,NULL,'2024-12-02','11:14:15'),(11,10,'BAURU',1,0,'2024-12-02','11:14:32',NULL,NULL,'2024-12-02','11:14:32'),(12,11,'RECIFE',4,0,'2024-12-02','11:14:58',NULL,NULL,'2024-12-02','11:14:58'),(13,12,'VITÓRIA DE SANTO ANTÃO',4,0,'2024-12-02','11:15:19',NULL,NULL,'2024-12-02','11:15:19'),(14,13,'CARUARU',4,0,'2024-12-02','11:15:32',NULL,NULL,'2024-12-02','11:15:32'),(15,14,'IPOJUCA',4,0,'2024-12-02','11:15:42',NULL,NULL,'2024-12-02','11:15:42'),(16,15,'MARINGÁ',5,0,'2024-12-02','11:15:54',NULL,NULL,'2024-12-02','11:15:54'),(17,16,'BETIM',3,0,'2024-12-02','11:16:18',NULL,NULL,'2024-12-02','11:16:18'),(18,17,'UBERLÂNDIA',3,0,'2024-12-02','11:16:24',NULL,NULL,'2024-12-02','11:16:24'),(19,18,'IPATINGA',3,0,'2024-12-02','11:16:31',NULL,NULL,'2024-12-02','11:16:31'),(20,19,'JUIZ DE FORA',3,0,'2024-12-02','11:16:38',NULL,NULL,'2024-12-02','11:16:38');
/*!40000 ALTER TABLE `bkpcidade` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER antesInserirBkpCidade BEFORE INSERT ON bkpcidade FOR EACH ROW
BEGIN
SET NEW.DTBKP = CURRENT_DATE();
SET NEW.HRBKP = CURRENT_TIME();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `bkpestado`
--

DROP TABLE IF EXISTS `bkpestado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bkpestado` (
  `IDBKPESTADO` int(11) NOT NULL AUTO_INCREMENT,
  `IDESTADO` int(11) NOT NULL,
  `SIGLA` varchar(2) NOT NULL,
  `NOME` varchar(50) NOT NULL,
  `CIDADE` int(11) DEFAULT NULL,
  `DTINSERT` date DEFAULT NULL,
  `HRINSERT` time DEFAULT NULL,
  `DTUPDATE` date DEFAULT NULL,
  `HRUPDATE` time DEFAULT NULL,
  `DTBKP` date DEFAULT NULL,
  `HRBKP` time DEFAULT NULL,
  PRIMARY KEY (`IDBKPESTADO`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bkpestado`
--

LOCK TABLES `bkpestado` WRITE;
/*!40000 ALTER TABLE `bkpestado` DISABLE KEYS */;
/*!40000 ALTER TABLE `bkpestado` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER antesInserirBkpestado BEFORE INSERT ON bkpestado FOR EACH ROW
BEGIN
SET NEW.DTBKP = CURRENT_DATE();
SET NEW.HRBKP = CURRENT_TIME();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `bkpmarca`
--

DROP TABLE IF EXISTS `bkpmarca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bkpmarca` (
  `IDBKPMARCA` int(11) NOT NULL AUTO_INCREMENT,
  `IDMARCA` int(11) NOT NULL,
  `NOME` varchar(50) NOT NULL,
  `PRODUTOS` int(11) DEFAULT 0,
  `DTINSERT` date DEFAULT NULL,
  `HRINSERT` time DEFAULT NULL,
  `DTUPDATE` date DEFAULT NULL,
  `HRUPDATE` time DEFAULT NULL,
  `DTBKP` date DEFAULT NULL,
  `HRBKP` time DEFAULT NULL,
  PRIMARY KEY (`IDBKPMARCA`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bkpmarca`
--

LOCK TABLES `bkpmarca` WRITE;
/*!40000 ALTER TABLE `bkpmarca` DISABLE KEYS */;
INSERT INTO `bkpmarca` VALUES (1,1,'ETEC',0,'2024-12-02','11:05:36',NULL,NULL,'2024-12-02','11:05:36');
/*!40000 ALTER TABLE `bkpmarca` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER antesInserirBkpMarca BEFORE INSERT ON bkpmarca FOR EACH ROW
BEGIN
SET NEW.DTBKP = CURRENT_DATE();
SET NEW.HRBKP = CURRENT_TIME();

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `bkpproduto`
--

DROP TABLE IF EXISTS `bkpproduto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bkpproduto` (
  `IDBKPPRODUTO` int(11) NOT NULL AUTO_INCREMENT,
  `IDPRODUTO` int(11) DEFAULT NULL,
  `NOME` varchar(50) NOT NULL,
  `PRECOCOMPRA` decimal(10,2) DEFAULT NULL,
  `MARGEMLUCRO` decimal(5,1) DEFAULT NULL,
  `PRECOVENDA` decimal(10,2) DEFAULT NULL,
  `IDMARCA` int(11) DEFAULT NULL,
  `IDUNIDADE` int(11) DEFAULT NULL,
  `COMPRADOS` int(11) DEFAULT NULL,
  `VENDIDOS` int(11) DEFAULT NULL,
  `ESTOQUE` int(11) DEFAULT NULL,
  `DTINSERT` date DEFAULT NULL,
  `HRINSERT` time DEFAULT NULL,
  `DTUPDATE` date DEFAULT NULL,
  `HRUPDATE` time DEFAULT NULL,
  `DTBKP` date DEFAULT NULL,
  `HRBKP` time DEFAULT NULL,
  PRIMARY KEY (`IDBKPPRODUTO`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bkpproduto`
--

LOCK TABLES `bkpproduto` WRITE;
/*!40000 ALTER TABLE `bkpproduto` DISABLE KEYS */;
/*!40000 ALTER TABLE `bkpproduto` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER antesInserirBkpProduto BEFORE INSERT ON bkpproduto FOR EACH ROW
BEGIN
SET NEW.DTBKP = CURRENT_DATE();
SET NEW.HRBKP = CURRENT_TIME();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `bkpunidade`
--

DROP TABLE IF EXISTS `bkpunidade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bkpunidade` (
  `IDBKPUNIDADE` int(11) NOT NULL AUTO_INCREMENT,
  `IDUNIDADE` int(11) NOT NULL,
  `NOME` varchar(20) NOT NULL,
  `PRODUTOS` int(11) DEFAULT 0,
  `DTINSERT` date DEFAULT NULL,
  `HRINSERT` time DEFAULT NULL,
  `DTUPDATE` date DEFAULT NULL,
  `HRUPDATE` time DEFAULT NULL,
  `DTBKP` date DEFAULT NULL,
  `HRBKP` time DEFAULT NULL,
  PRIMARY KEY (`IDBKPUNIDADE`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bkpunidade`
--

LOCK TABLES `bkpunidade` WRITE;
/*!40000 ALTER TABLE `bkpunidade` DISABLE KEYS */;
INSERT INTO `bkpunidade` VALUES (1,1,'SÃO PAULO',0,'2024-12-02','11:05:44',NULL,NULL,'2024-12-02','11:05:44');
/*!40000 ALTER TABLE `bkpunidade` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER antesInserirBkpUnidade BEFORE INSERT ON bkpunidade FOR EACH ROW
BEGIN
SET NEW.DTBKP = CURRENT_DATE();
SET NEW.HRBKP = CURRENT_TIME();

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `cidade`
--

DROP TABLE IF EXISTS `cidade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cidade` (
  `IDCIDADE` int(11) NOT NULL AUTO_INCREMENT,
  `NOME` varchar(50) NOT NULL,
  `IDESTADO` int(11) NOT NULL,
  `CLIENTES` int(11) DEFAULT 0,
  `DTINSERT` date DEFAULT NULL,
  `HRINSERT` time DEFAULT NULL,
  `DTUPDATE` date DEFAULT NULL,
  `HRUPDATE` time DEFAULT NULL,
  PRIMARY KEY (`IDCIDADE`),
  KEY `IDESTADO` (`IDESTADO`),
  CONSTRAINT `cidade_ibfk_1` FOREIGN KEY (`IDESTADO`) REFERENCES `estado` (`IDESTADO`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cidade`
--

LOCK TABLES `cidade` WRITE;
/*!40000 ALTER TABLE `cidade` DISABLE KEYS */;
INSERT INTO `cidade` VALUES (2,'RIBEIRÃO PRETO',1,0,'2024-12-02','11:04:59',NULL,NULL),(4,'BELFORD ROXO',2,0,'2024-12-02','11:13:11',NULL,NULL),(5,'NOVA IGUAÇU',2,0,'2024-12-02','11:13:25',NULL,NULL),(6,'PETRÓPOLIS',2,0,'2024-12-02','11:13:34',NULL,NULL),(7,'CAMPOS DOS GOYTACAZES',2,0,'2024-12-02','11:13:46',NULL,NULL),(8,'SOROCABA',1,0,'2024-12-02','11:14:01',NULL,NULL),(9,'CAMPINAS',1,0,'2024-12-02','11:14:15',NULL,NULL),(10,'BAURU',1,0,'2024-12-02','11:14:32',NULL,NULL),(11,'RECIFE',4,0,'2024-12-02','11:14:58',NULL,NULL),(12,'VITÓRIA DE SANTO ANTÃO',4,0,'2024-12-02','11:15:19',NULL,NULL),(13,'CARUARU',4,0,'2024-12-02','11:15:32',NULL,NULL),(14,'IPOJUCA',4,0,'2024-12-02','11:15:42',NULL,NULL),(15,'MARINGÁ',5,0,'2024-12-02','11:15:54',NULL,NULL),(16,'BETIM',3,0,'2024-12-02','11:16:18',NULL,NULL),(17,'UBERLÂNDIA',3,0,'2024-12-02','11:16:24',NULL,NULL),(18,'IPATINGA',3,0,'2024-12-02','11:16:31',NULL,NULL),(19,'JUIZ DE FORA',3,0,'2024-12-02','11:16:38',NULL,NULL);
/*!40000 ALTER TABLE `cidade` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER antesInserirCidade BEFORE INSERT ON cidade FOR EACH ROW
BEGIN
SET NEW.NOME = UPPER(NEW.NOME);
SET NEW.DTINSERT = CURRENT_DATE();
SET NEW.HRINSERT = CURRENT_TIME();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER depoisInserirCidade AFTER INSERT ON cidade FOR EACH ROW
BEGIN

INSERT INTO bkpcidade(IDCIDADE,NOME,IDESTADO,DTINSERT,HRINSERT,DTUPDATE,HRUPDATE)
VALUES (NEW.IDCIDADE,NEW.NOME,NEW.IDESTADO,NEW.DTINSERT,NEW.HRINSERT,NEW.DTUPDATE,NEW.HRUPDATE);


INSERT INTO historico (ACAO,TABELA,ID) VALUE ('INSERT','cidade',NEW.IDCIDADE);


CALL calcularCidades(NEW.IDESTADO);

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER antesAlterarCidade BEFORE UPDATE ON cidade FOR EACH ROW
BEGIN
SET NEW.NOME = UPPER(NEW.NOME);
SET NEW.DTUPDATE = CURRENT_DATE();
SET NEW.HRUPDATE = CURRENT_TIME();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER depoisAlterarCidade AFTER UPDATE ON cidade FOR EACH ROW
BEGIN

INSERT INTO bkpcidade(IDCIDADE,NOME,IDESTADO,DTINSERT,HRINSERT,DTUPDATE,HRUPDATE)
VALUES (NEW.IDCIDADE,NEW.NOME,NEW.IDESTADO,NEW.DTINSERT,NEW.HRINSERT,NEW.DTUPDATE,NEW.HRUPDATE);


INSERT INTO historico (ACAO,TABELA,ID) VALUE ('UPDATE','cidade',NEW.IDCIDADE);


IF(NEW.IDESTADO<>OLD.IDESTADO) THEN
CALL calcularCidades(NEW.IDESTADO);
CALL calcularCidades(OLD.IDESTADO);
END IF;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER antesExcluirCidade BEFORE DELETE ON cidade FOR EACH ROW
BEGIN

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER depoisExcluirCidade AFTER DELETE ON cidade FOR EACH ROW
BEGIN

INSERT INTO bkpcidade(IDCIDADE,NOME,IDESTADO,DTINSERT,HRINSERT,DTUPDATE,HRUPDATE)
VALUES (OLD.IDCIDADE,OLD.NOME,OLD.IDESTADO,OLD.DTINSERT,OLD.HRINSERT,OLD.DTUPDATE,OLD.HRUPDATE);


INSERT INTO historico (ACAO,TABELA,ID) VALUE ('DELETE','cidade',OLD.IDCIDADE);


CALL calcularCidades(OLD.IDESTADO);

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `estado`
--

DROP TABLE IF EXISTS `estado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estado` (
  `IDESTADO` int(11) NOT NULL AUTO_INCREMENT,
  `SIGLA` varchar(2) NOT NULL,
  `NOME` varchar(50) NOT NULL,
  `CIDADE` int(11) DEFAULT 0,
  `DTINSERT` date DEFAULT NULL,
  `HRINSERT` time DEFAULT NULL,
  `DTUPDATE` date DEFAULT NULL,
  `HRUPDATE` time DEFAULT NULL,
  PRIMARY KEY (`IDESTADO`),
  UNIQUE KEY `SIGLA` (`SIGLA`),
  UNIQUE KEY `NOME` (`NOME`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estado`
--

LOCK TABLES `estado` WRITE;
/*!40000 ALTER TABLE `estado` DISABLE KEYS */;
INSERT INTO `estado` VALUES (1,'SP','SÃO PAULO',4,'2024-12-02','10:58:22','2024-12-02','11:14:32'),(2,'RJ','RIO DE JANEIRO',4,'2024-12-02','11:10:42','2024-12-02','11:13:46'),(3,'MG','MINAS GERAIS',4,'2024-12-02','11:11:18','2024-12-02','11:16:38'),(4,'PE','PERNAMBUCO',4,'2024-12-02','11:11:38','2024-12-02','11:15:42'),(5,'PR','PARANÁ',1,'2024-12-02','11:11:53','2024-12-02','11:15:54');
/*!40000 ALTER TABLE `estado` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER antesInserirEstado BEFORE INSERT ON estado FOR EACH ROW
BEGIN
SET NEW.NOME = UPPER(NEW.NOME);
SET NEW.SIGLA = UPPER(NEW.SIGLA);
SET NEW.DTINSERT = CURRENT_DATE();
SET NEW.HRINSERT = CURRENT_TIME();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER antesAlterarEstado BEFORE UPDATE ON estado FOR EACH ROW
BEGIN
SET NEW.NOME = UPPER(NEW.NOME);
SET NEW.SIGLA = UPPER(NEW.SIGLA);
SET NEW.DTUPDATE = CURRENT_DATE();
SET NEW.HRUPDATE = CURRENT_TIME();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER antesExcluirEstado BEFORE DELETE ON estado FOR EACH ROW
BEGIN

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `historico`
--

DROP TABLE IF EXISTS `historico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `historico` (
  `IDHISTORICO` int(11) NOT NULL AUTO_INCREMENT,
  `ACAO` varchar(10) NOT NULL,
  `TABELA` varchar(50) NOT NULL,
  `ID` int(11) NOT NULL,
  `DTHISTORICO` date NOT NULL,
  `HRHISTORICO` time NOT NULL,
  PRIMARY KEY (`IDHISTORICO`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historico`
--

LOCK TABLES `historico` WRITE;
/*!40000 ALTER TABLE `historico` DISABLE KEYS */;
INSERT INTO `historico` VALUES (2,'INSERT','cidade',2,'2024-12-02','11:04:59'),(3,'INSERT','cidade',3,'2024-12-02','11:05:14'),(4,'INSERT','marca',1,'2024-12-02','11:05:36'),(5,'INSERT','unidade',1,'2024-12-02','11:05:44'),(6,'DELETE','cidade',3,'2024-12-02','11:09:43'),(7,'INSERT','cidade',4,'2024-12-02','11:13:11'),(8,'INSERT','cidade',5,'2024-12-02','11:13:25'),(9,'INSERT','cidade',6,'2024-12-02','11:13:34'),(10,'INSERT','cidade',7,'2024-12-02','11:13:46'),(11,'INSERT','cidade',8,'2024-12-02','11:14:01'),(12,'INSERT','cidade',9,'2024-12-02','11:14:15'),(13,'INSERT','cidade',10,'2024-12-02','11:14:32'),(14,'INSERT','cidade',11,'2024-12-02','11:14:58'),(15,'INSERT','cidade',12,'2024-12-02','11:15:19'),(16,'INSERT','cidade',13,'2024-12-02','11:15:32'),(17,'INSERT','cidade',14,'2024-12-02','11:15:42'),(18,'INSERT','cidade',15,'2024-12-02','11:15:54'),(19,'INSERT','cidade',16,'2024-12-02','11:16:18'),(20,'INSERT','cidade',17,'2024-12-02','11:16:24'),(21,'INSERT','cidade',18,'2024-12-02','11:16:31'),(22,'INSERT','cidade',19,'2024-12-02','11:16:38');
/*!40000 ALTER TABLE `historico` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER antesInserirHistorico BEFORE INSERT ON historico FOR EACH ROW
BEGIN
SET NEW.DTHISTORICO = CURRENT_DATE();
SET NEW.HRHISTORICO = CURRENT_TIME();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `marca`
--

DROP TABLE IF EXISTS `marca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `marca` (
  `IDMARCA` int(11) NOT NULL AUTO_INCREMENT,
  `NOME` varchar(50) NOT NULL,
  `PRODUTOS` int(11) DEFAULT 0,
  `DTINSERT` date DEFAULT NULL,
  `HRINSERT` time DEFAULT NULL,
  `DTUPDATE` date DEFAULT NULL,
  `HRUPDATE` time DEFAULT NULL,
  PRIMARY KEY (`IDMARCA`),
  UNIQUE KEY `NOME` (`NOME`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marca`
--

LOCK TABLES `marca` WRITE;
/*!40000 ALTER TABLE `marca` DISABLE KEYS */;
INSERT INTO `marca` VALUES (1,'ETEC',0,'2024-12-02','11:05:36',NULL,NULL);
/*!40000 ALTER TABLE `marca` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER  antesInserirMarca BEFORE INSERT ON marca FOR EACH ROW
BEGIN
SET NEW.NOME =  UPPER(NEW.NOME);
SET NEW.DTINSERT = CURRENT_DATE();
SET NEW.HRINSERT = CURRENT_TIME();

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER  depoisInserirMarca AFTER INSERT ON marca FOR EACH ROW
BEGIN
INSERT INTO bkpmarca (IDMARCA,NOME,PRODUTOS,DTINSERT,HRINSERT,DTUPDATE,HRUPDATE)
VALUES (NEW.IDMARCA,NEW.NOME,NEW.PRODUTOS,NEW.DTINSERT,NEW.HRINSERT,NEW.DTUPDATE,NEW.HRUPDATE);

INSERT INTO historico (ACAO,TABELA,ID) VALUES ("INSERT","marca",NEW.IDMARCA);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER  antesAlterarMarca BEFORE UPDATE ON marca FOR EACH ROW
BEGIN
SET NEW.NOME =  UPPER(NEW.NOME);
SET NEW.DTUPDATE = CURRENT_DATE();
SET NEW.HRUPDATE = CURRENT_TIME();

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER  depoisAlterarMarca AFTER UPDATE ON marca FOR EACH ROW
BEGIN
INSERT INTO bkpmarca (IDMARCA,NOME,PRODUTOS,DTINSERT,HRINSERT,DTUPDATE,HRUPDATE)
VALUES (NEW.IDMARCA,NEW.NOME,NEW.PRODUTOS,NEW.DTINSERT,NEW.HRINSERT,NEW.DTUPDATE,NEW.HRUPDATE);

INSERT INTO historico (ACAO,TABELA,ID) VALUES ("UPDATE","marca",NEW.IDMARCA);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER  depoisExcluirMarca AFTER DELETE ON marca FOR EACH ROW
BEGIN
INSERT INTO bkpmarca (IDMARCA,NOME,PRODUTOS,DTINSERT,HRINSERT,DTUPDATE,HRUPDATE)
VALUES (OLD.IDMARCA,OLD.NOME,OLD.PRODUTOS,OLD.DTINSERT,OLD.HRINSERT,OLD.DTUPDATE,OLD.HRUPDATE);

INSERT INTO historico (ACAO,TABELA,ID) VALUES ("DELETE","marca",OLD.IDMARCA);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `produto`
--

DROP TABLE IF EXISTS `produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `produto` (
  `IDPRODUTO` int(11) NOT NULL AUTO_INCREMENT,
  `NOME` varchar(50) NOT NULL,
  `PRECOCOMPRA` decimal(10,2) DEFAULT NULL,
  `MARGEMLUCRO` decimal(5,1) DEFAULT NULL,
  `PRECOVENDA` decimal(10,2) DEFAULT NULL,
  `IDMARCA` int(11) DEFAULT NULL,
  `IDUNIDADE` int(11) DEFAULT NULL,
  `COMPRADOS` int(11) DEFAULT 0,
  `VENDIDOS` int(11) DEFAULT 0,
  `ESTOQUE` int(11) DEFAULT 0,
  `DTINSERT` date DEFAULT NULL,
  `HRINSERT` time DEFAULT NULL,
  `DTUPDATE` date DEFAULT NULL,
  `HRUPDATE` time DEFAULT NULL,
  PRIMARY KEY (`IDPRODUTO`),
  KEY `IDMARCA` (`IDMARCA`),
  KEY `IDUNIDADE` (`IDUNIDADE`),
  CONSTRAINT `produto_ibfk_1` FOREIGN KEY (`IDMARCA`) REFERENCES `marca` (`IDMARCA`),
  CONSTRAINT `produto_ibfk_2` FOREIGN KEY (`IDUNIDADE`) REFERENCES `unidade` (`IDUNIDADE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto`
--

LOCK TABLES `produto` WRITE;
/*!40000 ALTER TABLE `produto` DISABLE KEYS */;
/*!40000 ALTER TABLE `produto` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER antesInserirProduto BEFORE INSERT ON produto FOR EACH ROW
BEGIN
SET NEW.NOME = UPPER(NEW.NOME);
SET NEW.PRECOVENDA = ROUND(NEW.PRECOCOMPRA*(1+NEW.MARGEMLUCRO/100),2);
SET NEW.DTINSERT = CURRENT_DATE();
SET NEW.HRINSERT = CURRENT_TIME();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER depoisInserirProduto AFTER INSERT ON produto FOR EACH ROW
BEGIN

INSERT INTO bkpproduto (IDPRODUTO,
NOME,
PRECOCOMPRA,
MARGEMLUCRO,
PRECOVENDA,
IDMARCA,
IDUNIDADE,
ESTOQUE,
DTINSERT,
HRINSERT,
DTUPDATE,
HRUPDATE)
VALUES (NEW.IDPRODUTO,
NEW.NOME,
NEW.PRECOCOMPRA,
NEW.MARGEMLUCRO,
NEW.PRECOVENDA,
NEW.IDMARCA,
NEW.IDUNIDADE,
NEW.ESTOQUE,
NEW.DTINSERT,
NEW.HRINSERT,
NEW.DTUPDATE,
NEW.HRUPDATE);


INSERT INTO historico (ACAO,TABELA,ID) VALUE ('INSERT','produto',NEW.IDPRODUTO);


CALL calcularProdutosMarca(NEW.IDMARCA);


CALL calcularProdutosUnidade(NEW.IDUNIDADE);

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER antesAlterarProduto BEFORE UPDATE ON produto FOR EACH ROW
BEGIN
SET NEW.NOME = UPPER(NEW.NOME);
SET NEW.PRECOVENDA = ROUND(NEW.PRECOCOMPRA*(1+NEW.MARGEMLUCRO/100),2);
SET NEW.ESTOQUE = NEW.COMPRADOS-NEW.VENDIDOS;
SET NEW.DTUPDATE = CURRENT_DATE();
SET NEW.HRUPDATE = CURRENT_TIME();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER depoisAlterarProduto AFTER UPDATE ON produto FOR EACH ROW
BEGIN

INSERT INTO bkpproduto (IDPRODUTO,
NOME,
PRECOCOMPRA,
MARGEMLUCRO,
PRECOVENDA,
IDMARCA,
IDUNIDADE,
ESTOQUE,
DTINSERT,
HRINSERT,
DTUPDATE,
HRUPDATE)
VALUES (NEW.IDPRODUTO,
NEW.NOME,
NEW.PRECOCOMPRA,
NEW.MARGEMLUCRO,
NEW.PRECOVENDA,
NEW.IDMARCA,
NEW.IDUNIDADE,
NEW.ESTOQUE,
NEW.DTINSERT,
NEW.HRINSERT,
NEW.DTUPDATE,
NEW.HRUPDATE);


INSERT INTO historico (ACAO,TABELA,ID) VALUE ('UPDATE','produto',NEW.IDPRODUTO);


IF(NEW.IDPRODUTO<>OLD.IDPRODUTO) THEN
CALL calcularProdutosMarca(NEW.IDMARCA);
CALL calcularProdutosMarca(OLD.IDMARCA);
END IF;


IF(NEW.IDPRODUTO<>OLD.IDPRODUTO) THEN
CALL calcularProdutosUnidade(NEW.IDUNIDADE);
CALL calcularProdutosUnidade(OLD.IDUNIDADE);
END IF;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER antesExcluirProduto BEFORE DELETE ON produto FOR EACH ROW
BEGIN

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER depoisExcluirProduto AFTER DELETE ON produto FOR EACH ROW
BEGIN

INSERT INTO bkpproduto (IDPRODUTO,
NOME,
PRECOCOMPRA,
MARGEMLUCRO,
PRECOVENDA,
IDMARCA,
IDUNIDADE,
ESTOQUE,
DTINSERT,
HRINSERT,
DTUPDATE,
HRUPDATE)
VALUES (OLD.IDPRODUTO,
OLD.NOME,
OLD.PRECOCOMPRA,
OLD.MARGEMLUCRO,
OLD.PRECOVENDA,
OLD.IDMARCA,
OLD.IDUNIDADE,
OLD.ESTOQUE,
OLD.DTINSERT,
OLD.HRINSERT,
OLD.DTUPDATE,
OLD.HRUPDATE);


INSERT INTO historico (ACAO,TABELA,ID) VALUE ('DELETE','produto',OLD.IDPRODUTO);


CALL calcularProdutosMarca(OLD.IDMARCA);


CALL calcularProdutosUnidade(OLD.IDUNIDADE);

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `unidade`
--

DROP TABLE IF EXISTS `unidade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unidade` (
  `IDUNIDADE` int(11) NOT NULL AUTO_INCREMENT,
  `NOME` varchar(20) NOT NULL,
  `PRODUTOS` int(11) DEFAULT 0,
  `DTINSERT` date DEFAULT NULL,
  `HRINSERT` time DEFAULT NULL,
  `DTUPDATE` date DEFAULT NULL,
  `HRUPDATE` time DEFAULT NULL,
  PRIMARY KEY (`IDUNIDADE`),
  UNIQUE KEY `NOME` (`NOME`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unidade`
--

LOCK TABLES `unidade` WRITE;
/*!40000 ALTER TABLE `unidade` DISABLE KEYS */;
INSERT INTO `unidade` VALUES (1,'SÃO PAULO',0,'2024-12-02','11:05:44',NULL,NULL);
/*!40000 ALTER TABLE `unidade` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER  antesInserirUnidade BEFORE INSERT ON unidade FOR EACH ROW
BEGIN
SET NEW.NOME =  UPPER(NEW.NOME);
SET NEW.DTINSERT = CURRENT_DATE();
SET NEW.HRINSERT = CURRENT_TIME();

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER  depoisInserirUnidade AFTER INSERT ON unidade FOR EACH ROW
BEGIN
INSERT INTO bkpunidade (IDUNIDADE,NOME,PRODUTOS,DTINSERT,HRINSERT,DTUPDATE,HRUPDATE)
VALUES (NEW.IDUNIDADE,NEW.NOME,NEW.PRODUTOS,NEW.DTINSERT,NEW.HRINSERT,NEW.DTUPDATE,NEW.HRUPDATE);

INSERT INTO historico (ACAO,TABELA,ID) VALUES ("INSERT","unidade",NEW.IDUNIDADE);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER  antesAlterarUnidade BEFORE UPDATE ON unidade FOR EACH ROW
BEGIN
SET NEW.NOME =  UPPER(NEW.NOME);
SET NEW.DTUPDATE = CURRENT_DATE();
SET NEW.HRUPDATE = CURRENT_TIME();

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER  depoisAlterarUnidade AFTER UPDATE ON unidade FOR EACH ROW
BEGIN
INSERT INTO bkpunidade (IDUNIDADE,NOME,PRODUTOS,DTINSERT,HRINSERT,DTUPDATE,HRUPDATE)
VALUES (NEW.IDUNIDADE,NEW.NOME,NEW.PRODUTOS,NEW.DTINSERT,NEW.HRINSERT,NEW.DTUPDATE,NEW.HRUPDATE);

INSERT INTO historico (ACAO,TABELA,ID) VALUES ("UPDATE","unidade",NEW.IDUNIDADE);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER  depoisExcluirUnidade AFTER DELETE ON unidade FOR EACH ROW
BEGIN
INSERT INTO bkpunidade (IDUNIDADE,NOME,PRODUTOS,DTINSERT,HRINSERT,DTUPDATE,HRUPDATE)
VALUES (OLD.IDUNIDADE,OLD.NOME,OLD.PRODUTOS,OLD.DTINSERT,OLD.HRINSERT,OLD.DTUPDATE,OLD.HRUPDATE);

INSERT INTO historico (ACAO,TABELA,ID) VALUES ("DELETE","unidade",OLD.IDUNIDADE);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary table structure for view `viewcidades`
--

DROP TABLE IF EXISTS `viewcidades`;
/*!50001 DROP VIEW IF EXISTS `viewcidades`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `viewcidades` AS SELECT
 1 AS `idCidade`,
  1 AS `nomeCidade`,
  1 AS `idEstado`,
  1 AS `siglaEstado`,
  1 AS `nomeEstado`,
  1 AS `clientesCidade` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `viewestados`
--

DROP TABLE IF EXISTS `viewestados`;
/*!50001 DROP VIEW IF EXISTS `viewestados`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `viewestados` AS SELECT
 1 AS `IDESTADO`,
  1 AS `SIGLA`,
  1 AS `NOME`,
  1 AS `CIDADE` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `viewmarcas`
--

DROP TABLE IF EXISTS `viewmarcas`;
/*!50001 DROP VIEW IF EXISTS `viewmarcas`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `viewmarcas` AS SELECT
 1 AS `IDMARCA`,
  1 AS `NOME`,
  1 AS `PRODUTOS` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `viewprodutos`
--

DROP TABLE IF EXISTS `viewprodutos`;
/*!50001 DROP VIEW IF EXISTS `viewprodutos`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `viewprodutos` AS SELECT
 1 AS `idProduto`,
  1 AS `nomeProduto`,
  1 AS `precoCompra`,
  1 AS `margemLucro`,
  1 AS `precoVenda`,
  1 AS `idMarca`,
  1 AS `nomeMarca`,
  1 AS `idUnidade`,
  1 AS `nomeUnidade` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `viewunidades`
--

DROP TABLE IF EXISTS `viewunidades`;
/*!50001 DROP VIEW IF EXISTS `viewunidades`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `viewunidades` AS SELECT
 1 AS `IDUNIDADE`,
  1 AS `NOME`,
  1 AS `PRODUTOS` */;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `viewcidades`
--

/*!50001 DROP VIEW IF EXISTS `viewcidades`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp850 */;
/*!50001 SET character_set_results     = cp850 */;
/*!50001 SET collation_connection      = cp850_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `viewcidades` AS select `cidade`.`IDCIDADE` AS `idCidade`,`cidade`.`NOME` AS `nomeCidade`,`cidade`.`IDESTADO` AS `idEstado`,`estado`.`SIGLA` AS `siglaEstado`,`estado`.`NOME` AS `nomeEstado`,`cidade`.`CLIENTES` AS `clientesCidade` from (`cidade` join `estado` on(`estado`.`IDESTADO` = `cidade`.`IDESTADO`)) order by `cidade`.`NOME` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `viewestados`
--

/*!50001 DROP VIEW IF EXISTS `viewestados`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp850 */;
/*!50001 SET character_set_results     = cp850 */;
/*!50001 SET collation_connection      = cp850_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `viewestados` AS select `estado`.`IDESTADO` AS `IDESTADO`,`estado`.`SIGLA` AS `SIGLA`,`estado`.`NOME` AS `NOME`,`estado`.`CIDADE` AS `CIDADE` from `estado` order by `estado`.`NOME` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `viewmarcas`
--

/*!50001 DROP VIEW IF EXISTS `viewmarcas`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp850 */;
/*!50001 SET character_set_results     = cp850 */;
/*!50001 SET collation_connection      = cp850_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `viewmarcas` AS select `marca`.`IDMARCA` AS `IDMARCA`,`marca`.`NOME` AS `NOME`,`marca`.`PRODUTOS` AS `PRODUTOS` from `marca` order by `marca`.`NOME` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `viewprodutos`
--

/*!50001 DROP VIEW IF EXISTS `viewprodutos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp850 */;
/*!50001 SET character_set_results     = cp850 */;
/*!50001 SET collation_connection      = cp850_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `viewprodutos` AS select `produto`.`IDPRODUTO` AS `idProduto`,`produto`.`NOME` AS `nomeProduto`,`produto`.`PRECOCOMPRA` AS `precoCompra`,`produto`.`MARGEMLUCRO` AS `margemLucro`,`produto`.`PRECOVENDA` AS `precoVenda`,`produto`.`IDMARCA` AS `idMarca`,`marca`.`NOME` AS `nomeMarca`,`produto`.`IDUNIDADE` AS `idUnidade`,`unidade`.`NOME` AS `nomeUnidade` from ((`produto` join `marca` on(`marca`.`IDMARCA` = `produto`.`IDMARCA`)) join `unidade` on(`unidade`.`IDUNIDADE` = `produto`.`IDUNIDADE`)) order by `produto`.`NOME`,`marca`.`NOME`,`unidade`.`NOME` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `viewunidades`
--

/*!50001 DROP VIEW IF EXISTS `viewunidades`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp850 */;
/*!50001 SET character_set_results     = cp850 */;
/*!50001 SET collation_connection      = cp850_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `viewunidades` AS select `unidade`.`IDUNIDADE` AS `IDUNIDADE`,`unidade`.`NOME` AS `NOME`,`unidade`.`PRODUTOS` AS `PRODUTOS` from `unidade` order by `unidade`.`NOME` */;
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

-- Dump completed on 2024-12-02 11:18:24
