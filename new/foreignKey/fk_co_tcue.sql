ALTER TABLE co_tcue
ADD FOREIGN KEY (cue_gru)
REFERENCES co_tgru(gru_gru)
;