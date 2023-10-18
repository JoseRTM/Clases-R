# CARGAR LIBRERIAS  
library(dplyr)
library(haven)
library(epiDisplay)
library(ggplot2)
data <- read_sav("C:/Users/Jose/Downloads/BBDD JÓVENES 2018.sav")

# SELECCIONAR VARIABLES DE INTERES
data_red <- data %>%
  dplyr::select(P121,P112_1,P120,SEXO)

# ANALISIS DESCRIPTIVO
data_red %>%
  summarise(media_parejas = mean(P121, na.rm = T),
            sd_parejas = sd(P121, na.rm = T),
            media_edadin = mean(P120),
            sd_edadin = sd(P120))

# ¿Encuentran que hay algo raro?
# No es posible que la edad de inicio sea 42 en una muestra de 15 a 29
summary(data_red$P120) # el maximo es 99, puede ser un NS/NR
data_red <- data_red %>%
  mutate(P120 = na_if(P120,99))
summary(data_red$P120) # Ahora tiene mas sentido

# CONSUMO DE ALCOHOL
tab1(data_red$P112_1) # Tambien hay NS/NR
data_red <- data_red %>%
  mutate(P112_1 = na_if(P112_1, 99),
         P112_1 = ifelse(P112_1 == 2, 0,1))
tab1(data_red$P112_1) 

# ANALISIS BIVARIADO
data_red %>%
  filter(!is.na(P121), !is.na(P112_1)) %>%
  group_by(P112_1) %>%
  summarise(media_parejas = mean(P121),
            sd_parejas = sd(P121))
t.test(data_red$P121~data_red$P112_1)

ggplot(data_red, aes(x = P120,  y = P121)) +
  geom_point() +
  geom_smooth(method = "lm")
cor.test(data_red$P121,data_red$P120)

# MODELO DE POISSON
data_red <- na.omit(data_red)
mpois <- glm(data_red$P121~data_red$P112_1+data_red$P120+SEXO, data = data_red, family="poisson")
summary(mpois)
coef_pois <- coefficients(mpois)
exp(coef_pois)
exp(confint(mpois))

# TEST DE BONDAD DE AJUSTE (DEVIANCE)
with(mpois, cbind(res.deviance = deviance, df = df.residual,
               p = pchisq(deviance, df.residual, lower.tail=FALSE)))
# H0: EL MODELO AJUSTA BIEN A DATOS DE TIPO POISSON

# COMPARACION DE MODELOS
mpois2 <-glm(data_red$P121~data_red$P112_1+P120, data = data_red, family="poisson")

anova(mpois2, mpois, test="Chisq")

# EJERCICIO:
# USAR UNA BASE DE DATOS LIBRE
# SELECCIONAR UNA VARIABLE DEPENDIENTE DE CONTEO
# SELECCIONAR UNA VARIABLE INDEPENDIENTE CUANTITATIVA
# SELECCIONAR UNA VARIABLE INDEPENDIENTE CUALITATIVA
# ¡INTERPRETAR!

