library(readr)
Ejemplo_datos <- read_delim("C:/Users/luisj/OneDrive/Material de EDUCACION IT/ANALISIS DE DATOS CON R/23.ADR A DISTANCIA-02-05-2023/Clase 1-ADR-02-05-2023/Modulo 1/Ejemplo_datos.csv", 
                            delim = ";", escape_double = FALSE, trim_ws = TRUE)
View(Ejemplo_datos)



# Este codigo es lo mismo que el anterior pero seteando el directorio de trabajo(Working Directory)
library(readr)
Ejemplo_datos_1 <- read_delim("Modulo 1/Ejemplo_datos.csv", 
                              delim = ";", escape_double = FALSE, trim_ws = TRUE)
View(Ejemplo_datos_1)
 