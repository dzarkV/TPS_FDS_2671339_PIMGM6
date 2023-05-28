use bbdd_inventario

-- definir enumeración en la columna nombre_rol de la tabla ROLES
alter table roles modify nombre_rol enum('Administrador', 'Vendedor') default 'Vendedor' not null;
