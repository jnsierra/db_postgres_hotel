--
-- Funcion encargada de realizar la facturacion de una receta en particular
--
CREATE OR REPLACE FUNCTION FA_FACTURA_RECETA(  
                                                p_tius              INT,        --Id del usuario que esta registrando la venta del producto
                                                p_rece              INT,        --Id de la receta que se esta vendiendo
                                                p_sede              INT,        --Sede en la cual se esta vendiendo el producto
                                                p_cantidad          INT,        --Cantidad de productos que se vendieron
                                                p_idmvco            INT,        --Id de los movimientos contables que generar la transaccion
                                                p_fact              INT         --Id de facturacion    
                                            ) RETURNS VARCHAR  AS $$
    DECLARE
        --
        c_id_dtre CURSOR FOR
        SELECT COALESCE(MAX(DTRE_DTRE),0) +1
        FROM FA_TDTRE
        ;
        --
        v_dtre_dtre         INT :=  0;
        --
        c_precio_receta CURSOR FOR
        SELECT prre_precio
          FROM in_trece, in_tprre
         WHERE rece_rece = prre_rece
           AND prre_estado = 'A'
           AND rece_estado = 'A'
           AND rece_rece = p_rece
           AND rece_sede = p_sede
           ;
        --
        c_calcula_iva CURSOR (vc_valor NUMERIC) IS
        SELECT cast(para_valor as numeric) * 200
          FROM em_tpara
         WHERE upper(para_clave) = 'IVAPRVENTA'
         ;
        --
        c_costo_receta CURSOR FOR
        SELECT RECE_COSTO
          FROM IN_TRECE
         WHERE RECE_RECE = p_rece
        ;
        --
        v_iva_total         NUMERIC := 0;
        v_iva_unidad        NUMERIC := 0;
        --
        v_precio_unidad     NUMERIC := 0;
        v_precio_total      NUMERIC := 0;
        --
        v_venta_total       NUMERIC := 0;
        v_venta_unidad      NUMERIC := 0;
        --
        v_utilidad          NUMERIC := 0;
        --
        v_costo_rece        NUMERIC := 0;
        v_costo_tot_rece    NUMERIC := 0;
        --
    BEGIN
        raise exception 'parametro %, %, %, %, %, %',p_tius,p_rece,p_sede,p_cantidad,p_idmvco,p_fact;
        --
        OPEN c_id_dtre;
        FETCH c_id_dtre INTO v_dtre_dtre;
        CLOSE c_id_dtre;
        --
        --Obtengo el precio de una receta
        --
        OPEN c_precio_receta;
        FETCH c_precio_receta INTO v_precio_unidad;
        CLOSE c_precio_receta;
        --
        v_precio_total := v_precio_unidad * p_cantidad;
        --
        OPEN c_calcula_iva(v_precio_unidad);
        FETCH c_calcula_iva INTO v_iva_unidad;
        CLOSE c_calcula_iva;
        --
        OPEN c_calcula_iva(v_precio_total);
        FETCH c_calcula_iva INTO v_iva_total;
        CLOSE c_calcula_iva;
        --
        v_venta_unidad := v_iva_unidad + v_precio_unidad;
        --
        v_venta_total := v_iva_total + v_precio_total;
        --
        OPEN c_costo_receta;
        FETCH c_costo_receta INTO v_costo_rece;
        CLOSE c_costo_receta;
        --
        v_costo_tot_rece := v_costo_rece * p_cantidad;
        --
        v_utilidad := v_precio_total - v_costo_tot_rece; 
        --
        INSERT INTO fa_tdtre(
            dtre_dtre, dtre_rece, dtre_fact, dtre_cant, dtre_vlr_re_tot, 
            dtre_vlr_uni_rece, dtre_vlr_iva_tot, dtre_vlr_iva_uni, dtre_vlr_venta_tot, 
            dtre_vlr_venta_uni, dtre_vlr_total, dtre_desc, dtre_utilidad)
                    VALUES (v_dtre_dtre, p_rece, p_fact, p_cantidad, v_costo_tot_rece, 
                            v_costo_rece, v_iva_total, v_iva_unidad , v_venta_total, 
                            v_venta_unidad, v_venta_total, 'N', v_utilidad );
        --
    RETURN 'Ok';
    -- 
    EXCEPTION WHEN OTHERS THEN
         RETURN 'Error FA_FACTURA_RECETA '|| sqlerrm;
    END;
$$ LANGUAGE 'plpgsql';