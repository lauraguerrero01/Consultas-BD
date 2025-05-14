-- COMPOSICIÓN INTERNA --

-- 1. Devuelve una lista con el nombre del producto, precio y nombre de fabricante de todos los productos de la base de datos.
SELECT p.nombre AS nombre_producto, p.precio, f.nombre AS nombre_fabricante FROM Producto p
JOIN Fabricante f ON p.codigo_fabricante = f.codigo;

-- 2. Devuelve una lista con el nombre del producto, precio y nombre de fabricante de todos los productos de la base de datos. Ordene el resultado por el nombre del fabricante, por orden alfabético.
SELECT p.nombre AS nombre_producto, p.precio, f.nombre AS nombre_fabricante FROM Producto p
JOIN Fabricante f ON p.codigo_fabricante = f.codigo
ORDER BY f.nombre ASC;

-- 3. Devuelve una lista con el identificador del producto, nombre del producto, identificador del fabricante y nombre del fabricante, de todos los productos de la base de datos.
SELECT p.codigo AS id_producto, p.nombre AS nombre_producto, p.codigo_fabricante AS id_fabricante, f.nombre AS nombre_fabricante FROM Producto p
JOIN Fabricante f ON p.codigo_fabricante = f.codigo;

-- 4. Devuelve el nombre del producto, su precio y el nombre de su fabricante, del producto más barato.
SELECT p.nombre AS nombre_producto, p.precio, f.nombre AS nombre_fabricante FROM Producto p
JOIN Fabricante f ON p.codigo_fabricante = f.codigo
ORDER BY p.precio ASC
LIMIT 1;

-- 5. Devuelve el nombre del producto, su precio y el nombre de su fabricante, del producto más caro.
SELECT p.nombre AS nombre_producto, p.precio, f.nombre AS nombre_fabricante FROM Producto p
JOIN Fabricante f ON p.codigo_fabricante = f.codigo
ORDER BY p.precio DESC
LIMIT 1;

-- 6. Devuelve una lista de todos los productos del fabricante Lenovo.
SELECT p.nombre AS nombre_producto, p.precio FROM Producto p
JOIN Fabricante f ON p.codigo_fabricante = f.codigo
WHERE f.nombre = 'Lenovo';

-- 7. Devuelve una lista de todos los productos del fabricante Crucial que tengan un precio mayor que 200€.
SELECT p.nombre AS nombre_producto, p.precio FROM Producto p
JOIN Fabricante f ON p.codigo_fabricante = f.codigo
WHERE f.nombre = 'Crucial' AND p.precio > 200;






-- COMPOSICIÓN EXTERNA --

-- 1. Devuelve un listado de todos los fabricantes que existen en la base de datos, junto con los productos que tiene cada uno de ellos. El listado deberá mostrar también aquellos fabricantes que no tienen productos asociados.
SELECT f.nombre AS nombre_fabricante, p.nombre AS nombre_producto
FROM Fabricante f
LEFT JOIN Producto p ON f.codigo = p.codigo_fabricante;

-- 2. Devuelve un listado donde sólo aparezcan aquellos fabricantes que no tienen ningún producto asociado.
SELECT f.nombre AS nombre_fabricante
FROM Fabricante f
LEFT JOIN Producto p ON f.codigo = p.codigo_fabricante
WHERE p.codigo IS NULL;
