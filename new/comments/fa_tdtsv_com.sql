COMMENT ON TABLE  fa_tdtsv                      IS      'Tabla encargada de almacenar los servicios de las facturas';
COMMENT ON COLUMN  FA_TDTSV.DTSV_DTSV           IS      'Identificador primario de la tabla';
COMMENT ON COLUMN  FA_TDTSV.DTSV_RVHA           IS      'Reserva la cual cual hace referencia la factura';
COMMENT ON COLUMN  FA_TDTSV.DTSV_FACT           IS      'Factura a la cual pertenece el detalle de las facturas';
COMMENT ON COLUMN  FA_TDTSV.DTSV_FECHA          IS      'Fecha en la cual se creo el detalle del servicio';
COMMENT ON COLUMN  FA_TDTSV.DTSV_VALOR_VENTA    IS      'Valor de la venta por la reservacion de la habitación';
COMMENT ON COLUMN  FA_TDTSV.DTSV_VALOR_SV       IS      'Valor del servicio';
COMMENT ON COLUMN  FA_TDTSV.DTSV_DESC           IS      'Identificador del descuento';
COMMENT ON COLUMN  FA_TDTSV.DTSV_CON_DESC       IS      'Valor del servicio con descuento';
COMMENT ON COLUMN  FA_TDTSV.DTSV_VALOR_DESC     IS      'Valor del descuento el cual se aplico al detalle';
COMMENT ON COLUMN  FA_TDTSV.DTSV_ESTADO         IS      'Indica en que estado esta el detalle de factura (A) Activo,  (C) cancelada';
COMMENT ON COLUMN  FA_TDTSV.DTSV_COSTO_HAB      IS      'Guarda el valor que tenia la habitacion en el momento en el cual se reservo la habitacion';
