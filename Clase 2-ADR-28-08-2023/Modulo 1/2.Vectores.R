#################
# VECTORES EN R
#################
# Los vectores son de una sola dimension.
# Los componentes de los vectores tienen que ser del mismo tipo de datos.
# El comando utilizado para crearlos es "c(componente 1, componente 2,....n)

edad <- c(14,15,17,19)
nombre <- c("Jose", "Carlos", "Linda","Paola")
sexo <- c("Masculino","Masculino","Femenino","Femenino")
nota1 <- c(90,75,81,93)

# Si se trata de crear vectores con tipos de datos diferentes, 
# R los coerciona al formato que puedan tener todos

diferente <- c(1,"Ana",TRUE)
diferente2 <- c(1,TRUE,FALSE)
diferente3 <- c(1,TRUE,3<2)


# Calculos con Vectores
nota1 <- c(90,75,81,93)
nota2 <- c(100,130,98,65)
nota3 <- c(10,230)

nota1+nota2

notas_apliadas <- nota1 * nota2
notas_apliadas


nota2 <- nota2*1.3

nota1+nota3


# Seleccion de elementos de un vector

nota1[1]
nota1[3]
nota1[1:2]

otro <- nota2[c(1,4)]


























