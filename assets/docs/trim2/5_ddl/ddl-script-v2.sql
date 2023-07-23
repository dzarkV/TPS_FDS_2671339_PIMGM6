-- Usar base de datos
use bbdd_inventario;

set foreign_key_checks=0;	-- Deshabilita la restricción que tiene las llaves foráneas

-- borrar restriccion y columna de usuario en tabla gastos
ALTER TABLE bbdd_inventario.gastos DROP FOREIGN KEY fk_gastos_usuario;
ALTER TABLE bbdd_inventario.gastos DROP INDEX fk_gastos_usuario;
ALTER TABLE bbdd_inventario.gastos DROP COLUMN id_usuario;

-- borrar restricción y columna de usuario en entradas
ALTER TABLE bbdd_inventario.entradas DROP FOREIGN KEY fk_entradas_usuarios;
ALTER TABLE bbdd_inventario.entradas DROP INDEX fk_entradas_usuarios;
ALTER TABLE bbdd_inventario.entradas DROP COLUMN id_usuario;

-- borrar restriccion y columna id_rol en tabla usuario
ALTER TABLE bbdd_inventario.usuarios DROP FOREIGN KEY fk_usuarios_roles;
ALTER TABLE bbdd_inventario.usuarios DROP INDEX fk_usuarios_roles;
ALTER TABLE bbdd_inventario.usuarios DROP COLUMN id_rol;

-- Borrar tablas
drop table roles;
drop table credenciales ;
drop usuarios;

-- Habilitamos las restricciones 
set foreign_key_checks=1;

-- Añadir tabla de stock
CREATE TABLE bbdd_inventario.stock (
	id_stock INT unsigned auto_increment NOT NULL PRIMARY KEY COMMENT 'id para registro stock',
	cantidad INT unsigned NOT NULL COMMENT 'cantidad de artículos en stock (calculado)',
	id_entrada int unsigned NOT NULL COMMENT 'id de entrada en stock',
	CONSTRAINT stock_FK 
	FOREIGN KEY (id_entrada) 
	REFERENCES bbdd_inventario.entradas(id_entrada) 
	ON UPDATE CASCADE
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8
COLLATE=utf8_general_ci
AUTO_INCREMENT=1;
CREATE INDEX stock_id_stock_IDX USING BTREE ON bbdd_inventario.stock (id_stock);

-- modificar relación de ventas con productos
ALTER TABLE bbdd_inventario.ventas DROP FOREIGN KEY fk_ventas_productos;
ALTER TABLE bbdd_inventario.ventas DROP INDEX fk_ventas_productos;
ALTER TABLE bbdd_inventario.ventas DROP COLUMN id_producto;

-- añadir nueva relación entre ventas y stock
ALTER TABLE bbdd_inventario.ventas 
ADD id_stock int unsigned NOT NULL 
COMMENT 'id de articulo en stock';

ALTER TABLE bbdd_inventario.ventas 
ADD CONSTRAINT fk_ventas_stock 
	FOREIGN KEY (id_stock) 
	REFERENCES bbdd_inventario.stock(id_stock) 
	ON UPDATE CASCADE;


