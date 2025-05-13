USE `marcas_tec`;
DROP procedure IF EXISTS `insertar_fabricante`;

DELIMITER $$
USE `marcas_tec`$$
CREATE PROCEDURE insertar_fabricante (
	IN p_nombre VARCHAR (100)
)
BEGIN
	INSERT INTO fabricante (nombre)
    VALUES (p_nombre);
    
END$$

DELIMITER ;

USE `marcas_tec`;
DROP procedure IF EXISTS `insertar_producto`;

DELIMITER $$
USE `marcas_tec`$$
CREATE PROCEDURE insertar_producto (
	IN p_nombre VARCHAR (100),
    IN p_precio double,
    IN p_codigo_fabricante INT (10)
)
BEGIN
	INSERT INTO producto (nombre, precio, codigo_fabricante)
    VALUES (p_nombre, p_precio, p_codigo_fabricante);
    
END$$

DELIMITER ;