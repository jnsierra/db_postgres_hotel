ALTER TABLE IN_TPRPR
ADD FOREIGN KEY (prpr_dska)
REFERENCES in_tdska(dska_dska)
;

ALTER TABLE IN_TPRPR
ADD FOREIGN KEY (prpr_tius_crea)
REFERENCES US_TTIUS(TIUS_TIUS)
;

ALTER TABLE IN_TPRPR
ADD FOREIGN KEY (prpr_tius_update)
REFERENCES US_TTIUS(TIUS_TIUS)
;

ALTER TABLE IN_TPRPR
ADD FOREIGN KEY (prpr_sede)
REFERENCES em_tsede(sede_sede)
;