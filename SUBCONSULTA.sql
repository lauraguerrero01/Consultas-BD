-- SUBCONSULTAS (EN LA CLAUSULA WHERE)

-- 1. Devuelve todos los productos del fabricante Lenovo. (Sin utilizar INNER JOIN).
SELECT * FROM Producto WHERE codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = "Lenovo");

-- 2. Devuelve todos los datos de los productos que tienen el mismo precio que el producto más caro del fabricante Lenovo. (Sin utilizar INNER JOIN).
SELECT * FROM Producto WHERE precio = (SELECT MAX(p.precio) FROM Producto p 
WHERE p.codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = 'Lenovo'));

-- 3. Lista el nombre del producto más caro del fabricante Lenovo.
SELECT nombre FROM producto WHERE codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = 'Lenovo')
ORDER BY precio DESC
LIMIT 1;

-- 4. Lista el nombre del producto más barato del fabricante Hewlett-Packard.
SELECT nombre FROM producto WHERE codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = 'Hewlett-Packard')
ORDER BY precio ASC
LIMIT 1;

-- 5. Devuelve todos los productos de la base de datos que tienen un precio mayor o igual al producto más caro del fabricante Lenovo.
SELECT * FROM Producto WHERE precio >= (SELECT MAX(p.precio) FROM Producto p 
WHERE p.codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = 'Lenovo'));

-- 6. Lista todos los productos del fabricante Asus que tienen un precio superior al precio medio de todos sus productos.
SELECT * FROM Producto WHERE codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = 'Asus')
AND precio > (SELECT AVG(p.precio) FROM Producto p WHERE p.codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = 'Asus'));


-- SUBCONSULTAS CON ALL Y ANY

-- 7. Devuelve el producto más caro que existe en la tabla producto sin hacer uso de MAX, ORDER BY ni LIMIT
SELECT nombre, precio FROM producto WHERE precio >= ALL (SELECT precio FROM producto);

-- 8. Devuelve el producto más barato que existe en la tabla producto sin hacer uso de MIN, ORDER BY ni LIMIT
SELECT nombre, precio FROM producto WHERE precio <= ALL (SELECT precio FROM producto);

-- 9. Devuelve los nombres de los fabricantes que tienen productos asociados. (Utilizando ALL o ANY)
SELECT f.nombre AS nombre_fabricante FROM Fabricante f WHERE f.codigo = ANY (SELECT p.codigo_fabricante FROM Producto p);

-- 10. Devuelve los nombres de los fabricantes que no tienen productos asociados. (Utilizando ALL o ANY). 
SELECT f.nombre AS nombre_fabricante FROM Fabricante f WHERE f.codigo <> ALL (SELECT p.codigo_fabricante FROM Producto p);


-- SUBCONSULTAS CON IN Y NOT IN

-- 11. Devuelve los nombres de los fabricantes que tienen productos asociados. (Utilizando IN o NOT IN).
SELECT DISTINCT f.nombre AS nombre_fabricante FROM fabricante f WHERE f.codigo IN (SELECT DISTINCT codigo_fabricante FROM producto);
    
-- 12. Devuelve los nombres de los fabricantes que no tienen productos asociados. (Utilizando IN o NOT IN)
SELECT f.nombre AS nombre_fabricante FROM fabricante f WHERE f.codigo NOT IN (SELECT DISTINCT codigo_fabricante FROM producto WHERE codigo_fabricante IS NOT NULL);


-- SUBCONSULTAS CON EXISTS Y NOT EXISTS

-- 13. Devuelve los nombres de los fabricantes que tienen productos asociados. (Utilizando EXISTS o NOT EXISTS).
SELECT f.nombre FROM fabricante f WHERE EXISTS (SELECT * FROM producto p WHERE p.codigo_fabricante = f.codigo);

-- 14. Devuelve los nombres de los fabricantes que no tienen productos asociados.(Utilizando EXISTS o NOT EXISTS).
SELECT f.nombre FROM fabricante f WHERE NOT EXISTS (SELECT * FROM producto p WHERE p.codigo_fabricante = f.codigo);


-- SUBCONSULTAS CORRELACIONADAS

-- 15. Lista el nombre de cada fabricante con el nombre y el precio de su producto más caro.
SELECT f.nombre AS nombre_fabricante,(SELECT p.nombre FROM producto p WHERE p.codigo_fabricante = f.codigo ORDER BY p.precio DESC LIMIT 1) AS nombre_producto_mas_caro,
(SELECT p.precio FROM producto p WHERE p.codigo_fabricante = f.codigo ORDER BY p.precio DESC LIMIT 1) AS precio_producto_mas_caro FROM fabricante f;

-- 16. Devuelve un listado de todos los productos que tienen un precio mayor o igual a la media de todos los productos de su mismo fabricante.
SELECT p.nombre AS nombre_producto, p.precio, f.nombre AS nombre_fabricante FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo
WHERE p.precio >= (SELECT AVG(precio) FROM Producto WHERE codigo_fabricante = p.codigo_fabricante);

-- 17. Lista el nombre del producto más caro del fabricante Lenovo.
SELECT p.nombre AS nombre_producto FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre = "Lenovo" ORDER BY p.precio DESC LIMIT 1;


-- SUBCONSULTAS (EN LA CLAUSULA HAVING)

-- 18. Devuelve un listado con todos los nombres de los fabricantes que tienen el mismo número de productos que el fabricante Lenovo.
SELECT f.nombre AS nombre_fabricante FROM fabricante f JOIN Producto p ON f.codigo = p.codigo_fabricante 
GROUP BY f.nombre HAVING COUNT(p.codigo) = (SELECT COUNT(p2.codigo) FROM Producto p2 
WHERE p2.codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = 'Lenovo'));