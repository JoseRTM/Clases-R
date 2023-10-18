# MANIPULACION DE DATOS

# LIBRERIAS A UTILIZAR (instalar y/o activar)
# tidyverse
# stringr
# dplyr


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

