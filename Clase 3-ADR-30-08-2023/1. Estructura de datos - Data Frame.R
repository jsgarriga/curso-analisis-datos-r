#############################
#     DATA FRAMES           #
#############################

# Los data frames son estructuras de datos de dos dimensiones (rectangulares) que pueden contener datos de diferentes tipos, por lo tanto, son heterogéneas. 
# Podemos entender a los data frames como una versión más flexible de una matriz. Mientras que en una matriz todas las celdas deben contener datos del mismo tipo, los renglones de un data frame admiten datos de distintos tipos, pero sus columnas conservan la restricción de contener datos de un sólo tipo.

# CREACION DE DATA FRAME

# Estos son vectores!
edad <- c(14,15,17,19) # nos sirve para no crear un objeto por variable
nombre <- c("Pepe", "Claudia", "Jose","Paola")
genero <- c("Masculino","Femenino","No binarie","Femenino")
notas1 <- c(80,75,85,93)
notas2 <- c(89,80,92,95)
honor <- c(TRUE,FALSE,FALSE,TRUE)

# En R, los data frame se crean a partir del comando "data.frame()", enviando vectores
estudiantes <- data.frame(nombre, edad, genero, notas1, notas2, honor)
view(estudiantes) # revisen su pestaña "Enviroment"
class(estudiantes)

# Creamos otro data frame cambiando el orden de las columnas!
estudiantes1 <- data.frame(nombre, edad, notas1)

# Inspeccionando un dataframe: parte inicial de un trabajo, análisis exploratorio de datos

head(estudiantes,2)
tail(estudiantes)
# la función str ("estructura") sirve tanto para data frames como vectores
str(estudiantes)
str(edad)

# Extraer algunos datos segun su ubicacion ("coordenada": x e y)

estudiantes[1,5]

estudiantes[3,4]

estudiantes[2:4,] # rango filas

estudiantes[3,1:2] # rango columnas

sub1 <- estudiantes[3:4,1:2] # creamos un subconjunto de los datos
View(sub1)

# Extra: renombrar columna
library(dplyr)
estudiantes_tbl <- as_tibble(estudiantes)
rename(estudiantes_tbl, Nombre = nombre) # vean la consola

# Extra: De columna del data frame a un objeto vector

library(readr)
Ejemplo_datos <- read_delim("C:/OD/OneDrive - alumnos.frm.utn.edu.ar/0 1 trabajo y proyectos/2023/educacionIT/curso-analisis-datos-r/Clase 1-ADR-23-08-2023/Ejemplo_datos.csv", 
                            delim = ";", escape_double = FALSE, trim_ws = TRUE)

paises <- Ejemplo_datos$Pais # revisen su pestaña "Enviroment"

# VECTOR: COLUMNA DEL DATAFRAME

# Para hacer referencia a una columna del dataframe, usamos dobles corchetes"[[]]" .

autos <- mtcars # Tarea en casa: investigar, ¿de qué paquete viene "mtcars"? probá con "?mtcars" en la consola

autos[[9]] # vector

# También le podemos colocar el nombre de la columna
autos[["am"]] 

# Usando el símbolo "$" conjunto con el nombre de la columna, en lugar de los doble corchetes. 

autos$am


# EXTRA: Al igual que con una matriz, si aplicamos una operación aritmética a un data frame, esta se vectorizará. Los resultados que obtendremos dependerán del tipo de datos de cada columna. R nos devolverá todas las advertencias que ocurran como resultado de las operaciones realizadas, por ejemplo, aquellas que hayan requerido una coerción.

mi_df <- data.frame(
  "entero" = 1:4, 
  "factor" = c("a", "b", "c", "d"), 
  "numero" = c(1.2, 3.4, 4.5, 5.6),
  "cadena" = as.character(c("a", "b", "c", "d"))
)

mi_df * 2 # presten atención a los warnings y la salida
