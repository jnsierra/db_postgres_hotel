COMMENT  ON TABLE in_tmprefe IS 'Tabla encargada de almacenar los datos del excel que se sube para hacer cargue masivo';
COMMENT ON COLUMN in_tmprefe.tmprefe_tmprefe IS 'llave primaria de la tabla';
COMMENT ON COLUMN in_tmprefe.tmprefe_codexte IS 'Codigo externo del producto';
COMMENT ON COLUMN in_tmprefe.tmprefe_ubicaci IS 'Ubicacion del producto en el almacen';
COMMENT ON COLUMN in_tmprefe.tmprefe_descrip IS 'Descripcion del producto en el almacen';
COMMENT ON COLUMN in_tmprefe.tmprefe_categor IS 'Nombre de la categoria';
COMMENT ON COLUMN in_tmprefe.tmprefe_subcate IS 'Nombre de la referencia';
COMMENT ON COLUMN in_tmprefe.tmprefe_tipo IS 'tipo de producto';
COMMENT ON COLUMN in_tmprefe.tmprefe_existencia IS 'cantidad de productos';
COMMENT ON COLUMN in_tmprefe.tmprefe_costo IS 'costo por unidad de los productos';
COMMENT ON COLUMN in_tmprefe.tmprefe_fecha IS ' fecha de insercion';
COMMENT ON COLUMN in_tmprefe.tmprefe_usu IS 'usuario que ingreso el excel';