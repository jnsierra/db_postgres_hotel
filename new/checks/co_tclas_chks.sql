ALTER TABLE CO_TCLAS 
ADD CONSTRAINT CO_ESTADO_CHK 
CHECK (CLAS_ESTADO in ('A','I'));
ALTER TABLE CO_TCLAS 
ADD CONSTRAINT CO_NATURALEZA_CHK 
CHECK (CLAS_NATURALEZA in ('D','C'));