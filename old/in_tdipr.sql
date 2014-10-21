
USE HOTEL;
-- CREAMOS LA TABLA DETALLE DE INGRESO DE PRODUCTOS
-- Tabla en la cual se almacenara los datos del ingreso de todos los productos
-- que ofrece el hotel
-- LAS SIGLAS IN = INVENTARIO  Y DTPR = DETALLE DE INGRESO DE PRODUCTOS
DROP TABLE IF EXISTS IN_TDIPR;

CREATE TABLE IN_TDIPR(
	DIPR_DIPR  			      	INT        			 NOT NULL 		AUTO_INCREMENT ,		-- IDENTIFICADOR DE LA TABLA
	DIPR_PRFI 		      		INT					     NOT NULL										 ,		-- IDENTIFICADOR DE LA TABLA PRODUCTOS FISICOS (fk)
	DIPR_USUA    		      	INT 			       NOT NULL										 ,    -- USUARIO QUE AGREGO LOS PORDUCTOS AL INVENTARIO
	DIPR_FECHA_IN 	      	TIMESTAMP 			 NOT NULL DEFAULT NOW()   	 ,    -- FECHA DE INGRESO DE LOS PRODUCTOS
	DIPR_CANT				      	INT              NOT NULL										 ,    -- CANTIDAD DE PRODUCTOS QUE INGRESARON AL INVENTARIO
	DIPR_VAL_UNI_ADQ 			  DOUBLE(10,5)     NOT NULL							 			 ,    -- VALOR UNITARIO POR EL CUAL SE ADQUIRIO EL PRODUCTO
	DIPR_VAL_TOT_ADQ       	DOUBLE(10,5)     NOT NULL									   ,    -- VALOR TOTAL POR EL CUAL SE ADQUIRIERON LOS PRODUCTOS
	PRIMARY KEY (DIPR_DIPR)
); 