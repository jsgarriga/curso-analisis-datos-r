################################
# INFORMACION GEOGRAFICA Y MAPAS
################################

# Repaso de la clase 6

# Importamos las librerías necesarias
library(tidyverse)
library(sf)
library(leaflet)

# Los datos provienen de vectores o marcos de datos asignados, u objetos de paquete sf
Centros_salud <- read_sf('./centros-de-salud-y-accion-comunitaria-zip/centros-de-salud-y-accion-comunitaria.shp')

# Veamos los datos
Centros_salud

# colnames(Centros_salud)
# [1] "id"         "nombre"     "telefono"  
# [4] "jefe"       "area_progr" "region_san"
# [7] "especialid" "calle"      "altura"    
# [10] "calle2"     "direccion"  "observacio"
# [13] "nom_ante"   "VIH"        "VACUNAT_"  
# [16] "COMUNAS"    "BARRIO"     "SERVICIOS_"
# [19] "EFE_SALUD"  "geometry"  

# TAREA: BASÁNDONOS EN LOS DATOS GEORREFERENCIADOS CON LEAFLET: VISUALIZAR MÚLTIPLES ELEMENTOS EN EL MAPA INTERACTIVO, ES DECIR, TANTO NOMBRE DEL HOSPITAL AL POSAR EL CURSOR SOBRE EL PUNTO DEL CENTRO DE SALUD, Y AL PULSAR CLIC VER LAS ESPECIALIDADES DEL MISMO. 

# EJEMPLO DE LA CLASE PASADA QUE NO FUNCIONA
#leaflet() %>%
#  addTiles() %>%
#  addMarkers(data = Centros_salud, label = ~nombre) %>%
#  addMarkers(data = Centros_salud, popup = ~especialid)

# RESOLUCIÓN DE LA TAREA
leaflet(data = Centros_salud) %>%
  addTiles() %>%
  addMarkers(label = ~nombre, popup = ~especialid)
