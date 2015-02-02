CREATE TABLE CO_TSBC(
SBC_SBC                 INT              NOT NULL                 ,
SBC_CUE					INT 		 NOT NULL		  			  ,
SBC_ESTADO              VARCHAR(1)       NOT NULL DEFAULT('A')    ,
SBC_NOMBRE 				VARCHAR(50)      NOT NULL		  		  ,
PRIMARY KEY (SBC_SBC)
);