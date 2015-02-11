--
--Llave relacional entre la subcuenta y la cuenta
--
ALTER TABLE co_tsbc
ADD FOREIGN KEY (sbc_cue)
REFERENCES co_tcue(cue_cue)
;
--
--Llave relacional entre la subcuenta y el grugo
--
ALTER TABLE co_tsbc
ADD FOREIGN KEY (sbc_gru)
REFERENCES co_tgru(gru_gru)
;
--
--Llave relacional entre la subcuenta y la clase
--
ALTER TABLE co_tsbc
ADD FOREIGN KEY (sbc_clas)
REFERENCES co_tclas(clas_clas)
;