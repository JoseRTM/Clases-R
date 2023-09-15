# MANIPULACION DE DATOS

# LIBRERIAS A UTILIZAR (instalar y/o activar)
# tidyverse
# stringr
# dplyr
# haven

data <- readRDS(url("https://github.com/JoseRTM/Clases-R/raw/main/jovenes.rds"))

#######################
# ETIQUETAR VARIABLES #
#######################

table(data$SEXO)
# LA VARIABLE SEXO ESTA CODIFICADA COMO 1 Y 2, PERO SABEMOS QUE 1 ES HOMBRE Y 2 MUJER.
# ES IMPORTANTE DEFINIR LAS CATEGORIAS PARA EVITAR CONFUSIONES

data <- data %>% 
  mutate(SEXO = factor(SEXO, levels = c(1,2), labels = c("Hombre", "Mujer")))

# LA FUNCION FACTOR CONSIDERA TRES ARGUMENTOS:
# 1) LA VARIABLE QUE SE DESEA TRANSFORMAR
# 2) LOS NIVELES QUE TIENE LA VARIABLE
# 3) LAS ETIQUETAS PARA CADA NIVEL

table(data$SEXO)

# EJERCICIO 1
# Crear la variable rango_etario con los puntos de corte que usted elija
# asignar etiquetas a cada intervalo de edad usando la función factor.



###############################
# TRANSFORMACIÓN DE VARIABLES #
###############################

# SE PUEDE TRANSFORMAR LA NATURALEZA DE LAS VARIABLES
class(data$EDAD) # EDAD ES NUMERICA

# LA TRANSFORMAMOS A CHARACTER USANDO as.character()
data <- data %>% 
  mutate(EDAD = as.character(EDAD))

# YA NO ES NUMERICA
class(data$EDAD)
# OBVIAMENTE ESTO NO NOS SIRVE, PERO AHORA SE PUEDE APRECIAR POR QUÉ ES IMPORTANTE
# REVISAR QUE LAS VARIABLES TENGAN LA CLASE CORRECTA.
mean(data$EDAD, na.rm = T) # R NO PERMITE CALCULAR NADA A LAS VARIBLES CHARACTER
# SIEMPRE HAY QUE ASEGURAR DE QUE SEAN NUMERICAS
# UTILIZAMOS LA FUNCION as.numeric() para transformarla a numerica
data <- data %>% 
  mutate(EDAD = as.numeric(EDAD))

class(data$EDAD) # VUELVE A SER NUMERIC

# AHORA SI FUNCIONA
mean(data$EDAD, na.rm = T)

# EJERCICIO 2
# R RECONOCE A LA VARIABLE FECHA COMO UN CHARACTER, SIN EMBARGO, DEBERIA SER UNA FECHA
# BUSCAR COMO TRANSFORMARLA A FECHA Y APLICARLO
# COMPROBAR CON LA FUNCION class()


###########
## JOINS ##
###########
data1 <- data.frame(ID = 1:2,                      
                    X1 = c("a1", "a2"),
                    stringsAsFactors = FALSE)
data2 <- data.frame(ID = 2:3,                      
                    X2 = c("b1", "b2"),
                    stringsAsFactors = FALSE)
##############
# inner_join #
##############

# SIRVE PARA FUSIONAR DOS CONJUNTOS DE DATOS QUE COMPARTEN UNA CARACTERISTICA EN COMUN
# A VECES LA INFORMACION QUE NECESITAMOS PUEDE VENIR DE TABLAS SEPARADAS
# EN ESTE CASO, TENEMOS INFORMACION DE TRES SUJETOS EN DOS BASES DISTINTAS
# INNER JOIN MANTIENE SOLO LA INFORMACION QUE SE ENCUENTRA PRESENTE EN AMBAS TABLAS
inner_join(data1, data2, by = "ID")
# ID 2 se encuentra en data 1 y data 2.

##############
# left_join  #
##############

# left_join mantiene la informacion completa de la tabla izquierda
left_join(data1, data2, by = "ID")
# como no hay informacion de X2 en la tabla derecha, se genera un NA

##############
# right_join #
##############

# right_join mantiene la informacion completa de la tabla derecha
right_join(data1, data2, by = "ID")
# como no hay informacion de X1 para el individuo 3, se genera NA

##############
# full_join  #
##############

# full_join mantiene la informacion de ambas tablas
full_join(data1, data2, by = "ID")

##############
# semi_join  #
##############

# semi_join es un join para filtrar información
# mantiene la información de la primera tabla cuando hay un id en la segunda tabla

semi_join(data1, data2, by = "ID")
# El único ID que está presenta en ambas tablas es el 2, por lo tanto,
# se mantiene la info de la primera tabla solo para id 2.

##############
# anti_join  #
##############

# anti_join hace lo contrario a semi_join. Mantiene la informacion
# de la primera tabla que no tiene ningun match con la segunda tabla.
anti_join(data1, data2, by = "ID")

# EJERCICIO 3
# utilizar inner_join, right_join, left_join y full_join
# con las tres bases de datos. Generar una sola base de datos 
# con las tres.

data(band_members)
data("band_instruments")
data("band_instruments2")
# ¿cuál es el mejor join para este problema?

#######################
# ANALISIS DE STRINGS #
#######################

letra <- readLines("https://github.com/JoseRTM/Clases-R/raw/main/bailando.txt")

palabras <- str_split(letra, "\\s+")
palabras <- unlist(palabras)

conteo <- table(palabras)

# Convertir la tabla en un data frame para ggplot2
conteo_palabras <- as.data.frame(conteo)
colnames(conteo_palabras) <- c("word", "freq")

# Ordenar el data frame por frecuencia
conteo_palabras <- conteo_palabras %>% 
  arrange(-freq)

# Graficar usando ggplot2
ggplot(conteo_palabras[1:10, ], aes(x = reorder(word, -freq), y = freq)) +
  geom_bar(stat = "identity") +
  xlab("Palabras") +
  ylab("Frecuencia") +
  ggtitle("Las 10 palabras más comunes en la letra") +
  coord_flip()

# Son puras palabras vacías, vamos a filtrar un poco
stop_words <- c("","no","el", "la", "los", "las", "un", "una", "unos", "unas", 
                "de", "a", "en", "y", "o", "con", "por", "para", "que", "como", "Y",
                "se","En","mi","le","me","te","lo","estaba")
# Filtrar las palabras para eliminar las palabras vacías
palabras_filtradas <- palabras[!(palabras %in% stop_words)]
# Contar la frecuencia de cada palabra
conteo_filtrado <- table(palabras_filtradas)

# Convertir la tabla en un data frame para ggplot2
conteo_filtrado <- as.data.frame(conteo_filtrado)
colnames(conteo_filtrado) <- c("word", "freq")

# Ordenar el data frame por frecuencia
conteo_filtrado <- conteo_filtrado %>% 
  arrange(-freq)

# Graficar usando ggplot2
ggplot(conteo_filtrado[1:10, ], aes(x = reorder(word, -freq), y = freq)) +
  geom_bar(stat = "identity") +
  xlab("Palabras") +
  ylab("Frecuencia") +
  ggtitle("Las 10 palabras más comunes en la letra (sin palabras vacías)") +
  coord_flip()

# EJERCICIO 4
# IMPORTAR LA LETRA DE UNA CANCION Y ANALIZARLA

