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
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos` (
  `id_producto` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'identificacion de producto',
  `id_categoria` tinyint unsigned NOT NULL COMMENT 'identificacion de categroías de productos',
  `nombre_producto` varchar(50) NOT NULL COMMENT 'ingresar nombre de producto',
  `precio_producto` double NOT NULL COMMENT 'precio del producto en la empresa',
  `descripcion_producto` varchar(100) NOT NULL COMMENT 'detalles del producto',
  `marca` varchar(50) DEFAULT NULL COMMENT 'marca del producto',
  `referencia` varchar(50) DEFAULT NULL COMMENT 'referencia del producto',
  PRIMARY KEY (`id_producto`),
  KEY `fk_productos_categorias` (`id_categoria`),
  CONSTRAINT `fk_productos_categorias` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=131 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (1,8,'frasco chocolates',10000,'frasco con chocolates',' ',' '),(2,8,'caja rectangular chocolates',5000,'caja rectangular chocolates',' ',' '),(3,8,'caja piramidal chocolates',3500,'caja piramidal chocolates',' ',' '),(4,8,'caja exagonal de chocolates',8000,'caja exagonal de chocolates',' ',' '),(5,8,'caja rectangular con boton grande',8000,'caja rectangular con boton grande',' ',' '),(6,8,'caja cono chocolate',5000,'caja cono chocolate',' ',' '),(7,9,'caja cerveza lata/afiche',10000,'caja cerveza lata/afiche',' ',' '),(8,8,'caja chocolate y cerveza',15000,'caja chocolate y cerveza',' ',' '),(9,1,'caja poster ideas',8000,'caja poster ideas',' ',' '),(10,8,'chocofortunas yonkiss',9000,'chocofortunas yonkiss',' ',' '),(11,8,'piropos mua',14000,'piropos mua',' ',' '),(12,8,'chocolates puppy',5500,'chocolates puppy',' ',' '),(13,12,'prisma',1000,'prisma',' ',' '),(14,9,'poster ideas botella cerveza',13000,'poster ideas botella cerveza',' ',' '),(15,7,'mugs/posillo chocolates',12000,'mugs/posillo chocolates',' ',' '),(16,7,'mugs/posillo peluche',20000,'mugs/posillo peluche',' ',' '),(17,8,'chocolatina en libro tom-01',5500,'chocolatina en libro tom-01',' ',' '),(18,7,'vaso cervezero',18000,'vaso cervezero',' ',' '),(19,7,'vaso coctelero',15000,'vaso coctelero',' ',' '),(20,7,'copas',15000,'copas',' ',' '),(21,7,'peluche oso mediano 20cm',12500,'peluche oso mediano 20cm',' ',' '),(22,7,'cojin rojo pequeño peluche',6000,'cojin rojo pequeño peluche',' ',' '),(23,7,'unicornio mediano peluche',28000,'unicornio mediano peluche',' ',' '),(24,7,'unicornio pequeño peluche',18000,'unicornio pequeño peluche',' ',' '),(25,7,'osos panda buso amarillo peluche',29500,'osos panda buso amarillo peluche',' ',' '),(26,7,'oso panda corazon peluche',32000,'oso panda corazon peluche',' ',' '),(27,7,'conejo azul peluche',29000,'conejo azul peluche',' ',' '),(28,7,'conejo reversible peluche',20000,'conejo reversible peluche',' ',' '),(29,7,'oso mediano 30cm corazon',25000,'oso mediano 30cm corazon',' ',' '),(30,1,'arreglo minny',30000,'arreglo minny',' ',' '),(31,7,'minny',26000,'minny',' ',' '),(32,7,'mickey',26000,'mickey',' ',' '),(33,8,'caja grande posillo y cerveza',30000,'caja grande posillo y cerveza',' ',' '),(34,2,'colores rores jumbo x12',15000,'',NULL,NULL),(35,2,'plumones pelikan x12',9500,'',NULL,NULL),(36,2,'caja lapiz papermatehb2',12000,'',NULL,NULL),(37,2,'tempera x125',2000,'',NULL,NULL),(38,2,'pegante si pega x 120g',2500,'',NULL,NULL),(39,2,'cinta transparente ancha',3500,'',NULL,NULL),(40,2,'plastina mitrensto x 100g',1700,'',NULL,NULL),(41,2,'cuaderno principiante cocido x 100h',2000,'',NULL,NULL),(42,2,'carpeta niños',2000,'',NULL,NULL),(43,2,'corrector liquido oenmax',1800,'',NULL,NULL),(44,4,'piedra pomes',600,'',NULL,NULL),(45,4,'cepillo uñas',2000,'',NULL,NULL),(46,4,'ablandador de callos x 250 cosdy',8500,'',NULL,NULL),(47,4,'crema depiladora lampiña',5000,'',NULL,NULL),(48,4,'aceite corporales',7000,'',NULL,NULL),(49,4,'espejo bolsillo',7500,'',NULL,NULL),(50,4,'removedor de esmalte 60 ml',3000,'',NULL,NULL),(51,4,'copitos redondo pequeño',1500,'',NULL,NULL),(52,4,'depilador flores',2000,'',NULL,NULL),(53,4,'gorro baño',1500,'',NULL,NULL),(54,4,'shampoo sachet piojos pioder',1000,'',NULL,NULL),(55,4,'shampoo color meicys',2500,'',NULL,NULL),(56,4,'desodorante speed stick sachet',1000,'',NULL,NULL),(57,4,'leche magnesia x 120 ml',5000,'',NULL,NULL),(58,4,'keratina duby class sachet',3000,'',NULL,NULL),(59,4,'vanish x 130ml',1700,'',NULL,NULL),(60,4,'fabuloso x 180ml',1600,'',NULL,NULL),(61,4,'jabon rey',3000,'',NULL,NULL),(62,4,'detergente liquido eterna',6000,'',NULL,NULL),(63,4,'papel higienico familia',2300,'',NULL,NULL),(64,7,'plato para torta',2000,'',NULL,NULL),(65,7,'plato ondo pequeño',3000,'',NULL,NULL),(66,7,'plato pando grande',4500,'',NULL,NULL),(67,7,'cuchara pequeña',3500,'',NULL,NULL),(68,7,'tenedor pequeño',3500,'',NULL,NULL),(69,7,'cuchillo pequeño x 100',3500,'',NULL,NULL),(70,7,'vasos 5. oz',4000,'',NULL,NULL),(71,7,'papel vinipel x 20 m',2000,'',NULL,NULL),(72,7,'papel vinipel x 209 m',12000,'',NULL,NULL),(73,5,'pañal winny etapa 2',0,'',NULL,NULL),(74,5,'pañal winny etapa 1',0,'',NULL,NULL),(75,5,'pañal winny etapa 0',0,'',NULL,NULL),(76,5,'pañal winny etapa 4',0,'',NULL,NULL),(77,5,'tetero grande',0,'',NULL,NULL),(78,5,'tetero pequeño',0,'',NULL,NULL),(79,5,'tetero gordo',0,'',NULL,NULL),(80,5,'traje de bebe',0,'',NULL,NULL),(81,5,'zapatos ',0,'',NULL,NULL),(82,5,'baberos',0,'',NULL,NULL),(83,6,'piñata icopor',0,'',NULL,NULL),(84,6,'relleno piñata',0,'',NULL,NULL),(85,6,'alcancias pequeñas',0,'',NULL,NULL),(86,6,'vaso diseño fiesta',0,'',NULL,NULL),(87,6,'plato diseños fiesta',0,'',NULL,NULL),(88,6,'bolsa sorpresa x 10u',0,'',NULL,NULL),(89,6,'mantel diseño fiesta',0,'',NULL,NULL),(90,6,'cerpentina',0,'',NULL,NULL),(91,6,'feston diseños fiesta',0,'',NULL,NULL),(92,6,'gorros diseños fiestas x 10',0,'',NULL,NULL),(93,10,'cuchillos',0,'',NULL,NULL),(94,10,'platis plasticos',0,'',NULL,NULL),(95,10,'platos metalicos',0,'',NULL,NULL),(96,10,'platos loza',0,'',NULL,NULL),(97,10,'cucharas',0,'',NULL,NULL),(98,10,'cucharones',0,'',NULL,NULL),(99,10,'mazo',0,'',NULL,NULL),(100,10,'coladores',0,'',NULL,NULL),(101,10,'jarras',0,'',NULL,NULL),(102,10,'bandejas',0,'',NULL,NULL),(103,11,'relojeria',0,'',NULL,NULL),(104,11,'aretes',0,'',NULL,NULL),(105,11,'candonga',0,'',NULL,NULL),(106,11,'collares',0,'',NULL,NULL),(107,11,'anillos',0,'',NULL,NULL),(108,11,'balacas',0,'',NULL,NULL),(109,11,'pinsas puillas',0,'',NULL,NULL),(110,12,'monopoly',0,'',NULL,NULL),(111,12,'barbie',0,'',NULL,NULL),(112,12,'avenger x4',0,'',NULL,NULL),(113,12,'kid princesa',0,'',NULL,NULL),(114,12,'kid pawpatrol',0,'',NULL,NULL),(115,12,'reloj luz',0,'',NULL,NULL),(116,12,'coche muñeca',0,'',NULL,NULL),(117,12,'kid arena',0,'',NULL,NULL),(118,12,'slime grande',0,'',NULL,NULL),(119,12,'slime pequeño x2',0,'',NULL,NULL),(120,12,'slime plastilinario',0,'',NULL,NULL),(121,13,'audifono balaca',0,'',NULL,NULL),(122,13,'reloj pared',0,'',NULL,NULL),(123,13,'microfono',0,'',NULL,NULL),(124,13,'parlante',0,'',NULL,NULL),(125,13,'radio',0,'',NULL,NULL),(126,13,'controles',0,'',NULL,NULL),(127,13,'antena tv',0,'',NULL,NULL),(128,13,'cargadores',0,'',NULL,NULL),(129,13,'cables usb',0,'',NULL,NULL),(130,13,'extenciones',0,'',NULL,NULL);
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
  `empresa` varchar(50) NOT NULL COMMENT 'nombre de la empresa',
  `direccion_proveedor` varchar(100) DEFAULT NULL COMMENT 'campo para direccion de la empresa',
  `nombre_proveedor` varchar(100) NOT NULL COMMENT 'campo para nombre de la persona',
  `telefono_proveedor` varchar(15) NOT NULL COMMENT 'campo para telefono de la empesa o personal',
  `email_proveedor` varchar(50) DEFAULT NULL COMMENT 'campo para correo electonico de la empresa',
  `descripcion_proveedor` varchar(150) DEFAULT NULL COMMENT 'campo para describir brevemente los productos que ofrece la empresa',
  PRIMARY KEY (`id_proveedor`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedores`
--

LOCK TABLES `proveedores` WRITE;
/*!40000 ALTER TABLE `proveedores` DISABLE KEYS */;
INSERT INTO `proveedores` VALUES (1,'italo','calle 57b sur # 24b - 17','luisa perez','6017454590','chocolatesitalo@gmail.com','chocolates'),(2,'prosalon','calle 19a # 84-14','carlos andrade','6015600100','prosalonventas@info.com','tinturas para el pelo');
/*!40000 ALTER TABLE `proveedores` ENABLE KEYS */;
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
  `costo_unitario` double DEFAULT NULL COMMENT 'campo para ingresar valor monetario del producto por unidad',
  `id_proveedor` smallint unsigned NOT NULL COMMENT 'id de proveedor para la entrada',
  `id_producto` int unsigned NOT NULL COMMENT 'id de producto para la entrada',
  PRIMARY KEY (`id_entrada`),
  KEY `fk_entradas_proveedores` (`id_proveedor`),
  KEY `fk_entradas_productos` (`id_producto`),
  CONSTRAINT `fk_entradas_productos` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_entradas_proveedores` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedores` (`id_proveedor`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entradas`
--

LOCK TABLES `entradas` WRITE;
/*!40000 ALTER TABLE `entradas` DISABLE KEYS */;
INSERT INTO `entradas` VALUES (1,'2023-07-20',10,500,1,11),(2,'2023-06-12',20,1000,2,109);
/*!40000 ALTER TABLE `entradas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entradas_productos_proveedores`
--

DROP TABLE IF EXISTS `entradas_productos_proveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entradas_productos_proveedores` (
  `id_entrada` int unsigned NOT NULL,
  `id_producto` int unsigned NOT NULL,
  `id_proveedor` smallint unsigned NOT NULL,
  PRIMARY KEY (`id_entrada`,`id_producto`,`id_proveedor`),
  KEY `id_producto` (`id_producto`),
  KEY `id_proveedor` (`id_proveedor`),
  CONSTRAINT `entradas_productos_proveedores_ibfk_1` FOREIGN KEY (`id_entrada`) REFERENCES `entradas` (`id_entrada`),
  CONSTRAINT `entradas_productos_proveedores_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`),
  CONSTRAINT `entradas_productos_proveedores_ibfk_3` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedores` (`id_proveedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entradas_productos_proveedores`
--

LOCK TABLES `entradas_productos_proveedores` WRITE;
/*!40000 ALTER TABLE `entradas_productos_proveedores` DISABLE KEYS */;
/*!40000 ALTER TABLE `entradas_productos_proveedores` ENABLE KEYS */;
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
  `valor_total_venta` int NOT NULL COMMENT 'cantidad total de la venta',
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


