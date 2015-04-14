ALTER TABLE FA_TFACT 
ADD CONSTRAINT FACT_TIPO_PAGO_CHK 
CHECK (FACT_TIPO_PAGO in ('E','T'))
;

ALTER TABLE FA_TFACT 
ADD CONSTRAINT FACT_ESTADO_CHK 
CHECK (FACT_ESTADO in ('P','C','U'))
;

ALTER TABLE FA_TFACT 
ADD CONSTRAINT FACT_NATURALEZA_CHK 
CHECK (FACT_NATURALEZA in ('E','I'))
;

ALTER TABLE FA_TFACT 
ADD CONSTRAINT FACT_DEVOLUCION_CHK 
CHECK (FACT_DEVOLUCION in ('S','N'))
;