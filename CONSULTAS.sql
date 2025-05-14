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

