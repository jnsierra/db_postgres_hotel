INSERT INTO us_tperf(
            perf_nomb, perf_desc, perf_permisos, perf_estado)
    VALUES ('Admin', 'Administrador de la aplicacion', '.AdUs1..AdUs2..AdUs3..AdUs4..AdUs5..AdEm1..AdPf1..AdPf2..AdPf3..AdPf4..AdSe1..AdSe2..AdSe3..AdSe4..InPr1..InPr2..InPr3..InPr4..InPr5..InPr6..InSr1..InSr2..InSr3..InSr4..InSr5..InMi1..InMi2..InMi3..FcCr1..FcCr2..FcCr3..FcCr4..RpIn1..InRef1..InRef2..InRef3.', 'A')
    ;
 
insert into em_tsede (sede_nombre,sede_direccion, sede_telefono)
    values ('Unicentro', 'Cra 14 No. 112' , '778899');
 
INSERT INTO in_tcate(
            cate_desc, cate_estado, cate_runic, cate_feven)
    VALUES ('Celular', 'A', 'S', 'S');
    
INSERT INTO in_tcate(
            cate_desc, cate_estado, cate_runic, cate_feven)
    VALUES ('Flip Cover', 'A', 'N', 'N');
    
select US_FINSERTA_USUA('jesus','sierra','1030585312','nicoluksierra@hotmail.com',to_date('14/01/1991','dd/mm/yyyy'),'jnsierra','flaco',1,1);