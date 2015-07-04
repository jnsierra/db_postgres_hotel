--
-- Trigger el cual se encargara de relacionar la cuenta con el grupo 
--
CREATE OR REPLACE FUNCTION f_ins_kapr_negativos() RETURNS trigger AS $f_ins_kapr_negativos$
    DECLARE
    
    BEGIN
        --
        IF NEW.kapr_cant_saldo < 0 THEN 
            --
            raise exception 'El movimiento que esta generando da como resultado un saldo negativo lo cual no es permitido ';
            --
        END IF;
        --        
        RETURN NEW;        
        --
    END;
$f_ins_kapr_negativos$ LANGUAGE plpgsql;


CREATE TRIGGER f_ins_kapr
    BEFORE INSERT OR UPDATE ON in_tkapr
    FOR EACH ROW
    EXECUTE PROCEDURE f_ins_kapr_negativos()
    ;