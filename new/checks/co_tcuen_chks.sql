ALTER TABLE CO_TCUEN
ADD CONSTRAINT CO_ESTADO_CHK 
CHECK (CUEN_ESTADO in ('A','I'))
;