#GRAFICO DE BARRAS CON GGPLOTT2

#Para armar el gráfico de barras, vamos primero a recurrir a agrupar por Specie
#y calcular la suma de la variable Sepal Length
library(tidyverse)

Datos<-iris


Datos_agrupados<-Datos%>%
  group_by(Species)%>%
  summarise(Suma_SepalLength=sum(Sepal.Length))

#Una vez obtenidos los datos los podemos graficar


ggplot(data=Datos_agrupados)+
  geom_bar(aes(x=Species,weight=Suma_SepalLength))


#Igual que antes le podemos dar color


ggplot(data=Datos_agrupados)+
  geom_bar(aes(x=Species,weight=Suma_SepalLength),
           fill="#f7dda4", color = "red")



ggplot(data=Datos_agrupados)+
  geom_bar(aes(x=Species,weight=Suma_SepalLength),
           fill=c("red","blue", "yellow"))


#BOXPLOT CON GGPLOTT2

ggplot(data=Datos, aes(x=Species,y=Sepal.Width))+
  geom_boxplot()


ggplot(data=Datos, aes(x=Species,y=Sepal.Width))+
  geom_boxplot(fill = "green", color = "blue")+
  theme_linedraw()



