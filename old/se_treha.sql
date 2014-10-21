USE HOTEL;
-- CREAMOS LA TABLA RESERVA DE HABITACIONES
-- Tabla en la cual se almacenara la reservacion de habitaciones
-- que ofrece el hotel
-- LAS SIGLAS SE = SERVICIO  Y REHA = RESERVACION DE HABITACIONES 
DROP TABLE IF EXISTS SE_TREHA;

CREATE TABLE SE_TREHA(
	REHA_REHA        	    INT        			          NOT NULL 		AUTO_INCREMENT ,	-- IDENTIFICADOR DE LA TABLA
	REHA_IGHA 		        INT					              NOT NULL									 ,	-- NUMERO DE LA HABITACION DADO POR EL HOTEL
	REHA_INI_RESERVA  	  DATE  			              NOT NULL									 ,  -- NUMERO DE CAMAS SENCILLAS QUE TIENE LA HABITACION
	REHA_FIN_RESERVA      DATE                      NOT NULL                   ,  -- NUMERO DE CAMAS DOBLES QUE TIENE LA HABITACION
	REHA_CLIE         	  INT                       NOT NULL                 	 ,  -- INDICA SI LA HABITACION TIENE TELEVISION SI(S) NO(N)
  REHA_ESTA             VARCHAR(2) DEFAULT 'A'    NOT NULL                   ,  -- INDICA EL ESTADO DE LA RESERVA (A) activa (X) cancelada F(Facturada) 
	PRIMARY KEY (REHA_REHA)
); 