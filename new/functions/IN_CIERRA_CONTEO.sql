--
--Funcion encargada de Realizar el cierre del conteo 
--(Todos los calculos y los inserts de los productos que no se contaron)
--

CREATE OR REPLACE FUNCTION IN_CIERRA_CONTEO(  
                                                p_copr_copr         INT                                                        
                                           ) RETURNS VARCHAR  AS $$
    DECLARE
        
    BEGIN    
    EXCEPTION WHEN OTHERS THEN
         RETURN 'Error '|| sqlerrm;
    END;
$$ LANGUAGE 'plpgsql';