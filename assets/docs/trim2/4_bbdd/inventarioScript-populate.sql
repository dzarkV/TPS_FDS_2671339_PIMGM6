
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

INSERT INTO PROVEEDORES (empresa,direccion_proveedor,nombre_proveedor,telefono_proveedor,email_proveedor,descripcion_proveedor) VALUES
	 ('italo','calle 57b sur # 24b - 17','luisa perez','6017454590','chocolatesitalo@gmail.com','chocolates'),
	 ('prosalon','calle 19a # 84-14','carlos andrade','6015600100','prosalonventas@info.com','tinturas para el pelo');


INSERT INTO PRODUCTOS (id_categoria,nombre_producto,descripcion_producto,marca,referencia) VALUES
(8,'frasco chocolates', 'frasco con chocolates', ' ', ' '),
(8,'caja rectangular chocolates', 'caja rectangular chocolates', ' ', ' '),
(8, 'caja piramidal chocolates', 'caja piramidal chocolates', ' ', ' '),
(8, 'caja exagonal de chocolates', 'caja exagonal de chocolates', ' ', ' '),
(8, 'caja rectangular con boton grande', 'caja rectangular con boton grande', ' ', ' '),
(8, 'caja cono chocolate', 'caja cono chocolate', ' ', ' '),
(9, 'caja cerveza lata/afiche', 'caja cerveza lata/afiche', ' ', ' '),
(8, 'caja chocolate y cerveza', 'caja chocolate y cerveza', ' ', ' '),
(1, 'caja poster ideas', 'caja poster ideas', ' ', ' '),
(8, 'chocofortunas yonkiss', 'chocofortunas yonkiss', ' ', ' '),
(8, 'piropos mua', 'piropos mua', ' ', ' '),
(8, 'chocolates puppy', 'chocolates puppy', ' ', ' '),
(12, 'prisma', 'prisma', ' ', ' '),
(9, 'poster ideas botella cerveza', 'poster ideas botella cerveza', ' ', ' '),
(7, 'mugs/posillo chocolates', 'mugs/posillo chocolates', ' ', ' '),
(7, 'mugs/posillo peluche', 'mugs/posillo peluche', ' ', ' '),
(8, 'chocolatina en libro tom-01', 'chocolatina en libro tom-01', ' ', ' '),
(7, 'vaso cervezero', 'vaso cervezero', ' ', ' '),
(7, 'vaso coctelero', 'vaso coctelero', ' ', ' '),
(7, 'copas', 'copas', ' ', ' '),
(7, 'peluche oso mediano 20cm', 'peluche oso mediano 20cm', ' ', ' '),
(7, 'cojin rojo pequeño peluche', 'cojin rojo pequeño peluche', ' ', ' '),
(7, 'unicornio mediano peluche', 'unicornio mediano peluche', ' ', ' '),
(7, 'unicornio pequeño peluche', 'unicornio pequeño peluche', ' ', ' '),
(7, 'osos panda buso amarillo peluche', 'osos panda buso amarillo peluche', ' ', ' '),
(7, 'oso panda corazon peluche', 'oso panda corazon peluche', ' ', ' '),
(7, 'conejo azul peluche', 'conejo azul peluche', ' ', ' '),
(7, 'conejo reversible peluche', 'conejo reversible peluche', ' ', ' '),
(7, 'oso mediano 30cm corazon', 'oso mediano 30cm corazon', ' ', ' '),
(1, 'arreglo minny', 'arreglo minny', ' ', ' '),
(7, 'minny', 'minny', ' ', ' '),
(7, 'mickey', 'mickey', ' ', ' '),
(8, 'caja grande posillo y cerveza', 'caja grande posillo y cerveza', ' ', ' ');


insert into PRODUCTOS (id_categoria,nombre_producto, descripcion_producto) values
(2, 'colores rores jumbo x12', ''),
(2, 'plumones pelikan x12', ''),
(2, 'caja lapiz papermatehb2', ''),
(2, 'tempera x125', ''),
(2, 'pegante si pega x 120g', ''),
(2, 'cinta transparente ancha', ''),
(2, 'plastina mitrensto x 100g', ''),
(2, 'cuaderno principiante cocido x 100h', ''),
(2, 'carpeta niños', ''),
(2, 'corrector liquido oenmax', '');


insert into PRODUCTOS (id_categoria,nombre_producto, descripcion_producto) values
(4,'piedra pomes', ''),
(4,'cepillo uñas', ''),
(4,'ablandador de callos x 250 cosdy', ''),
(4,'crema depiladora lampiña', ''),
(4,'aceite corporales', ''),
(4,'espejo bolsillo', ''),
(4,'removedor de esmalte 60 ml', ''),
(4,'copitos redondo pequeño', ''),
(4,'depilador flores', ''),
(4,'gorro baño', '');


insert into PRODUCTOS (id_categoria,nombre_producto, descripcion_producto) values
(4, 'shampoo sachet piojos pioder', ''),
(4, 'shampoo color meicys', ''),
(4, 'desodorante speed stick sachet', ''),
(4, 'leche magnesia x 120 ml', ''),
(4, 'keratina duby class sachet', ''),
(4, 'vanish x 130ml', ''),
(4, 'fabuloso x 180ml', ''),
(4, 'jabon rey', ''),
(4, 'detergente liquido eterna', ''),
(4, 'papel higienico familia', '');


insert into PRODUCTOS (id_categoria,nombre_producto, descripcion_producto) values
(7, 'plato para torta', ''),
(7, 'plato ondo pequeño', ''),
(7, 'plato pando grande', ''),
(7, 'cuchara pequeña', ''),
(7, 'tenedor pequeño', ''),
(7, 'cuchillo pequeño x 100', ''),
(7, 'vasos 5. oz', ''),
(7, 'papel vinipel x 20 m', ''),
(7, 'papel vinipel x 209 m', '');


insert into PRODUCTOS (id_categoria, nombre_producto, descripcion_producto) values
(5,'pañal winny etapa 2', ''),
(5,'pañal winny etapa 1', ''),
(5,'pañal winny etapa 0', ''),
(5,'pañal winny etapa 4', ''),
(5,'tetero grande', ''),
(5,'tetero pequeño', ''),
(5,'tetero gordo', ''),
(5,'traje de bebe', ''),
(5,'zapatos ', ''),
(5,'baberos', '');


insert into PRODUCTOS (id_categoria, nombre_producto, descripcion_producto) values
(6, 'piñata icopor', ''),
(6, 'relleno piñata', ''),
(6, 'alcancias pequeñas', ''),
(6, 'vaso diseño fiesta', ''),
(6, 'plato diseños fiesta', ''),
(6, 'bolsa sorpresa x 10u', ''),
(6, 'mantel diseño fiesta', ''),
(6, 'cerpentina', ''),
(6, 'feston diseños fiesta', ''),
(6, 'gorros diseños fiestas x 10', '');


insert into PRODUCTOS (id_categoria, nombre_producto, descripcion_producto) values
(10, 'cuchillos', ''),
(10, 'platis plasticos', ''),
(10, 'platos metalicos', ''),
(10, 'platos loza', ''),
(10, 'cucharas', ''),
(10, 'cucharones', ''),
(10, 'mazo', ''),
(10, 'coladores', ''),
(10, 'jarras', ''),
(10, 'bandejas', '');


insert into PRODUCTOS (id_categoria, nombre_producto, descripcion_producto) values
(11, 'relojeria', ''),
(11, 'aretes', ''),
(11, 'candonga', ''),
(11, 'collares', ''),
(11, 'anillos', ''),
(11, 'balacas', ''),
(11, 'pinsas puillas', '');


insert into PRODUCTOS (id_categoria, nombre_producto, descripcion_producto) values
(12, 'monopoly', ''),
(12, 'barbie', ''),
(12, 'avenger x4', ''),
(12, 'kid princesa', ''),
(12, 'kid pawpatrol', ''),
(12, 'reloj luz', ''),
(12, 'coche muñeca', ''),
(12, 'kid arena', ''),
(12, 'slime grande', ''),
(12, 'slime pequeño x2', ''),
(12, 'slime plastilinario', '');


insert into PRODUCTOS (id_categoria, nombre_producto, descripcion_producto) values
(13, 'audifono balaca', ''),
(13, 'reloj pared', ''),
(13, 'microfono', ''),
(13, 'parlante', ''),
(13, 'radio', ''),
(13, 'controles', ''),
(13, 'antena tv', ''),
(13, 'cargadores', ''),
(13, 'cables usb', ''),
(13, 'extenciones', '');

INSERT INTO ENTRADAS (fecha_entrada,cantidad_items_entrada,costo_unitario, id_proveedor, id_producto) VALUES
	 ('2023-07-20',10,500.0, 1, 11),
	 ('2023-06-12',20,1000.0, 2, 25);