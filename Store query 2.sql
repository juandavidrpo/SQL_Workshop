--Segundo script

--1. Consulta SQL donde pueda obtener los productos vendidos digitando tipo de documento
--n�mero de documento.USE storeSELECT customer.type_document AS tipo_documento, customer.document_number AS cliente, product.name AS producto FROM sale_has_product
JOIN sale ON sale_has_product.sale_id = sale.id_saleJOIN customer ON sale.customer_id = customer.id_customerJOIN product ON product.id_product = sale_has_product.product_idWHERE customer.document_number = '10235489624' AND customer.type_document = 'CC'--2. Consultar productos por medio del nombre, el cual debe mostrar quien o quienes han sido su
--proveedores.

SELECT product.name AS producto, provider.name AS proveedor FROM provider
JOIN product ON product.provider_id = provider.id_provider
WHERE product.name = 'Pasta de dientes'


--3. [PLUS no obligatorio] Crear una consulta que me permita ver qu� producto ha sido el m�s
--vendido y en qu� cantidades de mayor a menor.SELECT product.name AS producto, SUM(quantity_sold) AS vendido FROM sale_has_product
JOIN product ON sale_has_product.product_id = product.id_product
GROUP BY product.name
ORDER BY vendido DESC;