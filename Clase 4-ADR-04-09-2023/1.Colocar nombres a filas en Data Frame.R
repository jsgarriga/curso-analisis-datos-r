# Agregar nombre a filas

# Crear un data frame de ejemplo
df <- data.frame(
  x = c(1, 2, 3),
  y = c(4, 5, 6)
)

# Asignar nombres a las filas
rownames(df) <- c("fila1", "fila2", "fila3")

# Mostrar el data frame con los nombres de filas
df
