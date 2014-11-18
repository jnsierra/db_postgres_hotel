CREATE OR REPLACE 
FUNCTION FA_CONSLUTA_COSTS_FACT (  
                            p_fact_fact     INT,
                            p_tipo          INT, -- (1) SERVICIO (2) PRODUCTO (3) PRODUCTOS + SERVICIOS
                            p_accion        INT  -- (1) VALOR TOTAL(IVA +VALOR) (2) VALOR DE LOS SERVICIOS O PRODUCTOS (3) VALOR IVA
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
        --
        -- Suma el valor total del iva de los productos
        --
        c_valor_iva_pr CURSOR FOR
        SELECT COALESCE(SUM(dtpr_valor_iva),0)
          FROM fa_tdtpr
         WHERE dtpr_estado = 'A'
           AND dtpr_fact = p_fact_fact
           ;
        --
        -- Suma el valor total de los productos sin iva
        --
        c_valor_prod CURSOR FOR
        SELECT COALESCE(SUM(DTPR_VALOR_PR),0)
          FROM fa_tdtpr
         WHERE dtpr_estado = 'A'
           AND dtpr_fact = p_fact_fact
           ;
        --
        -- Suma el valor total de los productos y el iva
        --
        c_valor_total_pr CURSOR FOR
        SELECT COALESCE(SUM(DTPR_VALOR_VENTA),0) 
          FROM fa_tdtpr
         WHERE dtpr_estado = 'A'
           AND dtpr_fact = p_fact_fact
           ;
        
        v_valor     NUMERIC := 0;
        --
        --Variables para el calculo total de toda la factura
        --
        v_total_servicios       NUMERIC := 0;
        v_total_productos       NUMERIC := 0;
        --
        v_iva_servicios         NUMERIC := 0;
        v_iva_productos         NUMERIC := 0;
        --
        --Valor a pagar discriminado
        --
        v_total_pag_servicio    NUMERIC := 0;
        v_total_pag_producto    NUMERIC := 0;
        
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
            
            IF p_accion = 1 THEN 
            
                OPEN c_valor_total_pr;
                FETCH c_valor_total_pr INTO v_valor;
                CLOSE c_valor_total_pr;
            
            ELSIF p_accion = 2 THEN
            
                OPEN c_valor_prod; 
                FETCH c_valor_prod INTO v_valor;
                CLOSE c_valor_prod;
            
            ELSIF p_accion = 3 THEN 
            
                OPEN c_valor_iva_pr;
                FETCH c_valor_iva_pr INTO v_valor;
                CLOSE c_valor_iva_pr;
            
            END IF;
            
        ELSIF p_tipo = 3 THEN                        
        
            IF p_accion = 1 THEN 
            
                OPEN c_valor_total;
                FETCH c_valor_total INTO v_total_pag_servicio;
                CLOSE c_valor_total;
                
                OPEN c_valor_total_pr;
                FETCH c_valor_total_pr INTO v_total_pag_producto;
                CLOSE c_valor_total_pr;
                
                v_valor := v_total_pag_servicio+v_total_pag_producto;
            
            ELSIF p_accion = 2 THEN            
              
                OPEN c_valor_prod; 
                FETCH c_valor_prod INTO v_total_productos;
                CLOSE c_valor_prod;
                
                OPEN c_valor_sv; 
                FETCH c_valor_sv INTO v_total_servicios;
                CLOSE c_valor_sv;
                
                v_valor := v_total_productos + v_total_servicios;
            
            ELSIF p_accion = 3 THEN             
                
                OPEN c_valor_iva_pr;
                FETCH c_valor_iva_pr INTO v_iva_productos;
                CLOSE c_valor_iva_pr;
                
                OPEN c_valor_iva;
                FETCH c_valor_iva INTO v_iva_servicios;
                CLOSE c_valor_iva;
                
                v_valor := v_iva_productos+v_iva_servicios;
                
            END IF;
        ELSE
            v_valor :=0;
        END IF;
        
        RETURN v_valor;
        
    EXCEPTION 
        WHEN OTHERS THEN        
        RETURN 0;        
 END;
$$ LANGUAGE 'plpgsql';