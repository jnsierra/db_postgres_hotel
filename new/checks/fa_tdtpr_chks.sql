ALTER TABLE fa_tdtpr 
ADD CONSTRAINT dtpr_con_desc_chk 
CHECK (dtpr_con_desc in ('S','N'))
;