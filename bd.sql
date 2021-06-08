-- MySQL dump 10.13  Distrib 5.7.22, for Win64 (x86_64)
--
-- Host: localhost    Database: pfinal
-- ------------------------------------------------------
-- Server version	5.7.22-log

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
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente` (
  `ID_Cliente` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) NOT NULL,
  `Apellido` varchar(100) NOT NULL,
  `Correo_Electronico` varchar(100) NOT NULL,
  `Telefono` int(13) NOT NULL,
  `Domicilio` varchar(100) NOT NULL,
  `ID_Usuario` int(11) NOT NULL,
  PRIMARY KEY (`ID_Cliente`),
  KEY `FK_ID_USUARIO_V2` (`ID_Usuario`),
  CONSTRAINT `FK_ID_USUARIO_V2` FOREIGN KEY (`ID_Usuario`) REFERENCES `usuario` (`ID_Usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'Christian Dael ','Silis Silvestre','christian@gmail.com',774501565,'Av. Patria 1521',2),(2,'Diego Arath','Franco Herrera','diego@gmail.com',1123456789,'Calle. Valle Azul 4514',4),(3,'David Ishar','Pardo Almaguer','ishar@gmail.com',2144521462,'Calle. Jerico 7514',6);
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleado`
--

DROP TABLE IF EXISTS `empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `empleado` (
  `ID_Empleado` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) NOT NULL,
  `Apellido` varchar(100) NOT NULL,
  `Correo_Electronico` varchar(100) NOT NULL,
  `Telefono` int(13) NOT NULL,
  `ID_Usuario` int(11) NOT NULL,
  `ID_Sucursal` int(11) NOT NULL,
  PRIMARY KEY (`ID_Empleado`),
  KEY `FK_ID_USUARIO` (`ID_Usuario`),
  KEY `FK_ID_SUCURSAL_V2` (`ID_Sucursal`),
  CONSTRAINT `FK_ID_SUCURSAL_V2` FOREIGN KEY (`ID_Sucursal`) REFERENCES `sucursal` (`ID_Sucursal`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_ID_USUARIO` FOREIGN KEY (`ID_Usuario`) REFERENCES `usuario` (`ID_Usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleado`
--

LOCK TABLES `empleado` WRITE;
/*!40000 ALTER TABLE `empleado` DISABLE KEYS */;
INSERT INTO `empleado` VALUES (1,'David ','Linares Pardo','a18300231@ceti.mx',331245151,1,1),(2,'Fabricio Daniel','Lara Valencia','fabricio@gmail.com',331578158,3,1),(3,'Leiden ','Flores Garcia','leiden@gmail.com',334516854,5,2);
/*!40000 ALTER TABLE `empleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `empleado_sucursal`
--

DROP TABLE IF EXISTS `empleado_sucursal`;
/*!50001 DROP VIEW IF EXISTS `empleado_sucursal`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `empleado_sucursal` AS SELECT 
 1 AS `ID_Empleado`,
 1 AS `Nombre_Empleado`,
 1 AS `Apellido_Empleado`,
 1 AS `ID_Sucursal`,
 1 AS `Cuidad_Sucursal`,
 1 AS `Sucursal_Domicilio`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `ordena`
--

DROP TABLE IF EXISTS `ordena`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ordena` (
  `ID_Orden` int(11) NOT NULL AUTO_INCREMENT,
  `ID_Cliente` int(11) NOT NULL,
  `ID_Producto` int(11) NOT NULL,
  `Precio_Total` float NOT NULL,
  `Fecha` date NOT NULL,
  `Tipo_Pago` varchar(100) NOT NULL,
  PRIMARY KEY (`ID_Orden`),
  KEY `FK_ID_CLIENTE` (`ID_Cliente`),
  KEY `FK_ID_PRODUCTO_V2` (`ID_Producto`),
  CONSTRAINT `FK_ID_CLIENTE` FOREIGN KEY (`ID_Cliente`) REFERENCES `cliente` (`ID_Cliente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_ID_PRODUCTO_V2` FOREIGN KEY (`ID_Producto`) REFERENCES `producto` (`ID_Producto`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordena`
--

LOCK TABLES `ordena` WRITE;
/*!40000 ALTER TABLE `ordena` DISABLE KEYS */;
INSERT INTO `ordena` VALUES (4,1,6,600,'2021-07-04','Efectivo'),(5,3,8,400,'2021-06-06','Tarjeta'),(10,3,2,8000,'2021-06-06','Efectivo'),(13,1,2,8000,'2020-10-10','Efectivo'),(14,2,8,900,'2021-06-07','Tarjeta');
/*!40000 ALTER TABLE `ordena` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `Historial_Compra` AFTER INSERT ON `ordena` FOR EACH ROW BEGIN
INSERT INTO registro_de_compras VALUES (new.ID_Cliente, CURDATE());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary table structure for view `pedidos_clientes`
--

DROP TABLE IF EXISTS `pedidos_clientes`;
/*!50001 DROP VIEW IF EXISTS `pedidos_clientes`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `pedidos_clientes` AS SELECT 
 1 AS `ID_Orden`,
 1 AS `Apellido`,
 1 AS `Nombre`,
 1 AS `Nombre_Producto`,
 1 AS `Precio_Total`,
 1 AS `Fecha`,
 1 AS `Tipo_Pago`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `producto` (
  `ID_Producto` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre_Producto` varchar(100) NOT NULL,
  `Precio` float NOT NULL,
  `ID_Proveedor` int(11) NOT NULL,
  PRIMARY KEY (`ID_Producto`),
  KEY `FK_ID_PROVEEDOR` (`ID_Proveedor`),
  CONSTRAINT `FK_ID_PROVEEDOR` FOREIGN KEY (`ID_Proveedor`) REFERENCES `proveedor` (`ID_Proveedor`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES (1,'iPhone',20000,1),(2,'Apple Watch',8000,1),(3,'Jordan 1',5000,2),(4,'Jersey PSG',1300,2),(5,'PC HP 24-DD0012LA',14999,3),(6,'Impresora HP GX-500 ',4500,3),(7,'Doritos',10,4),(8,'Cheetos',9,4);
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `producto_proveedor`
--

DROP TABLE IF EXISTS `producto_proveedor`;
/*!50001 DROP VIEW IF EXISTS `producto_proveedor`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `producto_proveedor` AS SELECT 
 1 AS `Nombre_Producto`,
 1 AS `ID_Producto`,
 1 AS `Nombre_Proveedor`,
 1 AS `Correo_Proveedor`,
 1 AS `Telefono_Proveedor`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `proveedor`
--

DROP TABLE IF EXISTS `proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proveedor` (
  `ID_Proveedor` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre_Proveedor` varchar(100) NOT NULL,
  `Correo_Proveedor` varchar(100) NOT NULL,
  `Telefono_Proveedor` int(13) NOT NULL,
  PRIMARY KEY (`ID_Proveedor`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedor`
--

LOCK TABLES `proveedor` WRITE;
/*!40000 ALTER TABLE `proveedor` DISABLE KEYS */;
INSERT INTO `proveedor` VALUES (1,'Apple','apple@gmail.com',25566559),(2,'Nike','nike@gmail.com',789456123),(3,'Hewlett-Packard','hp@gmail.com',1234567895),(4,'Sabritas','sabritas@gmail.com',518544512);
/*!40000 ALTER TABLE `proveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registro_de_compras`
--

DROP TABLE IF EXISTS `registro_de_compras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `registro_de_compras` (
  `Cliente` int(11) NOT NULL,
  `Fecha` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registro_de_compras`
--

LOCK TABLES `registro_de_compras` WRITE;
/*!40000 ALTER TABLE `registro_de_compras` DISABLE KEYS */;
INSERT INTO `registro_de_compras` VALUES (1,20210607),(3,20210607),(1,20210607),(2,20210607);
/*!40000 ALTER TABLE `registro_de_compras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sucursal`
--

DROP TABLE IF EXISTS `sucursal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sucursal` (
  `ID_Sucursal` int(11) NOT NULL AUTO_INCREMENT,
  `Domicilio` varchar(100) NOT NULL,
  `Ciudad` varchar(100) NOT NULL,
  PRIMARY KEY (`ID_Sucursal`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sucursal`
--

LOCK TABLES `sucursal` WRITE;
/*!40000 ALTER TABLE `sucursal` DISABLE KEYS */;
INSERT INTO `sucursal` VALUES (1,'Lopez Mateos 1515','Zapopan'),(2,'Vallarta 1278','Guadalajara');
/*!40000 ALTER TABLE `sucursal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `ID_Usuario` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) NOT NULL,
  `Contrasena` varchar(100) NOT NULL,
  `Tipo` varchar(100) NOT NULL,
  PRIMARY KEY (`ID_Usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'David Linares','david123','Empleado'),(2,'Chistian Silis','christian123','Cliente'),(3,'Fabricio Lara','fabricio123','Empleado'),(4,'Diego Franco','diego123','Cliente'),(5,'Leiden Flores','leiden123','Empleado'),(6,'Ishar Pardo','ishar123','Cliente');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vende`
--

DROP TABLE IF EXISTS `vende`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vende` (
  `ID_Producto` int(11) NOT NULL,
  `ID_Sucursal` int(11) NOT NULL,
  `Disponibilidad` int(11) NOT NULL,
  KEY `FK_ID_PRODUCTO` (`ID_Producto`),
  KEY `FK_ID_SUCURSAL` (`ID_Sucursal`),
  CONSTRAINT `FK_ID_PRODUCTO` FOREIGN KEY (`ID_Producto`) REFERENCES `producto` (`ID_Producto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_ID_SUCURSAL` FOREIGN KEY (`ID_Sucursal`) REFERENCES `sucursal` (`ID_Sucursal`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vende`
--

LOCK TABLES `vende` WRITE;
/*!40000 ALTER TABLE `vende` DISABLE KEYS */;
INSERT INTO `vende` VALUES (1,1,10),(2,1,19),(3,1,24),(4,1,17),(5,1,78),(6,1,14),(7,1,45),(8,1,89),(1,2,22),(2,2,65),(3,2,12),(4,2,24),(5,2,13),(6,2,15),(7,2,54),(8,2,27);
/*!40000 ALTER TABLE `vende` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `empleado_sucursal`
--

/*!50001 DROP VIEW IF EXISTS `empleado_sucursal`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `empleado_sucursal` AS select `empleado`.`ID_Empleado` AS `ID_Empleado`,`empleado`.`Nombre` AS `Nombre_Empleado`,`empleado`.`Apellido` AS `Apellido_Empleado`,`sucursal`.`ID_Sucursal` AS `ID_Sucursal`,`sucursal`.`Ciudad` AS `Cuidad_Sucursal`,`sucursal`.`Domicilio` AS `Sucursal_Domicilio` from (`empleado` join `sucursal` on((`sucursal`.`ID_Sucursal` = `empleado`.`ID_Sucursal`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `pedidos_clientes`
--

/*!50001 DROP VIEW IF EXISTS `pedidos_clientes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `pedidos_clientes` AS select `ordena`.`ID_Orden` AS `ID_Orden`,`cliente`.`Apellido` AS `Apellido`,`cliente`.`Nombre` AS `Nombre`,`producto`.`Nombre_Producto` AS `Nombre_Producto`,`ordena`.`Precio_Total` AS `Precio_Total`,`ordena`.`Fecha` AS `Fecha`,`ordena`.`Tipo_Pago` AS `Tipo_Pago` from ((`ordena` join `cliente` on((`cliente`.`ID_Cliente` = `ordena`.`ID_Cliente`))) join `producto` on((`producto`.`ID_Producto` = `ordena`.`ID_Producto`))) order by `ordena`.`ID_Producto` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `producto_proveedor`
--

/*!50001 DROP VIEW IF EXISTS `producto_proveedor`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `producto_proveedor` AS select `producto`.`Nombre_Producto` AS `Nombre_Producto`,`producto`.`ID_Producto` AS `ID_Producto`,`proveedor`.`Nombre_Proveedor` AS `Nombre_Proveedor`,`proveedor`.`Correo_Proveedor` AS `Correo_Proveedor`,`proveedor`.`Telefono_Proveedor` AS `Telefono_Proveedor` from (`producto` join `proveedor` on((`proveedor`.`ID_Proveedor` = `producto`.`ID_Proveedor`))) */;
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

-- Dump completed on 2021-06-07 22:39:06
