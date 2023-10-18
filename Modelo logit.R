# Librerias
library(haven) # Importar datos .sav, .dta
library(dplyr) # Nos permite usar pipes %>%
library(ggplot2) # Visualizacion
library(epiDisplay) # Permite usar tab1
library(caret) # Herramientas de Data science

# Cargar datos
data <- read_sav("C:/Users/Jose/Downloads/Casen 2017.sav")

# ¿Qué factores se relacionan con la pobreza multidimensional?

# Seleccionar variables
data <- data %>%
  dplyr::select(pobreza_multi_5d, esc,s5,s13,zona,pco1,sexo,edad) %>%
  filter(pco1 == 1) # FILTRAR POR JEFE(A) DE HOGAR

# Revisar clase de las variables
str(data)
# ANALISIS DESCRIPTIVO
tab1(data$pobreza_multi_5d) # El 18.3% es pobre
summary(data$esc) # Escolaridad en anios
summary(data$s5) # Edad cuando tuvo el primer hijo, 99 es NA
tab1(data$s13) # Estado de salud ordinal, 9 es NA
tab1(data$zona) # 1 zona urbana, 2 rural
tab1(data$sexo) # 1 hombre, 2 mujer
summary(data$edad) # Edad de la persona entrevistada

# EJERCICIO
# Realizar una inspeccion visual de las variables cuantitativas y ordinales



# ADMINISTRACION DE DATOS
data <- data %>%
  mutate(s5 = na_if(s5,99),
         s13 = na_if(s13,9),
         edad2 = edad^2)

# BIVARIADO
data %>%
  filter(!is.na(pobreza_multi_5d)) %>%
  group_by(pobreza_multi_5d) %>%
  summarise(media_esc = mean(esc, na.rm = T),
            media_edad_1h = mean(s5, na.rm = T),
            media_salud = mean(s13, na.rm = T),
            media_edad = mean(edad, na.rm = T))

# ¿POR QUE NECESITAMOS UN MODELO LOGIT?
# Vamos a ajustar un modelo de regresion lineal simple
# La variable dependiente sera la presencia o ausencia de 
# pobreza multidimensional
# esc representa la escolaridad

lm1 <- lm(pobreza_multi_5d~esc, data = data)
summary(lm1)
# vamos a guardar los coeficientes para graficar
coef <- coefficients(lm1)
intercepto <- coef[1]
pendiente <- coef[2]

ggplot(data, aes(esc,pobreza_multi_5d)) +
  geom_point() +
  geom_abline(intercept = intercepto, slope = pendiente)
# vamos a hacer zoom para que veamos lo que pasa
ggplot(data, aes(esc,pobreza_multi_5d)) +
  geom_point() +
  geom_abline(intercept = intercepto, slope = pendiente)+
  xlim(-5,20) +
  ylim(-0.5,1.2)
# Aqui vemos dos problemas
# El modelo predice valores negativos de pobreza multidimensional
# Eso es claramente imposible

# La solucion es hacer un modelo lineal generalizado
# Podemos hacer un modelo de regresion lineal generalizado
glm(pobreza_multi_5d~esc, data = data, family=gaussian)
# Esto es exactamente lo mismo que arriba
# Family nos sirve para especificar la distribucion de la
# variable dependiente.
# Es estrictamente necesario

# MODELO LOGIT
m1 <- glm(pobreza_multi_5d~esc, data = data, family = binomial)
summary(m1)
confint(m1) # INTERVALOS DE CONFIANZA
# INTERPRETAR EL LOGARITMO DE LAS ODDS ES MUY DIFICIL
# ES MEJOR EXPONENCIAR LOS COEFICIENTES
odds <- exp(coefficients(m1))
exp(confint(m1))

# Ahora vamos a visualizarlo
ggplot(data, aes(esc,pobreza_multi_5d)) +
  geom_point() +
  geom_abline(intercept = intercepto, slope = pendiente)+
  geom_smooth(method = "glm",
              se = FALSE,
              method.args = list(family = binomial))+
  xlim(-5,20) +
  ylim(-0.5,1.2)
# Notemos que la linea de prediccion del glm es curva
ggplot(data, aes(esc,pobreza_multi_5d)) +
  geom_point() +
  geom_abline(intercept = intercepto, slope = pendiente)+
  geom_smooth(method = "glm",
              se = FALSE,
              method.args = list(family = binomial))+
  xlim(-20,20) +
  ylim(-0.5,1.2)

# PREDICCIONES
data <- data %>%
  mutate(pob_pred = predict(m1,data, type = "response")) %>%
  filter(!is.na(pobreza_multi_5d) & !is.na(esc)) 
ggplot(data, aes(esc,pob_pred)) +
  geom_point(data = data,
             color = "blue") 

# MATRIZ DE CONFUSION
pred_y <- ifelse(data$pob_pred > 0.5, "Pobre","No pobre")
table(pred_y)
confusionMatrix(factor(pred_y),factor(data$pobreza_multi_5d, levels = c(0,1), 
                                      labels = c("No pobre","Pobre")))

# JUGAR CON EL PUNTAJE DE CORTE
pred_y <- ifelse(data$pob_pred > X, "Pobre","No pobre")
table(pred_y)
confusionMatrix(factor(pred_y),factor(data$pobreza_multi_5d, levels = c(0,1), 
                                      labels = c("No pobre","Pobre")))

# EVALUACION DEL MODELO Y PUNTAJES DE CORTE
m2 <- glm(pobreza_multi_5d~esc+zona, data = data, family = binomial)
summary(m2)

# CRITERIOS DE INFORMACION (COMPARAR MODELOS)
AIC(m2)
BIC(m2)

# Exponenciar
odds2 <- exp(coefficients(m2))
exp(confint(m2))

prob_pob = predict(m2,data, type = "response")
pred_y = ifelse(prob_pob > 0.5, "Pobre","No pobre")
confusionMatrix(factor(pred_y),factor(data$pobreza_multi_5d, levels = c(0,1), 
                                      labels = c("No pobre","Pobre")))

# libreria pROC
install.packages("pROC")
library(pROC)

roc <- roc(data$pobreza_multi_5d, prob_pob)
plot(roc)
auc(roc)

corte <- as.data.frame(coords(roc,transpose = FALSE))
head(corte,40)

curva <- plot.roc(data$pobreza_multi_5d,prob_pob, 
                  percent = TRUE, ci = TRUE, print.auc = TRUE,
                  of = "thresholds", thresholds = "best", print.thres = "best")
# PODEMOS VER QUE EL MEJOR PUNTO DE CORTE ES 0.2
pred_y = ifelse(prob_pob > 0.2, "Pobre","No pobre")
confusionMatrix(factor(pred_y),factor(data$pobreza_multi_5d, levels = c(0,1), 
                                      labels = c("No pobre","Pobre")))

# EJERCICIO
# AJUSTAR SU PROPIO MODELO DE REGRESION LOGISTICA
# EVALUAR LA BONDAD DE AJUSTE DEL MODELO
# COMPARAR EL MODELO AJUSTADO VS EL MODELO CON EDAD UTILIZANDO CRITERIOS DE INFORMACION
# REALIZAR UNA MATRIZ DE CONFUSION PARA VER LA CAPACIDAD PREDICTIVA DEL MODELO
# ENCONTRAR EL PUNTAJE DE CORTE EN LA CURVA ROC
# ¿ES UN BUEN MODELO PREDICTIVO?
