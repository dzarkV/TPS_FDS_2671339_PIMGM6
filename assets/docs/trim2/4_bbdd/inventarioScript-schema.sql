-- ALGUNAS NOTAS DE TIPOS DE DATOS
-- tinyint -128 a 127					unsigned (sin signo negativo):  0 hasta 255
-- smallint -32.768 a 32.767			unsigned: 						0 hasta 65.535
-- mediumint -8.388.608 a 8.388.607 	unsigned: 						0 hasta 16.777.215
-- int -2.147.483.648 a 2.147.483.647 	unsigned:						0 hasta 4.294.967.295





DROP SCHEMA IF EXISTS BBDD_INVENTARIO;
-- -----------------------------------------------------
-- ESTRUCTURA BBDD_INVENTARIO
-- -----------------------------------------------------
CREATE SCHEMA  BBDD_INVENTARIO DEFAULT CHARACTER SET utf8 ;
USE BBDD_INVENTARIO;

-- -----------------------------------------------------
-- TABLA ROLES
-- -----------------------------------------------------
create table ROLES ( 
	idRol int auto_increment not null,
	nombre_rol VARCHAR(20) NOT NULL,
    PRIMARY KEY (idRol)
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- TABLA USUARIOS
-- -----------------------------------------------------
create table USUARIOS (
	idUsuario int auto_increment not null,
	idRol int not null,
    nombreUsuario varchar(20) not null,
    apellidoUsuario varchar(20) not null,
    fechaRegistro date,
	PRIMARY KEY (idUsuario),
    CONSTRAINT fk_usuarios_roles
	    FOREIGN KEY (idRol)
	    REFERENCES ROLES (idRol)
	    ON DELETE CASCADE
	    ON UPDATE CASCADE
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- TABLA CREDENCIALES
-- -----------------------------------------------------
create table CREDENCIALES (
	idCredenciales int auto_increment not null,
	idUsuario  int not null,
	fechaIngreso  date,
	contraseNa varchar (20) not null,
	estado boolean,
	PRIMARY KEY (idCredenciales),
	CONSTRAINT fk_credenciales_usuarios
	    FOREIGN KEY (idUsuario)
	    REFERENCES USUARIOS (idUsuario)
	    ON DELETE cascade
	    ON UPDATE CASCADE
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- TABLA ENTRADAS
-- -----------------------------------------------------
create table ENTRADAS (
	idEntrada int auto_increment not null,
	idUsuario int not null,
	fechaEntrada date not null,
	cantidadItemsEntrada int not null,
	costoTotalEntrada int not null,
	costoUnitario double,
	primary key (idEntrada),
	constraint fk_entradas_usuarios
	    foreign key  (idUsuario)
	    references USUARIOS (idUsuario)
	    on update cascade 		-- NO hay delete cascade cuando se borre un usuario, porque las entradas deben mantenerse
) engine = InnoDB;

-- -----------------------------------------------------
-- TABLA CATEGORIAS
-- -----------------------------------------------------
CREATE table CATEGORIAS (
	idCategoria int auto_increment not null,
	nombreCategoria varchar(20) not null,
	PRIMARY KEY (idCategoria)
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- TABLA PRODUCTOS
-- -----------------------------------------------------
create table PRODUCTOS (
	idProducto int auto_increment not null,
	idEntrada int not null,
	idCategoria int not null,
	nombreProducto varchar(20) not null,
	precioProducto double not null,
	descripcionProducto varchar(100) NOT NULL,
	primary key(idProducto),
	constraint fk_productos_entradas
	    foreign key  (idEntrada)
	    references ENTRADAS (idEntrada)
	    ON DELETE CASCADE
	    ON UPDATE CASCADE,
	constraint fk_productos_categorias
	    foreign key (idCategoria)
	    references CATEGORIAS (idCategoria)
) engine = InnoDB;

-- -----------------------------------------------------
-- TABLA PROVEEDORES
-- -----------------------------------------------------
create table PROVEEDORES (
	idProveedor int auto_increment not null,
    idEntrada int not null,
    empresa varchar(50) not null,
    direccionProveedor varchar(100),
    nombreProveedor varchar(100) not null,
    telefonoProveedor varchar(15) not null,
    emailProveedor varchar(50),
    descripcionProveedor varchar(150),
    primary key(idProveedor),
    constraint fk_proveedores_entradas
	    foreign key (idEntrada)
	    references ENTRADAS (idEntrada)
	    ON DELETE cascade
	    ON UPDATE CASCADE
) engine = InnoDB;	

-- -----------------------------------------------------
-- TABLA VENTAS
-- -----------------------------------------------------
create table VENTAS (
	idVenta int auto_increment not null,
	idProducto int not null,
	fechaVenta datetime not null,
	cantidadItemsVentaByProducto int not null,
	valotTotalVenta int not null,
	primary key (idVenta),
	constraint fk_ventas_productos
		foreign key (idProducto)
		references PRODUCTOS (idProducto)
		on update cascade
) engine = InnoDB;

-- -----------------------------------------------------
-- TABLA FACTURAS
-- -----------------------------------------------------
create table FACTURAS (
	idFactura int auto_increment not null,
	idVenta int not null,
	nitEmpresaFactura varchar(50) not null,
	cantidadProductos int not null,
	ivaProducto int default 19 not null,
	direccionEmpresaFactura varchar(100),
	razonSocialFactura varchar(50),
	fechaFactura datetime not null,
	valorTotalFactura double not null,
	primary key (idFactura),
	constraint fk_facturas_ventas
		foreign key (idVenta)
		references VENTAS (idVenta)
		on update cascade
) engine =InnoDB;

-- -----------------------------------------------------
-- TABLA GASTOS
-- -----------------------------------------------------
create table GASTOS (
	idGasto int auto_increment not null,
	idUsuario int not null,
	tipoGasto varchar(50) not null,
	valorGasto double not null,
	primary key (idGasto),
	constraint fk_gastos_usuario
		foreign key (idUsuario)
		references USUARIOS (idUsuario)
		on update cascade
) engine = InnoDB;


