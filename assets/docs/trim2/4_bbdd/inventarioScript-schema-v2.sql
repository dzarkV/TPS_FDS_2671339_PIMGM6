-- ALGUNAS NOTAS DE TIPOS DE DATOS
-- tinyint -128 a 127					unsigned (sin signo negativo):  0 hasta 255
-- smallint -32.768 a 32.767			unsigned: 						0 hasta 65.535
-- mediumint -8.388.608 a 8.388.607 	unsigned: 						0 hasta 16.777.215
-- int -2.147.483.648 a 2.147.483.647 	unsigned:						0 hasta 4.294.967.295





DROP SCHEMA IF EXISTS BBDD_INVENTARIO;
-- -----------------------------------------------------
-- ESTRUCTURA BBDD_INVENTARIO
-- -----------------------------------------------------
CREATE SCHEMA BBDD_INVENTARIO DEFAULT CHARACTER SET utf8 ;
USE BBDD_INVENTARIO;

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



