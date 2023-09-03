# ANÁLISIS DE DATOS CON R

# Importamos todas las librerías del Tidyverse
library(tidyverse)

Ventas_Clientes <- Clie_Fact %>% 
  group_by(`Nombre y Apellido`) %>% 
  summarise(Total_Ventas = sum(Total)) 

# VISUALIZACION DE DATOS CON R

# Para hacer estos gráficos vamos a utilizar los datos que vienen en R llamados Iris. Primero visualizamos como esta compuesto este conjunto de datos

Datos<-iris
head(Datos,10)

ggplot(data=Datos, aes(Sepal.Length,Sepal.Width))+
  geom_point()
  #geom_quantile()

ggplot(data=Datos)+
  geom_point(aes(x=Sepal.Length,y=Sepal.Width))

#Aumentar el tama?o de los puntos

ggplot(data=Datos)+
  geom_point(aes(x=Sepal.Length,y=Sepal.Width),size=3)


#Cambiar el color

ggplot(data=Datos)+
  geom_point(aes(x=Sepal.Length,y=Sepal.Width),
             size=3, color="#42c452")


#Darle un poco de transparencia a los puntos (este parametro alpha varia entre 0 y 1)

ggplot(data=Datos)+
  geom_point(aes(x=Sepal.Length,y=Sepal.Width,color=Species),
             alpha = 0.7, size=3)

#Podemos usar una variable categ?rica para q haga un grafico para cada una de sus categorias

ggplot(data=Datos)+
  geom_point(aes(x=Sepal.Length,y=Sepal.Width, color=Species),
             alpha = .4, size=3, )+
  facet_wrap(~Species)


# Con el parametro shape cambiamos el tipo de forma para representar a las observaciones

ggplot(data=Datos)+
  geom_point(aes(x=Sepal.Length,y=Sepal.Width,color=Species),
             alpha = .8, size=3, shape="@")

ggplot(data=Datos)+
  geom_point(aes(x=Sepal.Length,y=Sepal.Width,color=Species,shape=Species),
             alpha = .8, size=3)


ggplot(data=Datos)+
  geom_point(aes(x=Sepal.Length,y=Sepal.Width,color=Species),
             alpha = .8, size=3, shape="??????")

#Cambiar titulos

ggplot(data=Datos)+
  geom_point(aes(x=Sepal.Length,y=Sepal.Width,color=Species),
             alpha = .4, size=3)+
  labs(x="Sepal Length",  y="Sepal Width",color="Tipo")










