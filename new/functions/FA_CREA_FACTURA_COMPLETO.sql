--
-- Funcion encargada de realizar toda la facturacion del sistema
--
CREATE OR REPLACE FUNCTION FA_CREA_FACTURA_COMPLETO (  
                                                        p_tius          INT,
                                                        p_clien         INT,
                                                        p_idTrans       INT
                                                    ) RETURNS VARCHAR  AS $$
    DECLARE
    --Variables utilizadas para los valores principales de facturacion
    v_vlr_total     NUMERIC  :=0;
    v_vlr_iva       NUMERIC  :=0;
    --Identificador primario de la tabla fa_tfact
    v_fact_fact     varchar(10);
    --
    --Cursor utilizado para generar el id de la factura
    --    
    c_fact_fact CURSOR FOR
    SELECT coalesce(max(fact_fact),0) + 1
      from fa_tfact     
    ;
    --
    --Cursor el cual obtiene todos los productos que fueron facturados teniendo en cuenta el id de transaccion
    --
    c_prod_fact CURSOR FOR
    SELECT tem_fact_dska, tem_fact_cant
      FROM co_ttem_fact
     WHERE tem_fact_trans = p_idTrans
     ;
    --
    --Variables utilizadas para la facturacion de los productos
    --
    v_dska_dska             INT := 0; 
    v_cant                  INT := 0; 
     
    BEGIN
    --
    --Inicio generacion de una Factura
    --
    OPEN c_id_fact;
    FETCH c_id_fact INTO v_fact_fact;
    CLOSE c_id_fact;
    
    INSERT INTO FA_TFACT(fact_fact,fact_tius, fact_clien,fact_vlr_total,fact_vlr_iva)
    VALUES (v_fact_fact,ptius,pclien,v_vlr_total,v_vlr_iva)
    ;
    --
    --Fin generacion de una Factura
    --
    --Creacion de los detalles de facturacion de productos
    --
    FOR prod IN c_prod_fact
    LOOP
        
        OPEN c_prod_fact;
        FETCH c_prod_fact INTO v_dska_dska,v_cant;
        CLOSE c_prod_fact;
        
        
        
        
    
    END LOOP;
    
    RETURN 'Ok-'||v_fact_fact;
    
    EXCEPTION WHEN OTHERS THEN
         RETURN 'Error '|| sqlerrm;
    END;
$$ LANGUAGE 'plpgsql';