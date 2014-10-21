--
-- DROP TYPE IF EXISTS return_usuario CASCADE;
--
CREATE TYPE return_usuario AS (
  cedula            varchar(50),
  nombre            varchar(50),
  apellido          varchar(50),
  correo            varchar(50),
  telefono          varchar(50),
  tipoUsuario       varchar(2), 
  perfil_usuario    varchar(50),
  permisos_usuario  varchar(200),
  idUsuario         varchar(20)
);