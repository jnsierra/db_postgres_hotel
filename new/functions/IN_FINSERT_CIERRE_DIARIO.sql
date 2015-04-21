--Funcion encargada de insertar un cierre diario 

CREATE OR REPLACE  FUNCTION IN_FINSERT_CIERRE_DIARIO(p_cfecha  TIMESTAMP,        --Fecha del cierre
                                                     p_usuar   INT,              --Usuario que hace el cierre
                                                     p_sede    INT               --Sede del cierre   
                                                     )RETURNS VARCHAR AS $$
                                                    
    DECLARE 
         rta            varchar(10) := 'Err';
         vlr_iva        NUMERIC(15,5) := 0;
         vrl_tot        NUMERIC(15,5) := 0;
         vlr_cie        NUMERIC(15,5) := 0;
         cierre_cierre  INT           := 0;
        
         --Cursor que me verifica si el cierre ya se hizo en esa fecha
         c_verifica_cierre CURSOR FOR 
        SELECT CASE
                WHEN COUNT(*) > 0 THEN 'SI'
                WHEN COUNT(*) < 0 THEN  'NO'
            END 
        FROM ad_tcier WHERE to_date(CIER_FECH,'dd/MM/yyyy') = to_date(p_cfecha,'dd/MM/yyyy') 
        ;
        --Cursor que me trae le valor maximo del cierre
        c_valorMaximo CURSOR FOR
        SELECT MAX(CIER_CIER) FROM AD_TCIER
        ;
        
        
        c_traeFactura CURSOR FOR
        SELECT fact_fact,fact_vlr_total,fact_vlr_iva 
        FROM fa_tfact where to_date(fact_fec_ini,'dd/MM/yyyy') =  to_date(p_cfecha,'dd/MM/yyyy')
        ;
        c_traeDatos CURSOR FOR
        SELECT sum(fact_vlr_total),sum(fact_vlr_iva)
        FROM fa_tfact where to_date(fact_fec_ini,'dd/MM/yyyy') =  to_date(p_cfecha,'dd/MM/yyyy')
        ;
         
        
        
    BEGIN 
    --
        OPEN c_verifica_cierre;
        FETCH c_verifica_cierre INTO rta;
        CLOSE c_verifica_cierre;
        
        IF rta = 'SI' THEN
            RAISE EXCEPTION 'Error el cierre ya existe en la fecha % ' , p_cfecha;
        END IF; 
         OPEN c_traeDatos;
         FETCH c_traeDatos INTO vrl_tot,vlr_iva;
         CLOSE c_traeDatos;
         
         OPEN c_valorMaximo;
         FETCH c_valorMaximo INTO cierre_cierre;
         CLOSE c_valorMaximo;
         
        INSERT INTO  ad_tcier (CIER_CIER,CIER_FECH,CIER_USUA,CIER_VLRI,CIER_VLRT,CIER_VLRC,CIER_SEDE,CIER_ESTADO)
        VALUES (cierre_cierre,p_cfecha,p_usuar,vlr_iva,vrl_tot,(vlr_iva+vrl_tot),p_sede,'A')
        ;
        RETURN 'Ok';
    --
    EXCEPTION WHEN OTHERS THEN
               RETURN 'ERROR IN_FINSERT_CIERRE_DIARIO ' || SQLERRM;        
END;
$$ LANGUAGE 'plpgsql';
