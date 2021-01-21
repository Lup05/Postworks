# Postwork 1 
##### Importa los datos de soccer de la temporada 2019/2020 de la primera división de la liga española a R, los datos los puedes encontrar en el siguiente enlace: https://www.football-data.co.uk/spainm.php

##### Obtenemos el archivo csv y lo nombramos t19a20.p1
library(dplyr)
t19a20.p1 <- as.data.frame(read.csv("SP1.csv")) 

##### Creamos un df solo con los datos FTHG y FTAG
HG.AG <- data.frame(select(t19a20.p1, FTHG, FTAG)) 
dim(HG.AG)

##### Probabilidad marginal de el equipo que juega en casa
prop.table(table(HG.AG$FTHG)) 
##### Probabilidad marginal de el equipo que juega como visitante
prop.table(table(HG.AG$FTAG)) 

##### Probabilidad conjunta 
totG <- c(HG.AG$FTHG, HG.AG$FTAG)
totG
table(totG) 



###### table(HG.AG$FTHG)
###### table(HG.AG$FTAG)
