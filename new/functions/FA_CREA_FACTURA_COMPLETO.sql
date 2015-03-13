--
-- Funcion encargada de realizar toda la facturacion del sistema
--
CREATE OR REPLACE FUNCTION FA_CREA_FACTURA_COMPLETO (  
                                                        p_tius          INT,
                                                        p_clien         INT,
                                                        p_idTrans       INT,
                                                        p_sede          INT
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
    --Moviento de inventario parametrizado para la venta de productos
    --
    c_mvin_venta CURSOR FOR
    SELECT mvin_mvin
      FROM in_tmvin
     WHERE mvin_venta = 'S'
     ;
    --
    --Variable en la cual se almacenara el id del movimiento de inventario
    --
    v_mvin_mvin             INT :=0;
    v_prom_pond_prod        NUMERIC(15,6):=0;
    v_vlr_mvt_total         NUMERIC(15,6):=0;
    v_vlr_mvt_uni           NUMERIC(15,6):=0;
    v_vlr_saldo_total       NUMERIC(15,6):=0;
    v_cant_exis_prod        NUMERIC(15,6):=0;
    --Cursor con el cual obtengo el valor del promedio pornderado del producto
    c_prom_pond_prod CURSOR(vc_dska_dska INT) IS
    SELECT kapr_cost_saldo_uni, kapr_cant_saldo,kapr_cost_saldo_tot
      FROM in_tkapr
     WHERE kapr_kapr = (select max(kapr_kapr) from in_tkapr where kapr_dska = vc_dska_dska)
    ;
    --
    --Proporciona el consecutivo del producto
    --
    c_cons_prod CURSOR (vc_dska_dska INT)is
    SELECT coalesce(count(*) , 0 ) + 1
      FROM in_tkapr
     WHERE kapr_dska = vc_dska_dska
    ;
    v_cons_prod             INT := 0;

    --
    --Variables utilizadas para la facturacion de los productos
    --
    v_dska_dska             INT := 0; 
    v_cant                  INT := 0; 
    --
    --Cursor en el cual obtengo el valor parametrizado para el  p0roducto en la sede en la cual fue comprado
    --
    c_precio_prod CURSOR(vc_dska_dska  INT)IS
    SELECT prpr_precio
      FROM in_tprpr
     WHERE prpr_estado = 'A'
       and prpr_dska = vc_dska_dska
       and prpr_sede = p_sede
       ;
    --
    --Variable para el precio del producto
    --
    v_precio_prod           NUMERIC(15,6):=0;

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
        --
        --Creacion del movimiento de inventario
        --    
        OPEN c_mvin_venta;
        FETCH c_mvin_venta INTO v_mvin_mvin;
        CLOSE c_mvin_venta;
        --
        OPEN c_cons_prod(prod.tem_fact_dska);
        FETCH c_cons_prod INTO v_cons_prod;
        CLOSE c_cons_prod;
        --
        OPEN c_prom_pond_prod;
        FETCH c_prom_pond_prod INTO v_prom_pond_prod,v_cant_exis_prod, v_vlr_saldo_total;
        CLOSE c_prom_pond_prod;
        --
        
        v_cant_exis_prod := v_cant_exis_prod - prod.tem_fact_cant;
        --
        v_vlr_mvt_total := v_prom_pond_prod * prod.tem_fact_cant;
        --
        v_vlr_mvt_uni := v_prom_pond_prod;
        --
        v_vlr_saldo_total := v_vlr_saldo_total - v_vlr_mvt_total;
        --
        INSERT INTO in_tkapr(
            kapr_cons_pro, kapr_dska, kapr_mvin, 
            kapr_cant_mvto, kapr_cost_mvto_uni, kapr_cost_mvto_tot, 
            kapr_cost_saldo_uni, kapr_cost_saldo_tot, kapr_cant_saldo, 
            kapr_prov, kapr_tius, kapr_sede)
        VALUES (v_cons_prod, prod.tem_fact_dska, v_mvin_mvin, 
                prod.tem_fact_cant, v_vlr_mvt_uni , v_vlr_mvt_total, 
                v_prom_pond_prod, v_vlr_saldo_total, v_cant_exis_prod, 
                0, p_tius, p_sede);
        --
        --Fin del movimiento de inventario
        --
        OPEN c_precio_prod(prod.tem_fact_dska);
        FETCH c_precio_prod INTO v_precio_prod;
        CLOSE c_precio_prod;
        --
        --
        --
        
        
        
    END LOOP;
    
    RETURN 'Ok-'||v_fact_fact;
    
    EXCEPTION WHEN OTHERS THEN
         RETURN 'Error '|| sqlerrm;
    END;
$$ LANGUAGE 'plpgsql';