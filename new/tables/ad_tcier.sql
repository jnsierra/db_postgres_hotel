CREATE TABLE AD_TCIER(
    CIER_CIER                   SERIAL                                  ,
    CIER_FECH                   TIMESTAMP       NOT NULL                ,
    CIER_USUA                   INT             NOT NULL                ,
    CIER_VLRI                   INT             NOT NULL                ,
    CIER_VLRT                   INT      		NOT NULL			    ,
    CIER_VLRC                 	INT			    NOT NULL                ,
    CIER_SEDE                   INT     		NOT NULL                ,
    CIER_ESTADO                 VARCHAR(2)    	NOT NULL                ,
PRIMARY KEY (CIER_CIER)
);