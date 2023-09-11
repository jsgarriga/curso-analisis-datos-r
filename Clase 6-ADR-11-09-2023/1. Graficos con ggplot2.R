# REPASO VISUALIZACIÓN DE DATOS

# Importamos las librerías necesarias
library(tidyverse)

# Para más info, ver
# https://ggplot2.tidyverse.org/
# https://r-graph-gallery.com/ggplot2-package.html

# Ejemplo de visualización de gráfico de dispersión (clase 5)

# Mantener las 30 primeras filas de los datos de mtcars
data <- head(mtcars, 30)

# Agregar texto con geom_text, usa nudge para mostrar el texto
ggplot(data, aes(x=wt, y=mpg)) +
  geom_point() + # Show dots
  geom_text(
    label=rownames(data), 
    nudge_x = 0.25, nudge_y = 0.25, 
    check_overlap = T
  )

# Otro ejemplo con series temporales (clase 6)

# Gráfico de líneas con geom_path

# Se crea un objeto a que almacena un objeto ggplot, que utilizará los datos de "economics". Se establece que el eje x será la variable "date" y el eje y será la variable "unemploy"

a <- ggplot(economics, aes(date, unemploy))

# Se utiliza el operador + para agregar una capa geom_path al gráfico a. Esta capa genera un gráfico de líneas, donde los puntos se conectan con líneas. Se especifican algunos parámetros para el estilo de las líneas, como lineend (extremo de línea), linejoin (unión de líneas) y linemitre (mitra de línea)

a + geom_path(lineend = "butt",
              linejoin = "round", linemitre = 7)

# Gráfico de bandas

# Se utiliza el objeto a creado anteriormente y se agrega una nueva capa geom_ribbon al gráfico. Esta capa crea una banda (ribbon) que se extiende entre dos líneas, definidas por los valores ymin y ymax. En este caso, la banda se crea alrededor de la variable unemploy, con un valor mínimo de unemploy - 1900 y un valor máximo de unemploy + 1900. Esto crea una región sombreada alrededor de la línea que representa la variable unemploy

a + geom_ribbon(aes(ymin = unemploy - 1900,
                    ymax = unemploy + 1900))

# Se aplica el tema theme_dark() al gráfico, que cambia el fondo y otros elementos del gráfico para tener un aspecto oscuro

a + geom_ribbon(aes(ymin = unemploy - 1900,
                    ymax = unemploy + 1900)) + theme_dark()


# CLASE 6 (11/9/2023)

# Paso a paso de cómo crear un gráfico de barras

# Importamos los datos
iris 
Datos <- as.tibble(iris)
Datos

# Creamos las estéticas para la geometría de barras
ggplot(Datos) +
  geom_bar(aes(x = Species))

# Añadimos detalles visuales
ggplot(Datos) + # Cargamos los datos
  geom_bar(aes(x = Species), # Definimos la geometría y variables
           alpha = .4, # Fijamos la transparencia
           color = "navy", # Color de contorno
           fill = "green") + # Color de relleno
  labs(title = "Recuento según especies", # Aplicamos etiquetas
       x = "Especies",
       y = "Cantidad")

# Revisamos un error
ggplot(Datos) +
  geom_bar(aes(x=Species),
           alpha = .4,
           color = "navy",
           fill= "green")

# Probamos con otro conjunto de datos
# Detalles
# Ordenar por frecuencia
# Cantidad por barra

# Importamos los datos
Autos <- mpg

# Barras apiladas
ggplot(Autos) +
  geom_bar(aes(x = fl, fill = class)) + 
  labs(title = "Tipo de combustible por clase de vehículo",
       x =  "Tipo de combustible",
       y = "Cantidad",
       fill = "Clase de vehículo")

# Vista por facetas
ggplot(Autos) +
  geom_bar(aes(x = fl)) + 
  facet_wrap(~class) + # Vemos por facetas el tipo de clase
  labs(title = "Tipo de combustible por clase de vehículo",
       x = "Tipo de combustible",
       y = "Cantidad")

# Visualización por histogramas
ggplot(Autos) + # Definimos los datos del gráfico
  geom_histogram(aes(x = cty), # Definimos el histograma
                 binwidth = 5, # Ancho de la barra
                 color = "red",
                 fill = "orange") + 
  labs(title = "Histograma de millas por galón en ciudad",
       x = "Millas por galón",
       y = "Frecuencia")


# EXTRAS: MÁS VISUALIZACIONES!!!
# GRAFICO DE BARRAS CON GGPLOTT2

# Para armar el gr?fico de barras de Iris, vamos a recurrir a agrupar por Specie y a calcular la suma de la variable Sepal Length

Datos <- iris

Datos_agrupados <- Datos%>%
  group_by(Species)%>%
  summarise(Suma_SepalLength=sum(Sepal.Length))

# Una vez obtenidos los datos los podemos graficar

ggplot(data=Datos_agrupados)+
  geom_bar(aes(x=Species,weight=Suma_SepalLength))

# Igual que antes le podemos dar color

ggplot(data=Datos_agrupados)+
  geom_bar(aes(x=Species,weight=Suma_SepalLength),
           fill="#f7dda4", color = "red")



ggplot(data=Datos_agrupados)+
  geom_bar(aes(x=Species,weight=Suma_SepalLength),
           fill=c("red","blue", "yellow"))


# BOXPLOT CON GGPLOTT2

ggplot(data=Datos, aes(x=Species,y=Sepal.Width))+
  geom_boxplot()


ggplot(data=Datos, aes(x=Species,y=Sepal.Width))+
  geom_boxplot(fill = "green", color = "blue")+
  theme_linedraw()