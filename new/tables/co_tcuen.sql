CREATE TABLE CO_TCUEN(
    CUEN_CUEN                   INT                 NOT NULL               ,
    CUEN_GRUP                    INT                 NOT NULL               ,
    CUEN_ESTADO                 VARCHAR(1)          NOT NULL DEFAULT('A')  ,
    CUEN_NOMBRE                 VARCHAR(50)         NOT NULL               ,
    CUEN_CODIGO                 INT                 NOT NULL               ,
    CUEN_DESCRIPCION            VARCHAR(250)        NOT NULL               ,
PRIMARY KEY (CUEN_CUEN)
);