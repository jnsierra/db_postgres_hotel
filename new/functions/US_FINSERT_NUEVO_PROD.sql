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
                                                      p_usua       VARCHAR(50)  ,      -- Usuario el cual registra el inventario
                                                      p_sede       INTEGER      ,      -- Sede a la cual ingresa el producto al sitema
                                                      p_cate       INTEGER      ,      -- Categoria a la cual pertenece el producto
                                                      p_runic      VARCHAR(200) ,      -- Valor el cual es un registro unico para los productos si aplica
                                                      p_fecVen     DATE                -- Fecha de vencimiento del producto si aplica
                                    ) RETURNS VARCHAR AS $$
      DECLARE 
      
         v_cod_prod     varchar(1);
         v_tius_tius    integer;
         rta            varchar(10) := 'Err';
         v_cost_tot     Numeric(50,6) := 0;         
         
         c_dska_dska CURSOR FOR
         SELECT coalesce(max(dska_dska),0)+ 1 as dska_dska
           FROM in_tdska
           ;
        v_dska_dska     INTEGER := 0;
        
        c_kapr_kapr CURSOR FOR
         SELECT coalesce(max(kapr_kapr),0)+ 1 as kapr_kapr
           FROM in_tkapr
           ;
        --
        c_mvin_inicial CURSOR FOR
        SELECT mvin_mvin, count(1) contador
         FROM in_tmvin
        WHERE mvin_inicial = 'S'
        GROUP BY mvin_mvin
        ;
        --
        c_codigo CURSOR FOR
        SELECT '1-' || coalesce(count(*), 0 )+1 AS Id
          FROM in_tdska 
          ;
        --
        v_kapr_kapr     INTEGER := 0;
        v_cont_mvin     INTEGER := 0;       -- cuenta cuantos movimientos de inventario inicial existen
        v_mvin_inicial  INTEGER := 0;       -- Obtiene el identificador del movimiento inicial de inventario 
        v_codigo        varchar(100) := '';
        --
      BEGIN
      
         OPEN c_dska_dska;
         FETCH c_dska_dska INTO v_dska_dska;
         CLOSE c_dska_dska;
         
         OPEN c_kapr_kapr;
         FETCH c_kapr_kapr INTO v_kapr_kapr;
         CLOSE c_kapr_kapr;
         --
         OPEN c_codigo;
         FETCH c_codigo INTO v_codigo ;
         CLOSE c_codigo;
         --         
         v_cod_prod  :=   US_FVERIFICA_COD_PROD(v_codigo);
         
         
         IF v_cod_prod = 'N' THEN
            --
            insert into in_tdska(dska_dska,DSKA_REFE,DSKA_COD, DSKA_NOM_PROD, DSKA_DESC, DSKA_IVA, DSKA_PORC_IVA, DSKA_MARCA,DSKA_CATE)
                          values(v_dska_dska,p_ref,v_codigo,p_nom_prod,p_desc,upper(p_iva),p_porc_iva,p_marca,p_cate);
                         
             IF v_dska_dska IS NOT NULL THEN
               
               v_cost_tot := p_cant*p_cost;
               
               v_tius_tius := US_FRETORNA_ID_USUARIO(trim(p_usua));
               
               OPEN c_mvin_inicial;
               FETCH c_mvin_inicial INTO v_mvin_inicial, v_cont_mvin;
               CLOSE c_mvin_inicial;
               
               IF v_cont_mvin = 1 THEN
                    --
                    insert into in_tkapr (KAPR_KAPR,KAPR_DSKA, KAPR_FECHA, KAPR_MVIN, KAPR_CANT_MVTO, KAPR_COST_MVTO_UNI, KAPR_COST_MVTO_TOT, KAPR_COST_SALDO_UNI, KAPR_COST_SALDO_TOT, KAPR_CANT_SALDO, KAPR_TIUS,KAPR_CONS_PRO,KAPR_SEDE)
                          values(v_kapr_kapr,v_dska_dska, now(), v_mvin_inicial , p_cant,p_cost , v_cost_tot, p_cost, v_cost_tot, p_cant, v_tius_tius, 1, p_sede )
                          ;
                    --
               ELSIF v_cont_mvin = 0 OR v_cont_mvin is null THEN 
                    --
                    RAISE EXCEPTION 'Error US_FINSERT_NUEVO_PROD no esta referenciado ningun movimiento de inventario en el sistema para inventario inicial porfavor referencie un movimiento e intente de nuevo';
                    --
               ELSE
                    --
                    RAISE EXCEPTION 'Error US_FINSERT_NUEVO_PROD hay mas de un movimiento de inventario parametrizado en el sistema ';
                    --
               END IF;
               
               
             END IF;
                          
            rta = 'Ok';
         ELSE 
            rta = 'Error existe un codigo repetido';
         END IF;
         
         RETURN rta;
         
          EXCEPTION WHEN OTHERS THEN
               RETURN 'ERR' || ' Error postgres: ' || SQLERRM;
       END;
$$ LANGUAGE 'plpgsql';