################################
# INFORMACION GEOGRAFICA Y MAPAS
################################

# R maneja distintas formas de analizar los datos espaciales. 
# Esto difiere según la librería con la que se trabaje. 
# Para esta clase, vamos a trabajar principalmete con los radios censales 
# que se pueden descargar de la web. 
# El readio censal, es una unidad geográfica que agrupa, 
# en promedio 300 viviendas en las ciudades. 
# Si los radios son rurales o rurales mixtos, 
# la cantidad promedio es menor.



library(tidyverse)
library(sf)

radios <- st_read("https://bitsandbricks.github.io/data/CABA_rc.geojson")
