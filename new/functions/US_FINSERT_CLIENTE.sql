-- Función con la cual se realizara la inserccion de un cliente

CREATE OR REPLACE FUNCTION US_FINSERT_CLIENTE (    
                                            p_nombres           varchar(50), 
                                            p_apellidos         varchar(50), 
                                            p_cedula            varchar(50), 
                                            p_email             varchar(50), 
                                            p_fecha_nac         varchar(50), 
                                            p_telefono          varchar(50), 
                                            p_celular           varchar(50), 
                                            p_direccion         varchar(50),
                                            p_departamentoRes   varchar(50), 
                                            p_ciudadResi        varchar(50)
                                            ) RETURNS varchar AS $$
    DECLARE
                                            
    c_pers_cliente cursor for
    select coalesce(pers_pers,-1)
    from us_tpers
    where pers_cedula = trim(p_cedula)
    and pers_email = trim(p_email)
    ;
    
    c_clien_clien cursor for
    select coalesce(clien_clien,-1)
    from us_tclien, us_tpers
    where pers_cedula = trim(p_cedula)
    and pers_email = trim(p_email)
    and pers_pers = clien_pers
    ;
    
    
    v_pers_pers      int;
    v_clien_clien    int;
                                            
    BEGIN
    
    insert into us_tpers (pers_apellido, pers_nombre, pers_cedula, pers_email, pers_fecha_nac, pers_tel, pers_cel, pers_dir, pers_dept_resi, pers_ciudad_resi)
    values (upper(trim(p_apellidos)), upper(trim(p_nombres)),trim(p_cedula), trim(p_email),to_date(p_fecha_nac,'dd/mm/yy'), trim(p_telefono),trim(p_celular), trim(p_direccion), trim(p_departamentoRes), trim(p_ciudadResi) );   
    
    OPEN c_pers_cliente;
    FETCH c_pers_cliente INTO v_pers_pers;
    CLOSE c_pers_cliente;
    
    IF v_pers_pers <> -1 THEN
        
        insert into us_tclien (clien_pers)
        values(v_pers_pers);
        
        OPEN c_clien_clien;
        FETCH c_clien_clien INTO v_clien_clien;
        CLOSE c_clien_clien;
        
    END IF;
    
    
    
    RETURN 'OK-' || v_clien_clien;
    
    EXCEPTION WHEN OTHERS THEN
         RETURN 'Err' || sqlerrm;
    END;
$$ LANGUAGE 'plpgsql';