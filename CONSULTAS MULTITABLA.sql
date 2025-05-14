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

-- 8. Productos de los fabricantes Asus, Hewlett-Packard y Seagate. Sin utilizar el operador IN.
SELECT * FROM fabricante WHERE nombre = "Asus" OR nombre = "Hewlett-Packard" OR nombre = "Seagate";

-- 9. Productos de los fabricantes Asus, Hewlett-Packard y Seagate. Utilizando el operador IN
SELECT * FROM fabricante WHERE nombre IN ("Asus", "Hewlett-Packard", "Seagate");

-- 10. Nombre y precio de todos los productos de los fabricantes cuyo nombre termine por la vocal e.
SELECT f.nombre AS nombre_fabricante, p.nombre AS nombre_producto, p.precio FROM Producto p JOIN Fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre LIKE '%e';

-- 11. Nombre y precio de todos los productos cuyo nombre de fabricante contenga el carácter w en su nombre.
SELECT f.nombre AS nombre_fabricante, p.nombre AS nombre_producto, p.precio FROM Producto p JOIN Fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre LIKE '%w%';

-- 12. Nombre de producto, precio y nombre de fabricante, de todos los productos que tengan un precio mayor o igual a 180€. Ordene el resultado en primer lugar por el precio (en orden descendente) y en segundo lugar por el nombre (en orden ascendente).
SELECT p.nombre AS nombre_producto, precio * 0.92 AS precio_EUR, f.nombre AS nombre_fabricante FROM Producto p JOIN Fabricante f ON p.codigo_fabricante = f.codigo WHERE p.precio >= 180 ORDER BY p.precio DESC, p.nombre ASC;

-- 13. Identificador y nombre de fabricante, solamente de aquellos fabricantes que tienen productos asociados en la base de datos.
SELECT DISTINCT f.codigo AS codigo_fabricante, f.nombre AS nombre_fabricante FROM Fabricante f JOIN Producto p ON f.codigo = p.codigo_fabricante;


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
