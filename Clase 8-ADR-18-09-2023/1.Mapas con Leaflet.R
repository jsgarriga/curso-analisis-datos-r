# MAPAS CON LEAFLET
# Leaflet nos permite hacer mapas interactivos.

library(leaflet)
library(sf)
#MAPAS BASE

leaflet()%>%  # leaflet trabaja con el operador %>% 
  #addTiles()  # Configura el mapa base OpenStreetMap map tiles
  #addProviderTiles(providers$CartoDB.Positron)
  #addProviderTiles(providers$Stamen.Toner)
  addProviderTiles(providers$Esri.NatGeoWorldMap)

#MARCADORES
#Use marcadores para señalar puntos, expresar ubicaciones con latitud / longitud
#coordenadas, aparecen como iconos o como círculos.
#Los datos provienen de vectores o marcos de datos asignados, u objetos de paquete sf
Centros_salud <- read_sf("C:\\Users\\luisj\\OneDrive\\Material de EDUCACION IT\\ANALISIS DE DATOS CON R\\23.ADR A DISTANCIA-02-05-2023\\Clase 8-ADR-30-05-2023\\centros-de-salud-y-accion-comunitaria-zip\\centros-de-salud-y-accion-comunitaria.shp")



file.choose()


leaflet()%>%
  #addProviderTiles(providers$Esri.NatGeoWorldMap)%>%
  addTiles()%>%
  addMarkers(data=Centros_salud)


#Podemos ponerle informacion para cuando uno pase por arriba con el mouse

leaflet()%>%
  addTiles()%>%
  addMarkers(data=Centros_salud,label=~nombre)


Centros_salud%>%
  mutate(NomJef=paste(nombre,jefe, sep=""))
#mutate(Comuna=paste("Comuna: ",COMUNA,sep=""))

#O ponerle informacion cuando uno hace un click

leaflet()%>%
  addProviderTiles(providers$Esri.NatGeoWorldMap)%>%
  addMarkers(data=Centros_salud,popup =~nombre)



