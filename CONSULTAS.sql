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
