USE HOTEL;
-- CREAMOS LA TABLA CLIENTE
-- Tabla en la cual identificara cuales son los clientes del hotel

DROP TABLE IF EXISTS US_TCLIEN; 

CREATE TABLE US_TCLIEN(
	CLIEN_CLIEN							INT              NOT NULL AUTO_INCREMENT	,   -- Llave primaria de la tabla
	CLIEN_PERS  			      INT              NOT NULL 								,   -- Llave foranea de la tabla us_tpers
	PRIMARY KEY (CLIEN_CLIEN)
);