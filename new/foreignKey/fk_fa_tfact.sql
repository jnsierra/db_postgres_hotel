ALTER TABLE FA_TFACT
ADD FOREIGN KEY (FACT_CLIEN)
REFERENCES us_tclien(clien_clien)
;

ALTER TABLE FA_TFACT
ADD FOREIGN KEY (FACT_TIUS)
REFERENCES US_TTIUS(TIUS_TIUS)
;
