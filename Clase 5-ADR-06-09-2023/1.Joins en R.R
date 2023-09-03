########################
#JUNTAR DOS DATA FRAMES
########################

# Unir Columnas con CBIND y Filas con RBIND {base}

# Toma una secuencia de argumentos vectoriales, matriciales o de data frames y los combina por columnas o filas, respectivamente.

# Unir Columnas con CBIND

# cbind() para unir vectores o etc., usando cada uno como una columna. Si utilizamos cbind(), entonces cada vector o etc. será una columna.

Datos_1 = data.frame(
  id=c(1:10),
  Nombre=c("Juan", "Clara", "David", "Juana", "Pedro", "Claudia", "Andy", "Ignacio", "Jose", "Lucas"))

Datos_2 = data.frame(Edad=c(20, 32, 18, 26, 38, 52, 19, 31, 29, 60 ),
                     Peso=c(68, 42, 70, 47, 76, NA, 71, 83, 69, 92))

Datos_1_2 <- cbind(Datos_1,Datos_2) # aplicamos la función

# Unir Filas con RBIND

# rbind() para unir vectores o etc., usando cada uno como un renglón. Usamos rbind() para crear una matriz o etc., en la que cada vector o etc. será un renglón.

Datos_1 = data.frame(
  id=c(1:10),
  Nombre=c("Juan", "Clara", "David", "Juana", "Pedro", "Claudia", "Andy", "Ignacio", "Jose", "Lucas" ))

Datos_3 = data.frame(
  Id=c(11,12,13),
  nombre=c("Ximena","Bruno","Silvina"))

Datos_1_3 <- rbind(Datos_1,Datos_3) # aplicamos la función

##################
# JOINS y MERGE #
##################

# Importamos las librerías
library(tidyverse)
library(readxl)

# Definimos los data frame
Datos_4 = data.frame(
  Id=c(1:6),
  Nombre=c("Juan", "Clara", "David", "Juana", "Pedro", "Claudia")
)

Datos_5 = data.frame(
  Id=c(1,2,5,6,8,9),
  Edad=c(20,32,38,52,31,29)
)

# Sobre los joins en dplyr: Las uniones agregan columnas de y a x, haciendo coincidir las observaciones según las claves o keys. Hay cuatro uniones: la unión interna y las tres uniones externas.

# Unión interna: solo mantiene observaciones de x que tienen una clave coincidente en y.

inner_join(Datos_4, Datos_5, by="Id")

# Uniones externas: Las tres uniones externas mantienen observaciones que aparecen en al menos uno de los data frames.

# Left join: mantiene todas las observaciones en x.

left_join(Datos_4, Datos_5, by="Id")


# Right join: mantiene todas las observaciones en y.

right_join(Datos_4, Datos_5, by="Id")


# Full join: mantiene todas las observaciones en x e y.

full_join(Datos_4, Datos_5, by="Id")


# Función MERGE {base}

# Fusiona dos data frames mediante columnas comunes entre ambos. De forma predeterminada, los data frames se combinan en las columnas con nombres que ambos tienen.

# Cargamos los datos

# Clientes
clientes_excel <- read_excel(path = "Clientes.xlsx", sheet = "Clientes")

# Facturación
facturacion_excel <- read_excel(path = "Facturacion.xlsx", sheet = "Facturacion")

# Realizamos los merge entre los dos conjuntos de datos

Clie_Fact <- merge(clientes_excel, facturacion_excel, by.x = "Cliente", by.y = "Codigo", all = TRUE)

Fact_Clie <- merge(facturacion_excel,clientes_excel , by.x ="Codigo" , by.y = "Cliente", all = TRUE)

