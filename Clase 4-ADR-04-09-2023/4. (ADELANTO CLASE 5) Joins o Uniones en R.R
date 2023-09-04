#####################
# PREVIEW UNIONES	#
#####################

# Unir Columnas con CBIND y Filas con RBIND {base}

# Unir columnas con CBIND

Datos_1 <- data.frame(
  id=c(1:10),
  Nombre=c("Juan", "Clara", "David", "Juana", "Pedro", "Claudia", "Andy", "Ignacio", "Jose", "Lucas"))

Datos_2 <- data.frame(
  Edad=c(20, 32, 18, 26, 38, 52, 19, 31, 29, 60 ),
  Peso=c(68, 42, 70, 47, 76, NA, 71, 83, 69, 92))

datos_combinados <- cbind(Datos_1, Datos_2)
View(datos_combinados)

# Unir filas con RBIND

Datos_3 <- data.frame(
  id = c(20:29),
  Nombre = c("Juan", "Clara", "David", "Juana", "Pedro", "Claudia", "Andy", "Ignacio", "Jose", "Lucas")
)

datos_combinados_2 <- rbind(Datos_1, Datos_3)
View(datos_combinados_2)


##################
# JOINS y MERGE #
##################

library(tidyverse)

Datos_4 = data.frame(
  Id=c(1:6),
  Nombre=c("Juan", "Clara", "David", "Juana", "Pedro", "Claudia")
)

Datos_5 = data.frame(
  Id=c(1,2,5,6,8,9),
  Edad=c(20,32,38,52,31,29)
)

# INNER JOIN

inner_join(Datos_4, Datos_5, by = "Id")

# Próxima clase: repaso y uniones externas