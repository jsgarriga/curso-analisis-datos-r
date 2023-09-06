# ANÁLISIS DE DATOS CON R

# Importamos las librerías
library(tidyverse)
library(readxl)

# Cargamos los datos

clientes_excel <- read_excel(path = "Clientes.xlsx", sheet = "Clientes") # Datos Clientes

facturacion_excel <- read_excel(path = "Facturacion.xlsx", sheet = "Facturacion") # Datos Facturación

Clie_Fact <- merge(clientes_excel, facturacion_excel, by.x = "Cliente", by.y = "Codigo", all = TRUE) # Merge entre Clientes y Facturación

# Resumimos el total de ventas por cliente en orden descendente
Ventas_Clientes <- Clie_Fact %>%            # Crear y seleccionar
  group_by(`Nombre y Apellido`) %>%         # Agrupar
  summarise(Total_Ventas = sum(Total)) %>%  # Resumir
  arrange(desc(Total_Ventas))               # Ordenar

# Vemos el resumen
Ventas_Clientes

# VISUALIZACION DE DATOS CON R

# Para más info, ver
# https://ggplot2.tidyverse.org/
# https://r-graph-gallery.com/ggplot2-package.html

# Ejemplo de visualización

# Keep 30 first rows in the mtcars natively available dataset
data <- head(mtcars, 30)

# 1/ add text with geom_text, use nudge to nudge the text
ggplot(data, aes(x=wt, y=mpg)) +
  geom_point() + # Show dots
  geom_text(
    label=rownames(data), 
    nudge_x = 0.25, nudge_y = 0.25, 
    check_overlap = T
  )

# Para hacer estos gráficos vamos a utilizar los datos que vienen en R llamados Iris. Primero visualizamos cómo esta compuesto este conjunto de datos:

# Cargamos y exploramos los datos
Datos <- iris
head(Datos, 10)

# Creamos un gráfico de dispersión
ggplot(Datos, aes(Sepal.Length, Sepal.Width)) +
  geom_point(size = 3, color = "navy") 
# Con size fijamos el tamaño de los puntos, con color el color je

# Visualizamos las distinas especies
ggplot(Datos, aes(Sepal.Length, Sepal.Width, color = Species)) +
  geom_point(size = 2, alpha = 0.7) + 
  facet_wrap(~Species) # Para ver en distintos cuadros las especies

# Usamos "Shape" para cambiar la forma de los puntos
ggplot(Datos, aes(Sepal.Length, Sepal.Width, color = Species)) +
  geom_point(size = 5, alpha = 0.7, shape = "+")

# Añadimos títulos y nombres para cada eje, entre otras etiquetas
ggplot(Datos, aes(Sepal.Length, Sepal.Width, color = Species)) +
  geom_point(size = 3, alpha = 0.7) + 
  labs(title = "Largo y ancho de los sépalos según el tipo de especie",
       x = "Largo",
       y = "Ancho",
       color = "Especie")
# NOTA: cada etiqueta en labs hace referencia a un parámetro previamente definido, por ejemplo, color en "ggplot" es "Species", por ello en labs se entiende que "color" sea nombrado como "Especie". Los mismo con x e y de "aes".



