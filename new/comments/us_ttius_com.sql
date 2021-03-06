COMMENT ON TABLE  US_TTIUS                      IS          'Tabla encrgada de controlar los datos de los usuarios del sistema no clientes';
COMMENT ON COLUMN US_TTIUS.TIUS_TIUS            IS          'Identificador primario de la tabla';
COMMENT ON COLUMN US_TTIUS.TIUS_PERS            IS          'Llave foranea que se une con la tabla US_TPERS';
COMMENT ON COLUMN US_TTIUS.TIUS_PERF            IS          'Llave foranea que se une con la tabla US_TPERF';
COMMENT ON COLUMN US_TTIUS.TIUS_TIPO_USUARIO    IS          'Indica el tipo de usuario de que tiene dentro del sistema (CA)Cajero (AD) Administrador (AM) Administrador maestro';
COMMENT ON COLUMN US_TTIUS.TIUS_USUARIO         IS          'Usuario con el cual ingresa al sistema (Unique)';
COMMENT ON COLUMN US_TTIUS.TIUS_FECHA_REGISTRO  IS          'Fecha en la cual ingreso al sistema';
COMMENT ON COLUMN US_TTIUS.TIUS_ULTIMO_INGRESO  IS          'Fecha del ultimo ingreso al sistema';
COMMENT ON COLUMN US_TTIUS.TIUS_CONTRA_ACT      IS          'Contraseña activa con la cual ingresa al sistema';
COMMENT ON COLUMN US_TTIUS.TIUS_CONTRA_FUTURA   IS          'Contraseña con la cual podra entrar al sistema en caso de confirmar el cambio de clave';
COMMENT ON COLUMN US_TTIUS.TIUS_CAMBIO_CONTRA   IS          'Indica Si el usuario solicito cambio de contraseña (S) si o (N) no';
COMMENT ON COLUMN US_TTIUS.TIUS_ESTADO          IS          'Estado de el usuario A(activo), I(inactivo), X(Eliminado)';
COMMENT ON COLUMN US_TTIUS.TIUS_SEDE            IS          'Llave foranea con la tabla de sedes';