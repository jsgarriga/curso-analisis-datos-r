#######################################		
# TRANSFORMACION DE DATOS -- TIDYVERSE
#######################################

# Importamos todas las librerías del Tidyverse
library(tidyverse)

# Creamos nuestro conjunto de datos
Datos <- data.frame(
  id=c(1:10),
  Nombre=c("Pepe", "Clara", "Jose", "Edu", "Calu", "Claudia", "Aiko", "Ignacio", "Mona", "Pau" ),
  Edad=c(20, 32, 18, 26, 38, 52, 19, 31, 29, 60 ),
  Peso=c(68, 42, 70, 47, 76, NA, 71, 83, 69, 92)
)

# SELECT

# select() te permite seleccionar rápidamente un subconjunto útil de datos utilizando operaciones basadas en los nombres de las variables.

# Seleccionar columnas por nombre
personas <- select(Datos,Edad) # selecciona los datos y la variable
select(Datos,Nombre,Edad,id)
select(Datos,-Edad) # selecciona todo excepto la variable "Edad"

# Hay una serie de funciones auxiliares que puedes usar dentro de select():
# starts_with("abc"): coincide con los nombres que comienzan con “abc”.
# ends_with("xyz"): coincide con los nombres que terminan con “xyz”.
# contains("ijk"): coincide con los nombres que contienen “ijk”.
# matches("(.)\\1"): selecciona variables que coinciden con una expresión regular. Esta en particular coincide con cualquier variable que contenga caracteres repetidos.
# num_range("x", 1:3): coincide con x1,x2 y x3.
# Consulta ?select para ver más detalles.

# FILTER

# filter() te permite filtrar un subconjunto de observaciones según sus valores. El primer argumento es el nombre del data frame. El segundo y los siguientes argumentos son las expresiones que lo filtran. 

filter(Datos,Edad>50) # Edades mayores a 50 años
filter(Datos, Nombre!="Pepe" & Nombre!="Mona") # Todos los nombres excepto Pepe y Mona

# RENAME

# select() se puede usar para cambiar el nombre de las variables, pero rara vez es útil porque descarta todas las variables que no se mencionan explícitamente. En su lugar, utiliza rename(), que es una variante de select() que mantiene todas las variables que no se mencionan explícitamente:

rename(Datos, Nombre_2 = Nombre) # Renombra "Nombre" sin alterar "Datos"
Datos <- rename(Datos, Nombre_b = Nombre) # Guarda los cambios

# ARRANGE

# arrange() funciona de manera similar a filter() excepto que en lugar de seleccionar filas, cambia su orden. La función toma un data frame y un conjunto de nombres de columnas (o expresiones más complicadas) para ordenar según ellas. 

arrange(Datos,Edad) # ascendente, del menor al mayor
arrange(Datos,-Edad) # descendente

# MUTATE

# Además de seleccionar conjuntos de columnas existentes, a menudo es útil crear nuevas columnas en función de columnas existentes. mutate() siempre agrega nuevas columnas al final de un conjunto de datos.

mutate(Datos,Peso_Edad=Peso+Edad) # No se guarda
mutate(Datos,Peso_por_dos=Peso*2)
mutate(Datos,Prueba=mean(Edad))
Datos <- mutate(Datos,Peso_sobre_edad=Peso/Edad) # Se guarda
Datos # Ver en consola

# con if else
Datos <- mutate(Datos,
       Edad_50=ifelse(Edad>50,1,0), # Si mayor, 1; si no, 0.
       Peso_alto=ifelse(Peso>60,"Alto","Bajo")
)
Datos

# con case when
Datos <- mutate(Datos,
       Edad_nueva = 
         case_when(
           Edad <= 22 ~ "Adolescente",
           Edad > 22 & Edad < 60 ~ "Adulto",
           Edad >= 60 ~ "Mayor")
       )
Datos

##########
#GROUP BY
#########

# La mayoría de las operaciones sobre los datos se realizan en grupos definidos por variables. group_by() toma una tabla existente y la convierte en una tabla agrupada donde las operaciones se realizan "por grupo". Actualmente, group_by() ordena internamente los grupos en orden ascendente. 

flores <- iris
flores

flores_1 <- group_by(flores,Species) # Son tres especies
flores_1


summarise(flores_1, PromedioSepalo = mean(Sepal.Length))


# SUMMARISE

# Se encarga de colapsar un data frame en una sola fila. La función no es muy útil a menos que lo enlacemos con group_by(). Esto cambia la unidad de análisis del conjunto de datos completo a grupos individuales. Luego, cuando uses los verbos dplyr en un data frame agrupado, estos se aplicarán automáticamente “por grupo”. 

summarise(group_by(Datos,Edad_nueva),Suma_edad=sum(Edad))
