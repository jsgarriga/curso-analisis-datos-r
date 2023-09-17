# CLASE 8: APRENDIZAJE AUTOMÁTICO

# ALGO DE TEORÍA

# Un pequeño repaso al concepto de modelado...

# En términos matemáticos, se habla de “modelar” debido a que estamos creando un modelo, una reconstrucción simplificada de cómo funciona un proceso observado en el mundo real. En un modelo de datos, siempre tenemos al menos:

# - Una variable resultante, siempre una sola, también llamada variable “dependiente”,
# - Una o más variables predictoras, también llamadas “explicativas”

# El objetivo de un modelo es proveer un resumen simple y de baja dimensionalidad (las variables mínimas necesarias) sobre un conjunto de datos. El modelo capturará “señales” verdaderas (patrones generados por el fenómeno de interés) e ignorará el “ruido” (es decir, variaciones aleatorias que no nos interesan). Se trata no de descubrir "la verdad", sino de obtener una aproximación simple que sea útil

# Tomaremos ventaja de que un modelo particiona los datos en patrones y residuos. Encontraremos patrones con visualizaciones, luego los haremos concretos y precisos con un modelo

# Hay dos partes en un modelo: 1ro, definir una familia de modelos que exprese el patrón a capturar. Por ejemplo, el patrón podría ser una línea recta. 2do, generar un modelo ajustado al encontrar un modelo de la familia que sea lo más cercano a tus datos. Esto toma la familia de modelos genérica y la vuelve específica, con una ecuación y una fórmula

# Ya trabajamos con modelos lineales en la clase anterior. Ahora, existe un amplio conjunto de familias de modelos que extienden la familia de modelos lineales de varias formas interesantes. Solo por nombrar algunos contamos con:

# - Modelos lineales generalizados: extienden los modelos lineales para incluir respuestas no continuas (datos binarios o conteos)
# - Modelos generalizados aditivos: extienden los modelos lineales generalizados para incorporar funciones suaves arbitrarias. Una fórmula simple se transforma en una ecuación y posteriormente estima una función
# - Modelos lineales penalizados: penalizan modelos complejos (definidos por la distancia entre el vector de parámetros y el origen). Generaliza mejor respecto de nuevos conjuntos de datos para la misma población
# - Modelos lineales robustos: modifican la distancia para restar importancia a los puntos que quedan muy alejados, los valores atípicos, con el inconveniente de que no son muy buenos cuando no existen
# - Árboles: ajustan un modelo constante por partes, dividiendo los datos en partes progresivamente más y más pequeñas. No son efectivos por sí solos, pero son poderosos cuando se usan en modelos agregados como bosques aleatorios o máquinas aceleradoras de gradiente

# Una vez que hayas manejado los modelos lineales, te resultará sencillo entender la mecánica de otras clases de modelos. Ser une modeladore hábil consiste en tener buenos principios generales y una gran caja de herramientas técnicas

# -----

# VAMOS A LA PRÁCTICA

# Prerrequisitos

# Instalamos la librería "datos" para obtener conjuntos de datos
install.packages("datos")

# Instalamos las librerías "modelr" y "broom" para facilitar el modelado y transformar modelos en datos ordenados (tidy)
install.packages("modelr")
install.packages("broom")

# Cargamos las librerías necesarias
library(datos)
library(tidyverse)
library(modelr)
library(broom)

# Exploración

# Vamos a volver a cargar el conjunto de datos que usamos en la clase pasada sobre modelado estadístico 
mundo <- paises

# Los datos de gapminder ("paises") resumen la progresión de países a través del tiempo, mirando estadísticos como la esperanza de vida y el PIB PC en USD

# Veamos los datos 
glimpse(mundo)
summary(mundo)
colnames(mundo)

# Anteriormente, nuestro conjunto, siendo el mismo, tenía otros nombres asignado a sus columnas:
# [1] "pais"       "continente" "anio"       "expVida"
# [5] "pobl"       "PBI_PC"  

# Actual:
# [1] "pais"              "continente"       
# [3] "anio"              "esperanza_de_vida"
# [5] "poblacion"         "pib_per_capita"   
# Son cambios mínimos, pero hay que tenerlos en cuenta

# ¿Cuántos países hay?
length(unique(mundo$pais))

# Hagamos la consulta más tidy
mundo$pais %>%
  unique() %>%
  length()

# Ahora, visualicemos los 141 países por su expVida...
mundo %>%
  ggplot(aes(anio, esperanza_de_vida, group = pais)) +
  geom_line(alpha = .3)

# En general, pareciera que la esperanza de vida ha estado mejorando en forma constante. Sin embargo, se nota que algunos países no siguen este patrón

# Inspeccionemos nuestras variables cuantitativas
mundo %>%
  select("esperanza_de_vida", "poblacion", "pib_per_capita") %>%
  as.matrix() %>%
  cor() # pearson por defecto
# ¿Qué valores introducen ruido?

# Modelado individual

# Vamos a tratar de visualizar los países que no siguen la tendencia al crecimiento. Para eso, partimos de un modelo sobre un país que luego vamos a generalizar a otros. El modelo captura el crecimiento estable en el tiempo y los residuos mostrarán lo que queda fuera

# Retomando el caso de la clase 7 sobre modelado estadístico... ¿Cómo se relaciona el paso del tiempo (variable explicativa) con la expectativa de vida en la Argentina? Filtremos los datos

# Ejemplo con Argentina
argentina <- mundo %>% 
  filter(pais == "Argentina")

argentina %>%
  ggplot(aes(anio, esperanza_de_vida)) + # visualizamos gráficamente
  geom_line(col = "green",size = .7) +
  ggtitle("Datos completos ('esperanza_de_vida')")

# Creamos un modelo lineal
modelo_exp <- lm(esperanza_de_vida ~ anio, data = argentina)

modelo_exp # nos da el coeficiente y la intersección del modelado

argentina %>%
  add_predictions(modelo_exp) %>% # la predicción del modelo lineal
  ggplot(aes(anio, pred)) + # visualizamos gráficamente
  geom_line(col = "blue") +
  ggtitle("Tendencia lineal")

# Veamos todo junto
argentina %>% 
  ggplot(aes(anio, esperanza_de_vida)) + 
  geom_line(col = "green", size = .7) +
  geom_abline(aes(intercept = -389.6063, slope = 0.2317), # lm
              col = "blue") + 
  labs(title = "Esperanza de vida vs. Predicción",
       caption = "Verde = Esperanza de vida; Azul = Tendencia lineal \n Los espacios entre ambas líneas es el patrón restante o residuos")

# Captamos los residuos de los datos (predicción - datos reales)
argentina %>%
  add_residuals(modelo_exp) %>% # los residuos del modelo lineal
  ggplot(aes(anio, resid)) +
  geom_hline(yintercept = 0, col = "white", linewidth = 3) +
  geom_line(col = "red") +
  ggtitle("Patrón restante (residuos)")

# El coeficiente de la variable año es de 0.2317. Significa que incrementando en una unidad la variable año, la variable esperanza de vida se incrementa en 0.2317. O sea, por cada año que pasa la expectativa de vida en la Argentina aumenta casi 3 meses. Para el año 2030 la expectativa de vida en la Argentina habrá superado los 80 años

# Datos completos, tendencia lineal y patrón restante
resumen_ml <- argentina %>%
  add_predictions(modelo_exp) %>%
  add_residuals(modelo_exp)

resumen_ml

# Modelado múltiple

# Entonces, ¿cómo podemos ajustar fácilmente ese modelo para cada país? Queremos repetir el modelado a cada país, a un subconjunto de filas. Vamos a usar un data frame anidado
por_pais <- mundo %>%
  group_by(pais, continente) %>%
  nest() # Convertimos los países en una columna-lista de data frames

por_pais

# Tenemos un data frame de data frames! Y podemos acceder a ellos
por_pais$data[[5]] # Argentina

# Aprovechando que cada fila es un grupo, podemos crear una función que aplique el modelo lineal a cada país
modelo_pais <- function(df) {
  lm(esperanza_de_vida ~ anio, data = df)
}

# Ejemplo individual
modelo_pais(por_pais$data[[5]])

# Ejemplo múltiple utilizando "map" de "purrr" para iterar la función
map(por_pais$data, modelo_pais)

# Además, vamos a guardar los resultados del modelado en la misma columna-lista de data frames anidados
por_pais <- por_pais %>%
  mutate(modelo = map(data, modelo_pais))

por_pais # Veamos el resultado

# Ahora sí, tenemos 142 data frames y 142 modelos lineales de la esperanza de vida por años. Podemos conseguir las predicciones y residuos para todos los países
por_pais <- por_pais %>%
  mutate(
    residuos = map2(data, modelo, add_residuals)
  )

por_pais # todo 
por_pais$data[[5]] # Argentina
por_pais$modelo[[5]] # mod Argentina
por_pais$residuos[[5]] # res Argentina

# Vamos a usar unnest para desanidar los datos y obtener los modelos de cada país a graficar
residuos <- unnest(por_pais, residuos)
class(residuos)
dim(residuos)
View(residuos)

residuos %>%
  ggplot(aes(anio, resid)) +
  geom_line(aes(group = pais), alpha = .3) +
  geom_smooth(se = F) # media suavizada sin mostrar el intervalo de confianza

# Los residuos de los 142 generan ruido. Veamos por continente
residuos %>%
  ggplot(aes(anio, resid, group = pais)) +
  geom_line(alpha = 1 / 3) +
  facet_wrap(~continente)

# En África y Asia hay residuos negativos muy grandes. Además, los residuos en Europa son mayoritariamente positivos, mientras que en América son negativos

# Evaluando la calidad del modelo
# Mediante una mirada a las estadísticas...

# Evaluación individual
glance(modelo_exp) # ejemplo Argentina

# Evaluación múltiple
vistazo <- por_pais %>%
  mutate(glance = map(modelo, glance)) %>%
  select(-data, -modelo, -residuos) %>%
  unnest(glance)

View(vistazo)

# ¿Qué modelos no se ajustan bien?
vistazo %>%
  arrange(r.squared) # ascendente por defecto

# # ¿Qué modelos sí se ajustan bien?
vistazo %>%
  arrange(desc(r.squared)) 

# NOTA: El R cuadrado o coeficiente de determinación es una medida utilizada para explicar cuánta variabilidad de un factor puede ser causada por su relación con otro factor relacionado. Esta correlación, conocida como "bondad de ajuste", se representa como un valor entre 0,0 y 1,0. Un valor de 1,0 indica un ajuste perfecto y, por tanto, un modelo muy fiable para las previsiones futuras, mientras que un valor de 0,0 indicaría que el cálculo no logra modelar los datos con precisión en absoluto. Pero un valor de 0,20, por ejemplo, sugiere que el 20% de la variable dependiente es predicha por la variable independiente, mientras que un valor de 0,50 sugiere que el 50% de la variable dependiente es predicha por la variable independiente, y así sucesivamente

# Veámoslo con un gráfico de fluctuación
vistazo %>%
  ggplot(aes(continente, r.squared)) + # variable categórica
  geom_jitter(width = 0.5)

# Los peores modelos están en África
mal_ajuste <- filter(vistazo, r.squared < 0.25)

paises %>%
  semi_join(mal_ajuste, by = "pais") %>%
  ggplot(aes(anio, esperanza_de_vida, colour = pais)) +
  geom_line()

# Dos efectos signicativos que influyen son la epidemia de VIH/SIDA en el continente y el genocidio de Ruanda de 1994 hacia les tutsis
# https://www.cipdh.gob.ar/a-28-anos-del-mayor-genocidio-en-africa-el-genocidio-de-ruanda-de-1994/

