-- 1. Calcula el número total de productos que hay en la tabla productos.
SELECT COUNT(*) AS total_productos FROM producto;

-- 2. Calcula el número total de fabricantes que hay en la tabla fabricante.
SELECT COUNT(*) AS total_fabricantes FROM fabricante;

-- 3. Calcula el número de valores distintos de identificador de fabricante aparecen en la tabla producto
SELECT COUNT(DISTINCT codigo_fabricante ) AS total_fabricantes_unicos
FROM producto;	

-- 4. Calcula la media del precio de todos los productos.
SELECT AVG(precio) AS media_precio FROM producto;

-- 5. Calcula el precio más barato de todos los productos.
SELECT MIN(precio) AS precio_mas_barato FROM producto;

-- 6. Calcula el precio más caro de todos los productos.
SELECT MAX(precio) AS precio_mas_caro FROM producto;

-- 7. Lista el nombre y el precio del producto más barato.
SELECT p.nombre, p.precio FROM producto p ORDER BY p.precio ASC LIMIT 1;

-- 8. Lista el nombre y el precio del producto más caro.
SELECT p.nombre, p.precio FROM producto p ORDER BY p.precio DESC LIMIT 1;

-- 9. Calcula la suma de los precios de todos los productos.
SELECT SUM(precio) AS precio_total FROM producto;

-- 10. Calcula el número de productos que tiene el fabricante Asus.
SELECT COUNT(p.codigo) AS total_productos_asus FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre = 'Asus';

-- 11. Calcula la media del precio de todos los productos del fabricante Asus.
SELECT AVG(p.precio) AS media_precio_asus FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre = 'Asus';

-- 12. Calcula el precio más barato de todos los productos del fabricante Asus.
SELECT MIN(p.precio) AS precio_mas_barato_asus FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre = 'Asus';

-- 13. Calcula el precio más caro de todos los productos del fabricante Asus.
SELECT MAX(p.precio) AS precio_mas_barato_asus FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre = 'Asus';

-- 14. Calcula la suma de todos los productos del fabricante Asus.
SELECT SUM(p.precio) AS precio_mas_barato_asus FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre = 'Asus';

-- 15. Muestra el precio máximo, precio mínimo, precio medio y el número total de productos que tiene el fabricante Crucial.
SELECT MAX(p.precio) AS precio_maximo, MIN(p.precio) AS precio_minimo, AVG(p.precio) AS precio_medio, COUNT(p.codigo) AS total_productos
FROM Producto p WHERE p.codigo_fabricante = 2;
    
-- 16. Muestra el número total de productos que tiene cada uno de los fabricantes. El listado también debe incluir los fabricantes que no tienen ningún producto. El resultado mostrará dos columnas, una con el nombre del fabricante y otra con el número de productos que tiene. Ordene el resultado descendentemente por el número de productos.
SELECT f.nombre AS nombre_fabricante, COUNT(p.codigo) AS total_productos FROM fabricante f LEFT JOIN Producto p 
ON f.codigo = p.codigo_fabricante GROUP BY f.nombre
ORDER BY total_productos DESC;
    
-- 17. Muestra el precio máximo, precio mínimo y precio medio de los productos de cada uno de los fabricantes. El resultado mostrará el nombre del fabricante junto con los datos que se solicitan.
SELECT f.nombre AS nombre_fabricante, MAX(p.precio) AS precio_maximo, MIN(p.precio) AS precio_minimo, AVG(p.precio) AS precio_medio
FROM fabricante f JOIN Producto p ON f.codigo = p.codigo_fabricante
GROUP BY f.nombre;
    
-- 18. Muestra el precio máximo, precio mínimo, precio medio y el número total de productos de los fabricantes que tienen un precio medio superior a 200€. No es necesario mostrar el nombre del fabricante, con el identificador del fabricante es suficiente.
SELECT p.codigo_fabricante AS id_fabricante, MAX(p.precio) * 0.92 AS precio_maximo_EUR, MIN(p.precio) * 0.92 AS precio_minimo_EUR,
AVG(p.precio) * 0.92 AS precio_medio_EUR, COUNT(p.codigo) AS total_productos FROM Producto p
GROUP BY p.codigo_fabricante HAVING AVG(p.precio) * 0.92 > 200;
    
-- 19. Muestra el nombre de cada fabricante, junto con el precio máximo, precio mínimo, precio medio y el número total de productos de los fabricantes que tienen un precio medio superior a 200€. Es necesario mostrar el nombre del fabricante.
SELECT f.nombre AS nombre_fabricante, MAX(p.precio) * 0.92 AS precio_maximo_EUR, MIN(p.precio) * 0.92 AS precio_minimo_EUR,
AVG(p.precio) * 0.92 AS precio_medio_EUR, COUNT(p.codigo) AS total_productos
FROM fabricante f JOIN Producto p ON f.codigo = p.codigo_fabricante GROUP BY f.nombre
HAVING AVG(p.precio) * 0.92 > 200;
    
-- 20. Calcula el número de productos que tienen un precio mayor o igual a 180€.
SELECT COUNT(codigo) AS total_productos_mayor_igual_180 FROM Producto
WHERE precio * 0.92 >= 180;

-- 21. Calcula el número de productos que tiene cada fabricante con un precio mayor o igual a 180€.
SELECT f.nombre AS nombre_fabricante, COUNT(p.codigo) AS total_productos_mayor_igual_180 FROM fabricante f
JOIN Producto p ON f.codigo = p.codigo_fabricante WHERE p.precio * 0.92 >= 180 GROUP BY f.nombre;
    
-- 22. Lista el precio medio los productos de cada fabricante, mostrando solamente el identificador del fabricante.
SELECT p.codigo_fabricante AS id_fabricante, AVG(p.precio) AS precio_medio FROM Producto p
GROUP BY p.codigo_fabricante;

-- 23. Lista el precio medio los productos de cada fabricante, mostrando solamente el nombre del fabricante.
SELECT f.nombre AS nombre_fabricante, AVG(p.precio) AS precio_medio FROM fabricante f
JOIN Producto p ON f.codigo = p.codigo_fabricante GROUP BY f.nombre;

-- 24. Lista los nombres de los fabricantes cuyos productos tienen un precio medio mayor o igual a 150€.
SELECT f.nombre AS nombre_fabricante FROM fabricante f JOIN Producto p ON f.codigo = p.codigo_fabricante
GROUP BY f.nombre HAVING AVG(p.precio) * 0.92 >= 150;

-- 25. Devuelve un listado con los nombres de los fabricantes que tienen 2 o más productos.
SELECT f.nombre AS nombre_fabricante FROM fabricante f JOIN Producto p ON f.codigo = p.codigo_fabricante
GROUP BY f.nombre HAVING COUNT(p.codigo) >= 2;

-- 26. Devuelve un listado con los nombres de los fabricantes y el número de productos que tiene cada uno con un precio superior o igual a 220 €. No es necesario mostrar el nombre de los fabricantes que no tienen productos que cumplan la condición.
SELECT f.nombre AS nombre, COUNT(p.codigo) AS total FROM fabricante f JOIN Producto p ON f.codigo = p.codigo_fabricante
WHERE p.precio * 0.92 >= 220 GROUP BY f.nombre;

-- 27. Devuelve un listado con los nombres de los fabricantes y el número de productos que tiene cada uno con un precio superior o igual a 220 €. El listado debe mostrar el nombre de todos los fabricantes, es decir, si hay algún fabricante que no tiene productos con un precio superior o igual a 220€ deberá aparecer en el listado con un valor igual a 0 en el número de productos.
SELECT f.nombre AS nombre, COUNT(p.codigo) AS total FROM fabricante f LEFT JOIN Producto p ON f.codigo = p.codigo_fabricante 
AND p.precio * 0.92 >= 220 GROUP BY f.nombre 
ORDER BY nombre;

-- 28. Devuelve un listado con los nombres de los fabricantes donde la suma del precio de todos sus productos es superior a 1000 €.
SELECT f.nombre AS nombre_fabricante FROM fabricante f JOIN Producto p ON f.codigo = p.codigo_fabricante
GROUP BY f.nombre HAVING SUM(p.precio) * 0.92 > 1000;

-- 29. Devuelve un listado con el nombre del producto más caro que tiene cada fabricante. El resultado debe tener tres columnas: nombre del producto, precio y nombre del fabricante. El resultado tiene que estar ordenado alfabéticamente de menor a mayor por el nombre del fabricante.
SELECT p.nombre AS nombre_producto, p.precio, f.nombre AS nombre_fabricante FROM Producto p JOIN fabricante f 
ON p.codigo_fabricante = f.codigo WHERE (p.codigo_fabricante, p.precio) IN (SELECT codigo_fabricante, MAX(precio) FROM Producto
GROUP BY codigo_fabricante)
ORDER BY nombre_fabricante ASC;


