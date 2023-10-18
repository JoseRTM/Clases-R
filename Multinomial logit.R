# LOGIT MULTINOMIAL
library(haven) # Importar datos .sav, .dta
library(dplyr) # Nos permite usar pipes %>%
library(ggplot2) # Visualizacion
library(nnet) # Permite usar multinom
library(epiDisplay)

# CARGAR DATOS DE INJUV


# SELECCIONAR LAS VARIABLES: EDAD,SEXO,NSE,P42 Y P107

# EJERCICIOS
# 1) REALIZAR ANALISIS DESCRIPTIVO DE TODAS LAS VARIABLES
# 2) RECODIFICAR P42 EN DERECHA, CENTRO, IZQUIERDA Y NINGUNA -> NOMBRAR COMO "id_politica"
# 3) ASIGNAR COMO NA 99 Y 98
# NOTA: DEBERAN TRANSFORMAR P42 A NUMERICA PARA RECODIFICAR


# ASIGNAR CATEGORIA DE REFERENCIA
data$id_politica <- relevel(data$id_politica, ref = "Ninguna")
m1 <- multinom(id_politica ~ EDAD, data = data)
summary(m1)

# ES NECESARIO CALCULAR A MANO EL ESTADISTICO DE PRUEBA
z <- summary(m1)$coefficients/summary(m1)$standard.errors
z

# CALCULAMOS EL P VALOR
p <- (1 - pnorm(abs(z), 0, 1)) * 2
round(p,4)
# PODEMOS VER QUE LA EDAD ES SIGNIFICATIVA

#INTERVALOS DE CONFIANZA DE LOG(ODDS)
ls <- summary(m1)$coefficients[,"EDAD"]+(qnorm(1-0.05/2)*summary(m1)$standard.errors[,"EDAD"])
li <- summary(m1)$coefficients[,"EDAD"]-(qnorm(1-0.05/2)*summary(m1)$standard.errors[,"EDAD"])

cbind(li,ls)

# EJERCICIO
# CONSTRUIR INTERVALOS DE CONFIANZA PARA LAS ODDS


# EJERCICIO FINAL
# AJUSTAR UN MODELO MULTINOMIAL CON TODAS LAS VARIABLES SELECCIONADAS
# CALCULAR EL ESTADISTICO DE PRUEBA
# CALCULAR EL P VALOR
# CONSTRUIR INTERVALOS DE CONFIANZA
# INTERPRETAR
