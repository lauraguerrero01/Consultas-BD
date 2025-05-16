CALL insertar_fabricante ("Asus");
CALL insertar_fabricante ("Lenovo");
CALL insertar_fabricante ("Hewlett-Packard");
CALL insertar_fabricante ("Samsung");
CALL insertar_fabricante ("Seagate");
CALL insertar_fabricante ("Crucial");
CALL insertar_fabricante ("Gigabyte");
CALL insertar_fabricante ("Huawei");
CALL insertar_fabricante ("Xiaomi");

CALL insertar_producto ("Disco duro SATA3 1TB", 86.99, 5);
CALL insertar_producto ("Memoria RAM DDR4 8GB", 120, 6);
CALL insertar_producto ("Disco SSD 1 TB", 150.99, 4);
CALL insertar_producto ("GeForce GTX 1050Ti", 185,7);
CALL insertar_producto("GeForce GTX 1080 Xtreme", 755, 6);
CALL insertar_producto("Monitor 24 LED Full HD", 202, 1);
CALL insertar_producto("Monitor 27 LED Full HD", 245.99, 1);
CALL insertar_producto("Portátil Yoga 520", 559, 2);
CALL insertar_producto("Portátil Ideapd 320", 444, 2);
CALL insertar_producto("Impresora HP Deskjet 3720", 59.99, 3);
CALL insertar_producto("Impresora HP Laserjet Pro M26nw", 180, 3);

------------------------------------------------------------------------- 

-- CONSULTAS SOBRE UNA TABLA --

-- 1. Nombre de todos los productos.
SELECT nombre FROM producto;

-- 2. Nombres y precios de todos los productos.
SELECT nombre, precio FROM producto;

-- 3. Todas las columnas de la tabla producto.
SELECT * FROM  Producto;

-- 4. Precio en euros y el precio en dólares.
SELECT nombre, precio * 0.92 AS EUR, precio AS USD FROM producto;

-- 5. Precio en euros y el precio en dólares con alias.
SELECT nombre AS nombre_de_producto, precio * 0.92 AS euros, precio AS dólares FROM producto;

-- 6. Nombres en mayúscula.
SELECT UPPER(nombre) AS nombre_mayuscula, precio FROM producto;

-- 7. Nombres en minuscula. 
SELECT LOWER(nombre) AS nombre_minuscula, precio FROM producto;

-- 8. Nombre y caracteres del nombre del fabricante.
SELECT nombre, UPPER(SUBSTRING(nombre, 1, 2)) AS primeros_dos_caracteres_mayuscula FROM fabricante;

-- 9. Redondeo valor del precio
SELECT nombre, ROUND(precio) AS precio_redondeado FROM producto;

-- 10. Precio trucado
SELECT nombre, TRUNCATE(precio, 0) AS precio_truncado FROM producto;

-- 11. Identificador fabricantes que tienen productos en la tabla producto.
SELECT codigo_fabricante FROM producto;

-- 12. Identificador fabricantes que tienen productos en la tabla producto eliminando los repetidos.
SELECT DISTINCT codigo_fabricante FROM producto;

-- 13. Nombres de fabricantes ordenados de forma ascendente.
SELECT nombre FROM fabricante ORDER BY nombre ASC;

-- 14. Nombre de fabricantes ordenados de forma descendente.
SELECT nombre FROM fabricante ORDER BY nombre DESC;

-- 15. Nombres de los productos ascendente y  precio descendente.
SELECT nombre, precio FROM producto ORDER BY nombre ASC, precio DESC;

-- 16. 5 primeras filas de la tabla fabricante.
SELECT nombre FROM fabricante limit 5;

-- 17. 2 filas a partir de la cuarta fila de la tabla fabricante.
SELECT * FROM fabricante LIMIT 2 OFFSET 3;

-- 18. Nombre y el precio del producto más barato. 
SELECT nombre, precio FROM producto ORDER BY precio ASC LIMIT 1;

-- 19. Lista el nombre y el precio del producto más caro (Utilice solamente las cláusulas ORDER BY y LIMIT).
SELECT nombre, precio FROM Producto
ORDER BY precio DESC
LIMIT 1;

-- 20. Lista el nombre de todos los productos del fabricante cuyo identificador de fabricante es igual a 2.
SELECT nombre FROM Producto
WHERE codigo_fabricante = 2;

-- 21. Lista el nombre de los productos que tienen un precio menor o igual a 120€.
SELECT nombre, precio * 0.92 AS EUR FROM Producto
WHERE precio <= 120;

-- 22. Lista el nombre de los productos que tienen un precio mayor o igual a 400€.
SELECT nombre, precio * 0.92 AS EUR FROM Producto
WHERE precio * 0.92 <= 400;

-- 23. Lista el nombre de los productos que no tienen un precio mayor o igual a 400€.
SELECT nombre, precio * 0.92 AS EUR FROM Producto
WHERE precio * 0.92 < 400;

-- 24. Lista todos los productos que tengan un precio entre 80€ y 300€. Sin utilizar el operador BETWEEN.
SELECT nombre, precio * 0.92 AS EUR FROM Producto
WHERE precio >= 80 AND precio <= 300;

-- 25. Lista todos los productos que tengan un precio entre 60€ y 200€. Utilizando el operador BETWEEN.
SELECT nombre, precio * 0.92 AS EUR FROM Producto
WHERE precio BETWEEN 60 AND 200;

-- 26. Lista todos los productos que tengan un precio mayor que 200€ y que el identificador de fabricante sea igual a 6.
SELECT nombre, precio * 0.92 AS EUR, codigo_fabricante FROM Producto
WHERE precio > 200 AND codigo_fabricante = 6;

-- 27. Lista todos los productos donde el identificador de fabricante sea 1, 3 o 5. Sin utilizar el operador IN.
SELECT nombre, codigo_fabricante FROM Producto
WHERE codigo_fabricante = 1 OR codigo_fabricante = 3 OR codigo_fabricante = 5;

-- 28. Lista todos los productos donde el identificador de fabricante sea 1, 3 o 5. Utilizando el operador IN.
SELECT nombre, codigo_fabricante FROM Producto
WHERE codigo_fabricante IN (1, 3, 5);

-- 29. Lista el nombre y el precio de los productos en céntimos (Habrá que multiplicar por 100 el valor del precio). Cree un alias para la columna que contiene el precio que se llame céntimos.
SELECT nombre, precio * 100 AS céntimos FROM Producto;

-- 30. Lista los nombres de los fabricantes cuyo nombre empiece por la letra S.
SELECT nombre FROM Fabricante
WHERE nombre LIKE 'S%';

-- 31. Lista los nombres de los fabricantes cuyo nombre termine por la vocal e
SELECT nombre FROM Fabricante
WHERE nombre LIKE '%e';

-- 32. Lista los nombres de los fabricantes cuyo nombre contenga el carácter w.
SELECT nombre FROM Fabricante
WHERE nombre LIKE '%w%';

-- 33. Lista los nombres de los fabricantes cuyo nombre sea de 4 caracteres.
SELECT nombre FROM Fabricante
WHERE nombre LIKE '____';

-- 34. Devuelve una lista con el nombre de todos los productos que contienen la cadena Portátil en el nombre.
SELECT nombre FROM Producto
WHERE nombre LIKE '%Portátil%';

-- 35.  Devuelve una lista con el nombre de todos los productos que contienen la cadena Monitor en el nombre y tienen un precio inferior a 215 €.
SELECT nombre, precio * 0.92 AS EUR FROM Producto
WHERE nombre LIKE '%Monitor%' AND precio < 215;

-- 36. Lista el nombre y el precio de todos los productos que tengan un precio mayor o igual a 180€. Ordene el resultado en primer lugar por el precio (en orden descendente) y en segundo lugar por el nombre (en orden ascendente).
SELECT nombre, precio * 0.92 AS EUR FROM Producto
WHERE precio >= 180
ORDER BY precio DESC, nombre ASC;


--  1.1.4. CONSULTAS MULTITABLA --

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


-- 1.1.5 COMPOSICIÓN EXTERNA --

-- 1. Devuelve un listado de todos los fabricantes que existen en la base de datos, junto con los productos que tiene cada uno de ellos. El listado deberá mostrar también aquellos fabricantes que no tienen productos asociados.
SELECT f.nombre AS nombre_fabricante, p.nombre AS nombre_producto
FROM Fabricante f
LEFT JOIN Producto p ON f.codigo = p.codigo_fabricante;

-- 2. Devuelve un listado donde sólo aparezcan aquellos fabricantes que no tienen ningún producto asociado.
SELECT f.nombre AS nombre_fabricante
FROM Fabricante f
LEFT JOIN Producto p ON f.codigo = p.codigo_fabricante
WHERE p.codigo IS NULL;


-- 1.1.6 CONSULTAS RESUMEN --

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


-- 1.1.7 SUBCONSULTAS (EN LA CLÁUSULA WHERE) --

--  CON OPERADORES BÁSICOS DE COMPARACIÓN 

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


