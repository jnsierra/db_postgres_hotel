--
-- drop SEQUENCE co_temp_sim_movi_contables
--


--
--Secuencia utilizada para realizar la simulacion de los movimientos contables en una sola transaccion
--
CREATE SEQUENCE co_temp_sim_movi_contables
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9999999999
  START 1
  CACHE 1
  cycle
  ;

