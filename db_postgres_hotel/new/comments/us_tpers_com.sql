COMMENT ON TABLE US_TPERS                     IS  'Tabla encargada de almacenar los datos personales de los clientes y los usuarios del sistema';
COMMENT ON COLUMN US_TPERS.pers_pers          IS  'Llave primaria de la tabla';
COMMENT ON COLUMN US_TPERS.PERS_APELLIDO      IS  'Apellido de la persona';
COMMENT ON COLUMN US_TPERS.PERS_NOMBRE        IS  'Nombre de la persona';
COMMENT ON COLUMN US_TPERS.PERS_CEDULA        IS  'Cedula de la persona (Unique)';
COMMENT ON COLUMN US_TPERS.PERS_EMAIL         IS  'Correo personal de la persona (Unique)';
COMMENT ON COLUMN US_TPERS.PERS_FECHA_NAC     IS  'Fecha de nacimiento de la persona';
COMMENT ON COLUMN US_TPERS.PERS_TEL           IS  'Telefono fijo de la persona'; 
COMMENT ON COLUMN US_TPERS.PERS_CEL           IS  'Celular personal de la persona';
COMMENT ON COLUMN US_TPERS.PERS_DIR           IS  'Direccion de la persona';
COMMENT ON COLUMN US_TPERS.PERS_DEPT_RESI     IS  'Departamento de residencia de la persona';
COMMENT ON COLUMN US_TPERS.PERS_CIUDAD_RESI   IS  'Ciudad de residencia de la persona';