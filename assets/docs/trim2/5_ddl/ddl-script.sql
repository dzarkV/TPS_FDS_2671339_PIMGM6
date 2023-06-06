-- Mostrar BBDDs
SHOW databases;

-- Usar base de datos
use bbdd_inventario;

-- Mostrar columnas de la tabla y sus tipos de datos
describe roles;
describe productos;
describe categorias;

-- definir enumeración en la columna nombre_rol de la tabla ROLES
alter table roles modify nombre_rol enum('Administrador', 'Vendedor') default 'Vendedor' not null;

-- modificar la cantidad de caracteres a la columna nombreProducto de 20 a 50
alter table productos modify nombre_producto varchar(50) not null;

-- agregar la columna marca a la tabla productos 
ALTER TABLE productos add column marca varchar(50);

-- agregar la columna referencia a la tabla productos 
ALTER TABLE productos add column referencia varchar(50);

-- agregar la columna username a la tabla credenciales 
ALTER TABLE credenciales add column username varchar(20);

-- ver comentarios en las columnas de la tabla categorías
show full columns from entradas;

-- ||||||||||||||||||||||||||||||||||||||||||||||
-- Comentarios a las diferentes columnas
-- ||||||||||||||||||||||||||||||||||||||||||||||
-- comentarios en tabla categorias
ALTER TABLE categorias 
MODIFY COLUMN id_categoria tinyint unsigned auto_increment not null 
comment 'campo para identificar varios productos por categorias ( ej: papelería, cuidado personal, juguetería, etc)';

alter table categorias 
modify column nombre_categoria varchar(20) not null
comment 'campo para escribir nombre la categoria ( ej: lapizes, catulinas, blocks, etc...)';

alter table credenciales 
modify column id_credencial smallint unsigned auto_increment not null
comment 'identificador de credenciales';

alter table credenciales 
modify column id_usuario smallint unsigned not null
comment 'identificador de usuario';

-- comentarios en tabla credenciales
alter table credenciales 
modify column fecha_ingreso date
comment 'campo para ingresar fecha de ingreso de usuarios';

alter table credenciales 
modify column contrasena varchar(20) not null
comment 'campo para alojar contraseña de usuario';

alter table credenciales 
modify column estado boolean
comment 'campo para verificar estado de usuario Activo o Inactivo';

-- comentarios en tabla entradas
alter table entradas 
modify column id_entrada int unsigned auto_increment not null
comment 'campo para identificar ingreso de productos';

alter table entradas 
modify column id_usuario smallint unsigned not null
comment 'identificación de usuario';

alter table entradas 
modify column fecha_entrada date not null
comment 'campo para ingresar fecha de entrada de productos';

alter table entradas 
modify column cantidad_items_entrada int not null
comment 'campo para ingresar cantidad de productos entrantes';

alter table entradas 
modify column costo_total_entrada int not null
comment 'campo para ingresar valor monetario del total de productos';

alter table entradas 
modify column costo_unitario double
comment 'campo para ingresar valor monetario del producto por unidad';

-- comentarios en tabla roles
alter table roles 
modify column id_rol tinyint unsigned auto_increment not null
comment 'identificación de los roles';

alter table roles 
modify column nombre_rol VARCHAR(20) NOT NULL 
comment 'campo para describir qué tipo rol: administrador o vendedor'

-- comentarios en tabla usuarios
alter table usuarios 
modify column id_usuario smallint unsigned auto_increment not null
comment 'identificacion de usuario';

alter table usuarios 
modify column id_rol tinyint unsigned not null
comment 'identificación de los roles';

alter table usuarios 
modify column nombre_usuario varchar(20) not null
comment 'nombre de usuario';

alter table usuarios 
modify column apellido_usuario varchar(20) not null
comment 'apellido de usuario';

alter table usuarios 
modify column fecha_registro date
comment 'fecha de registro de usuario';

-- comentarios en tabla productos
alter table productos 
modify column id_producto int unsigned auto_increment not null
comment 'identificacion de producto';

alter table productos 
modify column id_entrada int unsigned not null
comment 'identificacion de productos que ingresan al inventario';

alter table productos 
modify column  id_categoria tinyint unsigned not null
comment 'identificacion de categroías de productos';

alter table productos 
modify column nombre_producto varchar(20) not null
comment 'ingresar nombre de producto';

alter table productos 
modify column precio_producto double not null
comment 'precio del producto en la mepresa';

alter table productos 
modify column descripcion_producto varchar(100) NOT NULL
comment 'detalles del producto';

-- comentarios en tabla proveedores
alter table proveedores 
modify column id_proveedor smallint unsigned auto_increment not null
comment 'identificación de proveedor';

alter table proveedores 
modify column id_entrada int unsigned not null
comment 'identificación de entrada de producto';

alter table proveedores 
modify column empresa varchar(50) not null
comment 'nombre de la empresa';

alter table proveedores 
modify column direccion_proveedor varchar(100)
comment 'campo para direccion de la empresa';

alter table proveedores 
modify column nombre_proveedor varchar(100) not null
comment 'campo para nombre de la persona';

alter table proveedores 
modify column telefono_proveedor varchar(15) not null
comment 'campo para telefono de la empesa o personal';

alter table proveedores 
modify column email_proveedor varchar(50)
comment 'campo para correo electonico de la empresa';

alter table proveedores 
modify column descripcion_proveedor varchar(150)
comment 'campo para describir brevemente los productos que ofrece la empresa';

-- comentarios en tabla ventas
alter table ventas 
modify column id_venta int unsigned auto_increment not null
comment 'identificación de venta de producto';

alter table ventas
modify column id_producto int unsigned not null
comment 'identificación de producto';

alter table ventas 
modify column fecha_venta datetime not null
comment 'fecha de venta de productos';

alter table ventas
modify column cantidad_items_venta_x_producto int not null
comment 'cantidad de productos de la venta';

alter table ventas 
modify column valot_total_venta int not null
comment 'cantidad total de la venta';

-- comentarios en tabla facturas
alter table facturas
modify column id_factura int unsigned auto_increment not null
comment 'identicacion de factura';

alter table facturas
modify column id_venta int unsigned not null
comment 'identificacion de venta de producto';

alter table facturas
modify column nit_empresa_factura varchar(50) not null
comment 'nit de la empresa';

alter table facturas
modify column cantidad_productos int not null
comment 'cantidad de productos en la factura';

alter table facturas
modify column iva_producto int default 19 not null
comment 'orcentaje de iva en la factura';

alter table facturas
modify column direccion_empresa_factura varchar(100)
comment 'direccion de la empresa';

alter table facturas
modify column razon_social_factura varchar(50)
comment 'razon social de la empresa en la factura';

alter table facturas
modify column fecha_factura datetime not null
comment 'fecha de la factura';

alter table facturas
modify column valor_total_factura double not null
comment 'el valor total de la factura';

-- comentarios en tabla gastos
alter table gastos 
modify column id_gasto tinyint unsigned auto_increment not null
comment 'identificación de gasto';

alter table gastos 
modify column id_usuario smallint unsigned not null
comment 'identificación de usuario';

alter table gastos 
modify column tipo_gasto varchar(50) not null
comment 'tipología del gasto, p.ej.: luz, agua, teléfono, etc.';

alter table gastos 
modify column valor_gasto double not null
comment 'ingresar el valor total del gasto';

