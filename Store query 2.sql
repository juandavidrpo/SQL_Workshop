--Segundo script

--1. Consulta SQL donde pueda obtener los productos vendidos digitando tipo de documento
--n�mero de documento.
JOIN sale ON sale_has_product.sale_id = sale.id_sale
--proveedores.

SELECT product.name AS producto, provider.name AS proveedor FROM provider
JOIN product ON product.provider_id = provider.id_provider
WHERE product.name = 'Pasta de dientes'


--3. [PLUS no obligatorio] Crear una consulta que me permita ver qu� producto ha sido el m�s
--vendido y en qu� cantidades de mayor a menor.
JOIN product ON sale_has_product.product_id = product.id_product
GROUP BY product.name
ORDER BY vendido DESC;