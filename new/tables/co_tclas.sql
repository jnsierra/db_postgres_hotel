CREATE TABLE CO_TCLAS(
CLAS_CLAS                INT              NOT NULL                 , -- Identificador primario de la tabla
CLAS_ESTADO              VARCHAR(1)       NOT NULL DEFAULT('A')    , 
CLAS_NOMBRE		 		 VARCHAR(50)      NOT NULL		   		   , -- 
PRIMARY KEY (CLAS_CLAS)
);