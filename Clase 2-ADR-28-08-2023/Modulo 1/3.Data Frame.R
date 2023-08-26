##############################
#DATA FRAMES
#############################

#CREACION DE DATA FRAME

edades <- c(14,15,14,14)
nombres <- c("Jose", "Carlos","Linda","Paola")
sexo <- c("Masculino","Masculino","Femenino","Femenino")
notas <- c(90,75,81,93)
notas2 <- c(89,80,92,95)
honor <- c(TRUE,FALSE,FALSE,TRUE)

# Los data frame en R se crean a partir del comando "data.frame()"

estudiantes <- data.frame(edades,nombres,sexo,notas,notas2,honor)
View(estudiantes)
class(estudiantes)
estudiantes1 <- data.frame(sexo,notas,notas2,honor,edades,nombres)

# Respondiendo a una consulta de Jorge
paises <- Ejemplo_datos$Pais

# Inspeccionando un dataframe

head(estudiantes,2)
tail(estudiantes)
str(estudiantes)

# Extraer algunos datos segun su ubicacion

estudiantes[1,5]

estudiantes[3,4]

estudiantes[2:4,]

estudiantes[3,1:2]

sub1 <- estudiantes[3,1:2]

w <- estudiantes[,"notas2"]

##############################
#VECTOR COLUMNA DEL DATAFRAME
##############################

# Para hacer referencia a una columna del dataframe, usamos dobles corchetes"[[]]" .

cars <- mtcars

mtcars[[9]] 

cars[[9]] 

# Tambien le podemos colocar el nombre de la columna

mtcars[["am"]] 

#Usando el simbolo "$" conjunto con el nombre de la columna, en lugar de los doble corhetes

mtcars$am





