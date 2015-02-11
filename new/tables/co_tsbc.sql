CREATE TABLE CO_TSBC(
SBC_SBC                 INT              NOT NULL                 ,
SBC_CUE					INT 		 NOT NULL		  			  ,
SBC_CLAS				INT 		 NOT NULL		  			  ,
SBC_GRU					INT 		 NOT NULL		  			  ,
SBC_ESTADO              VARCHAR(1)       NOT NULL DEFAULT('A')    ,
SBC_NOMBRE 				VARCHAR(50)      NOT NULL		  		  ,
SBC_CODIGO		 		INT 		      NOT NULL	    		   , -- 
SBC_DESCRIPCION		    VARCHAR(250)      NOT NULL		   		   , -- 
PRIMARY KEY (SBC_SBC)
);