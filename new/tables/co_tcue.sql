CREATE TABLE CO_TCUE(
CUE_CUE                 INT              NOT NULL                 ,
CUE_GRU					INT 		 NOT NULL		  			  ,
CUE_ESTADO              VARCHAR(1)       NOT NULL DEFAULT('A')    ,
CUE_NOMBRE 				VARCHAR(50)      NOT NULL		  		  ,
CUE_CODIGO		 		INT 		      NOT NULL		   		   , -- 
CUE_DESCRIPCION		    VARCHAR(150)      NOT NULL		   		   , -- 
PRIMARY KEY (CUE_CUE)
);