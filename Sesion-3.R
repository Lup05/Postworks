library(dplyr)

path.f <- setwd("c:/Users/gely_/Documents/ArchivosF")
t17.18 <- select(read.csv("D1.csv"), Date, HomeTeam, AwayTeam, FTHG, FTAG, FTR) #temporada 2017/2018 1ra Temp
t18.19 <- select(read.csv("D1 (1).csv"), Date, HomeTeam, AwayTeam, FTHG, FTAG, FTR) #temporada 2018/2019 1ra Temp
t19.20 <- select(read.csv("D1 (2).csv"), Date, HomeTeam, AwayTeam, FTHG, FTAG, FTR) #temporada 2019/2020 1ra Temp

t17.18 <- mutate(t17.18, Date = as.Date(Date, "%d/%m/%y")) #Se corrige el tipo de dato fecha de caracter(char) a fecha(Date)
t18.19 <- mutate(t18.19, Date = as.Date(Date, "%d/%m/%y"))
t19.20 <- mutate(t19.20, Date = as.Date(Date, "%d/%m/%y"))

t17.20 <- lapply(dir(),read.csv)
t17.20 <- lapply(t17.20, select, Date, HomeTeam, AwayTeam,FTHG,FTAG,FTR)

t17.20 <- do.call(rbind, t17.20)

#1 Con el último data frame obtenido en el postwork de la sesión 2, 
#elabora tablas de frecuencias relativas para estimar las siguientes probabilidades:

# > La probabilidad (marginal) de que el equipo que juega en casa anote x goles (x=0,1,2,)

mp.C <- prop.table(table(t17.20$FTHG))#Probabilidad marginal de el equipo que juega en casa

# > La probabilidad (marginal) de que el equipo que juega como visitante anote y goles (y=0,1,2,)

mp.V <- prop.table(table(t17.20$FTAG))#Probabilidad marginal de el equipo que juega como visitante

# > La probabilidad (conjunta) de que el equipo que juega en casa anote x goles y el equipo 
#   que juega como visitante anote y goles (x=0,1,2,, y=0,1,2,)

totG <- table(t17.20$FTHG,t17.20$FTAG)/nrow(t17.20)

#2 Realiza lo siguiente:

# > Un gráfico de barras para las probabilidades marginales estimadas del número de 
#   goles que anota el equipo de casa

hist(mp.C, breaks = seq(-0.02, 0.35, 0.01), 
     main = "Probabilidad Marginal de goles FTHG",
     xlab = "Probabilidad",
     ylab = "Goles")

# > Un gráfico de barras para las probabilidades marginales estimadas del número de 
#   goles que anota el equipo visitante.
hist(mp.V, breaks = "Sturges", 
     main = "Probabilidad Marginal de goles FTAG",
     xlab = "Probabilidad",
     ylab = "Goles")

# > Un HeatMap para las probabilidades conjuntas estimadas de los números de goles 
#   que anotan el equipo de casa y el equipo visitante en un partido.
library(ggplot2)
totG <- as.data.frame(totG)
totG <- rename(totG, FTHG = Var1, FTAG = Var2)

ggplot(totG,
       aes(x = FTHG, y = FTAG, fill = Freq)) + 
      geom_tile() + scale_fill_gradientn(colours = rainbow(7))
