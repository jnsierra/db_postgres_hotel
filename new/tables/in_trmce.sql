-- CREAMOS LA TABLA REMISIONES para CELULARES
-- Tabla en la cual se almacenaran los datos de los celulares que entran en consignacion
-- 

--DROP TABLE IF EXISTS em_tpara;

CREATE TABLE in_trmce(
   rmce_rmce                SERIAL                       ,
   rmce_refe                int                          ,
   rmce_imei                VARCHAR(150)                 ,
   rmce_iccid               VARCHAR(150)                 ,
   rmce_valor               NUMERIC(50,6)                ,
   rmce_comision            NUMERIC(50,6)                ,
   rmce_tppl                VARCHAR(2)                   ,
   rmce_fcve                date                         ,
   rmce_fcsl                date                         ,
   rmce_fcen                date default NOW()           ,
   rmce_tius_ent            int                          ,
   rmce_tius_sal            int                          ,
   rmce_codigo              VARCHAR(2)                   ,
   rmce_sede                int                          ,
   PRIMARY KEY (rmce_rmce)
);