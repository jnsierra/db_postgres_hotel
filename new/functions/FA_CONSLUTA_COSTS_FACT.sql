CREATE OR REPLACE 
FUNCTION FA_CONSLUTA_COSTS_FACT (  
                            p_fact_fact     INT,
                            p_tipo          INT, -- (1) SERVICIO (2) PRODUCTO
                            p_accion        INT  -- (1) VALOR TOTAL (2) SUMA VALORES (3) VALOR IVA
                         ) RETURNS NUMERIC  AS $$
    DECLARE
        --
        --Suma el valor del iva de las habitaciones
        --
        c_valor_iva CURSOR FOR
        SELECT coalesce(sum(dtsv_valor_iva),0)
          FROM fa_tdtsv
         WHERE dtsv_fact = p_fact_fact
           AND UPPER(dtsv_estado) = 'A'
        ;
        --
        -- Suma el valor de las habitaciones sin iva
        --
        c_valor_sv CURSOR FOR
        SELECT coalesce(sum(dtsv_valor_sv),0)
          FROM fa_tdtsv
         WHERE dtsv_fact = p_fact_fact
           AND UPPER(dtsv_estado) = 'A'
         ;
        --
        -- Suma el valor total de las habitaciones y el iva
        --
        c_valor_total CURSOR FOR
        SELECT coalesce(SUM(dtsv_valor_venta), 0)
          FROM fa_tdtsv
         WHERE dtsv_fact = p_fact_fact
           AND UPPER(dtsv_estado) = 'A'
         ;
        
        v_valor     NUMERIC := 0;
        
    BEGIN
    
        IF p_tipo = 1 THEN
            
            IF p_accion = 1 THEN 
            
                OPEN c_valor_total;
                FETCH c_valor_total INTO v_valor;
                CLOSE c_valor_total;
            
            ELSIF p_accion = 2 THEN
            
                OPEN c_valor_sv; 
                FETCH c_valor_sv INTO v_valor;
                CLOSE c_valor_sv;
            
            ELSIF p_accion = 3 THEN 
            
                OPEN c_valor_iva;
                FETCH c_valor_iva INTO v_valor;
                CLOSE c_valor_iva;
            
            END IF;
        ELSIF p_tipo = 2 THEN
            --
            --Aqui deve ir la logica para los precios de los productos
            --  
            v_valor :=0;
        ELSE
            v_valor :=0;
        END IF;
        
        RETURN v_valor;
        
    EXCEPTION 
        WHEN OTHERS THEN        
        RETURN 0;        
 END;
$$ LANGUAGE 'plpgsql';