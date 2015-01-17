COMMENT ON TABLE  IN_TMVIN                      IS          'Tabla encargada de tener de registrar los movimientos que se van a registrar en la tabla de inventarios';
COMMENT ON COLUMN IN_TMVIN.MVIN_MVIN            IS          'Numero serial el cual indica el movimiento de inventario que se desea registrar';
COMMENT ON COLUMN IN_TMVIN.MVIN_DESCR           IS          'Descripcion del movimiento ejm (inventario inicial)';
COMMENT ON COLUMN IN_TMVIN.MVIN_NATU            IS          'Naturaleza del movimiento de inventario ENTRADA(E) o SALIDA(S)';
COMMENT ON COLUMN IN_TMVIN.MVIN_USIM            IS          'Usuario implicado en la entrada o salida del producto puede ser un proveedor(P), cliente(C) o ninguno(N)';
COMMENT ON COLUMN IN_TMVIN.MVIN_VENTA           IS          'Parametro el cual indica que el movimiento de inventario es el que va ha ser utilizado para ventas solo puede haber un solo parametro en s';