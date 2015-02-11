--
-- Trigger el cual se encargara de relacionar la cuenta con el grupo 
--
CREATE OR REPLACE FUNCTION f_ins_cuenta() RETURNS trigger AS $f_ins_cuenta$
    DECLARE
        
		c_grupo CURSOR FOR
		SELECT gru_gru
		  FROM co_tgru
		 WHERE gru_codigo = NEW.cue_gru
		 ;
	
        v_gru_gru             NUMERIC :=0;
        
    BEGIN
        
        OPEN c_grupo;
		FETCH c_grupo INTO v_gru_gru; 
		CLOSE c_grupo;		
		
		NEW.cue_gru := v_gru_gru;
        
        return NEW;
		
        
    END;
$f_ins_cuenta$ LANGUAGE plpgsql;


CREATE TRIGGER f_ins_cuenta
    BEFORE INSERT OR UPDATE ON co_tcue
    FOR EACH ROW
    EXECUTE PROCEDURE f_ins_cuenta()
    ;