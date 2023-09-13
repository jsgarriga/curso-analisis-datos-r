# CLASE 7: MODELADO ESTADÍSTICO

# Importamos las librerías necesarias
library(tidyverse)

# Regresión lineal simple

# Vamos a trabajar con el conjunto de datos "gapminder"
mundo <- read_csv("./datos/gapminder.csv")

# Veamos...
colnames(mundo) # PBI per cápita en dólares
# [1] "pais"       "continente" "anio"       "expVida"   
# [5] "pobl"       "PBI_PC"  

# Regresión con una variable numérica

# ¿Cómo se relaciona el paso del tiempo (variable explicativa) con la expectativa de vida en la Argentina? Filtremos los datos
argentina <- mundo %>% 
  filter(pais == "Argentina")

# Visualicemos la relación entre año y expectativa de vida
ggplot(argentina) + 
  geom_point(aes(x = anio, y = expVida)) +
  labs(title = "Correlación entre año y expectativa de vida en Argentina",
       y = "Expectativa de vida")

# Tiempo y expectativa de vida están correlacionadas en forma positiva: el incremento de una unidad de tiempo resulta en el incremento de la expectativa de vida

# Veamos...
modelo_exp

# El coeficiente de la variable año es de 0.2317. Significa que incrementando en una unidad la variable año, la variable expectativa de vida se incrementa en 0.2317. O sea, por cada año que pasa la expectativa de vida en la Argentina aumenta casi 3 meses

ggplot(argentina) + 
  geom_point(aes(x = anio, y = expVida)) +
  labs(title = "Correlación entre tiempo y expectativa de vida en Argentina",
       y = "Expectativa de vida") +
  geom_abline(aes(intercept = -389.6063, slope = 0.2317), color = "blue") + # línea recta
  xlim(c(1950, 2030)) + # opc
  ylim(c(60, 85)) + # opc
  geom_smooth(aes(x = anio, y = expVida), method = "lm") # opc

# Para el año 2030 la expectativa de vida en la Argentina habrá superado los 80 años

# En la práctica es raro encontrar una correlación tan nítida entre variables. Veamos el comportamiento del paso del tiempo sobre el PBI PC 
ggplot(argentina) + 
  geom_point(aes(x = anio, y = PBI_PC)) +
  labs(title = "Correlación entre tiempo  y PBI en Argentina",
       y = "PBI per cápita") +
  geom_smooth(aes(x = anio, y = PBI_PC), method = "lm")

modelo_PBI <- lm(PBI_PC ~ anio, data = argentina)

# Revisión de los desvíos: sobre los residuos

residuos <- residuals(modelo_PBI)

argentina <- argentina %>% 
  mutate(residuo_ml = residuos) # agregamos una columna

ggplot(argentina) +
  geom_point(aes(x = anio, y = residuo_ml)) +
  geom_hline(yintercept = 0, col = "blue") + # línea horizontal
  labs(x = "Año", y = "Residuo del modelo lineal")

ggplot(argentina) + 
  geom_line(aes(x = anio, y = PBI_PC)) +
  geom_vline(aes(xintercept = 2001), color = "red") + # año de la crisis
  labs(title = "Evolución del PBI en la Argentina",
       y = "PBI per cápita",
       caption = "Nota: La línea roja indica la ocurrencia de la crisis del 2001")

# EJERCICIO: MOSTRAR LA RELACIÓN ENTRE UNA VARIABLES CATEGÓRICA Y OTRA CONTINUA/NUMÉRICA, CON UN GRÁFICO BOXPLOT (MEDIANTE GEOM_BOXPLOT()) Y UN GRÁFICO DE PUNTOS “SACUDIDOS” (MEDIANTE GEOM_JITTER()). EXPLIQUEMOS LO QUE MUESTRA EL GRÁFICO

# Gráfico de caja (boxplot)
ggplot(mundo) +
  geom_boxplot(aes(x = continente, y = PBI_PC)) +
  labs(title = "Relación entre Continente y PBI per cápita",
    x = "Continente",
    y = "PBI per cápita")
	
# Gráfico de puntos "sacudidos" (jitter)
ggplot(mundo) +
  geom_jitter(aes(x = continente, y = PBI_PC), width = 0.2, height = 0) +
  labs(title = "Relación entre Continente y PBI per cápita (Puntos 'Sacudidos')",
    x = "Continente",
    y = "PBI per cápita")
	
