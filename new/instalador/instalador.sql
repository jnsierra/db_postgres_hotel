--
-- Tablas
--
\i C:/db_postgres_hotel/new/tables/us_tpers.sql;
\i C:/db_postgres_hotel/new/tables/us_ttius.sql;
\i C:/db_postgres_hotel/new/tables/us_tperf.sql;
\i C:/db_postgres_hotel/new/tables/us_tclien.sql;
\i C:/db_postgres_hotel/new/tables/in_tdska.sql;
\i C:/db_postgres_hotel/new/tables/in_tkapr.sql;
\i C:/db_postgres_hotel/new/tables/in_tmvin.sql;
\i C:/db_postgres_hotel/new/tables/in_tprov.sql;
\i C:/db_postgres_hotel/new/tables/in_tdsha.sql;
\i C:/db_postgres_hotel/new/tables/in_trvha.sql;
\i C:/db_postgres_hotel/new/tables/fa_tfact.sql;
\i C:/db_postgres_hotel/new/tables/fa_tdtsv.sql;
\i C:/db_postgres_hotel/new/tables/fa_tdtpr.sql;
\i C:/db_postgres_hotel/new/tables/in_tprha.sql;
\i C:/db_postgres_hotel/new/tables/in_tprpr.sql;
\i C:/db_postgres_hotel/new/tables/em_tpara.sql;
--
-- Cheks constrains
--
\i C:/db_postgres_hotel/new/checks/us_ttius_chks.sql;
\i C:/db_postgres_hotel/new/checks/in_tperf_chks.sql;
\i C:/db_postgres_hotel/new/checks/in_tdska_chks.sql;
\i C:/db_postgres_hotel/new/checks/in_tmvin_chks.sql;
\i C:/db_postgres_hotel/new/checks/in_trvha_chks.sql;
\i C:/db_postgres_hotel/new/checks/in_tdsha_chks.sql;
\i C:/db_postgres_hotel/new/checks/fa_tfact_chks.sql;
\i C:/db_postgres_hotel/new/checks/fa_tdtsv_chks.sql;
\i C:/db_postgres_hotel/new/checks/fa_tdtpr_chks.sql;
\i C:/db_postgres_hotel/new/checks/in_tprha_chks.sql;
--
-- Uniques Constrains
--
\i C:/db_postgres_hotel/new/uniques/US_TPERS_UNIQUES.sql;
\i C:/db_postgres_hotel/new/uniques/US_TTIUS_UNIQUES.sql;
\i C:/db_postgres_hotel/new/uniques/US_TPERF_UNIQUES.sql;
\i C:/db_postgres_hotel/new/uniques/IN_TMVIN_UNIQUES.sql;
\i C:/db_postgres_hotel/new/uniques/IN_TPROV_UNIQUES.sql;
\i C:/db_postgres_hotel/new/uniques/IN_TDSKA_UNIQUES.sql;
\i C:/db_postgres_hotel/new/uniques/IN_TDSHA_UNIQUES.sql;
\i C:/db_postgres_hotel/new/uniques/EM_TPARA_UNIQUES.sql;
--
-- Comentarios de las tablas
--
\i C:/db_postgres_hotel/new/comments/us_tpers_com.sql;
\i C:/db_postgres_hotel/new/comments/us_ttius_com.sql;
\i C:/db_postgres_hotel/new/comments/us_tperf_com.sql;
\i C:/db_postgres_hotel/new/comments/us_tclien_com.sql;
\i C:/db_postgres_hotel/new/comments/in_tdska_com.sql;
\i C:/db_postgres_hotel/new/comments/in_tkapr_com.sql;
\i C:/db_postgres_hotel/new/comments/in_tmvin_com.sql;
\i C:/db_postgres_hotel/new/comments/in_tprov_com.sql;
\i C:/db_postgres_hotel/new/comments/in_tdsha_com.sql;
\i C:/db_postgres_hotel/new/comments/in_trvha_com.sql;
\i C:/db_postgres_hotel/new/comments/fa_tfact_com.sql;
\i C:/db_postgres_hotel/new/comments/fa_tdtpr_com.sql;
\i C:/db_postgres_hotel/new/comments/fa_tdtsv_com.sql;
\i C:/db_postgres_hotel/new/comments/in_tprha_com.sql;
--
-- Llaves foraneas
--
\i C:/db_postgres_hotel/new/foreignKey/fk_us_tclien.sql;
\i C:/db_postgres_hotel/new/foreignKey/fk_us_ttius.sql;
\i C:/db_postgres_hotel/new/foreignKey/fk_in_tkapr.sql;
\i C:/db_postgres_hotel/new/foreignKey/fk_us_trvha.sql;
\i C:/db_postgres_hotel/new/foreignKey/fk_fa_tfact.sql;
\i C:/db_postgres_hotel/new/foreignKey/fk_fa_tdtsv.sql;
\i C:/db_postgres_hotel/new/foreignKey/fk_fa_tdtpr.sql;
\i C:/db_postgres_hotel/new/foreignKey/fk_in_tprha.sql;
\i C:/db_postgres_hotel/new/foreignKey/fk_in_tprpr.sql;
--
--Vistas
--
\i C:/db_postgres_hotel/new/views/us_vusuarios.sql;
--
--Types
--
\i C:/db_postgres_hotel/new/types/return_usuario.sql;
\i C:/db_postgres_hotel/new/types/return_rta.sql;
\i C:/db_postgres_hotel/new/types/return_usua_com.sql;
\i C:/db_postgres_hotel/new/types/return_perfil.sql;
--
-- Procediminetos
--
\i C:/db_postgres_hotel/new/functions/US_FCAMBIO_CLAVE.sql;
\i C:/db_postgres_hotel/new/functions/US_FRECUPERAR_DATOS.sql;
\i C:/db_postgres_hotel/new/functions/US_FRECUPERAR_USUA.sql;
\i C:/db_postgres_hotel/new/functions/US_FAUTENTICAR_USUA.sql;
\i C:/db_postgres_hotel/new/functions/US_FELIM_CONTRA_AUX.sql;
\i C:/db_postgres_hotel/new/functions/US_FINSERT_CONTRA_AUX.sql;
\i C:/db_postgres_hotel/new/functions/US_FINSERTA_USUA.sql;
\i C:/db_postgres_hotel/new/functions/US_FVERIFICA_CEDULA.sql;
\i C:/db_postgres_hotel/new/functions/US_FVERIFICA_CORREO.sql
\i C:/db_postgres_hotel/new/functions/US_FVERIFICA_USUARIO.sql;
\i C:/db_postgres_hotel/new/functions/US_FCONSULTA_USUARIOS.sql;
\i C:/db_postgres_hotel/new/functions/US_FCAMBIA_ESTADO_USUARIO.sql;
\i C:/db_postgres_hotel/new/functions/US_FINSERT_NUEVO_PROD.sql;
\i C:/db_postgres_hotel/new/functions/US_FVERIFICA_COD_PROD.sql;
\i C:/db_postgres_hotel/new/functions/US_FRETORNA_ID_USUARIO.sql;
\i C:/db_postgres_hotel/new/functions/US_FCONSULTA_CODIGO.sql;
\i C:/db_postgres_hotel/new/functions/US_FINSERT_PERFIL.sql;
\i C:/db_postgres_hotel/new/functions/US_FACTUALIZA_PERFIL.sql;
\i C:/db_postgres_hotel/new/functions/US_FINSERT_CLIENTE.sql;
\i C:/db_postgres_hotel/new/functions/IN_FINSERT_SERVICIO.sql;
\i C:/db_postgres_hotel/new/functions/US_FACTUALIZA_USUARIO.sql;
\i C:/db_postgres_hotel/new/functions/IN_FINSERTA_PROD_KARDEX.sql;
\i C:/db_postgres_hotel/new/functions/FA_VERF_RESERVA_HABITACION.sql;
\i C:/db_postgres_hotel/new/functions/FA_CREA_FACTURA.sql;
\i C:/db_postgres_hotel/new/functions/FA_RESERVA_HABITACION.sql;
\i C:/db_postgres_hotel/new/functions/FA_CONSLUTA_COSTS_FACT.sql;
\i C:/db_postgres_hotel/new/functions/FA_CONFIRMA_FACTURA.sql;
\i C:/db_postgres_hotel/new/functions/FA_ELIMINA_SERVICIOSXDTSV.sql;
\i C:/db_postgres_hotel/new/functions/FA_ELIMINA_PRODUCTOSXDTPR.sql;
\i C:/db_postgres_hotel/new/functions/FA_CREA_DETALLE_SERVFACTURA.sql;
\i C:/db_postgres_hotel/new/functions/FA_REGISTRA_VENTA_PROD.sql;
--
-- Triggers
--
\i C:/db_postgres_hotel/new/triggers/fa_trvha_before_insert.sql;
\i C:/db_postgres_hotel/new/triggers/in_tprpr_before_insert.sql;
\i C:/db_postgres_hotel/new/triggers/fa_tdtpr_after_insert_or_update.sql;
\i C:/db_postgres_hotel/new/triggers/fa_tdtsv_after_insert_or_update.sql;
--
--  Inserts
--
--\i C:/db_postgres_hotel/new/inserts/ins_in_tmvin.sql;