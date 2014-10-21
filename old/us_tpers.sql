-- CREAMOS LA TABLA PERSONA
-- Tabla en la cual se almacenara los datos personales del los usuarios del sistema 
-- ya sea de clientes o de usuarios del sistema
DROP TABLE IF EXISTS US_TPERS;

CREATE TABLE US_TPERS(
   PERS_PERS               INT              NOT NULL                    ,  -- Llave primaria de la tabla
   PERS_APELLIDO           VARCHAR(50)      NOT NULL                    ,  -- Apellido de la persona
   PERS_NOMBRE             VARCHAR(50)      NOT NULL                    ,  -- Nombre de la persona 
   PERS_CEDULA             VARCHAR(50)      NOT NULL                    ,  -- Cedula de la persona (Unique)
   PERS_EMAIL              VARCHAR(50)      NOT NULL                    ,  -- Correo personal de la persona (Unique)
   PERS_FECHA_NAC          DATE             NOT NULL                    ,  -- Fecha de nacimiento de la persona
   PERS_TEL                VARCHAR(50)                                  ,  -- Telefono fijo de la persona
   PERS_CEL                VARCHAR(50)                                  ,  -- Celular personal de la persona
   PERS_DIR                VARCHAR(50)                                  ,  -- Direccion de la persona
   PERS_DEPT_RESI          VARCHAR(50)                                  ,  -- Departamento de residencia de la persona
   PERS_CIUDAD_RESI        VARCHAR(50)                                  ,  -- Ciudad de residencia de la persona
   PRIMARY KEY (PERS_PERS)
); 