# DATA FRAME

# REPASO: Los data frames son estructuras de datos de dos dimensiones (rectangulares) que pueden contener datos de diferentes tipos, por lo tanto, son heterogéneas. 
# Podemos entender a los data frames como una versión más flexible de una matriz. Mientras que en una matriz todas las celdas deben contener datos del mismo tipo, los renglones de un data frame admiten datos de distintos tipos, pero sus columnas conservan la restricción de contener datos de un sólo tipo.

# Agregar nombre a filas y columnas

# Establecer nombres de fila o columna a un objeto similar a una matriz

# Crear un data frame de ejemplo
df <- data.frame(   # Este formato lo logré con Ctrl + Shift + A
  x = c(1:4),
  y = c(5:8)
) 

# Asignar nombres a las filas
rownames(df) <- c("Obs_a", "Obs_b", "Obs_c", "Obs_d")

# Asignar nombres a las columnas
colnames(df) <- c("col_1", "col_2")

# Mostrar el data frame con los nombres de las filas y columnas
df

# Extra: otra forma de RENOMBRAR columnas con dplyr del Tidyverse

# Importamos la librería
library(dplyr)

# Creamos un objeto Tibble del data frame
df_tbl <- as_tibble(df)

# Renombramos la columna
df_tbl <- rename(df_tbl, Columna_1 = col_1) 

# Mostrar el data frame Tibble renombrado
df_tbl
