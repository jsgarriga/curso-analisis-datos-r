################################
# INFORMACION GEOGRAFICA Y MAPAS
################################

# Instalar según corresponda
install.packages("sf", "leaflet")

# Importamos las librerías necesarias
library(tidyverse)
library(sf) # Para cargar datos georreferenciados
library(leaflet) # Leaflet nos permite hacer mapas interactivos

# Para más info, ver:
# https://www.youtube.com/watch?v=WdpiUBzs3LY

# R maneja distintas formas de analizar los datos espaciales
# Esto difiere según la librería con la que se trabaje

# MAPAS (INTERACTIVOS) CON LEAFLET
# MAPAS BASE

leaflet() %>%  # leaflet trabaja con el operador %>% 
  addProviderTiles(providers$Esri.NatGeoWorldMap)

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

# Usamos marcadores para señalar puntos, expresar ubicaciones con latitud / longitud. Son coordenadas, aparecen como iconos o como círculos
leaflet() %>%
  addTiles()%>%
  addMarkers(data=Centros_salud)

# Podemos ponerle informacion para cuando uno pase por arriba con el mouse
leaflet()%>%
  addTiles()%>% # Configura el mapa base OpenStreetMap map tiles
  addMarkers(data=Centros_salud,label=~nombre)

# O ponerle informacion cuando uno hace un click
leaflet()%>%
  addProviderTiles(providers$Esri.NatGeoWorldMap)%>%
  addMarkers(data=Centros_salud,popup =~nombre)

# Otra opción
leaflet() %>%
  addTiles() %>%
  addMarkers(data = Centros_salud, popup = ~nombre)
  
# Veamos los jefes
leaflet() %>%
  addTiles() %>%
  addMarkers(data = Centros_salud, popup = ~jefe)

# Veamos las especialidades
leaflet() %>%
  addTiles() %>%
  addMarkers(data = Centros_salud, popup = ~especialid)

# Veamos más info junta
# TAREA: 
# BASÁNDONOS EN LOS TEMAS VISTOS EN LA CLASE 6 SOBRE DATOS GEORREFERENCIADOS CON LEAFLET: VER CÓMO VISUALIZAR MÚLTIPLES ELEMENTOS EN EL MAPA INTERACTIVO, ES DECIR, TANTO NOMBRE DEL HOSPITAL AL POSAR EL CURSOR SOBRE EL PUNTO DEL CENTRO DE SALUD, Y AL PULSAR CLIC VER LAS ESPECIALIDADES DEL MISMO
leaflet() %>%
  addTiles() %>%
  addMarkers(data = Centros_salud, label = ~nombre) %>%
  addMarkers(data = Centros_salud, popup = ~especialid)