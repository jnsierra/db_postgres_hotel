--Funcion encargada de insertar un cierre diario 

CREATE OR REPLACE  FUNCTION IN_FINSERT_CIERRE_DIARIO(p_cfecha  DATE             --Fecha del cierre
                                                     p_usuar   INT              --Usuario que hace el cierre
                                                     p_sede    INT              --Sede del cierre   
                                                     )RETURNS VARCHAR AS $$
                                                    
DECLARE 
         rta            varchar(10) := 'Err';
         
         c_