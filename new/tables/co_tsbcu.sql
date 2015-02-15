CREATE TABLE CO_TSBCU(
    SBCU_SBCU                   INT             NOT NULL                ,
    SBCU_CUEN                   INT             NOT NULL                ,
    SBCU_CLAS                   INT             NOT NULL                ,
    SBCU_GRUP                   INT             NOT NULL                ,
    SBCU_ESTADO                 VARCHAR(1)      NOT NULL DEFAULT('A')   ,
    SBCU_NOMBRE                 VARCHAR(50)     NOT NULL                ,
    SBCU_CODIGO                 INT             NOT NULL                ,
    SBCU_DESCRIPCION            VARCHAR(250)    NOT NULL                ,
PRIMARY KEY (SBCU_SBCU)
);