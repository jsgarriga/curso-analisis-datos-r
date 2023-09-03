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

# Para hacer estos gráficos vamos a utilizar los datos que vienen en R llamados Iris. Primero visualizamos cómo esta compuesto este conjunto de datos:

# Cargamos y exploramos los datos
Datos <- iris
head(Datos, 10)

# Creamos un gráfico de dispersión entre el largo y ancho de los sépalos
ggplot(data=Datos, aes(Sepal.Length,Sepal.Width))+
  geom_point()

# Otra forma...
ggplot(data=Datos)+
  geom_point(aes(x=Sepal.Length,y=Sepal.Width))

# Aumentar el tamaño de los puntos
ggplot(data=Datos) +
  geom_point(aes(x=Sepal.Length,y=Sepal.Width),size=3)


# Cambiar el color para todos los puntos
ggplot(data=Datos)+
  geom_point(aes(x=Sepal.Length,y=Sepal.Width),
             size=3, color="#42c452")


# Cambiar el color por especie de flor
# Además, le damos un poco de transparencia a los puntos (este parámetro alpha varia entre 0 y 1)
ggplot(data=Datos)+
  geom_point(aes(x=Sepal.Length,y=Sepal.Width,color=Species),
             alpha = 0.7, size=3)

# Podemos usar una variable categórica para que haga un gráfico para cada una de sus categorías, en nuestro caso, las especies
ggplot(data=Datos)+
  geom_point(aes(x=Sepal.Length,y=Sepal.Width, color=Species),
             alpha = .4, size=3, )+
  facet_wrap(~Species)


# Con el parámetro "shape" cambiamos el tipo de forma para representar a las observaciones

# Ejemplo 1
ggplot(data=Datos)+
  geom_point(aes(x=Sepal.Length,y=Sepal.Width,color=Species),
             alpha = .8, size=3, shape="@")

# Ejemplo 2
ggplot(data=Datos)+
  geom_point(aes(x=Sepal.Length,y=Sepal.Width,color=Species,shape=Species),
             alpha = .8, size=3)

# Ejemplo 3
ggplot(data=Datos)+
  geom_point(aes(x=Sepal.Length,y=Sepal.Width,color=Species),
             alpha = .8, size=3, shape="*")

# Cambiar títulos
ggplot(data=Datos) +
  geom_point(aes(x=Sepal.Length,
                 y=Sepal.Width,
                 color=Species),
             alpha = .4, size=3) +
  labs(title = "Largo y ancho de los sépalos según el tipo de especie", 
       x="Largo", 
       y="Ancho",
       color="Especie")
