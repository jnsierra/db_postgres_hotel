-- Funcion encargada de insertar en la base de datos un producto por primera vez

CREATE OR REPLACE FUNCTION US_FINSERT_NUEVO_PROD (    p_ref        VARCHAR(10)  ,      -- Referencia del producto
                                                      p_cod        VARCHAR(10)  ,      -- Codigo Unico que identificara el producto para la empresa
                                                      p_nom_prod   VARCHAR(50)  ,      -- Nombre del producto
                                                      p_desc       VARCHAR(50)  ,      -- Pequeña descripción del producto
                                                      p_iva        VARCHAR(1)   ,      -- Identifica si el producto es gravado con iva
                                                      p_porc_iva   INTEGER      ,      -- Porcentaje con el cual se gravara el producto
                                                      p_marca      VARCHAR(20)  ,      -- Marca del producto el cual se 
                                                      p_cant       INTEGER      ,      -- Cantidad de productos que se desean inventariar
                                                      p_cost       NUMERIC(50,6),      -- Costo del producto por unidad
                                                      p_usua       VARCHAR(50)        -- Usuario el cual registra el inventario
                                    ) RETURNS VARCHAR AS $$
      DECLARE 
      
         v_cod_prod     varchar(1);
         v_tius_tius    integer;
         rta            varchar(10) := 'Err';
         v_dska_dska    integer;
         v_cost_tot     Numeric(50,6) := 0;         
      
      BEGIN
         v_cod_prod  :=   US_FVERIFICA_COD_PROD(p_cod);
         
         
         IF v_cod_prod = 'N' THEN
            
            insert into in_tdska(DSKA_REFE,DSKA_COD, DSKA_NOM_PROD, DSKA_DESC, DSKA_IVA, DSKA_PORC_IVA, DSKA_MARCA)
                          values(p_ref,p_cod,p_nom_prod,p_desc,upper(p_iva),p_porc_iva,p_marca);
            
            SELECT dska_dska
              FROM in_tdska
              into v_dska_dska
             WHERE dska_cod = p_cod
             ;
             
             IF v_dska_dska IS NOT NULL THEN
               
               v_cost_tot := p_cant*p_cost;
               
               v_tius_tius := US_FRETORNA_ID_USUARIO(trim(p_usua));
               
               insert into in_tkapr (KAPR_DSKA, KAPR_FECHA, KAPR_MVIN, KAPR_CANT_MVTO, KAPR_COST_MVTO_UNI, KAPR_COST_MVTO_TOT, KAPR_COST_SALDO_UNI, KAPR_COST_SALDO_TOT, KAPR_CANT_SALDO, KAPR_TIUS,KAPR_CONS_PRO)
                              values(v_dska_dska, now(), 2, p_cant,p_cost , v_cost_tot, p_cost, v_cost_tot, p_cant, v_tius_tius, 1 )
                              ;
             END IF;
                          
            rta = 'Ok';
         ELSE 
            rta = 'Error';
         END IF;
         
         RETURN rta;
         
          EXCEPTION WHEN OTHERS THEN
               RETURN 'ERR' || ' Error postgres: ' || SQLERRM;
       END;
$$ LANGUAGE 'plpgsql';