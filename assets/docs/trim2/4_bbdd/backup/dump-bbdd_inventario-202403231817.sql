-- MySQL dump 10.13  Distrib 8.0.36, for Linux (x86_64)
--
-- Host: sistema-mgm-db-inventary-server.mysql.database.azure.com    Database: bbdd_inventario
-- ------------------------------------------------------
-- Server version	8.0.35

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
-- Table structure for table `categorias`
--

DROP TABLE IF EXISTS `categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorias` (
  `id_categoria` tinyint unsigned NOT NULL AUTO_INCREMENT COMMENT 'campo para identificar varios productos por categorias ( ej: papelería, cuidado personal, juguetería, etc)',
  `nombre_categoria` varchar(20) NOT NULL COMMENT 'campo para escribir nombre la categoria ( ej: lapizes, catulinas, blocks, etc...)',
  PRIMARY KEY (`id_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias`
--

LOCK TABLES `categorias` WRITE;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
INSERT INTO `categorias` VALUES (1,'decoraciones'),(2,'papeleria'),(3,'cosmeticos'),(4,'aseo'),(5,'desechables'),(6,'piñateria'),(7,'utensilios'),(8,'dulces'),(9,'bebidas'),(10,'cocina'),(11,'joyeria'),(12,'jugueteria'),(13,'accesorios'),(14,'ropa');
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entradas`
--

DROP TABLE IF EXISTS `entradas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entradas` (
  `id_entrada` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'campo para identificar ingreso de productos',
  `fecha_entrada` date NOT NULL COMMENT 'campo para ingresar fecha de entrada de productos',
  `cantidad_items_entrada` int NOT NULL COMMENT 'campo para ingresar cantidad de productos entrantes',
  `costo_total_entrada` int NOT NULL COMMENT 'campo para ingresar valor monetario del total de productos',
  `costo_unitario` double DEFAULT NULL COMMENT 'campo para ingresar valor monetario del producto por unidad',
  PRIMARY KEY (`id_entrada`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entradas`
--

LOCK TABLES `entradas` WRITE;
/*!40000 ALTER TABLE `entradas` DISABLE KEYS */;
INSERT INTO `entradas` VALUES (1,'2023-07-20',10,500000,500),(2,'2023-06-12',20,2000000,1000);
/*!40000 ALTER TABLE `entradas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facturas`
--

DROP TABLE IF EXISTS `facturas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `facturas` (
  `id_factura` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'identicacion de factura',
  `id_venta` int unsigned NOT NULL COMMENT 'identificacion de venta de producto',
  `nit_empresa_factura` varchar(50) NOT NULL COMMENT 'nit de la empresa',
  `cantidad_productos` int NOT NULL COMMENT 'cantidad de productos en la factura',
  `iva_producto` int NOT NULL DEFAULT '19' COMMENT 'porcentaje de iva en la factura',
  `direccion_empresa_factura` varchar(100) DEFAULT NULL COMMENT 'direccion de la empresa',
  `razon_social_factura` varchar(50) DEFAULT NULL COMMENT 'razon social de la empresa en la factura',
  `fecha_factura` datetime NOT NULL COMMENT 'fecha de la factura',
  `valor_total_factura` double NOT NULL COMMENT 'el valor total de la factura',
  PRIMARY KEY (`id_factura`),
  KEY `fk_facturas_ventas` (`id_venta`),
  CONSTRAINT `fk_facturas_ventas` FOREIGN KEY (`id_venta`) REFERENCES `ventas` (`id_venta`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facturas`
--

LOCK TABLES `facturas` WRITE;
/*!40000 ALTER TABLE `facturas` DISABLE KEYS */;
/*!40000 ALTER TABLE `facturas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gastos`
--

DROP TABLE IF EXISTS `gastos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gastos` (
  `id_gasto` tinyint unsigned NOT NULL AUTO_INCREMENT COMMENT 'identificación de gasto',
  `tipo_gasto` varchar(50) NOT NULL COMMENT 'tipología del gasto, p.ej.: luz, agua, teléfono, etc.',
  `valor_gasto` double NOT NULL COMMENT 'ingresar el valor total del gasto',
  PRIMARY KEY (`id_gasto`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gastos`
--

LOCK TABLES `gastos` WRITE;
/*!40000 ALTER TABLE `gastos` DISABLE KEYS */;
INSERT INTO `gastos` VALUES (1,'limpieza',20000),(2,'administrativo',100000),(3,'proveedor',300000),(4,'limpieza',20000),(5,'servicios publicos',300000);
/*!40000 ALTER TABLE `gastos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos` (
  `id_producto` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'identificacion de producto',
  `id_entrada` int unsigned DEFAULT NULL,
  `id_categoria` tinyint unsigned NOT NULL COMMENT 'identificacion de categroías de productos',
  `nombre_producto` varchar(50) NOT NULL COMMENT 'ingresar nombre de producto',
  `precio_producto` double NOT NULL COMMENT 'precio del producto en la empresa',
  `descripcion_producto` varchar(100) NOT NULL COMMENT 'detalles del producto',
  `marca` varchar(50) DEFAULT NULL COMMENT 'marca del producto',
  `referencia` varchar(50) DEFAULT NULL COMMENT 'referencia del producto',
  PRIMARY KEY (`id_producto`),
  KEY `fk_productos_entradas` (`id_entrada`),
  KEY `fk_productos_categorias` (`id_categoria`),
  CONSTRAINT `fk_productos_categorias` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id_categoria`),
  CONSTRAINT `fk_productos_entradas` FOREIGN KEY (`id_entrada`) REFERENCES `entradas` (`id_entrada`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=132 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (1,1,8,'frasco chocolates',10000,'frasco con chocolates',' ',' '),(2,1,8,'caja rectangular chocolates',5000,'caja rectangular chocolates',' ',' '),(3,1,8,'caja piramidal chocolates',3500,'caja piramidal chocolates',' ',' '),(4,1,8,'caja exagonal de chocolates',8000,'caja exagonal de chocolates',' ',' '),(5,1,8,'caja rectangular con boton grande',8000,'caja rectangular con boton grande',' ',' '),(6,1,8,'caja cono chocolate',5000,'caja cono chocolate',' ',' '),(7,1,9,'caja cerveza lata/afiche',10000,'caja cerveza lata/afiche',' ',' '),(8,1,8,'caja chocolate y cerveza',15000,'caja chocolate y cerveza',' ',' '),(9,1,1,'caja poster ideas',8000,'caja poster ideas',' ',' '),(10,1,8,'chocofortunas yonkiss',9000,'chocofortunas yonkiss',' ',' '),(11,1,8,'piropos mua',14000,'piropos mua',' ',' '),(12,1,8,'chocolates puppy',5500,'chocolates puppy',' ',' '),(13,1,12,'prisma',1000,'prisma',' ',' '),(14,1,9,'poster ideas botella cerveza',13000,'poster ideas botella cerveza',' ',' '),(15,1,7,'mugs/posillo chocolates',12000,'mugs/posillo chocolates',' ',' '),(16,1,7,'mugs/posillo peluche',20000,'mugs/posillo peluche',' ',' '),(17,1,8,'chocolatina en libro tom-01',5500,'chocolatina en libro tom-01',' ',' '),(18,1,7,'vaso cervezero',18000,'vaso cervezero',' ',' '),(19,1,7,'vaso coctelero',15000,'vaso coctelero',' ',' '),(20,1,7,'copas',15000,'copas',' ',' '),(21,1,7,'peluche oso mediano 20cm',12500,'peluche oso mediano 20cm',' ',' '),(22,1,7,'cojin rojo pequeño peluche',6000,'cojin rojo pequeño peluche',' ',' '),(23,1,7,'unicornio mediano peluche',28000,'unicornio mediano peluche',' ',' '),(24,1,7,'unicornio pequeño peluche',18000,'unicornio pequeño peluche',' ',' '),(25,1,7,'osos panda buso amarillo peluche',29500,'osos panda buso amarillo peluche',' ',' '),(26,1,7,'oso panda corazon peluche',32000,'oso panda corazon peluche',' ',' '),(27,1,7,'conejo azul peluche',29000,'conejo azul peluche',' ',' '),(28,1,7,'conejo reversible peluche',20000,'conejo reversible peluche',' ',' '),(29,1,7,'oso mediano 30cm corazon',25000,'oso mediano 30cm corazon',' ',' '),(30,1,1,'arreglo minny',30000,'arreglo minny',' ',' '),(31,1,7,'minny',26000,'minny',' ',' '),(32,1,7,'mickey',26000,'mickey',' ',' '),(33,1,8,'caja grande posillo y cerveza',30000,'caja grande posillo y cerveza',' ',' '),(34,1,2,'colores rores jumbo x12',15000,'',NULL,NULL),(35,1,2,'plumones pelikan x12',9500,'',NULL,NULL),(36,1,2,'caja lapiz papermatehb2',12000,'',NULL,NULL),(37,1,2,'tempera x125',2000,'',NULL,NULL),(38,1,2,'pegante si pega x 120g',2500,'',NULL,NULL),(39,1,2,'cinta transparente ancha',3500,'',NULL,NULL),(40,1,2,'plastina mitrensto x 100g',1700,'',NULL,NULL),(41,1,2,'cuaderno principiante cocido x 100h',2000,'',NULL,NULL),(42,1,2,'carpeta niños',2000,'',NULL,NULL),(43,1,2,'corrector liquido oenmax',1800,'',NULL,NULL),(44,1,4,'piedra pomes',600,'',NULL,NULL),(45,1,4,'cepillo uñas',2000,'',NULL,NULL),(46,1,4,'ablandador de callos x 250 cosdy',8500,'',NULL,NULL),(47,1,4,'crema depiladora lampiña',5000,'',NULL,NULL),(48,1,4,'aceite corporales',7000,'',NULL,NULL),(49,1,4,'espejo bolsillo',7500,'',NULL,NULL),(50,1,4,'removedor de esmalte 60 ml',3000,'',NULL,NULL),(51,1,4,'copitos redondo pequeño',1500,'',NULL,NULL),(52,1,4,'depilador flores',2000,'',NULL,NULL),(53,1,4,'gorro baño',1500,'',NULL,NULL),(54,1,4,'shampoo sachet piojos pioder',1000,'',NULL,NULL),(55,1,4,'shampoo color meicys',2500,'',NULL,NULL),(56,1,4,'desodorante speed stick sachet',1000,'',NULL,NULL),(57,1,4,'leche magnesia x 120 ml',5000,'',NULL,NULL),(58,1,4,'keratina duby class sachet',3000,'',NULL,NULL),(59,1,4,'vanish x 130ml',1700,'',NULL,NULL),(60,1,4,'fabuloso x 180ml',1600,'',NULL,NULL),(61,1,4,'jabon rey',3000,'',NULL,NULL),(62,1,4,'detergente liquido eterna',6000,'',NULL,NULL),(63,1,4,'papel higienico familia',2300,'',NULL,NULL),(64,1,7,'plato para torta',2000,'',NULL,NULL),(65,1,7,'plato ondo pequeño',3000,'',NULL,NULL),(66,1,7,'plato pando grande',4500,'',NULL,NULL),(67,1,7,'cuchara pequeña',3500,'',NULL,NULL),(68,1,7,'tenedor pequeño',3500,'',NULL,NULL),(69,1,7,'cuchillo pequeño x 100',3500,'',NULL,NULL),(70,1,7,'vasos 5. oz',4000,'',NULL,NULL),(71,1,7,'papel vinipel x 20 m',2000,'',NULL,NULL),(72,1,7,'papel vinipel x 209 m',12000,'',NULL,NULL),(73,1,5,'pañal winny etapa 2',0,'',NULL,NULL),(74,1,5,'pañal winny etapa 1',0,'',NULL,NULL),(75,1,5,'pañal winny etapa 0',0,'',NULL,NULL),(76,1,5,'pañal winny etapa 4',0,'',NULL,NULL),(77,1,5,'tetero grande',0,'',NULL,NULL),(78,1,5,'tetero pequeño',0,'',NULL,NULL),(79,1,5,'tetero gordo',0,'',NULL,NULL),(80,1,5,'traje de bebe',0,'',NULL,NULL),(81,1,5,'zapatos ',0,'',NULL,NULL),(82,1,5,'baberos',0,'',NULL,NULL),(83,2,6,'piñata icopor',0,'',NULL,NULL),(84,2,6,'relleno piñata',0,'',NULL,NULL),(85,2,6,'alcancias pequeñas',0,'',NULL,NULL),(86,2,6,'vaso diseño fiesta',0,'',NULL,NULL),(87,2,6,'plato diseños fiesta',0,'',NULL,NULL),(88,2,6,'bolsa sorpresa x 10u',0,'',NULL,NULL),(89,2,6,'mantel diseño fiesta',0,'',NULL,NULL),(90,2,6,'cerpentina',0,'',NULL,NULL),(91,2,6,'feston diseños fiesta',0,'',NULL,NULL),(92,2,6,'gorros diseños fiestas x 10',0,'',NULL,NULL),(93,2,10,'cuchillos',0,'',NULL,NULL),(94,2,10,'platis plasticos',0,'',NULL,NULL),(95,2,10,'platos metalicos',0,'',NULL,NULL),(96,2,10,'platos loza',0,'',NULL,NULL),(97,2,10,'cucharas',0,'',NULL,NULL),(98,2,10,'cucharones',0,'',NULL,NULL),(99,2,10,'mazo',0,'',NULL,NULL),(100,2,10,'coladores',0,'',NULL,NULL),(101,2,10,'jarras',0,'',NULL,NULL),(102,2,10,'bandejas',0,'',NULL,NULL),(103,2,11,'relojeria',0,'',NULL,NULL),(104,2,11,'aretes',0,'',NULL,NULL),(105,2,11,'candonga',0,'',NULL,NULL),(106,2,11,'collares',0,'',NULL,NULL),(107,2,11,'anillos',0,'',NULL,NULL),(108,2,11,'balacas',0,'',NULL,NULL),(109,2,11,'pinsas puillas',0,'',NULL,NULL),(110,2,12,'monopoly',0,'',NULL,NULL),(111,2,12,'barbie',0,'',NULL,NULL),(112,2,12,'avenger x4',0,'',NULL,NULL),(113,2,12,'kid princesa',0,'',NULL,NULL),(114,2,12,'kid pawpatrol',0,'',NULL,NULL),(115,2,12,'reloj luz',0,'',NULL,NULL),(116,2,12,'coche muñeca',0,'',NULL,NULL),(117,2,12,'kid arena',0,'',NULL,NULL),(118,2,12,'slime grande',0,'',NULL,NULL),(119,2,12,'slime pequeño x2',0,'',NULL,NULL),(120,2,12,'slime plastilinario',0,'',NULL,NULL),(121,2,13,'audifono balaca',0,'',NULL,NULL),(122,2,13,'reloj pared',0,'',NULL,NULL),(123,2,13,'microfono',0,'',NULL,NULL),(124,2,13,'parlante',0,'',NULL,NULL),(125,2,13,'radio',0,'',NULL,NULL),(126,2,13,'controles',0,'',NULL,NULL),(127,2,13,'antena tv',0,'',NULL,NULL),(128,2,13,'cargadores',0,'',NULL,NULL),(129,2,13,'cables usb',0,'',NULL,NULL),(130,2,13,'extenciones',0,'',NULL,NULL),(131,NULL,7,'cdscsca',334343,'sfgbfdgbdfb',NULL,NULL);
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedores`
--

DROP TABLE IF EXISTS `proveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedores` (
  `id_proveedor` smallint unsigned NOT NULL AUTO_INCREMENT COMMENT 'identificación de proveedor',
  `id_entrada` int unsigned NOT NULL COMMENT 'identificación de entrada de producto',
  `empresa` varchar(50) NOT NULL COMMENT 'nombre de la empresa',
  `direccion_proveedor` varchar(100) DEFAULT NULL COMMENT 'campo para direccion de la empresa',
  `nombre_proveedor` varchar(100) NOT NULL COMMENT 'campo para nombre de la persona',
  `telefono_proveedor` varchar(15) NOT NULL COMMENT 'campo para telefono de la empesa o personal',
  `email_proveedor` varchar(50) DEFAULT NULL COMMENT 'campo para correo electonico de la empresa',
  `descripcion_proveedor` varchar(150) DEFAULT NULL COMMENT 'campo para describir brevemente los productos que ofrece la empresa',
  PRIMARY KEY (`id_proveedor`),
  KEY `fk_proveedores_entradas` (`id_entrada`),
  CONSTRAINT `fk_proveedores_entradas` FOREIGN KEY (`id_entrada`) REFERENCES `entradas` (`id_entrada`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedores`
--

LOCK TABLES `proveedores` WRITE;
/*!40000 ALTER TABLE `proveedores` DISABLE KEYS */;
INSERT INTO `proveedores` VALUES (1,1,'italo','calle 57b sur # 24b - 17','luisa perez','6017454590','chocolatesitalo@gmail.com','chocolates'),(2,2,'prosalon','calle 19a # 84-14','carlos andrade','6015600100','prosalonventas@info.com','tinturas para el pelo');
/*!40000 ALTER TABLE `proveedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock`
--

DROP TABLE IF EXISTS `stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stock` (
  `id_stock` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'id para registro stock',
  `cantidad` int unsigned NOT NULL COMMENT 'cantidad de artículos en stock (calculado)',
  `id_entrada` int unsigned NOT NULL COMMENT 'id de entrada en stock',
  PRIMARY KEY (`id_stock`),
  KEY `fk_stock_entradas` (`id_entrada`),
  CONSTRAINT `fk_stock_entradas` FOREIGN KEY (`id_entrada`) REFERENCES `entradas` (`id_entrada`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock`
--

LOCK TABLES `stock` WRITE;
/*!40000 ALTER TABLE `stock` DISABLE KEYS */;
INSERT INTO `stock` VALUES (1,100,1),(2,200,2),(3,200,2);
/*!40000 ALTER TABLE `stock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ventas`
--

DROP TABLE IF EXISTS `ventas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ventas` (
  `id_venta` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'identificación de venta de producto',
  `id_stock` int unsigned NOT NULL COMMENT 'id de articulo en stock',
  `fecha_venta` datetime NOT NULL COMMENT 'fecha de venta de productos',
  `cantidad_items_venta_x_producto` int NOT NULL COMMENT 'cantidad de productos de la venta',
  `valot_total_venta` int NOT NULL COMMENT 'cantidad total de la venta',
  PRIMARY KEY (`id_venta`),
  KEY `fk_ventas_stock` (`id_stock`),
  CONSTRAINT `fk_ventas_stock` FOREIGN KEY (`id_stock`) REFERENCES `stock` (`id_stock`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ventas`
--

LOCK TABLES `ventas` WRITE;
/*!40000 ALTER TABLE `ventas` DISABLE KEYS */;
INSERT INTO `ventas` VALUES (1,1,'2023-07-23 00:00:00',7,15000),(2,1,'2023-07-24 00:00:00',15,400000),(3,1,'2023-12-15 00:00:00',5,100000),(4,2,'2024-03-17 01:05:00',6,2000),(5,3,'2024-03-17 12:30:00',15,150000);
/*!40000 ALTER TABLE `ventas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'bbdd_inventario'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-03-23 18:17:52
