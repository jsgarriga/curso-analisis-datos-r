
# Creamos un objeto que almacena la raíz cuadrada de 16
raiz_numero = sqrt(16)

# Muestro el resultado de este objeto
raiz_numero

# Creamos un objeto llamado "a" cuyo valor es 5
a = 5

# Suma de los elementos 2 y 4
sum(2,4)

# Abrir archivo de datos
datos <- read.csv("C:/OD/OneDrive - alumnos.frm.utn.edu.ar/0 1 trabajo y proyectos/2023/educacionIT/curso-analisis-datos-r/Clase 1-ADR-23-08-2023/Modulo 1/Ejemplo_datos.csv", sep=";")

# Abrimos los datos
view(datos)


# Usamos una ruta relativa
datos1 <- read.csv("Ejemplo_datos.csv", sep=";")

view(datos1)
