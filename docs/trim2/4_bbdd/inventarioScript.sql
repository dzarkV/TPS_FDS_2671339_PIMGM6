CREATE SCHEMA  if not exists BBDD_INVENTARIO DEFAULT CHARACTER SET utf8 ;
USE BBDD_INVENTARIO;

create table ROLES ( 
	idRol int auto_increment not null,
	nombre_rol VARCHAR(20) NOT NULL,
    PRIMARY KEY (idRol)
) ENGINE = InnoDB;

create table USUARIOS (
	idUsuario int auto_increment not null,
	idRol int not null,
    nombreUsuario varchar(20) not null,
    apellidoUsuario varchar(20) not null,
    fechaRegistro date,
	PRIMARY KEY (idUsuario),
    CONSTRAINT fk_usuario_rol
    FOREIGN KEY (idRol)
    REFERENCES ROLES (idRol)
) ENGINE = InnoDB;

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
) ENGINE = InnoDB;

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
) engine = InnoDB;

CREATE table CATEGORIAS (
idCategoria int auto_increment not null,
nombreCategoria varchar(20) not null,
PRIMARY KEY (idCategoria)
) ENGINE = InnoDB;
    
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
    references ENTRADAS (idEntrada),
    constraint fk_productos_categorias
    foreign key (idCategoria)
    references CATEGORIAS (idCategoria)
) engine = InnoDB;

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
) engine = InnoDB;	

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
) engine = InnoDB;

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
) engine =InnoDB;

create table GASTOS (
idGasto int auto_increment not null,
idUsuario int not null,
tipoGasto varchar(50) not null,
valorGasto double not null,
primary key (idGasto),
constraint fk_gastos_usuario
foreign key (idUsuario)
references USUARIOS (idUsuario)
) engine = InnoDB;


