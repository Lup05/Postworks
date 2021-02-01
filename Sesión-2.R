###################################### POSTWORK ####################################
#Importa los datos de soccer de las temporadas 2017/2018, 2018/2019 y 2019/2020 
#de la primera división de la liga española
path.f <- setwd("c:/Users/gely_/Documents/ArchivosF")
t17.18 <- select(read.csv("D1.csv"), Date, HomeTeam, AwayTeam, FTHG, FTAG, FTR) #temporada 2017/2018 1ra Temp
t18.19 <- select(read.csv("D1 (1).csv"), Date, HomeTeam, AwayTeam, FTHG, FTAG, FTR) #temporada 2018/2019 1ra Temp
t19.20 <- select(read.csv("D1 (2).csv"), Date, HomeTeam, AwayTeam, FTHG, FTAG, FTR) #temporada 2019/2020 1ra Temp

#Obten una mejor idea de las características de los data frames al usar las funciones: 
#str, head, View y summary
str(t17.18); str(t18.19); str(t19.20)
t17.18 <- mutate(t17.18, Date = as.Date(Date, "%d/%m/%y")) #Se corrige el tipo de dato fecha de caracter(char) a fecha(Date)
t18.19 <- mutate(t18.19, Date = as.Date(Date, "%d/%m/%y"))
t19.20 <- mutate(t19.20, Date = as.Date(Date, "%d/%m/%y"))

head(t17.18); head(t18.19); head(t19.20)
View(t17.18); View(t18.19); View(t19.20)
summary(t17.18); summary(t18.19); summary(t19.20)

#Con la función select del paquete dplyr selecciona únicamente las columnas Date, 
#HomeTeam, AwayTeam, FTHG, FTAG y FTR; esto para cada uno de los data frames. 
#(Hint: también puedes usar lapply).
t17.20 <- lapply(dir(),read.csv)
t17.20 <- lapply(t17.20, select, Date, HomeTeam, AwayTeam,FTHG,FTAG,FTR)

#Asegúrate de que los elementos de las columnas correspondientes de los nuevos 
#data frames sean del mismo tipo (Hint 1: usa as.Date y mutate para arreglar las fechas).
#Con ayuda de la función rbind forma un único data frame que contenga las seis 
#columnas mencionadas en el punto 3 (Hint 2: la función do.call podría ser utilizada).
t17.20 <- do.call(rbind, t17.20)
head(data)
