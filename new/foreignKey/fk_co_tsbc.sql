ALTER TABLE co_tsbc
ADD FOREIGN KEY (sbc_cue)
REFERENCES co_tcue(cue_cue);
ALTER TABLE co_tsbc
ADD FOREIGN KEY (sbc_gru)
REFERENCES co_tgru(gru_gru);
ALTER TABLE co_tsbc
ADD FOREIGN KEY (sbc_clas)
REFERENCES co_tclas(clas_clas);