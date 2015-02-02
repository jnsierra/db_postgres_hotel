ALTER TABLE co_tsbc
ADD FOREIGN KEY (sbc_cue)
REFERENCES co_tcue(cue_cue)
;