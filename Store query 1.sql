DROP DATABASE store

CREATE DATABASE store

USE store

-- 1. Crear las tablas requeridas con las relaciones necesarias

-- Crear tabla de proveedor

CREATE TABLE provider(
	id_provider INT IDENTITY NOT NULL PRIMARY KEY,
	nit VARCHAR(20) NOT NULL UNIQUE,
	name VARCHAR(80) NOT NULL,
	address VARCHAR(80) NOT NULL,
	phone VARCHAR(80) NOT NULL,
	create_at DATE NOT NULL,
	update_at DATE NULL,
	delete_at DATE NULL,
);

-- CREACION DE LA TABLA VENDEDOR

CREATE TABLE salesman(
	id_salesman INT IDENTITY NOT NULL PRIMARY KEY,
	document_number VARCHAR(11) NOT NULL,
	name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	create_at DATE NOT NULL,
	update_at DATE NULL,
	delete_at DATE NULL,
);

-- CREACION DE LA TABLA PRODUCTO

CREATE TABLE product(
	id_product INT IDENTITY NOT NULL PRIMARY KEY,
	provider_id INT NOT NULL,
	name VARCHAR(80) NOT NULL,
	description VARCHAR(100) NOT NULL,
	price MONEY NOT NULL,
	create_at DATE NOT NULL,
	update_at DATE NULL,
	delete_at DATE NULL,
	FOREIGN KEY(provider_id) REFERENCES provider(id_provider)
);

-- CREACION DE LA TABLA CLIENTE

CREATE TABLE customer(
	id_customer INT IDENTITY NOT NULL PRIMARY KEY,
	type_document VARCHAR(3) NOT NULL,
	document_number VARCHAR(11) UNIQUE NOT NULL,
	create_at DATE NOT NULL,
	update_at DATE NULL,
	delete_at DATE NULL,
	--INDEX document_index ON customer (type_document, document_number)
);

-- CREACION DE LA TABLA VENTA

CREATE TABLE sale(
	id_sale INT IDENTITY NOT NULL PRIMARY KEY,
	customer_id INT NOT NULL,
	salesman_id INT NOT NULL,
	create_at DATE NOT NULL,
	update_at DATE NULL,
	delete_at DATE NULL,
	FOREIGN KEY(customer_id) REFERENCES customer(id_customer),
	FOREIGN KEY(salesman_id) REFERENCES salesman(id_salesman)
);

-- CREACION DE LA TABLA INTERMEDIA DE VENTA Y PRODUCTO

CREATE TABLE sale_has_product(
	id_sale_product INT IDENTITY NOT NULL PRIMARY KEY,
	sale_id INT NOT NULL,
	product_id INT NOT NULL,
	quantity_sold INT NOT NULL,
	FOREIGN KEY(sale_id) REFERENCES sale(id_sale) ON DELETE CASCADE,
	FOREIGN KEY(product_id) REFERENCES product(id_product) ON DELETE CASCADE
);


-- 2. Llenar las tablas con información previa para poder manipular la base de datos a nivel de datos

-- insertando datos para la tabla proveedor
INSERT INTO provider(nit, name, address, phone, create_at)
VALUES('2589103479', 'Star Vending Service', 'cll 78 sur #25-2', '8458386764', GETDATE());

INSERT INTO provider(nit, name, address, phone, create_at)
VALUES('3124687950', 'Hands-On-Candy', 'cll 88 sur #15-5', '8492447357', GETDATE())

INSERT INTO provider(nit, name, address, phone, create_at)
VALUES('9782031467', 'Advenia Foods', 'cra 88 norte #55-33', '3492487957', GETDATE())

INSERT INTO provider(nit, name, address, phone, create_at)
VALUES('0315874209', 'QC Delicias', 'cra 80 sur #30-12', '4235842100', GETDATE())

INSERT INTO provider(nit, name, address, phone, create_at)
VALUES('1589463782', 'Juliette Baker', 'cra 64 sur #25-3', '7894232540', GETDATE())


-- Insertando datos para tabla vendedor
INSERT INTO salesman(document_number, name, last_name, create_at)
VALUES('7894232540', 'Gonzalo', 'Soto', GETDATE())


-- Insertando datos de tabla producto
INSERT INTO product(provider_id, name, description, price, create_at)
VALUES('1', 'Shampoo', 'Anti caspa', 12000, GETDATE())

INSERT INTO product(provider_id, name, description, price, create_at)
VALUES('1', 'Jabon', 'Para ropa', 3000, GETDATE())

INSERT INTO product(provider_id, name, description, price, create_at)
VALUES('2', 'Cafe', 'Descafeinado', 12000, GETDATE())

INSERT INTO product(provider_id, name, description, price, create_at)
VALUES('4', 'Cereal', 'Cereal integral', 8000, GETDATE())

INSERT INTO product(provider_id, name, description, price, create_at)
VALUES('5', 'Pasta', 'Pasta larga', 2500, GETDATE())

INSERT INTO product(provider_id, name, description, price, create_at)
VALUES('5', 'Pasta de dientes', 'Pasta con fluor', 2500, GETDATE())

INSERT INTO product(provider_id, name, description, price, create_at)
VALUES('3', 'Chocolate', 'Chocolate bajo en grasa', 6500, GETDATE())

INSERT INTO product(provider_id, name, description, price, create_at)
VALUES('3', 'Leche', 'Deslactosada', 4000, GETDATE())

INSERT INTO product(provider_id, name, description, price, create_at)
VALUES('4', 'Arroz', 'Arroz blanco', 3500, GETDATE())

INSERT INTO product(provider_id, name, description, price, create_at)
VALUES('4', 'Arepa', 'Arepa de chocolo', 1500, GETDATE())


-- Insertando datos de tabla cliente
INSERT INTO customer(type_document, document_number, create_at)
VALUES('CC', '4647891032', GETDATE())

INSERT INTO customer(type_document, document_number, create_at)
VALUES('TI', '1478965231', GETDATE())

INSERT INTO customer(type_document, document_number, create_at)
VALUES('CC', '8954012364', GETDATE())

INSERT INTO customer(type_document, document_number, create_at)
VALUES('TI', '5647891032', GETDATE())

INSERT INTO customer(type_document, document_number, create_at)
VALUES('CC', '10235489624', GETDATE())

INSERT INTO customer(type_document, document_number, create_at)
VALUES('CC', '11234489625', GETDATE())

INSERT INTO customer(type_document, document_number, create_at)
VALUES('TI', '10234469627', GETDATE())

INSERT INTO customer(type_document, document_number, create_at)
VALUES('CC', '10234541037', GETDATE())

INSERT INTO customer(type_document, document_number, create_at)
VALUES('TI', '98744541037', GETDATE())

INSERT INTO customer(type_document, document_number, create_at)
VALUES('CC', '10234620148', GETDATE())


-- Insertando datos de tabla venta
INSERT INTO sale(customer_id, salesman_id, create_at)
VALUES('1', '1', GETDATE())

INSERT INTO sale(customer_id, salesman_id, create_at)
VALUES('2', '1', GETDATE())

INSERT INTO sale(customer_id, salesman_id, create_at)
VALUES('3', '1', GETDATE())

INSERT INTO sale(customer_id, salesman_id, create_at)
VALUES('4', '1', GETDATE())

INSERT INTO sale(customer_id, salesman_id, create_at)
VALUES('5', '1', GETDATE())

INSERT INTO sale(customer_id, salesman_id, create_at)
VALUES('4', '1', GETDATE())

INSERT INTO sale(customer_id, salesman_id, create_at)
VALUES('3', '1', GETDATE())

INSERT INTO sale(customer_id, salesman_id, create_at)
VALUES('6', '1', GETDATE())

INSERT INTO sale(customer_id, salesman_id, create_at)
VALUES('7', '1', GETDATE())

INSERT INTO sale(customer_id, salesman_id, create_at)
VALUES('8', '1', GETDATE())


-- Insertando datos de tabla venta y product
INSERT INTO sale_has_product(sale_id, product_id, quantity_sold)
VALUES('1', '1', 2)

INSERT INTO sale_has_product(sale_id, product_id, quantity_sold)
VALUES('2', '2', 5)

INSERT INTO sale_has_product(sale_id, product_id, quantity_sold)
VALUES('3', '3', 8)

INSERT INTO sale_has_product(sale_id, product_id, quantity_sold)
VALUES('4', '4', 4)

INSERT INTO sale_has_product(sale_id, product_id, quantity_sold)
VALUES('5', '5', 10)

INSERT INTO sale_has_product(sale_id, product_id, quantity_sold)
VALUES('5', '3', 9)

INSERT INTO sale_has_product(sale_id, product_id, quantity_sold)
VALUES('5', '4', 5)

INSERT INTO sale_has_product(sale_id, product_id, quantity_sold)
VALUES('6', '7', 7)

INSERT INTO sale_has_product(sale_id, product_id, quantity_sold)
VALUES('7', '3', 1)

INSERT INTO sale_has_product(sale_id, product_id, quantity_sold)
VALUES('8', '9', 6)


-- 3. Realizar dos borrados lógicos y dos borrados físicos de ventas realizadas.--Borrado logicoUPDATE saleSET delete_at = GETDATE()WHERE id_sale = 1UPDATE saleSET delete_at = GETDATE()WHERE id_sale = 3--Borrado fisicoDELETE FROM sale WHERE id_sale = 2DELETE FROM sale WHERE customer_id = 4--4. Modificar tres productos en su nombre y proveedor que los provee.UPDATE productSET name = 'Shampo Savital'WHERE id_product = 1UPDATE productSET provider_id = 3WHERE id_product = 1UPDATE productSET name = 'Jabon Azul'WHERE id_product = 2UPDATE productSET provider_id = 3WHERE id_product = 2UPDATE productSET name = 'Kelloggs'WHERE id_product = 4UPDATE productSET provider_id = 5WHERE id_product = 4;