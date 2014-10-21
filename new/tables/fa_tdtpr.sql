-- CREAMOS LA TABLA DESCRIPCION DE HABITACIONES
-- Tabla en la cual se almacenara los datos generales de las habitaciones que se encuentran en el hotel

--DROP TABLE IF EXISTS IN_TDSHA; 

CREATE TABLE fa_tdtpr(
    DTPR_DTPR           SERIAL           NOT NULL                 ,
    DTPR_DSKA           INT              NOT NULL                 ,
    DTPR_FACT           INT              NOT NULL                 ,
    DTPR_NUM_PROD       TIMESTAMP        NOT NULL   DEFAULT NOW() ,
    DTPR_CANT           INT              NOT NULL                 ,
    DTPR_VALOR_PR       NUMERIC(50,6)    NOT NULL                 ,
    DTPR_VL_UNI_PROD    NUMERIC(50,6)    NOT NULL                 ,
    DTPR_VALOR_VENTA    NUMERIC(50,6)    NOT NULL                 ,
    DTPR_DESC           VARCHAR(1)       NOT NULL                 , --DESCUENTO
    DTPR_CON_DESC       VARCHAR(1)       NOT NULL   DEFAULT 'N'   ,
    DTPR_VALOR_DESC     VARCHAR(1)       NOT NULL   DEFAULT 0     ,
PRIMARY KEY (DTPR_DTPR)
);