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
    v_fact_fact     NUMERIC  :=0;
    v_kapr_kapr     NUMERIC  :=0;
    --
    --Cursor utilizado para generar el id de la factura
    --    
    c_fact_fact CURSOR FOR
    SELECT coalesce(max(fact_fact),0) + 1
      from fa_tfact     
    ;
    --
    --
    --
    c_kapr_kapr CURSOR FOR
    SELECT coalesce(max(kapr_kapr),0) + 1
      from in_tkapr     
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
    --
    --Cursor con el cual obtengo el valor del promedio pornderado del producto
    --
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
    --Cursor con el cual obtengo el id de la tabal fa_tdtpr
    --
    c_dtpr_dtpr CURSOR FOR
    SELECT coalesce(max(dtpr_dtpr),0) + 1
      from fa_tdtpr
    ;
    --
    --Variable para el precio del producto
    --
    v_precio_prod           NUMERIC(15,6):=0;
    v_dtpr_dtpr             NUMERIC;
    v_vlr_total_fact        NUMERIC(15,6):=0;
    v_vlr_uni_fact          NUMERIC(15,6):=0;
    v_vlr_uni_fact_iva      NUMERIC(15,6):=0;
    v_vlr_tot_fact_iva      NUMERIC(15,6):=0;
    v_vlr_iva_uni           NUMERIC(15,6):=0;
    v_vlr_iva_tot           NUMERIC(15,6):=0;
    --
    --Cursor con el cual se calcula el valor del iva parametrizado
    --
    c_calc_iva CURSOR(vc_valor  NUMERIC)IS
    SELECT (cast(para_valor as numeric) *vc_valor) / 100 vlrIva
    FROM em_tpara where para_clave = 'IVAPR'
    ;
    --
    --Cursores necesarios para la contabilizacion
    --
    --Cursor el cual sirve para obtener el id temporal de transaccion para la tabla temporal
    --de movimientos contables
    c_sec_tem_mvco CURSOR FOR
    SELECT nextval('co_temp_movi_contables') 
    ;
    --
    --Variables necesarias para la contabilizacion
    --
    v_idTrans_con           INT:= 0;
    v_iva_mvco              NUMERIC(15,6):=0;
    --
    c_cod_sbcu CURSOR (vc_dska_dska  INT) IS
    SELECT sbcu_codigo
      FROM co_tsbcu, in_tdska
     WHERE dska_dska = vc_dska_dska
       AND sbcu_sbcu = dska_sbcu
     ;
    --
    c_val_iva_generado CURSOR FOR
    SELECT count(*)
      FROM co_tsbcu
     WHERE sbcu_codigo = '240802'
      ;
    --
    c_vlr_total_fact CURSOR(vc_fact_fact INT) FOR
    SELECT fact_vlr_total + fact_vlr_iva
      FROM fa_tfact
     WHERE fact_fact = vc_fact_fact
     ;
    --
    v_val_iva_generado      INT := 0;
    v_sbcu_cod_prod         varchar(100) := '';
    v_vlr_total_fact_co     NUMERIC(15,6) := 0;
    --
    BEGIN
    --
    OPEN c_val_iva_generado;
    FETCH c_val_iva_generado INTO v_val_iva_generado;
    CLOSE c_val_iva_generado;
    --
    IF v_val_iva_generado <> 1 THEN
        --
        RAISE EXCEPTION 'Error cuenta de iva generado no se encuentra parametrizada por favor comunicarse con el administrador del sistema ';
        --
    END IF;
    --
    OPEN c_sec_tem_mvco;
    FETCH c_sec_tem_mvco INTO v_idTrans_con;
    CLOSE c_sec_tem_mvco;
    
    --
    --Ini Validacion de PreRequisitos del sistema
    --
    --
    --Creacion del movimiento de inventario
    --    
    OPEN c_mvin_venta;
    FETCH c_mvin_venta INTO v_mvin_mvin;
    CLOSE c_mvin_venta;
    --
    IF v_mvin_mvin is null THEN
    --
        RAISE EXCEPTION 'No existe ningun movimiento de inventario que referencie la facturacion';
    --
    END IF;
    --
    --Fin Validacion de PreRequisitos del sistema
    --
    --
    --Inicio generacion de una Factura
    --
    OPEN c_fact_fact;
    FETCH c_fact_fact INTO v_fact_fact;
    CLOSE c_fact_fact;
    
    INSERT INTO FA_TFACT(fact_fact,fact_tius, fact_clien,fact_vlr_total,fact_vlr_iva)
    VALUES (v_fact_fact,p_tius,p_clien,v_vlr_total,v_vlr_iva)
    ;
    --
    --Fin generacion de una Factura
    --   
    --Creacion de los detalles de facturacion de productos
    --
    FOR prod IN c_prod_fact
    LOOP
        --
        OPEN c_kapr_kapr;
        FETCH c_kapr_kapr INTO v_kapr_kapr;
        CLOSE c_kapr_kapr;
        --
        OPEN c_cons_prod(prod.tem_fact_dska);
        FETCH c_cons_prod INTO v_cons_prod;
        CLOSE c_cons_prod;
        --
        OPEN c_prom_pond_prod(prod.tem_fact_dska);
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
            kapr_kapr,kapr_cons_pro, kapr_dska, 
            kapr_mvin, kapr_cant_mvto, kapr_cost_mvto_uni, 
            kapr_cost_mvto_tot, kapr_cost_saldo_uni, kapr_cost_saldo_tot, 
            kapr_cant_saldo, kapr_prov, kapr_tius, 
            kapr_sede)
        VALUES (v_kapr_kapr, v_cons_prod, prod.tem_fact_dska, 
                v_mvin_mvin, prod.tem_fact_cant, v_vlr_mvt_uni , 
                v_vlr_mvt_total, v_prom_pond_prod, v_vlr_saldo_total, 
                v_cant_exis_prod, 0, p_tius, 
                p_sede);
        --
        --Fin del movimiento de inventario
        --
        OPEN c_precio_prod(prod.tem_fact_dska);
        FETCH c_precio_prod INTO v_precio_prod;
        CLOSE c_precio_prod;
        --
        OPEN c_dtpr_dtpr;
        FETCH c_dtpr_dtpr INTO v_dtpr_dtpr;
        CLOSE c_dtpr_dtpr;
        --
        -- Ini Calculos para la facturacion
        --
        v_vlr_total_fact := prod.tem_fact_cant*v_precio_prod;
        v_vlr_uni_fact := v_precio_prod;
        --
        OPEN c_calc_iva(v_vlr_total_fact);
        FETCH c_calc_iva INTO v_vlr_iva_tot;
        CLOSE c_calc_iva;
        --
        v_vlr_tot_fact_iva := v_vlr_total_fact + v_vlr_iva_tot;
        --
        OPEN c_calc_iva(v_vlr_uni_fact);
        FETCH c_calc_iva INTO v_vlr_iva_uni;
        CLOSE c_calc_iva;
        --
        v_vlr_uni_fact_iva := v_vlr_uni_fact+v_vlr_iva_uni;
        --
        -- Fin Calculos para la facturacion
        --
        --RAISE EXCEPTION 'Llego aqui: %,  %, %, %, %, % ' ,v_precio_prod ,v_vlr_total_fact, v_vlr_iva_tot, v_vlr_iva_uni, v_vlr_tot_fact_iva, v_vlr_uni_fact_iva ;
        INSERT INTO fa_tdtpr(
            dtpr_dtpr, dtpr_dska, dtpr_fact, 
            dtpr_num_prod, dtpr_cant, dtpr_vlr_pr_tot, 
            dtpr_vlr_uni_prod, dtpr_vlr_iva_tot, dtpr_vlr_iva_uni, 
            dtpr_vlr_venta_tot, dtpr_vlr_venta_uni, dtpr_vlr_total, 
            dtpr_desc, dtpr_kapr)
        VALUES (
            v_dtpr_dtpr, prod.tem_fact_dska, v_fact_fact, 
            0, prod.tem_fact_cant, v_vlr_total_fact, 
            v_vlr_uni_fact, v_vlr_iva_tot, v_vlr_iva_uni, 
            v_vlr_tot_fact_iva, v_vlr_uni_fact_iva, v_vlr_tot_fact_iva,
            'N', v_kapr_kapr);
            
        v_iva_mvco := v_iva_mvco + v_vlr_iva_tot;
        
        OPEN c_cod_sbcu(prod.tem_fact_dska);
        FETCH c_cod_sbcu INTO v_sbcu_cod_prod;
        CLOSE c_cod_sbcu;
        
        INSERT INTO co_ttem_mvco(
                tem_mvco_trans, tem_mvco_sbcu, tem_mvco_valor, tem_mvco_naturaleza)
        VALUES (v_idTrans_con, v_sbcu_cod_prod , v_vlr_total_fact , 'C');

        
    END LOOP;
    
    DELETE FROM co_ttem_fact
    WHERE tem_fact_trans = p_idTrans
    ;
    
    INSERT INTO co_ttem_mvco(
            tem_mvco_trans, tem_mvco_sbcu, tem_mvco_valor, tem_mvco_naturaleza)
    VALUES (v_idTrans_con, '240802' , v_iva_mvco , 'C');

    OPEN c_vlr_total_fact(v_fact_fact);
    FETCH c_vlr_total_fact INTO v_vlr_total_fact_co;
    CLOSE c_vlr_total_fact;
    
    INSERT INTO co_ttem_mvco(
                tem_mvco_trans, tem_mvco_sbcu, tem_mvco_valor, tem_mvco_naturaleza)
        VALUES (v_idTrans_con, '110501' , v_vlr_total_fact_co , 'D');
    
    
    RETURN 'Ok-'||v_fact_fact;
    
    EXCEPTION WHEN OTHERS THEN
         RETURN 'Error '|| sqlerrm;
    END;
$$ LANGUAGE 'plpgsql';