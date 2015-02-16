-- Función con la cual se realizara la inserccion de un cliente

CREATE OR REPLACE FUNCTION US_FINSERT_CLIENTE (    
                                            p_nombres           varchar(50), 
                                            p_apellidos         varchar(50), 
                                            p_cedula            numeric, 
                                            p_email             varchar(50), 
                                            p_telefono          varchar(50)                                            
                                            ) RETURNS varchar AS $$
    DECLARE
                                            
    c_cliente cursor for
    SELECT count(*)
      FROM us_tclien
     WHERE clien_cedula = p_cedula
    ;        
    
    v_clien_cedula    numeric(10,0);
    
    BEGIN
    
    OPEN c_cliente;
    FETCH c_cliente INTO v_clien_cedula;
    CLOSE c_cliente;
    
    IF v_clien_cedula = 0 THEN
        --
        INSERT INTO us_tclien(
            clien_cedula, 
            clien_nombres, 
            clien_apellidos, 
            clien_telefono, 
            clien_correo)
        VALUES (
                p_cedula, 
                p_nombres, 
                p_apellidos, 
                p_telefono, 
                p_email);
        RETURN 'Ok';
        --        
    ELSE
        --
        RAISE EXCEPTION ' El usuario con cedula % que desea ingresar ya existe en la base de datos ',p_cedula ;
        --
    END IF;
    
    EXCEPTION WHEN OTHERS THEN
         RETURN 'Err' || sqlerrm;
    END;
$$ LANGUAGE 'plpgsql';