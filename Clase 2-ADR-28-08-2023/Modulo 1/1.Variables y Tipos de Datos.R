#############################################
# VARIABLES Y TIPOS DE DATOS QUE SOPORTA R
#############################################

7 + 12

a = 7 + 5

b = 30 * 9

c = b / a

z <- 100

w <- z + b


# Los nombres de variables u objetos no deben comenzar con numeros
l2 <- 45

# R discrimina las mayusculas de minusculas, tambien se pueden asignar 
# a los obejtos con los signos "<-" o con el signo "=".
Edad=80
edad<-70

# El atajo de teclado en windows para agregar el simbolo "<-" es "Alt+-"

#TIPOS DE DATOS QUE SOPORTA R

# Para indicar el tipo de dato se utiliza el comando "class()"

peso <- 89.5

class(Edad)
class(edad)
class(peso)

# Los datos tipo caracter (string o textos) se debe escribir entre "comillas"

nombre <- "Rafael"
class(nombre)

numero_string <- "37"
class(numero_string)

# Para datos de tipo Booleano (TRUE o FALSE),se deben escribir en letras mayusculas
# Tambien se pueden asignar solo con la inicial T o F, siempre en mayuscula.

casada <- TRUE
class(casada) 


# TIPADO DINAMICO

# Se llama tipado dianamico cuando una variables cambia el tipo de dato
# en tiempo de ejecucion del programa


prueba <- 170
class(prueba)

prueba <- "Hola"
class(prueba)






