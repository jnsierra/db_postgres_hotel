select US_FINSERTA_USUA('jesus','sierra','1030585312','nicoluksierra@hotmail.com',to_date('14/01/1991','dd/mm/yyyy'),'jnsierra','flaco',1);


INSERT INTO us_tperf(
            perf_nomb, perf_desc, perf_permisos, perf_estado)
    VALUES ('Admin', 'Administrador de la aplicacion', '.AdPf1..AdPf3.', 'A');
 
 
select * 
from pg_stat_activity 
where datname = 'Hotel'

--REINICIAR SECUENCIAS

ALTER SEQUENCE NOMBRE_SECUENCIA restart 1