-- -----------------------------------------------------


-- -----------------------------------------------------
-- ESTRUCTURA BBDD_INVENTARIO
-- -----------------------------------------------------
-- DROP SCHEMA IF EXISTS BBDD_INVENTARIO;
-- CREATE SCHEMA BBDD_INVENTARIO DEFAULT CHARACTER SET utf8 ;
-- USE BBDD_INVENTARIO;
--
-- -----------------------------------------------------
-- TABLA CATEGORIAS
-- -----------------------------------------------------
CREATE table CATEGORIAS (
	id_categoria tinyint unsigned auto_increment not null comment 'campo para identificar varios productos por categorias ( ej: papelería, cuidado personal, juguetería, etc)',
	nombre_categoria varchar(20) not null comment 'campo para escribir nombre la categoria ( ej: lapizes, catulinas, blocks, etc...)',
	PRIMARY KEY (id_categoria)
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- TABLA PRODUCTOS
-- -----------------------------------------------------
create table PRODUCTOS (
	id_producto int unsigned auto_increment not null comment 'identificacion de producto',
	id_categoria tinyint unsigned not null comment 'identificacion de categroías de productos',
	nombre_producto varchar(50) not null comment 'ingresar nombre de producto',
	descripcion_producto varchar(100) NOT NULL comment 'detalles del producto',
	marca varchar(50) comment 'marca del producto',
	referencia varchar(50) comment 'referencia del producto',
	primary key(id_producto),
	constraint fk_productos_categorias
	    foreign key (id_categoria)
	    references CATEGORIAS (id_categoria)
) engine = InnoDB;

-- -----------------------------------------------------
-- TABLA PROVEEDORES
-- -----------------------------------------------------
create table PROVEEDORES (
	id_proveedor smallint unsigned auto_increment not null comment 'identificación de proveedor',
    empresa varchar(50) not null comment 'nombre de la empresa',
    direccion_proveedor varchar(100) comment 'campo para direccion de la empresa',
    nombre_proveedor varchar(100) not null comment 'campo para nombre de la persona',
    telefono_proveedor varchar(15) not null comment 'campo para telefono de la empesa o personal',
    email_proveedor varchar(50) comment 'campo para correo electonico de la empresa',
    descripcion_proveedor varchar(150) comment 'campo para describir brevemente los productos que ofrece la empresa',
    primary key(id_proveedor)
) engine = InnoDB;

-- -----------------------------------------------------
-- TABLA ENTRADAS
-- -----------------------------------------------------
create table ENTRADAS (
	id_entrada int unsigned auto_increment not null comment 'campo para identificar ingreso de productos',
	fecha_entrada date not null comment 'campo para ingresar fecha de entrada de productos',
	cantidad_items_entrada int not null comment 'campo para ingresar cantidad de productos entrantes',
	costo_unitario double comment 'campo para ingresar valor monetario del producto por unidad',
	id_proveedor smallint unsigned not null comment 'id de proveedor para la entrada',
	id_producto int unsigned not null comment 'id de producto para la entrada',
	constraint fk_entradas_proveedores
	    foreign key (id_proveedor)
	    references PROVEEDORES (id_proveedor)
	    ON DELETE cascade
	    ON UPDATE cascade,
	constraint fk_entradas_productos
	    foreign key (id_producto)
	    references PRODUCTOS (id_producto)
	    ON DELETE cascade
	    ON UPDATE cascade,
	primary key (id_entrada)
) engine = InnoDB;

-- -----------------------------------------------------
-- TABLA STOCK
-- -----------------------------------------------------
CREATE TABLE STOCK (
	id_stock INT unsigned auto_increment NOT NULL PRIMARY KEY COMMENT 'id para registro stock',
	id_entrada int unsigned NOT NULL COMMENT 'id de entrada en stock',
	CONSTRAINT fk_stock_entradas 
	FOREIGN KEY (id_entrada) 
	REFERENCES ENTRADAS(id_entrada) 
	ON UPDATE CASCADE
) ENGINE=InnoDB;

-- -----------------------------------------------------
-- TABLA VENTAS
-- -----------------------------------------------------
create table VENTAS (
	id_venta int unsigned auto_increment not null comment 'identificación de venta de producto',
	id_stock int unsigned not null comment 'id de articulo en stock',
	fecha_venta datetime not null comment 'fecha de venta de productos',
	cantidad_items_venta_x_producto int not null comment 'cantidad de productos de la venta',
	valot_total_venta int not null comment 'cantidad total de la venta',
	primary key (id_venta),
	constraint fk_ventas_stock
		foreign key (id_stock)
		references STOCK (id_stock)
		on update cascade
) engine = InnoDB;

-- -----------------------------------------------------
-- TABLA FACTURAS
-- -----------------------------------------------------
create table FACTURAS (
	id_factura int unsigned auto_increment not null comment 'identicacion de factura',
	id_venta int unsigned not null comment 'identificacion de venta de producto',
	nit_empresa_factura varchar(50) not null comment 'nit de la empresa',
	cantidad_productos int not null comment 'cantidad de productos en la factura',
	iva_producto int default 19 not null comment 'porcentaje de iva en la factura',
	direccion_empresa_factura varchar(100) comment 'direccion de la empresa',
	razon_social_factura varchar(50) comment 'razon social de la empresa en la factura',
	fecha_factura datetime not null comment 'fecha de la factura',
	valor_total_factura double not null comment 'el valor total de la factura',
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
	id_gasto tinyint unsigned auto_increment not null comment 'identificación de gasto',
	tipo_gasto varchar(50) not null comment 'tipología del gasto, p.ej.: luz, agua, teléfono, etc.',
	valor_gasto double not null comment 'ingresar el valor total del gasto',
	primary key (id_gasto)
) engine = InnoDB;



