
USE HOTEL;
-- CREAMOS LA TABLA INVENTARIOS
-- Tabla en la cual se almacenara los datos de los productos fisicos ofrecidos por el hotel
-- los cuales podran estar o no en el inventario dependiendo de la demanda que tenga el hotel
-- LAS SIGLAS IN = INVENTARIO  Y PRFI = PRODUCTOS FISICOS
DROP TABLE IF EXISTS IN_TPRFI;

CREATE TABLE IN_TPRFI(
	PRFI_PRFI  			      	INT        			 NOT NULL 		AUTO_INCREMENT ,
	PRFI_NOMBRE 		      	VARCHAR(50)      NOT NULL										 ,
	PRFI_DESC    		      	VARCHAR(200)     NOT NULL										 ,
	PRFI_COD								VARCHAR(8)			 NOT NULL										 ,
	PRFI_PREC_UNI 	      	DOUBLE(10,5)     NOT NULL										 ,
	PRFI_PREC_TOTA	      	DOUBLE(10,5)     NOT NULL										 ,
	PRFI_CANT  			      	INT				       NOT NULL										 ,
	PRFI_FEC_ULT_IN        	DATE		      														   ,
	PRIMARY KEY (PRFI_PRFI),
	UNIQUE INDEX PRFI_COD_UNIQUE (PRFI_COD ASC)
); 