#####################
# TEST DE HIPÓTESIS #
#####################

# CARGAR LIBRERIAS E IMPORTAR DATOS
library(haven) # NOS PERMITE IMPORTAR DATOS EN DTA,SAV
library(dplyr) # NOS PERMITE MANIPULAR DATOS

data <- read_sav("path/BBDD Respuesta - Encuesta Jóvenes.sav")
# VAMOS A TRABAJAR CON DATOS DE LA DECIMA ENCUESTA NACIONAL DE LA JUVENTUD
# QUE REPRESENTA A LA POBLACIÓN JOVEN DE CHILE ENTRE 15 Y 29 AÑOS.
# SELECCIONAMOS LAS VARIABLES QUE VAMOS A USAR
data2 <- data %>% 
  select(P76_4, EDAD, P81, P76_3, P9, P99_1, P76_5,P26, P76_1)
View(data2)

################
# CHI-CUADRADO #
################

# ESTE TEST SIRVE PARA EVALUAR LA RELACION ENTRE DOS VARIABLES CUALITATIVAS
# H0 ES QUE AMBAS VARIABLES SON INDEPENDIENTES(O QUE UNA NO DEPENDE DE LA OTRA)
# H1 ES QUE EXISTE UNA RELACION ENTRE AMBAS VARIABLES
# CUALI+CUALI

# SE RELACIONA EL CONSUMO DE ALCOHOL CON LA PREFERENCIA DE UN SECTOR POLITICO?
table(data2$P76_1, data2$P26) # NOTEMOS QUE HAY 98 Y 99
# ESO SIGNIFICA QUE HAY GENTE QUE NO SABE O NO RESPONDE
# ES IMPORTAR LIMPIAR LA BASE DE DATOS ANTES DE NUESTRO ANALISIS
# PARA ESO, USAREMOS na_if()

data2 <- data2 %>% 
  mutate(P26 = na_if(P26, 98),
         P26 = na_if(P26, 99),
         P76_1 = na_if(P76_1, 99))
# LE ESTOY DICIENDO A R QUE INTERPRETE UN 99 COMO SI FUERA UNA CASILLA VACIA

table(data2$P76_1, data2$P26) # SOLUCIONADO
# ME CUESTA MUCHO INTERPRETAR LOS NUMEROS
# VAMOS A PONERLE LAS CATEGORIAS QUE CORRESPONDEN

data2 <- data2 %>% 
  mutate(sector_pol = factor(P26, levels=c(1:6), labels = c("Derecha","Centro Derecha","Centro","Centro izquierda","Izquierda","Ninguna")),
         Alcohol = factor(P76_1, levels = c(1:2), labels = c("Si","No")))
table(data2$Alcohol, data2$sector_pol)
# AUN ES DIFICIL DE INTERPRETAR
# VAMOS A RECODIFICAR LA VARIABLE EN DERECHA, CENTRO, IZQUIERDA Y NINGUNO

data2 <- data2 %>% 
  mutate(sector_pol = case_when(sector_pol == "Derecha" | sector_pol == "Centro Derecha" ~ "Derecha",
                                sector_pol == "Centro izquierda" | sector_pol == "Izquierda" ~ "Izquierda",
                                TRUE ~ sector_pol))
table(data2$sector_pol,data2$Alcohol)

# AHORA HACEMOS EL CHI-CUADRADO
chisq.test(data2$Alcohol, data2$sector_pol)
# P VALOR ES MENOR A ALFA, RECHAZO H0
# LAS VARIABLES ESTAN RELACIONADAS

#############################################
# PRUEBA T PARA DOS MUESTRAS INDEPENDIENTES #
#############################################

# SIRVE PARA COMPARAR EL PROMEDIO DE UNA VARIABLE ENTRE DOS GRUPOS.
# EL PROMEDIO DE EDAD DE INICIO DE LA ACTIVIDAD SEXUAL ES MAYOR EN PERSONAS QUE CONSUMEN 
# COCAINA ES MENOR EN COMPARACION A QUIENES NO CONSUMEN

summary(data2$P81)
table(data2$P81) # HAY 99 Y 69
table(data2$P76_4) # HAY 99
# LIMPIAR LA VARIABLE

data2 <- data2 %>% 
  mutate(P81 = na_if(P81, 99),
         P81 = na_if(P81, 69), 
         P76_4 = na_if(P76_4, 99))
summary(data2$P81)
table(data2$P76_4) 
# HACEMOS UN ANALISIS BIVARIADO
data2 %>% 
  filter(!is.na(P76_4)) %>% 
  group_by(P76_4) %>% 
  summarise(media = mean(P81, na.rm = T),
            sd = sd(P81, na.rm = T))

# INTERPRETAR
# ES ESTADISTICAMENTE SIGNIFICATIVA ESTA DIFERENCIA?
# LA PRUEBA T RESPONDE A ESA PREGUNTA
#H0: LAS MEDIAS DE AMBOS GRUPOS SON IGUALES
# ES DECIR, EL PROMEDIO DE EDAD DE INICIO DE LA ACT SEX ES IGUAL ENTRE PERSONAS QUE CONSUMEN COCAINA Y LAS QUE NO
# H1: EXISTE UNA DIFERENCIA ENTRE LAS MEDIAS DE AMBOS GRUPOS
var.test(data2$P81~data2$P76_4) # VARIANZAS IGUALES
t.test(data2$P81~data2$P76_4, var.equal = T) 
# P VALOR ES MENOR A ALFA
# EL INTERVALO NO PASA POR 0

#############
# EJERCICIO #
#############

# RESPONDER A NIVEL DESCRIPTIVO Y A TRAVES DE TEST DE HIPOTESIS
# LA EDAD PROMEDIO DE PERSONAS QUE HAN CONSUMIDO MARIHUANA DURANTE LOS ULTIMOS DOCE MESES
# ES MAYOR EN COMPARACION A PERSONAS QUE NO CONSUMEN
# RECORDATORIO: LIMPIAR LOS DATOS DE SER NECESARIO


#########
# ANOVA #               
#########

# NOS SIRVE CUANDO QUEREMOS COMPARAR LAS MEDIAS DE MAS DE DOS GRUPOS
# EJEMPLO: LA GENTE QUE SE IDENTIFICA CON LA DERECHA, TIENE UNA MAYOR EDAD PROMEDIO?
# H0: LAS MEDIAS DE TODOS LOS GRUPOS SON IGUALES
# H1: HAY AL MENOS UN PAR DE MEDIAS SIGNIFICATIVAMENTE DISTINTAS
data2 %>% 
  filter(!is.na(sector_pol)) %>% 
  group_by(sector_pol) %>% 
  summarise(media = mean(EDAD))
# SE VEN BASTANTE PARECIDOS

anova <- aov(data2$EDAD~data2$sector_pol)
summary(anova) 
TukeyHSD(anova) # COMPARACIONES MULTIPLES
# CUANDO LOS IC NO PASAN POR 0, LA DIFERENCIA ES ESTADISTICAMENTE SIGNIFICATIVA
# HAY QUE USARLO CON CAUTELA, NO ES UNA PANACEA
# TIENE MUCHAS LIMITACIONES




