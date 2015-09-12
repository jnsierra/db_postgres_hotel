ALTER TABLE IN_TMARCA
ADD CONSTRAINT MARCA_NOMBRE_UNIQUE 
UNIQUE (MARCA_NOMBRE)
;

ALTER TABLE IN_TMARCA
ADD CONSTRAINT MARCA_DESCR_UNIQUE 
UNIQUE (MARCA_DESCR)
;



ALTER TABLE IN_TREFE
ADD CONSTRAINT REFE_DESC_UNIQUE 
UNIQUE (REFE_DESC)
;

ALTER TABLE IN_TCATE
ADD CONSTRAINT CATE_DESC_UNIQUE 
UNIQUE (CATE_DESC)
;


ALTER TABLE IN_TDSKA
ADD CONSTRAINT DSKA_REPITE_PROD_UNIQUE 
UNIQUE (DSKA_MARCA, DSKA_REFE, DSKA_CATE)
;