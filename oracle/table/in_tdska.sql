-- CREAMOS LA TABLA DESCRIPCION KARDEX
-- Tabla en la cual se almacenara los datos de la descripcion del kardex de cada producto

--DROP TABLE IF EXISTS IN_TDSKA; 


CREATE TABLE IN_TDSKA(
DSKA_DSKA                 NUMBER(15,2)                   ,
DSKA_REFE                 VARCHAR2(10)                   ,
DSKA_COD                  VARCHAR2(10)                   ,
DSKA_NOM_PROD             VARCHAR2(50)                   ,
DSKA_DESC                 VARCHAR2(100)                  ,
DSKA_IVA                  VARCHAR2(1)                    ,
DSKA_PORC_IVA             NUMBER(10,2)                   ,
DSKA_MARCA                VARCHAR2(50)                   
)
;