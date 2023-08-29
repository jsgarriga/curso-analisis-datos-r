  ##################
  # VECTORES EN R  #
  ##################

# Las estructuras de datos son objetos que contienen datos. Cuando trabajamos con R, lo que estamos haciendo es manipular estas estructuras.
# Las estructuras tienen diferentes características. Entre ellas, las que distinguen a una estructura de otra son su número de dimensiones y si son homogeneas o hereterogeneas.

# Dimensiones 	Homogeneas 	Heterogeneas
# 1 	          Vector 	    Lista
# 2 	          Matriz 	    Data frame
# n 	          Array 	

# Los vectores son de una sola dimension (como filas)
# Los componentes de los vectores tienen que ser del mismo tipo de datos.
# El comando utilizado para crearlos es "c(componente 1, componente 2,....n)

edad <- c(14,15,17,19) # nos sirve para no crear un objeto por variable
nombre <- c("Pepe", "Claudia", "Jose","Paola")
genero <- c("Masculino","Femenino","No binarie","Femenino")
nota1 <- c(80,75,85,93)


# Hay dos tipos de vectores:
# - Vectores atómicos, de los cuales existen seis tipos: lógico, entero, doble, caracter, complejo y sin procesar (raw). Los vectores de tipo entero y doble son conocidos de manera colectiva como vectores numéricos.
# - Las listas, que a veces son denominadas como vectores recursivos debido a que pueden contener otras listas.

# La diferencia principal entre vectores atómicos y listas es que los vectores atómicos son homogéneos, mientras las listas pueden ser heterogéneas. 

# Propiedades de un vector:
# Tipo. Un vector tiene el mismo tipo que los datos que contiene. Si tenemos un vector que contiene datos de tipo numérico, el vector será también de tipo numérico. Los vectores son atómicos, pues sólo pueden contener datos de un sólo tipo, no es posible mezclar datos de tipos diferentes dentro de ellos.

typeof(letters)

# Longitud. Es el número de elementos que contiene un vector. El largo es la única dimensión que tiene esta estructura de datos.

typeof(1:10)

# Si se trata de crear vectores con tipos de datos diferentes, 
# R los coerciona al formato que puedan tener todos. ¡DATOS IGUALES!

diferente <- c(1,"Ana",TRUE) # son de distinto tipo, entonces veamos la clase en el ambiente. esto es la coerción
diferente2 <- c(1,TRUE,FALSE)
diferente3 <- c(1,TRUE,3<2)

# La coerción implícita ocurre cuando usas un vector en un contexto específico en el que se espera que sea de cierto tipo. 
# La coerción de tipos se realiza de los tipos de datos más restrictivos a los más flexibles. Las coerciones ocurren en el siguiente orden:

# lógico -> entero -> numérico -> cadena de texto (logical -> integer -> numeric -> character)


# Calculos con Vectores
nota1 <- c(90,75,81,93)
nota2 <- c(100,130,98,65)
nota3 <- c(10,230,NA)

nota1 + nota2

notas_apiladas <- nota1 * nota2
notas_apiladas # veamos...


nota4 <- nota2 * 1.3

nota1 + nota4

nota1 + nota3 # qué pasa acá? a qué se debe el error? revisen el material


# Seleccion de elementos de un vector

nota1[1] # índice 1, lo llamamos con los corchetes
nota1[3]
nota1[1:2]
nota2[7] # qué pasa acá?

otro <- nota2[c(1,4)] # creamos un vector que toma los elementos del índice de "nota2" 1 y 4
