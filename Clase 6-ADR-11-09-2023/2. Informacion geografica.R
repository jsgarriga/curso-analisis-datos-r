################################
# INFORMACION GEOGRAFICA Y MAPAS
################################

# Importamos las librerías necesarias
library(tidyverse)
library(sf)
library(leaflet) # Leaflet nos permite hacer mapas interactivos

# R maneja distintas formas de analizar los datos espaciales
# Esto difiere según la librería con la que se trabaje

# MAPAS CON LEAFLET
# MAPAS BASE

leaflet() %>%  # leaflet trabaja con el operador %>% 
  addProviderTiles(providers$Esri.NatGeoWorldMap)

# Los datos provienen de vectores o marcos de datos asignados, u objetos de paquete sf
Centros_salud <- read_sf('./centros-de-salud-y-accion-comunitaria-zip/centros-de-salud-y-accion-comunitaria.shp')

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

