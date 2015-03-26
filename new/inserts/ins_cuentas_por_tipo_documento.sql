--
--Insercion de documentos generados por la aplicacion
--

--
--Factura de compra
--
INSERT INTO co_ttido(
            tido_tido,tido_estado, tido_nombre, tido_descripcion)
    VALUES (1,'A', 'FACTCOMPRA','FACTURA DE COMPRA');
--
--Factura de Venta
--
INSERT INTO co_ttido(
            tido_tido,tido_estado, tido_nombre, tido_descripcion)
    VALUES (2,'A', 'FACTventa','FACTURA DE VENTA');
--
--Cuentas fijas para poder crear una factura de compra
--
INSERT INTO co_tsbft(
            sbft_tido, sbft_sbcu_codigo, sbft_naturaleza, sbft_porcentaje, 
            sbft_visible, sbft_comentario)
    VALUES ( 1, '240801', 'D', 16,'N','IVA EL CUAL SE DESCONTARA AL PAGAR IMPUESTOS');

