##############
# LISTAS
##############

# Las listas, al igual que los vectores, son estructuras de datos unidimensionales, sólo tienen largo, pero a diferencia de los vectores cada uno de sus elementos puede ser de diferente tipo o incluso de diferente clase, por lo que son estructuras heterogéneas.
# Podemos tener listas que contengan datos atómicos, vectores, matrices, arrays, data frames u otras listas. Esta última característica es la razón por la que una lista puede ser considerada un vector recursivo, pues es un objeto que puede contener objetos de su misma clase.

# Se pueden crear listas con distintas estructuras de datos
un_vector <- 100:200
un_df <- iris # Tarea en casa: investigar, ¿de qué paquete viene "iris"? probá con "?iris" en la consola

# Para crear una lista usamos la función list(), que nos pedirá los elementos que deseamos incluir en nuestra lista. Para esta estructura, no importan las dimensiones o largo de los elementos que queramos incluir en ella.

mi_lista <- list(un_vector,un_df) # Revisen la pestaña "Enviroment", cliquen en el ícono de la lupa

str(mi_lista)

# Seleccionamos elementos de la lista
mi_lista[[1]] # el vector
mi_lista[[2]] # el data frame
