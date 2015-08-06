--
-- Funcion encargada de realizar toda la facturacion del sistema
--
CREATE OR REPLACE FUNCTION FA_FACTURACION   (  
                                                p_tius          INT,
                                                p_clien         INT,
                                                p_idTrans       INT,
                                                p_sede          INT,
                                                p_tipoPago      varchar,
                                                p_idVoucher     NUMERIC(15,6),
                                                p_valrTarjeta   NUMERIC(15,6)
                                            ) RETURNS VARCHAR  AS $$
    DECLARE
    --
    --Variables utilizadas para los valores principales de facturacion
    --
    v_vlr_total     NUMERIC  :=0;
    v_vlr_iva       NUMERIC  :=0;
    --
    --Variables necesarias para la validacion de subcuentas
    --
    v_val_iva_generado          int :=0;
    v_val_costo_ventas          int :=0;
    v_val_mercancias_mm         int :=0;
    v_val_descuentos            int :=0;
    --
    v_fact_fact     NUMERIC  :=0;
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
    SELECT tem_fact_dska, tem_fact_cant,tem_fact_dcto 
      FROM co_ttem_fact
     WHERE tem_fact_trans = p_idTrans
     ;
    BEGIN
    --
    --Inicio de Validacion de Subcuentas Contables necesarias para la contabilizacion
    --
    --
    OPEN c_val_iva_generado;
    FETCH c_val_iva_generado INTO v_val_iva_generado;
    CLOSE c_val_iva_generado;
    --
    OPEN c_costo_ventas;
    FETCH c_costo_ventas INTO v_val_costo_ventas;
    CLOSE c_costo_ventas;
    --
    OPEN c_mercancia_mm;
    FETCH c_mercancia_mm INTO v_val_mercancias_mm;
    CLOSE c_mercancia_mm;
    --
    OPEN c_descuentos;
    FETCH c_descuentos INTO v_val_descuentos;
    CLOSE c_descuentos;
    --
    --
    IF v_val_iva_generado <> 1 THEN
        --
        RAISE EXCEPTION 'Error cuenta de iva generado 240802 no se encuentra parametrizada por favor comunicarse con el administrador del sistema ';
        --
    END IF;
    --
    IF v_val_costo_ventas <> 1 THEN
        --
        RAISE EXCEPTION 'Error cuenta de costo de ventas 613535 no se encuentra parametrizada por favor comunicarse con el administrador del sistema ';
        --
    END IF;
    --
    IF v_val_mercancias_mm <> 1 THEN
        --
        RAISE EXCEPTION 'Error cuenta de mercancias al por menor y mayor 413535 no se encuentra parametrizada por favor comunicarse con el administrador del sistema ';
        --
    END IF;
    --
    IF v_val_descuentos <> 1 THEN
        --
        RAISE EXCEPTION 'Error cuenta de descuentos por ventas 530535 no se encuentra parametrizada por favor comunicarse con el administrador del sistema ';
        --
    END IF;
    --
    OPEN c_fact_fact;
    FETCH c_fact_fact INTO v_fact_fact;
    CLOSE c_fact_fact;
    --
    IF upper(p_tipoPago) = 'T' THEN
        --
        INSERT INTO FA_TFACT(fact_fact,   fact_tius, fact_clien, fact_vlr_total, fact_vlr_iva, fact_tipo_pago, fact_id_voucher)
                     VALUES (v_fact_fact, p_tius,    p_clien,    v_vlr_total,    v_vlr_iva,    'T',            p_idVoucher)
                    ;
        --
    ELSIF upper(p_tipoPago) = 'M' THEN
        --
        INSERT INTO FA_TFACT(fact_fact,   fact_tius, fact_clien, fact_vlr_total, fact_vlr_iva, fact_tipo_pago, fact_id_voucher)
                     VALUES (v_fact_fact, p_tius,    p_clien,    v_vlr_total,    v_vlr_iva,    'M',            p_idVoucher)
                    ;
        --
    ELSE
        --
        INSERT INTO FA_TFACT(fact_fact,   fact_tius, fact_clien, fact_vlr_total, fact_vlr_iva)
                     VALUES (v_fact_fact, p_tius,    p_clien,    v_vlr_total,    v_vlr_iva)
        ;
        --
    END IF;
    --
    --For con el cual recorro todos los productos vendidos en la factura
    --
    FOR prod IN c_prod_fact
    LOOP
        
    END LOOP;
    --    
    RETURN 'Ok-'||v_fact_fact;
    --    
    EXCEPTION WHEN OTHERS THEN
         RETURN 'Error '|| sqlerrm;
    END;
$$ LANGUAGE 'plpgsql';