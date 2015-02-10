CREATE TABLE CO_TGRU(
GRU_GRU                 INT              NOT NULL                 ,
GRU_CLAS				INT 		     NOT NULL		  		  ,
GRU_ESTADO              VARCHAR(1)       NOT NULL DEFAULT('A')    , 
GRU_NOMBRE 				VARCHAR(50)      NOT NULL		  		  , 
GRU_CODIGO		 		INT 		      NOT NULL	    		   , -- 
GRU_DESCRIPCION		    VARCHAR(150)      NOT NULL		   		   , -- 
PRIMARY KEY (GRU_GRU)
);