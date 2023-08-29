##################################
# EXPORTAR EXCEL CON PAQUETE xlsx
##################################

# Antes de trabajar, debemos instalar "jre-8u301-windows-x64.exe"

# Luego, vamos a instalar los siguientes paquetes
install.packages("rJava", "xlsxjars", "xlsx")

# Ahora, cargamos los paquetes que vamos a utilizar
library(xlsx)
library(readxl)

# Abrimos el archivo excel
poblacion <- read_excel("Poblacion Mundial.xlsx")
View(poblacion) # Veamos el excel

# Seleccionamos las primeras 100 observaciones/filas/casos... como subcobjunto
poblacion_sub <- poblacion[1:100,] 

# Escribimos un archivo excel con la muestra
xlsx::write.xlsx(poblacion_sub # el objeto con los datos
           , file = "datos_de_R_a_Excel.xlsx" # el nombre del archivo
           , sheetName = "nuevo") # el nombre de la hoja

