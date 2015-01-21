ALTER TABLE in_tcate 
ADD CONSTRAINT cate_estado_chk 
CHECK (cate_estado in ('A','I'));

ALTER TABLE in_tcate 
ADD CONSTRAINT cate_runic_chk 
CHECK (cate_runic in ('S','N'));

ALTER TABLE in_tcate 
ADD CONSTRAINT cate_feven_chk 
CHECK (cate_feven in ('S','N'));