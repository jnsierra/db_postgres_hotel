-- CREAMOS LA TABLA RFFERENCIAS
-- Tabla en la cual se almacena la informacion de las referencias.
-- 

--DROP TABLE IF EXISTS em_tsede;

CREATE TABLE in_trefe(
   refe_refe                SERIAL                          ,  
   refe_desc              varchar(200)                      , 
   refe_estado            varchar(200) default  'A'         , 
   refe_came              varchar(20)                       , 
   refe_memori            varchar(20)                       ,
   refe_pantalla          varchar(20)                       ,
   
   PRIMARY KEY (refe_refe)	
); 