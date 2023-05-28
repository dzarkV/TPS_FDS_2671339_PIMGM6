-- Mostrar BBDDs
SHOW databases;

-- Usar base de datos
use bbdd_inventario;

-- Mostrar columnas de la tabla y sus tipos de datos
describe roles;
describe productos;

-- definir enumeración en la columna nombre_rol de la tabla ROLES
alter table roles modify nombre_rol enum('Administrador', 'Vendedor') default 'Vendedor' not null;

-- modificar la cantidad de caracteres a la columna nombreProducto de 20 a 50
alter table productos modify nombreProducto varchar(50) not null;

-- agregar la columna marca a la tabla productos 
ALTER TABLE productos add column marca varchar(50) ;

-- agregar la columna referencia a la tabla productos 
ALTER TABLE productos add column referencia varchar(50) ;
