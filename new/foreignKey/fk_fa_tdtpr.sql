ALTER TABLE fa_tdtpr
ADD FOREIGN KEY (dtpr_fact)
REFERENCES fa_tfact(fact_fact)
;