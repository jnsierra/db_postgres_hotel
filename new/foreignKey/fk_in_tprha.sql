ALTER TABLE IN_TPRHA
ADD FOREIGN KEY (PRHA_DSHA)
REFERENCES IN_TDSHA(DSHA_DSHA)
;

ALTER TABLE IN_TPRHA
ADD FOREIGN KEY (prha_tius_crea)
REFERENCES US_TTIUS(TIUS_TIUS)
;

ALTER TABLE IN_TPRHA
ADD FOREIGN KEY (PRHA_TIUS_UPDATE)
REFERENCES US_TTIUS(TIUS_TIUS)
;