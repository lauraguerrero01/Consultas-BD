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


