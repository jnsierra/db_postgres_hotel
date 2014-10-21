COMMENT ON TABLE  FA_TFACT                   IS          'Tabla encargada de llevar control de las facturas de la aplicación';
COMMENT ON COLUMN FA_TFACT.FACT_FACT         IS          'Identificador primario de la tabla';
COMMENT ON COLUMN FA_TFACT.FACT_TIUS         IS          'Identifica el usuario del sistema que creo la factura';
COMMENT ON COLUMN FA_TFACT.FACT_FEC_INI      IS          'Fecha en la cual se creo la factura.';
COMMENT ON COLUMN FA_TFACT.FACT_FEC_CIERRE   IS          'Fecha en la cual se cerro la factura';
COMMENT ON COLUMN FA_TFACT.FACT_CLIEN        IS          'Cleinte del cual es la factura';
COMMENT ON COLUMN FA_TFACT.FACT_VLR_TOTAL    IS          'Valor total de la factura';
COMMENT ON COLUMN FA_TFACT.FACT_VLR_IVA      IS          'Iva el cual cobra toda la factura';
COMMENT ON COLUMN FA_TFACT.FACT_TIPO_PAGO    IS          'Tipo de pago Efectivo (E), Tarjeta (T)';
COMMENT ON COLUMN FA_TFACT.FACT_COMETARIOS   IS          'Comentarios de la factura';
COMMENT ON COLUMN FA_TFACT.FACT_ESTADO       IS          'Estado en el cual se encuentra la factura Pendiente(P), Cancelada (C) y en uso (U)';
COMMENT ON COLUMN FA_TFACT.FACT_NATURALEZA   IS          'Naturaleza de la factura (E) Egreso e Ingreso(I) ingreso es una cancelacion de la factura';
COMMENT ON COLUMN FA_TFACT.FACT_DEVOLUCION   IS          'Indica si la factura es una devolución (S) si, (N) No';
COMMENT ON COLUMN FA_TFACT.FACT_ORIGINAL     IS          'Si es una cancelacion de otra factura indica cual es la que esta cancelando';