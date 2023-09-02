####################
# OPERADOR PIPE
####################

# Manipulando datos con el Operador Pipe %>%

# Los pipes son una herramienta poderosa para expresar claramente una secuencia de múltiples operaciones. El operador pipe es muy util, ya que podemos aplicar una secuencia de funciones sin renombrar el conjunto de datos
# El pipe, %>%, viene del paquete magrittr de Stefan Milton Bache. Los paquetes del Tidyverse cargan %>% automáticamente, por lo que usualmente no tendrás que cargar magrittr de forma explícita. 
# El objetivo de un pipe es ayudarte a escribir código de una manera que sea más fácil de leer y entender.

library(tidyverse)

Datos = data.frame(
  id=c(1:10),
  Nombre=c("Brune", "Clara", "David", "Leo", "Pedro", "Claudia", "Alex", "Ignacio", "Jose", "Lucas" ),
  Edad=c(20, 32, 18, 26, 38, 52, 19, 31, 29, 60 ),
  Peso=c(68, 42, 70, 47, 76, NA, 71, 83, 69, 92))

# "cbind" toma una secuencia de argumentos vectoriales, matriciales o de data frame y los combina por columnas o filas, respectivamente.

Datos <- cbind(Datos,Genero=c("X","F","M","X","M","F","X","M","X","M"))

select(Datos,id,Nombre,Peso)
filter(Datos,Edad<60)

Datos %>% select(id,Nombre,Peso) %>% filter(Edad > 50)

Datos %>% #Nombramos el conjunto de datos con el que queremos trabajar
  select(Nombre, Edad,Genero) %>%    #Seleccionamos las columnas
  filter(Edad<60) %>%  #Filtramos por edad<60
  group_by(Genero)%>% #Agrupamos por Genero
  summarise(Edad_promedio=mean(Edad)) #Calculamos la edad promedio para cada Genero

