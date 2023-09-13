# CLASE 7: MODELADO ESTADÍSTICO

# Importamos las librerías necesarias
library(tidyverse)

# En términos matemáticos, se habla de “modelar” debido a que estamos creando un modelo, una reconstrucción simplificada de cómo funciona un proceso observado en el mundo real. En un modelo de datos, siempre tenemos al menos:
  
# - Una variable resultante, siempre una sola, también llamada variable “dependiente”,
# - Una o más variables predictoras, también llamadas “explicativas”

# La regresión lineal sigue siendo la herramienta más común del modelado estadístico.

# Regresión lineal simple

# La versión más sencilla de la regresión lineal es la simple o univariada. Tenemos nuestra variable "y" numérica, y una sola variable predictora "x", que puede ser numérica o categórica.

# Vamos a trabajar con el conjunto de datos "gapminder"
mundo <- read_csv("./datos/gapminder.csv")

# Como motivación para entender el poder de muchos modelos simples, vamos a mirar los datos de “gapminder”. Estos datos fueron popularizados por Hans Rosling, un doctor y estadístico sueco. Los datos de gapminder resumen la progresión de países a través del tiempo, mirando estadísticos como esperanza de vida y PIB

# Veamos...
colnames(mundo) # PBI per cápita en dólares
# [1] "pais"       "continente" "anio"       "expVida"   
# [5] "pobl"       "PBI_PC"  
summary(mundo)

# Regresión con una variable numérica

# ¿Cómo se relaciona el paso del tiempo (variable explicativa) con la expectativa de vida en la Argentina? Filtremos los datos
argentina <- mundo %>% 
  filter(pais == "Argentina")

# Veamos...
summary(arg)

# Visualicemos la relación entre año y expectativa de vida
ggplot(argentina) + 
  geom_point(aes(x = anio, y = expVida)) +
  labs(title = "Correlación entre año y expectativa de vida en Argentina",
       y = "Expectativa de vida")

# Tiempo y expectativa de vida están correlacionadas en forma positiva: el incremento de una unidad de tiempo resulta en el incremento de la expectativa de vida

# La intensidad de una correlación va de -1 (correlación negativa total) a 1 (correlación positiva total). Una correlación de cero significa que las dos variables son por completo independientes. Veamos la correlación entre ambas variables
cor(argentina$anio, argentina$expVida) # 0,99

# Si bien no hay una regla, vamos a considerar una correlación apreciable de la siguiente manera:

# - de 0,7 a 1: de fuerte a total
# - de 0,5 a 0,7: de moderada a fuerte
# - de 0,3 a 0,7: de débil a moderada
# - menor a 0,3: de nula a débil

# Aún desconocemos algo más importante: un valor preciso del “efecto” (no la causalidad; limitaciones del modelado estadístico) que el paso de cada año tiene sobre la expectativa de vida. Eso es lo que vamos a determinar con la regresión lineal
modelo_exp <- lm(expVida ~ anio, data = argentina) # Vean Enviroment
# Nota: "~" hace referencia a una fórmula, "expVida vs. año", que busca estimar el efecto en la variable expVida cuando incrementa el valor de año

# Veamos...
modelo_exp

# El coeficiente de la variable año es de 0.2317. Significa que incrementando en una unidad la variable año, la variable expectativa de vida se incrementa en 0.2317. O sea, por cada año que pasa la expectativa de vida en la Argentina aumenta casi 3 meses
# En términos de interpretado, la intersección rara vez tiene utilidad. Sí sirve para trazar la línea que permite “predecir” valores para años en los que no tenemos observaciones

# y = a + b * x (Fórmula que define una línea recta: A cada punto en "x" le corresponde un valor en "y" que se obtiene multiplicando a "x" por la pendiente "b", y sumando la intersección "a")

# Para saber cuanto valdría la variable dependiente ante un valor determinado de la variable predictora, revisamos por donde pasa la línea con los valores de pendiente e intersección (ordenada al origen) dados por el modelo lineal de la expectativa de vida por año. Con xlim() e ylim() podemos definir los límites de nuestro gráfico para ver hacia donde va la línea más allá de los datos disponibles. Además, con la función geom_smooth() podemos explicitar patrones en los datos y trazar una línea de tendencia para nuestro modelo lineal

ggplot(argentina) + 
  geom_point(aes(x = anio, y = expVida)) +
  labs(title = "Correlación entre tiempo y expectativa de vida en Argentina",
       y = "Expectativa de vida") +
  geom_abline(aes(intercept = -389.6063, slope = 0.2317), color = "blue") + # línea recta
  xlim(c(1950, 2030)) + # opc
  ylim(c(60, 85)) + # opc
  geom_smooth(aes(x = anio, y = expVida), method = "lm") # opc

# Para el año 2030 la expectativa de vida en la Argentina habrá superado los 80 años

# Hacer una regresión lineal se trata de encontrar la línea que atraviesa nuestra nube de puntos de modo tal que la suma de las distancias de cada punto a la línea sea la menor posible. En la relación año - expectativa de vida las distancias entre los puntos (las observaciones) y la línea (el modelo) son muy pequeñas. Eso indica que el modelo describe con gran precisión la dinámica de la relación entre las variables analizadas

# En la práctica es raro encontrar una correlación tan nítida entre variables. Veamos el comportamiento del paso del tiempo sobre el PBI PC 
ggplot(argentina) + 
  geom_point(aes(x = anio, y = PBI_PC)) +
  labs(title = "Correlación entre tiempo  y PBI en Argentina",
       y = "PBI per cápita") +
  geom_smooth(aes(x = anio, y = PBI_PC), method = "lm")

modelo_PBI <- lm(PBI_PC ~ anio, data = argentina)
modelo_PBI

# Según el modelo, cada año que pasa resulta en un incremento de 86 dólares en el PBI per cápita del país. Sin embargo, sabemos que no en todos los años se cumple al pie de la letra tal incremento

# Revisión de los desvíos: sobre los residuos

# Los residuos son las diferencias encontradas entre el valor que predice un modelo para una variable y el valor observado en la práctica. Cuando los desvíos son pequeños decimos que nuestro modelo se ajusta bien a los datos observados. Cuando los residuos son grandes ocurre lo contrario, por lo que debemos buscar otro modelo

# Veamos los residuos del modelo...

residuos <- residuals(modelo_PBI)

argentina <- argentina %>% 
  mutate(residuo_ml = residuos) # agregamos una columna

ggplot(argentina) +
  geom_point(aes(x = anio, y = residuo_ml)) +
  geom_hline(yintercept = 0, col = "blue") + # línea horizontal
  labs(x = "Año", y = "Residuo del modelo lineal")

# Los residuos cercanos a ese valor son los que corresponden a observaciones a las que el modelo se ajusta bien.  Podemos argumentar en favor de la adecuación del modelo cuando: 1) El promedio de los residuos se aproxima a cero; es decir, que los residuos positivos se cancelan con los negativos, promediando cerca de cero; y 2) El valor de los residuos no depende del valor de x; es decir, no se observa un crecimiento (o decrecimiento) sistemático de la magnitud de los residuos a medida que x crece. 

# Nuestro modelo solo cumple con 1, pero no con 2, ya que la magnitud de los residuos parece crecer con el paso de los años

# El valor del PBI per cápita observado en el año 2002 resultó ser más de 2000 dólares menor al esperado por el modelo: "Corralito", etc...

ggplot(argentina) + 
  geom_line(aes(x = anio, y = PBI_PC)) +
  geom_vline(aes(xintercept = 2001), color = "red") + # año de la crisis
  labs(title = "Evolución del PBI en la Argentina",
       y = "PBI per cápita",
       caption = "Nota: La línea roja indica la ocurrencia de la crisis del 2001")

# El modelo se beneficiaría de tener en cuenta la irrupción de las crisis en el país. Esto se lograría agregando una variable categórica para cada año, que indique si se trata de un período de crisis. Ello seria un modelo de regresión lineal múltiple (con más de una variable explicativa), incorporando una variable explicativa numérica y otra categórica

######

# EJERCICIO: MOSTRAR LA RELACIÓN ENTRE UNA VARIABLES CATEGÓRICA Y OTRA CONTINUA/NUMÉRICA, CON UN GRÁFICO BOXPLOT (MEDIANTE GEOM_BOXPLOT()) Y UN GRÁFICO DE PUNTOS “SACUDIDOS” (MEDIANTE GEOM_JITTER()). EXPLIQUE LO QUE MUESTRA EL GRÁFICO

# Gráfico de caja (boxplot)
ggplot(mundo) +
  geom_boxplot(aes(x = continente, y = PBI_PC)) +
  labs(title = "Relación entre Continente y PBI per cápita",
    x = "Continente",
    y = "PBI per cápita")

# El gráfico de caja muestra la distribución del PBI per cápita en cada continente. Los "bigotes" del boxplot representan la variabilidad de los datos, y los puntos fuera de los bigotes se consideran valores atípicos. Puedes observar la mediana y la dispersión de los valores del PBI per cápita para cada continente

# Gráfico de puntos "sacudidos" (jitter)
ggplot(mundo) +
  geom_jitter(aes(x = continente, y = PBI_PC), width = 0.2, height = 0) +
  labs(title = "Relación entre Continente y PBI per cápita (Puntos 'Sacudidos')",
    x = "Continente",
    y = "PBI per cápita")

# El gráfico de puntos "sacudidos" (jitter) muestra puntos individuales para cada observación de PBI per cápita en función del continente. Los puntos están "sacudidos" ligeramente horizontalmente para evitar que se superpongan demasiado y permitir una mejor visualización de la distribución. Este gráfico muestra la dispersión de los valores en cada continente y permite identificar tendencias generales

