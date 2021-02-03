
#Alojar el fichero data.csv en una base de datos llamada match_games, 
#nombrando al collection como match
library(mongolite)
data.csv <- read.csv("data.csv")

bd <- mongo(
  collection = "match",
  db = "match_games"
)
#Una vez hecho esto, realizar un count para conocer el número de 
# registros que se tiene en la base
bd$insert(data.csv)

bd$count()

#Realiza una consulta utilizando la sintaxis de Mongodb, en la base 
# de datos para conocer el número de goles que metió el Real Madrid el 
# 20 de diciembre de 2015 y contra que equipo jugó, ¿perdió ó fue goleada?


bd$find('{"date" : "2015-12-20", "home_team":"Real Madrid"}')
# Fue goleada del Real Madrid

#Por último, no olvides cerrar la conexión con la BDD
bd$disconnect()
