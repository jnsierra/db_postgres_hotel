CREATE TABLE CO_TGRUP(
    GRUP_GRUP               INT              NOT NULL                 ,
    GRUP_CLAS               INT              NOT NULL                 ,
    GRUP_ESTADO             VARCHAR(1)       NOT NULL DEFAULT('A')    , 
    GRUP_NOMBRE             VARCHAR(50)      NOT NULL                 , 
    GRUP_CODIGO             INT              NOT NULL                 ,
    GRUP_DESCRIPCION        VARCHAR(250)     NOT NULL                 ,
PRIMARY KEY (GRUP_GRUP)
);