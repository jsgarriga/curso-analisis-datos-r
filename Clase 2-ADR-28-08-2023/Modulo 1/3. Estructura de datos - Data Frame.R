##############################
#     DATA FRAMES
#############################

# Los data frames son estructuras de datos de dos dimensiones (rectangulares) que pueden contener datos de diferentes tipos, por lo tanto, son heterogéneas. 
# Podemos entender a los data frames como una versión más flexible de una matriz. Mientras que en una matriz todas las celdas deben contener datos del mismo tipo, los renglones de un data frame admiten datos de distintos tipos, pero sus columnas conservan la restricción de contener datos de un sólo tipo.

# CREACION DE DATA FRAME

edad <- c(14,15,17,19) # nos sirve para no crear un objeto por variable
nombre <- c("Pepe", "Claudia", "Jose","Paola")
genero <- c("Masculino","Femenino","No binarie","Femenino")
notas1 <- c(80,75,85,93)
notas2 <- c(89,80,92,95)
honor <- c(TRUE,FALSE,FALSE,TRUE)

# Los data frame en R se crean a partir del comando "data.frame()"

estudiantes <- data.frame(edad,nombre,genero,notas1,notas2,honor)
view(estudiantes)
class(estudiantes)

# Creamos otro data frame cambiando el orden de las columnas!
estudiantes1 <- data.frame(genero,notas1,notas2,honor,edad,nombre)

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

cars <- mtcars # Tarea en casa: investigar, ¿de qué paquete viene "mtcars"?

mtcars[[9]] 

cars[[9]] 

# Tambien le podemos colocar el nombre de la columna

mtcars[["am"]] 

#Usando el simbolo "$" conjunto con el nombre de la columna, en lugar de los doble corhetes

mtcars$am


# EXTRA: Al igual que con una matriz, si aplicamos una operación aritmética a un data frame, esta se vectorizará. Los resultados que obtendremos dependerán del tipo de datos de cada columna. R nos devolverá todas las advertencias que ocurran como resultado de las operaciones realizadas, por ejemplo, aquellas que hayan requerido una coerción.

mi_df <- data.frame(
  "entero" = 1:4, 
  "factor" = c("a", "b", "c", "d"), 
  "numero" = c(1.2, 3.4, 4.5, 5.6),
  "cadena" = as.character(c("a", "b", "c", "d"))
)

mi_df * 2 # presten atención a los warnings y la salida
