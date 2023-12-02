-- ALGUNAS NOTAS DE TIPOS DE DATOS
-- tinyint -128 a 127			unsigned (sin signo negativo):  0 hasta 255
-- smallint -32.768 a 32.767		unsigned: 			0 hasta 65.535
-- mediumint -8.388.608 a 8.388.607 	unsigned: 			0 hasta 16.777.215
-- int -2.147.483.648 a 2.147.483.647 	unsigned:			0 hasta 4.294.967.295

-- -----------------------------------------------------


-- -----------------------------------------------------
-- ESTRUCTURA BBDD_INVENTARIO
-- -----------------------------------------------------
-- CREATE SCHEMA BBDD_INVENTARIO DEFAULT CHARACTER SET utf8 ;
-- USE BBDD_INVENTARIO;

-- -----------------------------------------------------
-- TABLA ROLES
-- -----------------------------------------------------
create table ROLES ( 
	id_rol tinyint unsigned auto_increment not null,
	nombre_rol VARCHAR(20) NOT NULL,
    PRIMARY KEY (id_rol)
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- TABLA USUARIOS
-- -----------------------------------------------------
create table USUARIOS (
	id_usuario smallint unsigned auto_increment not null,
	id_rol tinyint unsigned not null,
    nombre_usuario varchar(20) not null,
    apellido_usuario varchar(20) not null,
    fecha_registro date,
	PRIMARY KEY (id_usuario),
    CONSTRAINT fk_usuarios_roles
	    FOREIGN KEY (id_rol)
	    REFERENCES ROLES (id_rol)
	    ON DELETE CASCADE
	    ON UPDATE CASCADE
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- TABLA CREDENCIALES
-- -----------------------------------------------------
create table CREDENCIALES (
	id_credencial smallint unsigned auto_increment not null,
	id_usuario smallint unsigned not null,
	fecha_ingreso  date,
	contrasena varchar (20) not null,
	estado boolean,
	PRIMARY KEY (id_credencial),
	CONSTRAINT fk_credenciales_usuarios
	    FOREIGN KEY (id_usuario)
	    REFERENCES USUARIOS (id_usuario)
	    ON DELETE cascade
	    ON UPDATE CASCADE
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- TABLA ENTRADAS
-- -----------------------------------------------------
create table ENTRADAS (
	id_entrada int unsigned auto_increment not null,
	id_usuario smallint unsigned not null,
	fecha_entrada date not null,
	cantidad_items_entrada int not null,
	costo_total_entrada int not null,
	costo_unitario double,
	primary key (id_entrada),
	constraint fk_entradas_usuarios
	    foreign key  (id_usuario)
	    references USUARIOS (id_usuario)
	    on update cascade 		-- NO hay delete cascade cuando se borre un usuario, porque las entradas deben mantenerse
) engine = InnoDB;

-- -----------------------------------------------------
-- TABLA CATEGORIAS
-- -----------------------------------------------------
CREATE table CATEGORIAS (
	id_categoria tinyint unsigned auto_increment not null,
	nombre_categoria varchar(20) not null,
	PRIMARY KEY (id_categoria)
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- TABLA PRODUCTOS
-- -----------------------------------------------------
create table PRODUCTOS (
	id_producto int unsigned auto_increment not null,
	id_entrada int unsigned not null,
	id_categoria tinyint unsigned not null,
	nombre_producto varchar(20) not null,
	precio_producto double not null,
	descripcion_producto varchar(100) NOT NULL,
	primary key(id_producto),
	constraint fk_productos_entradas
	    foreign key  (id_entrada)
	    references ENTRADAS (id_entrada)
	    ON DELETE CASCADE
	    ON UPDATE CASCADE,
	constraint fk_productos_categorias
	    foreign key (id_categoria)
	    references CATEGORIAS (id_categoria)
) engine = InnoDB;

-- -----------------------------------------------------
-- TABLA PROVEEDORES
-- -----------------------------------------------------
create table PROVEEDORES (
	id_proveedor smallint unsigned auto_increment not null,
    id_entrada int unsigned not null,
    empresa varchar(50) not null,
    direccion_proveedor varchar(100),
    nombre_proveedor varchar(100) not null,
    telefono_proveedor varchar(15) not null,
    email_proveedor varchar(50),
    descripcion_proveedor varchar(150),
    primary key(id_proveedor),
    constraint fk_proveedores_entradas
	    foreign key (id_entrada)
	    references ENTRADAS (id_entrada)
	    ON DELETE cascade
	    ON UPDATE CASCADE
) engine = InnoDB;	

-- -----------------------------------------------------
-- TABLA VENTAS
-- -----------------------------------------------------
create table VENTAS (
	id_venta int unsigned auto_increment not null,
	id_producto int unsigned not null,
	fecha_venta datetime not null,
	cantidad_items_venta_x_producto int not null,
	valot_total_venta int not null,
	primary key (id_venta),
	constraint fk_ventas_productos
		foreign key (id_producto)
		references PRODUCTOS (id_producto)
		on update cascade
) engine = InnoDB;

-- -----------------------------------------------------
-- TABLA FACTURAS
-- -----------------------------------------------------
create table FACTURAS (
	id_factura int unsigned auto_increment not null,
	id_venta int unsigned not null,
	nit_empresa_factura varchar(50) not null,
	cantidad_productos int not null,
	iva_producto int default 19 not null,
	direccion_empresa_factura varchar(100),
	razon_social_factura varchar(50),
	fecha_factura datetime not null,
	valor_total_factura double not null,
	primary key (id_factura),
	constraint fk_facturas_ventas
		foreign key (id_venta)
		references VENTAS (id_venta)
		on update cascade
) engine =InnoDB;

-- -----------------------------------------------------
-- TABLA GASTOS
-- -----------------------------------------------------
create table GASTOS (
	id_gasto tinyint unsigned auto_increment not null,
	id_usuario smallint unsigned not null,
	tipo_gasto varchar(50) not null,
	valor_gasto double not null,
	primary key (id_gasto),
	constraint fk_gastos_usuario
		foreign key (id_usuario)
		references USUARIOS (id_usuario)
		on update cascade
) engine = InnoDB;


insert into CATEGORIAS (nombre_categoria) values
('decoraciones'),
('papeleria'),
('cosmeticos'),
('aseo'),
('desesables'),	
('piñateria'),
('cocina'),
('joyeria'),
('jugueteria'),
('accesorios'),
('ropa');


insert into PRODUCTOS (id_producto, id_categoria, nombre_producto, precio_producto, descripcion_producto) values
('100', '011', 'frasco chocolates', '10000', 'frasco con chocolates'),
('101', '011', 'caja rectangular chocolates', '5000', 'caja rectangular chocolates'),
('102', '011', 'caja piramidal chocolates', '3500', 'caja piramidal chocolates'),
('103', '011', 'caja exagonal de chocolates', '8000', 'caja exagonal de chocolates'),
('104', '011', 'caja rectangular con boton grande', '8000', 'caja rectangular con boton grande'),
('105', '011', 'caja cono chocolate', '5000', 'caja cono chocolate'),
('106', '011', 'caja cerveza lata/afiche', '10000', 'caja cerveza lata/afiche'),
('107', '011', 'caja chocolate y cerveza', '15000', 'caja chocolate y cerveza'),
('108', '011', 'caja poster ideas', '8000', 'caja poster ideas'),
('109', '011', 'chocofortunas yonkiss', '9000', 'chocofortunas yonkiss'),
('110', '011', 'piropos mua', '14000', 'piropos mua'),
('111', '011', 'chocolates puppy', '5500', 'chocolates puppy'),
('112', '011', 'prisma', '1000', 'prisma'),
('113', '011', 'poster ideas botella cerveza', '13000', 'poster ideas botella cerveza'),
('114', '011', 'mugs/posillo chocolates', '12000', 'mugs/posillo chocolates'),
('115', '011', 'mugs/posillo peluche', '20000', 'mugs/posillo peluche'),
('116', '011', 'chocolatina en libro tom-01', '5500', 'chocolatina en libro tom-01'),
('117', '011', 'vaso cervezero', '18000', 'vaso cervezero'),
('118', '011', 'vaso coctelero', '15000', 'vaso coctelero'),
('119', '011', 'copas', '15000', 'copas'),
('120', '011', 'peluche oso mediano 20cm', '12500', 'peluche oso mediano 20cm'),
('121', '011', 'cojin rojo pequeño peluche', '6000', 'cojin rojo pequeño peluche'),
('122', '011', 'unicornio mediano peluche', '28000', 'unicornio mediano peluche'),
('123', '011', 'unicornio pequeño peluche', '18000', 'unicornio pequeño peluche'),
('124', '011', 'osos panda buso amarillo peluche', '29500', 'osos panda buso amarillo peluche'),
('125', '011', 'oso panda corazon peluche', '32000', 'oso panda corazon peluche'),
('126', '011', 'conejo azul peluche', '29000', 'conejo azul peluche'),
('127', '011', 'conejo reversible peluche', '20000', 'conejo reversible peluche'),
('128', '011', 'oso mediano 30cm corazon', '25000', 'oso mediano 30cm corazon'),
('129', '011', 'arreglo minny', '30000', 'arreglo minny'),
('130', '011', 'minny', '26000', 'minny'),
('131', '011', 'mickey', '26000', 'mickey'),
('132', '011', 'caja grande posillo y cerveza', '30000', 'caja grande posillo y cerveza');


insert into PRODUCTOS (id_producto, id_categoria, nombre_producto, precio_producto, descripcion_producto) values
('201', '012', 'colores rores jumbo x12', '15000', ''),
('202', '012', 'plumones pelikan x12', '9500', ''),
('203', '012', 'caja lapiz papermatehb2', '12000', ''),
('204', '012', 'tempera x125', '2000', ''),
('205', '012', 'pegante si pega x 120g', '2500', ''),
('206', '012', 'cinta transparente ancha', '3500', ''),
('207', '012', 'plastina mitrensto x 100g', '1700', ''),
('208', '012', 'cuaderno principiante cocido x 100h', '2000', ''),
('209', '012', 'carpeta niños', '2000', ''),
('210', '012', 'corrector liquido oenmax', '1800', '');


insert into PRODUCTOS (id_producto, id_categoria, nombre_producto, precio_producto, descripcion_producto) values
('301', '013', 'piedra pomes', '600', ''),
('302', '013', 'cepillo uñas', '2000', ''),
('303', '013', 'ablandador de callos x 250 cosdy', '8500', ''),
('304', '013', 'crema depiladora lampiña', '5000', ''),
('305', '013', 'aceite corporales', '7000', ''),
('306', '013', 'espejo bolsillo', '7500', ''),
('307', '013', 'removedor de esmalte 60 ml', '3000', ''),
('308', '013', 'copitos redondo pequeño', '1500', ''),
('309', '013', 'depilador flores', '2000', ''),
('310', '013', 'gorro baño', '1500', '');


insert into PRODUCTOS (id_producto, id_categoria, nombre_producto, precio_producto, descripcion_producto) values
('401', '014', 'shampoo sachet piojos pioder', '1000', ''),
('402', '014', 'shampoo color meicys', '2500', ''),
('403', '014', 'desodorante speed stick sachet', '1000', ''),
('404', '014', 'leche magnesia x 120 ml', '5000', ''),
('405', '014', 'keratina duby class sachet', '3000', ''),
('406', '014', 'vanish x 130ml', '1700', ''),
('407', '014', 'fabuloso x 180ml', '1600', ''),
('408', '014', 'jabon rey', '3000', ''),
('409', '014', 'detergente liquido eterna', '6000', ''),
('410', '014', 'pael higienico familia', '2300', '');

-- sin precios
--------------------------------------------------------------------------------------------------------------
insert into PRODUCTOS (id_producto, id_categoria, nombre_producto, precio_producto, descripcion_producto) values
('501', '015', 'plato para torta', '', ''),
('502', '015', 'plato ondo pequeño', '', ''),
('503', '015', 'plato pando grande', '4500', ''),
('504', '015', 'cuchara pequeña', '', ''),
('505', '015', 'tenedor pequeño', '', ''),
('506', '015', 'cuchillo pequeño x 100', '', ''),
('507', '015', 'vasos 5. oz', '', ''),
('508', '015', 'papel vinipel x 20 m', '2000', ''),
('509', '015', 'papel vinipel x 209 m', '12000', '');


insert into PRODUCTOS (id_producto, id_categoria, nombre_producto, precio_producto, descripcion_producto) values
('601', '016', 'pañal winny etapa 2', '', ''),
('602', '016', 'pañal winny etapa 1', '', ''),
('603', '016', 'pañal winny etapa 0', '', ''),
('604', '016', 'pañal winny etapa 4', '', ''),
('605', '016', 'tetero grande', '', ''),
('606', '016', 'tetero pequeño', '', ''),
('607', '016', 'tetero gordo', '', ''),
('608', '016', 'traje de bebe', '', ''),
('609', '016', 'zapatos ', '', ''),
('610', '016', 'baberos', '', '');


insert into PRODUCTOS (id_producto, id_categoria, nombre_producto, precio_producto, descripcion_producto) values
('701', '017', 'piñata icopor', '', ''),
('702', '017', 'relleno piñata', '', ''),
('703', '017', 'alcancias pequeñas', '', ''),
('704', '017', 'vaso diseño fiesta', '', ''),
('705', '017', 'plato diseños fiesta', '', ''),
('706', '017', 'bolsa sorpresa x 10u', '', ''),
('707', '017', 'mantel diseño fiesta', '', ''),
('708', '017', 'cerpentina', '', ''),
('709', '017', 'feston diseños fiesta', '', ''),
('710', '017', 'gorros diseños fiestas x 10', '', '');


insert into PRODUCTOS (id_producto, id_categoria, nombre_producto, precio_producto, descripcion_producto) values
('801', '018', 'cuchillos', '', ''),
('802', '018', 'platis plasticos', '', ''),
('803', '018', 'platos metalicos', '', ''),
('804', '018', 'platos loza', '', ''),
('805', '018', 'cucharas', '', ''),
('806', '018', 'cucharones', '', ''),
('807', '018', 'mazo', '', ''),
('808', '018', 'coladores', '', ''),
('809', '018', 'jarras', '', ''),
('810', '018', 'bandejas', '', '');


insert into PRODUCTOS (id_producto, id_categoria, nombre_producto, precio_producto, descripcion_producto) values
('901', '019', 'relojeria', '', ''),
('902', '019', 'aretes', '', ''),
('903', '019', 'candonga', '', ''),
('904', '019', 'collares', '', ''),
('905', '019', 'anillos', '', ''),
('906', '019', 'balacas', '', ''),
('907', '019', 'pinsas puillas', '', '');


insert into PRODUCTOS (id_producto, id_categoria, nombre_producto, precio_producto, descripcion_producto) values
('1001', '020', 'monopoly', '', ''),
('1002', '021', 'barbie', '', ''),
('1002', '020', 'avenger x4', '', ''),
('1003', '020', 'kid princesa', '', ''),
('1004', '020', 'kid pawpatrol', '', ''),
('1005', '020', 'reloj luz', '', ''),
('1006', '020', 'coche muñeca', '', ''),
('1007', '020', 'kid arena', '', ''),
('1008', '020', 'slime grande', '', ''),
('1009', '020', 'slime pequeño x2', '', ''),
('1010', '020', 'slime plastilinario', '', '');


insert into PRODUCTOS (id_producto, id_categoria, nombre_producto, precio_producto, descripcion_producto) values
('1101', '021', 'audifono balaca', '', ''),
('1102', '021', 'reloj pared', '', ''),
('1103', '021', 'microfono', '', ''),
('1104', '021', 'parlante', '', ''),
('1105', '021', 'radio', '', ''),
('1106', '021', 'controles', '', ''),
('1107', '021', 'antena tv', '', ''),
('1108', '021', 'cargadores', '', ''),
('1109', '021', 'cables usb', '', ''),
('1010', '021', 'extenciones', '', '');
