ALTER TABLE CO_TCUEN
ADD CONSTRAINT CO_ESTADO_CHK 
CHECK (CUEN_ESTADO in ('A','I'));
ALTER TABLE CO_TCUEN 
ADD CONSTRAINT CO_NATURALEZA_CHK 
CHECK (CUEN_NATURALEZA in ('D','C'));