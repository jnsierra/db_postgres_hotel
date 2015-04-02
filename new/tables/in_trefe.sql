-- CREAMOS LA TABLA RFFERENCIAS
-- Tabla en la cual se almacena la informacion de las referencias.
-- 

--DROP TABLE IF EXISTS in_trefe;

CREATE TABLE in_trefe(
   refe_refe              SERIAL                        ,  
   refe_desc              varchar(200)                  , 
   refe_estado            varchar(200) default  'A'     , 
   refe_came              int                      		, 
   refe_memori            int                       	,
   refe_pantalla          int                      		,
   PRIMARY KEY (refe_refe)	
); 
