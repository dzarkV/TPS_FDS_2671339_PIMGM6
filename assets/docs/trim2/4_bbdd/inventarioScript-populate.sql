
USE BBDD_INVENTARIO;

-- -----------------------------------------------------
-- Insertar datos
-- -----------------------------------------------------
insert into CATEGORIAS (nombre_categoria) values
('decoraciones'),
('papeleria'),
('cosmeticos'),
('aseo'),
('desechables'),	
('piñateria'),
('utensilios'),
('dulces'),
('bebidas'),
('cocina'),
('joyeria'),
('jugueteria'),
('accesorios'),
('ropa');

INSERT INTO ENTRADAS (fecha_entrada,cantidad_items_entrada,costo_total_entrada,costo_unitario) VALUES
	 ('2023-07-20',10,500000,500.0),
	 ('2023-06-12',20,2000000,1000.0);


INSERT INTO PROVEEDORES (id_entrada,empresa,direccion_proveedor,nombre_proveedor,telefono_proveedor,email_proveedor,descripcion_proveedor) VALUES
	 (1,'italo','calle 57b sur # 24b - 17','luisa perez','6017454590','chocolatesitalo@gmail.com','chocolates'),
	 (2,'prosalon','calle 19a # 84-14','carlos andrade','6015600100','prosalonventas@info.com','tinturas para el pelo');


INSERT INTO PRODUCTOS (id_entrada,id_categoria,nombre_producto,precio_producto,descripcion_producto,marca,referencia) VALUES
(1,8,'frasco chocolates', 10000.0, 'frasco con chocolates', ' ', ' '),
(1,8,'caja rectangular chocolates', 5000.0, 'caja rectangular chocolates', ' ', ' '),
(1,8, 'caja piramidal chocolates', 3500.0, 'caja piramidal chocolates', ' ', ' '),
(1,8, 'caja exagonal de chocolates', 8000.0, 'caja exagonal de chocolates', ' ', ' '),
(1,8, 'caja rectangular con boton grande', 8000.0, 'caja rectangular con boton grande', ' ', ' '),
(1,8, 'caja cono chocolate', 5000.0, 'caja cono chocolate', ' ', ' '),
(1,9, 'caja cerveza lata/afiche', 10000.0, 'caja cerveza lata/afiche', ' ', ' '),
(1,8, 'caja chocolate y cerveza', 15000.0, 'caja chocolate y cerveza', ' ', ' '),
(1,1, 'caja poster ideas', 8000.0, 'caja poster ideas', ' ', ' '),
(1,8, 'chocofortunas yonkiss', 9000.0, 'chocofortunas yonkiss', ' ', ' '),
(1,8, 'piropos mua', 14000.0, 'piropos mua', ' ', ' '),
(1,8, 'chocolates puppy', 5500.0, 'chocolates puppy', ' ', ' '),
(1,12, 'prisma', 1000.0, 'prisma', ' ', ' '),
(1,9, 'poster ideas botella cerveza', 13000.0, 'poster ideas botella cerveza', ' ', ' '),
(1,7, 'mugs/posillo chocolates', 12000.0, 'mugs/posillo chocolates', ' ', ' '),
(1,7, 'mugs/posillo peluche', 20000.0, 'mugs/posillo peluche', ' ', ' '),
(1,8, 'chocolatina en libro tom-01', 5500.0, 'chocolatina en libro tom-01', ' ', ' '),
(1,7, 'vaso cervezero', 18000.0, 'vaso cervezero', ' ', ' '),
(1,7, 'vaso coctelero', 15000.0, 'vaso coctelero', ' ', ' '),
(1,7, 'copas', 15000.0, 'copas', ' ', ' '),
(1,7, 'peluche oso mediano 20cm', 12500.0, 'peluche oso mediano 20cm', ' ', ' '),
(1,7, 'cojin rojo pequeño peluche', 6000.0, 'cojin rojo pequeño peluche', ' ', ' '),
(1,7, 'unicornio mediano peluche', 28000.0, 'unicornio mediano peluche', ' ', ' '),
(1,7, 'unicornio pequeño peluche', 18000.0, 'unicornio pequeño peluche', ' ', ' '),
(1,7, 'osos panda buso amarillo peluche', 29500.0, 'osos panda buso amarillo peluche', ' ', ' '),
(1,7, 'oso panda corazon peluche', 32000.0, 'oso panda corazon peluche', ' ', ' '),
(1,7, 'conejo azul peluche', 29000.0, 'conejo azul peluche', ' ', ' '),
(1,7, 'conejo reversible peluche', 20000.0, 'conejo reversible peluche', ' ', ' '),
(1,7, 'oso mediano 30cm corazon', 25000.0, 'oso mediano 30cm corazon', ' ', ' '),
(1,1, 'arreglo minny', 30000.0, 'arreglo minny', ' ', ' '),
(1,7, 'minny', 26000.0, 'minny', ' ', ' '),
(1,7, 'mickey', 26000.0, 'mickey', ' ', ' '),
(1,8, 'caja grande posillo y cerveza', 30000.0, 'caja grande posillo y cerveza', ' ', ' ');


insert into PRODUCTOS (id_entrada,id_categoria,nombre_producto, precio_producto, descripcion_producto) values
(1,2, 'colores rores jumbo x12', 15000.0, ''),
(1,2, 'plumones pelikan x12', 9500.0, ''),
(1,2, 'caja lapiz papermatehb2', 12000.0, ''),
(1,2, 'tempera x125', 2000.0, ''),
(1,2, 'pegante si pega x 120g', 2500.0, ''),
(1,2, 'cinta transparente ancha', 3500.0, ''),
(1,2, 'plastina mitrensto x 100g', 1700.0, ''),
(1,2, 'cuaderno principiante cocido x 100h', 2000.0, ''),
(1,2, 'carpeta niños', 2000.0, ''),
(1,2, 'corrector liquido oenmax', 1800.0, '');


insert into PRODUCTOS (id_entrada,id_categoria,nombre_producto, precio_producto, descripcion_producto) values
(1,4,'piedra pomes', 600.0, ''),
(1,4,'cepillo uñas', 2000.0, ''),
(1,4,'ablandador de callos x 250 cosdy', 8500.0, ''),
(1,4,'crema depiladora lampiña', 5000.0, ''),
(1,4,'aceite corporales', 7000.0, ''),
(1,4,'espejo bolsillo', 7500.0, ''),
(1,4,'removedor de esmalte 60 ml', 3000.0, ''),
(1,4,'copitos redondo pequeño', 1500.0, ''),
(1,4,'depilador flores', 2000.0, ''),
(1,4,'gorro baño', 1500.0, '');


insert into PRODUCTOS (id_entrada,id_categoria,nombre_producto, precio_producto, descripcion_producto) values
(1,4, 'shampoo sachet piojos pioder', 1000.0, ''),
(1,4, 'shampoo color meicys', 2500.0, ''),
(1,4, 'desodorante speed stick sachet', 1000.0, ''),
(1,4, 'leche magnesia x 120 ml', 5000.0, ''),
(1,4, 'keratina duby class sachet', 3000.0, ''),
(1,4, 'vanish x 130ml', 1700.0, ''),
(1,4, 'fabuloso x 180ml', 1600.0, ''),
(1,4, 'jabon rey', 3000.0, ''),
(1,4, 'detergente liquido eterna', 6000.0, ''),
(1,4, 'papel higienico familia', 2300.0, '');


insert into PRODUCTOS (id_entrada,id_categoria,nombre_producto, precio_producto, descripcion_producto) values
(1,7, 'plato para torta', 2000.0, ''),
(1,7, 'plato ondo pequeño', 3000.0, ''),
(1,7, 'plato pando grande', 4500.0, ''),
(1,7, 'cuchara pequeña', 3500.0, ''),
(1,7, 'tenedor pequeño', 3500.0, ''),
(1,7, 'cuchillo pequeño x 100', 3500.0, ''),
(1,7, 'vasos 5. oz', 4000.0, ''),
(1,7, 'papel vinipel x 20 m', 2000.0, ''),
(1,7, 'papel vinipel x 209 m', 12000.0, '');


insert into PRODUCTOS (id_entrada,id_categoria, nombre_producto, precio_producto, descripcion_producto) values
(1,5,'pañal winny etapa 2', 0.0, ''),
(1,5,'pañal winny etapa 1', 0.0, ''),
(1,5,'pañal winny etapa 0', 0.0, ''),
(1,5,'pañal winny etapa 4', 0.0, ''),
(1,5,'tetero grande', 0.0, ''),
(1,5,'tetero pequeño', 0.0, ''),
(1,5,'tetero gordo', 0.0, ''),
(1,5,'traje de bebe', 0.0, ''),
(1,5,'zapatos ', 0.0, ''),
(1,5,'baberos', 0.0, '');


insert into PRODUCTOS (id_entrada,id_categoria, nombre_producto, precio_producto, descripcion_producto) values
(2,6, 'piñata icopor', 0.0, ''),
(2,6, 'relleno piñata', 0.0, ''),
(2,6, 'alcancias pequeñas', 0.0, ''),
(2,6, 'vaso diseño fiesta', 0.0, ''),
(2,6, 'plato diseños fiesta', 0.0, ''),
(2,6, 'bolsa sorpresa x 10u', 0.0, ''),
(2,6, 'mantel diseño fiesta', 0.0, ''),
(2,6, 'cerpentina', 0.0, ''),
(2,6, 'feston diseños fiesta', 0.0, ''),
(2,6, 'gorros diseños fiestas x 10', 0.0, '');


insert into PRODUCTOS (id_entrada,id_categoria, nombre_producto, precio_producto, descripcion_producto) values
(2,10, 'cuchillos', 0.0, ''),
(2,10, 'platis plasticos', 0.0, ''),
(2,10, 'platos metalicos', 0.0, ''),
(2,10, 'platos loza', 0.0, ''),
(2,10, 'cucharas', 0.0, ''),
(2,10, 'cucharones', 0.0, ''),
(2,10, 'mazo', 0.0, ''),
(2,10, 'coladores', 0.0, ''),
(2,10, 'jarras', 0.0, ''),
(2,10, 'bandejas', 0.0, '');


insert into PRODUCTOS (id_entrada,id_categoria, nombre_producto, precio_producto, descripcion_producto) values
(2,11, 'relojeria', 0.0, ''),
(2,11, 'aretes', 0.0, ''),
(2,11, 'candonga', 0.0, ''),
(2,11, 'collares', 0.0, ''),
(2,11, 'anillos', 0.0, ''),
(2,11, 'balacas', 0.0, ''),
(2,11, 'pinsas puillas', 0.0, '');


insert into PRODUCTOS (id_entrada,id_categoria, nombre_producto, precio_producto, descripcion_producto) values
(2,12, 'monopoly', 0.0, ''),
(2,12, 'barbie', 0.0, ''),
(2,12, 'avenger x4', 0.0, ''),
(2,12, 'kid princesa', 0.0, ''),
(2,12, 'kid pawpatrol', 0.0, ''),
(2,12, 'reloj luz', 0.0, ''),
(2,12, 'coche muñeca', 0.0, ''),
(2,12, 'kid arena', 0.0, ''),
(2,12, 'slime grande', 0.0, ''),
(2,12, 'slime pequeño x2', 0.0, ''),
(2,12, 'slime plastilinario', 0.0, '');


insert into PRODUCTOS (id_entrada,id_categoria, nombre_producto, precio_producto, descripcion_producto) values
(2,13, 'audifono balaca', 0.0, ''),
(2,13, 'reloj pared', 0.0, ''),
(2,13, 'microfono', 0.0, ''),
(2,13, 'parlante', 0.0, ''),
(2,13, 'radio', 0.0, ''),
(2,13, 'controles', 0.0, ''),
(2,13, 'antena tv', 0.0, ''),
(2,13, 'cargadores', 0.0, ''),
(2,13, 'cables usb', 0.0, ''),
(2,13, 'extenciones', 0.0, '');
