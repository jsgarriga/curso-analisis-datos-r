#######################################		
# TRANSFORMACION DE DATOS -- TIDYVERSE
#######################################

library(tidyverse)


Datos <- data.frame(
  id=c(1:10),
  Nombre=c("Juan", "Clara", "David", "María", "Pedro", "Claudia", "Martín", "Ignacio", "Jose", "Lucas" ),
  Edad=c(20, 32, 18, 26, 38, 52, 19, 31, 29, 60 ),
  Peso=c(68, 42, 70, 47, 76, NA, 71, 83, 69, 92)
)

#SELECT
personas <- select(Datos,Edad)
select(Datos,Nombre,Edad,id)
select(Datos,-Edad)

#FILTER
filter(Datos,Edad>50)
filter(Datos, Nombre!="Pedro" & Nombre!="María")

#RENAME
rename(Datos,Nombre_2=Nombre)
Datos <- rename(Datos,Nombre_2=Nombre)


#ARRANGE
arrange(Datos,Edad)
arrange(Datos,-Edad)

#MUTATE
mutate(Datos,Peso_Edad=Peso+Edad)
mutate(Datos,Promedio_Peso=Peso*2)
Datos <- mutate(Datos,Grasa=Peso/Edad)
mutate(Datos,Edad_Promedio=mean(Edad))

mutate(Datos,Edad_50=ifelse(Edad>50,1,0), Peso_alto=ifelse(Peso>60,"Alto","Bajo"))

mutate(Datos,Edad_nueva=case_when(
  Edad<=22~"Adolescente",
  Edad>22 & Edad<60~"Adulto",
  Edad>=60~"Mayor"
))

Datos <- mutate(Datos,Edad_nueva=case_when(
  Edad<=22~"Adolescente",
  Edad>22 & Edad<60~"Adulto",
  Edad>=60~"Mayor"
))

###############################################
##########
#GROUP BY
#########

df <- iris
df

df1 <- group_by(df,Species)
df1

summarise(df, PromedioSepalo = mean(Sepal.Length))

summarise(df1, PromedioSepalo = mean(Sepal.Length))
#############################################################

#SUMMARISE

summarise(group_by(Datos,Edad_nueva),Suma_edad=sum(Edad)) 
