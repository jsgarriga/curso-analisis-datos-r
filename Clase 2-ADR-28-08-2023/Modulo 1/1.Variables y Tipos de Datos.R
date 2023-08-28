#############################################
# VARIABLES Y TIPOS DE DATOS QUE SOPORTA R  #
#############################################

# 1. VARIABLES

# De manera análoga al uso de estos términos en lenguaje matemático, una constante es un objeto cuyo valor no podemos cambiar, en contraste, una variable es un objeto que puede cambiar de valor.

7 + 12

a = 7 + 5 # Mientras los números son constantes, "a" es variable

# Las constantes ya están establecidas por R, mientras que nosotros podemos crear variables, asignándoles valores a nombres.

b = 30 * 9

c = b / a

# En R usamos "<-" para hacer asignaciones. Si bien "=" está permitido, el operador más extendido es "<-", por lo que es más común de usar por consenso en la comunidad.

z <- 100 # "<-" Asignador

w <- z + b


# Los nombres de variables u objetos no deben comenzar con numeros

# 2 <- 5 # mal
l2 <- 45 # bien

# R discrimina las mayusculas de minusculas, tambien se pueden asignara los objetos con los signos "<-" o con el signo "=".

Edad = 80
edad <- 70

# (vean "Environment")

# El atajo de teclado en windows para agregar el simbolo "<-" es "Alt+-"

# Es recomendable que al crear una variable usemos nombres claros, no ambiguos y descriptivos. Esto previene confusión y hace que nuestro código sea más fácil de comprender por otras personas o por nosotros mismos en el futuro.

# 2. TIPOS DE DATOS QUE SOPORTA R

# Tipo 	  Ejemplo 	        Nombre en inglés
# Entero 	  1 	            integer
# Numérico 	1.3 	          numeric
# Cadena 	  “uno” 	        character
# Factor 	  uno 	          factor
# Lógico 	  TRUE 	          logical
# Perdido 	NA 	            NA
# Vacio 	  NULL 	          null

# Para indicar el tipo de dato se utiliza el comando "class()"

peso <- 89.5 # qué pasa si no corro esta asignación de objeto y ejecuto "class(peso)"?

class(Edad)
class(edad)
class(peso) # es "numeric"; no discrimina entre enteros y decimales
?numeric # qué hace eso? fíjese

# para más info, ver:
# https://jgarriga.quarto.pub/datos-y-ciencias-sociales-con-r/#/r-base-incluye

# Los datos tipo caracter (string o textos) se debe escribir entre "comillas"

nombre <- "Pepe"
class(nombre)

numero_string <- "57"
class(numero_string)

# Para datos de tipo Booleano (TRUE o FALSE),se deben escribir en letras mayusculas
# Tambien se pueden asignar solo con la inicial T o F, siempre en mayuscula.

soltero <- TRUE
class(soltero) 

5 > 4
6 < 2

mayor_que <- 5 > 4
class(mayor_que)

# TIPADO DINAMICO

# Se llama tipado dianamico cuando una variables cambia el tipo de dato
# en tiempo de ejecucion del programa

prueba <- 170
class(prueba)

prueba <- "Hola"
class(prueba)
