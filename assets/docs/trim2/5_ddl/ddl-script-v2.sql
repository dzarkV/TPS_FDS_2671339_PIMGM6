-- Usar base de datos
use bbdd_inventario;

set foreign_key_checks=0;	-- Deshabilita la restricción que tiene las llaves foráneas

-- Borrar tablas
drop table roles;
drop table credenciales ;

-- borrar resticcion y columna id_rol en tabla usuario
ALTER TABLE bbdd_inventario.usuarios DROP FOREIGN KEY fk_usuarios_roles;
ALTER TABLE bbdd_inventario.usuarios DROP INDEX fk_usuarios_roles;
ALTER TABLE bbdd_inventario.usuarios DROP COLUMN id_rol;

-- Habilitamos las restricciones 
set foreign_key_checks=1;

-- Añadir columnas del usuario
-- Columna nombre_rol
alter table bbdd_inventario.usuarios 
add column nombre_rol enum('Administrador', 'Vendedor') 
default 'Vendedor' not null COMMENT 'rol del usuario en el sistema';

-- Columna nickname
alter table bbdd_inventario.usuarios 
add column nickname varchar(20) not null
COMMENT 'username del usuario en el sistema (validado con autenticación)'; 

-- Columna estado
alter table bbdd_inventario.usuarios 
add column activo bool NOT NULL 
COMMENT 'verifica si el usuario está activo o no en el sistema'; 

-- Ver tabla con comentarios
show full columns from usuarios;

