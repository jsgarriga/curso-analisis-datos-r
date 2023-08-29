##################		
# PAQUETE DATASETS
##################

# Exploramos el paquete
?datasets
library(help = "datasets") # otra manera de pedir ayuda

# Revisamos la ayuda de un data set dentro de la librería
?AirPassengers 

# Visualizamos un data set
AirPassengers

# Un clásico, como Iris...
?Titanic  

# Ejemplo de gráficos en el data set
require(graphics)
mosaicplot(Titanic, main = "Sobrevivientes en el Titanic") # gráfico de mosaicos
## Matriz de sobrevivientes por edad
apply(Titanic, c(3, 4), sum)
## Matriz de sobrevivientes por género
apply(Titanic, c(2, 4), sum)

# El famoso data set de Iris. Para investigar en casa
?iris

