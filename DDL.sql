DROP DATABASE if exists marcas_tec;
CREATE DATABASE marcas_tec;

USE marcas_tec;

CREATE TABLE Fabricante (
	codigo INT (10) NOT NULL auto_increment,
	nombre varchar (100),
    PRIMARY KEY (codigo)
);

CREATE TABLE Producto (
	codigo INT (10) NOT NULL auto_increment,
	nombre varchar (100),
	precio double,
	codigo_fabricante INT (10),
	PRIMARY KEY (codigo)

);

ALTER TABLE Producto
ADD constraint FK_codigofabricante_Producto
foreign key (codigo_fabricante) REFERENCES Fabricante (codigo);
