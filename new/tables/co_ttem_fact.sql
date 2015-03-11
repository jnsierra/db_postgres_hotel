--
--Tabla temporal para almacenar los datos basicos de los prodtos facturados 
--

CREATE TABLE CO_TTEM_FACT(
    TEM_FACT_TRANS                 INT                 NOT NULL                   ,
    TEM_FACT_DSKA                  VARCHAR(10)         NOT NULL                   ,
    TEM_FACT_VALOR                 VARCHAR(250)        NOT NULL                   ,
);
);