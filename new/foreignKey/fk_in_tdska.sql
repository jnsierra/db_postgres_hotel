ALTER TABLE IN_TDSKA
ADD FOREIGN KEY (DSKA_CATE)
REFERENCES IN_TCATE(cate_cate)
;

ALTER TABLE in_tdska
ADD FOREIGN KEY (dska_sbcu)
REFERENCES co_tsbcu(sbcu_sbcu)
;

ALTER TABLE in_tdska
ADD FOREIGN KEY (dska_refe)
REFERENCES in_trefe(refe_refe)
;